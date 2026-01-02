LOVELY_INTEGRITY = '45da645bc5d808a6a52efdc42350cd46cc5d707c4806fb8c86333fe4b5adcf3a'

--- STEAMODDED CORE
--- MODULE STACKTRACE
-- NOTE: This is a modifed version of https://github.com/ignacio/StackTracePlus/blob/master/src/StackTracePlus.lua
-- Licensed under the MIT License. See https://github.com/ignacio/StackTracePlus/blob/master/LICENSE
-- The MIT License
-- Copyright (c) 2010 Ignacio Burgueño
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
-- tables
function loadStackTracePlus()
    local _G = _G
    local string, io, debug, coroutine = string, io, debug, coroutine

    -- functions
    local tostring, print, require = tostring, print, require
    local next, assert = next, assert
    local pcall, type, pairs, ipairs = pcall, type, pairs, ipairs
    local error = error

    assert(debug, "Internal: Debug table must be available at this point")

    local io_open = io.open
    local string_gmatch = string.gmatch
    local string_sub = string.sub
    local table_concat = table.concat

    local _M = {
        max_tb_output_len = 140 -- controls the maximum length of the 'stringified' table before cutting with ' (more...)'
    }

    -- this tables should be weak so the elements in them won't become uncollectable
    local m_known_tables = {
        [_G] = "_G (global table)"
    }
    local function add_known_module(name, desc)
        local ok, mod = pcall(require, name)
        if ok then
            m_known_tables[mod] = desc
        end
    end

    add_known_module("string", "string module")
    add_known_module("io", "io module")
    add_known_module("os", "os module")
    add_known_module("table", "table module")
    add_known_module("math", "math module")
    add_known_module("package", "package module")
    add_known_module("debug", "debug module")
    add_known_module("coroutine", "coroutine module")

    -- lua5.2
    add_known_module("bit32", "bit32 module")
    -- luajit
    add_known_module("bit", "bit module")
    add_known_module("jit", "jit module")
    -- lua5.3
    if _VERSION >= "Lua 5.3" then
        add_known_module("utf8", "utf8 module")
    end

    local m_user_known_tables = {}

    local m_known_functions = {}
    for _, name in ipairs { -- Lua 5.2, 5.1
    "assert", "collectgarbage", "dofile", "error", "getmetatable", "ipairs", "load", "loadfile", "next", "pairs",
    "pcall", "print", "rawequal", "rawget", "rawlen", "rawset", "require", "select", "setmetatable", "tonumber",
    "tostring", "type", "xpcall", -- Lua 5.1
    "gcinfo", "getfenv", "loadstring", "module", "newproxy", "setfenv", "unpack" -- TODO: add table.* etc functions
    } do
        if _G[name] then
            m_known_functions[_G[name]] = name
        end
    end

    local m_user_known_functions = {}

    local function safe_tostring(value)
        local ok, err = pcall(tostring, value)
        if ok then
            return err
        else
            return ("<failed to get printable value>: '%s'"):format(err)
        end
    end

    -- Private:
    -- Parses a line, looking for possible function definitions (in a very naïve way)
    -- Returns '(anonymous)' if no function name was found in the line
    local function ParseLine(line)
        assert(type(line) == "string", ("Internal: line \"%s\" is type \"%s\", should be a string"):format(tostring(line), type(line)))
        -- print(line)
        local match = line:match("^%s*function%s+(%w+)")
        if match then
            -- print("+++++++++++++function", match)
            return match
        end
        match = line:match("^%s*local%s+function%s+(%w+)")
        if match then
            -- print("++++++++++++local", match)
            return match
        end
        match = line:match("^%s*local%s+(%w+)%s+=%s+function")
        if match then
            -- print("++++++++++++local func", match)
            return match
        end
        match = line:match("%s*function%s*%(") -- this is an anonymous function
        if match then
            -- print("+++++++++++++function2", match)
            return "(anonymous)"
        end
        return "(anonymous)"
    end

    -- Private:
    -- Tries to guess a function's name when the debug info structure does not have it.
    -- It parses either the file or the string where the function is defined.
    -- Returns '?' if the line where the function is defined is not found
    local function GuessFunctionName(info)
        -- print("guessing function name")
        if type(info.source) == "string" and info.source:sub(1, 1) == "@" then
            local file, err = io_open(info.source:sub(2), "r")
            if not file then
                print("file not found: " .. tostring(err)) -- whoops!
                return "?"
            end
            local line
            for _ = 1, info.linedefined do
                line = file:read("*l")
            end
            if not line then
                print("line not found") -- whoops!
                return "?"
            end
            return ParseLine(line)
        elseif type(info.source) == "string" and info.source:sub(1, 6) == "=[love" then
            return "(LÖVE Function)"
        else
            local line
            local lineNumber = 0
            for l in string_gmatch(info.source, "([^\n]+)\n-") do
                lineNumber = lineNumber + 1
                if lineNumber == info.linedefined then
                    line = l
                    break
                end
            end
            if not line then
                print("line not found") -- whoops!
                return "?"
            end
            return ParseLine(line)
        end
    end

    ---
    -- Dumper instances are used to analyze stacks and collect its information.
    --
    local Dumper = {}

    Dumper.new = function(thread)
        local t = {
            lines = {}
        }
        for k, v in pairs(Dumper) do
            t[k] = v
        end

        t.dumping_same_thread = (thread == coroutine.running())

        -- if a thread was supplied, bind it to debug.info and debug.get
        -- we also need to skip this additional level we are introducing in the callstack (only if we are running
        -- in the same thread we're inspecting)
        if type(thread) == "thread" then
            t.getinfo = function(level, what)
                if t.dumping_same_thread and type(level) == "number" then
                    level = level + 1
                end
                return debug.getinfo(thread, level, what)
            end
            t.getlocal = function(level, loc)
                if t.dumping_same_thread then
                    level = level + 1
                end
                return debug.getlocal(thread, level, loc)
            end
        else
            t.getinfo = debug.getinfo
            t.getlocal = debug.getlocal
        end

        return t
    end

    -- helpers for collecting strings to be used when assembling the final trace
    function Dumper:add(text)
        self.lines[#self.lines + 1] = text
    end
    function Dumper:add_f(fmt, ...)
        self:add(fmt:format(...))
    end
    function Dumper:concat_lines()
        return table_concat(self.lines)
    end

    ---
    -- Private:
    -- Iterates over the local variables of a given function.
    --
    -- @param level The stack level where the function is.
    --
    function Dumper:DumpLocals(level)
        local prefix = "\t "
        local i = 1

        if self.dumping_same_thread then
            level = level + 1
        end

        local name, value = self.getlocal(level, i)
        if not name then
            return
        end
        self:add("\tLocal variables:\r\n")
        while name do
            if type(value) == "number" then
                self:add_f("%s%s = number: %g\r\n", prefix, name, value)
            elseif type(value) == "boolean" then
                self:add_f("%s%s = boolean: %s\r\n", prefix, name, tostring(value))
            elseif type(value) == "string" then
                self:add_f("%s%s = string: %q\r\n", prefix, name, value)
            elseif type(value) == "userdata" then
                self:add_f("%s%s = %s\r\n", prefix, name, safe_tostring(value))
            elseif type(value) == "nil" then
                self:add_f("%s%s = nil\r\n", prefix, name)
            elseif type(value) == "table" then
                if m_known_tables[value] then
                    self:add_f("%s%s = %s\r\n", prefix, name, m_known_tables[value])
                elseif m_user_known_tables[value] then
                    self:add_f("%s%s = %s\r\n", prefix, name, m_user_known_tables[value])
                else
                    local txt = "{"
                    for k, v in pairs(value) do
                        txt = txt .. safe_tostring(k) .. ":" .. safe_tostring(v)
                        if #txt > _M.max_tb_output_len then
                            txt = txt .. " (more...)"
                            break
                        end
                        if next(value, k) then
                            txt = txt .. ", "
                        end
                    end
                    self:add_f("%s%s = %s  %s\r\n", prefix, name, safe_tostring(value), txt .. "}")
                end
            elseif type(value) == "function" then
                local info = self.getinfo(value, "nS")
                local fun_name = info.name or m_known_functions[value] or m_user_known_functions[value]
                if info.what == "C" then
                    self:add_f("%s%s = C %s\r\n", prefix, name,
                        (fun_name and ("function: " .. fun_name) or tostring(value)))
                else
                    local source = info.short_src
                    if source:sub(2, 7) == "string" then
                        source = source:sub(9) -- uno más, por el espacio que viene (string "Baragent.Main", por ejemplo)
                    end
                    -- for k,v in pairs(info) do print(k,v) end
                    fun_name = fun_name or GuessFunctionName(info)
                    self:add_f("%s%s = Lua function '%s' (defined at line %d of chunk %s)\r\n", prefix, name, fun_name,
                        info.linedefined, source)
                end
            elseif type(value) == "thread" then
                self:add_f("%sthread %q = %s\r\n", prefix, name, tostring(value))
            end
            i = i + 1
            name, value = self.getlocal(level, i)
        end
    end

    ---
    -- Public:
    -- Collects a detailed stack trace, dumping locals, resolving function names when they're not available, etc.
    -- This function is suitable to be used as an error handler with pcall or xpcall
    --
    -- @param thread An optional thread whose stack is to be inspected (defaul is the current thread)
    -- @param message An optional error string or object.
    -- @param level An optional number telling at which level to start the traceback (default is 1)
    --
    -- Returns a string with the stack trace and a string with the original error.
    --
    function _M.stacktrace(thread, message, level)
        if type(thread) ~= "thread" then
            -- shift parameters left
            thread, message, level = nil, thread, message
        end

        thread = thread or coroutine.running()

        level = level or 1

        local dumper = Dumper.new(thread)

        local original_error

        if type(message) == "table" then
            dumper:add("an error object {\r\n")
            local first = true
            for k, v in pairs(message) do
                if first then
                    dumper:add("  ")
                    first = false
                else
                    dumper:add(",\r\n  ")
                end
                dumper:add(safe_tostring(k))
                dumper:add(": ")
                dumper:add(safe_tostring(v))
            end
            dumper:add("\r\n}")
            original_error = dumper:concat_lines()
        elseif type(message) == "string" then
            dumper:add(message)
            original_error = message
        end

        dumper:add("\r\n")
        dumper:add [[
Stack Traceback
===============
]]
        -- print(error_message)

        local level_to_show = level
        if dumper.dumping_same_thread then
            level = level + 1
        end

        local info = dumper.getinfo(level, "nSlf")
        while info do
            if info.what == "main" then
                if string_sub(info.source, 1, 1) == "@" then
                    dumper:add_f("(%d) main chunk of file '%s' at line %d\r\n", level_to_show,
                        string_sub(info.source, 2), info.currentline)
                elseif info.source and info.source:sub(1, 1) == "=" then
                    local str = info.source:sub(3, -2)
                    local props = {}
                    -- Split by space
                    for v in string.gmatch(str, "[^%s]+") do
                        table.insert(props, v)
                    end
                    local source = table.remove(props, 1)
                    if source == "love" then
                        dumper:add_f("(%d) main chunk of LÖVE file '%s' at line %d\r\n", level_to_show,
                            table.concat(props, " "):sub(2, -2), info.currentline)
                    elseif source == "SMODS" then
                        local modID = table.remove(props, 1)
                        local fileName = table.concat(props, " ")
                        if modID == '_' then
                            dumper:add_f("(%d) main chunk of Steamodded file '%s' at line %d\r\n", level_to_show,
                                fileName:sub(2, -2), info.currentline)
                        else
                            dumper:add_f("(%d) main chunk of file '%s' at line %d (from mod with id %s)\r\n",
                                level_to_show, fileName:sub(2, -2), info.currentline, modID)
                        end
                    elseif source == "lovely" then
                        local module = table.remove(props, 1)
                        local fileName = table.concat(props, " ")
                        dumper:add_f("(%d) main chunk of file '%s' at line %d (from lovely module %s)\r\n",
                            level_to_show, fileName:sub(2, -2), info.currentline, module)
                    else
                        dumper:add_f("(%d) main chunk of %s at line %d\r\n", level_to_show, info.source,
                            info.currentline)
                    end
                else
                    dumper:add_f("(%d) main chunk of %s at line %d\r\n", level_to_show, info.source, info.currentline)
                end
            elseif info.what == "C" then
                -- print(info.namewhat, info.name)
                -- for k,v in pairs(info) do print(k,v, type(v)) end
                local function_name = m_user_known_functions[info.func] or m_known_functions[info.func] or info.name or
                                          tostring(info.func)
                dumper:add_f("(%d) %s C function '%s'\r\n", level_to_show, info.namewhat, function_name)
                -- dumper:add_f("%s%s = C %s\r\n", prefix, name, (m_known_functions[value] and ("function: " .. m_known_functions[value]) or tostring(value)))
            elseif info.what == "tail" then
                -- print("tail")
                -- for k,v in pairs(info) do print(k,v, type(v)) end--print(info.namewhat, info.name)
                dumper:add_f("(%d) tail call\r\n", level_to_show)
                dumper:DumpLocals(level)
            elseif info.what == "Lua" then
                local source = info.short_src
                local function_name = m_user_known_functions[info.func] or m_known_functions[info.func] or info.name
                if source:sub(2, 7) == "string" then
                    source = source:sub(9)
                end
                local was_guessed = false
                if not function_name or function_name == "?" then
                    -- for k,v in pairs(info) do print(k,v, type(v)) end
                    function_name = GuessFunctionName(info)
                    was_guessed = true
                end
                -- test if we have a file name
                local function_type = (info.namewhat == "") and "function" or info.namewhat
                if info.source and info.source:sub(1, 1) == "@" then
                    dumper:add_f("(%d) Lua %s '%s' at file '%s:%d'%s\r\n", level_to_show, function_type, function_name,
                        info.source:sub(2), info.currentline, was_guessed and " (best guess)" or "")
                elseif info.source and info.source:sub(1, 1) == '#' then
                    dumper:add_f("(%d) Lua %s '%s' at template '%s:%d'%s\r\n", level_to_show, function_type,
                        function_name, info.source:sub(2), info.currentline, was_guessed and " (best guess)" or "")
                elseif info.source and info.source:sub(1, 1) == "=" then
                    local str = info.source:sub(3, -2)
                    local props = {}
                    -- Split by space
                    for v in string.gmatch(str, "[^%s]+") do
                        table.insert(props, v)
                    end
                    local source = table.remove(props, 1)
                    if source == "love" then
                        dumper:add_f("(%d) LÖVE %s at file '%s:%d'%s\r\n", level_to_show, function_type,
                            table.concat(props, " "):sub(2, -2), info.currentline, was_guessed and " (best guess)" or "")
                    elseif source == "SMODS" then
                        local modID = table.remove(props, 1)
                        local fileName = table.concat(props, " ")
                        if modID == '_' then
                            dumper:add_f("(%d) Lua %s '%s' at Steamodded file '%s:%d' %s\r\n", level_to_show,
                                function_type, function_name, fileName:sub(2, -2), info.currentline,
                                was_guessed and " (best guess)" or "")
                        else
                            dumper:add_f("(%d) Lua %s '%s' at file '%s:%d' (from mod with id %s)%s\r\n", level_to_show,
                                function_type, function_name, fileName:sub(2, -2), info.currentline, modID,
                                was_guessed and " (best guess)" or "")
                        end
                    elseif source == "lovely" then
                        local module = table.remove(props, 1)
                        local fileName = table.concat(props, " ")
                        dumper:add_f("(%d) Lua %s '%s' at file '%s:%d' (from lovely module %s)%s\r\n", level_to_show,
                            function_type, function_name, fileName:sub(2, -2), info.currentline, module,
                            was_guessed and " (best guess)" or "")
                    else
                        dumper:add_f("(%d) Lua %s '%s' at line %d of chunk '%s'\r\n", level_to_show, function_type,
                            function_name, info.currentline, source)
                    end
                else
                    dumper:add_f("(%d) Lua %s '%s' at line %d of chunk '%s'\r\n", level_to_show, function_type,
                        function_name, info.currentline, source)
                end
                dumper:DumpLocals(level)
            else
                dumper:add_f("(%d) unknown frame %s\r\n", level_to_show, info.what)
            end

            level = level + 1
            level_to_show = level_to_show + 1
            info = dumper.getinfo(level, "nSlf")
        end

        return dumper:concat_lines(), original_error
    end

    --
    -- Adds a table to the list of known tables
    function _M.add_known_table(tab, description)
        if m_known_tables[tab] then
            error("Cannot override an already known table")
        end
        m_user_known_tables[tab] = description
    end

    --
    -- Adds a function to the list of known functions
    function _M.add_known_function(fun, description)
        if m_known_functions[fun] then
            error("Cannot override an already known function")
        end
        m_user_known_functions[fun] = description
    end

    return _M
end

-- Note: The below code is not from the original StackTracePlus.lua
local stackTraceAlreadyInjected = false

function getDebugInfoForCrash()
    local version = VERSION
    if not version or type(version) ~= "string" then
        local versionFile = love.filesystem.read("version.jkr")
        if versionFile then
            version = versionFile:match("[^\n]*") .. " (best guess)"
        else
            version = "???"
        end
    end
    local modded_version = MODDED_VERSION
    if not modded_version or type(modded_version) ~= "string" then
        local moddedSuccess, reqVersion = pcall(require, "SMODS.version")
        if moddedSuccess and type(reqVersion) == "string" then
            modded_version = reqVersion
        else
            modded_version = "???"
        end
    end

    local info = "Additional Context:\nBalatro Version: " .. version .. "\nModded Version: " ..
                     (modded_version)
    local major, minor, revision, codename = love.getVersion()
    info = info .. string.format("\nLÖVE Version: %d.%d.%d", major, minor, revision)
    local lovely_success, lovely = pcall(require, "lovely")
    if lovely_success then
        info = info .. "\nLovely Version: " .. lovely.version
    end
	info = info .. "\nPlatform: " .. (love.system.getOS() or "???")
    if SMODS and SMODS.Mods then
        local mod_strings = ""
        local lovely_strings = ""
        local i = 1
        local lovely_i = 1
        for _, v in pairs(SMODS.Mods) do
            if (v.can_load and (not v.meta_mod or v.lovely_only)) or (v.lovely and not v.can_load and not v.disabled) then
                if v.lovely_only or (v.lovely and not v.can_load) then
                    lovely_strings = lovely_strings .. "\n    " .. lovely_i .. ": " .. v.name
                    lovely_i = lovely_i + 1
                    if not v.can_load then
                        lovely_strings = lovely_strings .. "\n        Has Steamodded mod that failed to load."
                        if #v.load_issues.dependencies > 0 then
                            lovely_strings = lovely_strings .. "\n        Missing Dependencies:"
                            for k, v in ipairs(v.load_issues.dependencies) do
                                lovely_strings = lovely_strings .. "\n            " .. k .. ". " .. v
                            end
                        end
                        if #v.load_issues.conflicts > 0 then
                            lovely_strings = lovely_strings .. "\n        Conflicts:"
                            for k, v in ipairs(v.load_issues.conflicts) do
                                lovely_strings = lovely_strings .. "\n            " .. k .. ". " .. v
                            end
                        end
                        if v.load_issues.outdated then
                            lovely_strings = lovely_strings .. "\n        Outdated Mod."
                        end
                        if v.load_issues.main_file_not_found then
                            lovely_strings = lovely_strings .. "\n        Main file not found. (" .. v.main_file ..")"
                        end
                    end
                else
                    mod_strings = mod_strings .. "\n    " .. i .. ": " .. v.name .. " by " ..
                                      table.concat(v.author, ", ") .. " [ID: " .. v.id ..
                                      (v.priority ~= 0 and (", Priority: " .. v.priority) or "") ..
                                      (v.version and v.version ~= '0.0.0' and (", Version: " .. v.version) or "") ..
                                      (v.lovely and (", Uses Lovely") or "") .. "]"
                    i = i + 1
                    local debugInfo = v.debug_info
                    if debugInfo then
                        if type(debugInfo) == "string" then
                            if #debugInfo ~= 0 then
                                mod_strings = mod_strings .. "\n        " .. debugInfo
                            end
                        elseif type(debugInfo) == "table" then
                            for kk, vv in pairs(debugInfo) do
                                if type(vv) ~= 'nil' then
                                    vv = tostring(vv)
                                end
                                if #vv ~= 0 then
                                    mod_strings = mod_strings .. "\n        " .. kk .. ": " .. vv
                                end
                            end
                        end
                    end
                end
            end
        end
        info = info .. "\nSteamodded Mods:" .. mod_strings .. "\nLovely Mods:" .. lovely_strings
    end
    return info
end

function injectStackTrace()
    if (stackTraceAlreadyInjected) then
        return
    end
    stackTraceAlreadyInjected = true
    local STP = loadStackTracePlus()
    local utf8 = require("utf8")

    -- Modifed from https://love2d.org/wiki/love.errorhandler
    function love.errorhandler(msg)
        msg = tostring(msg)

        if not sendErrorMessage then
            function sendErrorMessage(msg)
                print(msg)
            end
        end
        if not sendInfoMessage then
            function sendInfoMessage(msg)
                print(msg)
            end
        end

        sendErrorMessage("Oops! The game crashed\n" .. STP.stacktrace(msg), 'StackTrace')

        if not love.window or not love.graphics or not love.event then
            return
        end

        if not love.graphics.isCreated() or not love.window.isOpen() then
            local success, status = pcall(love.window.setMode, 800, 600)
            if not success or not status then
                return
            end
        end

        -- Reset state.
        if love.mouse then
            love.mouse.setVisible(true)
            love.mouse.setGrabbed(false)
            love.mouse.setRelativeMode(false)
            if love.mouse.isCursorSupported() then
                love.mouse.setCursor()
            end
        end
        if love.joystick then
            -- Stop all joystick vibrations.
            for i, v in ipairs(love.joystick.getJoysticks()) do
                v:setVibration()
            end
        end
        if love.audio then
            love.audio.stop()
        end

        love.graphics.reset()
        local font = love.graphics.setNewFont("resources/fonts/m6x11plus.ttf", 20)

        local background = {0, 0, 1}
        if G and G.C and G.C.BLACK then
            background = G.C.BLACK
            if AKYRS_LOAD_FAIL then
                background = G.C.AKYRS_AIKOYORI_BG
            end
            
        end
        love.graphics.clear(background)
        love.graphics.origin()

        local trace = STP.stacktrace("", 3)

        local sanitizedmsg = {}
        for char in msg:gmatch(utf8.charpattern) do
            table.insert(sanitizedmsg, char)
        end
        sanitizedmsg = table.concat(sanitizedmsg)

        local err = {}

        table.insert(err, "Oops! The game crashed:")
        if sanitizedmsg:find("Syntax error: game.lua:4: '=' expected near 'Game'") then
            table.insert(err,
                'Duplicate installation of Steamodded detected! Please clean your installation: Steam Library > Balatro > Properties > Installed Files > Verify integrity of game files.')
        elseif sanitizedmsg:find("Syntax error: game.lua:%d+: duplicate label 'continue'") then
            table.insert(err,
                'Duplicate installation of Steamodded detected! Please remove the duplicate steamodded/smods folder in your mods folder.')
        else
            table.insert(err, sanitizedmsg)
        end
        if #sanitizedmsg ~= #msg then
            table.insert(err, "Invalid UTF-8 string in error message.")
        end

        if V and SMODS and SMODS.save_game and V(SMODS.save_game or '0.0.0') ~= V(SMODS.version or '0.0.0') then
            table.insert(err, 'This crash may be caused by continuing a run that was started on a previous version of Steamodded. Try creating a new run.')
        end

        if V and V(MODDED_VERSION or '0.0.0') ~= V(RELEASE_VERSION or '0.0.0') then
            table.insert(err, '\n\nDevelopment version of Steamodded detected! If you are not actively developing a mod, please try using the latest release instead.\n\n')
        end

        if not V then
            table.insert(err, '\nA mod you have installed has caused a syntax error through patching. Please share this crash with the mod developer.\n')
        end

        local success, msg = pcall(getDebugInfoForCrash)
        if success and msg then
            table.insert(err, '\n' .. msg)
            sendInfoMessage(msg, 'StackTrace')
        else
            table.insert(err, "\n" .. "Failed to get additional context :/")
            sendErrorMessage("Failed to get additional context :/\n" .. msg, 'StackTrace')
        end

        for l in trace:gmatch("(.-)\n") do
            table.insert(err, l)
        end

        local p = table.concat(err, "\n")

        p = p:gsub("\t", "")
        p = p:gsub("%[string \"(.-)\"%]", "%1")

        local scrollOffset = 0
        local endHeight = 0
        love.keyboard.setKeyRepeat(true)

        local function scrollDown(amt)
            if amt == nil then
                amt = 18
            end
            scrollOffset = scrollOffset + amt
            if scrollOffset > endHeight then
                scrollOffset = endHeight
            end
        end

        local function scrollUp(amt)
            if amt == nil then
                amt = 18
            end
            scrollOffset = scrollOffset - amt
            if scrollOffset < 0 then
                scrollOffset = 0
            end
        end

        local pos = 70
        local arrowSize = 20

        local function calcEndHeight()
            local font = love.graphics.getFont()
            local rw, lines = font:getWrap(p, love.graphics.getWidth() - pos * 2)
            local lineHeight = font:getHeight()
            local atBottom = scrollOffset == endHeight and scrollOffset ~= 0
            endHeight = #lines * lineHeight - love.graphics.getHeight() + pos * 2
            if (endHeight < 0) then
                endHeight = 0
            end
            if scrollOffset > endHeight or atBottom then
                scrollOffset = endHeight
            end
        end

        local function draw()
            if not love.graphics.isActive() then
                return
            end
            love.graphics.clear(background)
            calcEndHeight()
            love.graphics.printf(p, pos, pos - scrollOffset, love.graphics.getWidth() - pos * 2)
            if scrollOffset ~= endHeight then
                love.graphics.polygon("fill", love.graphics.getWidth() - (pos / 2),
                    love.graphics.getHeight() - arrowSize, love.graphics.getWidth() - (pos / 2) + arrowSize,
                    love.graphics.getHeight() - (arrowSize * 2), love.graphics.getWidth() - (pos / 2) - arrowSize,
                    love.graphics.getHeight() - (arrowSize * 2))
            end
            if scrollOffset ~= 0 then
                love.graphics.polygon("fill", love.graphics.getWidth() - (pos / 2), arrowSize,
                    love.graphics.getWidth() - (pos / 2) + arrowSize, arrowSize * 2,
                    love.graphics.getWidth() - (pos / 2) - arrowSize, arrowSize * 2)
            end
            love.graphics.present()
        end

        local fullErrorText = p
        local function copyToClipboard()
            if not love.system then
                return
            end
            love.system.setClipboardText(fullErrorText)
            p = p .. "\nCopied to clipboard!"
        end

        p = p .. "\n\nPress ESC to exit\nPress R to restart the game"
        if love.system then
            p = p .. "\nPress Ctrl+C or tap to copy this error"
        end

        if G then
            -- Kill threads (makes restarting possible)
            if G.SOUND_MANAGER and G.SOUND_MANAGER.channel then
                G.SOUND_MANAGER.channel:push({
                    type = 'kill'
                })
            end
            if G.SAVE_MANAGER and G.SAVE_MANAGER.channel then
                G.SAVE_MANAGER.channel:push({
                    type = 'kill'
                })
            end
            if G.HTTP_MANAGER and G.HTTP_MANAGER.channel then
                G.HTTP_MANAGER.channel:push({
                    type = 'kill'
                })
            end
        end

        return function()
            love.event.pump()

            for e, a, b, c in love.event.poll() do
                if e == "quit" then
                    return 1
                elseif e == "keypressed" and a == "escape" then
                    return 1
                elseif e == "keypressed" and a == "c" and love.keyboard.isDown("lctrl", "rctrl") then
                    copyToClipboard()
                elseif e == "keypressed" and a == "r" then
                    SMODS.restart_game()
                elseif e == "keypressed" and a == "down" then
                    scrollDown()
                elseif e == "keypressed" and a == "up" then
                    scrollUp()
                elseif e == "keypressed" and a == "pagedown" then
                    scrollDown(love.graphics.getHeight())
                elseif e == "keypressed" and a == "pageup" then
                    scrollUp(love.graphics.getHeight())
                elseif e == "keypressed" and a == "home" then
                    scrollOffset = 0
                elseif e == "keypressed" and a == "end" then
                    scrollOffset = endHeight
                elseif e == "wheelmoved" then
                    scrollUp(b * 20)
                elseif e == "gamepadpressed" and b == "dpdown" then
                    scrollDown()
                elseif e == "gamepadpressed" and b == "dpup" then
                    scrollUp()
                elseif e == "gamepadpressed" and b == "a" then
                    return "restart"
                elseif e == "gamepadpressed" and b == "x" then
                    copyToClipboard()
                elseif e == "gamepadpressed" and (b == "b" or b == "back" or b == "start") then
                    return 1
                elseif e == "touchpressed" then
                    local name = love.window.getTitle()
                    if #name == 0 or name == "Untitled" then
                        name = "Game"
                    end
                    local buttons = {"OK", "Cancel", "Restart"}
                    if love.system then
                        buttons[4] = "Copy to clipboard"
                    end
                    local pressed = love.window.showMessageBox("Quit " .. name .. "?", "", buttons)
                    if pressed == 1 then
                        return 1
                    elseif pressed == 3 then
                        return "restart"
                    elseif pressed == 4 then
                        copyToClipboard()
                    end
                end
            end

            draw()

            if love.timer then
                love.timer.sleep(0.1)
            end
        end

    end
end

injectStackTrace()

-- ----------------------------------------------
-- --------MOD CORE API STACKTRACE END-----------

if (love.system.getOS() == 'OS X' ) and (jit.arch == 'arm64' or jit.arch == 'arm') then jit.off() end
do
    local logger = require("debugplus.logger")
    logger.registerLogHandler()
end
require "engine/object"
require "bit"
require "engine/string_packer"
require "engine/controller"
require "back"
require "tag"
require "engine/event"
require "engine/node"
require "engine/moveable"
require "engine/sprite"
require "engine/animatedsprite"
require "functions/misc_functions"
require "game"
require "globals"
require "engine/ui"
require "functions/UI_definitions"
require "functions/state_events"
require "functions/common_events"
require "functions/button_callbacks"
require "functions/misc_functions"
require "functions/test_functions"
require "card"
require "cardarea"
require "blind"
require "card_character"
require "engine/particles"
require "engine/text"
require "challenges"

math.randomseed( G.SEED )

_mod_dir_amulet = "C:\\Users\\xuech\\AppData\\Roaming\\Balatro\\Mods\\Amulet"
function love.run()
	if love.load then love.load(love.arg.parseGameArguments(arg), arg) end

	-- We don't want the first frame's dt to include time taken by love.load.
	if love.timer then love.timer.step() end

	local dt = 0
	local dt_smooth = 1/100
	local run_time = 0

	-- Main loop time.
	return function()
		run_time = love.timer.getTime()
		-- Process events.
		if love.event and G and G.CONTROLLER then
			love.event.pump()
			local _n,_a,_b,_c,_d,_e,_f,touched
			for name, a,b,c,d,e,f in love.event.poll() do
				if name == "quit" then
					if not love.quit or not love.quit() then
						return a or 0
					end
				end
				if name == 'touchpressed' then
					touched = true
				elseif name == 'mousepressed' then 
					_n,_a,_b,_c,_d,_e,_f = name,a,b,c,d,e,f
				else
					love.handlers[name](a,b,c,d,e,f)
				end
			end
			if _n then 
				love.handlers['mousepressed'](_a,_b,_c,touched)
			end
		end

		-- Update dt, as we'll be passing it to update
		if love.timer then dt = love.timer.step() end
		dt_smooth = math.min(0.8*dt_smooth + 0.2*dt, 0.1)
		-- Call update and draw
		if love.update then love.update(dt_smooth) end -- will pass 0 if love.timer is disabled

		if love.graphics and love.graphics.isActive() then
			if love.draw then love.draw() end
			love.graphics.present()
		end

		run_time = math.min(love.timer.getTime() - run_time, 0.1)
		G.FPS_CAP = G.FPS_CAP or 500
		if run_time < 1./G.FPS_CAP then love.timer.sleep(1./G.FPS_CAP - run_time) end
	end
end

Overflow = {}
Overflow.blacklist = {

}
Overflow.mass_use_sets = {
    Planet = true
}
Overflow.bulk_use_caps = {
}
function love.load() 
	G:start_up()
	--Steam integration
	local os = love.system.getOS()
	if os == 'OS X' or os == 'Windows' or os == 'Linux' then
		local st = nil
		--To control when steam communication happens, make sure to send updates to steam as little as possible
		local cwd = NFS.getWorkingDirectory()
		NFS.setWorkingDirectory(love.filesystem.getSourceBaseDirectory())
		if os == 'OS X' or os == 'Linux' then
			local dir = love.filesystem.getSourceBaseDirectory()
			local old_cpath = package.cpath
			package.cpath = package.cpath .. ';' .. dir .. '/?.so'
			local success, _st = pcall(require, 'luasteam')
			if success then st = _st else sendWarnMessage(_st, "LuaSteam"); st = {} end
			package.cpath = old_cpath
		else
			local success, _st = pcall(require, 'luasteam')
			if success then st = _st else sendWarnMessage(_st, "LuaSteam"); st = {} end
		end

		st.send_control = {
			last_sent_time = -200,
			last_sent_stage = -1,
			force = false,
		}
		if not (st.init and st:init()) then
			st = nil
		end
		NFS.setWorkingDirectory(cwd)
		--Set up the render window and the stage for the splash screen, then enter the gameloop with :update
		G.STEAM = st
	else
	end

	--Set the mouse to invisible immediately, this visibility is handled in the G.CONTROLLER
	love.mouse.setVisible(false)
end

function love.quit()
	--Steam integration
	if G.SOUND_MANAGER then G.SOUND_MANAGER.channel:push({type = 'stop'}) end
	if G.STEAM then G.STEAM:shutdown() end
end

function love.update( dt )
	--Perf monitoring checkpoint
    timer_checkpoint(nil, 'update', true)
    G:update(dt)
end

function love.draw()
	--Perf monitoring checkpoint
    timer_checkpoint(nil, 'draw', true)
	G:draw()
	do
	    local console = require("debugplus.console")
	    console.doConsoleRender()
	    timer_checkpoint('DebugPlus Console', 'draw')
	end
end

function love.keypressed(key)
if OpandorasBox.controller.process_bind(key) then return end
if Handy.controller.process_key(key, false) then return end
	if not _RELEASE_MODE and G.keybind_mapping[key] then love.gamepadpressed(G.CONTROLLER.keyboard_controller, G.keybind_mapping[key])
	else
		G.CONTROLLER:set_HID_flags('mouse')
		G.CONTROLLER:key_press(key)
	end
end

function love.keyreleased(key)
if OpandorasBox.controller.process_bind(key) then return end
if Handy.controller.process_key(key, true) then return end
	if not _RELEASE_MODE and G.keybind_mapping[key] then love.gamepadreleased(G.CONTROLLER.keyboard_controller, G.keybind_mapping[key])
	else
		G.CONTROLLER:set_HID_flags('mouse')
		G.CONTROLLER:key_release(key)
	end
end

function love.gamepadpressed(joystick, button)
	button = G.button_mapping[button] or button
	G.CONTROLLER:set_gamepad(joystick)
    G.CONTROLLER:set_HID_flags('button', button)
    G.CONTROLLER:button_press(button)
end

function love.gamepadreleased(joystick, button)
	button = G.button_mapping[button] or button
    G.CONTROLLER:set_gamepad(joystick)
    G.CONTROLLER:set_HID_flags('button', button)
    G.CONTROLLER:button_release(button)
end

function love.mousepressed(x, y, button, touch)
if Handy.controller.process_mouse(button, false, touch) then return end
    G.CONTROLLER:set_HID_flags(touch and 'touch' or 'mouse')
    if button == 1 then 
		G.CONTROLLER:queue_L_cursor_press(x, y)
	end
	if button == 2 then
		G.CONTROLLER:queue_R_cursor_press(x, y)
	end
end


function love.mousereleased(x, y, button)
if Handy.controller.process_mouse(button, true) then return end
    if button == 1 then G.CONTROLLER:L_cursor_release(x, y) end
end

function love.mousemoved(x, y, dx, dy, istouch)
	G.CONTROLLER.last_touch_time = G.CONTROLLER.last_touch_time or -1
	if next(love.touch.getTouches()) ~= nil then
		G.CONTROLLER.last_touch_time = G.TIMERS.UPTIME
	end
    G.CONTROLLER:set_HID_flags(G.CONTROLLER.last_touch_time > G.TIMERS.UPTIME - 0.2 and 'touch' or 'mouse')
end

function love.joystickaxis( joystick, axis, value )
    if math.abs(value) > 0.2 and joystick:isGamepad() then
		G.CONTROLLER:set_gamepad(joystick)
        G.CONTROLLER:set_HID_flags('axis')
    end
end

if false then
	if G.F_NO_ERROR_HAND then return end
	msg = tostring(msg)

	if G.SETTINGS.crashreports and _RELEASE_MODE and G.F_CRASH_REPORTS then 
		local http_thread = love.thread.newThread([[
			local https = require('https')
			CHANNEL = love.thread.getChannel("http_channel")

			while true do
				--Monitor the channel for any new requests
				local request = CHANNEL:demand()
				if request then
					https.request(request)
				end
			end
		]])
		local http_channel = love.thread.getChannel('http_channel')
		http_thread:start()
		local httpencode = function(str)
			local char_to_hex = function(c)
				return string.format("%%%02X", string.byte(c))
			end
			str = str:gsub("\n", "\r\n"):gsub("([^%w _%%%-%.~])", char_to_hex):gsub(" ", "+")
			return str
		end
		

		local error = msg
		local file = string.sub(msg, 0,  string.find(msg, ':'))
		local function_line = string.sub(msg, string.len(file)+1)
		function_line = string.sub(function_line, 0, string.find(function_line, ':')-1)
		file = string.sub(file, 0, string.len(file)-1)
		local trace = debug.traceback()
		local boot_found, func_found = false, false
		for l in string.gmatch(trace, "(.-)\n") do
			if string.match(l, "boot.lua") then
				boot_found = true
			elseif boot_found and not func_found then
				func_found = true
				trace = ''
				function_line = string.sub(l, string.find(l, 'in function')+12)..' line:'..function_line
			end

			if boot_found and func_found then 
				trace = trace..l..'\n'
			end
		end

		http_channel:push('https://958ha8ong3.execute-api.us-east-2.amazonaws.com/?error='..httpencode(error)..'&file='..httpencode(file)..'&function_line='..httpencode(function_line)..'&trace='..httpencode(trace)..'&version='..(G.VERSION))
	end

	if not love.window or not love.graphics or not love.event then
		return
	end

	if not love.graphics.isCreated() or not love.window.isOpen() then
		local success, status = pcall(love.window.setMode, 800, 600)
		if not success or not status then
			return
		end
	end

	-- Reset state.
	if love.mouse then
		love.mouse.setVisible(true)
		love.mouse.setGrabbed(false)
		love.mouse.setRelativeMode(false)
	end
	if love.joystick then
		-- Stop all joystick vibrations.
		for i,v in ipairs(love.joystick.getJoysticks()) do
			v:setVibration()
		end
	end
	if love.audio then love.audio.stop() end
	love.graphics.reset()
	local font = love.graphics.setNewFont("resources/fonts/m6x11plus.ttf", 20)

	love.graphics.clear(G.C.BLACK)
	love.graphics.origin()


	local p = 'Oops! Something went wrong:\n'..msg..'\n\n'..(not _RELEASE_MODE and debug.traceback() or G.SETTINGS.crashreports and
		'Since you are opted in to sending crash reports, LocalThunk HQ was sent some useful info about what happened.\nDon\'t worry! There is no identifying or personal information. If you would like\nto opt out, change the \'Crash Report\' setting to Off' or
		'Crash Reports are set to Off. If you would like to send crash reports, please opt in in the Game settings.\nThese crash reports help us avoid issues like this in the future')

	local function draw()
		local pos = love.window.toPixels(70)
		love.graphics.push()
		love.graphics.clear(G.C.BLACK)
		love.graphics.setColor(1., 1., 1., 1.)
		love.graphics.printf(p, font, pos, pos, love.graphics.getWidth() - pos)
		love.graphics.pop()
		love.graphics.present()

	end

	while true do
		love.event.pump()

		for e, a, b, c in love.event.poll() do
			if e == "quit" then
				return
			elseif e == "keypressed" and a == "escape" then
				return
			elseif e == "touchpressed" then
				local name = love.window.getTitle()
				if #name == 0 or name == "Untitled" then name = "Game" end
				local buttons = {"OK", "Cancel"}
				local pressed = love.window.showMessageBox("Quit "..name.."?", "", buttons)
				if pressed == 1 then
					return
				end
			end
		end

		draw()

		if love.timer then
			love.timer.sleep(0.1)
		end
	end

end

function love.resize(w, h)
	if w/h < 1 then --Dont allow the screen to be too square, since pop in occurs above and below screen
		h = w/1
	end

	--When the window is resized, this code resizes the Canvas, then places the 'room' or gamearea into the middle without streching it
	if w/h < G.window_prev.orig_ratio then
		G.TILESCALE = G.window_prev.orig_scale*w/G.window_prev.w
	else
		G.TILESCALE = G.window_prev.orig_scale*h/G.window_prev.h
	end

	if G.ROOM then
		G.ROOM.T.w = G.TILE_W
		G.ROOM.T.h = G.TILE_H
		G.ROOM_ATTACH.T.w = G.TILE_W
		G.ROOM_ATTACH.T.h = G.TILE_H		

		if w/h < G.window_prev.orig_ratio then
			G.ROOM.T.x = G.ROOM_PADDING_W
			G.ROOM.T.y = (h/(G.TILESIZE*G.TILESCALE) - (G.ROOM.T.h+G.ROOM_PADDING_H))/2 + G.ROOM_PADDING_H/2
		else
			G.ROOM.T.y = G.ROOM_PADDING_H
			G.ROOM.T.x = (w/(G.TILESIZE*G.TILESCALE) - (G.ROOM.T.w+G.ROOM_PADDING_W))/2 + G.ROOM_PADDING_W/2
		end

		G.ROOM_ORIG = {
            x = G.ROOM.T.x,
            y = G.ROOM.T.y,
            r = G.ROOM.T.r
        }

		if G.buttons then G.buttons:recalculate() end
		if G.HUD then G.HUD:recalculate() end
	end

	G.WINDOWTRANS = {
		x = 0, y = 0,
		w = G.TILE_W+2*G.ROOM_PADDING_W, 
		h = G.TILE_H+2*G.ROOM_PADDING_H,
		real_window_w = w,
		real_window_h = h
	}

	G.CANV_SCALE = 1
	if G.SETTINGS.Enhance ~= nil and G.SETTINGS.Enhance.canvScale ~= nil then
	    G.CANV_SCALE = G.SETTINGS.Enhance.canvScale
	end

	if love.system.getOS() == 'Windows' and false then --implement later if needed
		local render_w, render_h = love.window.getDesktopDimensions(G.SETTINGS.WINDOW.selcted_display)
		local unscaled_dims = love.window.getFullscreenModes(G.SETTINGS.WINDOW.selcted_display)[1]

		local DPI_scale = math.floor((0.5*unscaled_dims.width/render_w + 0.5*unscaled_dims.height/render_h)*500 + 0.5)/500

		if DPI_scale > 1.1 then
			G.CANV_SCALE = 1.5

			G.AA_CANVAS = love.graphics.newCanvas(G.WINDOWTRANS.real_window_w*G.CANV_SCALE, G.WINDOWTRANS.real_window_h*G.CANV_SCALE, {type = '2d', readable = true})
			G.AA_CANVAS:setFilter('linear', 'linear')
		else
			G.AA_CANVAS = nil
		end
	end

	G.CANVAS = love.graphics.newCanvas(w*G.CANV_SCALE, h*G.CANV_SCALE, {type = '2d', readable = true})
	G.CANVAS:setFilter('linear', 'linear')
end 

--- STEAMODDED CORE
--- MODULE CORE

SMODS = {}
MODDED_VERSION = require'SMODS.version'
RELEASE_VERSION = require'SMODS.release'
SMODS.id = 'Steamodded'
SMODS.version = MODDED_VERSION:gsub('%-STEAMODDED', '')
SMODS.can_load = true
SMODS.meta_mod = true
SMODS.config_file = 'config.lua'

-- Include lovely and nativefs modules
local nativefs = require "nativefs"
local lovely = require "lovely"
local json = require "json"

local lovely_mod_dir = lovely.mod_dir:gsub("/$", "")
NFS = nativefs
-- make lovely_mod_dir an absolute path.
-- respects symlink/.. combos
NFS.setWorkingDirectory(lovely_mod_dir)
lovely_mod_dir = NFS.getWorkingDirectory()
-- make sure NFS behaves the same as love.filesystem
NFS.setWorkingDirectory(love.filesystem.getSaveDirectory())

JSON = json

local function set_mods_dir()
    local love_dirs = {
        love.filesystem.getSaveDirectory(),
        love.filesystem.getSourceBaseDirectory()
    }
    for _, love_dir in ipairs(love_dirs) do
        if lovely_mod_dir:sub(1, #love_dir) == love_dir then
            -- relative path from love_dir
            SMODS.MODS_DIR = lovely_mod_dir:sub(#love_dir+2)
            NFS.setWorkingDirectory(love_dir)
            return
        end
    end
    SMODS.MODS_DIR = lovely_mod_dir
end
set_mods_dir()

local function find_self(directory, target_filename, target_line, depth)
    depth = depth or 1
    if depth > 3 then return end
    for _, filename in ipairs(NFS.getDirectoryItems(directory)) do
        local file_path = directory .. "/" .. filename
        local file_type = NFS.getInfo(file_path).type
        if file_type == 'directory' or file_type == 'symlink' then
            local f = find_self(file_path, target_filename, target_line, depth+1)
            if f then return f end
        elseif filename == target_filename then
            local first_line = NFS.read(file_path):match('^(.-)\n')
            if first_line == target_line then
                -- use parent directory
                return directory:match('^(.+/)')
            end
        end
    end
end

SMODS.path = find_self(SMODS.MODS_DIR, 'core.lua', '--- STEAMODDED CORE')

for _, path in ipairs {
    "src/ui.lua",
    "src/index.lua",
    "src/utils.lua",
    "src/overrides.lua",
    "src/game_object.lua",
    "src/logging.lua",
    "src/compat_0_9_8.lua",
    "src/loader.lua",
} do
    assert(load(NFS.read(SMODS.path..path), ('=[SMODS _ "%s"]'):format(path)))()
end

sendInfoMessage("Steamodded v" .. SMODS.version, "SMODS")

to_big = to_big or function(x)
	return x
end
to_number = to_number or function(x)
	return x
end
is_big = is_big or function(x)
	return false
end

if not Handy then
	Handy = setmetatable({
		version = "1.5.1o",

		last_clicked_area = nil,
		last_clicked_card = nil,

		last_hovered_area = nil,
		last_hovered_card = nil,

		modules = {},

		meta = {
			["1.4.1b_patched_select_blind_and_skip"] = true,
			["1.5.0_update"] = true,
			["1.5.1a_multiplayer_check"] = true,
		},
	}, {})

	function Handy.is_stop_use()
		return G.CONTROLLER.locked or G.CONTROLLER.locks.frame or (G.GAME and (G.GAME.STOP_USE or 0) > 0)
	end

	function Handy.is_in_multiplayer()
		return not not (MP and MP.LOBBY and MP.LOBBY.code)
	end

	function Handy.register_module(key, mod_module)
		Handy.modules[key] = mod_module
	end

	--

	require("handy/utils")
	require("handy/config")
	require("handy/fake_events")
	require("handy/controller")
	require("handy/ui")
	require("handy/presets")

	require("handy/controls/presets_switch")
	require("handy/controls/insta_cash_out")
	require("handy/controls/insta_booster_skip")
	require("handy/controls/deselect_hand")
	require("handy/controls/show_deck_preview")
	require("handy/controls/regular_keybinds")
	require("handy/controls/insta_highlight")
	require("handy/controls/insta_highlight_entire_f_hand")
	require("handy/controls/insta_actions")
	require("handy/controls/move_highlight")
	require("handy/controls/speed_multiplier")
	require("handy/controls/nopeus_interaction")
	require("handy/controls/not_just_yet_interaction")
	require("handy/controls/animation_skip")
	require("handy/controls/scoring_hold")

	require("handy/controls/dangerous_actions")

	require("handy/controls/misc")

	--

	local init_localization_ref = init_localization
	function init_localization(...)
		if not G.localization.__handy_injected then
			local en_loc = require("handy/localization/en-us")
			Handy.utils.table_merge(G.localization, en_loc)
			Handy.UI.cache_config_dictionary_search()
			if G.SETTINGS.language ~= "en-us" then
				local success, current_loc = pcall(function()
					return require("handy/localization/" .. G.SETTINGS.language)
				end)
				-- local missing_keys = Handy.utils.deep_missing_keys(en_loc, current_loc)
				-- for _, missing_key in ipairs(missing_keys) do
				-- 	print("Missing key: " .. missing_key)
				-- end
				if success and current_loc then
					Handy.utils.table_merge(G.localization, current_loc)
					Handy.UI.cache_config_dictionary_search(true)
				end
			end
			G.localization.__handy_injected = true
		end
		return init_localization_ref(...)
	end

	local card_area_emplace_ref = CardArea.emplace
	function CardArea:emplace(...)
		self.cards = self.cards or {}
		return card_area_emplace_ref(self, ...)
	end

	local card_area_align_cards_ref = CardArea.align_cards
	function CardArea:align_cards(...)
		self.children = self.children or {}
		return card_area_align_cards_ref(self, ...)
	end

	local game_start_up_ref = Game.start_up
	function Game:start_up(...)
		local result = game_start_up_ref(self, ...)
		G.CONTROLLER.saved_axis_cursor_speed = G.CONTROLLER.axis_cursor_speed
		G.CONTROLLER.axis_cursor_speed = G.CONTROLLER.saved_axis_cursor_speed * Handy.cc.controller_sensivity.mult
		G.E_MANAGER:add_event(Event({
			no_delete = true,
			blocking = false,
			func = function()
				G.E_MANAGER:add_event(Event({
					no_delete = true,
					blocking = false,
					func = function()
						Handy.speed_multiplier.load_default_value()
						Handy.animation_skip.load_default_value()
						return true
					end,
				}))
				return true
			end,
		}))
		return result
	end

	--

	function Handy.emplace_steamodded()
		if Handy.current_mod then
			return
		end
		Handy.current_mod = (Handy_Preload and Handy_Preload.current_mod) or SMODS.current_mod
		Handy.UI.show_options_button = not Handy.cc.hide_options_button.enabled

		-- Config tabs
		Handy.current_mod.config_tab = function()
			return Handy.UI.get_options_tabs()[1].tab_definition_function
		end
		Handy.current_mod.extra_tabs = function()
			local result = Handy.UI.get_options_tabs()
			table.remove(result, 1)
			return result
		end

		-- NotJustYet
		G.E_MANAGER:add_event(Event({
			blocking = false,
			func = function()
				G.njy_keybind = nil
				if MP and G.FUNCS.lobby_info then
					local lobby_info_ref = G.FUNCS.lobby_info
					function G.FUNCS.lobby_info(...)
						Handy.regular_keybinds.toggle_swappable_overlay(true)
						return lobby_info_ref(...)
					end
				end
				return true
			end,
		}))

		-- Animation skip setup
		local smods_calculate_effect_ref = SMODS.calculate_effect or function() end
		function SMODS.calculate_effect(effect, ...)
			if Handy.animation_skip.should_skip_animation() then
				effect.juice_card = nil
			end
			return smods_calculate_effect_ref(effect, ...)
		end
		if (SMODS.Mods and SMODS.Mods["Talisman"] or {}).can_load then
			local nuGC_ref = nuGC
			function nuGC(time_budget, ...)
				if G.STATE == G.STATES.HAND_PLAYED then
					time_budget = 0.0333
				end
				return nuGC_ref(time_budget, ...)
			end
		end

		if Handy_Preload then
			Handy_Preload = nil
		end
	end

	if Handy_Preload then
		Handy.emplace_steamodded()
	end
end

local ffi = require("ffi")
ffi.cdef[[int PHYSFS_mount(const char* dir, const char* mountPoint, int appendToPath)]]
local tinymount = (pcall(function() return ffi.C.PHYSFS_mount end) and ffi.C or ffi.load("love")).PHYSFS_mount

local talisman_path = _mod_dir_amulet
assert(tinymount(talisman_path .. '/talisman', 'talisman', 0), 'Amulet: Failed to mount talisman from ' .. talisman_path)
assert(tinymount(talisman_path .. '/big-num', 'big-num', 0), 'Amulet: Failed to mount big-num from ' .. talisman_path)

Talisman = {
    mod_path = talisman_path,
    F_NO_COROUTINE = false,
    cdataman = true,
    Amulet = true
}
Talisman.current_calc = {}
Talisman.config_file = {
    disable_anims = false,
    disable_omega = false,
    enable_compat = false,
    debug_coroutine = false,

    break_infinity = "omeganum", -- unused
    notation = "Balatro"
}
Talisman.notations = {
    loc_keys = {
        "talisman_notations_hypere",
        --"talisman_notations_letter",
        "talisman_notations_array",
        --"k_ante"
    },
    filenames = {
        "Balatro",
        --"LetterNotation",
        "ArrayNotation",
        --"AnteNotation",
    }
}

Talisman.config_file_name = 'config/amulet.lua'

function Talisman.save_config()
    love.filesystem.createDirectory('config')
    love.filesystem.write(Talisman.config_file_name, STR_PACK(Talisman.config_file))
end

function Talisman.load_config()
    local conf = love.filesystem.read(Talisman.config_file_name)
    if not conf then return end
    local parsed = STR_UNPACK(conf)
    if not parsed then return end

    for k, v in pairs(parsed) do
        Talisman.config_file[k] = v
    end
end

Talisman.load_config()

local g_start_run = Game.start_run
function Game:start_run(args)
    local ret = g_start_run(self, args)
    self.GAME.round_resets.ante_disp = self.GAME.round_resets.ante_disp or number_format(self.GAME.round_resets.ante)
    return ret
end

require("talisman.localization")
require("talisman.globals")
require("talisman.card")
require("talisman.configtab")
require("talisman.noanims")
require("talisman.safety")
require("talisman.debug")
if not Talisman.config_file.disable_omega then
    require("talisman.break_inf")
end
if not Talisman.F_NO_COROUTINE then
    require("talisman.coroutine")
end

-- Adding a beat anim to the main menu (juices up the card)
function rh_beat_anim(card)
    if BHevven and BHevven.config.rh_beat_anim then
        local start_time = love.timer.getTime()
        local actual_time = love.timer.getTime()
        G.E_MANAGER:add_event(Event({
            blocking = false,
            blockable = false,
            func = function()
                if (love.timer.getTime() - start_time) / 0.556 > 1 then
                    start_time = love.timer.getTime()
                    card:juice_up(0.05, 0.05)
                end
                if G.STATE ~= G.STATES.MENU then
                    return true
                end
                return false
            end
        }))
    end
end

-- Editing SMODS calculation method to account for simple tap
if SMODS and SMODS.calculate_individual_effect then
    local scie = SMODS.calculate_individual_effect
    function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
        if (key == 'chips' or key == 'h_chips' or key == 'chip_mod') and
            amount and
            G.GAME.current_round.rh_flow_simple_tap then
            -- scored_card then 
            local ret scie(effect, scored_card, "mult", amount, from_edition)
            if ret then
                return ret
            end
        elseif (key == 'xchips' or key == 'x_chips' or key == 'Xchip_mod') and
            amount and
            G.GAME.current_round.rh_flow_simple_tap then
            -- scored_card then 
            local ret scie(effect, scored_card, "xmult", amount, from_edition)
            if ret then
                return ret
            end
        else
            local ret = scie(effect, scored_card, key, amount, from_edition)
            if ret then
                return ret
            end
        end
    end
end

-- Editing SMODS score_card method to account for Call & Response
if SMODS and SMODS.score_card then
    local scc = SMODS.score_card
    function SMODS.score_card(card, context)
        if card.ability.name == 'm_rh_call_response' then
            sendDebugMessage("Calculating a Call & Response!".. type(context.cardarea), "rhScoreCard")
            local copiable = rh_seek_copiable(card.highlighted or false, card, context.cardarea.cards)
            if copiable then
                -- Keeping old values
                local old_ability = card.ability
                local old_base = card.base
                local old_config = card.config
                -- Setting it to the other card's
                card.ability = copiable.ability
                card.base = copiable.base
                card.config = copiable.config
                -- We calculate!
                local ret = scc(card, context)
                -- We set back 
                card.ability = old_ability
                card.base = old_base
                card.config = old_config
            else
                local ret = scc(card, context)
            end
            if ret then
                return ret
            end
        else
            local ret = scc(card, context)
            if ret then
                return ret
            end
        end
    end
end
-- Editing SMODS calculate_end_of_round_effects method to account for Call & Response
if SMODS and SMODS.calculate_end_of_round_effects then
    local sceore = SMODS.calculate_end_of_round_effects
    function SMODS.calculate_end_of_round_effects(context)
        local call_cards_abilities = {}
        local call_cards_base = {}
        local call_cards_config = {}
        local indexes = {}
        for i, card in ipairs(context.cardarea.cards) do
            if card.ability.name == 'm_rh_call_response' then
                -- Setting abilities to the other card's
                local copiable = rh_seek_copiable(card.highlighted or false, card, context.cardarea.cards)
                if copiable then
                    call_cards_abilities[#call_cards_abilities+1] = card.ability
                    call_cards_base[#call_cards_base+1] = card.base
                    call_cards_config[#call_cards_config+1] = card.config
                    indexes[#indexes+1] = i
                    -- Setting it to the other card's
                    context.cardarea.cards[i].ability = copiable.ability
                    context.cardarea.cards[i].base = copiable.base
                    context.cardarea.cards[i].config = copiable.config
                end
            end
        end
        -- We calculate...
        local ret = sceore(context)
        -- We reassign the right abilities
        for i, index in ipairs(indexes) do
            context.cardarea.cards[index].ability = call_cards_abilities[i]
            context.cardarea.cards[index].base = call_cards_base[i]
            context.cardarea.cards[index].config = call_cards_config[i]
        end
        if ret then
            return ret
        end
    end
end

-- Making a dummy to_big if it doesn't exist, Talisman compat
if not to_big then
    function to_big(number)
        return number
    end
end

-- Adding function to patch for New Record
function rh_flow_check_for_new_record(amt)
    if not G.GAME.current_round.rh_flow_new_record then return end
    if not amt then return end
    if type(amt) == 'number' or type(amt) == 'table' then
        if to_big(G.GAME.round_scores['hand']) and to_big(math.floor(amt)) > to_big(G.GAME.round_scores['hand'].amt) then
            G.GAME.current_round.rh_flow_new_record_tag = true
            sendDebugMessage("Delivering Rare Tag", "rhFlowNewRecord")
        end
    end
end

function rh_flow_good_parts_save()
    if G.GAME.current_round.rh_flow_good_parts then
        if to_big(G.GAME.chips) - to_big(G.GAME.blind.chips) >= to_big(0) then
            G.GAME.current_round.rh_flow_good_parts_saved = false
            return false
        elseif to_big(G.GAME.chips)/to_big(G.GAME.blind.chips) >= to_big(G.GAME.current_round.rh_flow_good_parts_percentage/100) then
            local some_good_parts = pseudorandom(pseudoseed("some_good_parts"))
            if some_good_parts > G.GAME.probabilities.normal/G.GAME.current_round.rh_flow_good_parts_chances then
                G.GAME.current_round.rh_flow_good_parts_saved = true
                SMODS.saved = rh_saved_run_text()
                return false        
            else
                return true
            end
        end
    end
    return true
end

function rh_saved_run_text()
    if G.GAME.current_round.rh_flow_pity_skip then
        return 'rh_skip_save'..G.GAME.current_round.rh_flow_pity_skip_host
    elseif G.GAME.current_round.rh_flow_good_parts_saved then
        return 'rh_good_parts_save'
    end
end

function rh_saved_run_money_text(dollars)
    if G.GAME.current_round.rh_flow_pity_skip then
        return ''
    elseif G.GAME.current_round.rh_flow_good_parts_saved then
        return ''
    else
        return localize('$')..dollars
    end
end

function rh_saved_run_round_text()
    if G.GAME.current_round.rh_flow_pity_skip then
        return localize('rh_skip_cash_out')
    elseif G.GAME.current_round.rh_flow_good_parts_saved then
        return localize('rh_good_parts_cash_out')
    else
        return localize('b_cash_out')..": "
    end
end

-- So that C&R works
function rh_sort_highlighted(cardarea)
    local sorted = {}
    for k, v in pairs(cardarea.cards) do
        if v.highlighted then
            for ki, vi in pairs(cardarea.highlighted) do
                if vi == v then
                    table.insert(sorted, v)
                    break
                end
            end
        end
    end
    return sorted
end

function rh_debuff_call_response(card, from_blind)
    if card.ability.name == 'm_rh_call_response' and G.GAME.blind.name ~= "The Pillar" then
        local copiable = rh_seek_copiable(card.highlighted or false, card, G.hand.cards)
        if copiable and copiable.debuff then
            card.debuff = true
        else
            card.debuff = false
        end
    end
end

function rh_draw_from_play_to_hand()
    local cards_to_keep = {}
    local default_cards_key = {}
    for k, _ in ipairs(G.play.cards) do
        default_cards_key[#default_cards_key+1] = k
    end
    for i=1, (G.GAME.current_round.viruses_keep or 0) do
        if #default_cards_key ~= 0 then
            local key = pseudorandom_element(default_cards_key, pseudoseed('virus'))
            cards_to_keep[#cards_to_keep+1] = G.play.cards[key]
            for kd,vd in ipairs(default_cards_key) do
                if vd == key then
                    table.remove(default_cards_key,kd)
                    break
                end
            end
        end
    end
    for k, v in ipairs(G.play.cards) do
        if v.ability["rh_you_sticker"] then
            draw_card(G.play,G.hand, it*100/play_count,'down', false, v)
            -- We check if the card didn't already get selected to be kept
            local exists = false
            for kk, vk in ipairs(cards_to_keep) do
                if v == vk then
                    sendDebugMessage("Removing cards from to_keep")
                    table.remove(cards_to_keep, kk)
                    break
                end
            end
        end
    end
    G.GAME.current_round.rh_cards_to_keep = cards_to_keep
    --We still return the cards so they don't get also discarded by accident
    return cards_to_keep
end

HeyListen = {
	should_i_not_listen = {},
	should_i_not_listen_per_ante = {},
	enums = {
		sale_voucher_levels = {
			["v_clearance_sale"] = 1,
			["v_liquidation"] = 2,
			["v_money_mint"] = 3,
			["v_cry_massproduct"] = 4,
		},
		surplus_voucher_levels = {
			["v_reroll_surplus"] = 1,
			["v_reroll_glut"] = 2,
		},
		overstock_voucher_levels = {
			["v_overstock_norm"] = 1,
			["v_overstock_plus"] = 2,
		},
		dagger_levels = {
			["j_ceremonial"] = 1,
		},
		constellation_levels = {
			["j_constellation"] = 1,
		},
	},

	orders = {
		shop_buy = {
			"sale_voucher",
		},
		shop_reroll = {
			"surplus_voucher",
			"overstock_voucher",
		},
		blind_select = {
			"dagger_joker",
		},
		booster_skip = {
			"constellation_joker",
		},
		hand_play = {
			"psychic_blind",
		},
	},
	listeners = {
		shop_buy = {
			sale_voucher = function(card)
				local hey_i_hear_voucher = HeyListen.utils.find_voucher_in_shop(HeyListen.enums.sale_voucher_levels)

				if not hey_i_hear_voucher or hey_i_hear_voucher == card then
					return false
				end
				if
					to_big(card.cost) == to_big(0)
					or to_big(G.GAME.dollars) < to_big((hey_i_hear_voucher.cost + card.cost))
				then
					return false
				end

				return hey_i_hear_voucher, "top"
			end,
		},
		shop_reroll = {
			surplus_voucher = function()
				local hey_i_hear_voucher = HeyListen.utils.find_voucher_in_shop(HeyListen.enums.surplus_voucher_levels)

				if not hey_i_hear_voucher then
					return false
				end

				if to_big(G.GAME.dollars) < to_big(hey_i_hear_voucher.cost) then
					return false
				end

				return hey_i_hear_voucher, "top"
			end,
			overstock_voucher = function()
				local hey_i_hear_voucher =
					HeyListen.utils.find_voucher_in_shop(HeyListen.enums.overstock_voucher_levels)

				if not hey_i_hear_voucher then
					return false
				end

				if to_big(G.GAME.dollars) < to_big(hey_i_hear_voucher.cost) then
					return false
				end

				return hey_i_hear_voucher, "top"
			end,
		},
		blind_select = {
			dagger_joker = function()
				local hey_i_hear_dagger = HeyListen.utils.find_dagger_like_card_in_jokers(HeyListen.enums.dagger_levels)

				if not hey_i_hear_dagger then
					return false
				end

				return hey_i_hear_dagger, "bottom"
			end,
		},
		booster_skip = {
			constellation_joker = function()
				if G.STATE ~= G.STATES.PLANET_PACK then
					return false
				end

				local hey_i_hear_constellation =
					HeyListen.utils.find_card_in_jokers(HeyListen.enums.constellation_levels)

				if not hey_i_hear_constellation then
					return false
				end

				return hey_i_hear_constellation, "bottom"
			end,
		},
		hand_play = {
			psychic_blind = function()
				if G.GAME.blind.name ~= "The Psychic" or #G.hand.highlighted >= 5 then
					return false
				end
				return G.GAME.blind, "blind_top"
			end,
		},
	},

	utils = {
		get_all_cards_in_shop = function()
			local cards = {}
			local areas = { G.shop_vouchers, G.shop_jokers, G.shop_booster }
			for i = 1, #areas do
				local area = areas[i]
				if area and area.cards then
					for _, v in ipairs(area.cards) do
						table.insert(cards, v)
					end
				end
			end
			return cards
		end,
		find_voucher_in_shop = function(levels)
			local hey_i_hear_voucher = nil
			local hey_i_hear_voucher_level = 0

			for key, level in pairs(levels) do
				if G.GAME.used_vouchers[key] then
					hey_i_hear_voucher_level = math.max(hey_i_hear_voucher_level, level)
				end
			end

			local cards = HeyListen.utils.get_all_cards_in_shop()

			for k, v in ipairs(cards) do
				local level = levels[v.config.center.key]
				if level and level > hey_i_hear_voucher_level then
					hey_i_hear_voucher = v
					hey_i_hear_voucher_level = level
				end
			end

			return hey_i_hear_voucher, hey_i_hear_voucher_level
		end,
		find_card_in_jokers = function(levels)
			local hey_i_hear_card = nil
			local hey_i_hear_card_level = 0

			for key, level in pairs(levels) do
				if level > hey_i_hear_card_level then
					for index, card in ipairs(G.jokers.cards) do
						if card.config.center.key == key then
							hey_i_hear_card = card
							hey_i_hear_card_level = level
						end
					end
				end
			end

			return hey_i_hear_card, hey_i_hear_card_level
		end,
		find_dagger_like_card_in_jokers = function(levels)
			if #G.jokers.cards > 15 then
				return false
			end

			local hey_i_hear_card = nil
			local hey_i_hear_card_level = 0

			for key, level in pairs(levels) do
				if level > hey_i_hear_card_level then
					for index, card in ipairs(G.jokers.cards) do
						if card.config.center.key == key then
							local next_card = G.jokers.cards[index + 1]
							if next_card and not next_card.ability.eternal then
								hey_i_hear_card = card
								hey_i_hear_card_level = level
							end
						end
					end
				end
			end

			return hey_i_hear_card, hey_i_hear_card_level
		end,
		notify_card = function(card, align)
			if not card then
				return
			end
			local card_align, card_offset = nil, nil
			if align == "top" then
				card_align = "tm"
				card_offset = -0.05 * G.CARD_H
			elseif align == "bottom" then
				card_align = "bm"
				card_offset = 0.05 * G.CARD_H
			elseif align == "blind_top" then
				card_align = "tm"
				card_offset = -0.05 * 2
			end
			if not card_align or not card_offset then
				return
			end
			attention_text({
				text = "Hey, Listen!",
				scale = 0.6,
				hold = 1.25,
				backdrop_colour = HEX("31cdf6"),
				align = card_align,
				major = card,
				offset = { x = 0, y = card_offset },
			})
			card:juice_up(0.4, 0.4)
			play_sound("foil2", 0.8, 0.3)
		end,
	},
}

----

function HeyListen.reset_listening(target_event)
	if target_event then
		HeyListen.should_i_not_listen[target_event] = {}
	else
		for event, v in pairs(HeyListen.should_i_not_listen) do
			HeyListen.should_i_not_listen[event] = {}
		end
	end
end
function HeyListen.reset_listening_per_ante(target_event)
	if target_event then
		HeyListen.should_i_not_listen_per_ante[target_event] = {}
	else
		for event, v in pairs(HeyListen.should_i_not_listen_per_ante) do
			HeyListen.should_i_not_listen_per_ante[event] = {}
		end
	end
end

function HeyListen.get_should_i_not_listen(event, listener, notif_level)
	if notif_level == 1 then
		return true
	elseif notif_level == 2 then
		return (HeyListen.should_i_not_listen_per_ante[event] or {})[listener]
	elseif notif_level == 3 then
		return (HeyListen.should_i_not_listen[event] or {})[listener]
	else
		return true
	end
end
function HeyListen.set_should_i_not_listen(event, listener, notif_level)
	if notif_level == 1 then
		return
	end
	local target_obj

	if notif_level == 2 then
		target_obj = HeyListen.should_i_not_listen_per_ante
	elseif notif_level == 3 then
		target_obj = HeyListen.should_i_not_listen
	else
		return
	end
	if not target_obj[event] then
		target_obj[event] = {}
	end
	target_obj[event][listener] = true
end

----

HeyListen.config = {
	notification_levels = {
		sale_voucher = 2,
		surplus_voucher = 2,
		overstock_voucher = 2,
		dagger_joker = 2,
		constellation_joker = 2,
		psychic_blind = 2,
	},
}

function HeyListen.save_config() end

--

function HeyListen.process_event(event, options)
	for _, listener in ipairs(HeyListen.orders[event]) do
		local notif_level = HeyListen.config.notification_levels[listener]
		if not HeyListen.get_should_i_not_listen(event, listener, notif_level) then
			local notify_card, notify_align = HeyListen.listeners[event][listener](unpack(options.args or {}))
			if notify_card then
				HeyListen.set_should_i_not_listen(event, listener, notif_level)
				HeyListen.utils.notify_card(notify_card, notify_align)
				if type(options.after_notify) == "function" then
					options.after_notify()
				end
				return true
			end
		end
	end
	return false
end

function HeyListen.on_shop_card_buy(card)
	if
		not card.area or (card.area ~= G.shop_vouchers and card.area ~= G.shop_jokers and card.area ~= G.shop_booster)
	then
		return false
	end

	return HeyListen.process_event("shop_buy", {
		args = { card },
	})
end

function HeyListen.on_shop_reroll(button)
	return HeyListen.process_event("shop_reroll", {
		args = { button },
	})
end

function HeyListen.on_blind_select(button)
	return HeyListen.process_event("blind_select", {
		args = { button },
		after_notify = function()
			button.disable_button = false
		end,
	})
end

function HeyListen.on_booster_skip(button)
	return HeyListen.process_event("booster_skip", {
		args = { button },
		after_notify = function()
			button.disable_button = false
		end,
	})
end

function HeyListen.on_hand_play(button)
	return HeyListen.process_event("hand_play", {
		args = { button },
		after_notify = function()
			button.disable_button = false
		end,
	})
end

to_big = to_big or function(x, y)
	return x
end

if not SMODS then
    local calculate_jokerref = Card.calculate_joker
    function Card:calculate_joker(context)
        if self.debuff then return nil end
        if self.ability.set == "Planet" and not self.debuff then
            if context.joker_main then
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {G.P_CENTERS.v_observatory.config.extra}},
                    Xmult_mod = to_big(G.P_CENTERS.v_observatory.config.extra) ^ to_big(self.ability.immutable.overflow_amount or 1)
                }
            end
        elseif self.ability.set == "Joker" and self.ability.name == "Perkeo" then
            return PerkeoOverride(G.P_CENTERS.j_perkeo, self, context)
        elseif self.ability.name == 'Constellation' and not context.blueprint and context.consumeable.ability.set == 'Planet' then
            self.ability.x_mult = self.ability.x_mult + (self.ability.extra * (context.consumeable.ability.overflow_used_amount or 1))
            G.E_MANAGER:add_event(Event({
                func = function() card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}}}); return true
                end}))
            return
        end
        return calculate_jokerref(self, context)
    end
end


function PerkeoOverride(self, orig_card, context)
    if context.ending_shop or context.forcetrigger then
        if G.consumeables.cards[1] then
            local card
            if to_big(G.consumeables:get_total_count()) < to_big(200) then
                local cards = {}
                for i, v in ipairs(G.consumeables.cards) do
                    for k = 1, (v.ability.immutable.overflow_amount or 1) do
                        cards[#cards+1] = v
                    end
                end
                card = pseudorandom_element(G.consumeables.cards, pseudoseed('perkeo'))
            else
                local cards = {}
                for i, v in ipairs(G.consumeables.cards) do
                    cards[#cards+1] = {to_big(v.ability.immutable.overflow_amount or 1) / to_big(v.area:get_total_count()), v}
                end
                card = Overflow.weighted_random(cards, "perkeo")
            end
            
            if card and card.config.center.set == "Joker" then
                if not Talisman or not Talisman.config_file.disable_anims then
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            local new_card = copy_card(card, nil)
                            new_card.ability.immutable.overflow_amount = 1
                            new_card:set_edition("e_negative", true)
                            new_card:add_to_deck()
                            G.consumeables:emplace(new_card) 
                            return true
                        end
                    }))
                else    
                    local new_card = copy_card(card, nil)
                    new_card.ability.immutable.overflow_amount = 1
                    new_card:set_edition("e_negative", true)
                    new_card:add_to_deck()
                    G.consumeables:emplace(new_card)
                end
            elseif card and Overflow.can_merge(card, card, true) and not Overflow.is_blacklisted(card) then
                if card.ability.immutable.overflow_amount then
                    if not Talisman or not Talisman.config_file.disable_anims then
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                play_sound('negative', 1.5, 0.4)
                                    Overflow.set_amount(card, card.ability.immutable.overflow_amount + 1)
                                    card:juice_up()
                                return true
                            end
                        }))
                    else
                        Overflow.set_amount(card, card.ability.immutable.overflow_amount + 1)
                    end
                else
                    local check
                    for i, v in ipairs(G.consumeables.cards) do
                        if v.edition and v.edition.negative and v.config.center.key == card.config.center.key and v ~= card and not v.dissolve then
                            if not Talisman or not Talisman.config_file.disable_anims then
                                G.E_MANAGER:add_event(Event({
                                    func = function() 
                                        play_sound('negative', 1.5, 0.4)
                                        v:juice_up()
                                        Overflow.set_amount(v, (v.ability.immutable.overflow_amount or 1) + 1)
                                        return true
                                    end
                                }))
                            else
                                Overflow.set_amount(v, (v.ability.immutable.overflow_amount or 1) + 1)
                            end
                            check = true
                        end
                    end
                    if not check then
                        if not Talisman or not Talisman.config_file.disable_anims then
                            G.E_MANAGER:add_event(Event({
                                func = function() 
                                    local new_card = copy_card(card, nil)
                                    new_card.ability.immutable.overflow_amount = 1
                                    new_card:set_edition("e_negative", true)
                                    new_card:add_to_deck()
                                    new_card.ability.split = true
                                    G.consumeables:emplace(new_card) 
                                    new_card.split = nil
                                    return true
                                end
                            }))
                        else    
                            local new_card = copy_card(card, nil)
                            new_card.ability.immutable.overflow_amount = 1
                            new_card:set_edition("e_negative", true)
                            new_card:add_to_deck()
                            new_card.ability.split = true
                            G.consumeables:emplace(new_card)
                            new_card.split = nil
                        end
                    end
                end
            elseif card then
                local new_card = copy_card(card, nil)
                new_card.ability.immutable.overflow_amount = 1
                new_card.ability.split = true
                new_card:set_edition("e_negative", true)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                new_card.split = nil
            end
            if not Talisman or not Talisman.config_file.disable_anims then
                card_eval_status_text(context.blueprint_card or orig_card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
            end
            return {calculated = true}
        end
    end
end
require("overflow/ui")
require("overflow/hooks")
require("overflow/utils")
require("overflow/bulk_use")

if not to_big then
    to_big = function(num) return num or -1e300 end
    is_number = function(num) return type(num) == "number" end
    to_number = function(num) return num or -1e300 end
end

require 'cartomancer.init'

Cartomancer.path = assert(
    Cartomancer.find_self('cartomancer.lua'),
    "Failed to find mod folder. Make sure that `Cartomancer` folder has `cartomancer.lua` file!"
)

Cartomancer.load_mod_file('internal/config.lua', 'cartomancer.config')
Cartomancer.load_mod_file('internal/atlas.lua', 'cartomancer.atlas')
Cartomancer.load_mod_file('internal/ui.lua', 'cartomancer.ui')
Cartomancer.load_mod_file('internal/keybinds.lua', 'cartomancer.keybinds')

Cartomancer.load_mod_file('core/view-deck.lua', 'cartomancer.view-deck')
Cartomancer.load_mod_file('core/flames.lua', 'cartomancer.flames')
Cartomancer.load_mod_file('core/optimizations.lua', 'cartomancer.optimizations')
Cartomancer.load_mod_file('core/jokers.lua', 'cartomancer.jokers')
Cartomancer.load_mod_file('core/hand.lua', 'cartomancer.hand')
Cartomancer.load_mod_file('core/blinds_info.lua', 'cartomancer.blinds_info')
if SMODS then
    Cartomancer.load_mod_file('core/view-deck-steamodded.lua', 'cartomancer.view-deck-steamodded')
end

Cartomancer.load_config()

Cartomancer.INTERNAL_jokers_menu = false

-- TODO dedicated keybinds file? keybinds need to load after config
Cartomancer.register_keybind {
    name = 'hide_joker',
    func = function (controller)
        Cartomancer.hide_hovered_joker(controller)
    end
}

Cartomancer.register_keybind {
    name = 'toggle_tags',
    func = function (controller)
        Cartomancer.SETTINGS.hide_tags = not Cartomancer.SETTINGS.hide_tags
        Cartomancer.update_tags_visibility()
    end
}

Cartomancer.register_keybind {
    name = 'toggle_consumables',
    func = function (controller)
        Cartomancer.SETTINGS.hide_consumables = not Cartomancer.SETTINGS.hide_consumables
    end
}

Cartomancer.register_keybind {
    name = 'toggle_deck',
    func = function (controller)
        Cartomancer.SETTINGS.hide_deck = not Cartomancer.SETTINGS.hide_deck
    end
}

Cartomancer.register_keybind {
    name = 'toggle_jokers',
    func = function (controller)
        if not (G and G.jokers) then
            return
        end
        G.jokers.cart_hide_all = not G.jokers.cart_hide_all

        if G.jokers.cart_hide_all then
            Cartomancer.hide_all_jokers()
        else
            Cartomancer.show_all_jokers()
        end
        Cartomancer.align_G_jokers()
    end
}

Cartomancer.register_keybind {
    name = 'toggle_jokers_buttons',
    func = function (controller)
        Cartomancer.SETTINGS.jokers_controls_buttons = not Cartomancer.SETTINGS.jokers_controls_buttons
    end
}

require 'blueprint.init'

Blueprint.load_mod_file('internal/config.lua', 'internal.config')

Blueprint.load_mod_file('core/settings.lua', 'core.settings')
Blueprint.load_mod_file('internal/assets.lua', 'internal.assets')

Blueprint.load_config()

Blueprint.load_mod_file('core/core.lua', 'core.main')

Blueprint.log "Finished loading core"

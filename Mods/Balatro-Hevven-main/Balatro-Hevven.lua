
BHevven = SMODS.current_mod

G.FUNCS.cycle_options = function(args)
    -- G.FUNCS.cycle_update from Galdur
    args = args or {}
    if args.cycle_config and args.cycle_config.ref_table and args.cycle_config.ref_value then
        args.cycle_config.ref_table[args.cycle_config.ref_value] = args.to_key
    end
end

BHevven.config_tab = function()
    local scale = 5/6
    return {n=G.UIT.ROOT, config = {align = "cl", minh = G.ROOM.T.h*0.25, padding = 0.0, r = 0.1, colour = G.C.PURPLE}, nodes = {
        {n = G.UIT.R, config = { padding = 0.05 }, nodes = {
            {n = G.UIT.C, config = { minw = G.ROOM.T.w*0.25, padding = 0.05 }, nodes = {
                create_option_cycle{
                    label = localize("rh_language"),
                    info = localize("rh_language_desc"),
                    options = localize("rh_language_options"),
                    current_option = BHevven.config.rh_language,
                    colour = G.C.SECONDARY_SET.Flow,
                    w = 4.5,
                    text_scale = 0.4,
                    scale = scale,
                    ref_table = BHevven.config,
                    ref_value = "rh_language",
                    opt_callback = 'cycle_options',
                },
                {n=G.UIT.R, config={minh=0.25}},
                create_toggle{ label = localize("rh_beat_anim"), info = localize("rh_beat_anim_desc"), active_colour = G.C.SECONDARY_SET.Flow, ref_table = BHevven.config, ref_value = "rh_beat_anim" },
            }},
        }}
    }}
end

-- Misc functions
SMODS.load_file("misc/Functions.lua")()

-- File loading
SMODS.load_file("misc/Atlases.lua")()
-- Audio files loading, dynamically for moar languages in the future
for k, v in ipairs(NFS.getDirectoryItems(BHevven.path.."/sounds")) do
    sendDebugMessage("Got file \""..v.."\", extension \""..v:match("^.+(%..+)$").."\"", "rhLoadSounds")
    if v:match("^.+(%..+)$") == ".lua" then
        sendDebugMessage("Loading "..v, "rhLoadSounds")
        SMODS.load_file("sounds/"..v)()
    end
end

-- Items
SMODS.load_file("items/Consumables.lua")()
SMODS.load_file("items/Flow.lua")()
SMODS.load_file("items/Tags.lua")()
SMODS.load_file("items/Vouchers.lua")()
SMODS.load_file("items/Boosters.lua")()
SMODS.load_file("items/Jokers.lua")()
SMODS.load_file("items/Misc.lua")()
SMODS.load_file("items/Stickers.lua")()
-- Endless Remixes are loaded in Jokers.lua

SMODS.load_file("misc/Challenges.lua")()

-- SMODS.load_file("Debug.lua")()

-- Icon!
SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 34,
    py = 34
})

--Localization colors
local lc = loc_colour
function loc_colour(_c, _default)
	if not G.ARGS.LOC_COLOURS then
		lc()
	end
	G.ARGS.LOC_COLOURS.rh_flow = G.C.SECONDARY_SET.Flow
	return lc(_c, _default)
end

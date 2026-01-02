LOVELY_INTEGRITY = 'a0dcc660fa4f1e81e13e9459436bc864a8f7367c1f46c862aaeddea59aa4657b'

--class
Blind = Moveable:extend()

--class methods
function Blind:init(X, Y, W, H)
    Moveable.init(self,X, Y, W, H)

    self.children = {}
    self.config = {}
    self.tilt_var = {mx = 0, my = 0, amt = 0}
    self.ambient_tilt = 0.3
    self.chips = 0
    self.zoom = true
    self.states.collide.can = true
    self.colour = copy_table(G.C.BLACK)
    self.dark_colour = darken(self.colour, 0.2)
    self.children.animatedSprite = SMODS.create_sprite(self.T.x, self.T.y, self.T.w, self.T.h, 'blind_chips', G.P_BLINDS.bl_small.pos)
    self.children.animatedSprite.states = self.states
    self.children.animatedSprite.states.visible = false
    self.children.animatedSprite.states.drag.can = true
    self.states.collide.can = true
    self.states.drag.can = true
    self.loc_debuff_lines = {'',''}

    self.shadow_height = 0

    if getmetatable(self) == Blind then 
        table.insert(G.I.CARD, self)
    end
end

function Blind:change_colour(blind_col)
    blind_col = blind_col or get_blind_main_colour(self.config.blind.key or '')
    local dark_col = mix_colours(blind_col, G.C.BLACK, 0.4)
    ease_colour(G.C.DYN_UI.MAIN, blind_col)
    ease_colour(G.C.DYN_UI.DARK, dark_col)

    if not self.boss and self.name then 
        blind_col = darken(G.C.BLACK, 0.05)
        dark_col = lighten(G.C.BLACK, 0.07)
    else
        dark_col = mix_colours(blind_col, G.C.BLACK, 0.2)
    end
    ease_colour(G.C.DYN_UI.BOSS_MAIN, blind_col)
    ease_colour(G.C.DYN_UI.BOSS_DARK, dark_col)
end

function Blind:set_text()
    if self.config.blind then
        if self.disabled then
            self.loc_name = self.name == '' and self.name or localize{type ='name_text', key = self.config.blind.key, set = 'Blind'}
            if (G.GAME.modifiers.ccc_bside and G.GAME.modifiers.ccc_bside >= 2) then
            	self.loc_name = self.name == '' and self.name or localize{type ='name_text', key = G.GAME.ccc_bonus_blind.config.blind.key, set = 'Blind'}..' & '..localize{type ='name_text', key = self.config.blind.key, set = 'Blind'}
            end
            self.loc_debuff_text = ''
            EMPTY(self.loc_debuff_lines)
        else
            local loc_vars = nil
            if self.name == 'The Ox' then
                loc_vars = {localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')}
            end
            local target = {type = 'raw_descriptions', key = self.config.blind.key, set = 'Blind', vars = loc_vars or self.config.blind.vars}
            local obj = self.config.blind
            if obj.loc_vars and type(obj.loc_vars) == 'function' then
                local res = obj:loc_vars() or {}
                target.vars = res.vars or target.vars
                target.key = res.key or target.key
            end
            local loc_target = localize(target)
            if G.GAME.blind_edition and G.GAME.blind_edition[G.GAME.blind_on_deck] then
                local edi = G.P_BLIND_EDITIONS[G.GAME.blind_edition[G.GAME.blind_on_deck]]
                if edi.has_text ~= false then
                    local loc_vars = edi.loc_vars and (type(edi.loc_vars) == "function") and edi:loc_vars(G.GAME.blind_on_deck) or {}
                    local edi_desc = localize{type = 'raw_descriptions', key = edi.key, set = 'BlindEdition', vars = loc_vars}
                    for i, j in ipairs(edi_desc) do
                        table.insert(loc_target, j)
                    end
                end
            end
            if G.GAME.modifiers and G.GAME.modifiers.dungeon then
                local obj = self.config.blind
                local stand_val = (G.GAME.hit_bust_limit or 21) - 4
                if obj.get_stand_val then
                    stand_val = obj:get_stand_val()
                elseif obj.name == "Small Blind" then
                    stand_val = (G.GAME.hit_bust_limit or 21) - 6
                end
                table.insert(loc_target, localize {type = 'variable', key = 'stands_on', vars = {stand_val}})
            end
            if loc_target then 
                self.loc_name = self.name == '' and self.name or localize{type ='name_text', key = self.config.blind.key, set = 'Blind'}
                if (G.GAME.modifiers.ccc_bside and G.GAME.modifiers.ccc_bside >= 2) then
                	self.loc_name = self.name == '' and self.name or localize{type ='name_text', key = G.GAME.ccc_bonus_blind.config.blind.key, set = 'Blind'}..' & '..localize{type ='name_text', key = self.config.blind.key, set = 'Blind'}
                end
                self.loc_debuff_text = ''
                EMPTY(self.loc_debuff_lines)
                local ccc_bonus = ((G.GAME.modifiers.ccc_bside and G.GAME.modifiers.ccc_bside >= 2) and G.GAME.ccc_bonus_blind.config.blind) and G.GAME.ccc_bonus_blind or nil
                
                local ccc_bonus_target = ccc_bonus and {type = 'raw_descriptions', key = ccc_bonus.config.blind.key, set = 'Blind', vars = {}} or nil
                if ccc_bonus and ccc_bonus.name == 'The Ox' then
                	ccc_bonus_target.vars = {localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')}
                end
                local ccc_obj = ccc_bonus and ccc_bonus.config.blind or nil
                if ccc_obj and ccc_obj.loc_vars and _G['type'](ccc_obj.loc_vars) == 'function' then
                	local res = ccc_obj:loc_vars() or {}
                	ccc_bonus_target.vars = res.vars or ccc_bonus_target.vars
                	ccc_bonus_target.key = res.key or ccc_bonus_target.key
                end
                local ccc_bonus_loc_target = ccc_bonus and localize(ccc_bonus_target) or nil
                local ccc_bonus_loc_name = ccc_bonus and localize{type = 'name_text', key = ccc_bonus.config.blind.key, set = 'Blind'} or nil
                for k, v in ipairs(loc_target) do
                    self.loc_debuff_text = self.loc_debuff_text..v..(k <= #loc_target and ' ' or '')
                    self.loc_debuff_lines[k] = v
                end
            if ccc_bonus_loc_target then
            	local inv = {}
            	for i, v in ipairs(ccc_bonus_loc_target) do
            		table.insert(inv, 1, v)
            	end
            	for i, v in ipairs(inv) do
            		table.insert(self.loc_debuff_lines, 1, v)
            	end
            end
            else
                self.loc_name = ''; self.loc_debuff_text = ''
                EMPTY(self.loc_debuff_lines)
            end
        end
    end
end

function Blind:set_blind(blind, reset, silent)
    if not reset then
        self.config.prize = nil
    end
    if not reset then
        self.config.blind = blind or {}
        if G.GAME.modifiers.dungeon then
            G.GAME.hit_busted = nil
            G.GAME.hit_limit = 2
            local make_jokers = false
            for i = #G.enemy_deck.cards, 1, -1 do
                if G.enemy_deck.cards[i] and not G.enemy_deck.cards[i].removed then G.enemy_deck.cards[i]:remove() end
            end
            for i = #G.enemy_discard.cards, 1, -1 do
                if G.enemy_discard.cards[i] and not G.enemy_discard.cards[i].removed then G.enemy_discard.cards[i]:remove() end
            end
            local suits = {'H', 'S', 'D', 'C'}
            local ranks = {'2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A'}
            local cards = {}
            local power = (not G.GAME.modifiers.scaling and 1 or (G.GAME.modifiers.scaling == 1) and 1 or (G.GAME.modifiers.scaling == 2) and 1.25 or (G.GAME.modifiers.scaling == 3) and 1.5) * 10 * (1.55 ^ (G.GAME.round_resets.ante))
            local stones = 0
            if (blind and blind.name or '') == "The Goad" then
                suits = {'H', 'D', 'C'}
            elseif (blind and blind.name or '') == "The Club" then
                suits = {'H', 'D', 'S'}
            elseif (blind and blind.name or '') == "The Head" then
                suits = {'C', 'D', 'S'}
            elseif (blind and blind.name or '') == "The Window" then
                suits = {'C', 'H', 'S'}
            elseif (blind and blind.name or '') == "The Plant" then
                ranks = {'2', '3', '4', '5', '6', '7', '8', '9', 'T', 'A'}
            elseif (blind and blind.name or '') == "Violet Vessel" then
                stones = 10
            elseif (blind and blind.name or '') == "Crimson Heart" then
                suits = {'H', 'H', 'H', 'H'}
            elseif (blind and blind.name or '') == "Verdant Leaf" then
                if G.GAME.hit_bust_limit and (G.GAME.hit_bust_limit >= 31) then
                    ranks = {'8', '8', '8', '8', '8', '8', '8', '8', '8', '7', '7', '7', '7'}
                elseif G.GAME.hit_bust_limit and (G.GAME.hit_bust_limit == 20) then
                    ranks = {'7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '6', '6', '6'}
                else
                    ranks = {'7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '8', '8', '8'}
                end
                power = 0
            elseif (blind and blind.name or '') == "Amber Acorn" then
                for i = 1, 52 do
                    local rank = pseudorandom_element(ranks, pseudoseed('acorn'))
                    local suit = pseudorandom_element(suits, pseudoseed('acorn'))
                    table.insert(cards, {suit, rank, 'c_base'})
                end
                ranks = {}
                suits = {}
            end
            if (blind and blind.name or '') == "Small Blind" then
                power = power - 20
            elseif (blind and blind.name or '') == "Big Blind" then
                power = power
            elseif (blind and blind.name or '') ~= '' then
                power = power + 25
                if G.GAME.blind_on_deck == 'Boss' then
                    make_jokers = true
                end
            end
            if power < 0 then
                power = 0
            end
            for _, i in ipairs(suits) do
                for _, j in ipairs(ranks) do
                    table.insert(cards, {i, j, 'c_base'})
                end
            end
            for i = 1, stones do
                table.insert(cards, {'H', 'A', 'm_stone'})
            end
            power = power * 1
            local fails = 0
            while (power > 0) and (fails < 50) do
                local index = 1 + math.floor(#cards * pseudorandom('enemy_deck_card'))
                if cards[index] then
                    local card = cards[index]
                    local pool = {}
                    local rank_class = 1
                    if (card[2] == '3') or (card[2] == '7') or (card[2] == '8') or (card[2] == '9') then
                        rank_class = 2
                        table.insert(pool, {'rise', 4})
                    elseif (card[2] == 'T') or (card[2] == 'J') or (card[2] == 'Q') or (card[2] == 'K') or (card[2] == 'A') then
                        rank_class = 3
                        if (card[2] ~= 'A') then
                            table.insert(pool, {'bump', 2})
                        end
                    else
                        table.insert(pool, {'rise2', 8})
                    end
                    local enhancement_class = 0
                    if (card[3] == 'm_bonus') or (card[3] == 'm_mult') then
                        enhancement_class = 1
                        table.insert(pool, {'enhance2', 6})
                    elseif (card[3] == 'm_lucky') or (card[3] == 'm_glass') or (card[3] == 'm_stone') then
                        enhancement_class = 2
                    elseif (card[3] == 'c_base') then
                        table.insert(pool, {'enhance1', 3})
                    end
                    local new_pool = {}
                    for i, j in ipairs(pool) do
                        if power >= j[2] then
                            table.insert(new_pool, j)
                        end
                    end
                    pool = new_pool
                    if #pool > 0 then
                        if power >= pool[1][2] then
                            power = power - pool[1][2]
                            fails = 0
                            if pool[1][1] == 'rise' then
                                card[2] = pseudorandom_element({'3', '7', '8', '9'}, pseudoseed('power'))
                            elseif pool[1][1] == 'rise2' then
                                if (blind and blind.name or '') == "Crimson Heart" then
                                    card[2] = 'K'
                                else
                                    card[2] = pseudorandom_element({'T', 'J', 'Q', 'K', 'A'}, pseudoseed('power'))
                                end
                            elseif pool[1][1] == 'bump' then
                                if card[2] == 'T' then
                                    card[2] = 'J'
                                elseif card[2] == 'J' then
                                    card[2] = 'Q'
                                elseif card[2] == 'Q' then
                                    card[2] = 'K'
                                elseif card[2] == 'K' then
                                    card[2] = 'A'
                                end
                            elseif pool[1][1] == 'enhance1' then
                                card[3] = pseudorandom_element({'m_bonus', 'm_mult'}, pseudoseed('power'))
                            elseif pool[1][1] == 'enhance2' then
                                card[3] = pseudorandom_element({'m_lucky', 'm_glass', 'm_stone'}, pseudoseed('power'))
                            end
                        else
                            fails = fails + 1
                        end
                    else
                        fails = fails + 1
                    end
                else
                    fails = fails + 1
                end
            end
            for i = 1, #cards do
                local _card = Card(G.enemy_deck.T.x, G.enemy_deck.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[cards[i][1] .. '_' .. cards[i][2]], G.P_CENTERS[cards[i][3]], {})
                _card.ability.enemy = true
                G.enemy_deck:emplace(_card)
            end
            G.enemy_deck:shuffle('enemy_deck')
            if make_jokers then
                local keys = { 'j_stencil', 'j_loyalty_card', 'j_fibonacci', 'j_hack', 'j_hiker', 'j_bull', 'j_selzer', 'j_sock_and_buskin', 'j_smeared', 'j_throwback', 'j_bloodstone', 'j_arrowhead', 'j_onyx_agate', 'j_oops', 'j_seeing_double', 'j_bootstraps' }
                local key = pseudorandom_element(keys, pseudoseed('hit_boss_joker'))
                local joker = SMODS.create_card {set = 'Joker', no_edition = true, key = key}
                joker.ability.hit_rival = true
                joker.ability.eternal = true
                joker:set_edition('e_negative')
                joker:add_to_deck()
                joker:set_cost()
                G.jokers:emplace(joker)
            end
        end
        self.effect = type(self.config.blind.config) == "table" and copy_table(self.config.blind.config) or {}
        self.name = blind and blind.name or ''
        self.dollars = blind and blind.dollars or 0
        self.sound_pings = self.dollars + 2
        if G.GAME.modifiers.no_blind_reward and G.GAME.modifiers.no_blind_reward[self:get_type()] then self.dollars = 0 end
        if G.GAME.blind_edition and G.GAME.blind_edition[G.GAME.blind_on_deck] then
            local edi = G.P_BLIND_EDITIONS[G.GAME.blind_edition[G.GAME.blind_on_deck]]
            if edi.dollars_mod then
                if type(edi.dollars_mod) == "function" then
                    self.dollars = edi:dollars_mod(self.dollars)
                else
                    self.dollars = self.dollars + edi.dollars_mod
                end
            end
        end
        self.debuff = blind and blind.debuff or {}
        self.pos = blind and blind.pos
        self.mult = blind and blind.mult or 0
        self.disabled = false
        self.discards_sub = nil
        self.hands_sub = nil
        self.boss = blind and not not blind.boss
        self.blind_set = false
        self.triggered = nil
        self.prepped = true
        if self:get_type() == 'Small' and G.GAME.used_hagalaz then
        	if not G.GAME.reduce_small then
        		G.GAME.reduce_small = 1
        	end
        	G.GAME.reduce_small = G.GAME.reduce_small * G.GAME.used_hagalaz / 100
        	self.mult = self.mult * G.GAME.reduce_small
        end
        if self:get_type() == 'Big' and G.GAME.used_hagalaz then
        	if not G.GAME.reduce_big then
        		G.GAME.reduce_big = 1
        	end
        	G.GAME.reduce_big = G.GAME.reduce_big * G.GAME.used_hagalaz / 100
        	self.mult = self.mult * G.GAME.reduce_big
        end
        if self:get_type() == 'Boss' and G.GAME.used_hagalaz then
        	if not G.GAME.reduce_boss then
        		G.GAME.reduce_boss = 1
        	end
        	G.GAME.reduce_boss = G.GAME.reduce_boss * G.GAME.used_hagalaz / 100
        	self.mult = self.mult * G.GAME.reduce_boss
        end
        G.GAME.used_hagalaz = 100
        if G.GAME.used_dagaz and blind and blind.name then
        	for i = 1, G.GAME.used_dagaz do
                	local tag = nil
        		local type = G.GAME.blind:get_type()
        		if type == "Boss" then
        			tag = Tag(get_next_tag_key())
        		else
        			tag = Tag(G.GAME.round_resets.blind_tags[type])
        		end
        		add_tag(tag)
        	end
        	G.GAME.used_dagaz = 0
        end
        if G.GAME.used_jera then
        	self.dollars = self.dollars * G.GAME.used_jera
        end
        G.GAME.used_jera = 1
        self:set_text()

        local obj = self.config.blind
        self.children.animatedSprite = SMODS.create_sprite(self.T.x, self.T.y, self.T.w, self.T.h, obj.atlas or 'blind_chips', obj.pos or G.P_BLINDS.bl_small.pos)
        self.children.animatedSprite.states = self.states
        G.GAME.last_blind = G.GAME.last_blind or {}
        G.GAME.last_blind.boss = self.boss
        G.GAME.last_blind.name = self.name

        if blind and blind.name then
            self:change_colour()
        else
            self:change_colour(G.C.BLACK)
        end

        self.chips = get_blind_amount(G.GAME.round_resets.ante)*self.mult*G.GAME.starting_params.ante_scaling
        if (G.GAME.modifiers.ccc_bside and G.GAME.modifiers.ccc_bside >= 2) and G.GAME.ccc_bonus_blind.mult then
        	local used_mult = 2
        	used_mult = used_mult*(G.GAME.ccc_bonus_blind.mult / 2)
        	used_mult = used_mult*(self.mult / 2)
        	self.chips = get_blind_amount(G.GAME.round_resets.ante)*used_mult*G.GAME.starting_params.ante_scaling
        end
        if G.GAME.blind_edition and G.GAME.blind_edition[G.GAME.blind_on_deck] then
            local edi = G.P_BLIND_EDITIONS[G.GAME.blind_edition[G.GAME.blind_on_deck]]
            if edi.blind_size_mult then
                if type(edi.blind_size_mult) == "function" then
                    self.chips = edi.blind_size_mult(self.chips)
                    self.chips = self.chips - self.chips%(10^math.floor(math.log10(self.chips)-1))
                else
                    self.chips = edi.blind_size_mult * self.chips
                    self.chips = self.chips - self.chips%(10^math.floor(math.log10(self.chips)-1))
                end
            end
        end
        self.chips = AKYRS.mod_blind_requirement(self,self.chips)
        self.chip_text = number_format(self.chips)

        if not blind then self.chips = 0 end

        G.GAME.current_round.dollars_to_be_earned = dollars_to_string(self.dollars)
        G.HUD_blind.alignment.offset.y = -10
        G.HUD_blind:recalculate(false)

        if blind and blind.name and blind.name ~= '' then 
            self:alert_debuff(true)

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.05,
                blockable = false,
                func = (function()
                        G.HUD_blind:get_UIE_by_ID("HUD_blind_name").states.visible = false
                        G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").parent.parent.states.visible = false
                        G.HUD_blind.alignment.offset.y = 0
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        blockable = false,
                        func = (function()
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").states.visible = true
                            G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").parent.parent.states.visible = true
                            G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").config.object:pop_in(0)
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").config.object:pop_in(0)
                            local akyrs_blind_thing = G.HUD_blind:get_UIE_by_ID("akyrs_blind_attributes")
                            if akyrs_blind_thing then
                                akyrs_blind_thing.states.visible = true
                            end
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_count"):juice_up()
                            self.dissolve = 0
                            self.children.animatedSprite:set_sprite_pos(self.config.blind.pos)
                            self.blind_set = true
                            G.ROOM.jiggle = G.ROOM.jiggle + 3
                            if not reset and not silent then
                                self:juice_up()
                                if blind then play_sound('chips1', math.random()*0.1 + 0.55, 0.42);play_sound('gold_seal', math.random()*0.1 + 1.85, 0.26)--play_sound('cancel')
                                end
                            end
                            return true
                        end)
                    }))
                    return true
                end)
            }))
        end


        self.config.h_popup_config ={align="tm", offset = {x=0,y=-0.1},parent = self}
    end

    if blind then
        self.in_blind = true
    end
    local obj = self.config.blind
    if self.name == 'The Eye' and not reset then
    	obj = G.P_BLINDS['bl_small']	-- nuke obj to avoid smods ownership
    	self.hands = {}
    	for _, v in ipairs(G.handlist) do
    		self.hands[v] = false
    	end
    end
    if not reset and obj.set_blind and type(obj.set_blind) == 'function' then
        obj:set_blind()
    
    elseif self.name == 'The Mouth' and not reset then
        self.only_hand = false
    elseif self.name == 'The Fish' and not reset then 
        self.prepped = nil
    elseif self.name == 'The Water' and not reset then 
        self.discards_sub = G.GAME.current_round.discards_left
        ease_discard(-self.discards_sub)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                if G.GAME.current_round.discards_left < 0 then
                    G.GAME.current_round.discards_left = 1
                end
                return true
            end
        }))
    elseif self.name == 'The Needle' and not reset then 
        self.hands_sub = G.GAME.round_resets.hands - 1
        ease_hands_played(-self.hands_sub)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                if G.GAME.current_round.hands_left < 1 then
                    G.GAME.current_round.hands_left = 1
                end
                return true
            end
        }))
    elseif self.name == 'The Manacle' and not reset then
        G.hand:change_size(-1)
    elseif self.name == 'Amber Acorn' and not reset and #G.jokers.cards > 0 then
        G.jokers:unhighlight_all()
        for k, v in ipairs(G.jokers.cards) do
            v:flip()
        end
        if #G.jokers.cards > 1 then 
            G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.2, func = function() 
                G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 0.85);return true end })) 
                delay(0.15)
                G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1.15);return true end })) 
                delay(0.15)
                G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1);return true end })) 
                delay(0.5)
            return true end })) 
        end
    end

    if G.GAME.blind_edition and G.GAME.blind_edition[G.GAME.blind_on_deck] and not reset and (blind and blind.name and blind.name ~= '') then
        local edi = G.P_BLIND_EDITIONS[G.GAME.blind_edition[G.GAME.blind_on_deck]]
        if edi.set_blind and (type(edi.set_blind) == "function") then
            edi:set_blind(G.GAME.blind_on_deck)
        end
    end
    --add new debuffs
    for _, v in ipairs(G.Bakery_charm_area.cards) do
        self:debuff_card(v)
    end
    for _, v in ipairs(G.playing_cards) do
        self:debuff_card(v)
    end
    for _, v in ipairs(G.jokers.cards) do
        if not reset then self:debuff_card(v, true) end
    end

    G.ARGS.spin.real = (G.SETTINGS.reduced_motion and 0 or 1)*(self.config.blind.boss and (self.config.blind.boss.showdown and 0.5 or 0.25) or 0)
end

function Blind:alert_debuff(first)
    if self.loc_debuff_text and self.loc_debuff_text ~= '' then 
        self.block_play = true
        G.E_MANAGER:add_event(Event({
            blockable = false,
            blocking = false,
            func = (function()
                if self.disabled then self.block_play = nil; return true end
                if G.STATE == G.STATES.SELECTING_HAND then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = G.SETTINGS.GAMESPEED*0.05,
                        blockable = false,
                        func = (function()
                                if self ~= G.GAME.ccc_bonus_blind then
                                	play_sound('whoosh1', 0.55, 0.62)
                                end
                                for i = 1, 4 do
                                    local wait_time = (0.1*(i-1))
                                    G.E_MANAGER:add_event(Event({ blockable = false, trigger = 'after', delay = G.SETTINGS.GAMESPEED*wait_time,
                                    func = function()
                                        if i == 1 then self:juice_up() end
                                        if self ~= G.GAME.ccc_bonus_blind then
                                        	play_sound('cancel', 0.7 + 0.05*i, 0.7)
                                        end
                                        return true end }))  
                                end
                                local hold_time = G.SETTINGS.GAMESPEED*(#self.loc_debuff_text*0.035 + 1.3)
                                local disp_text = self:get_loc_debuff_text()
                                attention_text({
                                    scale = 0.7, text = disp_text, maxw = 12, hold = hold_time, align = 'cm', offset = {x = 0,y = (self == G.GAME.ccc_bonus_blind) and -1.8 or -1},major = G.play
                                })
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 1,
                                    blocking = false,
                                    blockable = false,
                                    func = (function()
                                        self.block_play = nil
                                        if G.buttons then
                                            local _buttons = G.buttons:get_UIE_by_ID('play_button')
                                            _buttons.disable_button = nil
                                        end
                                        return true
                                    end)
                                }))
                                return true
                            end)
                        }))
                    return true
                end
            end)
        })) 
    end
end

function Blind:get_loc_debuff_text()
    local obj = self.config.blind
    if obj.get_loc_debuff_text and type(obj.get_loc_debuff_text) == 'function' then
        return obj:get_loc_debuff_text()
    end
    local disp_text = (self.config.blind.name == 'The Wheel' and G.GAME.probabilities.normal or '')..self.loc_debuff_text
    if (self.config.blind.name == 'The Mouth') and self.only_hand then disp_text = disp_text..' ['..localize(self.only_hand, 'poker_hands')..']' end
    return disp_text
end

function Blind:defeat(silent)
   if G.GAME.blind_edition and G.GAME.blind_edition[G.GAME.blind_on_deck] then
        local edi = G.P_BLIND_EDITIONS[G.GAME.blind_edition[G.GAME.blind_on_deck]]
        if edi.defeat and (type(edi.defeat) == "function") then
            edi:defeat(G.GAME.blind_on_deck)
        end
    end
    local dissolve_time = 1.3
    local extra_time = 0
    self.dissolve = 0
    self.dissolve_colours = {G.C.BLACK, G.C.RED}
    self:juice_up()
    self.children.particles = Particles(0, 0, 0,0, {
        timer_type = 'TOTAL',
        timer = 0.01*dissolve_time,
        scale = 0.1,
        speed = 1.5,
        lifespan = 0.7*dissolve_time,
        attach = self,
        colours = self.dissolve_colours,
        fill = true
    })

    local blind_name_dynatext = G.HUD_blind:get_UIE_by_ID('HUD_blind_name').config.object
    blind_name_dynatext:pop_out(2)

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  0.5*dissolve_time,
        func = (function() self.children.particles.max = 0 return true end)
    }))
    if not silent then 
        for i = 1, math.min(self.sound_pings or 3, 7) do
            extra_time = extra_time + (0.4+0.15*i)*dissolve_time
            G.E_MANAGER:add_event(Event({ blockable = false, trigger = 'after', delay = (0.15 - 0.01*(self.sound_pings or 3))*i*dissolve_time,
            func = function()
                play_sound('cancel', 0.8 - 0.05*i, 1.7)
                if i == math.min((self.sound_pings or 3)+1, 6) then play_sound('whoosh2', 0.7, 0.42) end
                return true end }))  
        end
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'ease',
        blockable = false,
        ref_table = self,
        ref_value = 'dissolve',
        ease_to = 1,
        delay =  0.7*dissolve_time,
        func = (function(t) return t end)
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  0.8*dissolve_time,
        func = (function()
            G.HUD_blind.alignment.offset.y = -10
            return true
        end)
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  0.95*dissolve_time,
        func = (function()
            self.dissolve = nil
            self:set_blind(nil, nil, true) return true end)
    }))
    for k, v in ipairs(G.jokers.cards) do
        if v.facing == 'back' then v:flip() end
    end
    local obj = self.config.blind
    if obj.defeat and type(obj.defeat) == 'function' then
        obj:defeat()
    elseif self.name == 'Crimson Heart' then
        for _, v in ipairs(G.jokers.cards) do
            v.ability.crimson_heart_chosen = nil
        end
    elseif self.name == 'The Manacle' and not self.disabled then
        G.hand:change_size(1)
    end
end

function Blind:get_type()
if G.GAME.modifiers.all_boss then
    if G.GAME.blind.config.blind.key == G.GAME.round_resets.blind_choices.Small then
        return 'Small'
    elseif G.GAME.blind.config.blind.key == G.GAME.round_resets.blind_choices.Big then
        return 'Big'
    else
        return  'Boss'
    end
end
    if self.name == "Small Blind" then
        return 'Small'
    elseif self.name == "The Dealer" then
        return 'Dungeon'
    elseif self.name == "Big Blind" then 
        return 'Big'
    elseif self.name == "Bigger Blind" then 
      return 'Small' 
    elseif self.config.prize then
        return 'Additional'
    elseif self.name and self.name ~= '' then
        return 'Boss'
    end
end

function Blind:disable()
if self ~= G.GAME.ccc_bonus_blind and G.GAME.ccc_bonus_blind.config.blind then 
	G.GAME.ccc_bonus_blind:disable() 
end
    self.disabled = true
    for k, v in ipairs(G.jokers.cards) do
        if v.facing == 'back' then v:flip() end
    end
    local obj = self.config.blind
    if obj.disable and type(obj.disable) == 'function' then
        obj:disable()
    elseif self.name == 'Crimson Heart' then
        for _, v in ipairs(G.jokers.cards) do
            v.ability.crimson_heart_chosen = nil
        end
    elseif self.name == 'The Water' then 
        ease_discard(self.discards_sub)
    elseif self.name == 'The Wheel' or self.name == 'The House' or self.name == 'The Mark' or self.name == 'The Fish' then 
        for i = 1, #G.hand.cards do
            if G.hand.cards[i].facing == 'back' then
                G.hand.cards[i]:flip()
            end
        end
        for k, v in pairs(G.playing_cards) do
            v.ability.wheel_flipped = nil
        end
    elseif self.name == 'The Needle' then 
        ease_hands_played(self.hands_sub)
    elseif self.name == 'The Wall' then 
        self.chips = self.chips/2
        self.chip_text = number_format(self.chips)
    elseif self.name == 'Cerulean Bell' then 
        for k, v in ipairs(G.playing_cards) do
            v.ability.forced_selection = nil
        end
    elseif self.name == 'The Manacle' then 
        G.hand:change_size(1)
    elseif self.name == 'The Serpent' then
    elseif self.name == 'Violet Vessel' then 
        self.chips = self.chips/3
        self.chip_text = number_format(self.chips)
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
        if self.boss and G.GAME.chips - G.GAME.blind.chips >= 0 then
            G.STATE = G.STATES.NEW_ROUND
            G.STATE_COMPLETE = false
        end
        return true
    end
    }))
    for _, v in ipairs(G.playing_cards) do
        self:debuff_card(v)
    end
    for _, v in ipairs(G.jokers.cards) do
        self:debuff_card(v)
    end
    if self:get_type() == 'Small' and G.GAME.used_hagalaz then
    	if not G.GAME.reduce_small then
    		G.GAME.reduce_small = 1
    	end
    	G.GAME.reduce_small = G.GAME.reduce_small * G.GAME.used_hagalaz / 100
    	self.mult = self.mult * G.GAME.reduce_small
    end
    if self:get_type() == 'Big' and G.GAME.used_hagalaz then
    	if not G.GAME.reduce_big then
    		G.GAME.reduce_big = 1
    	end
    	G.GAME.reduce_big = G.GAME.reduce_big * G.GAME.used_hagalaz / 100
    	self.mult = self.mult * G.GAME.reduce_big
    end
    if self:get_type() == 'Boss' and G.GAME.used_hagalaz then
    	if not G.GAME.reduce_boss then
    		G.GAME.reduce_boss = 1
    	end
    	G.GAME.reduce_boss = G.GAME.reduce_boss * G.GAME.used_hagalaz / 100
    	self.mult = self.mult * G.GAME.reduce_boss
    end
    G.GAME.used_hagalaz = 100
    if G.GAME.used_dagaz and blind and blind.name then
    	for i = 1, G.GAME.used_dagaz do
            	local tag = nil
    		local type = G.GAME.blind:get_type()
    		if type == "Boss" then
    			tag = Tag(get_next_tag_key())
    		else
    			tag = Tag(G.GAME.round_resets.blind_tags[type])
    		end
    		add_tag(tag)
    	end
    	G.GAME.used_dagaz = 0
    end
    if G.GAME.used_jera then
    	self.dollars = self.dollars * G.GAME.used_jera
    end
    G.GAME.used_jera = 1
    self:set_text()
    self:wiggle()
end

function Blind:wiggle()
    self.children.animatedSprite:juice_up(0.3)
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
        play_sound('tarot2', 0.76, 0.4);return true end}))
    play_sound('tarot2', 1, 0.4)
end

function Blind:juice_up(_a, _b)
    self.children.animatedSprite:juice_up(_a or 0.2, _b or 0.2)
end

function Blind:hover()
    if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then 
        if not self.hovering  and self.states.visible and self.children.animatedSprite.states.visible then
            self.hovering = true
            self.hover_tilt = 2
            self.children.animatedSprite:juice_up(0.05, 0.02)
            play_sound('chips1', math.random()*0.1 + 0.55, 0.12)
            Node.hover(self)
        end
    end
end

function Blind:stop_hover()
    self.hovering = false
    self.hover_tilt = 0
    Node.stop_hover(self)
end

function Blind:draw()
    if not self.states.visible then return end
    self.tilt_var = self.tilt_var or {}
    self.tilt_var.mx, self.tilt_var.my =G.CONTROLLER.cursor_position.x,G.CONTROLLER.cursor_position.y

    self.children.animatedSprite.role.draw_major = self
    self.children.animatedSprite:draw_shader('dissolve', 0.1)
    self.children.animatedSprite:draw_shader('dissolve')    
    if G.GAME.blind_edition and G.GAME.blind_edition[G.GAME.blind_on_deck] then
        local edi = G.P_BLIND_EDITIONS[G.GAME.blind_edition[G.GAME.blind_on_deck]]
        if edi.blind_shader and (type(edi.blind_shader) == "table") then
            for i2, j2 in ipairs(edi.blind_shader) do
                self.children.animatedSprite:draw_shader(j2)
            end
        elseif edi.blind_shader then
            self.children.animatedSprite:draw_shader(edi.blind_shader)
        end
    end

    for k, v in pairs(self.children) do 
        if k ~= 'animatedSprite' then
            v.VT.scale = self.VT.scale
            v:draw()
        end
    end
    add_to_drawhash(self)
end

function Blind:press_play()
    if self.disabled then return end
    local obj = self.config.blind
    if obj.press_play and type(obj.press_play) == 'function' then
        return obj:press_play()
    elseif self.name == 'The Hook' then
        G.E_MANAGER:add_event(Event({ func = function()
            local any_selected = nil
            local _cards = {}
            for k, v in ipairs(G.hand.cards) do
                _cards[#_cards+1] = v
            end
            for i = 1, 2 do
                if G.hand.cards[i] then 
                    local selected_card, card_key = pseudorandom_element(_cards, pseudoseed('hook'))
                    G.hand:add_to_highlighted(selected_card, true)
                    table.remove(_cards, card_key)
                    any_selected = true
                    play_sound('card1', 1)
                end
            end
            if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
        return true end })) 
        self.triggered = true
        delay(0.7)
        return true
    elseif self.name == 'Crimson Heart' then 
        if G.jokers.cards[1] then
            self.triggered = true
            self.prepped = true
        end
    elseif self.name == 'The Fish' then
        self.prepped = true
    elseif self.name == 'The Tooth' then
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
        for i = 1, #G.play.cards do
            G.E_MANAGER:add_event(Event({func = function() G.play.cards[i]:juice_up(); return true end })) 
            ease_dollars(-1)
            delay(0.23)
        end
        return true end })) 
        self.triggered = true
        return true
    end
end

function Blind:modify_hand(cards, poker_hands, text, mult, hand_chips, scoring_hand)
    if self.disabled then return mult, hand_chips, false end
    local obj = self.config.blind
    if obj.modify_hand and type(obj.modify_hand) == 'function' then
        return obj:modify_hand(cards, poker_hands, text, mult, hand_chips)
    elseif self.name == 'The Flint' then
        self.triggered = true
        return math.max(math.floor(mult*0.5 + 0.5), 1), math.max(math.floor(hand_chips*0.5 + 0.5), 0), true
    end
    return mult, hand_chips, false
end

function Blind:debuff_hand(cards, hand, handname, check)
    if self.disabled then return end
    local obj = self.config.blind
    if obj.debuff_hand and type(obj.debuff_hand) == 'function' then
        return obj:debuff_hand(cards, hand, handname, check)
    end
    if self.debuff then
        self.triggered = false
        if self.debuff.hand and next(hand[self.debuff.hand]) then
            self.triggered = true
            return true
        end
        if self.debuff.h_size_ge and #cards < self.debuff.h_size_ge then
            self.triggered = true
            return true
        end
        if self.debuff.h_size_le and #cards > self.debuff.h_size_le then
            self.triggered = true
            return true
        end
        if self.name == 'The Eye' then
            if self.hands[handname] then
                self.triggered = true
                return true
            end
            if not check then self.hands[handname] = true end
        elseif self.name == 'The Mouth' then
            if self.only_hand and self.only_hand ~= handname then
                self.triggered = true
                return true
            end
            if not check then self.only_hand = handname end
        end
    end
    if (self.name == 'The Arm') and ((G.GAME.negate_hand or 1) >= 0) then
        self.triggered = false
        if G.GAME.hands[handname].level > 1 then
            self.triggered = true
            if not check then
                level_up_hand(self.children.animatedSprite, handname, nil, -1)
                self:wiggle()
            end
        end 
    elseif (self.name == 'The Ox') and ((G.GAME.negate_hand or 1) >= 0) then
        self.triggered = false
        if handname == G.GAME.current_round.most_played_poker_hand then
            self.triggered = true
            if not check then
                ease_dollars(-G.GAME.dollars, true)
                self:wiggle()
            end
        end 
    end
end

function Blind:drawn_to_hand()
if self ~= G.GAME.ccc_bonus_blind and G.GAME.ccc_bonus_blind.config.blind then
	G.GAME.ccc_bonus_blind:drawn_to_hand()
end
   if G.GAME.modifiers.dungeon then
        G.GAME.negate_hand = nil
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff()
        end
        check_total_over_21()
        if ((#G.deck.cards == 0) and (#G.hand.cards == 0)) and not (G.GAME.hit_reshuffle_deck and (#G.discard.cards >= 0)) then
            end_round()
        else
            if hit_post_hit_func then
                G.STATE = G.STATES.DRAW_TO_HAND
                G.STATE_COMPLETE = false
                delay(0.5)
                hit_post_hit_func()
                hit_post_hit_func = nil
            elseif G.GAME.forced_stand then
                G.GAME.forced_stand = nil
                G.GAME.blind:set_text()
                G.GAME.blind:wiggle()
                G.FUNCS.stand()
                G.STATE = G.STATES.HAND_PLAYED
                G.STATE_COMPLETE = true
            end
        end
        G.GAME.last_round_drawn = G.GAME.round
    end
if next(SMODS.find_card('j_ccc_theocrystal')) then
	local count = #SMODS.find_card('j_ccc_theocrystal')
	if self.name == 'Cerulean Bell' and not self.disabled then
		count = count + 1
	end
	local temp_hand = {}
	
	G.hand:unhighlight_all()
	
	for k, v in ipairs(G.hand.cards) do 
		if v.ability.forced_selection then
			count = math.max(0, count - 1)
		else
			temp_hand[#temp_hand+1] = v
		end
	end
	table.sort(temp_hand, function(a, b)
		if (not a.playing_card) and (not b.playing_card) then
			return false  -- consider them equal
		elseif (not a.playing_card) then
			return false
		elseif (not b.playing_card) then
			return true
		else
			return a.playing_card < b.playing_card
		end
	end)
	pseudoshuffle(temp_hand, pseudoseed('theocrystal'))
	
	local count = math.min(5, math.min(#temp_hand, count))
	for i = 1, count do
		local forced_card = table.remove(temp_hand, 1)
		forced_card.ability.forced_selection = true
		G.hand:add_to_highlighted(forced_card)
	end
end
    if not self.disabled then
        local obj = self.config.blind
        if obj.drawn_to_hand and type(obj.drawn_to_hand) == 'function' then
            obj:drawn_to_hand()
        elseif self.name == 'Cerulean Bell' then
            local any_forced = nil
            for k, v in ipairs(G.hand.cards) do
                if v.ability.forced_selection then
                    any_forced = true
                end
            end
            if not any_forced then 
                G.hand:unhighlight_all()
                local forced_card = pseudorandom_element(G.hand.cards, pseudoseed('cerulean_bell'))
                forced_card.ability.forced_selection = true
                G.hand:add_to_highlighted(forced_card)
            end
        elseif self.name == 'Crimson Heart' and self.prepped and G.jokers.cards[1] then
            local prev_chosen_set = {}
            local fallback_jokers = {}
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.crimson_heart_chosen then
                    prev_chosen_set[G.jokers.cards[i]] = true
                    G.jokers.cards[i].ability.crimson_heart_chosen = nil
                    if G.jokers.cards[i].debuff then SMODS.recalc_debuff(G.jokers.cards[i]) end
                end
            end
            for i = 1, #G.jokers.cards do
                if not G.jokers.cards[i].debuff then
                    if not prev_chosen_set[G.jokers.cards[i]] then
                        jokers[#jokers+1] = G.jokers.cards[i]
                    end
                    table.insert(fallback_jokers, G.jokers.cards[i])
                end
            end
            if #jokers == 0 then jokers = fallback_jokers end 
            local _card = pseudorandom_element(jokers, pseudoseed('crimson_heart'))
            if _card then
                _card.ability.crimson_heart_chosen = true
                SMODS.recalc_debuff(_card)
                if _card.facing == "front" then
                	_card:juice_up()
                end
                self:wiggle()
            end
        end
    end
    self.prepped = nil
end

function Blind:stay_flipped(area, card, from_area)
if self ~= G.GAME.ccc_bonus_blind and G.GAME.ccc_bonus_blind.config.blind then
	local ret = G.GAME.ccc_bonus_blind:stay_flipped(area, card, from_area)
	if ret then return ret end
end
    if not self.disabled then
        local obj = self.config.blind
        if obj.stay_flipped and type(obj.stay_flipped) == 'function' then
            return obj:stay_flipped(area, card, from_area)
        end
        if area == G.hand then
            if self.name == 'The Wheel' and SMODS.pseudorandom_probability(self, pseudoseed('wheel'), 1, 7, 'wheel') then
                return true
            elseif self.name == 'The House' and G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 then
                return true
            elseif self.name == 'The Mark' and card:is_face(true) then
                return true
            elseif self.name == 'The Fish' and self.prepped then 
                return true
            end
        end
    end
end

function Blind:debuff_card(card, from_blind)
if self ~= G.GAME.ccc_bonus_blind and G.GAME.ccc_bonus_blind.config.blind then
	card.debuff = false
	G.GAME.ccc_bonus_blind:debuff_card(card, from_blind)
	if card.debuff then return end
end
    local obj = self.config.blind
    if not self.disabled and obj.recalc_debuff and type(obj.recalc_debuff) == 'function' then
        if obj:recalc_debuff(card, from_blind) then
            card:set_debuff(true)
            if card.debuff then card.debuffed_by_blind = true end
        else
            card:set_debuff(false)
        end
        return
    elseif not self.disabled and obj.debuff_card and type(obj.debuff_card) == 'function' then
        sendWarnMessage(("Blind object %s has debuff_card function, recalc_debuff is preferred"):format(obj.key), obj.set)
        if obj:debuff_card(card, from_blind) then
            card:set_debuff(true)
            if card.debuff then card.debuffed_by_blind = true end
        else
            card:set_debuff(false)
        end
        return
    end
    if self.debuff and not self.disabled and card.playing_card then
        if self.debuff.suit and card:is_suit(self.debuff.suit, true) then
            card:set_debuff(true)
            if card.debuff then card.debuffed_by_blind = true end
            return
        end
        if self.debuff.is_face =='face' and card:is_face(true) then
            card:set_debuff(true)
            if card.debuff then card.debuffed_by_blind = true end
            return
        end
        if self.name == 'The Pillar' and card.ability.played_this_ante then
            card:set_debuff(true)
            if card.debuff then card.debuffed_by_blind = true end
            return
        end
        if self.debuff.value and self.debuff.value == card.base.value then
            card:set_debuff(true)
            if card.debuff then card.debuffed_by_blind = true end
            return
        end
        if self.debuff.nominal and self.debuff.nominal == card.base.nominal then
            card:set_debuff(true)
            if card.debuff then card.debuffed_by_blind = true end
            return
        end
    end
    if self.name == 'Crimson Heart' and not self.disabled and card.area == G.jokers then 
        if card.ability.crimson_heart_chosen then
            card:set_debuff(true);
            if card.debuff then card.debuffed_by_blind = true end
            return
        end
    elseif self.name == 'Verdant Leaf' and not self.disabled and card.playing_card then card:set_debuff(true); if card.debuff then card.debuffed_by_blind = true end; return end
    card:set_debuff(false)
end

function Blind:move(dt)
    Moveable.move(self, dt)
    self:align()
end

function Blind:change_dim(w, h)
    self.T.w = w or self.T.w
    self.T.h = h or self.T.h
    self.children.animatedSprite.T.w = w or self.T.w
    self.children.animatedSprite.T.h = h or self.T.h
    self.children.animatedSprite:rescale()
end

function Blind:align()
    for k, v in pairs(self.children) do
        if k == 'animatedSprite' then
            if not v.states.drag.is then
            v.T.r = 0.02*math.sin(2*G.TIMERS.REAL+self.T.x)
            v.T.y = self.T.y + 0.03*math.sin(0.666*G.TIMERS.REAL+self.T.x)
            self.shadow_height = 0.1 - (0.04 + 0.03*math.sin(0.666*G.TIMERS.REAL+self.T.x))
            v.T.x = self.T.x + 0.03*math.sin(0.436*G.TIMERS.REAL+self.T.x)
            end
        else
            v.T.x = self.T.x
            v.T.y = self.T.y
            v.T.r = self.T.r
        end
    end
end

function Blind:save()
    local blindTable = {
        in_blind = self.in_blind,
    effect = self.effect,
        name = self.name,
        dollars = self.dollars,
        debuff = self.debuff,
        pos = self.pos,
        mult = self.mult,
        disabled = self.disabled,
        discards_sub = self.discards_sub,
        hands_sub = self.hands_sub,
        boss = self.boss,
        config_blind = '',
        chips = self.chips,
        chip_text =self.chip_text,
        hands = self.hands,
        hits = self.hits,
        only_hand = self.only_hand,
        triggered = self.triggered
    }

    for k, v in pairs(G.P_BLINDS) do
        if v and v.name and v.name == blindTable.name then
            blindTable.config_blind = k
        end
    end

    blindTable.prize = self.config.prize

    blindTable.dbsk = self.debuffed_skills or {}
        
    return blindTable
end

function Blind:load(blindTable)
self.debuffed_skills = blindTable.dbsk or {}

    self.config.prize = blindTable.prize
    self.in_blind = blindTable.in_blind
self.effect = blindTable.effect
    self.config.blind = G.P_BLINDS[blindTable.config_blind] or {}
    
    self.name = blindTable.name
    self.dollars = blindTable.dollars
    self.debuff = blindTable.debuff
    self.pos = blindTable.pos
    self.mult = blindTable.mult
    self.disabled = blindTable.disabled
    self.discards_sub = blindTable.discards_sub
    self.hands_sub = blindTable.hands_sub
    self.boss = blindTable.boss
    self.chips = blindTable.chips
    self.chip_text = blindTable.chip_text
    self.hands = blindTable.hands
    self.only_hand = blindTable.only_hand
    self.triggered = blindTable.triggered
    self.hits = blindTable.hits

    G.ARGS.spin.real = (G.SETTINGS.reduced_motion and 0 or 1)*(self.config.blind.boss and (self.config.blind.boss.showdown and 1 or 0.3) or 0)

    if G.P_BLINDS[blindTable.config_blind] then
    if self.config.blind.atlas then
        self.children.animatedSprite.atlas = SMODS.get_atlas(self.config.blind.atlas)
    end
        self.blind_set = true
        self.children.animatedSprite.states.visible = true
        self.children.animatedSprite:set_sprite_pos(self.config.blind.pos)
        self.children.animatedSprite:juice_up(0.3)
        self:align()
        self.children.animatedSprite:hard_set_VT()
    else
        self.children.animatedSprite.states.visible = false
    end

    self.children.animatedSprite.states = self.states
    self:change_colour()
    if self.dollars and (self.dollars > 0) then
        G.GAME.current_round.dollars_to_be_earned = string.rep(localize('$'), self.dollars)..''
        G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").config.object:pop_in(0)
    end
    if G.GAME.blind.name and G.GAME.blind.name ~= '' then
        G.HUD_blind.alignment.offset.y = 0
    end
    if self:get_type() == 'Small' and G.GAME.used_hagalaz then
    	if not G.GAME.reduce_small then
    		G.GAME.reduce_small = 1
    	end
    	G.GAME.reduce_small = G.GAME.reduce_small * G.GAME.used_hagalaz / 100
    	self.mult = self.mult * G.GAME.reduce_small
    end
    if self:get_type() == 'Big' and G.GAME.used_hagalaz then
    	if not G.GAME.reduce_big then
    		G.GAME.reduce_big = 1
    	end
    	G.GAME.reduce_big = G.GAME.reduce_big * G.GAME.used_hagalaz / 100
    	self.mult = self.mult * G.GAME.reduce_big
    end
    if self:get_type() == 'Boss' and G.GAME.used_hagalaz then
    	if not G.GAME.reduce_boss then
    		G.GAME.reduce_boss = 1
    	end
    	G.GAME.reduce_boss = G.GAME.reduce_boss * G.GAME.used_hagalaz / 100
    	self.mult = self.mult * G.GAME.reduce_boss
    end
    G.GAME.used_hagalaz = 100
    if G.GAME.used_dagaz and blind and blind.name then
    	for i = 1, G.GAME.used_dagaz do
            	local tag = nil
    		local type = G.GAME.blind:get_type()
    		if type == "Boss" then
    			tag = Tag(get_next_tag_key())
    		else
    			tag = Tag(G.GAME.round_resets.blind_tags[type])
    		end
    		add_tag(tag)
    	end
    	G.GAME.used_dagaz = 0
    end
    if G.GAME.used_jera then
    	self.dollars = self.dollars * G.GAME.used_jera
    end
    G.GAME.used_jera = 1
    self:set_text()
end

--- STEAMODDED HEADER
--- MOD_NAME: Warp Zone!
--- MOD_ID: Wzone
--- MOD_AUTHOR: [Freh]
--- MOD_DESCRIPTION: Adds interesting and unique jokers based on references.
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]
--- BADGE_COLOR: c9052b
--- PREFIX: Wzon
----------------------------------------------
------------MOD CODE -------------------------

-- Creates an atlas for cards to use
SMODS.Atlas {
    -- Key for code to find it with
    key = "Wzone",
    -- The name of the file, for the code to pull the atlas from
    path = "jokers.png",
    -- Width of each sprite in 1x size
    px = 71,
    -- Height of each sprite in 1x size
    py = 95
}
SMODS.Atlas {key = "modicon", path = "wzicon.png", px = 32, py = 32}
SMODS.Atlas({key = 'guestapp', path = 'guest.png', px = 71, py = 95})
SMODS.Atlas({key = 'disco', path = 'disco.png', px = 71, py = 95})
SMODS.Atlas({key = 'enhancers', path = 'enhancers.png', px = 71, py = 95})
SMODS.Atlas({key = 'stickers', path = 'stickers.png', px = 71, py = 95})
SMODS.Atlas({key = 'forbidden', path = 'forbidden.png', px = 71, py = 95})
SMODS.Atlas({key = 'jimbosuit', path = 'jimbosuit.png', px = 18, py = 18})
SMODS.Atlas({key = 'serialized', path = 'serialized.png', px = 71, py = 95})
SMODS.Atlas({key = 'cbeasts', path = 'cbeasts.png', px = 71, py = 95})
SMODS.Atlas({key = 'pokermon', path = 'compat/pokermon.png', px = 71, py = 95})
SMODS.Atlas({key = 'tarots', path = 'tarots.png', px = 71, py = 95})
SMODS.Atlas({key = 'planeswalker', path = 'planeswalker.png', px = 71, py = 95})

SMODS.Joker {
    key = "aluber",
    name = "Aluber the Jester",
    atlas = 'Wzone',
    loc_txt = {
        name = "Aluber the Jester",
        text = {
            "you shouldn't be reading this"
        }
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 2,
    config = {
        transform = 0,
		fullblind = 0,
		extra = { 
            chips = 25,
            mult = 20
        },
    },
    loc_vars = function(self, info_queue, card)
        if card.ability.transform == 0 then
            info_queue[#info_queue+1] = { set = 'Other', key = 'masquerade_reminder', specific_vars = {card.ability.extra.chips,card.ability.extra.mult} }
            return {
                key = 'aluberbase', set = 'Joker'
            }
        else
            return {
                vars = {card.ability.extra.chips,card.ability.extra.mult},
                key = 'masquerade', set = 'Joker',
            }
        end
    end,
    pos = { x = 0, y = 0 },
    cost = 8,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.transform == 1 then
            SMODS.calculate_effect({
                message = localize { type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips,
                colour = G.C.CHIPS
            }, context.blueprint_card or card)
            SMODS.calculate_effect({
                message = localize { type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
                mult_mod = card.ability.extra.mult, 
                colour = G.C.MULT
            }, context.blueprint_card or card)
        end
		
		if context.setting_blind then
			card.ability.fullblind = G.GAME.blind.chips
		end
		
        if context.first_hand_drawn and card.ability.transform == 0 and not context.blueprint then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end

        if context.discard and card.ability.transform == 0 and not context.blueprint then
            if G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 then
                card:flip()
                card.ability.transform = 1
                card:flip()
                return {
                    message = "Transform",
                    delay = 0.45, 
                    remove = true,
                    card = card
                }
            end
        end
        if context.individual then
            if context.cardarea == G.play and card.ability.transform == 1 then
			local to_juice
				if context.blueprint then
					to_juice = context.blueprint_card
				else
					to_juice = card
				end
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips - ( card.ability.fullblind * 0.008))
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    
                    local chips_UI = G.hand_text_area.blind_chips
                    G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                    G.HUD_blind:recalculate() 
                    chips_UI:juice_up()
					to_juice:juice_up()
                    if not silent then play_sound('chips2') end
                    return true end }))
            end
        end

        if context.end_of_round and card.ability.transform == 1 and not context.blueprint then
            card:flip()
            card.ability.transform = 0
            card:flip()
            return {
                message = "Transform"
            }
        end
    end,

    update = function(self, card)
        if card.ability.transform == 1 then
            card.children.center:set_sprite_pos({x=1, y=0})
        else
            card.children.center:set_sprite_pos({x=0, y=0})
        end
    end
}
SMODS.Joker {
    key = "meatboy",
    name = "Meat Boy",
    atlas = 'Wzone',
    loc_txt = {
        name = "Meat Boy",
        text = {
            "{C:mult}+#1#{} Mult per hand played", 
            "without beating the blind",
            "{C:inactive}(currently {C:mult}+#2# {C:inactive}Mult){}"
        }
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 1,
    config = {
		increase = 1,
        mult = 0,
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.increase,card.ability.mult}
        }
    end,
    pos = { x = 2, y = 0 },
    cost = 5,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.mult > 0 then
            return {
                mult_mod = card.ability.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.mult } }
            }
        end
        
        if context.after and context.cardarea == G.jokers and not context.blueprint then
		    if(to_big(G.GAME.chips) + (to_big(hand_chips) * to_big(mult)) < G.GAME.blind.chips) then
                card.ability.mult = card.ability.mult + card.ability.increase
                return {
                    message = "+" .. tostring(card.ability.mult) .. " Mult",
                    card = card
                }
			end
        end
    end
}
SMODS.Joker {
    key = "malganis",
    name = "Big Scary Demon",
    atlas = 'Wzone',
    loc_txt = {
        name = "Big Scary Demon",
        text = {
            "You cannot die", 
            "{C:green}#1# in #2#{} chance to",
            "turn into a turtle",
			"at end of round"
        }
    },
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = false,
    rarity = 2,
    config = {
        turtle = false,
		turtleodds = 2
    },
    loc_vars = function(self, info_queue, card)
	    if not card.ability.turtle then
			return {
				vars = {G.GAME.probabilities.normal,card.ability.turtleodds}
			}
		else
			return {
				{vars = {G.GAME.probabilities.normal,card.ability.turtleodds}},
				key = 'turtle', set = 'Joker'
				}
		end
    end,
    pos = { x = 3, y = 0 },
    cost = 5,
    calculate = function(self, card, context)
		if context.blueprint then return end
        if context.game_over and not card.ability.turtle then
		    if pseudorandom('malganis') < G.GAME.probabilities.normal / card.ability.turtleodds then
			    card:flip()
				card.ability.turtle = true
				card:flip()
				return {
                    message = "Turtle",
					saved = true,
                    delay = 0.45,
                    card = card,
                }
			else
            return {
                        message = "Safe",
                        saved = true,
                        colour = G.C.RED
                    }
			end
        end
        
        if context.end_of_round and not context.repetition and context.game_over == false and not card.ability.turtle then
		    if pseudorandom('malganis') < G.GAME.probabilities.normal / 2 then
			    card:flip()
				card.ability.turtle = true
				card:flip()
                return {
                    message = "Turtle",
                    delay = 0.45,
                    card = card,
                }
			else
			    return {
                    message = "Safe",
                    delay = 0.45,
                    card = card,
                }
			end
	    end	
    end,
	update = function(self, card)
        if card.ability.turtle then
            card.children.center:set_sprite_pos({x=4, y=0})
        else
            card.children.center:set_sprite_pos({x=3, y=0})
        end
    end
}
SMODS.Joker {
    key = "wwreason",
    name = "War Without Reason",
    atlas = 'Wzone',
    loc_txt = {
        name = "War Without Reason",
        text = {
            "Gains {X:mult,C:white}X#3#{} Mult every", 
            "time played hand beats",
            "your {C:attention}best hand{}",
			"{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)",
			"{C:inactive}(score to beat: {}{C:attention}#2#{}{C:inactive}){}"
        }
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 2,
    config = {
        xmult = 1,
		score = 0,
		increase = 0.2
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.xmult,card.ability.score,card.ability.increase}
        }
    end,
    pos = { x = 0, y = 1 },
    cost = 8,
    calculate = function(self, card, context)
        if context.joker_main and to_big(card.ability.xmult) > to_big(1) then
            return {
                Xmult_mod = card.ability.xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } }
            }
        end
        
        if context.after and context.cardarea == G.jokers and not context.blueprint then
		    if to_big(hand_chips) * to_big(mult) > to_big(card.ability.score) then
                card.ability.xmult = to_big(card.ability.xmult) + to_big(card.ability.increase)
				card.ability.score = to_big(hand_chips) * to_big(mult)
                return {
                    message = 'Upgrade!',
                    card = card
                }
			end
        end
    end
}
if not next(SMODS.find_mod('MoreFluff')) then
SMODS.Joker {
    key = "stack",
    name = "Stack",
    atlas = 'Wzone',
    loc_txt = {
        name = "Stack",
        text = {
            "{C:dark_edition}+1{} Joker slot"
        }
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    rarity = 2,
    pos = { x = 1, y = 1 },
    cost = 3,
    add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + 1
		end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - 1
		end
}
end
SMODS.Joker {
    key = "unocard",
    name = "Uno Card",
    atlas = 'Wzone',
    loc_txt = {
        name = "One Card",
        text = {
            "If {C:attention}winning hand{} is a",
            "{C:attention}High Card{}, destroy all",
            "unplayed cards in hand"
        }
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    rarity = 2,
    pos = { x = 2, y = 1 },
    cost = 5,
    config = {
        color = 0,
    },
	pixel_size = { w = 60, h = 95},
    set_ability = function(self, card, initial, delay_sprites)
        card.ability.color = (pseudorandom('unocard') * 4)
    end,
    update = function(self, card)
        if card.ability.color <= 1 then
            card.children.center:set_sprite_pos({x=2, y=1})
        elseif card.ability.color <= 2 then
            card.children.center:set_sprite_pos({x=3, y=1})
        elseif card.ability.color <= 3 then
            card.children.center:set_sprite_pos({x=4, y=1})
        else
            card.children.center:set_sprite_pos({x=0, y=2})
        end
    end,
    calculate = function(self, card, context)
		if context.blueprint then return end
        if context.after and context.scoring_name == "High Card" and to_big(hand_chips) * to_big(mult) >= to_big(G.GAME.blind.chips) then
		local _destroyed = {}
		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
			for i = 1, #G.hand.cards do
                G.hand.cards[i]:start_dissolve()
				table.insert(_destroyed, G.hand.cards[i])
            end
			for j = 1, #G.jokers.cards do
				eval_card(G.jokers.cards[j], {
					cardarea = G.jokers,
					remove_playing_cards = true,
					removed = _destroyed
				})
			end
        return true end }))
        end
    end
}
SMODS.Joker {
    key = "votv",
    name = "Voices of the Void",
    atlas = 'Wzone',
    loc_txt = {
        name = "Voices of the Void",
        text = {
            "Grants {C:attention}bonuses{} to {C:attention}3 cards{}",
            "every round when scored",
            "{C:attention}#4# of #1#{}: {C:chips}+303{} Chips",
            "{C:attention}#5# of #2#{}: {C:mult}+42{} Mult",
            "{C:attention}#6# of #3#{}: {X:mult,C:white}X3.14{} Mult"
        }
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 2,
    pos = { x = 1, y = 2 },
    cost = 5,
    config = { 
        suit = { 
            suit1 = "Spades",
            suit2 = "Spades",
            suit3 = "Spades"
        },
        rank = {
            rank1 = "Ace",
            rank2 = "Ace",
            rank3 = "Ace"
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.suit.suit1, card.ability.suit.suit2, card.ability.suit.suit3, card.ability.rank.rank1, card.ability.rank.rank2, card.ability.rank.rank3}
        }
    end,
    set_ability = function(self, card, initial, delay_sprites)
    local suits = { "Spades", "Hearts", "Clubs", "Diamonds" }
		for i = 1, 3 do
			local randomValue = math.ceil(pseudorandom('votv', 0.0000000000000000001, 4))
			card.ability.suit["suit" .. i] = suits[randomValue]
		end
    local ranks = { [1] = "Ace", [11] = "Jack", [12] = "Queen", [13] = "King" }
		for i = 1, 3 do
			local randomRank = math.ceil(pseudorandom('votv', 0.0000000000000000001, 13))
			card.ability.rank["rank" .. i] = ranks[randomRank] or tostring(randomRank)
		end
	end,
	calculate = function(self, card, context)
	if context.end_of_round and not context.repetition and context.game_over == false then
		local suits = { "Spades", "Hearts", "Clubs", "Diamonds" }
			for i = 1, 3 do
				local randomValue = math.ceil(pseudorandom('votv', 0.0000000000000000001, 4))
				card.ability.suit["suit" .. i] = suits[randomValue]
			end
		local ranks = { [1] = "Ace", [11] = "Jack", [12] = "Queen", [13] = "King" }
			for i = 1, 3 do
				local randomRank = math.ceil(pseudorandom('votv', 0.0000000000000000001, 13))
				card.ability.rank["rank" .. i] = ranks[randomRank] or tostring(randomRank)
			end
		end
	if context.individual and context.cardarea == G.play then
		if context.other_card:is_suit(card.ability.suit.suit1) and ((card.ability.rank.rank1 == "Ace" and context.other_card:get_id() == 1) or (card.ability.rank.rank1 == "Jack" and context.other_card:get_id() == 11) or (card.ability.rank.rank1 == "Queen" and context.other_card:get_id() == 12) or (card.ability.rank.rank1 == "King" and context.other_card:get_id() == 13) or context.other_card:get_id() == tonumber(card.ability.rank.rank1)) then
			SMODS.calculate_effect({
                message = localize { type = 'variable', key = 'a_chips', vars = {303}},
                chip_mod = 303,
                colour = G.C.CHIPS
            },context.other_card)
		end
		if context.other_card:is_suit(card.ability.suit.suit2) and ((card.ability.rank.rank2 == "Ace" and context.other_card:get_id() == 1) or (card.ability.rank.rank2 == "Jack" and context.other_card:get_id() == 11) or (card.ability.rank.rank2 == "Queen" and context.other_card:get_id() == 12) or (card.ability.rank.rank2 == "King" and context.other_card:get_id() == 13) or context.other_card:get_id() == tonumber(card.ability.rank.rank2)) then
			SMODS.calculate_effect({
                message = localize { type = 'variable', key = 'a_mult', vars = {42}},
                mult_mod = 42, 
                colour = G.C.MULT
            },context.other_card)
		end
		if context.other_card:is_suit(card.ability.suit.suit3) and ((card.ability.rank.rank3 == "Ace" and context.other_card:get_id() == 1) or (card.ability.rank.rank3 == "Jack" and context.other_card:get_id() == 11) or (card.ability.rank.rank3 == "Queen" and context.other_card:get_id() == 12) or (card.ability.rank.rank3 == "King" and context.other_card:get_id() == 13) or context.other_card:get_id() == tonumber(card.ability.rank.rank3)) then
			return {
                x_mult = 3.14,
                colour = G.C.RED,
				card = card
            }
		end
	end
end
}
SMODS.Joker {
    key = "chcard",
    name = "Character Card",
    atlas = 'Wzone',
    loc_txt = {
        name = "Character Card",
        text = {
            "Randomly gains, {C:money}${}, {C:chips}Chips{}, {C:mult}Mult{}",
            "and {X:mult,C:white}XMult{} when beating a {C:attention}Blind{}",
			"according to its {C:attention}difficulty{}",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive}/{C:mult}+#2#{C:inactive}/{X:mult,C:white}X#3#{C:inactive}){}"
        }
    },
	pixel_size = { w = 60, h = 60},
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 1,
    pos = { x = 3, y = 2 },
    cost = 6,
    config = {
        chips = 0,
        mult = 0,
        xmult = 1
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.chips, card.ability.mult, card.ability.xmult}
        }
    end,
    calculate = function(self, card, context)
    if context.joker_main and card.ability.chips > 0 then
        SMODS.calculate_effect({
            message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.chips } },
            chip_mod = card.ability.chips,
            colour = G.C.CHIPS
        }, card)
    end

    if context.joker_main and card.ability.mult > 0 then
        SMODS.calculate_effect({
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.mult } },
            mult_mod = card.ability.mult,
            colour = G.C.MULT
        }, card)
    end

    if context.joker_main and card.ability.xmult and card.ability.mult > 1 then
        return {
            Xmult_mod = card.ability.xmult,
            message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } },
            card = card
        }
    end	
		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			local diff
			if G.GAME.blind:get_type() == "Small" then
				diff = 2
			elseif G.GAME.blind:get_type() == "Big" then
				diff = 4
			else
				diff = 6
			end
			for i=1, diff do
				local random = math.ceil(pseudorandom('chcard', 0.0000000000000000001, 5))
				if random == 1 then
					local randomvalue = math.ceil(pseudorandom('chcard', 0.0000000000000000001, 10))
					card.ability.chips = card.ability.chips + randomvalue
					SMODS.calculate_effect({
						message = "+" .. tostring(randomvalue) .. " Chips", 
					}, card)
				elseif random == 3 then
					local randomvalue = (math.ceil(pseudorandom('chcard', 0.0000000000000000001, 4)))/2
					card.ability.mult = card.ability.mult + randomvalue
					SMODS.calculate_effect({
						message = "+" .. tostring(randomvalue) .. " Mult", 
					}, card)
				elseif random == 5 then
					local randomvalue = (math.ceil(pseudorandom('chcard', 0.0000000000000000001, 4)))/20
					card.ability.xmult = card.ability.xmult + randomvalue
					SMODS.calculate_effect({
						message = "X" .. tostring(randomvalue) .. " Mult", 
					}, card)
				else
					SMODS.calculate_effect({
						dollars = 1, 
					}, card)
				end
			end
		end
	
    end
}
SMODS.Joker {
    key = "discojoker",
    name = "What Kind of Joker Are You?",
    atlas = 'disco',
    loc_txt = {
        name = "What Kind of Joker Are You?",
        text = {
            "Effect {C:attention}changes{} after every hand",
			"played, efficacy depends on",
			"{C:green}random Dice Score{}"
        }
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 3,
	loc_vars = function(self, info_queue, card)
		if card.ability.skill.type ~= 0 then
		local totalbonus = 0
			if (card.ability.skill.type == 4 or card.ability.skill.type == 5) and card.ability.skill.attribute == 1 then
				local joker_count = 0
				for i = 1, #G.jokers.cards do
					local current = G.jokers.cards[i].label
					if string.find(string.lower(current), "joker") then
						joker_count = joker_count + 1
					end
				end
				totalbonus = card.ability.dice.bonus + joker_count - 1
			else
				totalbonus = card.ability.dice.bonus
			end
			if card.ability.skill.type == 3 and card.ability.skill.attribute == 3 then
				info_queue[#info_queue+1] =  {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
			end
			if card.ability.skill.type == 4 or card.ability.skill.type == 5 then
				if card.ability.skill.attribute == 1 then
					info_queue[#info_queue+1] = {key = 'e_negative', set = 'Edition', config = {extra = 1}}
				end
			end
			
			info_queue[#info_queue + 1] = {
							set = "Other",
							key = 'discostats',
							specific_vars = {(card.ability.dice.die1+card.ability.dice.die2),totalbonus,(card.ability.dice.die1+card.ability.dice.die2+totalbonus),card.ability.extra.mult,card.ability.extra.chips}, --table of the variable you want to pass on in the info_queue
						}
		end
	    local skill_matrix = {
		[1] = { [1] = 'logic', [2] = 'volition', [3] = 'endurance', [4] = 'handeye' },
		[2] = { [1] = 'encyclopedia', [2] = 'inlandempire', [3] = 'painthreshold', [4] = 'perception' },
		[3] = { [1] = 'rhetoric', [2] = 'empathy', [3] = 'physicalinstrument', [4] = 'reactionspeed' },
		[4] = { [1] = 'drama', [2] = 'authority', [3] = 'electrochemistry', [4] = 'savoirfaire' },
		[5] = { [1] = 'conceptualization', [2] = 'espritdecorps', [3] = 'shivers', [4] = 'interfacing' },
		[6] = { [1] = 'visualcalculus', [2] = 'suggestion', [3] = 'halflight', [4] = 'composure' }
		}

		local skill_type = card.ability.skill.type
		local skill_attribute = card.ability.skill.attribute

		if skill_matrix[skill_type] and skill_matrix[skill_type][skill_attribute] then
			return {
				key = skill_matrix[skill_type][skill_attribute],
				set = 'Joker'
			}
		end
	end,
	config = { 
        skill = { 
            type = 0,
            attribute = 0
        },
        dice = {
            die1 = 0,
            die2 = -3,
			bonus = 0
        },
		extra = { 
            chips = 0,
            mult = 0,
			money = 0
        },
		switch = 0,
		empathydiscard = 0,
    },
    pos = { x = 0, y = 0 },
	soul_pos = { x = 0, y = 1 },
    cost = 5,
	update = function(self, card)
		card.children.center:set_sprite_pos({x=card.ability.skill.type, y=card.ability.skill.attribute})
		card.children.floating_sprite:set_sprite_pos({x=card.ability.dice.die1, y=card.ability.dice.die2+4})
	end,
    add_to_deck = function(self, card, from_debuff)
		card.ability.skill.type = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 6))
		card.ability.skill.attribute = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 4))
		if next(SMODS.find_card('j_oops')) then
			card.ability.dice.die1 = 6
			card.ability.dice.die2 = 6
		else
			card.ability.dice.die1 = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 6))
			card.ability.dice.die2 = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 6))
		end
	end,
	calc_dollar_bonus = function(self, card)
		local bonus = card.ability.extra.money
		card.ability.extra.money = 0
		if bonus > 0 then return bonus end
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if card.ability.extra.chips > 0 then
				SMODS.calculate_effect({
					message = localize { type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}},
					chip_mod = card.ability.extra.chips,
					colour = G.C.CHIPS
				}, card)
			end
			if card.ability.extra.mult > 0 then
				SMODS.calculate_effect({
					message = localize { type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
					mult_mod = card.ability.extra.mult, 
					colour = G.C.MULT
				}, card)
			end
			if card.ability.skill.type == 6 and card.ability.skill.attribute == 3 then
				return {
                Xmult_mod = (card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus)/4,
                message = localize { type = 'variable', key = 'a_xmult', vars = { (card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus)/4 } }
				}
			end
		end
		if context.before then
			if next(context.poker_hands['Pair']) and #context.scoring_hand == 2 and not context.blueprint and card.ability.skill.type == 1 and card.ability.skill.attribute == 2 then
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
					copy_card(context.scoring_hand[2],context.scoring_hand[1])
					context.scoring_hand[1] = context.scoring_hand[2]
				return true end}))
			elseif card.ability.skill.type == 2 and card.ability.skill.attribute == 2 then
				local _card = copy_card(context.scoring_hand[math.ceil(pseudorandom('discojoker', 0.0000000000000000001, #context.scoring_hand))], nil, nil, G.playing_card)
				if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 9 then
							local edition = poll_edition('discojoker',nil,true,true)
							_card:set_edition(edition, true)
						end
				_card:add_to_deck()
				G.deck.config.card_limit = G.deck.config.card_limit + 1
				table.insert(G.playing_cards, _card)
				G.hand:emplace(_card)
				_card.states.visible = nil
				G.E_MANAGER:add_event(Event({
					func = function()
						_card:start_materialize()
						return true
					end
				})) 
			return {
				message = localize('k_copied_ex'),
				colour = G.C.CHIPS,
				card = card,
				playing_cards_created = {true}
			}
			elseif card.ability.skill.type == 4 and card.ability.skill.attribute == 2 and next(context.poker_hands['Straight']) and card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 4 then
				local lowest
			local lowestvalue = 999
			for i = 1, #context.scoring_hand do
				if context.scoring_hand[i].base.id < lowestvalue then
					lowestvalue = context.scoring_hand[i].base.id
					lowest = i
				end
			end
			context.scoring_hand[lowest].ability.perma_bonus = context.scoring_hand[lowest].ability.perma_bonus or 0
			context.scoring_hand[lowest].destroy_me_pls = true
			for i = 1, #context.scoring_hand do
				if context.scoring_hand[i] ~= context.scoring_hand[lowest] then
					context.scoring_hand[i].ability.perma_bonus = context.scoring_hand[i].ability.perma_bonus or 0
					context.scoring_hand[i].ability.perma_bonus = context.scoring_hand[i].ability.perma_bonus + context.scoring_hand[lowest].base.nominal + context.scoring_hand[lowest].ability.perma_bonus
					SMODS.calculate_effect({
						extra = {message = localize('k_upgrade_ex'), colour = G.C.CHIPS},
						colour = G.C.CHIPS,
						}, context.scoring_hand[i])
				end
			end
			print(context.scoring_hand[lowest])
			elseif card.ability.skill.type == 6 and card.ability.skill.attribute == 2 then
				if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 8 then
					context.scoring_hand[math.ceil(pseudorandom('discojoker', 0.0000000000000000001, #context.scoring_hand))]:set_seal(SMODS.poll_seal({guaranteed = true, type_key = seal_type}))
					return {
                        message = "Success!",
                    }
				else
					card.ability.dice.bonus = card.ability.dice.bonus + 1
					return {
                        message = "Failure!",
                    }
				end
			elseif card.ability.skill.type == 1 and card.ability.skill.attribute == 3 then
				if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 30 then
					G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
					ease_hands_played(1)
					SMODS.calculate_effect({
						message = "Success!", 
					}, card)
				else
					card.ability.dice.bonus = card.ability.dice.bonus + 2
					SMODS.calculate_effect({
						message = "Failure!", 
					}, card)
				end
			elseif card.ability.skill.type == 2 and card.ability.skill.attribute == 3 then
				if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 18 then
					G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
					ease_discard(1)
					SMODS.calculate_effect({
						message = "Success!", 
					}, card)
				else
					card.ability.dice.bonus = card.ability.dice.bonus + 1
					SMODS.calculate_effect({
						message = "Failure!", 
					}, card)
				end
			elseif card.ability.skill.type == 1 and card.ability.skill.attribute == 4 then
				if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 20 then
					G.hand:change_size(1)
					SMODS.calculate_effect({
						message = "Success!", 
					}, card)
				else
					card.ability.dice.bonus = card.ability.dice.bonus + 1
					SMODS.calculate_effect({
						message = "Failure!", 
					}, card)
				end
			elseif card.ability.skill.type == 5 and card.ability.skill.attribute == 3 then
				if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 10 then
					G.E_MANAGER:add_event(Event({
						func = (function()
						add_tag(Tag('tag_ethereal'))
						play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
						play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
						return true
						end)
						}))
					SMODS.calculate_effect({
						message = "Success!", 
					}, card)
				else
					SMODS.calculate_effect({
						message = "Failure!", 
					}, card)
				end
			elseif 
				card.ability.skill.type == 4 and card.ability.skill.attribute == 4 then
					if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 10 then
						SMODS.calculate_effect({
							message = "Success!", 
							}, card)
						for k, v in ipairs(context.scoring_hand) do
							if v.ability.set ~= "Enhanced" then
								v:set_ability(G.P_CENTERS[SMODS.poll_enhancement({guaranteed = true})])
							end
						end
					else
						SMODS.calculate_effect({
							message = "Failure!", 
							}, card)
					end
			elseif card.ability.skill.type == 2 and card.ability.skill.attribute == 4 then
				if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 4 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					for i = 1, G.consumeables.config.card_limit - #G.consumeables.cards - G.GAME.consumeable_buffer do
						local world = create_card('Tarot', G.consumeables, nil, nil, nil,true,'c_world')
						world:add_to_deck()
						G.consumeables:emplace(world)
						G.GAME.consumeable_buffer = 0
						SMODS.calculate_effect({
						message = "Success!", 
					}, card)
					end
				elseif card.ability.dice.die2 + card.ability.dice.bonus <= 4 then
					card.ability.dice.bonus = card.ability.dice.bonus + 3
					SMODS.calculate_effect({
						message = "Failure!", 
					}, card)
				end
			elseif card.ability.skill.type == 5 and card.ability.skill.attribute == 4 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				local planet
				card:juice_up()
				if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus <= 7 then
					planet = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil)
				elseif card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus <= 14 then
					local _handname, _played, _order = 'High Card', -1, 100
					for k, v in pairs(G.GAME.hands) do
						if v.played > _played or (v.played == _played and _order > v.order) then
							_played = v.played
							_handname = k
						end
					end
					for k, v in pairs(G.P_CENTER_POOLS.Planet) do
						if v.config.hand_type == _handname then
							planet = create_card('Planet', G.consumeables, nil, nil, nil, true, v.key)
						end
					end
				else
					planet = create_card('Spectral', G.consumeables, nil, nil, nil, true, 'c_black_hole')
				end
				planet:add_to_deck()
				G.consumeables:emplace(planet)
				G.GAME.consumeable_buffer = 0
			elseif card.ability.skill.type == 6 and card.ability.skill.attribute == 4 then
				local _handname, _played, _order = 'High Card', -1, 100
				for k, v in pairs(G.GAME.hands) do
					if v.played > _played or (v.played == _played and _order > v.order) then
						_played = v.played
						_handname = k
					end
				end
				if next(context.poker_hands[_handname]) then
					card.ability.extra.mult = card.ability.extra.mult + card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus
					SMODS.calculate_effect({
						message = "Upgrade", 
					}, card)
				end
			end
		end
		if context.before and context.cardarea == G.jokers then
			if card.ability.skill.type == 2 and card.ability.skill.attribute == 1 then
				if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 7 then
					card.ability.extra.chips = card.ability.extra.chips + 20
					SMODS.calculate_effect({
						message = "Success!", 
					}, card)
				else
					card.ability.dice.bonus = card.ability.dice.bonus + 1
					SMODS.calculate_effect({
						message = "Failure!", 
					}, card)
				end
			elseif (card.ability.skill.type == 4 or card.ability.skill.type == 5) and card.ability.skill.attribute == 1 then
				local joker_count = 0
				for i = 1, #G.jokers.cards do
					local current = G.jokers.cards[i].label
					if string.find(string.lower(current), "joker") then
						joker_count = joker_count + 1
					end
				end
				if card.ability.skill.type == 4 and joker_count + card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus - 1 >= 12 then
					local nega_jimbo = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joker")
					nega_jimbo:set_edition({negative = true})
					nega_jimbo:add_to_deck()
					G.jokers:emplace(nega_jimbo)
					SMODS.calculate_effect({
						message = "Success!", 
					}, card)
				elseif card.ability.skill.type == 5 and joker_count + card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus - 1 >= 20 then
					local nega_abstract = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_abstract")
					nega_abstract:set_edition({negative = true})
					nega_abstract:add_to_deck()
					G.jokers:emplace(nega_abstract)
					SMODS.calculate_effect({
						message = "Success!", 
					}, card)
				else
					SMODS.calculate_effect({
						message = "Failure!", 
					}, card)
				end
			elseif card.ability.skill.type == 3 and card.ability.skill.attribute == 2 then
				if card.ability.empathydiscard == 1 then
					card.ability.empathydiscard = 0
				else
					card.ability.extra.mult = card.ability.extra.mult + card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus
				SMODS.calculate_effect({
						message = "Upgrade", 
					}, card)
				end
			end
		end
		if context.after and context.cardarea == G.jokers then
			if (G.GAME.chips + (to_big(hand_chips) * to_big(mult)) > G.GAME.blind.chips) and card.ability.skill.type == 1 and card.ability.skill.attribute == 1 then
				card.ability.extra.mult = card.ability.extra.mult + card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus
				SMODS.calculate_effect({
						message = "Upgrade", 
					}, card)
			end
			if card.ability.skill.type == 5 and card.ability.skill.attribute == 2 then
				card.ability.extra.money = card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus
				SMODS.calculate_effect({
						message = "Success!", 
					}, card)
			end
			card.ability.switch = 1
		end
		if context.discard then
			if card.ability.skill.type == 3 and card.ability.skill.attribute == 1 then
				if #context.full_hand == 1 then
					card.ability.dice.bonus = card.ability.dice.bonus + 1
					if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 10 then
						return {
						message = "Upgrade",
						delay = 0.45, 
						remove = true,
						card = card
						}
					else
						return {
						message = "Upgrade",
						delay = 0.45,
						card = card
						}
					end
				end
			elseif card.ability.skill.type == 3 and card.ability.skill.attribute == 2 then
				card.ability.empathydiscard = 1
				return {
					message = "Failure!",
					}
			end
		end
		if context.individual and context.cardarea == G.play then
			if card.ability.skill.type == 6 and card.ability.skill.attribute == 1 then
				context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
				context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus
				return {
					extra = {message = localize('k_upgrade_ex'), colour = G.C.CHIPS},
					colour = G.C.CHIPS,
					card = card
				}
			end
		end
		if context.hand_drawn and card.ability.switch == 1 then
			card.ability.switch = 0
			if hand_chips then
				if to_big(hand_chips) * to_big(mult) < G.GAME.blind.chips/5 and not (card.ability.skill.type == 6 and card.ability.skill.attribute == 3)then
					card.ability.skill.type = 6
					card.ability.skill.attribute = 3
				else
				card.ability.skill.type = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 6))
				card.ability.skill.attribute = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 4))
				end
			else
				card.ability.skill.type = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 6))
				card.ability.skill.attribute = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 4))
			end
			if next(SMODS.find_card('j_oops')) then
				card.ability.dice.die1 = 6
				card.ability.dice.die2 = 6
			else
				card.ability.dice.die1 = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 6))
				card.ability.dice.die2 = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 6))
			card:juice_up()
			end
		end
		if context.game_over and card.ability.skill.type == 1 and card.ability.skill.attribute == 2 then
			if card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 12 then
				return {
                        message = "Success!",
                        saved = true,
                    }
			else
				return {
                        message = "Failure!",
                    }
			end
		end
		if context.selling_card then
			if context.card.config.center_key == 'j_burglar' then
				card.ability.skill.type = 5
				card.ability.skill.attribute = 2
				card.ability.switch = 0
				card:juice_up()
			elseif context.card.ability.consumeable and card.ability.skill.type == 4 and card.ability.skill.attribute == 3 then
				card.ability.skill.type = 1
				card.ability.skill.attribute = 2
				card.ability.switch = 0
				card:juice_up()
			end
		end
		if context.using_consumeable then
			if card.ability.skill.type == 3 and card.ability.skill.attribute == 3 and card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus >= 8 and not (context.consumeable.edition and context.consumeable.edition.negative) then
				local negconsumeable = copy_card(context.consumeable)
				negconsumeable:set_edition({negative = true})
				negconsumeable:add_to_deck()
				G.consumeables:emplace(negconsumeable)
				card.ability.dice.die1 = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 6))
				card.ability.dice.die2 = math.ceil(pseudorandom('discojoker', 0.0000000000000000001, 6))
				card:juice_up()
				return {
                        message = "Copied"
                    }
			elseif card.ability.skill.type == 4 and card.ability.skill.attribute == 3 then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus
				return {
						message = "Upgrade",
						delay = 0.45,
						card = card
						}
			end
		end
		if context.pre_discard and card.ability.skill.type == 3 and card.ability.skill.attribute == 4 then
			local upgradetimes = 1
			local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
			local _handname, _played, _order = 'High Card', -1, 100
			for k, v in pairs(G.GAME.hands) do
				if v.played > _played or (v.played == _played and _order > v.order) then
				_played = v.played
				_handname = k
				end
			end
			if _handname == text then
				if (card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus)/10 >= 1 then
					upgradetimes = math.floor((card.ability.dice.die1 + card.ability.dice.die2 + card.ability.dice.bonus)/10 + 0.5)
				end
				card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
				for i = 1, upgradetimes do
					update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(text, 'poker_hands'),chips = G.GAME.hands[text].chips, mult = G.GAME.hands[text].mult, level=G.GAME.hands[text].level})
					level_up_hand(context.blueprint_card or card, text, nil, 1)
				end
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
            card.ability.switch = 1
			end
		end
		if context.destroying_card and context.destroying_card.destroy_me_pls then
			return {
					remove = true
				}
		end
	end		
}
SMODS.Joker {
    key = "horn",
    name = "Joker's Horn",
    atlas = 'Wzone',
    loc_txt = {
        name = "Joker's Horn",
        text = {
            "Last played card gives",
			"{X:chips,C:white}X#1#{} Chips when scored",
        }
    },
	config = {extra = {xchips = 2}},
	loc_vars = function(self, info_queue, card)
		return {
            vars = {card.ability.extra.xchips}
        }
	end,
	pixel_size = { w = 50, h = 93},
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 1,
    pos = { x = 4, y = 2 },
    cost = 4,
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
        if context.other_card == context.scoring_hand[#context.scoring_hand] then
			return {
				xchips = card.ability.extra.xchips,
				card = card
				}
			end
		end
	end 
}
SMODS.Joker {
    key = "hollowness",
    name = "Hollowness",
    atlas = 'Wzone',
    loc_txt = {
        name = "Hollowness",
        text = {
            "After {C:attention}2{} rounds, sell",
			"this card to make all",
			"cards in hand {C:dark_edition}Negative{}",
			"{C:inactive}(Currently {C:attention}#1#{C:inactive}/2)"
        }
    },
	config = {loyalty_remaining = 0
	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] =  {key = 'e_negative_playing_card', set = 'Edition', config = {extra = 1}}
		return {
            vars = {card.ability.loyalty_remaining}
        }
	end,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = false,
    rarity = 3,
    pos = { x = 0, y = 3 },
    cost = 8,
	calculate = function(self, card, context)
		if context.blueprint then return end
		if (context.first_hand_drawn or context.open_booster) and card.ability.loyalty_remaining >= 2 then
            local eval = function() return G.hand and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
		if context.end_of_round and context.main_eval and not context.repetition then
			if card.ability.loyalty_remaining < 2 then
			card.ability.loyalty_remaining = card.ability.loyalty_remaining + 1
				return {
				message = tostring(card.ability.loyalty_remaining)  ..  "/2",
				}
			end
		end
		if context.selling_self and card.ability.loyalty_remaining >= 2 then
			if G.hand then
				for i = 1, #G.hand.cards do
					G.hand.cards[i]:set_edition({negative = true})
				end
			else
				return {
				message = "No Hand!",
				}
			end
		end
	end
}
SMODS.Joker {
    key = "ironclad",
    name = "Ruby Key",
    atlas = 'Wzone',
    loc_txt = {
        name = "Ruby Key",
        text = {
            "When bought, turns into a",
			"random {C:attention}Ironclad consumable{}",
			"{C:inactive}(can only be bought once, must have room){}"
        }
    },
	pixel_size = { w = 52, h = 73},
	no_pool_flag = 'ironclad_bought',
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = false,
    blueprint_compat = false,
    rarity = 2,
    pos = { x = 2, y = 2 },
    cost = 5,
    add_to_deck = function(self, card, from_debuff)
		play_sound('tarot1')
		card:start_dissolve()
		if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
			G.GAME.pool_flags.ironclad_bought = true
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			local cardlist = {'c_Wzon_fiendfire','c_Wzon_bloodletting','c_Wzon_armaments'}
            local ironcladcons = create_card('GuestAppearance', G.consumeables, nil, nil, nil, nil, pseudorandom_element(cardlist))
            ironcladcons:add_to_deck()
            G.consumeables:emplace(ironcladcons)
            G.GAME.consumeable_buffer = 0
			if G.GAME.pool_flags.ironclad_bought and G.GAME.pool_flags.silent_bought and G.GAME.pool_flags.defect_bought and not next(SMODS.find_card('j_Wzon_corruptheart')) then
				local heart = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_Wzon_corruptheart")
				heart:add_to_deck()
				G.jokers:emplace(heart)
				G.GAME.pool_flags.corrupt_heart_flag = true
			end
			end
		end,
	calculate = function(self, card, context)
		if context.hand_drawn and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and not context.blueprint then
			play_sound('tarot1')
			card:start_dissolve()
			G.GAME.pool_flags.ironclad_bought = true
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			local cardlist = {'c_Wzon_fiendfire','c_Wzon_bloodletting','c_Wzon_armaments'}
            local ironcladcons = create_card('GuestAppearance', G.consumeables, nil, nil, nil, nil, pseudorandom_element(cardlist))
            ironcladcons:add_to_deck()
            G.consumeables:emplace(ironcladcons)
            G.GAME.consumeable_buffer = 0
			if G.GAME.pool_flags.ironclad_bought and G.GAME.pool_flags.silent_bought and G.GAME.pool_flags.defect_bought and not next(SMODS.find_card('j_Wzon_corruptheart')) then
				local heart = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_Wzon_corruptheart")
				heart:add_to_deck()
				G.jokers:emplace(heart)
				G.GAME.pool_flags.corrupt_heart_flag = true
			end
			end
		end,
}
SMODS.Joker {
    key = "silent",
    name = "Emerald Key",
    atlas = 'Wzone',
    loc_txt = {
        name = "Emerald Key",
        text = {
            "When bought, turns into a",
			"random {C:attention}Silent consumable{}",
			"{C:inactive}(can only be bought once, must have room){}"
        }
    },
	pixel_size = { w = 52, h = 73},
	no_pool_flag = 'silent_bought',
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = false,
    blueprint_compat = false,
    rarity = 2,
    pos = { x = 1, y = 3 },
    cost = 3,
    add_to_deck = function(self, card, from_debuff)
		play_sound('tarot1')
		card:start_dissolve()
		if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
			G.GAME.pool_flags.silent_bought = true
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			local cardlist = {'c_Wzon_distraction','c_Wzon_bouncingflask','c_Wzon_calculatedgamble'}
            local silentcons = create_card('GuestAppearance', G.consumeables, nil, nil, nil, nil, pseudorandom_element(cardlist))
            silentcons:add_to_deck()
            G.consumeables:emplace(silentcons)
            G.GAME.consumeable_buffer = 0
			if G.GAME.pool_flags.ironclad_bought and G.GAME.pool_flags.silent_bought and G.GAME.pool_flags.defect_bought and not next(SMODS.find_card('j_Wzon_corruptheart')) then
				local heart = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_Wzon_corruptheart")
				heart:add_to_deck()
				G.jokers:emplace(heart)
				G.GAME.pool_flags.corrupt_heart_flag = true
			end
			end
		end,
	calculate = function(self, card, context)
		if context.hand_drawn and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and not context.blueprint then
			play_sound('tarot1')
			card:start_dissolve()
			G.GAME.pool_flags.silent_bought = true
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			local cardlist = {'c_Wzon_distraction','c_Wzon_bouncingflask','c_Wzon_calculatedgamble'}
            local silentcons = create_card('GuestAppearance', G.consumeables, nil, nil, nil, nil, pseudorandom_element(cardlist))
            silentcons:add_to_deck()
            G.consumeables:emplace(silentcons)
            G.GAME.consumeable_buffer = 0
			if G.GAME.pool_flags.ironclad_bought and G.GAME.pool_flags.silent_bought and G.GAME.pool_flags.defect_bought and not next(SMODS.find_card('j_Wzon_corruptheart')) then
				local heart = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_Wzon_corruptheart")
				heart:add_to_deck()
				G.jokers:emplace(heart)
				G.GAME.pool_flags.corrupt_heart_flag = true
			end
			end
		end,
}
SMODS.Joker {
    key = "defect",
    name = "Sapphire Key",
    atlas = 'Wzone',
    loc_txt = {
        name = "Sapphire Key",
        text = {
            "When bought, turns into a",
			"random {C:attention}Defect consumable{}",
			"{C:inactive}(can only be bought once, must have room){}"
        }
    },
	pixel_size = { w = 52, h = 73},
	no_pool_flag = 'defect_bought',
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = false,
    blueprint_compat = false,
    rarity = 2,
    pos = { x = 3, y = 3 },
    cost = 3,
    add_to_deck = function(self, card, from_debuff)
		play_sound('tarot1')
		card:start_dissolve()
		if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
			G.GAME.pool_flags.defect_bought = true
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			local cardlist = {'c_Wzon_zap','c_Wzon_coolheaded','c_Wzon_darkness'}
            local defectcons = create_card('GuestAppearance', G.consumeables, nil, nil, nil, nil, pseudorandom_element(cardlist))
            defectcons:add_to_deck()
            G.consumeables:emplace(defectcons)
            G.GAME.consumeable_buffer = 0
			if G.GAME.pool_flags.ironclad_bought and G.GAME.pool_flags.silent_bought and G.GAME.pool_flags.defect_bought and not next(SMODS.find_card('j_Wzon_corruptheart')) then
				local heart = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_Wzon_corruptheart")
				heart:add_to_deck()
				G.jokers:emplace(heart)
				G.GAME.pool_flags.corrupt_heart_flag = true
			end
			end
		end,
	calculate = function(self, card, context)
		if context.hand_drawn and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and not context.blueprint then
			play_sound('tarot1')
			card:start_dissolve()
			G.GAME.pool_flags.defect_bought = true
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			local cardlist = {'c_Wzon_zap','c_Wzon_coolheaded','c_Wzon_darkness'}
            local defectcons = create_card('GuestAppearance', G.consumeables, nil, nil, nil, nil, pseudorandom_element(cardlist))
            defectcons:add_to_deck()
            G.consumeables:emplace(defectcons)
            G.GAME.consumeable_buffer = 0
			if G.GAME.pool_flags.ironclad_bought and G.GAME.pool_flags.silent_bought and G.GAME.pool_flags.defect_bought and not next(SMODS.find_card('j_Wzon_corruptheart')) then
				local heart = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_Wzon_corruptheart")
				heart:add_to_deck()
				G.jokers:emplace(heart)
				G.GAME.pool_flags.corrupt_heart_flag = true
			end
			end
		end,
}
SMODS.Joker {
    key = "exoticaceofspades",
    name = "Exotic Ace of Spades",
    atlas = 'Wzone',
    loc_txt = {
        name = "Exotic Ace of Spades",
        text = {
            "Retrigger all played cards",
			"with {C:spades}Spade{} suit",
			"Defeating a blind grants {C:dark_edition}Foil{}",
			"to your next {C:attention}#1#{} scoring cards",
			"{C:inactive}(can currently foil {C:attention}#2#{C:inactive} cards)"
        }
		,boxes = {2,3}
    },
	config = {how_many = 6, bullets = 0
	},
	loc_vars = function(self, info_queue, card)
		return {
            vars = {card.ability.how_many, card.ability.bullets}
        }
	end,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 2,
    pos = { x = 2, y = 3 },
    cost = 7,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if card.ability.bullets > 0 and not context.other_card.edition and not context.blueprint then
				card.ability.bullets = card.ability.bullets - 1
				local __card = context.other_card
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.3,func = function()
				card:juice_up()
                __card:set_edition({foil = true})
                return true end }))
				SMODS.calculate_effect({
						message = "Foil",
						colour = G.C.CHIPS,
						}, __card)
			end
			if context.other_card:is_suit("Spades") then
				return {
					message = 'Again!',
					repetitions = 1,
					card = card
				}
			end
		end
		if context.end_of_round and not context.blueprint and context.main_eval and not context.repetition then
			card.ability.bullets = card.ability.bullets + card.ability.how_many
			return {
					message = 'Memento Mori',
					colour = G.C.CHIPS,
					card = card
				}
		end
	end
}
SMODS.Joker {
    key = "corruptheart",
    name = "Corrupt Heart",
    atlas = 'Wzone',
    loc_txt = {
        name = "Corrupt Heart",
        text = {
            "Create a {C:red}Guest{} consumable",
			"when {C:attention}Blind{} is selected",
			"{C:inactive}(must have room){}"
        }
    },
	yes_pool_flag = 'corrupt_heart_flag',
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 3,
    pos = { x = 4, y = 3 },
    cost = 8,
	calculate = function(self, card, context)
		if context.setting_blind then
			local cons = create_card('GuestAppearance', G.consumeables, nil, nil, nil, nil, nil)
            cons:add_to_deck()
            G.consumeables:emplace(cons)
            G.GAME.consumeable_buffer = 0
			return {
                    message = "+1 Guest",
                    delay = 0.45,
                    card = card
                }
		end
	end,
}
SMODS.Joker {
    key = "jimbo_forbidden",
    name = "Jimbo the Forbidden One",
    atlas = 'Wzone',
    loc_txt = {
        name = "Jimbo the Forbidden One",
        text = {
            "{C:attention}Splits{} into {C:attention}5{} {C:attention}Forbidden{} cards added to",
			"your {C:attention}deck{} when first hand is drawn",
			"{C:red}Self destructs{} if {C:attention}copied{} or your",
			"{C:attention}full deck{} is not between",
			"{C:attention}40{} and {C:attention}60{} cards"
        }
		,boxes = {2,3}
    },
	config = {
        transform = 0,
		illegal = false,
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = false,
    rarity = 3,
    pos = { x = 0, y = 4 },
    cost = 5,
	add_to_deck = function(self, card, from_debuff)
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.key == "j_Wzon_jimbo_forbidden" and G.jokers.cards[i] ~= card then
				SMODS.calculate_effect({
					message = "Illegal",
					card = card,
				}, card)
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function()
				card:start_dissolve()
				return true end }))
			end
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		for i = 1, #G.deck.cards do
				if G.deck.cards[i]:is_suit("Wzon_Joker") or G.deck.cards[i].base.value == 'Wzon_Forbidden' then
					draw_card(G.deck, G.hand, nil, nil, nil, G.deck.cards[i])
				end
			end
			for i = 1, #G.discard.cards do
				if G.discard.cards[i]:is_suit("Wzon_Joker") or G.discard.cards[i].base.value == 'Wzon_Forbidden' then
					draw_card(G.discard, G.hand, nil, nil, nil, G.discard.cards[i])
				end
			end
			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 2,func = function()
			for i = 1, #G.hand.cards do
				if G.hand.cards[i]:is_suit("Wzon_Joker") or G.hand.cards[i].base.value == 'Wzon_Forbidden' then
					G.hand.cards[i]:start_dissolve()
				end
			end
			return true end }))
		end,
	calculate = function(self, card, context)
		if context.blueprint then return end
		if context.setting_blind then
			play_sound("card1")
			card:flip()
			local _lleg
			local _rleg
			local _larm
			local _rarm
			local _head
			local _cards = {}
				_lleg = create_playing_card({front = G.P_CARDS["H"..'_'.."Wzon_Fo"], center = nil}, G.hand)
				_lleg.ability.perma_x_mult = 3
				_larm = create_playing_card({front = G.P_CARDS["S"..'_'.."Wzon_Fo"], center = nil}, G.hand)
				_larm.ability.perma_bonus = 80
				_head = create_playing_card({front = G.P_CARDS["Wzon_J"..'_'.."Wzon_Fo"], center = nil}, G.hand)
				_head.ability.perma_h_dollars = 8
				_rarm = create_playing_card({front = G.P_CARDS["D"..'_'.."Wzon_Fo"], center = nil}, G.hand)
				_rarm.ability.perma_p_dollars = 5
				_rleg = create_playing_card({front = G.P_CARDS["C"..'_'.."Wzon_Fo"], center = nil}, G.hand)
				_rleg.ability.perma_mult = 25
			G.E_MANAGER:add_event(Event({trigger = 'before',delay = 2,func = function()
			for i = 1, #G.hand.cards do
				if G.hand.cards[i].base.value == 'Wzon_Forbidden' then
					table.insert(_cards, G.hand.cards[i])
				end
			end
			card.ability.transform = 1
			play_sound("card1")
			card:flip()
			SMODS.calculate_effect({
                message = "Split",
				playing_cards_created = _cards
            }, card)
				for i = 1, #G.hand.cards do
					draw_card(G.hand, G.deck, nil, nil, nil, G.hand.cards[i])
				end
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 1,func = function()
					G.deck:shuffle()
				return true end }))
            return true end }))
		end
		if context.after and context.scoring_name == "Wzon_Obliterate" and next(SMODS.find_mod('Talisman')) then
			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 1,func = function()
			for i = 1, #G.hand.cards do
				draw_card(G.hand, G.deck, nil, nil, nil, G.hand.cards[i])
			end
			G.GAME.chips = G.GAME.blind.chips * 10
			return true end }))
		end
		if context.end_of_round and context.cardarea == G.jokers then
			play_sound("card1")
			card:flip()
			for i = 1, #G.deck.cards do
				if G.deck.cards[i]:is_suit("Wzon_Joker") or G.deck.cards[i].base.value == 'Wzon_Forbidden' then
					draw_card(G.deck, G.hand, nil, nil, nil, G.deck.cards[i])
				end
			end
			for i = 1, #G.discard.cards do
				if G.discard.cards[i]:is_suit("Wzon_Joker") or G.discard.cards[i].base.value == 'Wzon_Forbidden' then
					draw_card(G.discard, G.hand, nil, nil, nil, G.discard.cards[i])
				end
			end
			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 2,func = function()
			for i = 1, #G.hand.cards do
				if G.hand.cards[i]:is_suit("Wzon_Joker") or G.hand.cards[i].base.value == 'Wzon_Forbidden' then
					G.hand.cards[i]:start_dissolve()
				end
			end
			card.ability.transform = 0
			play_sound("card1")
			card:flip()
			return true end }))
		end
		if (#G.playing_cards < 40 or #G.playing_cards > 60) and card.ability.illegal == false then
			card.ability.illegal = true
			SMODS.calculate_effect({
                message = "Illegal",
				card = card,
            }, card)
			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 1,func = function()
				card:start_dissolve()
			return true end }))
		end
	end,
	update = function(self, card)
        if card.ability.transform == 1 then
            card.children.center:set_sprite_pos({x=1, y=4})
        else
            card.children.center:set_sprite_pos({x=0, y=4})
        end
    end
}
SMODS.Joker {
    key = "lobotomy",
    name = "Lobotomy",
    atlas = 'Wzone',
    loc_txt = {
        name = "Lobotomy",
        text = {
            "{C:green}#1# in #2#{} chance to create",
			"a {C:dark_edition}Black Hole{} when",
			"{C:attention}score catches on fire{}"
        }
    },
	config = {
		lobotomyodds = 3
    },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {G.GAME.probabilities.normal,card.ability.lobotomyodds}
		}
	end,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 2,
    pos = { x = 2, y = 4 },
    cost = 4,
    calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.final_scoring_step then
			if to_big(hand_chips)*to_big(mult) > to_big(G.GAME.blind.chips) and pseudorandom('lobotomy') < G.GAME.probabilities.normal / card.ability.lobotomyodds then
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
					if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
						local Bhole = create_card('Spectral', G.consumeables, nil, nil, nil, true, 'c_black_hole')
						Bhole:add_to_deck()
						G.consumeables:emplace(Bhole)
						G.GAME.consumeable_buffer = 0
					end
				return true end}))
				return {
                    message = "Fire in The Hole!",
                    delay = 0.45, 
                    card = card
                }
			end
		end
	end
}
SMODS.Joker {
    key = "serializedjoker",
    name = "Serialized Joker",
    atlas = 'serialized',
    loc_txt = {
        name = "Serialized Joker",
        text = {
            "{C:mult}+#1#{} Mult", 
            "Gains {C:money}#2#${} {C:attention}in sell value",
            "at end of round",
			"{s:0.8}Starts with {C:attention,s:0.8}sell value",
			"{s:0.8}of {C:money,s:0.8}#3#${s:0.8} if serial number",
			"{s:0.8}is {C:attention,s:0.8}069{s:0.8}, {C:attention,s:0.8}690{s:0.8} or {C:attention,s:0.8}420"
        }
		,boxes = {3,3}
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 1,
    config = {
		serial1 = 0,
		serial2 = 0,
		serial3 = 0,
        mult = 4,
		extra = 1,
		jackpot = 99
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.mult,card.ability.extra,card.ability.jackpot+1}
        }
    end,
    pos = { x = 0, y = 0 },
	soul_pos = { x = -1, y = -1, extra = { x = 1, y = 1 }, extra2 = { x = 2, y = 2 }, extra3 = { x = 3, y = 3 } },
    cost = 3,
	set_ability = function(self, card, initial, delay_sprites)
        card.ability.serial1 = math.floor(pseudorandom('serializedjoker', 0, 9))
		card.ability.serial2 = math.floor(pseudorandom('serializedjoker', 0, 9))
		card.ability.serial3 = math.floor(pseudorandom('serializedjoker', 0, 9))
    end,
	update = function(self, card)
		card.children.floating_sprite2:set_sprite_pos({  x = 1, y = card.ability.serial1 })
		card.children.floating_sprite3:set_sprite_pos({  x = 2, y = card.ability.serial2 })
		card.children.floating_sprite4:set_sprite_pos({  x = 3, y = card.ability.serial3 })
	end,
	add_to_deck = function(self, card, from_debuff)
		if (card.ability.serial1 == 0 and card.ability.serial2 == 6 and card.ability.serial3 == 9) or (card.ability.serial1 == 6 and card.ability.serial2 == 9 and card.ability.serial3 == 0) or (card.ability.serial1 == 4 and card.ability.serial2 == 2 and card.ability.serial3 == 0) then
			card.ability.extra_value = card.ability.jackpot
			card:set_cost()
		end
	end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.mult > 0 then
            return {
                mult_mod = card.ability.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.mult } }
            }
        end
        
        if context.end_of_round and context.main_eval and not context.repetition then
			card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra
			card:set_cost()
			return{
			message = localize("k_val_up"),
			colour = G.C.MONEY
			}
        end
    end
}
SMODS.Joker {
    key = "powercreep",
    name = "Power Creep",
    atlas = 'Wzone',
    loc_txt = {
        name = "Power Creep",
        text = {
            "{X:mult,C:white}X#1#{} Mult",
			"Create a {C:dark_edition}Negative{} copy of itself if not",
			"{C:dark_edition}negative{} when defeating a {C:attention}Boss Blind{} with",
			"double the required score or more",
            
        }
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 2,
    config = {
        xmult = 1.5,
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.xmult}
        }
    end,
    pos = { x = 3, y = 4 },
    cost = 6,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult_mod = card.ability.xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } }
            }
        end
        if context.after and context.cardarea == G.jokers and G.GAME.blind:get_type() == "Boss" and not context.blueprint and ((card.edition or {}).key ~= 'e_negative') then
		    if to_big(G.GAME.chips) + to_big(hand_chips) * to_big(mult) > to_big(G.GAME.blind.chips*2) then
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                local _nah = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_Wzon_powercreep")
					_nah:set_edition({negative = true})
					_nah:add_to_deck()
					G.jokers:emplace(_nah)
				return true end}))
			end
        end
    end
}
traffikrab_requirement = function()
	if next(SMODS.find_mod('Pokermon')) then
		return 6
	else
		return 4
	end
end
SMODS.Joker { 
  key = "traffikrab",
  loc_txt = {
        name = "Traffikrab",
        text = {
            "Enhances {C:attention}#1#{} random card in",
			"played hand to {C:attention}Poisonous{} when",
			"{C:attention}score catches on fire{}",
			"{C:inactive,s:0.8}(Improves already Poisonous cards)",
			"{C:inactive,s:0.8}({C:attention,s:0.8}Remasters{C:inactive,s:0.8} after enhancing {C:attention,s:0.8}#2#{C:inactive,s:0.8} cards)",
            
        }
    },
  pos = {x = 0, y = 0},
  config = {extra = {to_poison = 1, poisoned = 0, ptype = "Plastic"}, evo_rqmt = traffikrab_requirement()},
  loc_vars = function(self, info_queue, card)
	type_tooltipmine(self, info_queue, card)
	if next(SMODS.find_mod('Pokermon')) and card.ability.extra.ptype == "Plastic" and card.ability.extra.to_poison > 1 then
		info_queue[#info_queue+1] = {set = 'Other', key = 'energy',specific_vars = {card.ability.extra.to_poison-1,energy_max}}
	end
	info_queue[#info_queue + 1] = {
							set = "Other",
							key = 'remaster',
						}
	return {vars = {card.ability.extra.to_poison,card.ability.evo_rqmt}}
  end,
  rarity = 1, 
  cost = 4, 
  stage = "Basic",
  atlas = "cbeasts",
  unlocked = true,
  discovered = true,
  eternal_compat = next(SMODS.find_mod('Pokermon')),
  perishable_compat = next(SMODS.find_mod('Pokermon')),
  blueprint_compat = true,
  set_ability = function(self, card, initial, delay_sprites)
		if pseudorandom('traffikrab') < (1 / 10) and next(SMODS.find_mod('Pokermon')) then
			card.ability.extra.ptype = pseudorandom_element({"Grass", "Fire", "Water", "Lightning", "Psychic", "Fighting", "Dark", "Metal", "Colorless", "Fairy", "Dragon"})
		end
    end,
	add_to_deck = function(self, card, from_debuff)
		if card.ability.extra.ptype == "Plastic" then
			G.GAME.pool_flags.plastic_mon = true
		end
		end,
  update = function(self, card)
	if next(SMODS.find_mod('Pokermon')) then
		for index, value in ipairs({"Plastic", "Grass", "Fire", "Water", "Lightning", "Psychic", "Fighting", "Dark", "Metal", "Colorless", "Fairy", "Dragon"}) do
			if value == card.ability.extra.ptype then
				card.children.center:set_sprite_pos({x=index-1, y=0})
			end
		end
	end
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.after then
			if to_big(hand_chips)*to_big(mult) > to_big(G.GAME.blind.chips) then
				local chosencard
				for i = 1, card.ability.extra.to_poison do
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
					chosencard = pseudorandom_element(context.scoring_hand)
					chosencard:juice_up(0.3, 0.5)
					if chosencard.config.center and chosencard.config.center == G.P_CENTERS.m_Wzon_poisonous then
						if not chosencard.edition then
						chosencard:set_edition("e_foil",true)
					else
						if not chosencard.seal then
							chosencard:set_seal("Red",true)
						else
							chosencard.ability.perma_bonus = chosencard.ability.perma_bonus or 0
							chosencard.ability.perma_bonus = chosencard.ability.perma_bonus + 20
						end
					end
					else
						chosencard:set_ability(G.P_CENTERS.m_Wzon_poisonous, nil, false)
					end
				return true end }))
				if not context.blueprint then
				card.ability.extra.poisoned = card.ability.extra.poisoned + 1
				end
				end
				if not context.blueprint then
				return {
                    message = tostring(card.ability.extra.poisoned)  ..  "/"  ..  tostring(self.config.evo_rqmt),
                    delay = 0.45, 
                    card = card
                }
				end
			end
		end
	if next(SMODS.find_mod('Pokermon')) and not context.blueprint then
	    return scaling_evo(self, card, context, what_remaster(card), card.ability.extra.poisoned, self.config.evo_rqmt)
	elseif context.end_of_round and context.main_eval and not context.repetition and card.ability.extra.poisoned >= card.ability.evo_rqmt and not context.blueprint then
		card:start_dissolve()
		local remaster = create_card("Joker", G.jokers, nil, nil, nil, nil, what_remaster(card))
		remaster:add_to_deck()
		G.jokers:emplace(remaster)
		return {
                    message = "Remaster",
                    card = remaster
                }
	end
  end
}
remaster_rarity = function()
	if next(SMODS.find_mod('Pokermon')) then
		return "poke_safari"
	else
		return 2
	end
end
SMODS.Joker { 
  key = "lobstacle",
  loc_txt = {
        name = "Lobstacle",
        text = {
            "Enhances {C:attention}#1#{} random card in",
			"played hand to {C:attention}Poisonous{} when",
			"{C:attention}score catches on fire{}",
			"{C:inactive,s:0.8}(Improves already Poisonous cards)",
			"Gains {X:mult,C:white}X#3#{} Mult every time a",
			"card is enhanced this way",
			"{C:inactive,s:0.8}(Currently {X:mult,C:white,s:0.8}X#2#{C:inactive,s:0.8} Mult)"
        }
    },
  pos = {x = 0, y = 1},
  config = {extra = {to_poison = 1, ptype = "Plastic", Xmult = 1, Xmult_mod = .25}},
  loc_vars = function(self, info_queue, card)
	type_tooltipmine(self, info_queue, card)
	if next(SMODS.find_mod('Pokermon')) and card.ability.extra.ptype == "Plastic" and card.ability.extra.to_poison > 1 then
		info_queue[#info_queue+1] = {set = 'Other', key = 'energy',specific_vars = {card.ability.extra.to_poison-1,energy_max}}
	end
	return {vars = {card.ability.extra.to_poison,card.ability.extra.Xmult,card.ability.extra.Xmult_mod}}
  end,
  rarity = remaster_rarity(), 
  cost = 8,
  unlocked = true,
  discovered = true,
  stage = "One",
  atlas = "cbeasts",
  eternal_compat = next(SMODS.find_mod('Pokermon')),
  perishable_compat = next(SMODS.find_mod('Pokermon')),
  blueprint_compat = true,
  yes_pool_flag = "remasterspokermoncompat",
  set_ability = function(self, card, initial, delay_sprites)
		if pseudorandom('lobstacle') < (1 / 10) and next(SMODS.find_mod('Pokermon')) then
			card.ability.extra.ptype = pseudorandom_element({"Grass", "Fire", "Water", "Lightning", "Fighting", "Dark", "Metal", "Colorless", "Fairy", "Dragon"})
		end
    end,
	add_to_deck = function(self, card, from_debuff)
		if card.ability.extra.ptype == "Plastic" then
			G.GAME.pool_flags.plastic_mon = true
		end
		end,
  update = function(self, card)
	if next(SMODS.find_mod('Pokermon')) then
		for index, value in ipairs({"Plastic", "Grass", "Fire", "Water", "Lightning", "Psychic", "Fighting", "Dark", "Metal", "Colorless", "Fairy", "Dragon"}) do
			if value == card.ability.extra.ptype then
				card.children.center:set_sprite_pos({x=index-1, y=1})
			end
		end
	end
  end,
  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.Xmult > 1 then
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } }
            }
        end
    if context.cardarea == G.jokers and context.after then
			if to_big(hand_chips)*to_big(mult) > to_big(G.GAME.blind.chips) then
				local chosencard
				for i = 1, card.ability.extra.to_poison do
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
					chosencard = pseudorandom_element(context.scoring_hand)
					chosencard:juice_up(0.3, 0.5)
					if not context.blueprint then
					card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
					end
					if chosencard.config.center and chosencard.config.center == G.P_CENTERS.m_Wzon_poisonous then
						if not chosencard.edition then
						chosencard:set_edition("e_foil",true)
					else
						if not chosencard.seal then
							chosencard:set_seal("Red",true)
						else
							chosencard.ability.perma_bonus = chosencard.ability.perma_bonus or 0
							chosencard.ability.perma_bonus = chosencard.ability.perma_bonus + 20
						end
					end
					else
						chosencard:set_ability(G.P_CENTERS.m_Wzon_poisonous, nil, false)
					end
				return true end }))
				end
				if not context.blueprint then
				return {
                    message = "Upgrade!",
                    delay = 0.45, 
                    card = card,
					colour = G.C.RED
                }
				end
			end
		end
	end
}
SMODS.Joker { 
  key = "weevilite",
  loc_txt = {
        name = "Weevilite",
        text = {
            "{C:attention}Poisonous{} cards in played hand spread",
			"to adjacent cards {C:attention}#1#{} #2#",
			"{C:inactive,s:0.8}(Improves already Poisonous cards)",
			"Enhances {C:attention}#1#{} random card in played hand",
			"to {C:attention}Poisonous{} instead if hand has none"
        }
    },
  pos = {x = 0, y = 2},
  config = {extra = {to_poison = 1, ptype = "Plastic"},nopoison = false},
  loc_vars = function(self, info_queue, card)
	type_tooltipmine(self, info_queue, card)
	if next(SMODS.find_mod('Pokermon')) and card.ability.extra.ptype == "Plastic" and card.ability.extra.to_poison > 1 then
		info_queue[#info_queue+1] = {set = 'Other', key = 'energy',specific_vars = {card.ability.extra.to_poison-1,energy_max}}
	end
	local _time
	if card.ability.extra.to_poison == 1 then
		_time = "time"
	else
		_time = "times"
	end
	return {vars = {card.ability.extra.to_poison,_time}}
  end,
  rarity = remaster_rarity(), 
  cost = 8,
  unlocked = true,
  discovered = true,
  stage = "One",
  atlas = "cbeasts",
  eternal_compat = next(SMODS.find_mod('Pokermon')),
  perishable_compat = next(SMODS.find_mod('Pokermon')),
  blueprint_compat = true,
  yes_pool_flag = "remasterspokermoncompat",
  set_ability = function(self, card, initial, delay_sprites)
		if pseudorandom('lobstacle') < (1 / 10) and next(SMODS.find_mod('Pokermon')) then
			card.ability.extra.ptype = pseudorandom_element({"Grass", "Fire", "Water", "Lightning", "Fighting", "Dark", "Metal", "Colorless", "Fairy", "Dragon"})
		end
    end,
	add_to_deck = function(self, card, from_debuff)
		if card.ability.extra.ptype == "Plastic" then
			G.GAME.pool_flags.plastic_mon = true
		end
		end,
  update = function(self, card)
	if next(SMODS.find_mod('Pokermon')) then
		for index, value in ipairs({"Plastic", "Grass", "Fire", "Water", "Lightning", "Psychic", "Fighting", "Dark", "Metal", "Colorless", "Fairy", "Dragon"}) do
			if value == card.ability.extra.ptype then
				card.children.center:set_sprite_pos({x=index-1, y=2})
			end
		end
	end
  end,
  calculate = function(self, card, context)
    if context.after then
        card.ability.nopoison = false
    end

    if context.cardarea == G.jokers and context.before then
        for i = 1, #context.scoring_hand do
            if context.scoring_hand[i].config.center and context.scoring_hand[i].config.center == G.P_CENTERS.m_Wzon_poisonous then
                return
            end
        end

        local chosencard
        for i = 1, card.ability.extra.to_poison do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    chosencard = pseudorandom_element(context.scoring_hand)
                    chosencard:juice_up(0.3, 0.5)
                    card:juice_up(0.3, 0.5)
                    if chosencard.config.center and chosencard.config.center == G.P_CENTERS.m_Wzon_poisonous then
                        if not chosencard.edition then
                            chosencard:set_edition("e_foil", true)
                        elseif not chosencard.seal then
                            chosencard:set_seal("Red", true)
                        else
                            chosencard.ability.perma_bonus = chosencard.ability.perma_bonus or 0
                            chosencard.ability.perma_bonus = chosencard.ability.perma_bonus + 20
                        end
                    else
                        chosencard:set_ability(G.P_CENTERS.m_Wzon_poisonous, nil, false)
                    end
                    return true
                end
            }))
        end
        card.ability.nopoison = true
    end

    if context.cardarea == G.play and context.repetition and not context.repetition_only and card.ability.nopoison == false then
        for i = 1, #context.scoring_hand do
            if context.scoring_hand[i] == context.other_card and context.scoring_hand[i].config.center and context.scoring_hand[i].config.center == G.P_CENTERS.m_Wzon_poisonous then
                if context.scoring_hand[i - 1] then
                    for j = 1, card.ability.extra.to_poison do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.1,
                            func = function()
                                context.scoring_hand[i - 1]:juice_up(0.3, 0.5)
                                card:juice_up(0.3, 0.5)
                                if context.scoring_hand[i - 1].config.center and context.scoring_hand[i - 1].config.center == G.P_CENTERS.m_Wzon_poisonous then
                                    if not context.scoring_hand[i - 1].edition then
                                        context.scoring_hand[i - 1]:set_edition("e_foil", true)
                                    elseif not context.scoring_hand[i - 1].seal then
                                        context.scoring_hand[i - 1]:set_seal("Red", true)
                                    else
                                        context.scoring_hand[i - 1].ability.perma_bonus = context.scoring_hand[i - 1].ability.perma_bonus or 0
                                        context.scoring_hand[i - 1].ability.perma_bonus = context.scoring_hand[i - 1].ability.perma_bonus + 20
                                    end
                                else
                                    context.scoring_hand[i - 1]:set_ability(G.P_CENTERS.m_Wzon_poisonous, nil, false)
                                end
                                return true
                            end
                        }))
                    end
                end

                if context.scoring_hand[i + 1] then
                    for j = 1, card.ability.extra.to_poison do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.1,
                            func = function()
                                context.scoring_hand[i + 1]:juice_up(0.3, 0.5)
                                card:juice_up(0.3, 0.5)
                                if context.scoring_hand[i + 1].config.center and context.scoring_hand[i + 1].config.center == G.P_CENTERS.m_Wzon_poisonous then
                                    if not context.scoring_hand[i + 1].edition then
                                        context.scoring_hand[i + 1]:set_edition("e_foil", true)
                                    elseif not context.scoring_hand[i + 1].seal then
                                        context.scoring_hand[i + 1]:set_seal("Red", true)
                                    else
                                        context.scoring_hand[i + 1].ability.perma_bonus = context.scoring_hand[i + 1].ability.perma_bonus or 0
                                        context.scoring_hand[i + 1].ability.perma_bonus = context.scoring_hand[i + 1].ability.perma_bonus + 20
                                    end
                                else
                                    context.scoring_hand[i + 1]:set_ability(G.P_CENTERS.m_Wzon_poisonous, nil, false)
                                end
                                return true
                            end
                        }))
                    end
                end
            end
        end
    end
end

}
if next(SMODS.find_mod('Pokermon')) then
SMODS.Joker { 
  key = "magikrab",
  loc_txt = {
        name = "Magikrab",
        text = {
            "Retrigger all cards in played",
			"hand, {C:attention}Poison{} cards retrigger",
			"{C:attention}#1#{} more #2#",
        }
    },
  pos = {x = 5, y = 1},
  config = {extra = {to_poison = 1, ptype = "Psychic"}},
  loc_vars = function(self, info_queue, card)
	type_tooltipmine(self, info_queue, card)
	local _time
	if card.ability.extra.to_poison == 1 then
		_time = "time"
	else
		_time = "times"
	end
	return {vars = {card.ability.extra.to_poison,_time}}
  end,
  rarity = "poke_safari", 
  cost = 10,
  unlocked = true,
  discovered = true,
  stage = "One",
  atlas = "cbeasts",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if context.other_card.config.center == G.P_CENTERS.m_Wzon_poisonous then
				return {
					message = 'Again!',
					repetitions = card.ability.extra.to_poison + 1,
					card = card
				}
			else
				return {
					message = 'Again!',
					repetitions = 1,
					card = card
				}
			end
		end
  end
}
end
SMODS.Joker {
    key = "burn_my_dread",
    name = "Burn my Dread",
    atlas = 'Wzone',
    loc_txt = {
        name = "Burn my Dread",
        text = {
            "Create a copy of {C:tarot}#1#{}",
			"when {C:attention}Blind{} is defeated,",
			"#2#{C:tarot}#4#{C:red}#3#",
			"{C:inactive}(must have room)"
        }
    },
	config = {
		current = 1,
		tarot_cards = {
			"The Fool",
			"The Magician",
			"The High Priestess",
			"The Empress",
			"The Emperor",
			"The Hierophant",
			"The Lovers",
			"The Chariot",
			"Strength",
			"The Hermit",
			"Wheel of Fortune",
			"Justice",
			"The Hanged Man",
			"Death",
			"The Universe"
		}

    },
	loc_vars = function(self, info_queue, card)
		if next(SMODS.find_mod('Bunco')) then
				_tarot_keys = {"c_fool", "c_magician", "c_high_priestess", "c_empress", "c_emperor", "c_heirophant", "c_lovers", "c_chariot", "c_strength", "c_hermit", "c_wheel_of_fortune", "c_justice", "c_hanged_man", "c_death", "c_bunc_universe"}
			else
				_tarot_keys = {"c_fool", "c_magician", "c_high_priestess", "c_empress", "c_emperor", "c_heirophant", "c_lovers", "c_chariot", "c_strength", "c_hermit", "c_wheel_of_fortune", "c_justice", "c_hanged_man", "c_death", "c_Wzon_universe"}		
			end
		info_queue[#info_queue+1] =  --[[{key = _tarot_keys[card.ability.current], set = 'Tarot'}]] _tarot_keys[card.ability.current] and G.P_CENTERS[_tarot_keys[card.ability.current]] or nil
		if card.ability.current >= 15 then
			return {
				vars = {card.ability.tarot_cards[card.ability.current],"", "self destructs", ""}
			}
		else
			return {
				vars = {card.ability.tarot_cards[card.ability.current], "then switch to the next ","","Tarot"}
			}
		end
	end,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 1,
    pos = { x = 4, y = 4 },
    cost = 6,
    calculate = function(self, card, context)
		if context.end_of_round and context.main_eval and not context.repetition and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
			local _tarot_keys
			if next(SMODS.find_mod('Bunco')) then
				_tarot_keys = {"c_fool", "c_magician", "c_high_priestess", "c_empress", "c_emperor", "c_heirophant", "c_lovers", "c_chariot", "c_strength", "c_hermit", "c_wheel_of_fortune", "c_justice", "c_hanged_man", "c_death", "c_bunc_universe"}
			else
				_tarot_keys = {"c_fool", "c_magician", "c_high_priestess", "c_empress", "c_emperor", "c_heirophant", "c_lovers", "c_chariot", "c_strength", "c_hermit", "c_wheel_of_fortune", "c_justice", "c_hanged_man", "c_death", "c_Wzon_universe"}		
			end
			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
				local _Tarot = create_card('Tarot', G.consumeables, nil, nil, nil, true, _tarot_keys[card.ability.current])
				_Tarot:add_to_deck()
				G.consumeables:emplace(_Tarot)
				G.GAME.consumeable_buffer = 0
				card.ability.current = card.ability.current + 1
			return true end}))
			if card.ability.current > 14 then
				G.GAME.pool_flags.ironclad_bought = true
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
					card:start_dissolve()
				return true end}))
			else
				return {
					message = "Arcana Shift",
					delay = 0.45, 
					card = card
				}
			end
		end
	end
}
SMODS.Joker {
    key = "aria_of_the_soul",
    name = "Aria of the Soul",
    atlas = 'Wzone',
    loc_txt = {
        name = "Aria of the Soul",
        text = {
            "Destroy your first {C:attention}2{} consumables",
			"at the end the of {C:attention}shop{} and gain {C:money}$#1#{},",
			"Create a {C:tarot}Tarot{} card if the destroyed",
			"cards were {C:tarot}Tarots{} between {C:attention}0{} and {C:attention}XX"
        }
    },
	config = {
		extra = {dollars = 6},
		tarot_fusion = { --the fucking fusion spreadsheet from Persona 5
    c_fool = {
        c_fool = "c_fool", c_magician = "c_death", c_high_priestess = "c_moon", c_empress = "c_hanged_man", c_emperor = "c_temperance",
        c_heirophant = "c_hermit", c_lovers = "c_chariot", c_chariot = "c_moon", c_justice = "c_star", c_hermit = "c_high_priestess",
        c_wheel_of_fortune = "c_lovers", c_strength = "c_death", c_hanged_man = "c_tower", c_death = "c_strength", c_temperance = "c_heirophant",
        c_devil = "c_temperance", c_tower = "c_empress", c_star = "c_magician", c_moon = "c_justice", c_sun = "c_justice", c_judgement = "c_sun"
    },
    c_magician = {
        c_fool = "c_death", c_magician = "c_magician", c_high_priestess = "c_temperance", c_empress = "c_justice", c_emperor = "c_hanged_man",
        c_heirophant = "c_death", c_lovers = "c_devil", c_chariot = "c_high_priestess", c_justice = "c_emperor", c_hermit = "c_lovers",
        c_wheel_of_fortune = "c_justice", c_strength = "c_fool", c_hanged_man = "c_empress", c_death = "c_hermit", c_temperance = "c_chariot",
        c_devil = "c_heirophant", c_tower = "c_temperance", c_star = "c_high_priestess", c_moon = "c_lovers", c_sun = "c_heirophant", c_judgement = "c_strength"
    },
    c_high_priestess = {
        c_fool = "c_moon", c_magician = "c_temperance", c_high_priestess = "c_high_priestess", c_empress = "c_emperor", c_emperor = "c_empress",
        c_heirophant = "c_magician", c_lovers = "c_wheel_of_fortune", c_chariot = "c_heirophant", c_justice = "c_death", c_hermit = "c_temperance",
        c_wheel_of_fortune = "c_magician", c_strength = "c_devil", c_hanged_man = "c_death", c_death = "c_magician", c_temperance = "c_devil",
        c_devil = "c_moon", c_tower = "c_hanged_man", c_star = "c_hermit", c_moon = "c_heirophant", c_sun = "c_chariot", c_judgement = "c_justice"
    },
    c_empress = {
        c_fool = "c_hanged_man", c_magician = "c_justice", c_high_priestess = "c_emperor", c_empress = "c_empress", c_emperor = "c_justice",
        c_heirophant = "c_fool", c_lovers = "c_judgement", c_chariot = "c_star", c_justice = "c_lovers", c_hermit = "c_strength",
        c_wheel_of_fortune = "c_hermit", c_strength = "c_chariot", c_hanged_man = "c_high_priestess", c_death = "c_fool", c_temperance = "c_high_priestess",
        c_devil = "c_sun", c_tower = "c_emperor", c_star = "c_lovers", c_moon = "c_wheel_of_fortune", c_sun = "c_tower", c_judgement = "c_emperor"
    },
    c_emperor = {
        c_fool = "c_temperance", c_magician = "c_hanged_man", c_high_priestess = "c_empress", c_empress = "c_justice", c_emperor = "c_emperor",
        c_heirophant = "c_wheel_of_fortune", c_lovers = "c_fool", c_chariot = "c_strength", c_justice = "c_chariot", c_hermit = "c_heirophant",
        c_wheel_of_fortune = "c_sun", c_strength = "c_tower", c_hanged_man = "c_devil", c_death = "c_hermit", c_temperance = "c_devil",
        c_devil = "c_justice", c_tower = "c_star", c_star = "c_lovers", c_moon = "c_tower", c_sun = "c_judgement", c_judgement = "c_high_priestess"
    },
    c_heirophant = {
        c_fool = "c_hermit", c_magician = "c_death", c_high_priestess = "c_magician", c_empress = "c_fool", c_emperor = "c_wheel_of_fortune",
        c_heirophant = "c_heirophant", c_lovers = "c_strength", c_chariot = "c_star", c_justice = "c_hanged_man", c_hermit = "c_wheel_of_fortune",
        c_wheel_of_fortune = "c_justice", c_strength = "c_fool", c_hanged_man = "c_sun", c_death = "c_chariot", c_temperance = "c_death",
        c_devil = "c_hanged_man", c_tower = "c_judgement", c_star = "c_tower", c_moon = "c_high_priestess", c_sun = "c_lovers", c_judgement = "c_empress"
    },
    c_lovers = {
        c_fool = "c_chariot", c_magician = "c_devil", c_high_priestess = "c_wheel_of_fortune", c_empress = "c_judgement", c_emperor = "c_fool",
        c_heirophant = "c_strength", c_lovers = "c_lovers", c_chariot = "c_temperance", c_justice = "c_judgement", c_hermit = "c_chariot",
        c_wheel_of_fortune = "c_strength", c_strength = "c_death", c_hanged_man = "c_sun", c_death = "c_temperance", c_temperance = "c_strength",
        c_devil = "c_moon", c_tower = "c_empress", c_star = "c_chariot", c_moon = "c_magician", c_sun = "c_empress", c_judgement = "c_hanged_man"
    },
    c_chariot = {
        c_fool = "c_moon", c_magician = "c_high_priestess", c_high_priestess = "c_heirophant", c_empress = "c_star", c_emperor = "c_strength",
        c_heirophant = "c_star", c_lovers = "c_temperance", c_chariot = "c_chariot", c_justice = "c_moon", c_hermit = "c_devil",
        c_wheel_of_fortune = "c_high_priestess", c_strength = "c_hermit", c_hanged_man = "c_fool", c_death = "c_devil", c_temperance = "c_strength",
        c_devil = "c_temperance", c_tower = "c_wheel_of_fortune", c_star = "c_moon", c_moon = "c_lovers", c_sun = "c_high_priestess", c_judgement = "c_heirophant"
    },
    c_justice = {
        c_fool = "c_star", c_magician = "c_emperor", c_high_priestess = "c_death", c_empress = "c_lovers", c_emperor = "c_chariot",
        c_heirophant = "c_hanged_man", c_lovers = "c_judgement", c_chariot = "c_moon", c_justice = "c_justice", c_hermit = "c_magician",
        c_wheel_of_fortune = "c_emperor", c_strength = "c_heirophant", c_hanged_man = "c_lovers", c_death = "c_fool", c_temperance = "c_emperor",
        c_devil = "c_fool", c_tower = "c_sun", c_star = "c_empress", c_moon = "c_devil", c_sun = "c_hanged_man", c_judgement = "c_tower"
    },
    c_hermit = {
        c_fool = "c_high_priestess", c_magician = "c_lovers", c_high_priestess = "c_temperance", c_empress = "c_strength", c_emperor = "c_heirophant",
        c_heirophant = "c_wheel_of_fortune", c_lovers = "c_chariot", c_chariot = "c_devil", c_justice = "c_magician", c_hermit = "c_hermit",
        c_wheel_of_fortune = "c_star", c_strength = "c_heirophant", c_hanged_man = "c_star", c_death = "c_strength", c_temperance = "c_strength",
        c_devil = "c_high_priestess", c_tower = "c_judgement", c_star = "c_strength", c_moon = "c_high_priestess", c_sun = "c_devil", c_judgement = "c_emperor"
    },
    c_wheel_of_fortune = {
        c_fool = "c_lovers", c_magician = "c_justice", c_high_priestess = "c_magician", c_empress = "c_hermit", c_emperor = "c_sun",
        c_heirophant = "c_justice", c_lovers = "c_strength", c_chariot = "c_high_priestess", c_justice = "c_emperor", c_hermit = "c_star",
        c_wheel_of_fortune = "c_wheel_of_fortune", c_strength = "c_temperance", c_hanged_man = "c_emperor", c_death = "c_star", c_temperance = "c_empress",
        c_devil = "c_heirophant", c_tower = "c_hanged_man", c_star = "c_devil", c_moon = "c_sun", c_sun = "c_star", c_judgement = "c_tower"
    },
    c_strength = {
        c_fool = "c_death", c_magician = "c_fool", c_high_priestess = "c_devil", c_empress = "c_chariot", c_emperor = "c_tower",
        c_heirophant = "c_fool", c_lovers = "c_death", c_chariot = "c_hermit", c_justice = "c_heirophant", c_hermit = "c_heirophant",
        c_wheel_of_fortune = "c_temperance", c_strength = "c_strength", c_hanged_man = "c_temperance", c_death = "c_heirophant", c_temperance = "c_chariot",
        c_devil = "c_death", c_tower = "c_chariot", c_star = "c_moon", c_moon = "c_magician", c_sun = "c_moon", c_judgement = "c_wheel_of_fortune"
    },
    c_hanged_man = {
        c_fool = "c_tower", c_magician = "c_empress", c_high_priestess = "c_death", c_empress = "c_high_priestess", c_emperor = "c_devil",
        c_heirophant = "c_sun", c_lovers = "c_sun", c_chariot = "c_fool", c_justice = "c_lovers", c_hermit = "c_star",
        c_wheel_of_fortune = "c_emperor", c_strength = "c_temperance", c_hanged_man = "c_hanged_man", c_death = "c_moon", c_temperance = "c_death",
        c_devil = "c_wheel_of_fortune", c_tower = "c_hermit", c_star = "c_justice", c_moon = "c_strength", c_sun = "c_heirophant", c_judgement = "c_star"
    },
    c_death = {
        c_fool = "c_strength", c_magician = "c_hermit", c_high_priestess = "c_magician", c_empress = "c_fool", c_emperor = "c_hermit",
        c_heirophant = "c_chariot", c_lovers = "c_temperance", c_chariot = "c_devil", c_justice = "c_fool", c_hermit = "c_strength",
        c_wheel_of_fortune = "c_star", c_strength = "c_heirophant", c_hanged_man = "c_moon", c_death = "c_death", c_temperance = "c_hanged_man",
        c_devil = "c_chariot", c_tower = "c_sun", c_star = "c_devil", c_moon = "c_heirophant", c_sun = "c_high_priestess", c_judgement = "c_magician"
    },
    c_temperance = {
        c_fool = "c_heirophant", c_magician = "c_chariot", c_high_priestess = "c_devil", c_empress = "c_high_priestess", c_emperor = "c_devil",
        c_heirophant = "c_death", c_lovers = "c_strength", c_chariot = "c_strength", c_justice = "c_emperor", c_hermit = "c_strength",
        c_wheel_of_fortune = "c_empress", c_strength = "c_chariot", c_hanged_man = "c_death", c_death = "c_hanged_man", c_temperance = "c_temperance",
        c_devil = "c_fool", c_tower = "c_wheel_of_fortune", c_star = "c_sun", c_moon = "c_wheel_of_fortune", c_sun = "c_magician", c_judgement = "c_hermit"
    },
    c_devil = {
        c_fool = "c_temperance", c_magician = "c_heirophant", c_high_priestess = "c_moon", c_empress = "c_sun", c_emperor = "c_justice",
        c_heirophant = "c_hanged_man", c_lovers = "c_moon", c_chariot = "c_temperance", c_justice = "c_fool", c_hermit = "c_high_priestess",
        c_wheel_of_fortune = "c_heirophant", c_strength = "c_death", c_hanged_man = "c_wheel_of_fortune", c_death = "c_chariot", c_temperance = "c_fool",
        c_devil = "c_devil", c_tower = "c_magician", c_star = "c_strength", c_moon = "c_chariot", c_sun = "c_hermit", c_judgement = "c_lovers"
    },
    c_tower = {
        c_fool = "c_empress", c_magician = "c_temperance", c_high_priestess = "c_hanged_man", c_empress = "c_emperor", c_emperor = "c_star",
        c_heirophant = "c_judgement", c_lovers = "c_empress", c_chariot = "c_wheel_of_fortune", c_justice = "c_sun", c_hermit = "c_judgement",
        c_wheel_of_fortune = "c_hanged_man", c_strength = "c_chariot", c_hanged_man = "c_hermit", c_death = "c_sun", c_temperance = "c_wheel_of_fortune",
        c_devil = "c_magician", c_tower = "c_tower", c_star = "c_death", c_moon = "c_hermit", c_sun = "c_emperor", c_judgement = "c_moon"
    },
    c_star = {
        c_fool = "c_magician", c_magician = "c_high_priestess", c_high_priestess = "c_hermit", c_empress = "c_lovers", c_emperor = "c_lovers",
        c_heirophant = "c_tower", c_lovers = "c_chariot", c_chariot = "c_moon", c_justice = "c_empress", c_hermit = "c_strength",
        c_wheel_of_fortune = "c_devil", c_strength = "c_moon", c_hanged_man = "c_justice", c_death = "c_devil", c_temperance = "c_sun",
        c_devil = "c_strength", c_tower = "c_death", c_star = "c_star", c_moon = "c_temperance", c_sun = "c_judgement", c_judgement = "c_wheel_of_fortune"
    },
    c_moon = {
        c_fool = "c_justice", c_magician = "c_lovers", c_high_priestess = "c_heirophant", c_empress = "c_wheel_of_fortune", c_emperor = "c_tower",
        c_heirophant = "c_high_priestess", c_lovers = "c_magician", c_chariot = "c_lovers", c_justice = "c_devil", c_hermit = "c_high_priestess",
        c_wheel_of_fortune = "c_sun", c_strength = "c_magician", c_hanged_man = "c_strength", c_death = "c_heirophant", c_temperance = "c_wheel_of_fortune",
        c_devil = "c_chariot", c_tower = "c_hermit", c_star = "c_temperance", c_moon = "c_moon", c_sun = "c_empress", c_judgement = "c_fool"
    },
    c_sun = {
        c_fool = "c_justice", c_magician = "c_heirophant", c_high_priestess = "c_chariot", c_empress = "c_tower", c_emperor = "c_judgement",
        c_heirophant = "c_lovers", c_lovers = "c_empress", c_chariot = "c_high_priestess", c_justice = "c_hanged_man", c_hermit = "c_devil",
        c_wheel_of_fortune = "c_star", c_strength = "c_moon", c_hanged_man = "c_heirophant", c_death = "c_high_priestess", c_temperance = "c_magician",
        c_devil = "c_hermit", c_tower = "c_emperor", c_star = "c_judgement", c_moon = "c_empress", c_sun = "c_sun", c_judgement = "c_death"
    },
    c_judgement = {
        c_fool = "c_sun", c_magician = "c_strength", c_high_priestess = "c_justice", c_empress = "c_emperor", c_emperor = "c_high_priestess",
        c_heirophant = "c_empress", c_lovers = "c_hanged_man", c_chariot = "c_heirophant", c_justice = "c_tower", c_hermit = "c_emperor",
        c_wheel_of_fortune = "c_tower", c_strength = "c_wheel_of_fortune", c_hanged_man = "c_star", c_death = "c_magician", c_temperance = "c_hermit",
        c_devil = "c_lovers", c_tower = "c_moon", c_star = "c_wheel_of_fortune", c_moon = "c_fool", c_sun = "c_death", c_judgement = "c_judgement"
    }
}
    },
	loc_vars = function(self, info_queue, card)
		return {
				vars = {card.ability.extra.dollars}
			}
	end,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 1,
    pos = { x = 0, y = 5 },
    cost = 6,
    calculate = function(self, card, context)
    if context.ending_shop then
        local _cons1
        local _cons2
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function()
            if #G.consumeables.cards + (G.GAME.consumeable_buffer or 0) >= 2 then
				card:juice_up()
                _cons1 = G.consumeables.cards[1].config.center.key
                _cons2 = G.consumeables.cards[2].config.center.key
                G.consumeables.cards[2]:start_dissolve()
                G.consumeables.cards[1]:start_dissolve()
                if _cons1 == "c_bunc_adjustment" then
                    _cons1 = "c_strength"
                end
                if _cons2 == "c_bunc_adjustment" then
                    _cons2 = "c_strength"
                end
                if _cons1 == "c_bunc_art" then
                    _cons1 = "c_temperance"
                end
                if _cons2 == "c_bunc_art" then
                    _cons2 = "c_temperance"
                end
                if _cons1 == "c_bunc_lust" then
                    _cons1 = "c_justice"
                end
                if _cons2 == "c_bunc_lust" then
                    _cons2 = "c_justice"
                end
                if (card.ability.tarot_fusion[_cons1] and card.ability.tarot_fusion[_cons1][_cons2] or nil) then
                    local _Tarot = create_card('Tarot', G.consumeables, nil, nil, nil, true, (card.ability.tarot_fusion[_cons1] and card.ability.tarot_fusion[_cons1][_cons2] or nil))
                    _Tarot:add_to_deck()
                    G.consumeables:emplace(_Tarot)
                    G.GAME.consumeable_buffer = 0
                elseif (card.ability.tarot_fusion[_cons2] and card.ability.tarot_fusion[_cons2][_cons1] or nil) then
                    local _Tarot = create_card('Tarot', G.consumeables, nil, nil, nil, true, (card.ability.tarot_fusion[_cons2] and card.ability.tarot_fusion[_cons2][_cons1] or nil))
                    _Tarot:add_to_deck()
                    G.consumeables:emplace(_Tarot)
                    G.GAME.consumeable_buffer = 0
                end
				SMODS.calculate_effect({
					dollars = card.ability.extra.dollars,
				}, context.blueprint_card or card)
            end
            return true
        end }))
    end
end
}
SMODS.Joker {
    key = "planeswalker",
    name = "Planeswalker",
    atlas = 'planeswalker',
    loc_txt = {
        name = "Planeswalker",
        text = {
            "Has {C:attention}3 different effects{} based",
			"on position, {C:red}self-destructs",
			"if {C:attention}loyalty{} reaches {C:attention}0",
			"{C:inactive}(currently {C:attention}#1#{C:inactive} loyalty)"
        }
    },
	config = {
		extra = {loyalty = 3, increase = 2, decrease = 9, how_many = 2},
		},
	loc_vars = function(self, info_queue, card)
		local _chosen = "none"
		if G.jokers then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					if #G.jokers.cards >= 3 then
						if i > 2 * #G.jokers.cards / 3 then
							_chosen = "planeswalkerright"
						elseif i <= #G.jokers.cards / 3 then
							_chosen = "planeswalkerleft"
						else
							_chosen = "planeswalkermid"
					end
    			elseif #G.jokers.cards == 2 then
    			    _chosen = i == 1 and "planeswalkerleft" or "planeswalkermid"
    			elseif #G.jokers.cards == 1 then
     			   _chosen = "planeswalkerleft"
    			end
			end
		end
	end
		if _chosen == "none" then
			_chosen = "planeswalkeroriginal"
			info_queue[#info_queue+1] = { set = 'Other', key = 'planeswalkerleft', specific_vars = {card.ability.extra.increase} }
			info_queue[#info_queue+1] = { set = 'Other', key = 'planeswalkermid'}
			info_queue[#info_queue+1] = { set = 'Other', key = 'planeswalkerright', specific_vars = {card.ability.extra.decrease,card.ability.extra.how_many} }
		end
		return {vars = {card.ability.extra.loyalty,card.ability.extra.increase,card.ability.extra.decrease,card.ability.extra.how_many},
				key = _chosen, set = 'Joker',}
	end,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    rarity = 2,
    pos = { x = 0, y = 0 },
	soul_pos = { x = -1, y = -1, extra = { x = 0, y = 4 }},
    cost = 6,
	update = function(self, card)
		local _loyaltydisplay_
			if card.ability.extra.loyalty <= 9 then
				_loyaltydisplay_ = card.ability.extra.loyalty
			else
				_loyaltydisplay_ = 10
			end
		card.children.floating_sprite2:set_sprite_pos({  x = 0, y = _loyaltydisplay_ + 1 })
	end,
    calculate = function(self, card, context)
    if context.blueprint then return end
    if context.setting_blind then
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                if i > 2 * #G.jokers.cards / 3 and #G.jokers.cards >= 3 then
                    if card.ability.extra.loyalty >= card.ability.extra.decrease then
                        card.ability.extra.loyalty = card.ability.extra.loyalty - card.ability.extra.decrease
                        local _wtfthekingwow
                        local _suit
                        
                        for j = 1, card.ability.extra.how_many do
                            _suit = pseudorandom_element({'S', 'H', 'D', 'C'}, pseudoseed('planeswalker'))
                            _wtfthekingwow = create_playing_card({front = G.P_CARDS[_suit..'_'.."K"], center = nil}, G.hand)
                            _wtfthekingwow:set_edition("e_polychrome", true)
                            _wtfthekingwow:set_seal("Red", true)
                            _wtfthekingwow:set_ability(G.P_CENTERS.m_steel, nil, true)
                        end

                        if card.ability.extra.loyalty <= 0 then
                            card:start_dissolve()
                            return
                        end

                        return {
                            message = "-"..card.ability.extra.decrease.." loyalty",
                        }
                    else
                        return
                    end
                elseif (i <= #G.jokers.cards / 3 and #G.jokers.cards >= 3) or (#G.jokers.cards < 3 and i == 1) then
                    card.ability.extra.loyalty = card.ability.extra.loyalty + card.ability.extra.increase
                    
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        local new_card = create_card('Joker', G.jokers, nil, 0, nil, nil, nil, 'planeswalker')
                        new_card:add_to_deck()
                        G.jokers:emplace(new_card)
                        new_card:start_materialize()
                        G.GAME.joker_buffer = 0
                    end
                    
                    return {
                        message = "+"..card.ability.extra.increase.." loyalty",
                    }
                elseif (i > #G.jokers.cards / 3 and #G.jokers.cards >= 3) or (#G.jokers.cards < 3) then
                    ease_hands_played(1)
                    return {
                        message = "+0 loyalty",
                    }
                end
            end
        end
    end
end

}
SMODS.Joker {
    key = "stonemask",
    name = "Stone Mask",
    atlas = 'Wzone',
    loc_txt = {
        name = "Stone Mask",
        text = {
            "you're not supposed to read this", 
        },
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 2,
    config = {
        howmany = 15,
		currently = 0,
		randomflagineedbecauseotherwisethingsgobad = 0
    },
    loc_vars = function(self, info_queue, card)
		local _chosen
		if next(SMODS.find_card('j_vampire')) then
			_chosen = "stonemaskvampire"
		else
			_chosen = "stonemasknovampire"
			info_queue[#info_queue+1] = "j_vampire" and G.P_CENTERS.j_vampire or nil
		end
        return {
            vars = {card.ability.howmany,card.ability.currently},
			key = _chosen, set = 'Joker',
        }
    end,
    pos = { x = 1, y = 5 },
    cost = 5,
    calculate = function(self, card, context)
		if next(SMODS.find_card('j_vampire')) then
			if context.before and context.cardarea == G.jokers and not (context.individual or context.repetition) then
				local _truth = 0
				for i = 1, #context.scoring_hand do
					if context.scoring_hand[i]:is_suit("Hearts") and context.scoring_hand[i].ability.set ~= "Enhanced" then
						context.scoring_hand[i]:juice_up()
						context.scoring_hand[i]:set_ability(G.P_CENTERS[SMODS.poll_enhancement({guaranteed = true})])
						_truth = 1
					end
				end
				if _truth == 1 then
					return {
					message = "Enhanced",
					card = card
					}
				end
			end
		elseif context.individual and context.cardarea == G.play then
			if context.other_card:is_suit("Hearts") then
				card.ability.currently = card.ability.currently + 1
				if card.ability.currently < card.ability.howmany then
					return {
					message = tostring(card.ability.currently)  ..  "/" .. tostring(card.ability.howmany),
					card = card
					}
				elseif card.ability.randomflagineedbecauseotherwisethingsgobad == 0 then
					card.ability.randomflagineedbecauseotherwisethingsgobad = 1
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
					card:start_dissolve()
					local __vampire = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_vampire")
					__vampire:add_to_deck()
					G.jokers:emplace(__vampire)
					return true end }))
				end
			end
		end
	end
}
SMODS.Joker {
    key = "loan",
    name = "Loan",
    atlas = 'Wzone',
    loc_txt = {
        name = "Loan",
        text = {
			"{C:chips}-#1#{} Chips per card",
			"in played hand",
            "First played card gives",
			"{C:chips}+#2#{} Chips when scored",
        }
		,boxes = {2,2}
    },
	config = {extra = {chips = 40}},
	loc_vars = function(self, info_queue, card)
		return {
            vars = {card.ability.extra.chips,card.ability.extra.chips * 5}
        }
	end,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 1,
    pos = { x = 2, y = 5 },
    cost = 3,
    calculate = function(self, card, context)
		if context.joker_main then
			return {
			chips = -(card.ability.extra.chips * #context.full_hand),
			card = card
			}
		end
		if context.individual and context.cardarea == G.play then
			if context.other_card == context.scoring_hand[1] then
				return {
				chips = card.ability.extra.chips * 5,
				card = card
				}
			end
		end
	end 
}
SMODS.Joker {
    key = "bluestorm",
    name = "Bluestorm",
    atlas = 'Wzone',
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 2,
    config = {
        howmany = 6,
		currently = 0,
		double = false,
    },
    pos = { x = 3, y = 5 },
    cost = 10,
	update = function(self, card, front)
		card.ability.brainstorm_compat = "nothing"
		card.ability.blueprint_compat = "nothing"
		if G.jokers then
		for i = 1, #G.jokers.cards do
				if G.jokers.cards[1] == card and next(SMODS.find_card('j_brainstorm')) then
					if G.jokers.cards[2] and G.jokers.cards[2] ~= card and G.jokers.cards[2].config.center.blueprint_compat then
						card.ability.blueprint_compat = true
					else
						card.ability.blueprint_compat = false
					end
				end

				if G.jokers.cards[i] == card and i > 1 and G.jokers.cards[i - 1].config.center_key == 'j_blueprint' then
					if G.jokers.cards[1] and G.jokers.cards[1] ~= card and G.jokers.cards[1].config.center.blueprint_compat then
						card.ability.brainstorm_compat = true
					else
						card.ability.brainstorm_compat = false
					end
				end
				if G.jokers.cards[i] == card and i ~= 1 then
					local _broken = false
					for j = 1, i do
						if G.jokers.cards[j].config.center_key ~= 'j_blueprint' and G.jokers.cards[j] ~= card then
						_broken = true
						break
						end
					end
        
					if _broken == false and next(SMODS.find_card('j_brainstorm')) then
						if G.jokers.cards[1] and G.jokers.cards[1] ~= card and G.jokers.cards[1].config.center.blueprint_compat then
							card.ability.brainstorm_compat = true
						else
							card.ability.brainstorm_compat = false
						end
						if G.jokers.cards[i+1] and G.jokers.cards[i+1] ~= card and G.jokers.cards[i+1].config.center.blueprint_compat then
							card.ability.blueprint_compat = true
						else
							card.ability.blueprint_compat = false
						end
						break
					end
				end
				if (G.jokers.cards[1] == card and G.jokers.cards[i].config.center_key == 'j_brainstorm' and G.jokers.cards[i - 1] and G.jokers.cards[i - 1].config.center_key == 'j_blueprint') then
					card.ability.brainstorm_compat = true
					if G.jokers.cards[i+1] and G.jokers.cards[i+1] ~= card and G.jokers.cards[i+1].config.center.blueprint_compat then
						card.ability.blueprint_compat = true
					else
						card.ability.blueprint_compat = false
					end
					break
				end
			end
		end
	end,
    calculate = function(self, card, context)
		if next(SMODS.find_card('j_blueprint')) or next(SMODS.find_card('j_brainstorm')) then
			local blueprinted_joker = nil
			local brainstormed_joker = nil
			local copied_joker
			local maybe_double = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[1] == card and next(SMODS.find_card('j_brainstorm')) then
					blueprinted_joker = G.jokers.cards[2]
					brainstormed_joker = nil
				end

				if G.jokers.cards[i] == card and i > 1 and G.jokers.cards[i - 1].config.center_key == 'j_blueprint' then
					brainstormed_joker = G.jokers.cards[1]
					blueprinted_joker = nil
				end
				if G.jokers.cards[i] == card and i ~= 1 then
					local _broken = false
					for j = 1, i do
						if G.jokers.cards[j].config.center_key ~= 'j_blueprint' and G.jokers.cards[j] ~= card then
						_broken = true
						break
						end
					end
        
					if _broken == false and next(SMODS.find_card('j_brainstorm')) then
						blueprinted_joker = G.jokers.cards[i + 1] or nil
						brainstormed_joker = G.jokers.cards[i + 1] or nil
						break
					end
				end
				if (G.jokers.cards[1] == card and G.jokers.cards[i].config.center_key == 'j_brainstorm' and G.jokers.cards[i - 1] and G.jokers.cards[i - 1].config.center_key == 'j_blueprint') then
					blueprinted_joker = G.jokers.cards[2]
					brainstormed_joker = G.jokers.cards[2]
					break
				end
			end

			if blueprinted_joker and brainstormed_joker then
				copied_joker = brainstormed_joker
				maybe_double = true
			elseif blueprinted_joker then
				copied_joker = blueprinted_joker
			elseif brainstormed_joker then
				copied_joker = brainstormed_joker
			end
			if copied_joker and copied_joker ~= card then
				if maybe_double == true then
					SMODS.calculate_effect(SMODS.blueprint_effect(card, copied_joker, context)or{}, context.blueprint_card or card)
					return SMODS.blueprint_effect(card, copied_joker, context)
				else
					return SMODS.blueprint_effect(card, copied_joker, context)
				end
			end
		else
			if context.end_of_round and context.main_eval and not context.repetition and not context.blueprint then
				if card.ability.currently >= card.ability.howmany - 1 then
					card.ability.currently = card.ability.currently + 1
					local eval = function(card) return not card.REMOVED and not(next(SMODS.find_card('j_blueprint')) or next(SMODS.find_card('j_brainstorm'))) end
					juice_card_until(card, eval, true)
				end
				if card.ability.currently < card.ability.howmany then
				card.ability.currently = card.ability.currently + 1
					return {
					message = tostring(card.ability.currently)  ..  "/" .. tostring(card.ability.howmany),
					}
				end
			end
			if context.selling_self and card.ability.currently >= card.ability.howmany and not context.blueprint then
				local _who_ = pseudorandom_element({'j_blueprint','j_brainstorm'})
				local __ship = create_card("Joker", G.jokers, nil, nil, nil, nil, _who_)
				__ship:add_to_deck()
				G.jokers:emplace(__ship)
			end
		end
	end,
	generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
	local _whatbluestorm
	if next(SMODS.find_card('j_blueprint')) or next(SMODS.find_card('j_brainstorm')) then
		_whatbluestorm = "bluestormcopier"
	else
		_whatbluestorm = "bluestormlonely"
	end
	full_UI_table.name = localize{type = 'name', key = _whatbluestorm, set = "Other", name_nodes = {}, vars = specific_vars or {}}
	localize{type = 'descriptions', key = _whatbluestorm,  set = "Other", nodes = desc_nodes, vars = {card.ability.howmany,card.ability.currently}}
	info_queue[#info_queue+1] = "j_blueprint" and G.P_CENTERS.j_blueprint or nil
	info_queue[#info_queue+1] = "j_brainstorm" and G.P_CENTERS.j_brainstorm or nil
	if next(SMODS.find_card('j_blueprint')) or next(SMODS.find_card('j_brainstorm')) then
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        if card.area and card.area == G.jokers then
			if card.ability.blueprint_compat ~= "nothing" then
            desc_nodes[#desc_nodes+1] = {
                {n=G.UIT.C, config={align = "bm", minh = 0.4}, nodes={
                    {n=G.UIT.C, config={align = "cm", colour = G.C.CLEAR}, nodes={
                        {n=G.UIT.T, config={text = 'Joker to the right ',colour = G.C.UI.TEXT_INACTIVE, scale = 0.32*0.8}},
                    }},
                    {n=G.UIT.C, config={ref_table = self, align = "m", colour = card.ability.blueprint_compat and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06}, nodes={
                        {n=G.UIT.T, config={text = ' '..localize(card.ability.blueprint_compat and 'k_compatible' or 'k_incompatible')..' ',colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.8}},
                    }}
                }}
            }
			end
			if card.ability.brainstorm_compat ~= "nothing" then
            desc_nodes[#desc_nodes+1] = {
                {n=G.UIT.C, config={align = "bm", minh = 0.4}, nodes={
                    {n=G.UIT.C, config={align = "cm", colour = G.C.CLEAR}, nodes={
                        {n=G.UIT.T, config={text = 'leftmost Joker ',colour = G.C.UI.TEXT_INACTIVE, scale = 0.32*0.8}},
                    }},
                    {n=G.UIT.C, config={ref_table = self, align = "m", colour = card.ability.brainstorm_compat and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06}, nodes={
                        {n=G.UIT.T, config={text = ' '..localize(card.ability.brainstorm_compat and 'k_compatible' or 'k_incompatible')..' ',colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.8}},
                    }}
                }}
            }
			end
        end
    end
end
}

if not next(SMODS.find_mod('Bunco')) then
	SMODS.Consumable{
		set = 'Tarot',
		atlas = 'tarots',
		key = 'universe',
		loc_txt = {
			name = "The Universe",
			text = {
				"{C:attention}Instantly wins{} the current",
				"{C:attention}Blind{}, destroys all consumables,",
				"permanently sets hands to {C:blue}1",
			}
		},
		pos = { x = 0, y = 0 },
		yes_pool_flag = 'universenyx',
		can_use = function(self, card)
			if G.GAME.blind.in_blind then
				return true
			end
		end,    
		use = function(self, card)
			G.GAME.round_resets.hands = 1
			G.E_MANAGER:add_event(Event({
        blocking = false,
        func = function()
			for i = 1, #G.consumeables.cards do
				G.consumeables.cards[i]:start_dissolve()
			end
            if G.STATE == G.STATES.SELECTING_HAND then
                G.GAME.chips = G.GAME.blind.chips
                G.STATE = G.STATES.HAND_PLAYED
                G.STATE_COMPLETE = true
                end_round()
                return true
            end
        end
    }))
		end
	}
end

SMODS.ConsumableType {
    key = 'GuestAppearance',
    primary_colour = HEX('c32a2a'),
    secondary_colour = HEX('902e2e'),
    loc_txt = {
        ["name"] = 'Guest Consumable',
        ["collection"] = 'Guest Appearances',
        ["undiscovered"] = {
            ["name"] = 'Not Discovered',
            ["text"] = {
                [1] = 'Purchase or use',
                [2] = 'this card in an',
                [3] = 'unseeded run to',
                [4] = 'learn what it does'
            }
        }
    }
}

SMODS.Consumable{
    set = 'GuestAppearance',
	atlas = 'guestapp',
    key = 'fiendfire',
	loc_txt = {
        name = "Fiend Fire",
        text = {
            "Choose one card, destroy all others",
			"and create a {C:dark_edition}Negative \"{C:attention}Joker{}\"",
			"with {C:mult}Mult bonus{} equal to half the",
			"{C:attention}total ranks{} of all destroyed cards",
        }
    },
	pos = { x = 0, y = 0 },
	can_use = function(self, card)
    if G.hand and (G.hand.highlighted and #G.hand.highlighted == 1) and #G.hand.cards > 1 then
        return true
    end    
end,    
use = function(self, card)
	local totalrank = 0
	local _destroyed = {}
        for i = 1, #G.hand.cards do
            local is_highlighted = false
            for j = 1, #G.hand.highlighted do
                if G.hand.cards[i] == G.hand.highlighted[j] then
                    is_highlighted = true
                    break
                end
            end
            if not is_highlighted then
				totalrank = totalrank + G.hand.cards[i]:get_id()
                G.hand.cards[i]:start_dissolve()
				table.insert(_destroyed, G.hand.cards[i])
            end
        end
	for j = 1, #G.jokers.cards do
				eval_card(G.jokers.cards[j], {
					cardarea = G.jokers,
					remove_playing_cards = true,
					removed = _destroyed
				})
			end
	local custom_jimbo = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joker")
			custom_jimbo:set_edition({negative = true})
			custom_jimbo.ability.mult = totalrank / 2
            custom_jimbo:add_to_deck()
            G.jokers:emplace(custom_jimbo)
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function()
            G.hand:unhighlight_all();
        return true end }))
end
}
SMODS.Consumable{
    set = 'GuestAppearance',
	atlas = 'guestapp',
    key = 'bloodletting',
	loc_txt = {
        name = "Bloodletting",
        text = {
            "Gain {C:attention}+1{} hand size",
			"all required scores",
			"are increased by {C:attention}6%{}"
        }
    },
	pos = { x = 1, y = 0 },
	can_use = function(self, card)
        return true 
end,    
use = function(self, card)
	G.hand:change_size(1)
	G.GAME.starting_params.ante_scaling = (G.GAME.starting_params.ante_scaling / 100) * (100 + 6)
	G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    G.HUD_blind:get_UIE_by_ID('HUD_blind_count').UIBox:recalculate()
	play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
end
}
SMODS.Consumable{
    set = 'GuestAppearance',
	atlas = 'guestapp',
    key = 'armaments',
	loc_txt = {
        name = "Armaments",
        text = {
            "Add {C:chips}+5{} Chips and a random",
			"{C:attention}enhancement{}, {C:attention}seal{} and",
			"{C:attention}edition{} to {C:attention}1{} selected card",
        }
    },
	pos = { x = 2, y = 0 },
	can_use = function(self, card)
    if G.hand and (G.hand.highlighted and #G.hand.highlighted == 1) then
        return true
    end    
end,    
use = function(self, card)
	local edition = poll_edition('armament',nil,true,true)
	G.hand.highlighted[1]:set_ability(G.P_CENTERS[SMODS.poll_enhancement({guaranteed = true})])
	G.hand.highlighted[1]:set_seal(SMODS.poll_seal({guaranteed = true, type_key = seal_type}))
	G.hand.highlighted[1]:set_edition(edition,true)
	G.hand.highlighted[1].ability.perma_bonus = G.hand.highlighted[1].ability.perma_bonus + 5
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function()
            G.hand:unhighlight_all();
        return true end }))
end
}
SMODS.Consumable{
    set = 'GuestAppearance',
	atlas = 'guestapp',
    key = 'distraction',
	loc_txt = {
        name = "Distraction",
        text = {
            "{C:chips}+1{} hand this",
			"round, creates a",
			"random {C:attention}consumable"
        }
    },
	pos = { x = 3, y = 0 },
	can_use = function(self, card)
	if G.GAME.blind.in_blind then
        return true
	end
end,    
use = function(self, card)
	ease_hands_played(1)
	local randomcons = create_card('Consumeables', G.consumeables, nil, nil, nil, nil, nil)
    randomcons:add_to_deck()
    G.consumeables:emplace(randomcons)
	G.GAME.consumeable_buffer = 0
end
}
SMODS.Consumable{
    set = 'GuestAppearance',
	atlas = 'guestapp',
    key = 'bouncingflask',
	loc_txt = {
        name = "Bouncing Flask",
        text = {
            "Enhances {C:attention}1{} random card into",
			"a {C:attention}Poisonous Card 3{} times",
			"{C:inactive}(can improve already Poisonous Cards)"
        }
    },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] =  G.P_CENTERS.m_Wzon_poisonous
	end,
	pos = { x = 4, y = 0 },
	can_use = function(self, card)
    if G.hand then
		return true 
	end
end,    
use = function(self, card)
	local chosencard
	for i = 1, 3 do
		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
		chosencard = pseudorandom_element(G.hand.cards)
		chosencard:juice_up(0.3, 0.5)
		if chosencard.config.center and chosencard.config.center == G.P_CENTERS.m_Wzon_poisonous then
			if not chosencard.edition then
				chosencard:set_edition("e_foil",true)
			else
				if not chosencard.seal then
					chosencard:set_seal("Red",true)
				else
					chosencard.ability.perma_bonus = chosencard.ability.perma_bonus or 0
					chosencard.ability.perma_bonus = chosencard.ability.perma_bonus + 20
				end
			end
		else
			chosencard:set_ability(G.P_CENTERS.m_Wzon_poisonous, nil, true)--("m_Wzon_poisonous")
		end
		return true end }))
	end
end
}
SMODS.Consumable{
    set = 'GuestAppearance',
	atlas = 'guestapp',
    key = 'calculatedgamble',
	loc_txt = {
        name = "Calculated Gamble",
        text = {
            "Gain {C:mult}+1{} discard",
        }
    },
	pos = { x = 5, y = 0 },
	can_use = function(self, card)
        return true 
end,    
use = function(self, card)
	G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
	ease_discard(1)
	play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
end
}
SMODS.Consumable{
    set = 'GuestAppearance',
	atlas = 'guestapp',
    key = 'zap',
	loc_txt = {
        name = "Zap",
        text = {
            "Channel {C:attention}Lightning{} on {C:attention}1{}",
			"selected card or Joker"
        }
    },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'Wzon_lightning', set = 'Other'}
	end,
	pos = { x = 6, y = 0 },
	can_use = function(self, card)
        if ((G.hand and (G.hand.highlighted and #G.hand.highlighted == 1)) and not (G.jokers and (G.jokers.highlighted and #G.jokers.highlighted == 1))) or (not (G.hand and (G.hand.highlighted and #G.hand.highlighted == 1)) and (G.jokers and (G.jokers.highlighted and #G.jokers.highlighted == 1))) then
        return true
    end  
end,    
use = function(self, card)
	if #G.hand.highlighted == 1 then
		G.hand.highlighted[1]:juice_up()
		G.hand.highlighted[1]:add_sticker("Wzon_lightning", true)
		G.hand:unhighlight_all()
	else
		G.jokers.highlighted[1]:juice_up()
		G.jokers.highlighted[1]:add_sticker("Wzon_lightning", true)
		G.jokers:unhighlight_all()
	end
	play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
end
}
SMODS.Consumable{
    set = 'GuestAppearance',
	atlas = 'guestapp',
    key = 'coolheaded',
	loc_txt = {
        name = "Coolheaded",
        text = {
            "Channel {C:attention}Frost{} on {C:attention}1{}",
			"selected card or Joker,",
			"draw {C:attention}1{} card"
        }
    },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'Wzon_frost', set = 'Other'}
	end,
	pos = { x = 7, y = 0 },
	can_use = function(self, card)
        if ((G.hand and (G.hand.highlighted and #G.hand.highlighted == 1)) and not (G.jokers and (G.jokers.highlighted and #G.jokers.highlighted == 1))) or (not (G.hand and (G.hand.highlighted and #G.hand.highlighted == 1)) and (G.jokers and (G.jokers.highlighted and #G.jokers.highlighted == 1))) then
        return true
    end  
end,    
use = function(self, card)
	if #G.hand.highlighted == 1 then
		G.hand.highlighted[1]:juice_up()
		G.hand.highlighted[1]:add_sticker("Wzon_frost", true)
		G.hand:unhighlight_all()
	else
		G.jokers.highlighted[1]:juice_up()
		G.jokers.highlighted[1]:add_sticker("Wzon_frost", true)
		G.jokers:unhighlight_all()
	end
	play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
	if G.GAME.blind.in_blind then
		G.FUNCS.draw_from_deck_to_hand(1)
	end
end
}
SMODS.Consumable{
    set = 'GuestAppearance',
	atlas = 'guestapp',
    key = 'darkness',
	loc_txt = {
        name = "Darkness",
        text = {
            "Channel {C:attention}Dark{} on",
			"{C:attention}1{} selected Joker"
        }
    },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'Wzon_dark', set = 'Other'}
	end,
	pos = { x = 8, y = 0 },
	can_use = function(self, card)
        if G.jokers and (G.jokers.highlighted and #G.jokers.highlighted == 1) then
        return true
    end  
end,    
use = function(self, card)
	G.jokers.highlighted[1]:juice_up()
	G.jokers.highlighted[1]:add_sticker("Wzon_dark", true)
	G.jokers:unhighlight_all()
	play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
end
}
if next(SMODS.find_mod('Pokermon')) then      --Pokermon compat stuff
local igomine = Game.init_game_object
function Game:init_game_object()
	local ret = igomine(self)
	ret.pool_flags.remasterspokermoncompat = true
	return ret
end

SMODS.Consumable{
  name = "plastic_energy",
  key = "plastic_energy",
  loc_txt = {
                name = "Plastic Energy",
                text = {
                    "Increases most {C:attention}scoring{} and {C:money}${} number",
                    "values of leftmost or selected {C:attention}Plastic{} type",
                    "Joker permanently if able",
                    "{C:inactive}(Max of {C:attention}#1#{C:inactive} increases per Joker)",
                },
            },
  set = "Energy",
  loc_vars = function(self, info_queue, center)
	type_tooltip(self, info_queue, center)
    return {vars = {(pokermon_config.unlimited_energy and localize("poke_unlimited_energy")) or energy_max}}
  end,
  yes_pool_flag = 'plastic_mon',
  pos = { x = 0, y = 0 },
  atlas = "pokermon",
  cost = 4,
  etype = "Plastic",
  unlocked = true,
  discovered = true,
  can_use = function(self, card)
    if not G.jokers.highlighted or #G.jokers.highlighted ~= 1 then
      return energy_can_use(self, card)
    else
      return highlighted_energy_can_use(self, card)
    end
  end,
  use = function(self, card, area, copier)
    if not G.jokers.highlighted or #G.jokers.highlighted ~= 1 then
      return energy_use(self, card, area, copier)
    else
      return highlighted_energy_use(self, card, area, copier)
    end
  end
}
SMODS.Consumable{
  name = "ritual",
  key = "ritual",loc_txt = {
                name = "Ritual",
                text = {
                    "Transforms selected Joker with a {C:pink}Type{}",
                    "into one with different {C:pink}Type{} and",
                    "same {C:attention}Family{} and {C:attention}Stage{} {C:inactive}(if possible)",
					"or vice-versa"
                },
            },
  set = "Spectral",
  pos = { x = 1, y = 0 },
  atlas = "pokermon",
  cost = 3,
  unlocked = true,
  discovered = true,
  use = function(self, card)
    local selected = G.jokers.highlighted[1]
    local _eeveelutions = {"j_poke_vaporeon", "j_poke_jolteon", "j_poke_flareon", "j_poke_espeon", "j_poke_umbreon", "j_poke_glaceon", "j_poke_leafeon", "j_poke_sylveon"}

    if selected.config.center_key == "j_Wzon_traffikrab" or selected.config.center_key == "j_Wzon_lobstacle" or selected.config.center_key == "j_Wzon_weevilite" then
        local typelist = {"Plastic", "Grass", "Fire", "Water", "Lightning", "Fighting", "Dark", "Metal", "Colorless", "Fairy", "Dragon"}
        local _who = (selected.config.center_key == "j_Wzon_traffikrab") 
            and {"j_Wzon_traffikrab"} 
            or {"j_Wzon_lobstacle", "j_Wzon_weevilite"}
        
        return {
            message = evolve(selected, selected, "lol", pseudorandom_element(_who), pseudorandom_element(typelist))
        }
    else
        for index, value in ipairs(_eeveelutions) do
            if value == selected.config.center_key then
                table.remove(_eeveelutions, index)
                return {
                    message = evolve(selected, selected, "lol", pseudorandom_element(_eeveelutions))
                }
            end
        end

        local _type = selected.ability.extra.ptype
        return {
            message = evolve(selected, selected, "lol", get_random_poke_key("ritual", stage, pokerarity, area, _type))
        }
    end
end,
  can_use = function(self, card)
    return G.jokers.highlighted and #G.jokers.highlighted == 1 and has_type(G.jokers.highlighted[1])
  end,
}
local old_matching_energy = matching_energy
matching_energy = function(card)
	if card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra.ptype and card.ability.extra.ptype == "Plastic" then
		return "c_Wzon_plastic_energy"
	end
	return old_matching_energy(card)
end
energy_values.to_poison = 1
table.insert(family, {"j_Wzon_traffikrab","j_Wzon_lobstacle","j_Wzon_weevilite","j_Wzon_magikrab"})
local old_scaling_evo = scaling_evo
scaling_evo = function(self, card, context, forced_key, current, target)
	if card.config.center_key == "j_Wzon_traffikrab" then
		if (SMODS.Mods["Talisman"] or {}).can_load then
    current = to_big(current)
    target = to_big(target)
  end
  if can_evolve(self, card, context, forced_key) and current >= target then
    return {
      message = evolve (self, card, context, forced_key, card.ability.extra.ptype)
    }
  end
	else
		return old_scaling_evo
	end
end
local old_evolve = evolve
evolve = function(self, card, context, forced_key, bootleg)
if bootleg then
  if not context.retrigger_joker then
    local previous_position = nil
    local poketype_list = nil
    local previous_edition = nil
    local previous_perishable = nil
    local previous_perish_tally = nil
    local previous_eternal = nil
    local previous_rental = nil
    local previous_energy_count = nil
    local previous_c_energy_count = nil
    local shiny = nil
    local type_sticker = nil
    local scaled_values = nil
    local reset_apply_type = nil
    local previous_extra_value = nil
    local previous_targets = nil
    local previous_rank = nil
    local previous_id = nil
    local previous_cards_scored = nil
    local previous_upgrade = nil
    local previous_mega = nil
    
    for i = 1, #G.jokers.cards do
      if G.jokers.cards[i] == card then
        previous_position = i
        break
      end
    end
    
    if card.edition then
      previous_edition = card.edition
      if card.edition.poke_shiny then
        shiny = true
      end
    end
    
    if card.ability.perishable then
      previous_perishable = card.ability.perishable
      previous_perish_tally = card.ability.perish_tally
    end
      
    if card.ability.eternal then
      previous_eternal = card.ability.eternal
    end

    if card.ability.rental then
      previous_rental = card.ability.rental
    end
    
    if card.ability.extra and card.ability.extra.energy_count then
      previous_energy_count  = card.ability.extra.energy_count
    end
      
    if card.ability.extra and card.ability.extra.c_energy_count then
      previous_c_energy_count  = card.ability.extra.c_energy_count
    end 
    
    scaled_values = copy_scaled_values(card)

    if type_sticker_applied then
      poketype_list = {"grass", "fire", "water", "lightning", "psychic", "fighting", "colorless", "dark", "metal", "fairy", "dragon", "earth"}
      for l, v in pairs(poketype_list) do
        if card.ability[v.."_sticker"] then
          type_sticker = v
          break
        end
      end
    end
    
    if card.ability.extra_value then
      previous_extra_value = card.ability.extra_value
    end
    
    if card.ability.extra and card.ability.extra.targets then
      previous_targets = card.ability.extra.targets
    end
    
    if card.ability.name == "fidough" then
      previous_rank = card.ability.extra.rank
      previous_id = card.ability.extra.id
    end
    
    if card.ability.name == "spearow" then
      previous_cards_scored = card.ability.extra.cards_scored
      previous_upgrade = card.ability.extra.upgrade
    end
    
    if card.config.center.rarity == "poke_mega" then
      previous_mega = true
    end
    
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
      remove(self, card, context)
    return true end }))
    
    if G.GAME.modifiers.apply_type then
      G.GAME.modifiers.apply_type = false
      reset_apply_type = true
    end
    
    local temp_card = {set = "Joker", area = G.jokers, key = forced_key, no_edition = true}
    local new_card = SMODS.create_card(temp_card)
    
    new_card.states.visible = false
    
    if reset_apply_type then
      G.GAME.modifiers.apply_type = true
    end
    
    if previous_edition then
      if shiny then
        local edition = {poke_shiny = true}
         new_card:set_edition(edition, true)
         new_card.config.shiny_on_add = true
         SMODS.change_booster_limit(-1)
      else
        new_card:set_edition(previous_edition, true)
      end
    end
    
    if previous_perishable then
       new_card.ability.perishable = previous_perishable
       if previous_mega or card.ability.extra.devolved or card.ability.perish_tally <= 0 then
        new_card.ability.extra.devolved = true
        new_card.ability.perish_tally = previous_perish_tally
       else
         new_card.ability.perish_tally = G.GAME.perishable_rounds
       end
    end

    if previous_eternal then
      new_card.ability.eternal = previous_eternal
    end

    if previous_rental then
      new_card.ability.rental = previous_rental
    end
    
    if new_card.ability and new_card.ability.extra and previous_energy_count then
      new_card.ability.extra.energy_count = previous_energy_count
    end
    
    if new_card.ability and new_card.ability.extra and previous_c_energy_count then
      new_card.ability.extra.c_energy_count = previous_c_energy_count
    end
    
    if new_card.ability and new_card.ability.extra and (new_card.ability.extra.energy_count or new_card.ability.extra.c_energy_count) then
      energize(new_card, nil, true)
    end
    
    if scaled_values then
      for l, v in pairs(scaled_values) do
        if v and v > 0 and new_card.ability and new_card.ability.extra and type(new_card.ability.extra) == "table" and new_card.ability.extra[l] and v > new_card.ability.extra[l] then
          new_card.ability.extra[l] = v
        end
      end
    end
    
    if type_sticker then
      apply_type_sticker(new_card, type_sticker)
    end
    
    if previous_extra_value then
      new_card.ability.extra_value = previous_extra_value
      new_card:set_cost()
    end
    
    if previous_targets then
      new_card.ability.extra.targets = previous_targets
    end
    
    if previous_rank and previous_id then
      new_card.ability.extra.rank = previous_rank
      new_card.ability.extra.id = previous_id
    end
    
    if previous_cards_scored then
      if previous_cards_scored >= 15 then
        previous_upgrade = true
        previous_cards_scored = previous_cards_scored - 15
      end
      new_card.ability.extra.cards_scored = previous_cards_scored
      new_card.ability.extra.upgrade = previous_upgrade
    end
    new_card.ability.extra.ptype = bootleg
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
        new_card:add_to_deck()
        G.jokers:emplace(new_card, previous_position)
        new_card.states.visible = true
    return true end }))

    return localize("poke_evolve_success")
  end
else
return old_evolve(self, card, context, forced_key)
end
end
end

local old_g_funcs_check_for_buy_space = G.FUNCS.check_for_buy_space --thank you More Fluff!
G.FUNCS.check_for_buy_space = function(card)
	if card.config.center_key == "j_Wzon_stack" then
		return true
	end
	if card.config.center_key == "j_Wzon_ironclad" or card.config.center_key == "j_Wzon_silent" or card.config.center_key == "j_Wzon_defect" then
		if #G.consumeables.cards + G.GAME.consumeable_buffer >= G.consumeables.config.card_limit then
			alert_no_space(card, G.consumeables)
			return false
		end
	end
	return old_g_funcs_check_for_buy_space(card)
end
local old_g_funcs_can_select_card = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
  if e.config.ref_table.config.center_key == "j_Wzon_stack" then 
    e.config.colour = G.C.GREEN
    e.config.button = 'use_card'
  elseif (e.config.ref_table.config.center_key == "j_Wzon_ironclad" or e.config.ref_table.config.center_key == "j_Wzon_silent" or e.config.ref_table.config.center_key == "j_Wzon_defect") and #G.consumeables.cards + G.GAME.consumeable_buffer >= G.consumeables.config.card_limit then
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		e.config.button = nil
  else
    old_g_funcs_can_select_card(e)
  end
end
to_big = to_big or function(value)
  return value
end
type_tooltipmine = function(self, info_queue, card)
	if card.ability.extra.ptype and card.ability.extra.ptype == "Plastic" and next(SMODS.find_mod('Pokermon')) then
		info_queue[#info_queue+1] = {set = 'Other', key = 'Plastic'}
	elseif next(SMODS.find_mod('Pokermon')) then
		return type_tooltip(self, info_queue, card)
	end
end
what_remaster = function(_card)
if next(SMODS.find_mod('Pokermon')) and _card.ability.extra.ptype == "Psychic" then
	return "j_Wzon_magikrab"
else
	for i = 1, #G.jokers.cards do
		if G.jokers.cards[i] == _card then
			if i > #G.jokers.cards/2 then
				return "j_Wzon_weevilite"
			else
				return "j_Wzon_lobstacle"
			end
		end
	end
end
end

SMODS.Enhancement{
    key = "poisonous",
    atlas = "enhancers",
    pos = {x = 0, y = 0},
    loc_txt={
        name="Poisonous Card",
        text = {
            "Reduces Blind by",
            "current amount of",
            "{C:chips}Chips{} when scored"
        }
    },
	in_pool = function(self)
        return false
    end,
	calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.play then
			local chips_to_subtract = to_big(hand_chips)
			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                    G.GAME.blind.chips = G.GAME.blind.chips - chips_to_subtract
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    
                    local chips_UI = G.hand_text_area.blind_chips
                    G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                    G.HUD_blind:recalculate() 
                    chips_UI:juice_up()
					card:juice_up()
                    if not silent then play_sound('chips2') end
                    return true end }))
		end
	end
}
SMODS.Sticker{
    key = "lightning",
    atlas = "stickers",
    pos = {x = 0, y = 0},
    loc_txt={
        name="Lightning",
		label="Lightning",
        text = {
            "{X:mult,C:white}X2{} Mult"
        }
    },
	default_compat = true,
	rate = 0,
	badge_colour = HEX("d0e029"),
	calculate = function(self,card,context)
        if (context.joker_main--[[post_joker]] and card.ability.set == "Joker") or (context.main_scoring and context.cardarea == G.play and (card.ability.set == 'Enhanced' or card.ability.set == 'Default')) then
			return {
                Xmult_mod = 2,
                message = localize { type = 'variable', key = 'a_xmult', vars = { 2 } }
            }
		end
	end
}
SMODS.Sticker{
    key = "frost",
    atlas = "stickers",
    pos = {x = 1, y = 0},
    loc_txt={
        name="Frost",
		label="Frost",
        text = {
            "{C:chips}+100{} Chips"
        }
    },
	default_compat = true,
	rate = 0,
	badge_colour = HEX("8deff0"),
	calculate = function(self,card,context)
        if (context.joker_main and card.ability.set == "Joker") or (context.main_scoring and context.cardarea == G.play and (card.ability.set == 'Enhanced' or card.ability.set == 'Default')) then
			return {
                chip_mod = 100,
				colour = G.C.CHIPS,
                message = localize { type = 'variable', key = 'a_chips', vars = { 100 } }
            }
		end
	end
}
SMODS.Sticker{
    key = "dark",
    atlas = "stickers",
    pos = {x = 2, y = 0},
    loc_txt={
        name="Dark",
		label="Dark",
        text = {
            "Sell the {C:attention}Joker{} this is applied",
			"to after two rounds to",
			"create a {C:dark_edition}Negative{} {C:attention}Joker{}",
			"of the same {C:attention}rarity{}"
        }
    },
	default_compat = true,
	rate = 0,
	badge_colour = HEX("b056df"),
	calculate = function(self,card,context)
		if context.before and not card.ability.darkorbturns then
			card.ability.darkorbturns = 0
		end
        if context.end_of_round and context.main_eval and not context.repetition and card.ability.darkorbturns < 2 then
			card.ability.darkorbturns = card.ability.darkorbturns + 1
			return {
				message = tostring(card.ability.darkorbturns)  ..  "/2",
				}
		elseif context.end_of_round and context.main_eval and card.ability.darkorbturns >= 2 then
			return {
				message = tostring(card.ability.darkorbturns)  ..  "/2",
				}
		end
		if context.selling_self and card.ability.darkorbturns and card.ability.darkorbturns >= 2 then
			local rarities = {"Common", "Uncommon", "Rare", "Legendary"}
			local _rarity = rarities[card.config.center.rarity]
			SMODS.add_card { set = 'Joker', rarity = _rarity, edition = "e_negative" }
		end
	end
}

SMODS.Rank {
	hc_atlas = 'forbidden',
    lc_atlas = 'forbidden',

	
	hidden = true,
	
    key = 'Forbidden', -- the number or name (ex. "Jack") of your rank if it has one
    card_key = 'Fo', -- the short key put after the suit when coding a card object (ex. for the card "H_5" the card_key is 5). this seems to usually match the shorthand
    pos = { x = 0 }, -- x position on the card atlas
    nominal = 0,  -- the number of chips this card scores
    next = { 'Wzon_Forbidden' }, -- the next rank directly above it, used for Strength Tarot
    shorthand = 'Fo', -- used for deck preview
	
	in_pool = function(self, args)
		return false
	end,
	should_register = function() end,
	loc_txt = {name = "Forbidden",}
}
SMODS.Suit {
    key = 'Joker',
    card_key = 'J',

    hc_atlas = 'forbidden',
    lc_atlas = 'forbidden',

    lc_ui_atlas = 'jimbosuit',
    hc_ui_atlas = 'jimbosuit',

    pos = {x = 0,y = 4},
    ui_pos = {x = 0,y = 0},

    lc_colour = HEX('FFBF01'),
    hc_colour = HEX('FFBF01'),

    loc_txt = {
        singular = 'Jimbo',
        plural = 'Jimbo'
    },
	in_pool = function(self, args)
		return false
	end,
	should_register = function() end,
}

SMODS.PokerHandPart{ -- Spectrum base (Referenced from SixSuits, only used for Obliterate calculations)
    key = 'spectrum',
    func = function(hand)
        local suits = {}

        -- determine suits to be used
        for _, v in ipairs(SMODS.Suit.obj_buffer) do
            suits[v] = 1
        end
        -- < 5 hand cant be a spectrum
        if #hand < 5 then return {} end

        local nonwilds = {}
        for i = 1, #hand do
            local cardsuits = {}
            for _, v in ipairs(SMODS.Suit.obj_buffer) do
                -- determine table of suits for each card (for future faster calculations)
                if hand[i]:is_suit(v, nil, true) then
                    table.insert(cardsuits, v)
                end
            end

            -- if somehow no suits: spectrum is impossible
            if #cardsuits == 0 then
                return {}
            -- if only 1 suit: can be handled immediately
            elseif #cardsuits == 1 then
                -- if suit is already present, not a spectrum, otherwise remove suit from "already used suits"
                if suits[cardsuits[1]] == 0 then return {} end
                suits[cardsuits[1]] = 0
            -- add all cards with 2-4 suits to a table to be looked at
            elseif #cardsuits < 5 then
                table.insert(nonwilds, cardsuits)
            end
        end

        -- recursive function for iterating over combinations
        local isSpectrum 
        isSpectrum = function(i, remaining)
            -- traversed all the cards, found spectrum
            if i == #nonwilds + 1 then
                return true
            end

            -- copy remaining suits
            local newremaining = {}
            for k, v in pairs(remaining) do
                newremaining[k] = v
            end

            -- for every suit of the current card: 
            for _, suit in ipairs(nonwilds[i]) do
                -- do nothing if suit has already been used
                if remaining[suit] == 1 then
                    -- use up suit on this card and check next card
                    newremaining[suit] = 0
                    if isSpectrum(i + 1, newremaining) then
                        return true
                    end
                    -- reset suit before continuing
                    newremaining[suit] = 1
                end
            end

            return false
        end

        -- begin iteration from first (not already considered) card
        if isSpectrum(1, suits) then
            return {hand}
        else
            return {}
        end
    end
}

SMODS.PokerHand {
    key = 'Obliterate',
    chips = 1e309,
    mult = 1e309,
	l_chips = 0,
	l_mult = 0,
	visible = false,
    example = {
        { 'H_Wzon_Fo', true },
        { 'S_Wzon_Fo', true },
        { 'Wzon_J_Wzon_Fo', true },
        { 'D_Wzon_Fo', true },
        { 'C_Wzon_Fo', true },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Obliterate!',
            description = {
                '5 Forbidden cards with',
                'different ranks',
            }
        }
    },
    evaluate = function(parts, hand)
        if not next(parts._5) and not next(parts.Wzon_spectrum) then return {} end
        local isforbid = true
        for j = 1, #hand do 
			local rank = SMODS.Ranks[hand[j].base.value]
            isforbid = isforbid and rank.key == 'Wzon_Forbidden'
        end
        if isforbid then return {hand} end
    end
}

--special soul layers for serialized Joker (shoutouts to Cryptid)
local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
	set_spritesref(self, _center, _front)
	if _center and _center.soul_pos and _center.soul_pos.extra then
		self.children.floating_sprite2 = Sprite(
			self.T.x,
			self.T.y,
			self.T.w,
			self.T.h,
			G.ASSET_ATLAS[_center.atlas or _center.set],
			_center.soul_pos.extra
		)
		self.children.floating_sprite2.role.draw_major = self
		self.children.floating_sprite2.states.hover.can = false
		self.children.floating_sprite2.states.click.can = false
		if _center.soul_pos.extra2 then
			self.children.floating_sprite3 = Sprite(
				self.T.x,
				self.T.y,
				self.T.w,
				self.T.h,
				G.ASSET_ATLAS[_center.atlas or _center.set],
				_center.soul_pos.extra2
			)
			self.children.floating_sprite3.role.draw_major = self
			self.children.floating_sprite3.states.hover.can = false
			self.children.floating_sprite3.states.click.can = false
			if _center.soul_pos.extra3 then
				self.children.floating_sprite4 = Sprite(
					self.T.x,
					self.T.y,
					self.T.w,
					self.T.h,
					G.ASSET_ATLAS[_center.atlas or _center.set],
					_center.soul_pos.extra3
				)
				self.children.floating_sprite4.role.draw_major = self
				self.children.floating_sprite4.states.hover.can = false
				self.children.floating_sprite4.states.click.can = false
			end
		end
	end
end
SMODS.DrawStep({
	key = "floating_sprite2",
	order = 59,
	func = function(self)
		if
			self.config.center.soul_pos
			and self.config.center.soul_pos.extra
			and (self.config.center.discovered or self.bypass_discovery_center)
		then
			local scale_mod = 0.07 -- + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
			local rotate_mod = 0 --0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
			self.children.floating_sprite2:draw_shader(
				"dissolve",
				0,
				nil,
				nil,
				self.children.center,
				scale_mod,
				rotate_mod,
				nil,
				0.1 --[[ + 0.03*math.cos(1.8*G.TIMERS.REAL)--]],
				nil,
				0.6
			)
			self.children.floating_sprite2:draw_shader(
				"dissolve",
				nil,
				nil,
				nil,
				self.children.center,
				scale_mod,
				rotate_mod
			)
		end
	end,
	conditions = { vortex = false, facing = "front" },
})
SMODS.draw_ignore_keys.floating_sprite2 = true
SMODS.DrawStep({
	key = "floating_sprite3",
	order = 59,
	func = function(self)
		if
			self.config.center.soul_pos
			and self.config.center.soul_pos.extra2
			and (self.config.center.discovered or self.bypass_discovery_center)
		then
			local scale_mod = 0.07 -- + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
			local rotate_mod = 0 --0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
			self.children.floating_sprite3:draw_shader(
				"dissolve",
				0,
				nil,
				nil,
				self.children.center,
				scale_mod,
				rotate_mod,
				nil,
				0.1 --[[ + 0.03*math.cos(1.8*G.TIMERS.REAL)--]],
				nil,
				0.6
			)
			self.children.floating_sprite3:draw_shader(
				"dissolve",
				nil,
				nil,
				nil,
				self.children.center,
				scale_mod,
				rotate_mod
			)
		end
	end,
	conditions = { vortex = false, facing = "front" },
})
SMODS.draw_ignore_keys.floating_sprite3 = true
SMODS.DrawStep({
	key = "floating_sprite4",
	order = 59,
	func = function(self)
		if
			self.config.center.soul_pos
			and self.config.center.soul_pos.extra3
			and (self.config.center.discovered or self.bypass_discovery_center)
		then
			local scale_mod = 0.07 -- + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
			local rotate_mod = 0 --0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
			self.children.floating_sprite4:draw_shader(
				"dissolve",
				0,
				nil,
				nil,
				self.children.center,
				scale_mod,
				rotate_mod,
				nil,
				0.1 --[[ + 0.03*math.cos(1.8*G.TIMERS.REAL)--]],
				nil,
				0.6
			)
			self.children.floating_sprite4:draw_shader(
				"dissolve",
				nil,
				nil,
				nil,
				self.children.center,
				scale_mod,
				rotate_mod
			)
		end
	end,
	conditions = { vortex = false, facing = "front" },
})
SMODS.draw_ignore_keys.floating_sprite4 = true

local old_create_UIBox_customize_deck = create_UIBox_customize_deck

function create_UIBox_customize_deck(...)
  local suitTabs = {}
  local index = 1

  for suitKey, _ in pairs(SMODS.Suits) do
    if suitKey ~= "Wzon_Joker" then
      suitTabs[index] = {
        label = localize(suitKey, 'suits_plural'),
        tab_definition_function = G.UIDEF.custom_deck_tab,
        tab_definition_function_args = suitKey
      }
      index = index + 1
    else
      print("Skipping suitKey: " .. suitKey)
    end
  end

  if #suitTabs > 0 then
    suitTabs[1].chosen = true
  end

  local t = create_UIBox_generic_options({ back_func = 'options', snap_back = nil, contents = {
    {n = G.UIT.R, config = {align = "cm", padding = 0}, nodes = {
      create_tabs(
        {tabs = suitTabs, snap_to_nav = true, no_shoulders = true}
      )
    }}
  }})

  return t
end



G.localization.descriptions.Other["masquerade_reminder"] = {
        name = "Masquerade the Blazing Dragon", --tooltip name
       text = {
           "{C:chips}+#1#{} Chips",
           "{C:mult}+#2#{} Mult",
           "Reduces full blind by",
		   "{C:attention}0.8%{} for every scoring card"
       }
   }
G.localization.descriptions.Other["discostats"] = {
        name = "Joker Stats",
       text = {
           "{C:chips}+#5#{} Chips",
           "{C:mult}+#4#{} Mult",
           "{C:green}Dice Score:",
		   "{C:green}#3# (#1# + #2# Bonus)"
       }
   }
   G.localization.descriptions.Other["remaster"] = {
        name = "Remaster",
       text = {
           "Transforms into a stronger joker",
           "depending on its position",
		   "{C:inactive}(Left: {C:attention}Lobstacle{C:inactive} / Right: {C:attention}Weevilite{C:inactive})"
       }
   }
G.localization.descriptions.Joker['aluberbase'] =  {
        name = 'Aluber the Jester',
        text = {"If {C:attention}first discard{} of round", 
            "has only {C:attention}1{} card, destroy",
            "it and {C:attention}transform{} this card",
			"for the remainder of the blind"
			},
    }	
G.localization.descriptions.Joker['masquerade'] =  {
        name = "Masquerade the Blazing Dragon", --tooltip name
       text = {
           "{C:chips}+#1#{} Chips",
           "{C:mult}+#2#{} Mult",
           "Reduces full blind by",
		   "{C:attention}0.8%{} for every scoring card"
       }
   }	
G.localization.descriptions.Joker['turtle'] =  {
        name = 'A Turtle',
        text = {"Not eternal"
			},
    }
G.localization.descriptions.Joker['logic'] =  {
        name = 'Logic',
        text = {"Gains {C:mult}Mult{} equal to",
			"{C:green}Dice Score{} if hand",
			"beats the blind"
			},
    }
G.localization.descriptions.Joker['encyclopedia'] =  {
        name = 'Encyclopedia',
        text = {"Gains {C:chips}+20{} chips when hand is",
			"played if Dice Score is {C:green}7 or{},",
			"more, gains {C:green}+1{} permanent",
			"Dice Score otherwise"
			},
    }
G.localization.descriptions.Joker['rhetoric'] =  {
        name = 'Rhetoric',
        text = {"Gains {C:green}+1{} permanent dice",
			"score whenever you discard only",
			"{C:attention}1{} card, also destroy it if Dice",
			"Score becomes {C:green}10 or more{}"
			},
    }
G.localization.descriptions.Joker['drama'] =  {
        name = 'Drama',
        text = {"Creates {C:attention}1{} {C:dark_edition}Negative{} \"{C:attention}Joker{}\" when",
			"hand is played if Dice Score is {C:green}12",
			"{C:green}or more{}, jokers with \"{C:attention}Joker{}\"",
			"{C:attention}in name{} grant {C:green}+1{} Dice Score"
			},
    }
G.localization.descriptions.Joker['conceptualization'] =  {
        name = 'Conceptualization',
        text = {"Creates {C:attention}1{} {C:dark_edition}Negative{} \"{C:attention}Abstract Joker{}\"",
			"when hand is played if Dice Score is {C:green}20",
			"{C:green}or more{}, jokers with \"{C:attention}Joker{}\"",
			"in name grant {C:green}+1{} Dice Score"
			},
    }
G.localization.descriptions.Joker['visualcalculus'] =  {
        name = 'Visual Calculus',
        text = {"Every played {C:attention}card{} permanently",
			"gains {C:chips}Chips{} equal to {C:green}Dice",
			"{C:green}Score{} when scored"
			},
    }
G.localization.descriptions.Joker['volition'] =  {
        name = 'Volition',
        text = {"Converts the {C:attention}left{} card into the {C:attention}right{}",
			"card if played hand is a {C:attention}Pair{}, prevents",
			"Death if Dice Score is {C:green}12 or more{}"
			},
    }
G.localization.descriptions.Joker['inlandempire'] =  {
        name = 'Inland Empire',
        text = {"Adds a permanent copy of a random played card",
			"to deck and draw it to {C:attention}hand{}, add a random",
			"{C:attention}Edition{} to it if Dice Score is {C:green}9 or more{}"
			},
    }
G.localization.descriptions.Joker['empathy'] =  {
        name = 'Empathy',
        text = {"Gains {C:mult}Mult{} equal to",
			"{C:green}Dice Score{} if hand is played",
			"without {C:attention}discarding{} any card"
			},
    }
G.localization.descriptions.Joker['authority'] =  {
        name = 'Authority',
        text = {"Destroys the lowest card in {C:attention}hand{} and",
			"gives {C:attention}double{} its {C:chips}Chips{} to all other",
			"ones if played hand is a {C:attention}Straight{}",
			"and Dice Score is {C:green}4 or more{}"
			},
    }
G.localization.descriptions.Joker['espritdecorps'] =  {
        name = 'Esprit de Corps',
        text = {"Earns {C:money}${} equal to {C:green}Dice Score{}",
			"when hand is played, also {C:attention}appears{}",
			"when you sell a \"{C:attention}Burglar{}\"",
			},
    }
G.localization.descriptions.Joker['suggestion'] =  {
        name = 'Suggestion',
        text = {"Add a random {C:attention}Seal{} to a random",
			"played card if Dice Score is {C:green}8",
			"{C:green}or more{}, gains {C:green}+1{} permanent",
			"Dice Score otherwise",
			},
    }
G.localization.descriptions.Joker['endurance'] =  {
        name = 'Endurance',
        text = {"Permanently gain {C:chips}+1{} hand when hand is",
			"played if Dice Score is {C:green}30 or",
			"{C:green}more{}, gains {C:green}+2{} permanent",
			" Dice Score otherwise"
			},
    }
G.localization.descriptions.Joker['painthreshold'] =  {
        name = 'Pain Threshold',
        text = {"Permanently gain {C:mult}+1{} discard when hand is",
			"played if Dice Score is {C:green}18 or",
			"{C:green}more{}, gains {C:green}+1{} permanent",
			" Dice Score otherwise"
			},
    }
G.localization.descriptions.Joker['physicalinstrument'] =  {
        name = 'Physical Instrument',
        text = {"Creates a {C:dark_edition}Negative{} copy of every",
			"non-{C:dark_edition}Negative{} {C:attention}consumable{} you use if",
			"Dice Score is {C:green}8 or more{}, {C:attention}rerolls{}",
			"dice after every use"
			},
    }
G.localization.descriptions.Joker['electrochemistry'] =  {
        name = 'Electrochemistry',
        text = {"Gains {C:chips}Chips{} equal to {C:green}Dice Score{} when",
			"you use a {C:attention}consumable{}, swaps",
			"to \"{C:purple}Volition{}\" if you sell one"
			},
    }
G.localization.descriptions.Joker['shivers'] =  {
        name = 'Shivers',
        text = {"Creates an {C:attention}Etheral Tag{} when hand",
			"is played if Dice Score is",
			"{C:green}10 or more{}"
			},
    }
G.localization.descriptions.Joker['halflight'] =  {
        name = 'Half Light',
        text = {"{X:mult,C:white}XMult{} equal to {C:attention}1/4{} of {C:green}Dice Score{},",
			"always {C:attention}appears{} if previous {C:attention}hand{} scored",
			"less than {C:attention}1/5{} of blind's required score"
			},
    }
G.localization.descriptions.Joker['handeye'] =  {
        name = 'Hand/Eye Coordination',
        text = {"Permanently gain {C:attention}+1{} hand size when hand is",
			"played if Dice Score is {C:green}20 or",
			"{C:green}more{}, gains {C:green}+1{} permanent",
			" Dice Score otherwise"
			},
    }
G.localization.descriptions.Joker['perception'] =  {
        name = 'Perception',
        text = {"Fills consumable slots with copies of \"{C:tarot}The World{}\"",
			"when hand is played if Dice Score is {C:green}4 or {C:green}more{},",
			"gains {C:green}+3{} permanent Dice Score otherwise"
			},
    }
G.localization.descriptions.Joker['reactionspeed'] =  {
        name = 'Reaction Speed',
        text = {"{C:attention}Discard{} your {C:attention}most played{} poker hand",
			"to upgrade it a number of times equal",
			"to {C:attention}1/10{} of your {C:green}Dice Score {C:inactive}(rounded,",
			"{C:inactive}minimum 1){} and {C:attention}transform{} this again"
			},
    }
G.localization.descriptions.Joker['savoirfaire'] =  {
        name = 'Savoir Faire',
        text = {"{C:attention}Enhance{} all unenhanced cards in",
			"played hand if Dice Score is {C:green}10",
			"{C:green}or more{}"
			},
    }
G.localization.descriptions.Joker['interfacing'] =  {
        name = 'Interfacing',
        text = {"Creates a {C:planet}Planet{} card when hand is",
			"played, result varies depending on",
			"{C:green}Dice Score{}..."
			},
    }
G.localization.descriptions.Joker['composure'] =  {
        name = 'Composure',
        text = {"Gains {C:mult}Mult{} equal to",
			"{C:green}Dice Score{} if you play",
			"your {C:attention}most played poker{} hand"
			},
    }
G.localization.descriptions.Other['Plastic'] =  {
        name = "Type",
                text = {
                  "{X:mult,C:white}Plastic{}",
                },
    }
G.localization.descriptions.Joker['planeswalkerleft'] =  {
        name = 'Planeswalker',
        text = {"When {C:attention}Blind{} is selected,",
				"create {C:attention}1 {C:blue}Common {C:attention}Joker",
				"and gain {C:attention}#2#{} loyalty",
				"{C:inactive}(must have room, {C:attention}#1#{C:inactive} loyalty)"
			},
    }
G.localization.descriptions.Joker['planeswalkermid'] =  {
        name = 'Planeswalker',
        text = {"When {C:attention}Blind{} is selected,",
				"gain {C:blue}+1{} hands",
				"{C:inactive}({C:attention}#1#{C:inactive} loyalty)"
			},
    }
G.localization.descriptions.Joker['planeswalkerright'] =  {
        name = 'Planeswalker',
        text = {"When {C:attention}Blind{} is selected,",
				"lose {C:attention}#3#{} loyalty and create {C:attention}#4#",
				"{C:dark_edition}Polychrome{}, {C:red}Red Seal{}, {C:attention}Steel Kings",
				"{C:inactive}({C:attention}#1#{C:inactive} loyalty)"
			},
    }
G.localization.descriptions.Joker['planeswalkeroriginal'] =  {
        name = "Planeswalker",
        text = {
            "Has {C:attention}3 different effects{} based",
			"on position, {C:red}self-destructs",
			"if {C:attention}loyalty{} reaches {C:attention}0",
			"{C:inactive}(currently {C:attention}#1#{C:inactive} loyalty)"
        },
    }
G.localization.descriptions.Other['planeswalkerleft'] =  {
        name = 'Left',
        text = {"When {C:attention}Blind{} is selected,",
				"create {C:attention}1 {C:blue}Common {C:attention}Joker",
				"and gain {C:attention}#1#{} loyalty",
				"{C:inactive}(must have room)"
			},
    }
G.localization.descriptions.Other['planeswalkermid'] =  {
        name = 'Middle',
        text = {"When {C:attention}Blind{} is selected,",
				"gain {C:blue}+1{} hands",
			},
    }
G.localization.descriptions.Other['planeswalkerright'] =  {
        name = 'Right',
        text = {"When {C:attention}Blind{} is selected,",
				"lose {C:attention}#1#{} loyalty and create {C:attention}#2#",
				"{C:dark_edition}Polychrome{}, {C:red}Red Seal{}, {C:attention}Steel Kings",
			},
    }
G.localization.descriptions.Joker['stonemasknovampire'] =  {
        name = "Stone Mask",
        text = {
            "Create a {C:attention}Vampire{} after {C:attention}#1#{}",
			"cards with {C:hearts}Heart{} suit are",
			"scored, {C:red}self destructs{}",
			"{C:inactive}(Currently {C:attention}#2#{C:inactive}/#1#)",
			"{C:inactive,s:0.8}(Different effect if you own {C:attention,s:0.8}Vampire{C:inactive,s:0.8})"
        },
    }
G.localization.descriptions.Joker['stonemaskvampire'] =  {
        name = "Stone Mask",
        text = {
            "{C:attention}Enhances{} all played cards with",
			"{C:hearts}Heart{} suit when scored",
			"{C:inactive,s:0.8}(Different effect if you lose {C:attention,s:0.8}Vampire{C:inactive,s:0.8})"
        },
    }
G.localization.descriptions.Other['bluestormcopier'] =  {
        name = "Bluestorm",
        text = {
            "Acts as {C:attention}Blueprint{} if copied by",
			"{C:attention}Brainstorm{} and vice-versa",
			"{C:inactive,s:0.8}(Different effect if you don't own any)"
        },
    }
G.localization.descriptions.Other['bluestormlonely'] =  {
        name = "Bluestorm",
        text = {
            "Sell this card after {C:attention}#1#",
			"rounds to randomly create a",
			"{C:attention}Blueprint{} or {C:attention}Brainstorm{}",
			"{C:inactive}(Currently {C:attention}#2#{C:inactive}/#1#)",
			"{C:inactive,s:0.8}(Different effect if you own any of the two)"
        },
    }

SMODS.current_mod.extra_tabs = function()
    return {
        {
            label = 'Credits',
            tab_definition_function = function()
                return {
                    n = G.UIT.ROOT,
                    config = {
                        r = 0.1, minw = 10, minh = 6, align = "tm", padding = 0.2, colour = G.C.BLACK
                    },
                    nodes = {
                        {n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "_Freh", colour = G.C.RED, scale = .7}}}},
                        {n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Developer", colour = G.C.WHITE, scale = .3}}}},
                        {n = G.UIT.R, config = {align = "tm"}, nodes = {
                            {n = G.UIT.C, config = {minw = 3, align = "tm", padding = 0.1}, nodes = {
                                {n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "u/Funk-Repair", colour = G.C.YELLOW, scale = .5}}}},
                                {n = G.UIT.R, config = {align = "tm", padding = 0.05}, nodes = {
                                    {n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Concept and art of Power Creep", colour = G.C.WHITE, scale = .3}}}}
                                }},
                                {n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "u/r2d2upgrade", colour = G.C.YELLOW, scale = .5}}}},
                                {n = G.UIT.R, config = {align = "tm", padding = 0.05}, nodes = {
                                    {n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Artist of Jimbo the Forbidden One", colour = G.C.WHITE, scale = .3}}}}
                                }},
                                {n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Joey J. Jester", colour = G.C.BLUE, scale = .5}}}},
                                {n = G.UIT.R, config = {align = "tm", padding = 0.05}, nodes = {
                                    {n = G.UIT.R, config = {align = "tm"}, nodes = {{n = G.UIT.T, config = {text = "Original card frame sprites for Pokermon Jokers", colour = G.C.WHITE, scale = .3}}}}
                                }},
                            }},
                        }},
                    }
                }
            end
        }
    }
end


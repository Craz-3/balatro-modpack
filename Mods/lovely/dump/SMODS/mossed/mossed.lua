LOVELY_INTEGRITY = '96f2ecc7d43d9ae4951092679dde5f68f4689c6596647c9e6eba9a74ff7350f9'

SMODS.Atlas({
	key = "atlasdeck",
	path = "atlasdeck.png",
	px = 71,
	py = 95,
}):register()
SMODS.Atlas({
	key = "atlasjokers",
	path = "atlasjokers.png",
	px = 71,
	py = 95,
}):register()
SMODS.Atlas({
	key = "atlasconsumable",
	path = "atlasconsumable.png",
	px = 65,
	py = 95,
}):register()
SMODS.Atlas({
	key = "atlastags",
	path = "atlastags.png",
	px = 34,
	py = 34,
}):register()
if SMODS.Atlas then
    SMODS.Atlas({
        key = "modicon",
        path = "modicon.png",
        px = 34,
        py = 34
    })
end
SMODS.Sound{
	key = "greensound",
	path = "green.ogg"
}
SMODS.Back{
	key = "henry",
    config = { vouchers = { "v_overstock_norm", "v_overstock_plus" }, joker_slot = 2, ante_scaling = 2, hand_size = 2 },
	pos = { x = 0, y = 0 },
	atlas = "atlasdeck",
    unlocked = true,
    discovered = true,
}
SMODS.Back{
    key = "fitzgerald",
    config = { consumables = { "c_wheel_of_fortune" }},
	pos = { x = 1, y = 0 },
	atlas = "atlasdeck",
	unlocked = true,
    discovered = true,
	calculate = function(self, card, context)
		local hand_set
		local discard_set
		if context.setting_blind then
			hand_set = (2 + ( round_number( pseudorandom("gambling") * ( ( G.GAME.current_round.discards_left + G.GAME.current_round.hands_left ) - 2 ) ) ) )
			discard_set = ( ( G.GAME.current_round.discards_left + G.GAME.current_round.hands_left ) - hand_set )
			G.E_MANAGER:add_event(Event({func = function()
				if (discard_set - G.GAME.current_round.discards_left) ~= 0 then
					ease_discard(discard_set - G.GAME.current_round.discards_left)
				end
				if (hand_set - G.GAME.current_round.hands_left) ~= 0 then
					ease_hands_played(hand_set - G.GAME.current_round.hands_left)
				end
            return true end }))
		end
	end
}
SMODS.Shader{
	key = "green",
	path = "green.fs",
}
SMODS.Edition{
	key = "green",
	shader = "green",
	loc_txt = { label = "Green" },
	unlocked = true,
    discovered = true,
	in_shop = true,
	weight = 3,
	extra_cost = 4,
	sound = { sound = "moss_greensound", per = 1.2, vol = 0.2 },
	config = { extra = { upgrade = 5, sell_up = 2 } },
	loc_vars = function(self, info_queue, card, area)
		if not card.area then
		  return { 
		    vars = { card.edition.extra.upgrade, card.edition.extra.sell_up },
		    key = self.key.."alt"
		  }
		end
		if card.area.config.collection then
			return {
				vars = {
					card.edition.extra.upgrade,
					card.edition.extra.sell_up,
				},
				key = self.key.."alt2",
			}
		elseif card.ability.set == "Joker" then
			return { vars = { card.edition.extra.upgrade, card.edition.extra.sell_up } }
		else
			return {
				vars = {
					card.edition.extra.upgrade,
					card.edition.extra.sell_up,
				},
				key = self.key.."alt",
			}
		end
	end,
	calculate = function(self, card, context)
		if context.main_scoring
			and context.cardarea == G.play
		then
			card.ability.perma_bonus = card.ability.perma_bonus or 0
            card.ability.perma_bonus = card.ability.perma_bonus + ( card.edition.extra.upgrade / 2.0 )
				return {                   
						message = localize('k_upgrade_ex'),
						colour = G.C.CHIPS
				}
			end
		if context.cardarea == G.jokers
			and context.end_of_round
		then
			card.ability.extra_value = card.ability.extra_value + card.edition.extra.sell_up
			card:set_cost()
            return {
                   message = localize('k_val_up'),
                   colour = G.C.MONEY
            }
		end
	end
}
SMODS.Joker{
	key = "mossy",
	unlocked = true,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
	config = { extra = { round_limit = 3, moss_rounds = 0 } },
	loc_vars = function(self, info_queue, card, area, edition)
			if not card.edition or (card.edition and not card.edition.moss_green) then
				--info_queue[#info_queue + 1] = G.P_CENTERS.e_moss_green
				--I'll figure out why this doesn't work later
			end
		return { vars = { card.ability.extra.round_limit, card.ability.extra.moss_rounds } }
	end,
	rarity = 2,
	atlas = "atlasjokers",
	pos = { x = 0, y = 0 },
	cost = 7,
	calculate = function(self, card, context)
		if context.selling_self and (card.ability.extra.moss_rounds >= card.ability.extra.round_limit) and not context.blueprint then
			local eval = function(card) return (card.ability.loyalty_remaining == 0) and not G.RESET_JIGGLES end
			juice_card_until(card, eval, true)
			local jokers = {}
			for i=1, #G.jokers.cards do 
				if G.jokers.cards[i] ~= card then
					jokers[#jokers+1] = G.jokers.cards[i]
				end
			end
			if #jokers > 0 then  
				if G.STAGE == G.STAGES.RUN then
					card.eligible_editionless_jokers = EMPTY(card.eligible_editionless_jokers)
					for k, v in pairs(jokers) do
						if v.ability.set == "Joker" and (not v.edition) then
							table.insert(card.eligible_editionless_jokers, v)
						end
					end
				end
				if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT or any_state then
					if next(card.eligible_editionless_jokers) then
						local temp_pool = card.eligible_editionless_jokers
						local eligible_card = pseudorandom_element(temp_pool, pseudoseed("mossy joker"))
						eligible_card:set_edition("e_moss_green", true)
						card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {message = localize("k_green_ex"), colour = G.C.GREEN })
						if card.ability.extra.moss_rounds then card.ability.extra.moss_rounds = 0 end
					else
						card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {message = localize("k_no_other_jokers"), colour = G.C.GREEN })
					end
				end
			else
				card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {message = localize("k_no_other_jokers"), colour = G.C.GREEN })
			end
		end	
		if context.end_of_round and not context.repetition and not context.blueprint and not context.individual then
			card.ability.extra.moss_rounds = card.ability.extra.moss_rounds + 1
            if card.ability.extra.moss_rounds == card.ability.extra.round_limit then 
				local eval = function(card) return not card.REMOVED end
				juice_card_until(card, eval, true)
			end
			return {
                        message = (card.ability.extra.moss_rounds < card.ability.extra.round_limit) and (card.ability.extra.moss_rounds.."/"..card.ability.extra.round_limit) or localize('k_active_ex'),
                        colour = G.C.GREEN
                    }
		end
	end
}
local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.kitchen_card = { suit = "Spades" }
	return ret
end
function SMODS.current_mod.reset_game_globals(run_start)
	G.GAME.current_round.kitchen_card = { suit = "Spades" }
	local kitchen_card = pseudorandom_element({"Spades","Hearts","Diamonds","Clubs"}, pseudoseed("kitchen" .. G.GAME.round_resets.ante))
	G.GAME.current_round.kitchen_card.suit = kitchen_card
end
local issuitref = Card.is_suit
function Card.is_suit(self, suit, bypass_debuff, flush_calc)
    if flush_calc then
        if next(SMODS.find_card('j_moss_kitchen')) and SMODS.has_no_suit(self) and ( G.GAME.current_round.kitchen_card.suit == G.GAME.current_round.kitchen_card.suit ) == ( suit == G.GAME.current_round.kitchen_card.suit ) and not ( G.GAME.current_round.kitchen_card.suit == G.GAME.current_round.kitchen_card.suit ) == ( suit ~= G.GAME.current_round.kitchen_card.suit ) then
            return true
        end
        return issuitref(self, suit, bypass_debuff, flush_calc)
    else
        if self.debuff and not bypass_debuff then return end 
        if next(SMODS.find_card('j_moss_kitchen')) and SMODS.has_no_suit(self) and ( G.GAME.current_round.kitchen_card.suit == G.GAME.current_round.kitchen_card.suit ) == ( suit == G.GAME.current_round.kitchen_card.suit ) and not ( G.GAME.current_round.kitchen_card.suit == G.GAME.current_round.kitchen_card.suit ) == ( suit ~= G.GAME.current_round.kitchen_card.suit ) then
            return true
        end
        return issuitref(self, suit, bypass_debuff, flush_calc)
    end
end
SMODS.Joker{
	key = "kitchen",
	unlocked = true,
    discovered = true, 
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
	rarity = 3,
	atlas = "atlasjokers",
	pos = { x = 1, y = 0 },
	cost = 8,
	config = { extra = {  } },
	enhancement_gate = "m_stone",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_stone
		return {
			vars = {
				localize(G.GAME.current_round.kitchen_card.suit, "suits_plural"),
				colours = { G.C.SUITS[G.GAME.current_round.kitchen_card.suit] }
			}
		}
	end,
}
SMODS.Joker{
	key = "pixel",
	unlocked = true,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	rarity = 1,
	atlas = "atlasjokers",
	pos = { x = 2, y = 0 },
	cost = 6,
	config = { extra = { chip_amount = 0, chip_gain = 2, eight_tally = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chip_amount, card.ability.extra.chip_gain, card.ability.extra.eight_tally } }
	end,
	calculate = function(self, card, context)
		if G.STAGE == G.STAGES.RUN then
			card.ability.extra.eight_tally = 0
            for k, v in pairs(G.playing_cards) do
                if v:get_id() == 8 then card.ability.extra.eight_tally = card.ability.extra.eight_tally + 1 end
			end
		end
		if context.joker_main then
			return {
				chip_mod = card.ability.extra.chip_amount,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chip_amount } }
			}
		end
		if context.end_of_round and not context.repetition and not context.blueprint and not context.individual then
			card.ability.extra.chip_amount = card.ability.extra.chip_amount + (card.ability.extra.chip_gain * card.ability.extra.eight_tally)
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.CHIPS,
				card = card
			}
		end
	end
}
SMODS.Joker{
	key = "fourfold",
	unlocked = true,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	rarity = 1,
	atlas = "atlasjokers",
	pos = { x = 3, y = 0 },
	cost = 6,
	config = { extra = { chip_add = 51, mult_add = 15 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chip_add, card.ability.extra.mult_add } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if G.GAME.current_round.hands_left % 2 == 0 then
				return {
				chip_mod = card.ability.extra.chip_add,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chip_add } }
			}
			end
			if G.GAME.current_round.hands_left % 2 == 1 then
				return {
				mult_mod = card.ability.extra.mult_add,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_add } }
			}
			end
		end
	end
}
local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.followsuit = { suit = "Spades" }
	return ret
end
function SMODS.current_mod.reset_game_globals(run_start)
	G.GAME.current_round.followsuit = { suit = "Spades" }
	local valid_followsuit_cards = {}
	for _, v in ipairs(G.playing_cards) do
		if not SMODS.has_no_suit(v) then
			valid_followsuit_cards[#valid_followsuit_cards + 1] = v
		end
	end
	if valid_followsuit_cards[1] then
		local followsuit = pseudorandom_element({"Spades","Hearts","Diamonds","Clubs"}, pseudoseed("follow_suit" .. G.GAME.round_resets.ante))
		G.GAME.current_round.followsuit.suit = followsuit
	end
end
SMODS.Joker{
	key = "followsuit",
	unlocked = true,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	rarity = 3,
	atlas = "atlasjokers",
	pos = { x = 5, y = 0 },
	cost = 10,
	config = { extra = { cash = 0 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				localize(G.GAME.current_round.followsuit.suit, "suits_singular"),
				colours = { G.C.SUITS[G.GAME.current_round.followsuit.suit] },
				card.ability.extra.cash
			}
		}
	end,
	calculate = function(self, card, context)
		if G.STAGE == G.STAGES.RUN then
			local heart_check = 0
			local diamond_check = 0
			local spade_check = 0
			local club_check = 0
			for k, v in pairs(G.playing_cards) do
				if v:is_suit("Hearts") and heart_check == 0 then
					heart_check = 1
				end
				if v:is_suit("Diamonds") and diamond_check == 0 then
					diamond_check = 1
				end
				if v:is_suit("Spades") and spade_check == 0 then
					spade_check = 1
				end
				if v:is_suit("Clubs") and club_check == 0 then
					club_check = 1
				end
			end
			card.ability.extra.cash = ( heart_check + diamond_check + spade_check + club_check )
		end
		if context.individual and context.cardarea == G.play then
			local first_card = nil
            for i = 1, #context.scoring_hand do
				if context.scoring_hand[i]:is_suit(G.GAME.current_round.followsuit.suit) then
					first_card = context.scoring_hand[i]; break
				end
            end
            if context.other_card == first_card then
				G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.cash
				G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
				return {
					dollars = card.ability.extra.cash
				}
            end
		end
	end
}
local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.dvolt = 0
	return ret
end
SMODS.Joker{
	key = "d9volt",
	unlocked = true,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	rarity = 2,
	atlas = "atlasjokers",
	pos = { x = 4, y = 0 },
	cost = 5,
	config = { extra = { mult_add = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_add, G.GAME.current_round.dvolt } }
	end,
	set_ability = function(self, card, initial, delay_sprites)
		if G.GAME.current_round.dvolt == 0 then
				G.GAME.current_round.dvolt = (4 + ( round_number( pseudorandom("d9volt") * 28 ) ) )
			if card.ability.extra.mult_add == 0 then
				card.ability.extra.mult_add = G.GAME.current_round.dvolt
			end
		end
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult_add,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_add } }
			}
		end
	end
}
SMODS.Joker{
	key = "jeb",
	unlocked = true,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	pixel_size = { w = 71, h = 71 },
	display_size = { w = 71, h = 95 },
	rarity = 2,
	atlas = "atlasjokers",
	pos = { x = 6, y = 0 },
	cost = 6,
	config = { extra = { total = 0, add = 10 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.total, card.ability.extra.add } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.total,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.total } },
				colour = G.C.MULT
			}
		end
		if context.open_booster then
			card.ability.extra.total = card.ability.extra.total + card.ability.extra.add 
			return {
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.total } },
				colour = G.C.RED
            }
		end
		if context.end_of_round and not context.blueprint and G.GAME.blind.boss and card.ability.extra.total > 0 then
			card.ability.extra.total = 0
			return {
				message = localize('k_reset'),
				clour = G.C.RED
            }
		end
	end
}
SMODS.Joker{
	key = "bittergiggle",
	unlocked = true,
    discovered = true, 
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
	rarity = 3,
	atlas = "atlasjokers",
	pos = { x = 1, y = 1 },
	cost = 8,
	config = { extra = { times_mult = 1.5 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.times_mult } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 12 and context.other_card.ability.effect ~= "Base"then
				return {
				x_mult = card.ability.extra.times_mult,
				colour = G.C.MULT
			}
			end
		end
	end
}
local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.blueberry = 0
	return ret
end
SMODS.Joker{
	key = "blueberry",
	unlocked = true,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
	rarity = 1,
	atlas = "atlasjokers",
	pos = { x = 2, y = 1 },
	cost = 4,
	config = { extra = { rounds_left = 5, add_chips = 10, one_time = 0 } },
	in_pool = function(self, args)
		allow_duplicates = true
		return true
	end,
	add_to_deck = function(self, card, from_debuff)
		if card.ability.extra.one_time == 0 then
			G.GAME.current_round.blueberry = G.GAME.current_round.blueberry + card.ability.extra.add_chips
			card.ability.extra.one_time = 1
		end
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.rounds_left, card.ability.extra.add_chips, G.GAME.current_round.blueberry, card.ability.extra.one_time } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chip_mod = G.GAME.current_round.blueberry,
				message = localize { type = 'variable', key = 'a_chips', vars = { G.GAME.current_round.blueberry } },
				colour = G.C.BLUE
			}
		end
		if context.end_of_round and not context.repetition and not context.blueprint and not context.individual and context.game_over == false then
			card.ability.extra.rounds_left = card.ability.extra.rounds_left - 1
            if card.ability.extra.rounds_left == 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
				return {
					message = localize("k_destroyed"),
					colour = G.C.BLUE
				}
			else
				return {
                        message = (card.ability.extra.rounds_left.."/5"),
                        colour = G.C.BLUE
                }
			end
		end
	end
}
local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.strawberry = 0
	return ret
end
SMODS.Joker{
	key = "strawberry",
	unlocked = true,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
	rarity = 1,
	atlas = "atlasjokers",
	pos = { x = 3, y = 1 },
	cost = 4,
	config = { extra = { rounds_left = 5, add_mult = 2, one_time = 0 } },
	in_pool = function(self, args)
		allow_duplicates = true
		return true
	end,
	add_to_deck = function(self, card, from_debuff)
		if card.ability.extra.one_time == 0 then
			G.GAME.current_round.strawberry = G.GAME.current_round.strawberry + card.ability.extra.add_mult
			card.ability.extra.one_time = 1
		end
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.rounds_left, card.ability.extra.add_mult, G.GAME.current_round.strawberry, card.ability.extra.one_time } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = G.GAME.current_round.strawberry,
				message = localize { type = 'variable', key = 'a_mult', vars = { G.GAME.current_round.strawberry } },
				colour = G.C.RED
			}
		end
		if context.end_of_round and not context.repetition and not context.blueprint and not context.individual and context.game_over == false then
			card.ability.extra.rounds_left = card.ability.extra.rounds_left - 1
            if card.ability.extra.rounds_left == 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
				return {
					message = localize("k_destroyed"),
					colour = G.C.RED
				}
			else
				return {
                        message = (card.ability.extra.rounds_left.."/5"),
                        colour = G.C.RED
                }
			end
		end
	end
}
SMODS.Joker{
	key = "impractical",
	unlocked = true,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	rarity = 1,
	atlas = "atlasjokers",
	pos = { x = 4, y = 1 },
	cost = 5,
	config = { extra = { mult_add = 3, total = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_add, card.ability.extra.total } }
	end,
	calculate = function(self, card, context)
		if G.GAME.current_round.hands_left == 0 and context.cardarea == G.hand and context.individual and not context.end_of_round then
			local temp_Mult, temp_ID = 15, 15
            local raised_card = nil
            for i=1, #G.hand.cards do
				if temp_ID >= G.hand.cards[i].base.id and G.hand.cards[i].ability.effect ~= 'Stone Card' then
					temp_Mult = G.hand.cards[i].base.nominal; temp_ID = G.hand.cards[i].base.id; raised_card = G.hand.cards[i]
				end
            end
            if raised_card == context.other_card then 
				if context.other_card.debuff then
					return {
						message = localize('k_debuffed'),
						colour = G.C.RED,
					}
				else
					card.ability.extra.total = card.ability.extra.total + card.ability.extra.mult_add
					return {
						raised_card:start_dissolve(),
					}
				end
            end
		end
		if context.joker_main and card.ability.extra.total > 0 then
			return {
				mult_mod = card.ability.extra.total,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.total } },
				colour = G.C.RED
			}
		end
	end
}
SMODS.Joker{
	key = "lara",
	unlocked = true,
    discovered = false, 
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
	rarity = 4,
	atlas = "atlasjokers",
	pos = { x = 0, y = 1 },
	soul_pos = { x = 0, y = 2 },
	cost = 20,
	config = { extra = {  } },
	calculate = function(self, card, context)
		if context.cardarea == G.hand and not context.blueprint and context.individual and not context.end_of_round then
			if context.other_card.edition  then
				if context.other_card.debuff then
					return {
						message = localize('k_debuffed'),
						colour = G.C.RED,
						card = self,
					}
				else
					if context.other_card.edition.foil then
						return {
							chips = G.P_CENTERS.e_foil.config.extra,
						}
					end
					if context.other_card.edition.holo then
						return {
							mult = G.P_CENTERS.e_holo.config.extra,
						}
					end
					if context.other_card.edition.polychrome then
						return {
							x_mult = G.P_CENTERS.e_polychrome.config.extra,
						}
					end
					if context.other_card.edition.moss_green then
						context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
						context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + ( context.other_card.edition.extra.upgrade )
						return {                   
							message = localize('k_upgrade_ex'),
							colour = G.C.CHIPS,
							card = context.other_card,
							chips = context.other_card.ability.perma_bonus
						}
					end
				end
			end
		end
	end
}
SMODS.Joker{
	key = "luigi",
	unlocked = true,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
	rarity = 2,
	atlas = "atlasjokers",
	pos = { x = 5, y = 1 },
	cost = 6,
	config = { extra = { death_chance = 6, total = 1, add_mult = 0.5 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.death_chance, card.ability.extra.total, card.ability.extra.add_mult, (G.GAME.probabilities.normal or 1) } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				x_mult = card.ability.extra.total,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.total } },
				colour = G.C.MULT
			}
		end
		if context.using_consumeable then
			if context.consumeable.ability.set == "Spectral" then
				if pseudorandom("luigi") < G.GAME.probabilities.normal / card.ability.extra.death_chance then
					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound("tarot1")
							card.T.r = -0.2
							card:juice_up(0.3, 0.4)
							card.states.drag.is = true
							card.children.center.pinch.x = true
							G.E_MANAGER:add_event(Event({
								trigger = "after",
								delay = 0.3,
								blockable = false,
								func = function()
									G.jokers:remove_card(card)
									card:remove()
									card = nil
									return true;
								end
							}))
						return true
						end
					}))
					return {
						message = localize("k_good_night"),
						colour = G.C.PURPLE
					}
				else
					card.ability.extra.total = card.ability.extra.total + card.ability.extra.add_mult
					return {
						message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.total } },
						colour = G.C.MULT
					}
				end
			end
		end
	end
}
SMODS.Joker{
	key = "jet",
	unlocked = true,
    discovered = false, 
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
	rarity = 4,
	atlas = "atlasjokers",
	pos = { x = 1, y = 2 },
	soul_pos = { x = 2, y = 2 },
	cost = 20,
	config = { extra = { times = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.times } }
	end,
	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play then
			if context.other_card.ability.effect ~= "Base" then
			return {
                        message = localize("k_again_ex"),
                        repetitions = card.ability.extra.times
                    }
			end
		end
	end
}
SMODS.Joker{
	key = "split",
	unlocked = true,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
	rarity = 1,
	atlas = "atlasjokers",
	pos = { x = 6, y = 1 },
	cost = 4,
	config = { extra = { chip_gain = 5, total = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chip_gain, card.ability.extra.total } }
	end,
	calculate = function(self, card, context)
		if context.pre_discard and not context.blueprint and #context.full_hand <= 3 then
			card.ability.extra.total = card.ability.extra.total + card.ability.extra.chip_gain
			return {
				message = localize("k_upgrade_ex"),
				colour = G.C.CHIPS
            }
		end
		if context.joker_main then
		return {
			message = localize{type="variable",key="a_chips",vars={card.ability.extra.total}},
			chip_mod = card.ability.extra.total, 
			colour = G.C.CHIPS
        }
		end
	end
}
SMODS.Joker{
	key = "glamorous",
	unlocked = true,
    discovered = false, 
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
	rarity = 1,
	atlas = "atlasjokers",
	pos = { x = 3, y = 2 },
	cost = 5,
	config = {  },
	in_pool = function(self, args)
		if G.GAME.hands["moss_Queen Pair"].played > 0 then
			return true
		end
	end,
}
SMODS.PokerHand {
    key = "Queen Pair",
    chips = 15,
    mult = 2,
    l_chips = 18,
    l_mult = 1,
	visible = false,
    example = {
        { 'S_Q', true },
        { 'H_2', true },
        { 'D_2', true },
        { 'C_5', false },
        { 'H_7', false },
    },
    evaluate = function(parts, hand)
		if next(parts._2)then
			local queencheck = {}
			local queens = 0
			local rank = 0
			local pair_rank = 0
			local same_card = 0
			for i = 1, #hand, 1 do	
				if #hand > 2 then
					if hand[i].base.id == 12 and not next(SMODS.find_card("j_moss_glamorous")) then
						table.insert(queencheck, hand[i])
						queens = queens + 1
					end
					if hand[i].base.id > 10 and hand[i].base.id < 14 and next(SMODS.find_card("j_moss_glamorous")) and not next(SMODS.find_card("j_pareidolia")) then
						if pair_rank == 0 then
							same_card = hand[i]
							for j = 1, #hand, 1 do
								if hand[i].base.id == hand[j].base.id and hand[j] ~= same_card then
									pair_rank = hand[i].base.id
								end
							end
						end
						if pair_rank < 13 then
							if rank < hand[i].base.id and pair_rank ~= hand[i].base.id then
								rank = hand[i].base.id
								queencheck = {}
								table.insert(queencheck, hand[i])
							end
						elseif pair_rank > 12 then
							if hand[i].base.id < 13 and rank < hand[i].base.id and pair_rank ~= hand[i].base.id then
								rank = hand[i].base.id
								queencheck = {}
								table.insert(queencheck, hand[i])
							end
						end
						queens = queens + 1
					end
					if hand[i].base.id > 1 and next(SMODS.find_card("j_moss_glamorous")) and next(SMODS.find_card("j_pareidolia")) then
						if pair_rank == 0 then
							same_card = hand[i]
							for j = 1, #hand, 1 do
								if hand[i].base.id == hand[j].base.id and hand[j] ~= same_card then
									pair_rank = hand[i].base.id
								end
							end
						end
						if pair_rank < 13 then
							if rank < hand[i].base.id and pair_rank ~= hand[i].base.id then
								rank = hand[i].base.id
								queencheck = {}
								table.insert(queencheck, hand[i])
							end
						elseif pair_rank > 12 then
							if hand[i].base.id < 13 and rank < hand[i].base.id and pair_rank ~= hand[i].base.id then
								rank = hand[i].base.id
								queencheck = {}
								table.insert(queencheck, hand[i])
							end
						end
						queens = queens + 1
					end
				end
			end
			local _check = SMODS.merge_lists(parts._2, {queencheck})
			if ( queens == 1 and not next(SMODS.find_card("j_moss_glamorous")) ) or ( queens > 0 and queens ~= 2 and next(SMODS.find_card("j_moss_glamorous")) and not next(SMODS.find_card("j_pareidolia")) ) or ( queens > 0 and next(SMODS.find_card("j_pareidolia")) ) then
				return {_check}
			end	
		end
	end,
}
SMODS.Consumable {
	set = "Planet",
	key = "iris",
	discovered = false,
	config = { hand_type = "moss_Queen Pair", softlock = true },
	cost = 3,
	atlas = "atlasconsumable",
	pos = { x = 0, y = 0 },
	display_size = { w = 65, h = 95 },
	set_card_type_badge = function(self, card, badges)
		badges[1] = create_badge(localize("k_planet_q"), get_type_colour(self or card.config, card), nil, 1.2)
	end,
	loc_vars = function(self, info_queue, center)
        local levelone = G.GAME.hands["moss_Queen Pair"].level or 1
        local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
        if levelone == 1 then
            planetcolourone = G.C.UI.TEXT_DARK
        end
        return {
            vars = {
                localize("moss_Queen Pair", "poker_hands"),
                G.GAME.hands["moss_Queen Pair"].level,
				G.GAME.hands["moss_Queen Pair"].l_mult,
				G.GAME.hands["moss_Queen Pair"].l_chips,
                colours = { planetcolourone },
            },
        }
    end,
}
SMODS.Consumable {
	set = "Spectral",
	key = "plague",
	discovered = true,
	config = {  },
	cost = 4,
	atlas = "atlasconsumable",
	pos = { x = 0, y = 1 },
	display_size = { w = 65, h = 95 },
	config = { extra = { max_highlighted = 3, green_chance = 2 }, remove_card = true },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max_highlighted, card.ability.extra.green_chance, (G.GAME.probabilities.normal or 1) } }
    end,
	can_use = function(self, card)
		if #G.hand.cards > 0 and #G.hand.highlighted > 0 and #G.hand.highlighted < card.ability.extra.max_highlighted + 1 then	
			local edition_check = 0
			for i = 1, #G.hand.highlighted do
				if G.hand.highlighted[i].edition then
					edition_check = edition_check + 1
				end
			end
			if edition_check == 0 then
				return true
			end
		end
	end,
	use = function(self, card, area, copier)
		for i = 1, #G.hand.highlighted do
			local destroyed_cards = {}
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({ func = function()
				play_sound("tarot1")
				highlighted:juice_up(0.3, 0.5)
				return true end,
			}))
			G.E_MANAGER:add_event(Event({trigger = "after", delay = 0.1, func = function()
				if highlighted then
					if pseudorandom("plague") < G.GAME.probabilities.normal / card.ability.extra.green_chance --this is set to 2, so it's a 1/2 chance
					then
						highlighted:set_edition({moss_green = true})
					else
						if highlighted.ability.name == "Glass Card" then 
							highlighted:shatter()
						else
							highlighted:start_dissolve()
						end
					end
				end
			return true end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({ trigger = "after", delay = 0.2, func = function()
				G.hand:unhighlight_all()
				return true end,
			}))
		end
	end,
}
SMODS.Consumable {
	set = "Spectral",
	key = "avarice",
	discovered = true,
	config = {  },
	cost = 4,
	atlas = "atlasconsumable",
	pos = { x = 1, y = 1 },
	display_size = { w = 65, h = 95 },
	config = {  },
	can_use = function(self, card)
		local jokers = {}
		for i=1, #G.jokers.cards do 
			if G.jokers.cards[i] ~= card then
				jokers[#jokers+1] = G.jokers.cards[i]
			end
		end
		if #jokers > 0 then  
			if G.STAGE == G.STAGES.RUN then
				card.eligible_editionless_jokers = {}
				for k, v in pairs(jokers) do
					if v.ability.set == "Joker" and (not v.edition) then
						table.insert(card.eligible_editionless_jokers, v)
					end
				end
			end
			if next(card.eligible_editionless_jokers) then
				return true
			end
		end
	end,
	use = function(self, card, area, copier)
		local used_tarot = copier or self
		local temp_pool = card.eligible_editionless_jokers
		local eligible_card = pseudorandom_element(temp_pool, pseudoseed("avarice"))
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            eligible_card:set_edition({moss_green = true})
            card:juice_up(0.3, 0.5)
            return true end }))
	end,
}
SMODS.Tag {
	key = "greentag",
    discovered = true, 
	atlas = "atlastags",
	pos = { x = 0, y = 0 },
	config = { type = "store_joker_modify", edition = "moss_green" },
	min_ante = 2,
	apply = function(self, tag, context)
		if context.type == "store_joker_modify" then
			local _applied = nil
			if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep("+", G.C.GREEN,function() 
					context.card:set_edition({moss_green = true}, true)
					context.card.ability.couponed = true
					context.card:set_cost()
					context.card.temp_edition = nil
					G.CONTROLLER.locks[lock] = nil
					return true
                end )
                _applied = true
				tag.triggered = true
            end
		end
	end,
}
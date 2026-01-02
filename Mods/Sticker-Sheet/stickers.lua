SMODS.Atlas {
	key = "stickers",
	path = "newstickers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "modicon",
	path = "modicon.png",
	px = 32,
	py = 32
}



---------------- Verdant Sticker ----------------
local emplace_ref = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
			local ret = emplace_ref(self, card, location, stay_flipped)

			-- modded stickers are found by going: card.ability.<mod prefix>_<sticker key>
			if card.ability.SNS_verdant and card.area == G.jokers then
				SMODS.debuff_card(card,true,"verdantsticker")
			end
			if  card.ability.SNS_delayed and card.area == G.consumeables then
				SMODS.debuff_card(card,true,"delayed")
			end

		return ret
	end


SMODS.Sticker {
	

	key = "verdant",
	loc_txt = {
		label = "Verdant",
		name = "Verdant",
		text = {
			"Joker disabled until",
			"{C:attention}1{} joker sold"
		}
	},
	atlas = "stickers",
	pos = {x=0,y=0},
	badge_colour = HEX('195E00'),
	needs_enable_flag = false,
	rate = 0.03,
	
	calculate = function(self, card, context)
		
		
		
		if context.selling_card and context.card.area == G.jokers then
			SMODS.debuff_card(card,false,"verdantsticker")
		end
	end
}


---------------- Michel  Sticker ----------------
---test seed: F381EDU1
SMODS.Sticker {

	key = "michel",
	loc_txt = {
		label = "Michel",
		name = "Michel",
		text = {
			"{C:green}#1# in 6{} chance this",
			"joker is destroyed",
			"at end of round"
		}
	},
	config = { extra = { odds = 6 } },
	atlas = "stickers",
	pos = {x=1,y=0},
	badge_colour = HEX('ADB200'),
	needs_enable_flag = false,
	rate = 0.03,
	
	should_apply = function(self,card,center,area,bypass_roll)
		local yes = SMODS.Sticker.should_apply(self,card,center,area,bypass_roll)
		
		if G.GAME.modifiers.enable_eternals_in_shop then
			yes = false
		end
		
		return yes
	end,
	
	loc_vars = function(self, info_queue, card)
		return { vars = {G.GAME.probabilities.normal or 1}}
	end,
	
	
	calculate = function(self, card, context)
		

		-- Checks to see if it's end of round, and if context.game_over is false.
		-- Also, not context.repetition ensures it doesn't get called during repetitions.
		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			-- Another pseudorandom thing, randomly generates a decimal between 0 and 1, so effectively a random percentage.
			if pseudorandom('gros_michel2') < G.GAME.probabilities.normal / 6 then
				-- This part plays the animation.
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						-- This part destroys the card.
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
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
				-- Sets the pool flag to true, meaning Gros Michel 2 doesn't spawn, and Cavendish 2 does.
				
				return {
					message = 'Extinct!'
				}
			else
				return {
					message = 'Safe!'
				}
			end
		end
	end
}


---------------- Reroll  Sticker ----------------

SMODS.Sticker {


	key = "reroll",
	loc_txt = {
		label = "Unrolled",
		name = "Unrolled",
		text = {
			"Takes {C:attention}#1#{} dollar",
			"every reroll"
		}
	},
	loc_vars = function(self, info_queue, card)
		return { vars = {1}}
	end,
	atlas = "stickers",
	pos = {x=2,y=0},
	badge_colour = HEX('06613D'),
	needs_enable_flag = false,
	rate = 0.05,
	should_apply = function(self,card,center,area,bypass_roll)
		local yes = SMODS.Sticker.should_apply(self,card,center,area,bypass_roll)
		
		if G.GAME.modifiers.enable_rentals_in_shop then
			yes = false
		end
		
		return yes
	end,
	calculate = function(self,card,context)
		if context.reroll_shop and context.cardarea == G.jokers then
			ease_dollars(-1)
			card_eval_status_text(card, "dollars", -1)
		end
	end

	
	
}
---------------- Boosted Sticker ----------------

SMODS.Sticker {
	key = "boosted",
	loc_txt = {
		label = "Boosted",
		name = "Boosted",
		text = {
			"Destroys after",
			"leaving shop"
		}
	},
	atlas = "stickers",
	pos = {x=0,y=1},
	badge_colour = HEX('B27B25'),
	needs_enable_flag = false,
	rate = 0.03,
	sets = {
		Joker = false,
		Tarot = true,
		Planet = true
	},
	should_apply = function(self,card,center,area,bypass_roll)
		local yes = SMODS.Sticker.should_apply(self,card,center,area,bypass_roll)
		

		if area == G.pack_cards then
			yes = false
		end


		if card.ability.SNS_delayed then
			yes = false
		end
		
		return yes
	end,

	calculate = function(self, card, context)
		if context.ending_shop then
			card:start_dissolve()

		end
		
	end
}

---------------- Delayed Sticker ----------------

local endround = end_round

function end_round()
	local ret = endround()
	for i = 1, #G.consumeables.cards do
		local card = G.consumeables.cards[i]
		if card.ability.SNS_delayed and card.area == G.consumeables then
			SMODS.debuff_card(card,false,"delayed")
		end
	end
		

	
end

SMODS.Sticker {
	key = "delayed",
	loc_txt = {
		label = "Delayed",
		name = "Delayed",
		text = {
			"Debuffed for",
			"{C:attention}1{} Round"
		}
	},
	atlas = "stickers",
	pos = {x=1,y=1},
	badge_colour = HEX('671B16'),
	needs_enable_flag = false,
	rate = 0.05,
	sets = {
		Joker = false,
		Tarot = true,
		Spectral = true,
		Planet = true
	},
	should_apply = function(self,card,center,area,bypass_roll)
		local yes = SMODS.Sticker.should_apply(self,card,center,area,bypass_roll)
		
		if area == G.pack_cards then
			yes = false
		end

		if card.ability.SNS_boosted then
			yes = false
		end
		
		return yes
	end,

	calculate = function(self, card, context)
		if context.end_of_round then
			SMODS.debuff_card(card,false,"delayed")
		end
	end
}

SMODS.Joker {
	key = "da_joki",
	config = {
		extra = {
			mult = 0,
			scaling = 2,
			inverse_scaling = 1,
			hand_type = nil
		}
	},
	rarity = 1,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult, card.ability.extra.scaling, card.ability.extra.inverse_scaling, card.ability.extra.hand_type and localize(card.ability.extra.hand_type, "poker_hands") or "No hand"}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 0, y = 3 },
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			if context.cardarea == G.jokers and context.before and not (context.individual or context.repetition) and not context.blueprint then
				if card.ability.extra.hand_type then
					if context.scoring_name == card.ability.extra.hand_type then
						card.ability.extra.hand_type = nil
						SMODS.scale_card(card, {
							ref_table = card.ability.extra,
							ref_value = "mult",
							scalar_value = "scaling",
						})
					else
						card.ability.extra.hand_type = nil
						if card.ability.extra.mult > 0 then
							SMODS.scale_card(card, {
								ref_table = card.ability.extra,
								ref_value = "mult",
								scalar_value = "inverse_scaling",
								operation = '-',
								message_key = 'a_mult_minus',
								message_color = G.C.RED
							})
						end
					end
				else
					card.ability.extra.hand_type = context.scoring_name
				end
			end
			
			--Scoring
			if context.joker_main and context.cardarea == G.jokers and card.ability.extra.mult > 0 then
				return {
				  mult_mod = card.ability.extra.mult,
				  message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
				}
			end
		end
	end
}

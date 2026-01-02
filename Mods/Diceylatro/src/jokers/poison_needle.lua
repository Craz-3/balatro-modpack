local j = {
  loc_txt = {
    name = "Poison Needle",                                   
        text = {
            "{C:mult}+#1#{} Base Mult for played hand",
	    "Limit {C:attention}#2#{C:inactive} [#3#]{} hand per round."                   
        },
  },
  config = {extra = {hand_mult = 1, hands_round = 3, hands = 3}},
  rarity = 1,
  cost = 9,
  atlas = 33,

  blueprint_compat = true,
}

function j:loc_vars(_, card)
  return { vars = {card.ability.extra.hand_mult, card.ability.extra.hands_round, card.ability.extra.hands } }
end


function j:calculate(self, context)
	if context.setting_blind and not self.getting_sliced then
		self.ability.extra.hands_round = self.ability.extra.hands
        end
	if context.cardarea == G.jokers then
                if context.before and self.ability.extra.hands_round > 0 then
			G.GAME.hands[context.scoring_name].mult = G.GAME.hands[context.scoring_name].mult + self.ability.extra.hand_mult
			if not context.blueprint then
				self.ability.extra.hands_round = self.ability.extra.hands_round - 1
			end
		end
	end
end


if JokerDisplay then
    JokerDisplay.Definitions['j_dd_poison_needle'] = {
	reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "hands_round" },
            { text = "/" },
            { ref_table = "card.joker_display_values",        ref_value = "hands" },
            { text = ")" },
        },
        calc_function = function(card)
            	card.joker_display_values.hands_round = card.ability.extra.hands_round or card.ability.extra.hands
	   	card.joker_display_values.hands = card.ability.extra.hands
        end
    }
end
	
return j

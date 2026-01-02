local j = {
  loc_txt = {
    name = "Concentration",                                
    text = {
            	 "If the used hands are {C:attention}equal{}",
		 "to the previous ones, it gains",
		 "{C:money}+$#1#{} for each used hands {C:inactive}(#2#/#3#)"                       
     },
  },
  config = {extra = {dollars = 2, hands_round = 0, hands = 4}},
  rarity = 1,
  cost = 5,
  atlas = 34,

  blueprint_compat = true,
}
function j:loc_vars(_, card)
  return { vars = {card.ability.extra.dollars, card.ability.extra.hands_round, card.ability.extra.hands } }
end

function j:calculate(self, context)
	if context.setting_blind and not self.getting_sliced and self.ability.extra.hands > 0 and self.ability.extra.hands_round > 0 then
		self.ability.extra.hands = self.ability.extra.hands_round
		self.ability.extra.hands_round = 0
	end
	if context.cardarea == G.jokers and not context.blueprint then
                if context.before then
			self.ability.extra.hands_round = self.ability.extra.hands_round + 1
		end
	end
	if context.end_of_round and not context.individual and not context.repetition then
		if self.ability.extra.hands_round == self.ability.extra.hands then
			ease_dollars((self.ability.extra.hands*self.ability.extra.dollars))
			return {
                    		extra = {focus = self, message = localize('$')..(self.ability.extra.hands*self.ability.extra.dollars), colour = G.C.MONEY},
                        	card = self
                	}
		end
	end
end

if JokerDisplay then
    JokerDisplay.Definitions['j_dd_concentration'] = {
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

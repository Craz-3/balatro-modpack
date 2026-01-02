local j = {
  loc_txt = {
    name = "Warrior",                                   
        text = {
            "{C:chips,s:1.1}+#1#{} Chips."                      
        },
  },
  config = {extra = {chips = 1000}},
  rarity = 1,
  cost = 3,
  atlas = 18,
  soul_pos = 25,

  blueprint_compat = true,
}

function j:loc_vars(_, card)
	return { vars = { card.ability.extra.chips} }
end


function j:calculate(card, context)
	if context.joker_main then
	    local chip_rand = card.ability.extra.chips
            return {
            	message = localize{type='variable',key='a_chips',vars={chip_rand}},
        	chip_mod = chip_rand, 
        	colour = G.C.CHIPS
            }
        end
end

if JokerDisplay then
    JokerDisplay.Definitions["j_dd_warrior"] = {
    	text = {
      		{ text = "+", colour = G.C.CHIPS },
      		{ ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "chips", colour = G.C.CHIPS },
    	},
	calc_function = function(card)
		card.joker_display_values.chips = card.ability.extra.chips
        end
    }
end
	
return j

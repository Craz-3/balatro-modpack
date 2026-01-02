local j = {
  loc_txt = {
    name = "The Bear",                                   
        text = {
            "{X:mult,C:white}X#1#{} Mult"                      
        },
  },
  config = {extra = {x_mult = 6}},
  rarity = 4,
  cost = 20,
  atlas = 24,
  soul_pos = 31,

  blueprint_compat = true,
}

function j:loc_vars(_, card)
	return { vars = { card.ability.extra.x_mult} }
end


function j:calculate(card, context)
	if context.joker_main then
	    return {
        	message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
        	Xmult_mod = card.ability.extra.x_mult,
      	    }  
        end
end

if JokerDisplay then
    JokerDisplay.Definitions["j_dd_bear"] = {
    	text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        },
	calc_function = function(card)
		card.joker_display_values.x_mult = card.ability.extra.x_mult
        end
    }
end
	
return j

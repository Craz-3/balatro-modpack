local j = {
  loc_txt = {
    name = "Duplicate",                                   
        text = {
            "For each card {C:attention}played and scored{}, add",
	    "a {C:attention}Temporary{} copy of the card to deck"                     
        },
  },
  config = {},
  rarity = 2,
  cost = 8,
  atlas = 1,

  blueprint_compat = true,
}

function j:loc_vars(infoq, card)
  infoq[#infoq + 1] = { key = "dd_temporary", set = "Other" }
  return {}
end

local set_abilityref = Card.set_ability
function Card.set_ability(self, center, initial, delay_sprites)
    set_abilityref(self, center, initial, delay_sprites)
    local posx = center.pos.x
    local posy = center.pos.y
    if self.config.center.key == "j_dd_duplicate" and self.ability.set == 'Joker' then
        center.atlas = 'Joker'

        posx = math.random(0, 9)
	posy = math.random(0, 14)

	while (posy == 8 and posx > 2 and posx < 8) or (posy == 0 and posx == 7) or (posy == 12 and posx == 2) or (posy == 10 and posx == 9) or (posy == 11 and posx == 4) or posy == 9 do
	   	posx = math.random(0, 9)
		posy = math.random(0, 14)
	end
	center.pos.x = posx
    	center.pos.y = posy

    	G.E_MANAGER:add_event(Event({
        	func = function()
            		if not self.REMOVED then
                		self:set_sprites(center)
            		end
            		return true
             	end
    	}))

    end 
end

function j:calculate(card, context)
	if context.cardarea == G.jokers and context.before then
        	for k, v in ipairs(context.scoring_hand) do
			if not v.debuff then
                        	G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        	local card = copy_card(v, nil, nil, G.playing_card)
				card:set_temporary(true)
                        	card:start_materialize()
                        	G.deck:emplace(card)
				G.deck.config.card_limit = G.deck.config.card_limit + 1
                        	table.insert(G.playing_cards, card)
				playing_card_joker_effects({false})
			end
        	end
        end
end
	
return j

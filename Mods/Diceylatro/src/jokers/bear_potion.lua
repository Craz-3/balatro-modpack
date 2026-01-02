local j = {
  loc_txt = {
    name = "Bear Potion",                                   
        text = {
            "When sold, destroy a random joker with",
	    "{C:attention}rarity above Uncommon{} and create {C:attention}The Bear{}."                   
        },
  },
  config = {},
  rarity = 3,
  cost = 9,
  atlas = 32,

  blueprint_compat = true,
}

function j:loc_vars(_, card)
	return { vars = {} }
end


function j:calculate(self, context)
	if context.selling_self then
                local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
                    	if G.jokers.cards[i] ~= self and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced and not (tonumber(G.jokers.cards[i].config.center.rarity) and G.jokers.cards[i].config.center.rarity <= 2 and G.jokers.cards[i].config.center.rarity > 0) then
				destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] 
			end
                end
                local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('madness')) or nil
		if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then 
                    	joker_to_destroy.getting_sliced = true
                    	joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
			local card = create_card('Joker', G.jokers, nil, 0.99, nil, nil, 'j_dd_bear')
			card:add_to_deck()
			G.jokers:emplace(card)
                end
        end
end
	
return j

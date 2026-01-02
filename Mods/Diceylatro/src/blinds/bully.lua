local b = {
  loc_txt = {
    name = "The Bully",
    text = {
      "Add 13 random Temporary",
      "Stone cards to your deck"
    },
  },
  mult = 2,
  boss = { max = 3, min = 3 },
  boss_colour = HEX("429a68"),
  atlas = 1,
}

function b:set_blind()
  	local blind = G.GAME.blind
	for i = 1, 13 do
  		_rank = pseudorandom_element({'2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K'}, pseudoseed('familiar_create'))
		_suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('familiar_create'))
		_suit = _suit or 'S'; _rank = _rank or 'A'
		local cen_pool = {}
		for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
			if v.key == 'm_stone' then 
				cen_pool[#cen_pool+1] = v
			end
		end
		card = create_playing_card({front = G.P_CARDS[_suit..'_'.._rank], center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))}, G.deck, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
		card:set_temporary(true)
	end
end

function b:disable()
	local blind = G.GAME.blind
	for i = 1, #G.deck.cards do
                if G.deck.cards[i].ability and G.deck.cards[i].ability.temporary == true then
                	G.deck.cards[i]:start_dissolve(nil, i ~= #G.deck.cards)
		end
        end
	for i = 1, #G.hand.cards do
                if G.hand.cards[i].ability and G.hand.cards[i].ability.temporary == true then
                	G.hand.cards[i]:start_dissolve(nil, i ~= #G.hand.cards)
		end
        end
end

return b

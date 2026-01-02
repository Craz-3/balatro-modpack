SMODS.Joker({
	key = "black_friday",
	atlas = "jokers",
	pos = {x = 1, y = 5},
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
    config = {extra = {money_off = 25}},
	artist_credits = {'flare'},
	loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.money_off}}
    end,
	add_to_deck = function(self, card, from_debuff)
		G.GAME.discount_percent = G.GAME.discount_percent + card.ability.extra.money_off
		G.E_MANAGER:add_event(Event({func = function()
			for k, v in pairs(G.I.CARD) do
				if v.set_cost then v:set_cost() end
			end
			return true end 
		}))
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.discount_percent = G.GAME.discount_percent - card.ability.extra.money_off
		G.E_MANAGER:add_event(Event({func = function()
			for k, v in pairs(G.I.CARD) do
				if v.set_cost then v:set_cost() end
			end
			return true end 
		}))
	end
})

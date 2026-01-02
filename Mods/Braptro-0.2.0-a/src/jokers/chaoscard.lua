SMODS.Joker({
	key = "chaoscard",
	loc_txt = {
		name = "Chaos Card",
		text = {
			"If this joker is {C:attention}sold{} when",
            "you have 5 or more Jokers",
			"Destroy {C:attention}2{} random Jokers",
            "and set money to {C:money}$0{}",
			"Creates a {C:legendary,E:1}Legendary{} Joker",
		},
	},

	atlas = "jokers",
	pos = { x = 8, y = 1 },
	config = { extra = {} },
	unlocked = true,
	discovered = true,
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	calculate = function(self, card, context)
		if context.selling_self and #G.jokers.cards >= 5 then
			for i = 1, 2 do
				local destructable_jokers = {}
				for i = 1, #G.jokers.cards do
					if
						G.jokers.cards[i] ~= card
						and not G.jokers.cards[i].ability.eternal
						and not G.jokers.cards[i].getting_sliced
					then
						destructable_jokers[#destructable_jokers + 1] = G.jokers.cards[i]
					end
				end

				local joker_to_destroy = pseudorandom_element(destructable_jokers, pseudoseed("chaoscard"))

				joker_to_destroy.getting_sliced = true
				G.E_MANAGER:add_event(Event({
					func = function()
						(context.blueprint_card or card):juice_up(0.8, 0.8)
						joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
						return true
					end,
				}))
			end
			G.GAME.dollars = 0
			SMODS.add_card({ set = "Joker", legendary = true })
		end
	end,

	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,
})

SMODS.Joker({
	key = "devildetails",
	loc_txt = {
		name = "Devils In The Details",
		text = {
			"This Joker gains {X:mult,C:white}X0.06{} Mult",
            "for each scored 6.",
			"Destroys a card in played hand",
            "that isn't a 6 for every scored 6",
			"{C:inactive}(Current {X:mult,C:white}X#1#{C:inactive} mult){}",
		},
	},

	atlas = "jokers",
	pos = { x = 7, y = 1 },
	config = { extra = { xmult = 1 } },
	unlocked = true,
	discovered = true,
	rarity = 1,
	cost = 1,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 6 then
				card.ability.extra.xmult = card.ability.extra.xmult + 0.06
			else
				if G.hand.cards then
					local not_destroyed = {}
					for _, card in pairs(G.hand.cards) do
						if not card.destroyed then
							table.insert(not_destroyed, card)
						end
					end

					destroycard = pseudorandom_element(not_destroyed)
                    if destroycard then
                        SMODS.destroy_cards(destroycard)
                    end
				end
			end
		end
	end,

	loc_vars = function(self, info_queue, card)
		return { vars = { tostring(card.ability.extra.xmult) } }
	end,
})

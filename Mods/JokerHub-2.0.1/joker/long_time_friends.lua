SMODS.Joker {
	key = "long_time_friends",
	config = {
		extra = {
			x_mult = 1,
			scaling = 0.25
		}
	},
	rarity = 3,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.x_mult, card.ability.extra.scaling}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 4, y = 3 },
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if not card.debuff then
			--Upgrade
			if context.selling_card and context.card.ability and context.card.ability.eternal then
				SMODS.scale_card(card, {
					ref_table = card.ability.extra, -- the table that has the value you are changing in
					ref_value = "x_mult", -- the key to the value in the ref_table
					scalar_value = "scaling", -- the key to the value to scale by, in the ref_table by default
					message_key = 'a_xmult'
				})
			end
			
			--Scoring
			if context.joker_main and not card.debuff and card.ability.extra.x_mult > 1 then
				return {
				  Xmult_mod = card.ability.extra.x_mult,
				  message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
				  card = card,
				}
			end
		end
	end,
	in_pool = function(self, args)
		return G.GAME.modifiers.enable_eternals_in_shop
	end
}

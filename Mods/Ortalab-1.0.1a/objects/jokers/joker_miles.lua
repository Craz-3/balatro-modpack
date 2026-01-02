SMODS.Joker({
	key = "joker_miles",
	atlas = "jokers",
	pos = {x = 4, y = 1},
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	config = {extra = {mult = 0, mult_gain = 8, chance = 6}},
    artist_credits = {'logan'},'flare',
	loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult_gain, card.ability.extra.mult, SMODS.get_probability_vars(card, 1, card.ability.extra.chance)}}
    end,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'ortalab_joker_miles', 1, card.ability.extra.chance) then
                card.ability.extra.mult = 0
                return {
                    message = localize('ortalab_joker_miles_reset'),
                    colour = G.C.RED
                }
            else
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "mult_gain",
                    scaling_message = {
                        message = localize('ortalab_joker_miles'),
                        colour = G.C.RED
                    }
                })
            end
        end
        if context.joker_main and card.ability.extra.mult > 0 then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end
})
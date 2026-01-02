SMODS.Joker({
	key = "dropout",
	atlas = "jokers",
	pos = {x=0,y=2},
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	config = {extra = {rank = "Ace", chips = 10, mult = 2, repetitions = 1}},
	artist_credits = {'gappie'},
	loc_vars = function(self, info_queue, card)
		return {vars = {vars = {card.ability.extra.repetitions}, localize(card.ability.extra.rank, 'ranks'), card.ability.extra.chips, card.ability.extra.mult}}
	end,
	calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card:get_id() == 14 and not context.other_card.config.center.always_scores then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
		if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 and not context.other_card.config.center.always_scores then
            return {
				mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end
})
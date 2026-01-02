SMODS.Joker {
    key = 'babyjoker',
    loc_txt = {
        name = 'Baby Joker',
        text = {
            'This Joker gains {C:green}+1{} chance to self destruct when a common is sold.',
            '{C:green}#1# in 10{} chance to self destruct at the end of a round',
            'Becomes the "Adult Joker" after self destruction',
        }
    },

    atlas = 'jokers',
    pos = { x = 3, y = 3 },
    no_pool_flag = 'babyjoker_old',
    config = { extra = { chance = 0 } },
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.selling_card and context.card.config.center.rarity == 1 then
            card.ability.extra.chance = card.ability.extra.chance + 1
        end

        if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
            if pseudorandom('babyjoker') < (card.ability.extra.chance + G.GAME.probabilities.normal) / 10 then
				-- This part plays the animation.
                G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						-- This part destroys the card.
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
                G.GAME.pool_flags.babyjoker_old = true
                SMODS.add_card({key = 'j_brap_adultjoker'})
				return {
					message = 'Age Up!'
				}
            else
                return {
                    message = "Safe"
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {((card.ability.extra.chance + G.GAME.probabilities.normal) or 1)} }
    end,
}

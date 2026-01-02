SMODS.Joker {
    key = 'congregation',
    loc_txt = {
        name = 'Congregation',
        text = {
            'Gains {X:mult,C:white}X0.15{} Mult for each',
            'card below {C:attention}#1#{}',
            'in your full deck',
            '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)',
        }
    },

    atlas = 'jokers',
    pos = { x = 9, y = 0 },
    config = { extra = { xmult = 1 } },
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.remove_playing_cards then
            card.ability.extra.xmult = 1 + 0.15*(G.GAME.starting_deck_size - #G.playing_cards)
        end

        if context.joker_main then
            return { xmult = card.ability.extra.xmult }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.starting_deck_size, card.ability.extra.xmult } }
    end,
}

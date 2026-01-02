SMODS.Joker {
    key = 'escalator',
    loc_txt = {
        name = 'Escalator',
        text = {
            'This Joker gains {X:mult,C:white}X#1#{}',
            'Mult per scored card.',
            'Loses {X:mult,C:white}X#2#{} mult',
            'per remaining hand at',
            'the end of the round',
            '{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult){}',
        }
    },

    atlas = 'jokers',
    pos = { x = 1, y = 0 },
    config = { extra = {
        card_add = 0.025,
        remhand_sub = 0.05,
        xmult = 1
    }},
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.card_add
        end
        if context.end_of_round and context.game_over == false then
            card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.remhand_sub*G.GAME.current_round.hands_left
        end
        if context.joker_main then
            return { card.ability.extra.xmult }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {
            tostring(card.ability.extra.card_add),
            tostring(card.ability.extra.remhand_sub),
            tostring(card.ability.extra.xmult)
        }}
    end,
}

SMODS.Joker {
    key = 'tightrope',
    loc_txt = {
        name = 'Tightrope',
        text = {
            'This Joker gains {X:mult,C:white}X#1#{} Mult',
            'for every discarded Straight',
            '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult){}',
        }
    },

    atlas = 'jokers',
    pos = { x = 1, y = 1 },
    config = { extra = {
        xmult_gain = 1/3,
        xmult = 1
    }},
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.pre_discard and (G.FUNCS.get_poker_hand_info(G.hand.highlighted) == "Straight") then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
        end
        if context.joker_main then
            return { xmult = card.ability.extra.xmult }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.xmult_gain,
            card.ability.extra.xmult
        }}
    end,
}

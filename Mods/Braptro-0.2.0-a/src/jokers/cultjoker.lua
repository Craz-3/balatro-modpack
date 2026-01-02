SMODS.Joker {
    key = 'cultjoker',
    loc_txt = {
        name = 'Cult Joker',
        text = {
            'Gains the {C:money}sell{} value of',
            'any {C:attention}sold{} Joker',
        }
    },

    atlas = 'jokers',
    pos = { x = 8, y = 0 },
    config = { extra = {} },
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.selling_card then
            card.sell_cost = card.sell_cost + context.card.sell_cost
            -- card.sell_cost = card.sell_cost + context.card.cost
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
}

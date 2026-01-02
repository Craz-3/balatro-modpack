SMODS.Joker {
    key = 'seniorjoker',
    loc_txt = {
        name = 'Senior Joker',
        text = {
            'This Joker gains {C:mult}+2{} mult',
            'per round played',
            '{C:inactive}(Current {C:mult}+#1#{C:inactive} mult){}',
        }
    },

    atlas = 'jokers',
    rarity = 1,
    cost = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pos = { x = 6, y = 1 },
    config = {
        extra = { mult = 0 }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return { mult = card.ability.extra.mult }
        end

        if context.end_of_round and context.main_eval then
            card.ability.extra.mult = card.ability.extra.mult + 2
        end
    end
}

SMODS.Joker {
    key = 'adultjoker',
    loc_txt = {
        name = 'Adult Joker',
        text = {
            '{C:common}Common{} Jokers each',
            'give {X:mult,C:white}X1.5{} Mult and {C:money}$2{}',
        }
    },

    atlas = 'jokers',
    pos = { x = 4, y = 3 },
    config = { extra = {} },
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 1, --need to set this
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.other_joker and context.other_joker.config.center.rarity == 1 then
            return {
                xmult = 1.5,
                dollars = 2
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    in_pool = function(self, args) -- equivalent to `yes_pool_flag = 'vremade_gros_michel_extinct'`
        return false
    end,
}

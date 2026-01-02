SMODS.Joker({
    key = "plus2",
    loc_txt = {
        name = "+2",
        text = {
            "2 extra cards can be played",
            "cards after 5 are",
            "always scored",
        },
    },

    atlas = "jokers",
    pos = { x = 2, y = 3 },
    config = { extra = {} },
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.modify_scoring_hand then
            for i = 6, #context.full_hand do
                if context.other_card == context.full_hand[i] then
                    return { add_to_hand = true }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(2)
        SMODS.change_discard_limit(2)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-2)
        SMODS.change_discard_limit(-2)
    end,
})

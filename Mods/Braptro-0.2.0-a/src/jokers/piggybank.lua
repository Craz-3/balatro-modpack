SMODS.Joker {
    key = 'piggybank',
    loc_txt = {
        name = 'Piggybank',
        text = {
            'Prevent death one',
            'time and earn {C:money}$40{}'
        }
    },
    atlas = 'jokers',
    pos = { x = 4, y = 2 },
    config = { extra = {} },
    unlocked = true,
    discovered = true,
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.game_over and not next(SMODS.find_card('j_mr_bones')) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound('tarot1')
                    card:start_dissolve()
                    return true
                end
            }))
            return {
                message = localize('k_saved_ex'),
                saved = 'ph_brap_piggybank',
                colour = G.C.RED,
                dollars = 40
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
}

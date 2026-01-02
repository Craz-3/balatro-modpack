SMODS.Joker {
    key = 'lastlaugh',
    loc_txt = {
        name = 'Last Laugh',
        text = {
            'Create a {C:spectral}spectral{} card',
            'if no hands are remaining',
            'at the end of the round'
        }
    },

    atlas = 'jokers',
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pos = { x = 0, y = 2 },
    config = {
        extra = {}
    },

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra_value , G.GAME.probabilities.normal} }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and context.game_over == false and not context.repetition and not context.blueprint and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and G.GAME.current_round.hands_left == 0 then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                        local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'las')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        G.GAME.consumeable_buffer = 0
                    return true
                end)}))
                return {
                    message = localize('k_plus_spectral'),
                    colour = G.C.Tarot,
                   card = card
                }
        end
    end
}

return {
    SMODS.Joker {
        key = 'thelion',
        loc_txt = {
            name = 'The Lion Does Not Concern Himself With Playing',
            text = {
                "If both the {C:attention}Small{} and {C:attention}Big{} Blind have been {C:attention}skipped,",
                "Prevents death on {C:attention}non-Showdown{} Boss Blinds"
            }
        },
        config = {extra = {}},
        loc_vars = function(self, info_queue, card) end,
        rarity = "garb_rainbow",
        atlas = 'GarbJokers',
        pos = {x = 4, y = 12},
        cost = 10,

        unlocked = true,
        discovered = false, -- whether or not it starts discovered
        blueprint_compat = true, -- can it be blueprinted/brainstormed/other
        eternal_compat = true, -- can it be eternal
        perishable_compat = false, -- can it be perishable

        calculate = function(self, card, context)
          if context.game_over and G.GAME.round_resets.blind_states.Small == 'Skipped' and G.GAME.round_resets.blind_states.Big == 'Skipped' and not (G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].boss.showdown) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound('tarot1')
                    return true
                end
            }))
            return {
                message = localize('k_saved_ex'),
                saved = true,
                colour = G.C.RED
            }
          end
        end
    }

}

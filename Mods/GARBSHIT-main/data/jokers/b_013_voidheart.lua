return {
    SMODS.Joker {
        key = 'voidheart',
        loc_txt = {
            name = 'Void Heart',
            text = {
                "When {C:attention}Blind{} is selected, {C:red}banish{} ",
                "{C:attention}Joker{} to the right to the {X:black,C:white} Void",
                "On {C:attention}final hand{} of round, {C:attention}release{} all Jokers",
                "from the {X:black,C:white} Void {} and {C:red}destroy{} this Joker",
            }
        },
        config = {extra = {}},
        loc_vars = function(self, info_queue, card) end,
        rarity = "garb_rainbow",
        atlas = 'GarbJokers',
        pos = {x = 6, y = 12},
        cost = 10,

        unlocked = true,
        discovered = false, -- whether or not it starts discovered
        blueprint_compat = true, -- can it be blueprinted/brainstormed/other
        eternal_compat = true, -- can it be eternal
        perishable_compat = false, -- can it be perishable

        calculate = function(self, card, context)
          if context.setting_blind and not context.blueprint then
            local void = true
            for k, v in pairs(G.jokers.cards) do
                if v == card and G.jokers.cards[k+1] then
                    local _card = copy_card(G.jokers.cards[k+1], nil, nil, nil, true)
                    _card:set_edition('e_negative', true, true)
                    _card:add_to_deck()
                    G.garb_void:emplace(_card)
                    play_sound("garb_shade2")
                    G.jokers.cards[k+1]:start_dissolve({G.C.BLACK}, nil, 1.6)
                    void = false
                end
            end
            if not void then
                return {
                    message = "",
                    colour = G.C.BLACK
                }
            end
          end

          if context.before and G.GAME.current_round.hands_left == 0 and #G.garb_void.cards > 0 then
            for k, v in pairs(G.garb_void.cards) do
                local _card = copy_card(v, nil, nil, nil, true)
                _card:start_materialize({G.C.BLACK}, nil, 1.6)
                _card:set_edition('e_negative', true, true)
                _card:add_to_deck()
                G.jokers:emplace(_card)
                play_sound("garb_shade1")
                v:start_dissolve({G.C.BLACK}, nil, 1.6)
            end
            card:start_dissolve({G.C.BLACK}, nil, 1.6)
          end
        end
    }

}

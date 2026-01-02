function Balatrostuck.INIT.Jokers.j_cloudwatching()
    SMODS.Joker{
        name = "Cloudwatching",
        key = "cloudwatching",
        config = {
            extra = {
            }
        },
        loc_txt = {
            ['name'] = 'Cloudwatching',
            ['text'] = {
                [1] = "When round begins, create ",
                [2] = "a {C:paradox}Paradox{} copy of",
              --  [3] = "and add it to your {C:attention}hand",
                [3] = "the {C:attention}10th card{} from",
                [4] = "the top of your {C:attention}deck"
            }
        },
        pos = {
            x = 9,
            y = 10
         },
        cost = 3,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        unlocked = true,
        atlas = 'HomestuckJokers',
        calculate = function (self, card, context)
            if context.first_hand_drawn then
                local firstmat = nil
                if #G.deck.cards >= 10 then
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local _card = copy_card(G.deck.cards[#G.deck.cards-9], nil, nil, G.playing_card)
                    _card:add_to_deck()
                    _card:set_edition('e_bstuck_paradox')
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, _card)
                    G.hand:emplace(_card)
                    _card.states.visible = nil

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            _card:start_materialize()
                            return true
                        end
                    }))
                    playing_card_joker_effects({_card})
                end
            end
        end,           
        loc_vars = function(self, info_queue, card)
            art_credit('akai', info_queue)
            info_queue[#info_queue + 1] = G.P_CENTERS['e_bstuck_paradox']
        end
    }
end 
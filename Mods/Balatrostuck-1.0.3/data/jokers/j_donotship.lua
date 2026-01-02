--TODO: not allowed hands thang
function Balatrostuck.INIT.Jokers.j_donotship()
    SMODS.Joker{
        name = "Skrunkle Bingoid",
        key = "donotship",
        config = { extra = {
            Xmult = 2
        }},
        loc_txt = {
            ['name'] = 'Skrunkle Bingoid',
            ['text'] = {
                'forces your first hand to be',
                'a Flush Five of Aces of Clubs'
            }
        },
        pos = {
            x = 5,
            y = 8
         },
        cost = 7,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        unlocked = true,
        discovered = true,
        atlas = 'HomestuckJokers',

        loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult^G.GAME.round_resets.ante} }
        end, 

        calculate = function (self, card, context)
            if context.first_hand_drawn then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        -- create the cards
                        local firstmat = nil
                        for i=1, 5 do
                            G.hand:unhighlight_all()
                            G.E_MANAGER:add_event(Event({
                                blocking = true, delay = 0.3, trigger = 'after', func = function()
                                local _card = create_playing_card({front = G.P_CARDS['C_A'], center = G.P_CENTERS.m_lucky}, nil, nil, nil, {G.C.SECONDARY_SET.Enhanced})
                                firstmat = true
                                _card:set_edition('e_bstuck_paradox',true,true)
                                G.hand:emplace(_card)
                                G.hand:add_to_highlighted(_card)
                                return true
                            end}))
                            playing_card_joker_effects({_card})
                        end
                    
                        G.E_MANAGER:add_event(Event({
                            blocking = true, delay = 0.3, trigger = 'after', func = function()
                                G.FUNCS.play_cards_from_highlighted()
                            return true
                        end}))


                        return true
                end}))
            end
        end
    }
end
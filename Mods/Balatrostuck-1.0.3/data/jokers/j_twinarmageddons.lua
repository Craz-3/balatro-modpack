function Balatrostuck.INIT.Jokers.j_twinarmageddons()
    local cool2tuff =SMODS.Gradient{
        key = 'SOLLUX_GRAD',
        colours = {
            HEX('009dff'),
            HEX('fe5f55')
        },
        cycle = 1,
        interpolation = 'trig' 
    }



    SMODS.Joker{
        name = "Twin Armageddons",
        key = "twinarmageddons",
        config = {
            extra = {
                hand = 'Two Pair'
            }
        },
        loc_txt = {
            ['name'] = 'Twin Armageddons',
            ['text'] = {
                [1] = 'If {C:attention}played hand{} is',
                [2] = '{C:attention}#1#{}, played cards',
                [3] = 'give {C:red}Mult{} equal to their',
                [4] = "{C:blue}Chips{} value when scored"
            }
        },
        pos = {
            x = 0,
            y = 3
         },
        cost = 8,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        unlocked = true,
        atlas = 'HomestuckJokers',
        loc_vars = function(self, info_queue, twincard)
            art_credit('akai', info_queue)
            return {vars = {twincard.ability.extra.hand}}
        end,
        calculate = function(self,card,context)
            if context.cardarea == G.jokers and context.joker_main then
            elseif context.cardarea == G.play and context.individual and next(context.poker_hands[card.ability.extra.hand]) and not ((next(context.poker_hands['Full House'])) or next(context.poker_hands['Flush House'])) then
                local chips = context.other_card:get_chip_bonus()
                if (context.other_card:get_edition() ~= nil and context.other_card:get_edition().chip_mod ~= nil) then
                    chips = context.other_card:get_edition().chip_mod + chips
                end
                return {
                    mult = chips,
                    twincard = card
                }
            end
        end,
        set_card_type_badge = function(self, card, badges)
            local colour = G.SETTINGS.bstuck_animation_mode == 1 and cool2tuff or G.C.RED
            badges[1] = create_badge(localize('k_rare'), colour, nil, 1.2)
        end
    }
end

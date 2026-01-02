return {
SMODS.Edition{
        key = "fish",
        shader = 'fish',
        loc_txt = {
            name = 'Aquatic',
            label = 'Aquatic',
            text = { 
                '{X:dark_edition,C:white} X1.25 {} Values',
                '{C:inactive,s:0.8}(Values may be rounded)'
            },
        },
        extra_cost = 3,
        config = {values = 1.25},
        sound = { sound = "garb_bubble", per = 0.7, vol = 0.4 },
        badge_colour = HEX('88B7EE'),
        unlocked = true,
        discovered = false,
        on_apply = function(card)
            card.ability = DeepScale(card.ability, 0, 1.25) 
        end,
        on_remove = function(card)
            card.ability = DeepScale(card.ability, 0, 1/1.25) 
        end
    }
}
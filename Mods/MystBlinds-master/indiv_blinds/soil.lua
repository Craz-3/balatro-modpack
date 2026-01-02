local blind = {
    name = "The Soil",
    pos = { x = 0, y = 12 },
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 3, max = 10},
    boss_colour = HEX('FFAD4A'),
    loc_txt = {}
}

blind.calculate = function(self, card, context)
    if context.before and not context.blueprint then
        if context.scoring_hand and context.scoring_hand[1] then
            SMODS.debuff_card(context.scoring_hand[1], true, "the_soil")
        end
        card:juice_up()
    end
end

blind.defeat = function(self)
    for _, v in ipairs(G.playing_cards) do
        SMODS.debuff_card(v, false, "the_soil")
    end
end

blind.disable = function(self)
    for _, v in ipairs(G.playing_cards) do
        SMODS.debuff_card(v, false, "the_soil")
    end
end

return blind
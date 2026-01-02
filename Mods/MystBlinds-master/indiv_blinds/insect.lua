local blind = {
    name = "The Insect",
    pos = { x = 0, y = 3 },
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 3, max = 10},
    boss_colour = HEX('873E2C'),
    loc_txt = {}
}

blind.press_play = function(self)
    G.GAME.blind.prepped = true
end

blind.drawn_to_hand = function(self)
    for _, v in ipairs(G.jokers.cards) do
        if v.ability.myst_insect then
            v.ability.myst_insect = false
            SMODS.recalc_debuff(v)
        end
    end
    if G.jokers and G.jokers.cards[1] and G.GAME.blind.prepped then
        G.jokers.cards[1].ability.myst_insect = true
        SMODS.recalc_debuff(G.jokers.cards[1])
        G.jokers.cards[1]:juice_up()
        G.GAME.blind:wiggle()
    end
end

blind.recalc_debuff = function(self, card)
    if card.ability.myst_insect then
        return true
    end
end

blind.disable = function(self)
    for _, v in ipairs(G.jokers.cards) do
        if v.ability.myst_insect then
            v.ability.myst_insect = false
            SMODS.recalc_debuff(v)
        end
    end
end

blind.defeat = function(self)
    for _, v in ipairs(G.jokers.cards) do
        if v.ability.myst_insect then
            v.ability.myst_insect = false
            SMODS.recalc_debuff(v)
        end
    end
end

return blind
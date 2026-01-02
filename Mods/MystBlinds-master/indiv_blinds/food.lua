local blind = {
    name = "The Food",
    pos = { x = 0, y = 9 },
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 2, max = 10},
    boss_colour = HEX('1EE68E'),
    loc_txt = {}
}

blind.debuff_hand = function(self, cards, hand, handname, check)
    G.GAME.blind.triggered = false
    local total = 0
    for _, v in ipairs(cards) do
        total = total + v.base.nominal
    end
    if total % 2 == 1 then
        G.GAME.blind.triggered = true
        return true
    end
end

blind.defeat = function(self)
    if G.GAME.bosses_used["bl_myst_food"] >= G.GAME.bosses_used["bl_myst_fruit"] then
        G.GAME.bosses_used["bl_myst_fruit"] = G.GAME.bosses_used["bl_myst_fruit"] + 1
    end
end

return blind
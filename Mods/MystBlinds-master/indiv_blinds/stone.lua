local blind = {
    name = "The Stone",
    pos = { x = 0, y = 1 },
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 2, max = 10},
    boss_colour = HEX('85898C'),
    loc_txt = {}
}

blind.debuff_card = function(self, card, from_blind)
    if card.area ~= G.jokers and card.config.center ~= G.P_CENTERS.c_base then
        return true
    end
end

return blind
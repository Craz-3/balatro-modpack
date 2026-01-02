local blind = {
    name = "The Center",
    pos = { x = 0, y = 10 },
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 2, max = 10},
    boss_colour = HEX('FFEF71'),
    loc_txt = {}
}

blind.defeat = function(self)
    if not G.GAME.blind.disabled then
        if G.GAME.current_round.discards_left > 0 then
            G.GAME.blind:wiggle()
            G.GAME.inflation = G.GAME.inflation or 0
            G.GAME.inflation = G.GAME.inflation + G.GAME.current_round.discards_left
        end
    end
end

return blind
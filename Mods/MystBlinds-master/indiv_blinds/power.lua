local blind = {
    name = "The Power",
    pos = { x = 0, y = 13 },
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 4, max = 10},
    boss_colour = HEX('D066FF'),
    loc_txt = {}
}

blind.press_play = function(self)
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
        for i = 1, #G.hand.cards do
            if G.hand.cards[i].config.center.key == "c_base" then
                G.E_MANAGER:add_event(Event({func = function() G.hand.cards[i]:juice_up(); return true end })) 
                ease_dollars(-2)
                delay(0.23)
            end
        end
    return true end }))
    G.GAME.blind.triggered = true
    return true
end

return blind
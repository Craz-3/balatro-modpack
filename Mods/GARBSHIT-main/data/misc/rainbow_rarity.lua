G.C.RAINBOW = SMODS.Gradient {
    key = "color_rainbow",
    colours = {
        HEX('E65959'),
        HEX('EE996E'),
        HEX('C7D376'),
        HEX('88D6C1'),
        HEX('968AC8'),
        HEX('E472A1'),
    },
    cycle = 3,
    interpolation = 'trig'
 }

return {
 SMODS.Rarity {
    key = 'rainbow',
    loc_txt = {
      name = 'Rainbow',
    },
    badge_colour = G.C.RAINBOW
 }
}
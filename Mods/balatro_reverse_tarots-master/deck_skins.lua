 local atlas_lc = SMODS.Atlas {
    key = "skin_lc",
    path = "purple_spades.png",
    px = 71,
    py = 95,
}

local atlas_hc = SMODS.Atlas {
    key = "skin_hc",
    path = "penrose_spades.png",
    px = 71,
    py = 95,
}
    
SMODS.DeckSkin {
    key = "ourple",
    suit = "Spades",
    loc_txt = "Purple Spades!",
    palettes = {
        {
            key = 'lc',
            ranks = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"},
            display_ranks = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"},
            atlas = atlas_lc.key,
            pos_style = 'suit',
            colour = HEX("561faf"),
            suit_icon = {
                pos = 0,
            },
        },
        {
            key = 'hc',
            ranks = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"},
            display_ranks = {"Jack", "Queen", "King", "Ace"},
            atlas = atlas_hc.key,
            pos_style = 'suit',
            colour = HEX("561faf"),
            suit_icon = {
            pos = 0,
            },
        },
    },
}
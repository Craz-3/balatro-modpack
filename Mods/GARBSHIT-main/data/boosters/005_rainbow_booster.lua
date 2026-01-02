return {
 SMODS.Booster {
        key = "rainbow_booster",
        kind = "Joker",
        atlas = "GarbBoosters",
        group_key = "rainbow_booster",
        pos = {x = 10, y = 0},
        config = {
            extra = 6,
            choose = 1
        },
        cost = 4,
        order = 1,
        weight = 1,
        unlocked = true,
        discovered = false,
        no_collection = true,
        in_pool = function()
		    return false
	    end,
        create_card = function(self, card)
            local rainbows = create_card("Joker", G.pack_cards, nil, "garb_rainbow", nil, nil, nil, "gay")
            rainbows.ability.eternal = false
            rainbows.ability.perishable = false
            rainbows.edition = nil
            return rainbows
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.DARK_EDITION)
            ease_background_colour({ new_colour = G.C.DARK_EDITION, special_colour = G.C.BLACK, contrast = 2 })
        end,
    },

    }
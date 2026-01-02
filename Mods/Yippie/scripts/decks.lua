SMODS.Back{ --test deck 1
    name = "Wdeck",      -- name of the deck (in code)
    key = "Wdeck",       -- key used to call the deck 
    pos = {x = 0, y = 4},   -- unsure what this does currently, come back to this !!
    atlas = 'Decks',        -- atlas referenced for deck texture
    atlas_key = 'Wdeck', -- also unsure what this does, come back to this !!
    pos = {             -- position of the texture on the atlas
        x = 0,
        y = 0,
        },

    config = {              -- config for the deck, can include hands, discards, consumables, vouchers, money, etc.
        hands = 0,
        discards = -1,
        consumables = {'c_wraith'},
    },


    
    draw_step = 'spectral',
    shader = 'spectral',

    loc_txt = {
        name = "Wraith Deck", -- name the deck appears as in game
        text = {            -- description text for the deck
            "{C:red}#1#{} discards",
            "Start with a {C:spectral}Wraith{} card"
        }
    },
    loc_vars = function(self)   --variable setup
        return { vars = { 
            self.config.discards,   -- #1#
            self.config.hands,      -- #2#
            self.config.consumables, -- #3#
        }}
    end,


   --[[ 
SMODS.DrawStep { -- shader stuff, currently broken.
        layer = 'card',
        key = 'spectral',
        order = 5,
        func = function(self)
                if G.GAME.selected_back.name == 'Wdeck' then
                    self.children.back:draw_shader('booster')
                    self.hover_tilt = self.hover_tilt - 1
                elseif G.GAME.viewed_back.name == 'Wdeck' then
                    self.children.back:draw_shader('booster')
                    self.hover_tilt = self.hover_tilt - 1
                end

                -- self.draw_card(self)
        end,
        conditions = {facing = 'back'}
    }
    --]]

}
    
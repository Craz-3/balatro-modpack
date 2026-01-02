
-- SMODS.Back {
--     key = "test",
--     loc_txt = {
--         ['default'] = {
--             name = 'RH Test Deck',
--             text = {'Spawns whatever cards I wanna test.'}
--         }
--     },
--     apply = function(self)
--         G.E_MANAGER:add_event(Event({
--             blockable = false,
--             func = function()
--                 ease_dollars(400, true)

--                 local card_t = {
--                     set = "Joker",
--                     area = G.jokers,
--                     key = "j_cavendish"
--                 }
--                 local card = SMODS.create_card(card_t)
--                 G.jokers:emplace(card)

--                 local card_t = {
--                     set = "Joker",
--                     area = G.jokers,
--                     key = "j_cavendish"
--                 }
--                 local card = SMODS.create_card(card_t)
--                 G.jokers:emplace(card)

--                 local card_t = {
--                     set = "Joker",
--                     area = G.jokers,
--                     key = "j_cavendish"
--                 }
--                 local card = SMODS.create_card(card_t)
--                 G.jokers:emplace(card)

--                 local card_t = {
--                     set = "Joker",
--                     area = G.jokers,
--                     key = "j_cavendish"
--                 }
--                 local card = SMODS.create_card(card_t)
--                 G.jokers:emplace(card)

--                 local card_t = {
--                     set = "Joker",
--                     area = G.jokers,
--                     key = "j_cavendish"
--                 }
--                 local card = SMODS.create_card(card_t)
--                 G.jokers:emplace(card)

--                 local card_t = {
--                     set = "Flow",
--                     area = G.consumeables,
--                     key = "c_rh_debug"
--                 }
--                 local card = SMODS.create_card(card_t)
--                 G.consumeables:emplace(card)

--                 return true
--             end
--         }))
--     end
-- }

-- SMODS.Consumable({
--     key = "debug",
--     set = 'Tarot',
--     cost=3,
--     atlas = 'consumables',
--     pos = {
--         x = 0,
--         y = 0
--     },
--     loc_txt = {
--         name = 'DEBUG_CONSUMABLE',
--         text = {
--             "Flow Cards appear",
--             "#1#x more frequently",
--             "in the shop ",
--         },
--     },

--     use = function(self, card, area, copier)
--         G.consumeables.cards[1]:add_sticker("rh_remix_sticker_joker", true)
--     end,

--     can_use = function (self, card) 
--         return true
--     end
-- })

-- SMODS.Consumable({
--     key = "debug2",
--     set = 'Tarot',
--     cost=3,
--     atlas = 'consumables',
--     pos = {
--         x = 0,
--         y = 0
--     },
--     loc_txt = {
--         name = 'DEBUG_JOKER',
--         text = {
--             "Flow Cards appear",
--             "#1#x more frequently",
--             "in the shop ",
--         },
--     },

--     use = function(self, card, area, copier)
--         G.jokers.cards[1]:add_sticker("rh_remix_sticker_joker", true)
--     end,

--     can_use = function (self, card) 
--         return true
--     end
-- })

-- SMODS.Consumable({
--     key = "debug3",
--     set = 'Tarot',
--     cost=3,
--     atlas = 'consumables',
--     pos = {
--         x = 0,
--         y = 0
--     },
--     loc_txt = {
--         name = 'DEBUG_HAND',
--         text = {
--             "Flow Cards appear",
--             "#1#x more frequently",
--             "in the shop ",
--         },
--     },

--     use = function(self, card, area, copier)
--         G.hand.cards[1]:add_sticker("rh_remix_sticker_card", true)
--     end,

--     can_use = function (self, card) 
--         return true
--     end
-- })
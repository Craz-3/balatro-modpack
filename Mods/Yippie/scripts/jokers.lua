    SMODS.Joker { -- yippie --
       key = 'yippie',

           -- description of the joker.
        loc_txt = {
            name = 'Yippie Joker',
            text = {
                "{C:mult}+#1#{} Mult, gains",
                "{C:mult}+#2#{} Mult when scored.",
            }
        },

           -- config of the joker. Variables go here.
        config = {
           extra = {
                mult = 0,
                gain = 1
         }
     },
            -- rarity level, 0 = common, 1 = uncommon, 2 = rare, 3 = legendary.
        rarity = 2,

            -- atlas the joker uses for texture(s).
        atlas = 'Coo29',
    
            -- where on the atlas texture the joker is locarted.
        pos = {
            x = 0,
            y = 0
        },
            -- cost of the joker in the shop.
        cost = 2,

            -- whether it is unlocked by default.
        unlocked = true,

            -- whether it is discovered by default.
        discovered = true,

            -- whether blueprint can copy this joker.
        blueprint_compat = true,

            -- whether this joker can have the perishable sticker.
        perishable_compat = true,

            -- whether this joker can have the eternal sticker.
        eternal_compat = true,

            -- whether duplicates of this joker can appear in the shop by default.
        allow_duplicates = true,

            -- loc_vars works with the config and gives you text variables to work with.
            -- these are formatted as #n#, where n is the position in the variable table.
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                        -- #1#
                    card.ability.extra.mult,
                        -- #2#
                    card.ability.extra.gain,
                    }
                }
        end,

            -- calculate is where the scoring and effects of the joker are handled. 
        calculate = function(self, card, context)
                -- context.joker_main takes place when the joker is meant to score.
            if context.joker_main then
                return {
                        -- adds the number contained in the mult variable to the score.
                mult_mod = card.ability.extra.mult,
                        -- message is the text that appears when the joker scores.
                        -- localize is used to make sure the text works across multiple languages.
                    message  = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = {
                            card.ability.extra.mult
                        }
                    }
                }
            end
                -- context.after takes place after the hand is scored.
                -- context.blueprint applies if the joker is a blueprint copy.
            if context.after and not context.blueprint then
                            -- adds the gain variable to the base mult number.
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
                    return {
                            -- another message, just prints the text.
                        message = "Yippie!",
                        colour = G.C.MULT,
                            -- plays the sound effect yippie.ogg. the prefix is needed.
                        play_sound("Coo29_yippie"),
                            -- needed, can be changed to context.other_card to apply to another card.
                        card = card
                    }
            end
        end
    }

    SMODS.Joker { -- possom --
        key = 'possomjok',
 
            -- description of the joker.
         loc_txt = {
             name = 'Possum',
             text = {
                 "Gives {C:money}$#1#{} at end of round,",
                 "increases by {C:money}$#2#{} per round.",
             }
         },
 
            -- config of the joker. Variables go here.
         config = {
            extra = {
                 money = 0,
                 gain = 2
          }
      },
             -- rarity level, 0 = common, 1 = uncommon, 2 = rare, 3 = legendary.
         rarity = 4,
 
             -- atlas the joker uses for texture(s).
         atlas = 'possom',
     
             -- where on the atlas texture the joker is locarted.
         pos = {
             x = 0,
             y = 0
         },

        soul_pos = {
            x = 1,
            y = 0
        },

             -- cost of the joker in the shop.
         cost = 20,
 
             -- whether it is unlocked by default.
         unlocked = true,
 
             -- whether it is discovered by default.
         discovered = true,
 
             -- whether blueprint can copy this joker.
         blueprint_compat = true,
 
             -- whether this joker can have the perishable sticker.
         perishable_compat = true,
 
             -- whether this joker can have the eternal sticker.
         eternal_compat = true,
 
             -- whether duplicates of this joker can appear in the shop by default.
         allow_duplicates = false,
 
             -- loc_vars works with the config and gives you text variables to work with.
             -- these are formatted as #n#, where n is the position in the variable table.
         loc_vars = function(self, info_queue, card)
             return {
                 vars = {
                         -- #1#
                     card.ability.extra.money,
                         -- #2#
                     card.ability.extra.gain,
                     }
                 }
         end,
 
         
             -- calculate is where the scoring and effects of the joker are handled. 
         calculate = function(self, card, context)
                 -- context.after takes place after the hand is scored.
                 -- context.blueprint applies if the joker is a blueprint copy.
             if context.end_of_round and context.main_eval and not context.blueprint then
                             -- adds the gain variable to the base mult number.
                         card.ability.extra.money = card.ability.extra.money + card.ability.extra.gain
                     return {
                             -- another message, just prints the text.
                         message = "Upgrade!",
                         colour = G.C.CASH,
                             -- needed, can be changed to context.other_card to apply to another card.
                         card = card
                     }
                     
             end
         end,

         calc_dollar_bonus = function(self, card)
             local bonus = card.ability.extra.money
             if bonus > 0 then return bonus end
         end


     }

    SMODS.Joker { -- monch --
        key = 'monch',
 
            -- description of the joker.
         loc_txt = {
             name = 'Monch',
             text = {
                 "{C:chips}-#1#{} Chips,",
                 "{X:mult,C:white}X#2#{} Mult.",
             }
         },
 
            -- config of the joker. Variables go here.
         config = {
            extra = {
                 chips = 80,
                 Xmult = 3
          }
      },
             -- rarity level, 1 = common, 2 = uncommon, 3 = rare, 4 = legendary.
         rarity = 3,
 
             -- atlas the joker uses for texture(s).
         atlas = 'Coo29',
     
             -- where on the atlas texture the joker is locarted.
         pos = {
             x = 2,
             y = 0
         },
             -- cost of the joker in the shop.
         cost = 8,
 
             -- whether it is unlocked by default.
         unlocked = true,
 
             -- whether it is discovered by default.
         discovered = true,
 
             -- whether blueprint can copy this joker.
         blueprint_compat = true,
 
             -- whether this joker can have the perishable sticker.
         perishable_compat = true,
 
             -- whether this joker can have the eternal sticker.
         eternal_compat = true,
 
             -- whether duplicates of this joker can appear in the shop by default.
         allow_duplicates = false,
 
             -- loc_vars works with the config and gives you text variables to work with.
             -- these are formatted as #n#, where n is the position in the variable table.
         loc_vars = function(self, info_queue, card)
             return {
                 vars = {
                         -- #1#
                     card.ability.extra.chips,
                         -- #2#
                     card.ability.extra.Xmult,
                     }
                 } 
         end,

             -- calculate is where the scoring and effects of the joker are handled. 
         calculate = function(self, card, context, score)
                 -- context.joker_main takes place when the joker is meant to score.
             if context.joker_main then 
                 return {
                    message = localize {
                        type = 'variable',
                        key = 'a_chips',
                        vars = {
                            card.ability.extra.chips
                        },
                    },
                    -- chips = G.GAME.current_round.current_hand.chips - card.ability.extra.chips - G.GAME.current_round.current_hand.chips,
                    chips =- card.ability.extra.chips,

                     message  = localize {
                         type = 'variable',
                         key = 'a_xmult',
                         vars = {
                             card.ability.extra.Xmult,
                         }
                     },
                     Xmult_mod = card.ability.extra.Xmult,
                 }
             end
         end

         
         
        }

    SMODS.Joker { -- minmoo --
        key = 'minmoo',
 
            -- description of the joker.
         loc_txt = {
             name = 'Minmoo',
             text = {
                 "Gain {C:chips}+#1#{} Chips",
                 "every time a {C:mult}Heart{}",
                 "card is scored.",
                 "(Currently {C:chips}+#2#{} Chips)",
             }
         },
 
            -- config of the joker. Variables go here.
         config = {
            extra = {
                chip_mod = 2,
                chips = 00,
          }
      },
             -- rarity level, 1 = common, 2 = uncommon, 3 = rare, 4 = legendary.
         rarity = 1,
 
             -- atlas the joker uses for texture(s).
         atlas = 'minmoo',
     
             -- where on the atlas texture the joker is locarted.
         pos = {
             x = 0,
             y = 0
         },
             -- cost of the joker in the shop.
         cost = 0,
 
             -- whether it is unlocked by default.
         unlocked = true,
 
             -- whether it is discovered by default.
         discovered = true,
 
             -- whether blueprint can copy this joker.
         blueprint_compat = true,
 
             -- whether this joker can have the perishable sticker.
         perishable_compat = true,
 
             -- whether this joker can have the eternal sticker.
         eternal_compat = true,
 
             -- whether duplicates of this joker can appear in the shop by default.
         allow_duplicates = false,
 
             -- loc_vars works with the config and gives you text variables to work with.
             -- these are formatted as #n#, where n is the position in the variable table.
         loc_vars = function(self, info_queue, card)
             return {
                 vars = {
                         -- #1#
                    card.ability.extra.chip_mod,
                         -- #2#
                    card.ability.extra.chips,
                     }
                 }
         end,
 
             -- calculate is where the scoring and effects of the joker are handled. 
         calculate = function(self, card, context)
                 -- context.joker_main takes place when the joker is meant to score.
             if context.joker_main then
                 return {
                         -- adds the number contained in the chips variable to the score.
                 chip_mod = card.ability.extra.chips,
                         -- message is the text that appears when the joker scores.
                         -- localize is used to make sure the text works across multiple languages.
                     message  = localize {
                         type = 'variable',
                         key = 'a_chips',
                         vars = {
                             card.ability.extra.chips,
                         }
                     }
                 }
             end

             if context.individual and context.cardarea == G.play and not context.blueprint then
                if context.other_card:is_suit('Hearts') then
                        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod                  
                end
             end
         end
         
         
     }
     
--[[    SMODS.Joker { -- test5 --
        key = 'test5',
 
            -- description of the joker.
         loc_txt = {
             name = 'Test 5',
             text = {
                 "{C:attention}Test Joker{}",
             }
         },
 
            -- config of the joker. Variables go here.
         config = {
            extra = {
                 x = 0,
                 y = 0
          }
      },
             -- rarity level, 0 = common, 1 = uncommon, 2 = rare, 3 = legendary.
         rarity = 1,
 
             -- atlas the joker uses for texture(s).
         atlas = 'Coo29',
     
             -- where on the atlas texture the joker is locarted.
         pos = {
             x = 4,
             y = 0
         },
             -- cost of the joker in the shop.
         cost = 0,
 
             -- whether it is unlocked by default.
         unlocked = true,
 
             -- whether it is discovered by default.
         discovered = true,
 
             -- whether blueprint can copy this joker.
         blueprint_compat = true,
 
             -- whether this joker can have the perishable sticker.
         perishable_compat = true,
 
             -- whether this joker can have the eternal sticker.
         eternal_compat = true,
 
             -- whether duplicates of this joker can appear in the shop by default.
         allow_duplicates = false,
 
             -- loc_vars works with the config and gives you text variables to work with.
             -- these are formatted as #n#, where n is the position in the variable table.
         loc_vars = function(self, info_queue, card)
             return {
                 vars = {
                         -- #1#
                     card.ability.extra.x,
                         -- #2#
                     card.ability.extra.y,
                     }
                 }
         end,
 
         --[[
             -- calculate is where the scoring and effects of the joker are handled. 
         calculate = function(self, card, context)
                 -- context.joker_main takes place when the joker is meant to score.
             if context.joker_main then
                 return {
                         -- adds the number contained in the mult variable to the score.
                 mult_mod = card.ability.extra.mult,
                         -- message is the text that appears when the joker scores.
                         -- localize is used to make sure the text works across multiple languages.
                     message  = localize {
                         type = 'variable',
                         key = 'a_mult',
                         vars = {
                             card.ability.extra.mult
                         }
                     }
                 }
             end
                 -- context.after takes place after the hand is scored.
                 -- context.blueprint applies if the joker is a blueprint copy.
             if context.after and not context.blueprint then
                             -- adds the gain variable to the base mult number.
                         card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
                     return {
                             -- another message, just prints the text.
                         message = "Yippie!",
                         colour = G.C.MULT,
                             -- plays the sound effect yippie.ogg. the prefix is needed.
                         play_sound("Coo29_yippie"),
                             -- needed, can be changed to context.other_card to apply to another card.
                         card = card
                     }
             end
         end


         
     }
]]
--[[     SMODS.Joker { -- test6 --
        key = 'test6',
 
            -- description of the joker.
         loc_txt = {
             name = 'Test 6',
             text = {
                 "{C:attention}Test Joker{}",
             }
         },
 
            -- config of the joker. Variables go here.
         config = {
            extra = {
                 x = 0,
                 y = 0
          }
      },
             -- rarity level, 0 = common, 1 = uncommon, 2 = rare, 3 = legendary.
         rarity = 1,
 
             -- atlas the joker uses for texture(s).
         atlas = 'Coo29',
     
             -- where on the atlas texture the joker is locarted.
         pos = {
             x = 5,
             y = 0
         },
             -- cost of the joker in the shop.
         cost = 0,
 
             -- whether it is unlocked by default.
         unlocked = true,
 
             -- whether it is discovered by default.
         discovered = true,
 
             -- whether blueprint can copy this joker.
         blueprint_compat = true,
 
             -- whether this joker can have the perishable sticker.
         perishable_compat = true,
 
             -- whether this joker can have the eternal sticker.
         eternal_compat = true,
 
             -- whether duplicates of this joker can appear in the shop by default.
         allow_duplicates = false,
 
             -- loc_vars works with the config and gives you text variables to work with.
             -- these are formatted as #n#, where n is the position in the variable table.
         loc_vars = function(self, info_queue, card)
             return {
                 vars = {
                         -- #1#
                     card.ability.extra.x,
                         -- #2#
                     card.ability.extra.y,
                     }
                 }
         end,
 
         --[[
             -- calculate is where the scoring and effects of the joker are handled. 
         calculate = function(self, card, context)
                 -- context.joker_main takes place when the joker is meant to score.
             if context.joker_main then
                 return {
                         -- adds the number contained in the mult variable to the score.
                 mult_mod = card.ability.extra.mult,
                         -- message is the text that appears when the joker scores.
                         -- localize is used to make sure the text works across multiple languages.
                     message  = localize {
                         type = 'variable',
                         key = 'a_mult',
                         vars = {
                             card.ability.extra.mult
                         }
                     }
                 }
             end
                 -- context.after takes place after the hand is scored.
                 -- context.blueprint applies if the joker is a blueprint copy.
             if context.after and not context.blueprint then
                             -- adds the gain variable to the base mult number.
                         card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
                     return {
                             -- another message, just prints the text.
                         message = "Yippie!",
                         colour = G.C.MULT,
                             -- plays the sound effect yippie.ogg. the prefix is needed.
                         play_sound("Coo29_yippie"),
                             -- needed, can be changed to context.other_card to apply to another card.
                         card = card
                     }
             end
         end


         
     }
]]
--[[     SMODS.Joker { -- test7 --
        key = 'test7',
 
            -- description of the joker.
         loc_txt = {
             name = 'Test 7',
             text = {
                 "{C:attention}Test Joker{}",
             }
         },
 
            -- config of the joker. Variables go here.
         config = {
            extra = {
                 x = 0,
                 y = 0
          }
      },
             -- rarity level, 0 = common, 1 = uncommon, 2 = rare, 3 = legendary.
         rarity = 1,
 
             -- atlas the joker uses for texture(s).
         atlas = 'Coo29',
     
             -- where on the atlas texture the joker is locarted.
         pos = {
             x = 0,
             y = 1
         },
             -- cost of the joker in the shop.
         cost = 0,
 
             -- whether it is unlocked by default.
         unlocked = true,
 
             -- whether it is discovered by default.
         discovered = true,
 
             -- whether blueprint can copy this joker.
         blueprint_compat = true,
 
             -- whether this joker can have the perishable sticker.
         perishable_compat = true,
 
             -- whether this joker can have the eternal sticker.
         eternal_compat = true,
 
             -- whether duplicates of this joker can appear in the shop by default.
         allow_duplicates = false,
 
             -- loc_vars works with the config and gives you text variables to work with.
             -- these are formatted as #n#, where n is the position in the variable table.
         loc_vars = function(self, info_queue, card)
             return {
                 vars = {
                         -- #1#
                     card.ability.extra.x,
                         -- #2#
                     card.ability.extra.y,
                     }
                 }
         end,
 
         --[[
             -- calculate is where the scoring and effects of the joker are handled. 
         calculate = function(self, card, context)
                 -- context.joker_main takes place when the joker is meant to score.
             if context.joker_main then
                 return {
                         -- adds the number contained in the mult variable to the score.
                 mult_mod = card.ability.extra.mult,
                         -- message is the text that appears when the joker scores.
                         -- localize is used to make sure the text works across multiple languages.
                     message  = localize {
                         type = 'variable',
                         key = 'a_mult',
                         vars = {
                             card.ability.extra.mult
                         }
                     }
                 }
             end
                 -- context.after takes place after the hand is scored.
                 -- context.blueprint applies if the joker is a blueprint copy.
             if context.after and not context.blueprint then
                             -- adds the gain variable to the base mult number.
                         card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
                     return {
                             -- another message, just prints the text.
                         message = "Yippie!",
                         colour = G.C.MULT,
                             -- plays the sound effect yippie.ogg. the prefix is needed.
                         play_sound("Coo29_yippie"),
                             -- needed, can be changed to context.other_card to apply to another card.
                         card = card
                     }
             end
         end


         
     }
]]
--[[   SMODS.Joker { -- test8 --
        key = 'test8',
 
            -- description of the joker.
         loc_txt = {
             name = 'Test 8',
             text = {
                 "{C:attention}Test Joker{}",
             }
         },
 
            -- config of the joker. Variables go here.
         config = {
            extra = {
                 x = 0,
                 y = 1
          }
      },
             -- rarity level, 0 = common, 1 = uncommon, 2 = rare, 3 = legendary.
         rarity = 1,
 
             -- atlas the joker uses for texture(s).
         atlas = 'Coo29',
     
             -- where on the atlas texture the joker is locarted.
         pos = {
             x = 1,
             y = 1
         },
             -- cost of the joker in the shop.
         cost = 0,
 
             -- whether it is unlocked by default.
         unlocked = true,
 
             -- whether it is discovered by default.
         discovered = true,
 
             -- whether blueprint can copy this joker.
         blueprint_compat = true,
 
             -- whether this joker can have the perishable sticker.
         perishable_compat = true,
 
             -- whether this joker can have the eternal sticker.
         eternal_compat = true,
 
             -- whether duplicates of this joker can appear in the shop by default.
         allow_duplicates = false,
 
             -- loc_vars works with the config and gives you text variables to work with.
             -- these are formatted as #n#, where n is the position in the variable table.
         loc_vars = function(self, info_queue, card)
             return {
                 vars = {
                         -- #1#
                     card.ability.extra.x,
                         -- #2#
                     card.ability.extra.y,
                     }
                 }
         end,
 
         --[[
             -- calculate is where the scoring and effects of the joker are handled. 
         calculate = function(self, card, context)
                 -- context.joker_main takes place when the joker is meant to score.
             if context.joker_main then
                 return {
                         -- adds the number contained in the mult variable to the score.
                 mult_mod = card.ability.extra.mult,
                         -- message is the text that appears when the joker scores.
                         -- localize is used to make sure the text works across multiple languages.
                     message  = localize {
                         type = 'variable',
                         key = 'a_mult',
                         vars = {
                             card.ability.extra.mult
                         }
                     }
                 }
             end
                 -- context.after takes place after the hand is scored.
                 -- context.blueprint applies if the joker is a blueprint copy.
             if context.after and not context.blueprint then
                             -- adds the gain variable to the base mult number.
                         card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
                     return {
                             -- another message, just prints the text.
                         message = "Yippie!",
                         colour = G.C.MULT,
                             -- plays the sound effect yippie.ogg. the prefix is needed.
                         play_sound("Coo29_yippie"),
                             -- needed, can be changed to context.other_card to apply to another card.
                         card = card
                     }
             end
         end


         
     }
]]
--[[     SMODS.Joker { -- test9 --
        key = 'test9',
 
            -- description of the joker.
         loc_txt = {
             name = 'Test 9',
             text = {
                 "{C:attention}Test Joker{}",
             }
         },
 
            -- config of the joker. Variables go here.
         config = {
            extra = {
                 x = 0,
                 y = 0
          }
      },
             -- rarity level, 0 = common, 1 = uncommon, 2 = rare, 3 = legendary.
         rarity = 1,
 
             -- atlas the joker uses for texture(s).
         atlas = 'Coo29',
     
             -- where on the atlas texture the joker is locarted.
         pos = {
             x = 2,
             y = 1
         },
             -- cost of the joker in the shop.
         cost = 0,
 
             -- whether it is unlocked by default.
         unlocked = true,
 
             -- whether it is discovered by default.
         discovered = true,
 
             -- whether blueprint can copy this joker.
         blueprint_compat = true,
 
             -- whether this joker can have the perishable sticker.
         perishable_compat = true,
 
             -- whether this joker can have the eternal sticker.
         eternal_compat = true,
 
             -- whether duplicates of this joker can appear in the shop by default.
         allow_duplicates = false,
 
             -- loc_vars works with the config and gives you text variables to work with.
             -- these are formatted as #n#, where n is the position in the variable table.
         loc_vars = function(self, info_queue, card)
             return {
                 vars = {
                         -- #1#
                     card.ability.extra.x,
                         -- #2#
                     card.ability.extra.y,
                     }
                 }
         end,
 
         --[[
             -- calculate is where the scoring and effects of the joker are handled. 
         calculate = function(self, card, context)
                 -- context.joker_main takes place when the joker is meant to score.
             if context.joker_main then
                 return {
                         -- adds the number contained in the mult variable to the score.
                 mult_mod = card.ability.extra.mult,
                         -- message is the text that appears when the joker scores.
                         -- localize is used to make sure the text works across multiple languages.
                     message  = localize {
                         type = 'variable',
                         key = 'a_mult',
                         vars = {
                             card.ability.extra.mult
                         }
                     }
                 }
             end
                 -- context.after takes place after the hand is scored.
                 -- context.blueprint applies if the joker is a blueprint copy.
             if context.after and not context.blueprint then
                             -- adds the gain variable to the base mult number.
                         card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
                     return {
                             -- another message, just prints the text.
                         message = "Yippie!",
                         colour = G.C.MULT,
                             -- plays the sound effect yippie.ogg. the prefix is needed.
                         play_sound("Coo29_yippie"),
                             -- needed, can be changed to context.other_card to apply to another card.
                         card = card
                     }
             end
         end

         
     }
]]
--[[     SMODS.Joker { -- test10 --
     key = 'test10',

         -- description of the joker.
      loc_txt = {
          name = 'Test 10',
          text = {
              "{C:attention}Test Joker{}",
          }
      },

         -- config of the joker. Variables go here.
      config = {
         extra = {
              x = 0,
              y = 0
       }
   },
          -- rarity level, 0 = common, 1 = uncommon, 2 = rare, 3 = legendary.
      rarity = 1,

          -- atlas the joker uses for texture(s).
      atlas = 'Coo29',
  
          -- where on the atlas texture the joker is locarted.
      pos = {
          x = 3,
          y = 1
      },
          -- cost of the joker in the shop.
      cost = 0,

          -- whether it is unlocked by default.
      unlocked = true,

          -- whether it is discovered by default.
      discovered = true,

          -- whether blueprint can copy this joker.
      blueprint_compat = true,

          -- whether this joker can have the perishable sticker.
      perishable_compat = true,

          -- whether this joker can have the eternal sticker.
      eternal_compat = true,

          -- whether duplicates of this joker can appear in the shop by default.
      allow_duplicates = false,

          -- loc_vars works with the config and gives you text variables to work with.
          -- these are formatted as #n#, where n is the position in the variable table.
      loc_vars = function(self, info_queue, card)
          return {
              vars = {
                      -- #1#
                  card.ability.extra.x,
                      -- #2#
                  card.ability.extra.y,
                  }
              }
      end,

      --[[
          -- calculate is where the scoring and effects of the joker are handled. 
      calculate = function(self, card, context)
              -- context.joker_main takes place when the joker is meant to score.
          if context.joker_main then
              return {
                      -- adds the number contained in the mult variable to the score.
              mult_mod = card.ability.extra.mult,
                      -- message is the text that appears when the joker scores.
                      -- localize is used to make sure the text works across multiple languages.
                  message  = localize {
                      type = 'variable',
                      key = 'a_mult',
                      vars = {
                          card.ability.extra.mult
                      }
                  }
              }
          end
              -- context.after takes place after the hand is scored.
              -- context.blueprint applies if the joker is a blueprint copy.
          if context.after and not context.blueprint then
                          -- adds the gain variable to the base mult number.
                      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
                  return {
                          -- another message, just prints the text.
                      message = "Yippie!",
                      colour = G.C.MULT,
                          -- plays the sound effect yippie.ogg. the prefix is needed.
                      play_sound("Coo29_yippie"),
                          -- needed, can be changed to context.other_card to apply to another card.
                      card = card
                  }
          end
      end


      
  }
]]
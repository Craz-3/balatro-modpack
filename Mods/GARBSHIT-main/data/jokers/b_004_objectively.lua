return {
 SMODS.Joker {
      key = 'objectively',
      loc_txt = {
        name = 'Objectively Funnier Joker',
        text = {
          "{C:attention}Sell{} this Joker to {C:garb_color_rainbow}randomize{} the deck",
          "{C:garb_color_rainbow}Randomized{} cards may have {C:attention}Enhancements{},",
          "{C:attention}Seals{} or {C:attention}Editions",
          "{C:red}May come back at any time after being sold",
          },
      },
      config = { extra = { Xmult = 1, Xmult_gain = 0.5 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
      end,
      rarity = "garb_rainbow",
      atlas = 'GarbJokers',
      pos = {x = 3, y = 11},
      cost = 10,
      
        unlocked = true, 
        discovered = false, --whether or not it starts discovered
        blueprint_compat = true, --can it be blueprinted/brainstormed/other
        eternal_compat = false, --can it be eternal
        perishable_compat = false, --can it be perishable
  
      calculate = function(self, card, context)
        if context.selling_self then
        G.GAME.objectivelysold = true
        G.E_MANAGER:add_event(Event({
          func = function()
            local cards = {}
            for i = 1, #G.playing_cards do
              G.playing_cards[i]:start_dissolve(nil, true)
            end
            local suits = {"H", "D", "S", "C"}
            local ranks = {"T", "2", "3", "4", "5", "6", "7", "8", "9", "A", "J", "Q", "K"}
            for k, v in pairs(suits) do
              for k2, v2 in pairs(ranks) do
                local index = k2 + #ranks * (k-1)
                local new_enhancement = SMODS.poll_enhancement {
                    key = "abadeus",
                    guaranteed = true
                }
                cards[index] = create_playing_card({
                  front = G.P_CARDS[pseudorandom_element(suits,pseudoseed('jimbo')) .. '_' .. pseudorandom_element(ranks,pseudoseed('with a gun'))],
                  center = (pseudorandom("funnier") < 0.75) and G.P_CENTERS.c_base or G.P_CENTERS[new_enhancement]
                }, G.deck, nil, nil, { G.C.RED })
                if pseudorandom("gun") > 0.9 then
                  cards[index]:set_seal(SMODS.poll_seal({guaranteed = true}), nil, true)
                elseif pseudorandom("gun2") > 0.9 then
                  cards[index]:set_edition(poll_edition("Abadeus", nil, true, true), true, true)
                end
              end
            end
            play_sound('garb_gunshot')  
            play_sound('tarot1')  
            card:start_dissolve()
            return true
          end
        })) 
      end

      end
    },
  
  }
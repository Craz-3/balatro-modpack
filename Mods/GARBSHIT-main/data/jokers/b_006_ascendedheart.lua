return {
 SMODS.Joker {
      key = 'ascendedheart',
      loc_txt = {
        name = 'Ascended Heart',
        text = {
          "If played poker hand is a {C:hearts}Hearts{} {C:attention}Flush,",
          "create a {C:dark_edition,E:1}Legendary{} Joker and change the",
          "{C:attention}suit{} of all {C:hearts}Heart{} cards in the deck",
          "{C:inactive,s:0.7}(Wild Cards are exploded instead)",
          "{C:inactive}(Must have room)"
          },
      },
      config = { extra = { mult = 0, chips = 0, Xmult = 1, hand = 1, discards = 1, money = 0 } },
      loc_vars = function(self, info_queue, card)
        return { vars = {  } }
      end,
      rarity = "garb_rainbow",
      atlas = 'GarbJokers',
      pos = {x = 6, y = 11},
      cost = 10,
      
        unlocked = true, 
        discovered = false, --whether or not it starts discovered
        blueprint_compat = true, --can it be blueprinted/brainstormed/other
        eternal_compat = false, --can it be eternal
        perishable_compat = false, --can it be perishable
  
      calculate = function(self, card, context)
        if context.destroying_card and context.destroying_card.destroyme then return {remove = true} end

        if context.joker_main and context.scoring_name == "Flush" then
          local royal = true
          local suits = {'Spades', 'Clubs', 'Diamonds'}
          local _first_dissolve = false

          for k, v in pairs(G.play.cards) do
            royal = (royal and v:is_suit('Hearts')) or false
          end

          if royal then
            if (#G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit) then
              local Lcard = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "HEART")
              Lcard:add_to_deck()
              Lcard:start_materialize()
              G.jokers:emplace(Lcard)
              play_sound("timpani")

              for k, v in pairs(G.playing_cards) do
                if v:is_suit('Hearts') then v:change_suit(pseudorandom_element(suits)) end
                  if v.config.center == G.P_CENTERS.m_wild then 
                    v.destroyme = true
                    v:explode()
                  end
              end
            else
              return {message = "No Room!"}
            end
          end
        end
      end,
    },
  
  }
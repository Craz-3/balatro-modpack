return {
 SMODS.Joker {
    key = 'softandwet',
    loc_txt = {
      name = 'Soft & Wet',
      text = {
        "{C:attention}Steal{} a random card",
        "from each {C:attention}Booster Pack{}",
        "opened",
        "{C:inactive}(Must have room)"
      }
    },
    config = { extra = { odds = 10 } },
    loc_vars = function(self, info_queue, card)
      return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds }}
    end,
  
    rarity = 3,
    atlas = 'GarbJokers',
    pos = { x = 5, y = 9 },
    cost = 10,

      unlocked = true, 
      discovered = false, --whether or not it starts discovered
      blueprint_compat = false, --can it be blueprinted/brainstormed/other
      eternal_compat = true, --can it be eternal
      perishable_compat = true, --can it be perishable
      
    update = function(self, card)
      -- hacky way to do this, there will be bugs, don't care enough to fix
      if G.pack_cards and G.pack_cards.cards and #G.pack_cards.cards > 0 and not card.booster_opened and card.area and card.area == G.jokers then 
        card.booster_opened = true
        G.E_MANAGER:add_event(Event({
        trigger = 'after',
        func = function()
          c1 = pseudorandom_element(G.pack_cards.cards, pseudoseed('go_beyond'))
          if not c1.stolen then
            if c1.config.center.consumeable and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
              G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
              draw_card(G.pack_cards, G.consumeables, 1, 'up', true, c1, nil, true)
              G.E_MANAGER:add_event(Event({ func = function() play_sound('garb_bubble', 0.94, 0.3) card:juice_up();return true end })) 
              card_eval_status_text(c1, 'extra', nil, nil, nil, {message = "Plundered!"})
              G.GAME.consumeable_buffer = 0
            elseif c1.config.center.set == 'Joker' and #G.jokers.cards < G.jokers.config.card_limit then
             draw_card(G.pack_cards, G.jokers, 1, 'up', true, c1, nil, true)
             G.E_MANAGER:add_event(Event({ func = function() play_sound('garb_bubble', 0.94, 0.3) card:juice_up();return true end })) 
             card_eval_status_text(c1, 'extra', nil, nil, nil, {message = "Plundered!"})
            elseif c1.config.center.set == 'Default' or c1.ability.set == 'Enhanced' then
              draw_card(G.pack_cards, G.deck, 1, 'up', true, c1, nil, true)
              G.E_MANAGER:add_event(Event({ func = function() play_sound('garb_bubble', 0.94, 0.3) card:juice_up();return true end })) 
              card_eval_status_text(c1, 'extra', nil, nil, nil, {message = "Plundered!"})
              G.deck.config.card_limit = G.deck.config.card_limit + 1
              table.insert(G.playing_cards, c1)
            end
            c1.stolen = true
          end
        return true
        end
        }))
        G.GAME.consumeable_buffer = 0
      end
    end,

    calculate = function(self, card, context)
      if context.open_booster then
        card.booster_opened = false
      end
    end
  },

  }
return {
 SMODS.Joker {
    key = 'seat',
    loc_txt = {
      name = 'The Seat',
      text = {
        "Turn all owned {C:attention}consumables{}",
        "{C:dark_edition}Negative{} at end of round",
        "{C:green}#1# in #2#{} chance to {C:red}disappear",
        "after ability activates",
        "{C:inactive,s:0.8,E:1}(Where did this come from?)"
      },
      unlock = {
        "{E:1,s:1.3,C:dark_edition}?????"
      }
    },
    config = { extra = { odds = 10 } },
    loc_vars = function(self, info_queue, card)
      return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds }}
    end,
  
    rarity = 4,
    atlas = 'GarbJokers',
    pos = { x = 2, y = 9 },
    soul_pos = { x = 3, y = 9 },
    cost = 4,

      unlocked = false, 
      discovered = false, --whether or not it starts discovered
      blueprint_compat = false, --can it be blueprinted/brainstormed/other
      eternal_compat = true, --can it be eternal
      perishable_compat = true, --can it be perishable
      
    in_pool = function()
      return false
    end,

    set_ability = function(self, card)
      card:set_edition('e_negative', true, true)
    end,

    calculate = function(self, card, context)
      if context.end_of_round and context.main_eval then
        local first_dissolve = false
        for k,v in pairs(G.consumeables.cards) do
          if (v.edition and not v.edition.negative) or (not v.edition) then
            v:set_edition('e_negative', true, first_dissolve)
            v:juice_up()
            first_dissolve = true
          end
        end
        if first_dissolve then card_eval_status_text(card, "extra", nil, nil, nil, {message = "Negative!", colour = G.C.DARK_EDITION}) end
        if pseudorandom('bruhwheretheseatgo') < G.GAME.probabilities.normal/card.ability.extra.odds then
          G.E_MANAGER:add_event(Event({
            func = function()
              play_sound('tarot1')
              card.T.r = -0.2
              card:juice_up(0.3, 0.4)
              card.states.drag.is = true
              card.children.center.pinch.x = true
              G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                func = function()
                  G.jokers:remove_card(card)
                  card:remove()
                  card = nil
              return true; end})) 
            return true
            end
          })) 
          return {
            message = "What Seat?",
            colour = G.C.DARK_EDITION
          }

        end
      end
    end
  },

  }
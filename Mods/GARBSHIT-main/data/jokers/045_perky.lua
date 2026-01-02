return {
 SMODS.Joker {
    key = 'perky',
    loc_txt = {
      name = 'the perky',
      text = {
        "{C:green}#1# in #2#{} chance to",
        "create a {C:dark_edition}Negative{} copy of",
        "{C:attention}1{} random {C:attention}consumable{}",
        "card in your possession",
        "at the end of the {C:attention}shop",
      }
    },
    config = { extra = { odds = 3 } },
    loc_vars = function(self, info_queue, card)
      return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds }}
    end,
  
    rarity = 2,
    atlas = 'GarbJokers',
    pos = { x = 4, y = 9 },
    cost = 4,

      unlocked = true, 
      discovered = false, --whether or not it starts discovered
      blueprint_compat = false, --can it be blueprinted/brainstormed/other
      eternal_compat = true, --can it be eternal
      perishable_compat = true, --can it be perishable

    calculate = function(self, card, context)
      if G.consumeables.cards[1] and context.ending_shop and pseudorandom('garb_and_perky') < G.GAME.probabilities.normal/card.ability.extra.odds then
        G.E_MANAGER:add_event(Event({
        func = function()
          local card = copy_card(pseudorandom_element(G.consumeables.cards, pseudoseed('perky')), nil)
          card:set_edition('e_negative', true)
          card:add_to_deck()
          G.consumeables:emplace(card)
          return true
        end
        }))
        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, { message = localize('k_duplicated_ex') })
      end
    end
  },

  }
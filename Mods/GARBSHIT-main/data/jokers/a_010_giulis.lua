return {
 SMODS.Joker {
      key = 'giulis',
      loc_txt = {
        name = 'Giulis',
        text = {
        "Played {C:red}debuffed{} cards",
        "give {X:mult,C:white} X#1# {} Mult when",
        "scored"
        },
      unlock = {
        "{E:1,s:1.3}?????"
      }
      },
      config = { extra = { Xmult = 6.66 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
      end,
      rarity = 4,
      atlas = 'GarbJokers',
      pos = { x = 6, y = 9 },
      soul_pos = { x = 0, y = 10 },
      cost = 20,
      
        unlocked = false, 
        discovered = false, --whether or not it starts discovered
        blueprint_compat = true, --can it be blueprinted/brainstormed/other
        eternal_compat = true, --can it be eternal
        perishable_compat = true, --can it be perishable
  
      calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.debuff then
              return {
              Xmult_mod = card.ability.extra.Xmult,
              message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
              message_card = context.other_card,
            }
        end
      end
    },
  
  }
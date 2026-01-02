return {
 SMODS.Joker {
      key = 'teto',
      loc_txt = {
        name = 'Teto!!!!',
        text = {
        "All scored {C:hearts}Kings of Hearts{}",
        "give {X:mult,C:white} X#1# {} Mult",
        "{s:0.8}i fucking love kasane teto{}"
        },
        unlock = {
          "Download and enable the",
          "{E:1,C:attention}Vocaloid Card Set{}",
          "or {E:1,C:attention}Vocalatro{} mods"
        }
      },
      config = { extra = { Xmult = 2 } },
      loc_vars = function(self, info_queue, card)
        if config.on_card_credits and not (config.oldteto or config.repainted) then
          info_queue[#info_queue+1] = {set = "Other", key = "credits2", specific_vars = {"Heaven"}} 
        end

        return { vars = { card.ability.extra.Xmult } }
      end,
      rarity = 3,
      atlas = 'GarbJokers',
      pos = (config.oldteto or config.repainted) and { x = 0, y = 4 } or { x = 3, y = 10 },
      cost = 7,
  
      check_for_unlock = function(self, args)
        if next(SMODS.find_mod("voc_deckall")) or next(SMODS.find_mod("vocalatro")) then
          return true
        end
      end,
    
        unlocked = false, 
        discovered = false, --whether or not it starts discovered
        blueprint_compat = true, --can it be blueprinted/brainstormed/other
        eternal_compat = true, --can it be eternal
        perishable_compat = true, --can it be perishable
  
      calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
          if context.other_card:get_id() == 13 and context.other_card:is_suit("Hearts") then
              return {
              Xmult_mod = card.ability.extra.Xmult,
              message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
              message_card = context.other_card,
            }
          end
        end
      end
    },
  
  }
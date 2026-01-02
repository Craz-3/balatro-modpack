return {
 SMODS.Joker {
      key = 'sacred',
      loc_txt = {
        name = 'Sacred Heart',
        text = {
            "{C:red}X#1#{} Blind Size",
            "{C:chips}+#2#{} Hands",
            "{C:mult}+#3#{} Discard",
            "{C:attention}+#4#{} Hand Size"
          },
      },
      config = { extra = { ante_scaling = 3, hands = 2, discards = 1, h_size = 3 } },
      loc_vars = function(self, info_queue, card)
      if config.on_card_credits and not config.repainted then
        info_queue[#info_queue+1] = {set = "Other", key = "credits", specific_vars = {"MrCr33ps"}}
      end 
        return { vars = { card.ability.extra.ante_scaling, card.ability.extra.hands, card.ability.extra.discards, card.ability.extra.h_size } }
      end,
      rarity = "garb_rainbow",
      atlas = 'GarbJokers',
      pos = {x = 3, y = 12},
      cost = 10,
      
        unlocked = true, 
        discovered = false, --whether or not it starts discovered
        blueprint_compat = true, --can it be blueprinted/brainstormed/other
        eternal_compat = false, --can it be eternal
        perishable_compat = false, --can it be perishable
      
      add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
        ease_discard(card.ability.extra.discards)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        ease_hands_played(card.ability.extra.hands)
        G.hand:change_size(card.ability.extra.h_size)
      end,

      remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
        ease_discard(-card.ability.extra.discards)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        ease_hands_played(-card.ability.extra.hands)
        G.hand:change_size(-card.ability.extra.h_size)
      end,

      calculate = function(self, card, context)
        if context.setting_blind then
          scale_blind(card.ability.extra.ante_scaling-1)
        end
      end
    },
  
  }
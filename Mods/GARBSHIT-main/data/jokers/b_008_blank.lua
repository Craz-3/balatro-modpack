return {
 SMODS.Joker {
      key = 'blank',
      loc_txt = {
        name = 'Blank Joker',
        text = {
            "{C:inactive}Does nothing?"
          },
      },
      config = { extra = {  } },
      loc_vars = function(self, info_queue, card)
        local returntable = {vars = {} }
        local key, vars
        returntable.key =  card.antimattered and (self.key .. "_alt") or self.key
        return returntable
      end,
      rarity = "garb_rainbow",
      atlas = 'GarbJokers',
      pos = {x = 4, y = 11},
      cost = 10,
      
        unlocked = true, 
        discovered = false, --whether or not it starts discovered
        blueprint_compat = true, --can it be blueprinted/brainstormed/other
        eternal_compat = false, --can it be eternal
        perishable_compat = false, --can it be perishable

      update = function(self,card,dt)
        card.antimattered = card.antimattered or (card.area == G.jokers) and (G.GAME.round_resets.ante > 8)
      end,

      calculate = function(self, card, context)
        if context.setting_blind and card.antimattered then
            scale_blind(#G.jokers.cards/10)
        end

        if context.ante_end and G.GAME.round_resets.ante == 8 then
          card:set_edition("e_negative")
          card.ability.old_limit = G.jokers.config.card_limit
          local new_limit = 99
          for k,v in pairs(G.jokers.cards) do
            if v.edition == "e_negative" then
              new_limit = new_limit + 1
            end
          end
          G.jokers.config.card_limit = new_limit
        end
      end,

      remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = card.ability.old_limit or G.jokers.config.card_limit
      end
    },
  
  }
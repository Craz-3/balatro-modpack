return {
 SMODS.Joker {
    key = 'zoroark',
    loc_txt = {
      name = config.repainted and 'amogus' or 'Zoroark',
      text = {
        "When {C:attention}Blind{} is selected,",
        "{C:attention}transforms{} into rightmost {C:attention}Joker",
        "for the duration of the Blind",
      }
    },
    config = { extra = { } },
    loc_vars = function(self, info_queue, card)
       if config.on_card_credits and not config.repainted then
          info_queue[#info_queue+1] = {set = "Other", key = "credits2", specific_vars = {"omegaflowey18"}} 
       end
      return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds }}
    end,
  
    rarity = 3,
    atlas = 'GarbJokers',
    pos = { x = 1, y = 10 },
    cost = 9,

      unlocked = true, 
      discovered = false, --whether or not it starts discovered
      blueprint_compat = false, --can it be blueprinted/brainstormed/other
      eternal_compat = true, --can it be eternal
      perishable_compat = true, --can it be perishable

    calculate = function(self, card, context)      
      if context.setting_blind then 
        local _key = "j_joker"
        _key = G.jokers.cards[#G.jokers.cards].config.center.key
        if _key ~= card.config.center.key then
          card.ability.disguised = "j_garb_zoroark"
          card_transform(card, _key)
          return {message = "Disguised!"}
        end
      end
    end
  },

  }
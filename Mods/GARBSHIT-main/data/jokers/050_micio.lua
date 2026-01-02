return {
 SMODS.Joker {
    key = 'micio',
    loc_txt = {
      name = 'Il Micio',
      text = {
        "{C:green}#1# in #2#{} chance to {C:attention}enhance{} each",
        "card scored into a {C:mult}Mult{} card"
      },
      unlock = {
        "Enable {C:attention}GARBSHIT Repainted",
        "in the mod's settings",
        "{C:inactive,s:0.8}(You'll keep the Joker after you turn it off)"
      },
    },
    -- Extra is empty, because it only happens once. If you wanted to copy multiple cards, you'd need to restructure the code and add a for loop or something.
    config = { extra = {odds = 6} },
    rarity = 2,
    atlas = 'GarbJokers',
    pos = { x = 5, y = 10 },
    
      unlocked = false, 
      discovered = false, --whether or not it starts discovered
      blueprint_compat = true, --can it be blueprinted/brainstormed/other
      eternal_compat = true, --can it be eternal
      perishable_compat = true, --can it be perishable
      cost = 4,
      loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_mult
      return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,
      
      check_for_unlock = function(self,args)
          if args.type == 'micio' then
              unlock_card(self)
          end
      end,

     calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and not context.repetition and pseudorandom('micios') < G.GAME.probabilities.normal/card.ability.extra.odds then
        context.other_card:set_ability(G.P_CENTERS["m_mult"])
        context.other_card:juice_up()
        return {
          message = "Scribbled!"
        }
      end
    end
  },
  
  }
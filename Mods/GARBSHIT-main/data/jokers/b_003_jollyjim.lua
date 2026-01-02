return {
 SMODS.Joker {
      key = 'jollyjim',
      loc_txt = {
        name = 'Jolly Jim',
        text = {
          "Fills all free Joker slots with",
          "{C:red}Jolly Joker{} when a {C:attention}Blind{} is selected",
          "Play a {C:attention}Pair{} to {C:attention}explode{} all {C:red}Jolly Jokers",
          "and gain {X:mult,C:white} X#2# {} per {C:red}Jolly Joker{} {C:attention}exploded",
          "{C:inactive}(Currently {X:mult,C:white} X#1# {}{C:inactive} Mult)"
          },
      },
      config = { extra = { Xmult = 1, Xmult_gain = 0.5 } },
      loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['j_jolly']
        return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
      end,
      rarity = "garb_rainbow",
      atlas = 'GarbJokers',
      pos = {x = 0, y = 11},
      cost = 10,
      
        unlocked = true, 
        discovered = false, --whether or not it starts discovered
        blueprint_compat = true, --can it be blueprinted/brainstormed/other
        eternal_compat = false, --can it be eternal
        perishable_compat = false, --can it be perishable
  
      calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
          for i = 1, G.jokers.config.card_limit do
          G.E_MANAGER:add_event(Event({
            delay = 0.1,
            func = (function()
              if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                  local new_card = SMODS.create_card{key = "j_jolly", no_edition = true}
                  new_card:add_to_deck()
                  G.jokers:emplace(new_card)
              end
              return true
          end)}))
          end
          card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Jolly!"})
        end

        if context.post_joker and not context.blueprint then
          if (context.scoring_name == "Pair") and next(SMODS.find_card('j_jolly')) then
            local jollys = SMODS.find_card("j_jolly")
            for k,v in pairs(jollys) do
              v.getting_sliced = true
              card_eval_status_text(v, 'extra', nil, nil, nil, {message = "Detonated!"})
              G.E_MANAGER:add_event(Event({
              trigger = "after",
              delay = 0.6,
              func = (function()
                  v:juice_up(1)
                  v:explode()
                  card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                return true
            end)}))
            end
          end
        end

        if context.joker_main and card.ability.extra.Xmult > 1 then
          return {
              Xmult_mod = card.ability.extra.Xmult,
              message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
            }
          end
        end
    },
  
  }
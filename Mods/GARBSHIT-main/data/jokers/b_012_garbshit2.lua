return {
    SMODS.Joker {
        key = 'garbshit2',
        loc_txt = {
            name = 'GARBSHIT 2',
            text = {
                "I HAVE {C:attention,s:1.3}ADDED{} TOO MANY {C:red,s:1.3}EXPLOSIONS{}",
                "{s:1.2}HELP ME", "{s:1.3}OH MY GOD", "{s:0.8,C:inactive}(MY INSURANCE ONLY COVERS {s:0.8,C:money}$#1#{} {s:0.8,C:inactive}ON CARD EXPLOSIONS)"
            }
        },
        config = {
            extra = {money = 3}
        },
        loc_vars = function(self, info_queue, card)

            return {
                vars = {
                  card.ability.extra.money
                }
            }
        end,
        rarity = "garb_rainbow",
        atlas = 'GarbJokers',
        pos = {x = 5, y = 12},
        cost = 10,

        unlocked = true,
        discovered = false, -- whether or not it starts discovered
        blueprint_compat = true, -- can it be blueprinted/brainstormed/other
        eternal_compat = false, -- can it be eternal
        perishable_compat = false, -- can it be perishable

        calculate = function(self, card, context)
            if context.individual and (context.cardarea == G.hand) then
                if pseudorandom('help') <= 0.2 then
                    context.other_card:explode()
                    ease_dollars(card.ability.extra.money)
                    return {remove = true}
                end
            end

            if context.other_joker and context.other_joker.config.center.key ~=
                "j_garb_garbshit2" then
                if pseudorandom('help') <= 0.1 then
                    context.other_joker:explode()
                    ease_dollars(card.ability.extra.money)
                end
            end

            if context.starting_shop or context.reroll_shop and
                not context.blueprint then
                for k, v in pairs(G.shop_jokers.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.2,
                        func = function()
                            if pseudorandom('help') <= 0.1 then
                                v:explode()
                                ease_dollars(card.ability.extra.money)
                            end
                            return true
                        end
                    }))
                end
            end

            if G.pack_cards and G.pack_cards.cards and #G.pack_cards.cards > 1 and
                not card.booster_opened and card.area and card.area == G.jokers then
                for k, v in pairs(G.pack_cards.cards) do
                  if not v.exploding and pseudorandom('help') <= 0.1 then
                    v.exploding = true
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.01,
                        func = function()
                              v:explode()
                              ease_dollars(card.ability.extra.money)
                            return true
                        end
                    }))
                  end
                end
            end
        end
    }

}

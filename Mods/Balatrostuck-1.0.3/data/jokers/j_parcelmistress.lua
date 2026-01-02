function Balatrostuck.INIT.Jokers.j_parcelmistress()
    SMODS.Joker{
        name = "Parcel Mistress",
        key = "parcelmistress",
        config = {
            extra = {mult = 7, seal_count = 0}
        },
        loc_txt = {
            ['name'] = 'Parcel Mistress',
            ['text'] = {
                [1] = "{C:mult}+#1#{} mult for each",
                [2] = "card with a seal",
                [3] = "in your full deck",
                [4] = "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
            },
            unlock = {'Unlocked by',
                    'finishing Act 1'}
        },
        loc_vars = function(self,info_queue,card)
            art_credit('akai', info_queue)
            return {vars = {card.ability.extra.mult,card.ability.extra.mult * card.ability.extra.seal_count}}
        end,
        pos = {
            x = 4,
            y = 12
         },
        cost = 3,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        unlocked = false,
        atlas = 'HomestuckJokers',
        in_pool = function(self, args)
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if playing_card.ability and playing_card.ability.seal then
                    return true
                end
            end
        return false
        end,   
        calculate = function(self,card,context)
            card.ability.extra.seal_count = 0
            for _, v in ipairs(G.playing_cards) do
                if v:get_seal(true) then
                    card.ability.extra.seal_count = card.ability.extra.seal_count + 1
                end
            end

            if context.joker_main then
                return {
                    mult = card.ability.extra.seal_count * card.ability.extra.mult,
                    card = card
                }
            end
        end,
        check_for_unlock = function(self,args)
            if args.type == 'bstuck_apple_eaten' then
                unlock_card(self)
            end
        end
    }
end 
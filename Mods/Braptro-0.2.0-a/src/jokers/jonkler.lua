SMODS.Joker {
    key = 'jonkler',
    loc_txt = {
        name = 'Jonkler',
        text = {
            'Scored face cards',
            'without an edition',
            'gain a random edition',
        }
    },

    atlas = 'jokers',
    pos = { x = 3, y = 1 },
    config = { extra = {} },
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.before then
            local faces = {}
            for k, v in ipairs(context.scoring_hand) do
                if v:is_face() and not v.edition then
                    faces[#faces+1] = v
                    v:set_edition(poll_edition('jonkler', 1, true, true))
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    }))
                end
            end
            if #faces > 0 then
--                return {
--                    message = localize('k_gold'),
--                    colour = G.C.MONEY,
--                    card = self
--                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
}

return {
    SMODS.Tag {
        key = 'aquatic',
        loc_txt = {
            name = 'Aquatic Tag',
            text = {
                "Next base edition shop", "Joker is free and",
                "becomes {C:dark_edition}Aquatic"
            }
        },
        atlas = 'GarbTags',
        pos = {x = 4, y = 0},
        apply = function(self, tag, context)
            if context.type == 'store_joker_modify' then
                if not context.card.edition and not context.card.temp_edition and
                    context.card.ability.set == 'Joker' then
                    context.card.temp_edition = true
                    tag:yep('+', G.C.DARK_EDITION, function()
                        context.card:set_edition({garb_fish = true}, true)
                        context.card.ability.couponed = true
                        context.card:set_cost()
                        context.card.temp_edition = nil
                        return true
                    end)
                    tag.triggered = true
                    return true
                end
            end
        end
    }
}

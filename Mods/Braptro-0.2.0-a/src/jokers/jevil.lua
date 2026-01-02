SMODS.Joker {
    key = 'jevil',
    loc_txt = {
        name = 'Jevil',
        text = {
            'First scored card of',
            'each Suit gives either',
            '{X:mult,C:white}X4{} Mult, {C:mult}+30{} Mult,',
            '{C:chips}+100{} chips, or {C:money}$10{}',
        }
    },

    atlas = 'jokers',
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 9, y = 2 },
    soul_pos = { x = 9, y = 3 },
    config = {
        extra = {
            wilds = 0,
            suits = {},
            scoring = {},
            non_scoring = {},
            scored_by = {}
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,

    has_scored = function(self, card, scorer, played)
        return card.ability.extra.scored_by[played] and card.ability.extra.scored_by[played][scorer]
    end,

    set_scored = function(self, card, scorer, played)
        if not card.ability.extra.scored_by[played] then
            card.ability.extra.scored_by[played] = {[scorer] = true}
        else
            card.ability.extra.scored_by[played][scorer] = true
        end
    end,

    calculate = function(self, card, context)
        local function test()
           local rand = pseudorandom('jevil')
            if rand < 1/4 then
                return { card = scorer, chips = 100 }
            elseif rand <= 2/4 then
                return { card = scorer, mult = 30 }
            elseif rand <= 3/4 then
                return { card = scorer, xmult = 4 }
            elseif rand <= 1 then
                return { card = scorer, dollars = 10 }
            end
        end

        local function in_array (elem, arr)
            for i, v in ipairs(arr) do
                if elem == v then return true end
            end
            return false
        end

        local scorer = context.blueprint_card or card

        if context.cardarea == G.jokers and context.before then
            card.ability.extra.wilds = 0
            card.ability.extra.suits = {}
            card.ability.extra.scoring = {}
            card.ability.extra.non_scoring = {}
            card.ability.extra.scored_by = {}
        elseif context.cardarea == G.play and context.individual and not context.repetition then
            if SMODS.has_no_suit(context.other_card) then return end
            if in_array(context.other_card, card.ability.extra.scoring) and not self:has_scored(card, scorer, context.other_card) then
                self:set_scored(card, scorer, context.other_card)
                return test()
            elseif not in_array(context.other_card, card.ability.extra.non_scoring) then
                if card.ability.extra.wilds + #card.ability.extra.suits < 4 then
                    local scores = false
                    if SMODS.has_any_suit(context.other_card) then
                        card.ability.extra.wilds = card.ability.extra.wilds + 1
                        scores = true
                    elseif not in_array(context.other_card.base.suit, card.ability.extra.suits) then
                        table.insert(card.ability.extra.suits, context.other_card.base.suit)
                        scores = true
                    end
                    if scores then
                        table.insert(card.ability.extra.scoring, context.other_card)
                        self:set_scored(card, scorer, context.other_card)
                        return test()
                    end
                end
                table.insert(card.ability.extra.non_scoring, context.other_card)
            end
        elseif context.cardarea == G.jokers and context.after then
            card.ability.extra.wilds = 0
            card.ability.extra.suits = {}
            card.ability.extra.scoring = {}
            card.ability.extra.non_scoring = {}
            card.ability.extra.scored_by = {}
        end
    end,
}

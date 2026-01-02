--- STEAMODDED HEADER
--- MOD_NAME: H1DRO Mod
--- MOD_ID: H1DROmod
--- PREFIX: HMOD
--- MOD_AUTHOR: [H1DRO]
--- MOD_DESCRIPTION: Interesting, or extremely dumb stuff..

----------------------------------------------
------------MOD CODE -------------------------

function translatething(rarity)
    if rarity == 1 then
        return 0.6
    elseif rarity == 2 then
        return 0.94
    elseif rarity == 3 then
        return 1
    end
end

function doothertranslate(rarity)
    if rarity == 4 then return true else return false end
end

SMODS.Atlas {
    key = "atlas",
    path = "atlas.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'jolot',
    loc_txt = {
        name = 'Joker Lottery',
        text = {
            "Destroy joker to",
            "left of this card,",
            "create a random joker",
            "of the same rarity"
        }
    },
    rarity = 3,
    atlas = 'atlas',
    pos = {x = 0, y = 0},
    cost = 4,
    calculate = function(self, card, context)
        local left_card
        if context.joker_main then
            for i = #G.jokers.cards, 1, -1 do
                if G.jokers.cards[i] == card then
                    local left_index = i - 1
                    if left_index > 0 and G.jokers.cards[left_index] then
                       left_card = G.jokers.cards[left_index]
                    end
                end
            end
        end

        if left_card ~= nil then
            left_card:start_dissolve()
            if G.jokers.config.card_limit ~= #G.jokers.cards then
                SMODS.add_card({
                    set = 'Joker',
                    area = G.jokers,
                    rarity = translatething(left_card.config.center.rarity),
                    legendary = doothertranslate(left_card.config.center.rarity)
                })
            end
        end
    end
}

SMODS.Joker {
    key = 'doubledJoker',
    loc_txt = {
        name = 'Doubled Joker',
        text = {
            "Creates an extra copy",
            "of the joker to",
            "left of this card",
            "{C:inactive}(If there's room)",
            "{C:attention}-1{} Joker slots"
        },
        unlock = {
            "Find this Joker",
            "from the Soul card."
        }
    },
    rarity = 4,
    atlas = 'atlas',
    pos = {x = 1, y = 0},
    soul_pos = {x = 2, y = 0},
    cost = 20,
    config = {extra = {slot_removed = false}},
    calculate = function(self, card, context)
        local left_card
        if context.joker_main then
            for i = #G.jokers.cards, 1, -1 do
                if G.jokers.cards[i] == card then
                    local left_index = i - 1
                    if left_index > 0 and G.jokers.cards[left_index] then
                       left_card = G.jokers.cards[left_index]
                    end
                end
            end
        end
        if left_card ~= nil then
            if G.jokers.config.card_limit ~= #G.jokers.cards or left_card.edition.negative then
                if left_card.edition then
                    add_joker(left_card.config.center_key, left_card.edition.type)
                else
                    add_joker(left_card.config.center_key)
                end
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        if not card.ability.extra.slot_removed then
            if not card.ability.extra.slot_removed and G.jokers.config.card_limit > 1 then
                G.jokers.config.card_limit = G.jokers.config.card_limit - 1
                card.ability.extra.slot_removed = true
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.slot_removed then
            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
        end
    end
}

SMODS.Joker {
    key = 'jjj',
    loc_txt = {
        name = "J. J. Joker",
        text = {
            "Retrigger entire hand",
            "if played hand contains",
            "an {C:attention}Ace{} and a {C:attention}10{}"
        }
    },
    rarity = 2,
    atlas = 'atlas',
    pos = {x=3, y=0},
    cost = 7,
    config = { extra = {has_ace = false, has_ten = false, repetitions = 1}},
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            for _, hand_card in ipairs(G.play.cards) do
                if hand_card:get_id() == 14 then
                    card.ability.extra.has_ace = true
                elseif hand_card:get_id() == 10 then
                    card.ability.extra.has_ten = true
                end

                if card.ability.extra.has_ace == true and card.ability.extra.has_ten == true then
                    break
                end
            end

            if card.ability.extra.has_ace == true and card.ability.extra.has_ten == true then
                print("We have an ace and a ten")
                local result = {}

                return {
                    message = 'Again!',
                    repetitions = card.ability.extra.repetitions,
                    card = context.other_card
                }
            end
        end
        if context.after then
            card.ability.extra.has_ten = false
            card.ability.extra.has_ace = false
        end
    end
}
----------------------------------------------
------------MOD CODE END----------------------
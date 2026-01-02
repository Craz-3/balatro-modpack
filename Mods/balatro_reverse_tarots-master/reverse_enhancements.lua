SMODS.Enhancement{
    key = "held_bonus",
    atlas = "New_Enhance",
    pos = {x = 2, y = 0},
    loc_txt={
        name="Held Bonus Card",
        text = {
            "{C:chips}+#1#{} Chips",
                "while this card",
                "stays in hand",
        }
    },
    config = {
        extra = {
            chips = 40
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.chips}}
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.hand then
            return { chips = card.ability.extra.chips}
        end
    end
}

SMODS.Enhancement{
    key = "held_mult",
    atlas = "New_Enhance",
    pos = {x = 1, y = 0},
    loc_txt={
        name="Held Mult Card",
        text = {
            "{C:mult}+#1#{} Mult",
                "while this card",
                "stays in hand",
        }
    },
    config = {
        extra = {
            mult = 6
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.hand then
            return { mult = card.ability.extra.mult}
        end
    end
}

SMODS.Enhancement{
    key = "omnirank",
    atlas = "New_Enhance",
    pos = {x = 3, y = 0},
    loc_txt={
        name="Omnirank Card",
        text = {
            "Can be used",
            "as any rank",
            "for its suit"
        }
    },
    config = {
        extra = {suit = "(suit)"}
    },
    replace_base_card = true,
    set_sprites = function(self, card, front)
        if card.base then
            card.children.center.atlas = G.ASSET_ATLAS['reverse_New_Enhance']
            if card.base.suit == "Hearts" then
                card.children.center:set_sprite_pos({x = 3, y = 0})
            elseif card.base.suit == "Clubs" then
                card.children.center:set_sprite_pos({x = 4, y = 0})
            elseif card.base.suit == "Diamonds" then
                card.children.center:set_sprite_pos({x = 5, y = 0})
            elseif card.base.suit == "Spades" then
                if G.SETTINGS.CUSTOM_DECK.Collabs.Spades == "reverse_ourple" then
                    card.children.center:set_sprite_pos({x = 6, y = 2})
                else
                    card.children.center:set_sprite_pos({x = 6, y = 0})
                end
            end
        end
    end,
    update = function(self, card, dt)
        if card.base then
            card.children.center.atlas = G.ASSET_ATLAS['reverse_New_Enhance']
            if card.base.suit == "Hearts" then
                card.children.center:set_sprite_pos({x = 3, y = 0})
            elseif card.base.suit == "Clubs" then
                card.children.center:set_sprite_pos({x = 4, y = 0})
            elseif card.base.suit == "Diamonds" then
                card.children.center:set_sprite_pos({x = 5, y = 0})
            elseif card.base.suit == "Spades" then
                if G.SETTINGS.CUSTOM_DECK.Collabs.Spades == "reverse_ourple" then
                    card.children.center:set_sprite_pos({x = 6, y = 2})
                else
                    card.children.center:set_sprite_pos({x = 6, y = 0})
                end
            end
        end
    end
}

SMODS.Enhancement{
    key = "crystal",
    atlas = "New_Enhance",
    pos = {x = 1, y = 1},
    loc_txt={
        name="Crystal Card",
        text = {
            "{X:chips,C:white} X#1# {} Chips",
            "{C:green}#2# in #3#{} chance to",
            "destroy card",
        }
    },
    shatters = true,
    config = {
        extra = {
            x_chips = 2,
            shatter_prob = 4
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.x_chips,
                G.GAME.probabilities.normal,
                center.ability.extra.shatter_prob
            }
        }
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_chips = card.ability.extra.x_chips}
        end
        if context.destroy_card == card and context.cardarea == G.play and pseudorandom('crystal') < G.GAME.probabilities.normal/4 and SMODS.has_enhancement(context.destroy_card, 'm_reverse_crystal') then
            return {remove = true}
        end
    end
}

SMODS.Enhancement{
    key = "copper",
    atlas = "New_Enhance",
    pos = {x = 0, y = 1},
    loc_txt={
        name="Copper Card",
        text = {
            "{X:chips,C:white}X#1#{} Chips",
                "while this card",
                "stays in hand",
        }
    },
    config = {
        extra = {
            x_chips = 1.5
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.x_chips}}
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.hand then
            return {x_chips = card.ability.extra.x_chips}
        end
    end
}

SMODS.Enhancement{
    key = "marble",
    atlas = "New_Enhance",
    pos = {x = 0, y = 2},
    loc_txt={
        name="Marble Card",
        text = {
            "{C:mult}+#1#{} Mult",
            "no rank or suit",
        }
    },
    config = {
        extra = {
            mult = 10
        }
    },
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.play then
            return { mult = card.ability.extra.mult}
        end
    end
}

SMODS.Enhancement{
    key = "pyrite",
    atlas = "New_Enhance",
    pos = {x = 2, y = 1},
    loc_txt={
        name="Pyrite Card",
        text = {
            "{C:mult}+#1#{} Mult",
            "when {C:attention}played",
            "{C:money}-$#2#{} if this",
            "card is held in hand",
            "at end of round",
        }
    },
    config = {
        extra = {
            mult = 6,
            p_dollars = 2
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult, center.ability.extra.p_dollars}}
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.play then
            return { mult = card.ability.extra.mult}
        elseif context.playing_card_end_of_round and context.cardarea == G.hand then
            return { dollars = -card.ability.extra.p_dollars}
        end
    end
}

SMODS.Enhancement{
    key = "counterfeit",
    atlas = "New_Enhance",
    pos = {x = 0, y = 0},
    loc_txt={
        name="Counterfeit Card",
        text = {
            "{C:green}#1# in #3#{} chance",
            "to win {C:money}$#2#{}",
            "{C:green}#1# in #5#{} chance",
            "for {C:mult}+#4#{} Mult"
        }
    },
    config = {
        extra = {
            p_dollars = "6",
            money_prob = "5",
            mult = "60",
            mult_prob = "15"
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {
                G.GAME.probabilities.normal,
                center.ability.extra.p_dollars,
                center.ability.extra.money_prob,
                center.ability.extra.mult,
                center.ability.extra.mult_prob
            }
        }
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.play then
            card.counterfeit_trigger = false
            counterfeit_val = pseudorandom('counterfeit_both')
            if counterfeit_val < G.GAME.probabilities.normal * G.GAME.probabilities.normal/75 then
                card.counterfeit_trigger = true
                return{
                    mult = 60,
                    dollars = 6
                }
            elseif counterfeit_val < G.GAME.probabilities.normal/15 then
                card.counterfeit_trigger = true
                return{
                    mult = 60
                }
            elseif counterfeit_val < (G.GAME.probabilities.normal/5 + G.GAME.probabilities.normal/15 - G.GAME.probabilities.normal * G.GAME.probabilities.normal/75) then
                card.counterfeit_trigger = true
                return{
                    dollars = 6
                }
            end
        end
    end
}

SMODS.Enhancement{
    key = "secondary_heart",
    atlas = "New_Enhance",
    pos = {x = 3, y = 1},
    loc_txt={
        name="Secondary Heart",
        text = {
            "This card also counts",
            "as a {C:hearts}Heart"
        }
    }
}

SMODS.Enhancement{
    key = "secondary_club",
    atlas = "New_Enhance",
    pos = {x = 4, y = 1},
    loc_txt={
        name="Secondary Club",
        text = {
            "This card also counts",
            "as a {C:clubs}Club"
        }
    }
}

SMODS.Enhancement{
    key = "secondary_diamond",
    atlas = "New_Enhance",
    pos = {x = 5, y = 1},
    loc_txt={
        name="Secondary Diamond",
        text = {
            "This card also counts",
            "as a {C:diamonds}Diamond"
        }
    }
}

SMODS.Enhancement{
    key = "secondary_spade",
    atlas = "New_Enhance",
    pos = {x = 6, y = 1},
    loc_txt={
        name="Secondary Spade",
        text = {
            "This card also counts",
            "as a {C:spades}Spade"
        }
    },
    set_sprites = function(self, card, front)
        if card.base then
            card.children.center.atlas = G.ASSET_ATLAS['reverse_New_Enhance']
            if G.SETTINGS.CUSTOM_DECK.Collabs.Spades == "reverse_ourple" then
                card.children.center:set_sprite_pos({x = 5, y = 2})
            else
                card.children.center:set_sprite_pos({x = 6, y = 1})
            end
        end
    end,
    update = function(self, card, dt)
        if card.base then
            card.children.center.atlas = G.ASSET_ATLAS['reverse_New_Enhance']
            if G.SETTINGS.CUSTOM_DECK.Collabs.Spades == "reverse_ourple" then
                card.children.center:set_sprite_pos({x = 5, y = 2})
            else
                card.children.center:set_sprite_pos({x = 6, y = 1})
            end
        end
    end
}

SMODS.Enhancement{
    key = "iridium",
    atlas = "New_Enhance",
    pos = {x = 1, y = 2},
    loc_txt={
        name="Iridium Card",
        text = {
            "{X:mult,C:white}X#1#{} Mult, {X:chips,C:white}X#2#{} Chips",
            "no rank or suit",
            "cannot be selected"
        }
    },
    config = {
        extra = {
            mult = 1.5,
            chips = 1.5
        }
    },
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = false,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult, center.ability.extra.chips}}
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.hand then
            return { x_mult = card.ability.extra.mult, x_chips = card.ability.extra.chips}
        end
    end
}
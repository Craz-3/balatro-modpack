--- STEAMODDED HEADER
--- MOD_NAME: Bmconsumables
--- MOD_ID: Bmconsumables
--- MOD_AUTHOR: [BaiMao]
--- MOD_DESCRIPTION: Create more consumables
--- BADGE_COLOUR: D9D919
--- VERSION: 1.0.2c
----------------------------------------------
------------MOD CODE -------------------------

function poll_edition_ref(_key, _mod, _no_neg, _guaranteed)
    _mod = _mod or 1
    local edition_poll = pseudorandom(pseudoseed(_key or 'edition_generic'))
    if _guaranteed then
        if edition_poll > 1 - 0.003*25 and not _no_neg then
            return {negative = true}
        elseif edition_poll > 1 - 0.006*25 then
            return {polychrome = true}
        elseif edition_poll > 1 - 0.02*25 then
            return {holo = true}
        elseif edition_poll > 1 - 0.04*25 then
            return {foil = true}
        end
    else
        if edition_poll > 1 - 0.2*_mod and not _no_neg then
            return {negative = true}
        elseif edition_poll > 1 - 0.4*_mod then
            return {polychrome = true}
        elseif edition_poll > 1 - 0.6*_mod then
            return {holo = true}
        elseif edition_poll > 1 - 0.8*_mod then
            return {foil = true}
        end
    end
    return nil
end

SMODS.Atlas{
    key = 'consumables',
    px = 71,
    py = 95,
    path = 'consumables.png'
}

SMODS.Consumable{
    key = 'comet',
    set = 'Planet',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 3 },
    loc_txt ={
        name = '彗星',
        text = {
            '升级{C:green}随机牌型{}',
            '牌型等级{C:attention}+#1#{}'
        }
    },
    atlas = "consumables",
    config = { extra = {level = 3} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.extra.level} }
    end,
    use = function(self, card, area, copier)
        local chosen_hand = nil
        local comet_list = {}
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].visible then
                comet_list[k] = v
            end
        end
        chosen_hand = pseudorandom_element(comet_list, pseudoseed('com'))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
        level_up_hand(card, chosen_hand, nil, self.config.extra.level)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end,
    calculate = function(self, card, context)
        local chosen_hand = nil
        local comet_list = {}
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].visible then
                comet_list[k] = v
            end
        end
        chosen_hand = pseudorandom_element(comet_list, pseudoseed('com'))
        if G.GAME.used_vouchers.v_observatory and context.scoring_name == chosen_hand then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {G.P_CENTERS.v_observatory.config.extra^3}},
                Xmult_mod = G.P_CENTERS.v_observatory.config.extra^3
            }
        end
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable{
    key = 'meteor',
    set = 'Planet',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = { x = 1, y = 3 },
    loc_txt ={
        name = '流星',
        text = {
            '升级{C:attention}#1#{}种{C:green}随机牌型{}',
            '牌型等级{C:attention}+#2#{}'
        }
    },
    atlas = "consumables",
    config = { extra = {kind = 2 , level = 2} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.extra.kind, self.config.extra.level} }
    end,
    use = function(self, card, area, copier)
        local meteor_list = {}
        local chosen_hands = {}
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].visible then
                meteor_list[#meteor_list + 1] = v
            end
        end
        for i = 1 , self.config.extra.kind do
            local chosen_hand = nil
            repeat
                chosen_hand = pseudorandom_element(meteor_list, pseudoseed('met' .. i))
            until not chosen_hands[chosen_hand]
            chosen_hands[chosen_hand] = true
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
            level_up_hand(card, chosen_hand, nil, self.config.extra.level)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
        end
    end,
    calculate = function(self, card, context)
        local meteor_list = {}
        local chosen_hands = {}
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].visible then
                meteor_list[#meteor_list + 1] = v
            end
        end
        for i = 1 , card.ability.extra.kind do
            local chosen_hand = nil
            repeat
                chosen_hand = pseudorandom_element(meteor_list, pseudoseed('met' .. i))
            until not chosen_hands[chosen_hand]
                chosen_hands[chosen_hand] = true
            if G.GAME.used_vouchers.v_observatory and context.scoring_name == chosen_hand then
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {G.P_CENTERS.v_observatory.config.extra^2}},
                    Xmult_mod = G.P_CENTERS.v_observatory.config.extra^2
                }
            end
        end
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable{
    key = 'satellite',
    set = 'Planet',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = { x = 2, y = 3 },
    loc_txt ={
        name = '卫星',
        text = {
            '升级{C:green}随机五张牌型{}',
            '牌型等级{C:attention}+#1#{}'
        }
    },
    atlas = "consumables",
    config = { extra = {level = 2} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.extra.level} }
    end,
    use = function(self, card, area, copier)
        local chosen_hand = nil
        local satellite_list_visible = {}
        local satellite_list = {
            'Full House',
            'Flush',
            'Straight',
            'Straight Flush',
            'Five of a Kind',
            'Flush House',
            'Flush Five'
        }
        for k, v in ipairs(satellite_list) do
            if G.GAME.hands[v].visible then
                satellite_list_visible[#satellite_list_visible + 1] = v
            end
        end
        chosen_hand = pseudorandom_element(satellite_list_visible, pseudoseed('sat'))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
        level_up_hand(card, chosen_hand, nil, self.config.extra.level)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end,
    calculate = function(self, card, context)
        local chosen_hand = nil
        local satellite_list_visible = {}
        local satellite_list = {
            'Full House',
            'Flush',
            'Straight',
            'Straight Flush',
            'Five of a Kind',
            'Flush House',
            'Flush Five'
        }
        for k, v in ipairs(satellite_list) do
            if G.GAME.hands[v].visible then
                satellite_list_visible[#satellite_list_visible + 1] = v
            end
        end
        chosen_hand = pseudorandom_element(satellite_list_visible, pseudoseed('sat'))
        if G.GAME.used_vouchers.v_observatory and context.scoring_name == chosen_hand then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {G.P_CENTERS.v_observatory.config.extra^2}},
                Xmult_mod = G.P_CENTERS.v_observatory.config.extra^2
            }
        end
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable{
    key = 'moon',
    set = 'Planet',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = { x = 3, y = 3 },
    loc_txt ={
        name = '月球',
        text = {
            '升级{C:green}随机非五张牌型{}',
            '牌型等级{C:attention}+#1#{}'
        }
    },
    atlas = "consumables",
    config = { extra = {level = 2} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.extra.level} }
    end,
    use = function(self, card, area, copier)
        local chosen_hand = nil
        local moon_list = {
            'Pair',
            'Three of a Kind',
            'Four of a Kind',
            'Two Pair',
            'High Card'
        }
        chosen_hand = pseudorandom_element(moon_list, pseudoseed('moo'))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(chosen_hand, 'poker_hands'),chips = G.GAME.hands[chosen_hand].chips, mult = G.GAME.hands[chosen_hand].mult, level=G.GAME.hands[chosen_hand].level})
        level_up_hand(card, chosen_hand, nil, self.config.extra.level)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end,
    calculate = function(self, card, context)
        local chosen_hand = nil
        local moon_list = {
            'Pair',
            'Three of a Kind',
            'Four of a Kind',
            'Two Pair',
            'High Card'
        }
        chosen_hand = pseudorandom_element(moon_list, pseudoseed('moo'))
        if G.GAME.used_vouchers.v_observatory and context.scoring_name == chosen_hand then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {G.P_CENTERS.v_observatory.config.extra^2}},
                Xmult_mod = G.P_CENTERS.v_observatory.config.extra^2
            }
        end
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable{
    key = 'station',
    set = 'Planet',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = { x = 4, y = 3 },
    loc_txt ={
        name = '空间站',
        text = {
            '升级{C:attention}最常用牌型{}',
            '牌型等级{C:attention}+#1#{}',
            '牌型打出次数{C:attention}+#2#{}'
        }
    },
    atlas = "consumables",
    config = { extra = {level = 1, times = 1} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.extra.level, self.config.extra.times} }
    end,
    use = function(self, card, area, copier)
        local most_hand = nil
        local most_hands = {}
        local highest_played = 1
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].played >= highest_played then
                highest_played = G.GAME.hands[v].played
            end
        end
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].played == highest_played then
                most_hands[#most_hands + 1] = v
            end
        end
        if #most_hands ~= 0 then
            most_hand = pseudorandom_element(most_hands, pseudoseed('sta'))
        else
            most_hand = 'High Card'
        end
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(most_hand, 'poker_hands'),chips = G.GAME.hands[most_hand].chips, mult = G.GAME.hands[most_hand].mult, level=G.GAME.hands[most_hand].level})
        level_up_hand(card, most_hand, nil, self.config.extra.level)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
        G.GAME.hands[most_hand].played = G.GAME.hands[most_hand].played + self.config.extra.times
    end,
    calculate = function(self, card, context)
        local most_hand = nil
        local most_hands = {}
        local highest_played = 1
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].played >= highest_played then
                highest_played = G.GAME.hands[v].played
            end
        end
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].played == highest_played then
                most_hands[#most_hands + 1] = v
            end
        end
        if #most_hands ~= 0 then
            most_hand = pseudorandom_element(most_hands, pseudoseed('sta'))
        else
            most_hand = 'High Card'
        end
        if G.GAME.used_vouchers.v_observatory and context.scoring_name == most_hand then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {G.P_CENTERS.v_observatory.config.extra}},
                Xmult_mod = G.P_CENTERS.v_observatory.config.extra
            }
        end
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'universe',
    set = 'Tarot',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 1 },
    loc_txt = {
        name = '宇宙',
        text = {
            '增强{C:attention}#1#{}张',
            '选定卡牌成为',
            '{C:green}随机{}增强卡牌',
            --'并随机改变其花色',
            --'且将其点数随机提高'
        }
    },
    atlas = "consumables",
    config = { extra = {max_highlighted = 3} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.extra.max_highlighted} }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
        return true end }))
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3)
            return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3)
                local highlighted = G.hand.highlighted[i]
--[[
                local ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14'}
                local suits = {'S', 'H', 'C', 'D'}
                local _suits = {}
                local _ranks = {}
                local _suit = nil
                local _rank = nil
                for k, v in ipairs(ranks) do
                    if highlighted.base.id < tonumber(v) then
                        _ranks[#_ranks + 1] = v
                    end
                end
                if #_ranks == 0 then 
                    _rank = 'A'
                elseif #_ranks > 0 then
                    _rank = pseudorandom_element(_ranks, pseudoseed('uni'))
                    if _rank == '10' then _rank = 'T'
                    elseif _rank == '11' then _rank = 'J'
                    elseif _rank == '12' then _rank = 'Q'
                    elseif _rank == '13' then _rank = 'K'
                    elseif _rank == '14' then _rank = 'A' 
                    end
                end
                for k, v in ipairs(suits) do
                    if string.sub(highlighted.base.suit, 1, 1) ~= v then
                        _suits[#_suits + 1] = v
                    end
                end
                if #_suits == 0 then
                    _suit = 'S_'
                elseif #_suits > 0 then
                    _suit = pseudorandom_element(_suits, pseudoseed('uni'))..'_'
                end
]]
                highlighted:set_ability(pseudorandom_element(G.P_CENTER_POOLS['Enhanced'], pseudoseed('uni')))
                --highlighted:set_ability(G.P_CENTERS.m_gold, nil, true)
                --highlighted:set_base(G.P_CARDS[_suit.._rank])
                --highlighted:set_edition({foil = true}, true)
                --highlighted:set_seal('s_bmse_grey', nil, true)
                --if v.base.suit == card.base.suit and v.base.id == card.base.id then
                --if (v.config.center == card.config.center) and ((v.seal and v.seal == card.seal) or not v.seal) then
                --if (v.edition and ((v.edition.foil and card.edition.foil) or (v.edition.holo and card.edition.holo) or (v.edition.polychrome and card.edition.polychrome) or (v.edition.negative and card.edition.negative)) or not v.edition) then
            return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
            G.hand:unhighlight_all()
        return true end }))
        delay(0.5)
    end,
    can_use = function(self, card)
        if self.config.extra.max_highlighted >= #G.hand.highlighted and #G.hand.highlighted >= (self.config.extra.min_highlighted or 1) then
            return true
        end
    end
}

SMODS.Consumable {
    key = 'happy_squirrel',
    set = 'Tarot',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = { x = 2, y = 1 },
    loc_txt = {
        name = '快乐松鼠',
        text = {
            '选定手牌中的{C:attention}#1#{}张牌',
            '摧毁与选中数量相等的牌',
            '并生成{C:attention}#2#{}张其复制牌',
            '有{C:green}#3#/#4#{}几率',
            '生成额外{C:attention}#5#{}张',
            '{C:dark_edition}奇怪{}复制牌'
        }
    },
    atlas = "consumables",
    config = { extra = {max_highlighted = 1, amount_1 = 1, odd = 2, amount_2 = 1} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.extra.max_highlighted, self.config.extra.amount_1, ''..(G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odd, self.config.extra.amount_2} }
    end,
    use = function(self, card, area, copier)
        local destroyed_cards = {}
        local _card = nil
        local glasses = 0
        local temp_hand = {}
        for k, v in ipairs(G.hand.cards) do
            if not v.highlighted then
                temp_hand[#temp_hand+1] = v
            end
        end
        table.sort(temp_hand, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
        pseudoshuffle(temp_hand, pseudoseed('happy_squirrel'))
        for i = 1, #G.hand.highlighted do destroyed_cards[#destroyed_cards+1] = temp_hand[i] end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
            for i=#destroyed_cards, 1, -1 do
                local card = destroyed_cards[i]
                if card.ability.name == 'Glass Card' then 
                    card:shatter()
                else
                    card:start_dissolve(nil, i == #destroyed_cards)
                end
            end
        return true end }))
        delay(0.3)
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
        end
        delay(0.3)
        for t = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({func = function()
                local _first_dissolve = nil
                local new_cards = {}
                for i = 1, self.config.extra.amount_1 do
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local _card = copy_card(G.hand.highlighted[t], nil, nil, G.playing_card)
                    _card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, _card)
                    G.hand:emplace(_card)
                    _card:start_materialize(nil, _first_dissolve)
                    _first_dissolve = true
                    new_cards[#new_cards+1] = _card
                end
                if (pseudorandom('happy_squirrel') < G.GAME.probabilities.normal/self.config.extra.odd) then
                    for i = 1, self.config.extra.amount_2 do
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local _card = copy_card(G.hand.highlighted[t], nil, nil, G.playing_card)
                        local cardeffect = math.random(1, 2)
                        if cardeffect == 1 then
                            _card.ability.perishable = true
                            _card.ability.perish_tally = 0
                            _card:set_debuff(true)
                        elseif cardeffect == 2 then
                            _card:set_edition({negative = true}, true)
                        end
                        _card:add_to_deck()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, _card)
                        G.hand:emplace(_card)
                        _card:start_materialize(nil, _first_dissolve)
                        _first_dissolve = true
                        new_cards[#new_cards+1] = _card
                        _card:flip();play_sound('card1', percent);_card:juice_up(0.3, 0.3)
                    end
                end
                playing_card_joker_effects(new_cards)
            return true end}))
        end 
    end,      
    can_use = function(self, card)
        if self.config.extra.max_highlighted >= #G.hand.highlighted and #G.hand.highlighted >= (self.config.extra.min_highlighted or 1) then
            return true
        end
    end
}

SMODS.Consumable {
    key = 'chance',
    set = 'Spectral',
    cost = 4,
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 4 },
    loc_txt = {
        name = '机遇',
        text = {
            '将最多{C:attention}#1#{}张',
            '选定{C:attention}增强卡牌{}的效果移除',
            '若选定卡牌数低于{C:attention}#2#{}张',
            '获得选定数量{C:attention}#3#{}倍的{C:money}资金{}',
            '反之获得{C:attention}#4#{}张{C:red}复制型{}{C:attention}小丑牌{}',
            '{C:inactive}(必须有空间)'
        }
    },
    atlas = "consumables",
    config = { extra = {max_highlighted = 5, amount = 5, perdollar = 5, numb = 1} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.extra.max_highlighted, self.config.extra.amount, self.config.extra.perdollar, self.config.extra.numb} }
    end,
    use = function(self, card, area, copier)
        local copyjoker_list = {}
        if G.GAME.bmjokers then
            copyjoker_list = {
                "j_blueprint",
                "j_invisible",
                "j_brainstorm",
                "j_bmjo_microchip"
            }
        else
            copyjoker_list = {
            "j_blueprint",
            "j_invisible",
            "j_brainstorm"
            }
        end
        if self.config.extra.amount > #G.hand.highlighted then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
            return true end }))
            for i=1, #G.hand.highlighted do
                local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                    G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3)
                return true end }))
            end
            delay(0.2)
            for i=1, #G.hand.highlighted do
                local highlighted = G.hand.highlighted[i]
                highlighted:set_ability(G.P_CENTERS.c_base, nil, true)
            end
            for i=1, #G.hand.highlighted do
                local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                    G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3)                   
                return true end }))
            end
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
                G.hand:unhighlight_all()
            return true end }))
            ease_dollars(#G.hand.highlighted * self.config.extra.perdollar)
            delay(0.5)
        else
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
            return true end }))
            for i=1, #G.hand.highlighted do
                local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                    G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3)
                return true end }))
            end
            delay(0.2)
            for i=1, #G.hand.highlighted do
                local highlighted = G.hand.highlighted[i]
                highlighted:set_ability(G.P_CENTERS.c_base, nil, true)
            end
            for i=1, #G.hand.highlighted do
                local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                    G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3)
                return true end }))
            end
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
                G.hand:unhighlight_all()
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    local jokers_to_create = math.min(self.config.extra.numb, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            for i = 1, jokers_to_create do
                                local chosen_joker = pseudorandom_element(copyjoker_list, pseudoseed('cha'))
                                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen_joker, nil)
                                local copyedition = poll_edition_ref('chance')
                                card:set_edition(copyedition, true)
                                card:add_to_deck()
                                G.jokers:emplace(card)
                                G.GAME.joker_buffer = 0
                            end                            
                    return true end}))
                end
            return true end }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        local all_highlighted_valid = true
        if self.config.extra.max_highlighted >= #G.hand.highlighted and #G.hand.highlighted >= (self.config.extra.min_highlighted or 1) then
            for i = 1, #G.hand.highlighted do
                if G.hand.highlighted[i] and G.hand.highlighted[i].config.center ~= G.P_CENTERS.c_base then
                else
                    all_highlighted_valid = false
                    break
                end
            end
        else
            all_highlighted_valid = false
        end
        return all_highlighted_valid
    end
}

----------------------------------------------
------------MOD CODE END----------------------
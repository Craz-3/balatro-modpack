--- STEAMODDED HEADER
--- MOD_NAME: Bmblinds
--- MOD_ID: Bmblinds
--- MOD_AUTHOR: [BaiMao]
--- MOD_DESCRIPTION: Create more blinds
--- BADGE_COLOUR: D9D919
--- VERSION: 1.0.3c
----------------------------------------------
------------MOD CODE -------------------------

function Blind:debuff_scoring_card(scoring_hand, from_blind)
    if not self.disabled then
        local obj = self.config.blind
        if obj.debuff_scoring_card and type(obj.debuff_scoring_card) == "function" then
            obj:debuff_scoring_card(scoring_hand, from_blind)
        end
    end
end

local Card_set_edition_ref = Card.set_edition
function Card:set_edition(edition, immediate, silent)
    Card_set_edition_ref(self, edition, immediate, silent)
    if G.GAME.blind then
        G.GAME.blind:debuff_card(self)
    end
end

G.localization.misc.dictionary.b_additional_blind = "奖励盲注"
G.FUNCS.additional_blind_button = function(e)
    if (G.GAME.dollars-G.GAME.bankrupt_at) >= (G.GAME.additional_minus or 50) and G.STATE == G.STATES.BLIND_SELECT then
        e.config.colour = G.C.PURPLE
        e.config.button = 'additional_blind'
        e.children[1].children[1].config.shadow = true
        if e.children[2] then
            e.children[2].children[1].config.shadow = true
        end
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
        e.children[1].children[1].config.shadow = false
        if e.children[2] then
            e.children[2].children[1].config.shadow = false
        end
    end
end

G.FUNCS.additional_blind = function(e)
    G.GAME.additional_minus = G.GAME.additional_minus or 50
    ease_dollars(-G.GAME.additional_minus)
    G.GAME.additional_minus = G.GAME.additional_minus*2
    local additional_blind = {}
    for k, v in pairs(G.P_BLINDS) do
        if v.prize then
            table.insert(additional_blind, k)
        end
    end
    local blind = pseudorandom_element(additional_blind, pseudoseed('additional'))
    additional_selection(blind, G.P_BLINDS[blind].prize)
end

function additional_selection(theBlind, thePrize)
    stop_use()
    if G.blind_select then 
        G.GAME.facing_blind = true
        G.blind_prompt_box:get_UIE_by_ID('prompt_dynatext1').config.object.pop_delay = 0
        G.blind_prompt_box:get_UIE_by_ID('prompt_dynatext1').config.object:pop_out(5)
        G.blind_prompt_box:get_UIE_by_ID('prompt_dynatext2').config.object.pop_delay = 0
        G.blind_prompt_box:get_UIE_by_ID('prompt_dynatext2').config.object:pop_out(5) 

        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.2,func = function()
            G.blind_prompt_box.alignment.offset.y = -10
            G.blind_select.alignment.offset.y = 40
            G.blind_select.alignment.offset.x = 0
        return true end}))
        G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
            ease_round(1)
            inc_career_stat('c_rounds', 1)
            if _DEMO then
                G.SETTINGS.DEMO_ROUNDS = (G.SETTINGS.DEMO_ROUNDS or 0) + 1
                inc_steam_stat('demo_rounds')
                G:save_settings()
            end
            G.GAME.round_resets.blind = G.P_BLINDS[theBlind]
            -- G.GAME.round_resets.blind_states[G.GAME.blind_on_deck] = 'Current'
            G.blind_select:remove()
            G.blind_prompt_box:remove()
            G.blind_select = nil
            delay(0.2)
        return true end}))
        G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
            additional_new_round(theBlind, thePrize)
        return true end}))
    end
end

function additional_new_round(theBlind, thePrize)
    G.RESET_JIGGLES = nil
    delay(0.4)
    G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
        G.GAME.current_round.discards_left = math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards)
        G.GAME.current_round.hands_left = (math.max(1, G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands))
        G.GAME.current_round.hands_played = 0
        G.GAME.current_round.discards_used = 0
        G.GAME.current_round.reroll_cost_increase = 0
        G.GAME.current_round.used_packs = {}

        for k, v in pairs(G.GAME.hands) do 
            v.played_this_round = 0
        end

        for k, v in pairs(G.playing_cards) do
            v.ability.wheel_flipped = nil
        end

        local chaos = find_joker('Chaos the Clown')
        G.GAME.current_round.free_rerolls = #chaos
        calculate_reroll_cost(true)

        G.GAME.round_bonus.next_hands = 0
        G.GAME.round_bonus.discards = 0

        local blhash = 'A'
        G.GAME.subhash = (G.GAME.round_resets.ante)..(blhash)

        G.GAME.blind:set_blind(G.P_BLINDS[theBlind])
        G.GAME.blind.config.prize = thePrize
        G.GAME.last_blind.boss = nil
        G.GAME.blind_on_deck = 'Additional'
        G.HUD_blind.alignment.offset.y = -10
        G.HUD_blind:recalculate(false)
        --bonus_start_effect(thePrize)

        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:calculate_joker({setting_blind = true, blind = G.GAME.round_resets.blind})
        end
        delay(0.4)

        G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
            G.STATE = G.STATES.DRAW_TO_HAND
            G.deck:shuffle('nr'..G.GAME.round_resets.ante)
            G.deck:hard_set_T()
            G.STATE_COMPLETE = false
        return true end}))
    return true end}))
end

function additional_present(thePrize)
    if thePrize then
        local prizeIndex = pseudorandom('prize')
        if prizeIndex > 0.75 then
            for i = 1, thePrize.random do
                add_tag(Tag('tag_negative'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
            end
        elseif prizeIndex > 0.5 then
            for i = 1, thePrize.random do
                add_tag(Tag('tag_double'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
            end
        elseif prizeIndex > 0.25 then
            for i = 1, thePrize.random/2 do
                G.GAME.additional_coupon_voucher = 1
                add_tag(Tag('tag_voucher'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
            end
        else
            for i = 1, thePrize.random/2 do
                add_tag(Tag('tag_d_six'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
            end
        end
    end
end

G.FUNCS.destroy_cards_from_highlighted = function(e, knife)
    stop_use()
    G.CONTROLLER.interrupt.focus = true
    G.CONTROLLER:save_cardarea_focus('hand')

    for k, v in ipairs(G.playing_cards) do
        v.ability.forced_selection = nil
    end

    if G.CONTROLLER.focused.target and G.CONTROLLER.focused.target.area == G.hand then G.card_area_focus_reset = {area = G.hand, rank = G.CONTROLLER.focused.target.rank} end
    local highlighted_count = math.floor(#G.hand.highlighted)
    if highlighted_count > 0 then
        update_hand_text({immediate = true, nopulse = true, delay = 0}, {mult = 0, chips = 0, level = '', handname = ''})
        table.sort(G.hand.highlighted, function(a,b) return a.T.x < b.T.x end)
        local destroyed_cards = {}
        for i=1, highlighted_count do
            destroyed_cards[#destroyed_cards + 1] = G.hand.highlighted[i]
            if G.hand.highlighted[i].ability.name == 'Glass Card' then
                G.hand.highlighted[i]:shatter()
            else
                G.hand.highlighted[i]:start_dissolve()
            end
            if knife then play_sound('slice1', 0.96+math.random()*0.08) end
        end

        if destroyed_cards[1] then
            for j=1, #G.jokers.cards do
                eval_card(G.jokers.cards[j], {cardarea = G.jokers, remove_playing_cards = true, removed = destroyed_cards})
            end
        end
    end
end

SMODS.Atlas {
    key = 'blinds',
    atlas_table = 'ANIMATION_ATLAS',
    path = 'blinds.png',
    px = 34,
    py = 34,
    frames = 21
}

SMODS.Blind {
    key = 'solid',
    loc_txt ={
        name = '固态',
        text = {
            '所有非合数牌都是',
            '以背面朝上的方式抽取'
        }
    },
    dollars = 5,
    mult = 2,
    boss = {min = 1, max = 39},
    boss_colour = HEX('777777'),
    atlas = 'blinds',
    pos = { x = 0, y = 0 },
    discovered = true,
    stay_flipped = function(self, area, card)
        if area == G.hand then
            if card:get_id() ~= 4 and card:get_id() ~= 6 and card:get_id() ~= 8 and card:get_id() ~= 9 and card:get_id() ~= 10 then
                return true
            end
        end
    end,
    disable = function(self)
        for i = 1, #G.hand.cards do
            if G.hand.cards[i].facing == 'back' then
                G.hand.cards[i]:flip()
            end
        end
        for k, v in pairs(G.playing_cards) do
            v.ability.wheel_flipped = nil
        end
    end
}

SMODS.Blind {
    key = 'art',
    loc_txt ={
        name = '艺术',
        text = {
            '所有数字牌',
            '都被削弱'
        }
    },
    dollars = 5,
    mult = 2,
    boss = {min = 2, max = 39},
    boss_colour = HEX('2222BB'),
    atlas = 'blinds',
    pos = { x = 0, y = 2 },
    discovered = true,
    recalc_debuff = function(self, card, from_blind)
        if card.ability.set == 'Default' or card.ability.set == 'Enhanced' then
            if not card:is_face(true) and card:get_id() ~= 14 then
                return true
            end
        end
        return false
    end,
}

SMODS.Blind {
    key = 'knife',
    loc_txt ={
        name = '刀',
        text = {
            '每次出牌',
            '随机摧毁1张手牌'
        }
    },
    dollars = 8,
    mult = 2,
    boss = {min = 2, max = 39},
    boss_colour = HEX('CCCCFF'),
    atlas = 'blinds',
    pos = { x = 0, y = 3 },
    discovered = true,
    press_play = function(self)
        G.E_MANAGER:add_event(Event({ func = function()
            local any_selected = nil
            local _cards = {}
            for k, v in ipairs(G.hand.cards) do
                _cards[#_cards+1] = v
            end
            for i = 1, 1 do
                if G.hand.cards[i] then 
                    local selected_card, card_key = pseudorandom_element(_cards, pseudoseed('knife'))
                    G.hand:add_to_highlighted(selected_card, true)
                    table.remove(_cards, card_key)
                    any_selected = true
                    play_sound('card1', 1)
                end
            end
            if any_selected then G.FUNCS.destroy_cards_from_highlighted(nil, true) end
        return true end}))
        G.GAME.blind.triggered = true
        delay(0.7)
        return true
    end,
}

SMODS.Blind {
    key = 'physical',
    loc_txt ={
        name = '客观',
        text = {
            '不允许出 5 张牌',
        }
    },
    dollars = 5,
    mult = 2,
    boss = {min = 2, max = 39},
    boss_colour = HEX('88DDFF'),
    atlas = 'blinds',
    pos = { x = 0, y = 15 },
    discovered = true,
    debuff_hand = function(self, cards, hand, handname, check)
        if #cards == 5 and not G.GAME.blind.disabled then
            G.GAME.blind.triggered = true
            return true
        end
        return false
    end,
}

SMODS.Blind {
    key = 'float',
    loc_txt ={
        name = '浮空',
        text = {
            '削弱每次出牌的',
            '第一张计分牌'
        }
    },
    dollars = 5,
    mult = 2,
    boss = {min = 1, max = 39},
    boss_colour = HEX('EEBB22'),
    atlas = 'blinds',
    pos = { x = 0, y = 9 },
    discovered = true,
    debuff_scoring_card = function(self, scoring_hand, from_blind)
        if scoring_hand then
            scoring_hand[1]:juice_up()
            scoring_hand[1]:set_debuff(true)
            if scoring_hand[1].debuff then
                scoring_hand[1].debuffed_by_blind = true
            end
        end
    end,
}

SMODS.Blind {
    key = 'gamboge_book',
    loc_txt ={
        name = '藤黄之书',
        text = {
            '所有拥有版本的牌',
            '都被削弱',
            --'每出一张牌',
            --'至少得分增加10%'
        }
    },
    dollars = 8,
    mult = 2,
    boss = {showdown = true, min = 1, max = 39}, 
    boss_colour = HEX('CCCC22'),
    atlas = 'blinds',
    pos = { x = 0, y = 13 },
    discovered = true,
    debuff_card = function(self, card, from_blind)
        for k, v in ipairs(G.jokers.cards) do
            if card.edition and not card.edition.base then
                card:juice_up()
                return true
            end
        end
        for k, v in ipairs(G.playing_cards) do
            if card.edition and not card.edition.base then
                card:juice_up()
                return true
            end
        end
    end,
    disable = function(self)
        for _, v in ipairs(G.jokers.cards) do
            self:debuff_card(v)
        end
        for _, v in ipairs(G.playing_cards) do
            self:debuff_card(v)
        end
    end
--[[
    debuff_hand = function(self, cards, hand, handname, check)
        G.GAME.blind.triggered = false
        if not check then
            G.GAME.blind.triggered = true
            local count = #G.play.cards
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips * (1 + (0.1 * count)))
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.GAME.blind:set_text()
            G.hand_text_area.blind_chips:juice_up()
        end
    end,
]]
}

-----additional blind-----

SMODS.Blind {
    key = 'present',
    name = 'The Present',
    loc_txt ={
        name = '馈赠',
        text = {
            '击败后',
            '获得随机奖励',
        }
    },
    dollars = 1,
    mult = 1,
    prize = {random = 2},
    boss_colour = HEX('4444EE'),
    atlas = 'blinds',
    pos = { x = 0, y = 16 },
    discovered = true,
    disable = function(self)
    end
}

----------------------------------------------
------------MOD CODE END----------------------
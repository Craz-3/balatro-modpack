--- STEAMODDED HEADER
--- MOD_NAME: Bmwallet
--- MOD_ID: Bmwallet
--- MOD_AUTHOR: [BaiMao]
--- MOD_DESCRIPTION: Let you have one wallet and play games more freely
--- BADGE_COLOUR: A64E91
--- VERSION: 1.0.4f-Theta
----------------------------------------------
------------MOD CODE -------------------------

local CardArea_draw_ref = CardArea.draw
function CardArea:draw()
    CardArea_draw_ref(self)
    for k, v in ipairs(self.ARGS.draw_layers) do
        if self.config.type == 'bm_wallet' or self.config.type == 'new_shop' then
            for i = 1, #self.cards do
                if self.cards[i] ~= G.CONTROLLER.focused.target then
                    if not self.cards[i].highlighted then
                        if G.CONTROLLER.dragging.target ~= self.cards[i] then
                            self.cards[i]:draw(v)
                        end
                    end
                end
            end
            for i = 1, #self.cards do
                if self.cards[i] ~= G.CONTROLLER.focused.target then
                    if self.cards[i].highlighted then
                        if G.CONTROLLER.dragging.target ~= self.cards[i] then
                            self.cards[i]:draw(v)
                        end
                   end
               end
            end
        end
    end
end

local CardArea_align_cards_ref = CardArea.align_cards
function CardArea:align_cards()
    if self.config.type == 'bm_wallet' then
        for k, card in ipairs(self.cards) do
            if not card.states.drag.is then 
                card.T.r = 0.1*(-#self.cards/2 - 0.5 + k)/(#self.cards)+ (G.SETTINGS.reduced_motion and 0 or 1)*0.02*math.sin(2*G.TIMERS.REAL+card.T.x)
                local max_cards = math.max(#self.cards, self.config.temp_limit)
                card.T.x = self.T.x + (self.T.w-self.card_w)*((k-1)/math.max(max_cards-1, 1) - 0.5*(#self.cards-max_cards)/math.max(max_cards-1, 1)) + 0.5*(self.card_w - card.T.w)
                if #self.cards > 2 or (#self.cards > 1 and self == G.consumeables) or (#self.cards > 1 and self.config.spread) then
                    card.T.x = self.T.x + (self.T.w-self.card_w)*((k-1)/(#self.cards-1)) + 0.5*(self.card_w - card.T.w)
                elseif #self.cards > 1 and self ~= G.consumeables then
                    card.T.x = self.T.x + (self.T.w-self.card_w)*((k - 0.5)/(#self.cards)) + 0.5*(self.card_w - card.T.w)
                else
                    card.T.x = self.T.x + self.T.w/2 - self.card_w/2 + 0.5*(self.card_w - card.T.w)
                end
                local highlight_height = G.HIGHLIGHT_H/2
                if not card.highlighted then highlight_height = 0 end
                card.T.y = self.T.y + self.T.h/2 - card.T.h/2 - highlight_height+ (G.SETTINGS.reduced_motion and 0 or 1)*0.03*math.sin(0.666*G.TIMERS.REAL+card.T.x)
                card.T.x = card.T.x + card.shadow_parrallax.x/30
            end
        end
        table.sort(self.cards, function (a, b) return a.T.x + a.T.w/2 - 100*((a.pinned and not a.ignore_pinned) and a.sort_id or 0) < b.T.x + b.T.w/2 - 100*((b.pinned and not b.ignore_pinned) and b.sort_id or 0) end)
    end
    if self.config.type == 'new_shop' then
        for k, card in ipairs(self.cards) do
            if not card.states.drag.is then
                card.T.r = 0
                local max_cards = math.max(#self.cards, self.config.temp_limit)
                card.T.x = self.T.x + (self.T.w-self.card_w)*((k-1)/math.max(max_cards-1, 1) - 0.5*(#self.cards-max_cards)/math.max(max_cards-1, 1)) + 0.5*(self.card_w - card.T.w) + (self.config.card_limit == 1 and 0.5*(self.T.w - card.T.w) or 0)
                local highlight_height = G.HIGHLIGHT_H
                if not card.highlighted then highlight_height = 0 end
                card.T.y = self.T.y + self.T.h/2 - card.T.h/2 - highlight_height
                card.T.x = card.T.x + card.shadow_parrallax.x/30
            end
        end
        table.sort(self.cards, function (a, b) return a.T.x + a.T.w/2 < b.T.x + b.T.w/2 end)
    end
    CardArea_align_cards_ref(self)
end

local CardArea_can_highlight_ref = CardArea.can_highlight
function CardArea:can_highlight(card)
    if self.config.type == 'bm_wallet' then
        return true
    end
    if self.config.type == 'new_shop' then
        return true
    end
    return CardArea_can_highlight_ref(self, card)
end

local CardArea_add_to_highlight_ref = CardArea.add_to_highlighted
function CardArea:add_to_highlighted(card, silent)
    if self.config.type == 'bm_wallet' then
        if #self.highlighted >= self.config.highlighted_limit then 
            self:remove_from_highlighted(self.highlighted[1])
        end
        self.highlighted[#self.highlighted+1] = card
        card:highlight(true)
        if not silent then play_sound('cardSlide1') end
    elseif self.config.type == 'new_shop' then
        if self.highlighted[1] then
            self:remove_from_highlighted(self.highlighted[1])
        end
        self.highlighted[#self.highlighted+1] = card
        card:highlight(true)
        if not silent then play_sound('cardSlide1') end
    else
        CardArea_add_to_highlight_ref(self, card, silent)
    end
end

local Card_highlight_ref = Card.highlight
function Card:highlight(is_higlighted)
    self.highlighted = is_higlighted
    local x_off = (self.ability.consumeable and -0.1 or self.ability.as_blind and -0.2 or 0)
    if self.highlighted and self.area and self.area.config.type == 'bm_wallet' and self.ability.set ~= 'Booster' then
        self.children.use_button = UIBox{
            definition = {
                n=G.UIT.ROOT, config = {padding = 0, colour = G.C.CLEAR}, nodes={
                    {n=G.UIT.C, config={padding = 0.15, align = 'cl'}, nodes={
                        {n=G.UIT.R, config={align = 'cl'}, nodes={
                            {n=G.UIT.C, config={align = "cr"}, nodes={
                                {n=G.UIT.C, config={ref_table = self, align = "cr",padding = 0.1, r=0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_sell_card_ref_2'}, nodes={
                                    {n=G.UIT.B, config = {w=0.1,h=0.6}},
                                    {n=G.UIT.C, config={align = "tm"}, nodes={
                                        {n=G.UIT.R, config={align = "cm", maxw = 1.25}, nodes={
                                            {n=G.UIT.T, config={text = localize('b_sell'),colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true}}
                                        }},
                                        {n=G.UIT.R, config={align = "cm"}, nodes={
                                            {n=G.UIT.T, config={text = localize('$'),colour = G.C.WHITE, scale = 0.4, shadow = true}},
                                            {n=G.UIT.T, config={ref_table = self, ref_value = 'sell_cost_label',colour = G.C.WHITE, scale = 0.55, shadow = true}}
                                        }}
                                    }}
                                }},
                            }}
                        }},
                    }},
            }},
            config = {align = "cr", offset = {x=x_off-0.45, y=0}, parent = self}
        }
    elseif self.highlighted and self.area and self.area.config.type == 'bm_wallet' and self.ability.set == 'Booster' then
        create_shop_card_ui(self)
    elseif self.children.use_button then
        self.children.use_button:remove()
        self.children.use_button = nil
    elseif (self.children.price or self.children.buy_button) and self.area and self.area.config.type == 'bm_wallet' then
        if self.children.price then self.children.price:remove() end
        self.children.price = nil
        if self.children.buy_button then self.children.buy_button:remove() end
        self.children.buy_button = nil
    else
        Card_highlight_ref(self, is_higlighted)
    end
end

local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    local ret = G_UIDEF_use_and_sell_buttons_ref(card)
    local mid = ret.nodes[1].config
    if card.ability.consumeable and card.area and (card.area == G.pack_cards) then
        if mid.mid then
            mid.mid = nil
        end
    end
    return ret
end

G.FUNCS.can_sell_card_ref_2 = function(e)
    if e.config.ref_table:can_sell_card_ref_2() then 
        e.config.colour = G.C.GREEN
        e.config.button = 'sell_card'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

function Card:can_sell_card_ref_2(context)
    if (G.play and #G.play.cards > 0) or
        (G.CONTROLLER.locked) or 
        (G.GAME.STOP_USE and G.GAME.STOP_USE > 0)
        then return false end
    if ((G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) and
        self.area and
        (self.area.config.type == 'bm_wallet') and
        not self.ability.eternal and (self.ability.consumeable or self.ability.set == 'Joker' or self.ability.as_blind)) or (G.GAME.sell_license and not self.ability.eternal) then
        return true
    end
    return false
end

local Card_sell_card_ref = Card.sell_card
function Card:sell_card()
    Card_sell_card_ref(self)
    if self.ability.as_blind and G.STATE == G.STATES.BLIND_SELECT then
        G.GAME.ASB = G.GAME.ASB or {}
        if #G.GAME.ASB == 0 then
            G.GAME.ASB[1] = {order = 1, key = G.GAME.round_resets.blind_choices.Boss}
        end
        if self.edition and self.edition.type == 'negative' then
            G.GAME.ASB[#G.GAME.ASB + 1] = {order = #G.GAME.ASB + 1, key = self.ability.as_blind, edition = self.edition.type}
            G.GAME.ASB[1].bottle = true
        else
            G.GAME.ASB[1] = {order = 1, key = self.ability.as_blind, edition = self.edition and self.edition.type or nil}
            G.GAME.ASB[1].bottle = true
        end
        attention_text({text = localize('k_active'), scale = 1, hold = 2, major = self, backdrop_colour = G.P_BLINDS[self.ability.as_blind].boss_colour, align = 'cm', offset = {x=0, y=0}})
        G.E_MANAGER:add_event(Event({func = function()
            G.from_boss_tag = true
            G.FUNCS.reroll_boss()
            G.E_MANAGER:add_event(Event({func = function()
                if G.GAME.ASB[1].bottle then
                    G.GAME.ASB[1].bottle = nil
                end
            return true end}))
        return true end}))
    end
end

local get_new_boss_ref = get_new_boss
function get_new_boss()
    if G.GAME.ASB and G.GAME.ASB[1] and G.GAME.ASB[1].bottle then
        return G.GAME.ASB[1].key
    else
        local ret = get_new_boss_ref()
        if G.GAME.ASB and G.GAME.ASB[1] then
            G.GAME.ASB[1].key = ret
            G.GAME.ASB[1].edition = nil
        end
        return ret
    end
end

local Blind_set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    Blind_set_blind_ref(self, blind, reset, silent)
    if G.GAME.blind.boss and G.GAME.ASB and G.GAME.ASB[1] and G.GAME.ASB[1].edition and not G.GAME.ASB[1].done then
        local mult_bonus = 1
        if G.GAME.ASB[1].edition == 'foil' then
            mult_bonus = mult_bonus*2
        elseif G.GAME.ASB[1].edition == 'holo' then
            mult_bonus = mult_bonus*4
        elseif G.GAME.ASB[1].edition == 'polychrome' then
            mult_bonus = mult_bonus*6
        end
        G.GAME.ASB[1].done = true
        self.chips = self.chips*mult_bonus
        self.chip_text = number_format(self.chips)
        self:set_text()
    end
end

local Game_update_new_round_ref = Game.update_new_round
function Game:update_new_round(dt)
    if self.buttons then self.buttons:remove(); self.buttons = nil end
    if self.shop then self.shop:remove(); self.shop = nil end
    if not G.STATE_COMPLETE then
        G.STATE_COMPLETE = true
        if G.GAME.blind.boss and G.GAME.ASB and G.GAME.ASB[1] then
            if G.GAME.chips - G.GAME.blind.chips >= 0 then
                local next_blind = nil
                for i = 1, #G.GAME.ASB do
                    if not G.GAME.ASB[i].defeated then
                        G.GAME.ASB[i].defeated = true
                        if G.GAME.ASB[i + 1] then
                            next_blind = G.GAME.ASB[i + 1].key
                        end
                        break
                    end
                end
                if next_blind then
                    G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
                        G.GAME.blind:defeat()
                        ease_chips(0)
                        ease_hands_played(1)
                        ease_discard(1)
                        ease_dollars(G.GAME.blind.dollars)
                        G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
                            G.GAME.blind:set_blind(G.P_BLINDS[next_blind])
                            delay(0.4)
                            G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
                                G.STATE_COMPLETE = false
                                G.STATE = G.STATES.DRAW_TO_HAND
                            return true end}))
                        return true end}))
                    return true end}))
                else
                    G.STATE_COMPLETE = false
                    Game_update_new_round_ref(self, dt)
                end
            else
                for i = 1, #G.GAME.ASB do
                    if not G.GAME.ASB[i].defeated then
                        G.GAME.ASB[i].stopped = true
                        break
                    end
                end
                G.STATE_COMPLETE = false
                Game_update_new_round_ref(self, dt)
            end
        else
            G.STATE_COMPLETE = false
            Game_update_new_round_ref(self, dt)
        end
    end
end

local Blind_defeat_ref = Blind.defeat
function Blind:defeat(silent)
    if G.GAME.blind.boss and G.GAME.ASB and G.GAME.ASB[1] then
        for i = #G.GAME.ASB, 1, -1 do
            if G.GAME.ASB[i].stopped then
                break
            elseif G.GAME.ASB[i].defeated and G.GAME.ASB[i].edition then
                if G.GAME.ASB[i].edition == 'foil' then
                    if G.P_BLINDS[G.GAME.ASB[i].key].boss.showdown then
                        ASB_defeat_rewards('foil', true)
                    else
                        ASB_defeat_rewards('foil')
                    end
                elseif G.GAME.ASB[i].edition == 'holo' then
                    if G.P_BLINDS[G.GAME.ASB[i].key].boss.showdown then
                        ASB_defeat_rewards('holo', true)
                    else
                        ASB_defeat_rewards('holo')
                    end
                    
                elseif G.GAME.ASB[i].edition == 'polychrome' then
                    if G.P_BLINDS[G.GAME.ASB[i].key].boss.showdown then
                        ASB_defeat_rewards('polychrome', true)
                    else
                        ASB_defeat_rewards('polychrome')
                    end
                elseif G.GAME.ASB[i].edition == 'negative' then
                    if G.P_BLINDS[G.GAME.ASB[i].key].boss.showdown then
                        ASB_defeat_rewards('negative', true)
                    else
                        ASB_defeat_rewards('negative')
                    end
                end
                break
            end
        end
    end
    if G.GAME.blind.boss and G.GAME.ASB and G.GAME.ASB[1] then
        for i = 1, #G.GAME.ASB do
            if G.GAME.ASB[i].stopped or (i == #G.GAME.ASB and G.GAME.ASB[i].defeated) then
                G.GAME.ASB = {}
                break
            end
        end
    end
    Blind_defeat_ref(self, silent)
end

function ASB_defeat_rewards(type, showdown)
    if G.jokers.highlighted and G.jokers.highlighted[1] then
        local _card = G.jokers.highlighted[1]
        if type == 'foil' then
            if showdown then
                _card.ability.f_chips = _card.ability.f_chips + 75
            else
                _card.ability.f_chips = _card.ability.f_chips + 50
            end
            card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('b_forge_blue'), colour = G.C.BLUE})
        elseif type == 'holo' then
            if showdown then
                _card.ability.f_mult = _card.ability.f_mult + 15
            else
                _card.ability.f_mult = _card.ability.f_mult + 10
            end
            card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('b_forge_red'), colour = G.C.RED})
        elseif type == 'polychrome' then
            if showdown then
                _card.ability.f_x_mult = _card.ability.f_x_mult + (_card.ability.f_x_mult > 1 and 1.5 or 2.5)
            else
                _card.ability.f_x_mult = _card.ability.f_x_mult + (_card.ability.f_x_mult > 1 and 1 or 2)
            end
            card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('b_forge_gold'), colour = G.C.GOLD})
        elseif type == 'negative' then
            local chance = pseudorandom('defeat_rewards')
            if chance > 5/6 then
                ASB_defeat_rewards('polychrome', showdown)
            elseif chance > 1/2 then
                ASB_defeat_rewards('holo', showdown)
            else
                ASB_defeat_rewards('foil', showdown)
            end
        end
    else
        local reward_dollars = math.max(math.floor(pseudorandom('defeat_rewards')*100), 10)
        ease_dollars(reward_dollars)
    end
end

local G_FUNCS_can_open_ref = G.FUNCS.can_open
G.FUNCS.can_open = function(e)
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    elseif G.booster_pack or G.GAME.preach then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        G_FUNCS_can_open_ref(e)
    end
end

G.FUNCS.set_exchange = function(e)
    if G.GAME.exchange == nil then
        G.GAME.exchange = true
        play_sound('cardSlide1')
    elseif G.GAME.exchange == true then
        G.GAME.exchange = nil
        play_sound('cardSlide1')
    end
end

function find_card_in_wallet(key, count_debuffed)
    local results = {}
    if not G.bm_wallet or not G.bm_wallet.cards then return {} end
    for k, v in pairs(G.bm_wallet.cards) do
        if v and type(v) == 'table' and v.config.center.key == key and (count_debuffed or not v.debuff) then
            table.insert(results, v)
        end
    end
    return results
end

function find_blind_in_wallet(key)
    local results = {}
    if not G.bm_wallet or not G.bm_wallet.cards then return {} end
    for k, v in pairs(G.bm_wallet.cards) do
        if v and type(v) == 'table' and v.ability.as_blind and v.ability.as_blind == key then
            table.insert(results, v)
        end
    end
    return results
end

function find_card_in_new_shop(key, count_debuffed)
    local results = {}
    if not G.GAME.load_deposit or not G.GAME.load_deposit.cards then return {} end
    for k, v in pairs(G.GAME.load_deposit.cards) do
        if v and type(v) == 'table' and G.P_CENTERS[v.save_fields.center].key == key and (count_debuffed or not v.debuff) then
            table.insert(results, v)
        end
    end
    return results
end

function find_tag_in_new_shop(key)
    local results = {}
    if not G.GAME.load_deposit or not G.GAME.load_deposit.cards then return {} end
    for k, v in pairs(G.GAME.load_deposit.cards) do
        if v and type(v) == 'table' and v.ability.as_tag and v.ability.as_tag == key then
            table.insert(results, v)
        end
    end
    return results
end

function find_blind_in_new_shop(key)
    local results = {}
    if not G.GAME.load_deposit or not G.GAME.load_deposit.cards then return {} end
    for k, v in pairs(G.GAME.load_deposit.cards) do
        if v and type(v) == 'table' and v.ability.as_blind and v.ability.as_blind == key then
            table.insert(results, v)
        end
    end
    return results
end

local Card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    Card_set_ability_ref(self, center, initial, delay_sprites)
    if not G.OVERLAY_MENU then
        if next(find_card_in_wallet(self.config.center.key, true)) or next(find_card_in_new_shop(self.config.center.key, true)) then
            G.GAME.used_jokers[self.config.center.key] = true
        end
    end
end

local Card_remove_ref = Card.remove
function Card:remove()
    Card_remove_ref(self)
    if not G.OVERLAY_MENU then
        if not next(SMODS.find_card(self.config.center.key, true)) and not next(find_card_in_wallet(self.config.center.key, true)) and not next(find_card_in_new_shop(self.config.center.key, true)) then
            G.GAME.used_jokers[self.config.center.key] = nil
        else
            G.GAME.used_jokers[self.config.center.key] = true
        end
        if self.ability.as_tag and not next(find_tag_in_new_shop(self.ability.as_tag)) then
            G.GAME.used_jokers[self.ability.as_tag] = nil
        end
        if self.ability.as_blind and not next(find_blind_in_wallet(self.ability.as_blind)) and not next(find_blind_in_new_shop(self.ability.as_blind)) then
            G.GAME.used_jokers[self.ability.as_blind] = nil
        end
    end
end

G.FUNCS.can_new_shop = function(e)
    if G.STATE ~= G.STATES.SHOP or G.GAME.new_shop or G.GAME.preach then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.NEBULA_BLUE
        e.config.button = 'new_shop'
    end
end

G.FUNCS.can_return_shop = function(e)
    if not G.GAME.new_shop or not G.bm_Jimbo then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.RUBY_RED
        e.config.button = 'return_shop'
    end
end

G.FUNCS.new_shop = function(e)
    G.GAME.new_shop = true
    G.GAME.load_new_shop = true
end

G.FUNCS.return_shop = function(e)
    stop_use()
    G.GAME.load_deposit = G.new_shop_deposit:save()
    if G.bm_Jimbo then
        G.bm_Jimbo:remove()
        G.bm_Jimbo = nil
    end
    if G.new_shop then
        G.new_shop.alignment.offset.y = G.ROOM.T.y + 29
        G.OLD_SHOP_RETURN.alignment.offset.y = -15
        G.NEW_SHOP_SIGN.alignment.offset.y = -15
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,blocking = false,blockable = false,func = function()
            G.new_shop:remove()
            G.new_shop = nil
            G.OLD_SHOP_RETURN:remove()
            G.OLD_SHOP_RETURN = nil
            G.NEW_SHOP_SIGN:remove()
            G.NEW_SHOP_SIGN = nil
        return true end}))
    end
    if G.shop then
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function()
            if G.shop.alignment.offset.py then
                G.shop.alignment.offset.y = G.shop.alignment.offset.py
                G.shop.alignment.offset.py = nil
            end
            G.NEW_SHOP_ENTER.alignment.offset.y = 0.03
            G.SHOP_SIGN.alignment.offset.y = 0
        return true end}))
    end
    ease_background_colour_blind(G.STATES.SHOP)
    G.GAME.new_shop = false
end

function Game:update_new_shop(dt)
    if self.buttons then
        self.buttons:remove()
        self.buttons = nil
    end
    if G.GAME.load_new_shop then
        stop_use()
        if G.shop and not G.shop.alignment.offset.py then
            G.shop.alignment.offset.py = G.shop.alignment.offset.y
            G.shop.alignment.offset.y = G.ROOM.T.y + 29
        end
        G.NEW_SHOP_ENTER.alignment.offset.y = -15
        G.SHOP_SIGN.alignment.offset.y = -15
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.6,blocking = false,blockable = false,func = function()
            G.new_shop = UIBox{
                definition = G.UIDEF.new_shop(),
                config = {align='tmi', offset={x=0, y=G.ROOM.T.y+11}, major=G.hand, bond='Weak'}
            }
            if G.GAME.load_deposit then
                G.new_shop_deposit:load(G.GAME.load_deposit)
                for k, v in ipairs(G.new_shop_deposit.cards) do
                    create_new_shop_card_ui(v)
                    if v.ability.consumeable then v:start_materialize() end
                end
                G.GAME.load_deposit = nil
            end
            G.new_shop.alignment.offset.y = -1.1
            G.new_shop.alignment.offset.x = 0
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,blockable = false,func = function()
                if math.abs(G.new_shop.T.y - G.new_shop.VT.y) < 3 then
                    G.ROOM.jiggle = G.ROOM.jiggle + 3
                    play_sound('cardFan2')
                end
            return true end}))
        return true end}))
        ease_colour(G.C.DYN_UI.MAIN, mix_colours(G.C.GREEN, G.C.BLACK, 0.9))
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 2.5,blocking = false,func = (function()
            G.bm_Jimbo = Card_Character({x = 5.5, y = 3})
            G.bm_Jimbo:add_speech_bubble('cq_'..math.random(1, 25), nil, {quip = true})
            G.bm_Jimbo:say_stuff(20)
        return true end)}))
        G.GAME.load_new_shop = false
    end
end

function G.UIDEF.new_shop()
    G.new_shop_deposit = CardArea(
        G.hand.T.x+0,
        G.hand.T.y+G.ROOM.T.y + 9,
        4.05*G.CARD_W,
        1.05*G.CARD_H,
        {card_limit = 4, type = 'new_shop', highlight_limit = 1}
    )
    G.OLD_SHOP_RETURN = UIBox{
        definition = {n=G.UIT.ROOT, config={align = "cm", padding = 0.05, colour = G.C.CLEAR}, nodes={
            UIBox_button({label = {localize('b_return_shop')}, minw = 3.7, button = "return_shop", func = 'can_return_shop'})
        }},
        config = {
            align="cm",
            offset = {x=0.03,y=-15},
            major = G.HUD:get_UIE_by_ID('hand_chip_total'),
            bond = 'Weak'
        }
    }
    G.E_MANAGER:add_event(Event({trigger = 'immediate', func = (function()
        G.OLD_SHOP_RETURN.alignment.offset.y = 0.03
    return true end)}))
    local shop_sign = AnimatedSprite(0,0, 4.4, 2.2, G.ANIMATION_ATLAS['shop_sign'])
    shop_sign:define_draw_steps({{shader = 'dissolve', shadow_height = 0.05},{shader = 'dissolve'}})
    G.NEW_SHOP_SIGN = UIBox{
        definition = {n=G.UIT.ROOT, config = {colour = G.C.DYN_UI.MAIN, emboss = 0.05, align = 'cm', r = 0.1, padding = 0.1}, nodes={
            {n=G.UIT.R, config={align = "cm", padding = 0.1, minw = 4.72, minh = 3.1, colour = G.C.DYN_UI.DARK, r = 0.1}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                    {n=G.UIT.O, config={object = shop_sign}}
                }},
                {n=G.UIT.R, config={align = "cm"}, nodes={
                    {n=G.UIT.O, config={object = DynaText({string = {localize('ph_improve_run')}, colours = {lighten(G.C.GOLD, 0.3)}, shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})}},
                }},
            }},
        }},
        config = {
            align = "cm",
            offset = {x=0, y=-15},
            major = G.HUD:get_UIE_by_ID('row_blind'),
            bond = 'Weak'
        }
    }
    G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
        G.NEW_SHOP_SIGN.alignment.offset.y = 0
    return true end}))
    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
        UIBox_dyn_container({
            {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.DYN_UI.BOSS_MAIN}, nodes={
                {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                    {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                        {n=G.UIT.R, config={align = "cm", minw = 2.8, minh = 1.6, r=0.15,colour = HEX("d8bfd8"), button = 'kickback', func = 'can_kickback', hover = true, shadow = true}, nodes={
                            {n=G.UIT.R, config={align = "cm", padding = 0.07, focus_args = {button = 'y', orientation = 'cr'}, func = 'set_button_pip'}, nodes={
                                {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                    {n=G.UIT.T, config={text = localize('b_kickback'), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                                }},
                                {n=G.UIT.R, config={align = "cm", maxw = 1.3, minw = 1}, nodes={
                                    {n=G.UIT.T, config={text = localize('◆'), scale = 0.7, colour = G.C.WHITE, shadow = true}},
                                    {n=G.UIT.T, config={ref_table = G.GAME.current_round, ref_value = 'kickback_total', scale = 0.75, colour = G.C.WHITE, shadow = true}},
                                }}
                            }},
                        }},
                        {n=G.UIT.R, config={align = "cm", minw = 2.8, minh = 1.6, r=0.15,colour = HEX("8fbc8f"), button = 'reroll_new_shop', func = 'can_reroll_new', hover = true, shadow = true}, nodes={
                            {n=G.UIT.R, config={align = "cm", padding = 0.07, focus_args = {button = 'x', orientation = 'cr'}, func = 'set_button_pip'}, nodes={
                                {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                    {n=G.UIT.T, config={text = localize('b_reroll_new'), scale = 0.4, colour = G.C.WHITE, shadow = true}},
                                }},
                                {n=G.UIT.R, config={align = "cm", maxw = 1.3, minw = 1}, nodes={
                                    {n=G.UIT.T, config={text = localize('$'), scale = 0.7, colour = G.C.WHITE, shadow = true}},
                                    {n=G.UIT.T, config={ref_table = G.GAME.current_round, ref_value = 'reroll_new_cost', scale = 0.75, colour = G.C.WHITE, shadow = true}},
                                }}
                            }}
                        }},
                    }},
                    {n=G.UIT.C, config={align = "cm", padding = 0.2, r=0.2, colour = G.C.L_BLACK, emboss = 0.05, minw = 8.2}, nodes={
                        {n=G.UIT.O, config={object = G.new_shop_deposit}},
                    }},
                }},
            }},
        }, false)
    }}
    return t
end

function create_new_shop_card_ui(card, type, area)
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.43, blocking = false, blockable = false, func = (function()
        local t1 = {n=G.UIT.ROOT, config = {minw = 0.6, align = 'tm', colour = darken(G.C.BLACK, 0.2), shadow = true, r = 0.05, padding = 0.05, minh = 1}, nodes={
            {n=G.UIT.R, config={align = "cm", colour = lighten(G.C.BLACK, 0.1), r = 0.1, minw = 1, minh = 0.55, emboss = 0.05, padding = 0.03}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = {{prefix = localize('$'), ref_table = card, ref_value = 'cost'}}, colours = {G.C.MONEY}, shadow = true, silent = true, bump = true, pop_in = 0, scale = 0.5})}},
            }}
        }}
        local t2 = card.ability.supply and {n=G.UIT.ROOT, config = {ref_table = card, minw = 1.1, maxw = 1.3, padding = 0.1, align = 'bm', colour = G.C.ORANGE, shadow = true, r = 0.08, minh = 0.94, func = 'can_buy_new', one_press = true, button = 'buy_from_new_shop', hover = true}, nodes={
            {n=G.UIT.T, config={text = localize('b_supply'), colour = G.C.WHITE, scale = 0.5}}
        }} or {n=G.UIT.ROOT, config = {ref_table = card, minw = 1.1, maxw = 1.3, padding = 0.1, align = 'bm', colour = G.C.GREEN, shadow = true, r = 0.08, minh = 0.94, func = 'can_recover', one_press = true, button = 'recover_from_new_shop', hover = true}, nodes={
            {n=G.UIT.T, config={text = localize('b_recover'), colour = G.C.WHITE, scale = 0.5}}
        }}
        card.children.price = UIBox{
            definition = t1,
            config = {align="tm", offset = {x=0,y=1.5}, major = card, bond = 'Weak', parent = card}
        }
        card.children.buy_button = UIBox{
            definition = t2,
            config = {align="bm", offset = {x=0,y=-0.3}, major = card, bond = 'Weak', parent = card}
        }
        card.children.price.alignment.offset.y = card.ability.set == 'Booster' and 0.5 or 0.38
    return true end)}))
end

local G_FUNCS_hand_text_UI_set_ref = G.FUNCS.hand_text_UI_set
G.FUNCS.hand_text_UI_set = function(e)
    if G.NEW_SHOP_ENTER and (G.GAME.current_round.current_hand.chip_total >= 1 or G.GAME.current_round.current_hand.handname ~= '') and G.NEW_SHOP_ENTER.alignment.offset.y > -15 then
        G.NEW_SHOP_ENTER.alignment.offset.y = -15
        G.GAME.NEW_SHOP_ENTER_replace = true
    elseif G.NEW_SHOP_ENTER and (G.GAME.current_round.current_hand.chip_total < 1 and G.GAME.current_round.current_hand.handname == '') and G.NEW_SHOP_ENTER.alignment.offset.y < 0.03 and G.GAME.NEW_SHOP_ENTER_replace then
        G.NEW_SHOP_ENTER.alignment.offset.y = 0.03
        G.GAME.NEW_SHOP_ENTER_replace = nil
    end
    if G.OLD_SHOP_RETURN and (G.GAME.current_round.current_hand.chip_total >= 1 or G.GAME.current_round.current_hand.handname ~= '') and G.OLD_SHOP_RETURN.alignment.offset.y > -15 then
        G.OLD_SHOP_RETURN.alignment.offset.y = -15
        G.GAME.OLD_SHOP_RETURN_replace = true
    elseif G.OLD_SHOP_RETURN and (G.GAME.current_round.current_hand.chip_total < 1 and G.GAME.current_round.current_hand.handname == '') and G.OLD_SHOP_RETURN.alignment.offset.y < 0.03 and G.GAME.OLD_SHOP_RETURN_replace then
        G.OLD_SHOP_RETURN.alignment.offset.y = 0.03
        G.GAME.OLD_SHOP_RETURN_replace = nil
    end
    G_FUNCS_hand_text_UI_set_ref(e)
end

local G_FUNCS_hand_chip_total_UI_set_ref = G.FUNCS.hand_chip_total_UI_set
G.FUNCS.hand_chip_total_UI_set = function(e)
    if G.NEW_SHOP_ENTER and (G.GAME.current_round.current_hand.chip_total >= 1 or G.GAME.current_round.current_hand.handname ~= '') and G.NEW_SHOP_ENTER.alignment.offset.y > -15 then
        G.NEW_SHOP_ENTER.alignment.offset.y = -15
        G.GAME.NEW_SHOP_ENTER_replace = true
    elseif G.NEW_SHOP_ENTER and (G.GAME.current_round.current_hand.chip_total < 1 and G.GAME.current_round.current_hand.handname == '') and G.NEW_SHOP_ENTER.alignment.offset.y < 0.03 and G.GAME.NEW_SHOP_ENTER_replace then
        G.NEW_SHOP_ENTER.alignment.offset.y = 0.03
        G.GAME.NEW_SHOP_ENTER_replace = nil
    end
    if G.OLD_SHOP_RETURN and (G.GAME.current_round.current_hand.chip_total >= 1 or G.GAME.current_round.current_hand.handname ~= '') and G.OLD_SHOP_RETURN.alignment.offset.y > -15 then
        G.OLD_SHOP_RETURN.alignment.offset.y = -15
        G.GAME.OLD_SHOP_RETURN_replace = true
    elseif G.OLD_SHOP_RETURN and (G.GAME.current_round.current_hand.chip_total < 1 and G.GAME.current_round.current_hand.handname == '') and G.OLD_SHOP_RETURN.alignment.offset.y < 0.03 and G.GAME.OLD_SHOP_RETURN_replace then
        G.OLD_SHOP_RETURN.alignment.offset.y = 0.03
        G.GAME.OLD_SHOP_RETURN_replace = nil
    end
    G_FUNCS_hand_chip_total_UI_set_ref(e)
end

G.FUNCS.can_buy_new_touch = function(_card)
    if _card.ability.supply and _card.area == G.new_shop_deposit and G.GAME.new_shop and G.new_shop then
        if _card.ability.as_tag and (_card.cost > G.GAME.dollars - G.GAME.bankrupt_at) and (_card.cost > 0) then
            return false
        end
        if _card.ability.as_blind and ((_card.cost > G.GAME.dollars - G.GAME.bankrupt_at and _card.cost > 0) or G.bm_wallet.config.card_limit <= #G.bm_wallet.cards) then
            return false
        end
        return true
    end
end

G.FUNCS.can_recover_touch = function(_card)
    if _card.area == G.new_shop_deposit and G.GAME.new_shop and G.new_shop then
        return true
    else
        return false
    end
end

G.FUNCS.can_buy_new = function(e)
    local c1 = e.config.ref_table
    if c1.ability.as_tag and (c1.cost > G.GAME.dollars - G.GAME.bankrupt_at) and (c1.cost > 0) then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    elseif c1.ability.as_blind and ((c1.cost > G.GAME.dollars - G.GAME.bankrupt_at) and (c1.cost > 0) or G.bm_wallet.config.card_limit <= #G.bm_wallet.cards) then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.ORANGE
        e.config.button = 'buy_from_new_shop'
    end
end

G.FUNCS.buy_from_new_shop = function(e)
    local c1 = e.config.ref_table
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        if c1.ability.supply then c1.ability.supply = nil end
        c1.area:remove_card(c1)
        if c1.children.price then c1.children.price:remove() end
        c1.children.price = nil
        if c1.children.buy_button then c1.children.buy_button:remove() end
        c1.children.buy_button = nil
        remove_nils(c1.children)
        if c1.ability.set == 'Voucher' then
            if G.shop_vouchers.config.card_limit <= #G.shop_vouchers.cards then
                G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
            end
            G.shop_vouchers:emplace(c1)
            create_shop_card_ui(c1)
            play_sound('coin1')
        elseif c1.ability.set == 'Booster' then
            G.shop_booster:emplace(c1)
            create_shop_card_ui(c1)
            play_sound('coin1')
        elseif c1.ability.as_tag then
            if pseudorandom('buy_new') < 1/5 then
                G.GAME.current_round.kickback_total = G.GAME.current_round.kickback_total + 1                  
            end
            if c1.cost ~= 0 then
                ease_dollars(-c1.cost)
            end
            local _tag = Tag(c1.ability.as_tag)
            _tag.ability.orbital_hand = c1.ability.orbital
            add_tag(_tag)
            play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
            play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
            c1:remove()
            c1 = nil
        elseif c1.ability.as_blind then
            if pseudorandom('buy_new') < 1/5 then
                G.GAME.current_round.kickback_total = G.GAME.current_round.kickback_total + 1                  
            end
            if c1.cost ~= 0 then
                ease_dollars(-c1.cost)
            end
            G.bm_wallet:emplace(c1)
        end
    return true end}))
end

G.FUNCS.can_recover = function(e)
    e.config.colour = G.C.GREEN
    e.config.button = 'recover_from_new_shop'
end

G.FUNCS.recover_from_new_shop = function(e)
    local c1 = e.config.ref_table
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        c1.area:remove_card(c1)
        if c1.children.price then c1.children.price:remove() end
        c1.children.price = nil
        if c1.children.buy_button then c1.children.buy_button:remove() end
        c1.children.buy_button = nil
        remove_nils(c1.children)
        if c1.ability.set == 'Voucher' then
            if G.shop_vouchers.config.card_limit <= #G.shop_vouchers.cards then
                G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
            end
            if c1.shop_voucher then G.GAME.current_round.voucher.spawn[c1.config.center_key] = true end
            G.shop_vouchers:emplace(c1)
        elseif c1.ability.set == 'Booster' then
            G.shop_booster:emplace(c1)
        else
            G.shop_jokers:emplace(c1)
        end
        create_shop_card_ui(c1)
        play_sound('card1')
    return true end}))
end

G.FUNCS.can_reroll_new = function(e)
    if (G.GAME.dollars - G.GAME.bankrupt_at) - (G.GAME.current_round.reroll_new_cost or 6) < 0 then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = HEX("8fbc8f")
        e.config.button = 'reroll_new_shop'
    end
end

G.FUNCS.reroll_new_shop = function(e)
    stop_use()
    G.CONTROLLER.locks.new_shop_reroll = true
    G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
        G.GAME.current_round.reroll_new_cost = G.GAME.current_round.reroll_new_cost or 6
        ease_dollars(-G.GAME.current_round.reroll_new_cost)
        calculate_reroll_new_cost()
        for i = #G.new_shop_deposit.cards, 1, -1 do
            if G.new_shop_deposit.cards[i].ability.supply then
                local c = G.new_shop_deposit:remove_card(G.new_shop_deposit.cards[i])
                c:remove()
                c = nil
            else
                G.FUNCS.recover_from_new_shop({config = {
                    ref_table = G.new_shop_deposit.cards[i],
                    id = 'recover'
                }})
            end
        end
        play_sound('coin2')
        play_sound('other1')
        for i = 1, 4 do
            local new_shop_card = create_card_for_new_shop(G.new_shop_deposit)
            new_shop_card.ability.supply = true
            G.new_shop_deposit:emplace(new_shop_card)
            new_shop_card:juice_up()
        end
        G.CONTROLLER.locks.new_shop_reroll = false
    return true end}))
end

G.FUNCS.can_kickback = function(e)
    if not G.GAME.current_round.kickback_total or G.GAME.current_round.kickback_total < 1 then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = HEX("d8bfd8")
        e.config.button = 'kickback'
    end
end

G.FUNCS.kickback = function(e)
    stop_use()
    G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
        G.GAME.current_round.kickback_total = G.GAME.current_round.kickback_total - 1
        if G.new_shop_deposit.highlighted[1] and not G.new_shop_deposit.highlighted[1].ability.couponed then
            local kick_target = G.new_shop_deposit.highlighted[1]
            kick_target.ability.couponed = true
            kick_target:set_cost()
            play_sound('coin2')
            kick_target:juice_up(0.3, 0.4)
        else
            add_tag(Tag('tag_double'))
            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
        end
    return true end}))
end

function create_tag_replacement_card(area, forced_key)
    local _initial_pool = G.P_TAGS
    local _pool = {}
    for k, v in pairs(_initial_pool) do
        if (G.GAME.used_jokers[v.key] and not next(find_joker("Showman"))) or G.GAME.banned_keys[v.key] then
        else
            _pool[#_pool + 1] = v.key
        end
    end
    if #_pool == 0 then
        _pool[#_pool + 1] = "tag_handy"
    end
    local _key = pseudorandom_element(_pool, pseudoseed('tag_rep'))
    if forced_key then _key = forced_key end
    G.GAME.used_jokers[_key] = true
    local center = G.P_TAGS[_key]
    local temp_tag = Sprite(area.T.x + area.T.w/2, area.T.y, G.CARD_W, G.CARD_W, G.ASSET_ATLAS[center.atlas or 'tags'], center.pos)
    local card = Card(area.T.x + area.T.w/2, area.T.y, G.CARD_W, G.CARD_W, G.P_CARDS.empty, G.P_CENTERS.c_base)
    card.ability.as_tag = _key
    local _poker_hands = {}
    for k, v in pairs(G.GAME.hands) do
        if v.visible then
            _poker_hands[#_poker_hands+1] = k
        end
    end
    card.ability.orbital = pseudorandom_element(_poker_hands, pseudoseed('orbital'))
    card.children.center = temp_tag
    temp_tag:set_role({major = card, role_type = 'Glued', draw_major = card})
    temp_tag:define_draw_steps({{shader = 'dissolve', shadow_height = 0.05}, {shader = 'dissolve'}})
    temp_tag.float = true
    card.set_sprites = function(...)
        local c = card.children.center
        Card.set_sprites(...)
        card.children.center = c
    end
    card.hover = function()
        if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then 
            if not card.hovering and card.states.visible then
                card.hovering = true
                card.hover_tilt = 3
                card:juice_up(0.05, 0.02)
                play_sound('paper1', math.random()*0.1 + 0.55, 0.42)
                play_sound('tarot2', math.random()*0.1 + 0.55, 0.09)
                local _tag = Tag(card.ability.as_tag)
                _tag.ability.orbital_hand = card.ability.orbital
                _tag:get_uibox_table(temp_tag)
                card.config.h_popup = G.UIDEF.card_h_popup(temp_tag)
                card.config.h_popup_config = card:align_h_popup()
                Node.hover(card)
            end
        end
        card.stop_hover = function()
            card.hovering = false
            Node.stop_hover(card)
            card.hover_tilt = 0
        end
    end
    card.base_cost = 8
    card:set_cost()
    return card
end

function create_blind_replacement_card(area, showdown, forced_key)
    local _initial_pool = G.P_BLINDS
    local _pool = {}
    for k, v in pairs(_initial_pool) do
        if (G.GAME.used_jokers[k] and not next(find_joker("Showman"))) or not v.boss or G.GAME.banned_keys[k] then
        elseif (showdown and G.P_BLINDS[k].boss.showdown) or not showdown then
            _pool[#_pool + 1] = k
        end
    end
    if #_pool == 0 then
        if showdown then
            _pool[#_pool + 1] = "bl_final_acorn"
        else
           _pool[#_pool + 1] = "bl_hook"
        end 
    end
    local _key = pseudorandom_element(_pool, pseudoseed('blind_rep'))
    if forced_key then _key = forced_key end
    G.GAME.used_jokers[_key] = true
    local center = G.P_BLINDS[_key]
    local temp_blind = AnimatedSprite(area.T.x + area.T.w/2, area.T.y, G.CARD_W, G.CARD_W, G.ANIMATION_ATLAS[center.atlas or 'blind_chips'], center.pos)
    local card = Card(area.T.x + area.T.w/2, area.T.y, G.CARD_W, G.CARD_W, G.P_CARDS.empty, G.P_CENTERS.c_base)
    card.ability.as_blind = _key
    card.children.center = temp_blind
    temp_blind:set_role({major = card, role_type = 'Glued', draw_major = card})
    temp_blind:define_draw_steps({{shader = 'dissolve', shadow_height = 0.05}, {shader = 'dissolve'}})
    temp_blind.float = true
    card.set_sprites = function(...)
        local c = card.children.center
        Card.set_sprites(...)
        card.children.center = c
    end
    card.hover = function()
        if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then
            if not card.hovering and card.states.visible then
                card.hovering = true
                card.hover_tilt = 3
                card:juice_up(0.05, 0.02)
                play_sound('chips1', math.random() * 0.1 + 0.55, 1.2)
                card.config.h_popup = create_UIBox_blind_popup(center, true)
                card.config.h_popup_config = card:align_h_popup()
                Node.hover(card)
            end
        end
        card.stop_hover = function()
            card.hovering = false
            Node.stop_hover(card)
            card.hover_tilt = 0
        end
    end
    card.base_cost = center.dollars*2
    card:set_cost()
    return card
end

local Card_load_ref = Card.load
function Card:load(cardTable, other_card)
    Card_load_ref(self, cardTable, other_card)
    if self.ability.as_tag then
        local center = G.P_TAGS[self.ability.as_tag]
        local temp_tag = Sprite(G.new_shop_deposit.T.x + G.new_shop_deposit.T.w/2, G.new_shop_deposit.T.y, G.CARD_W, G.CARD_W, G.ASSET_ATLAS[center.atlas or 'tags'], center.pos)
        self.children.center = temp_tag
        temp_tag:set_role({major = self, role_type = 'Glued', draw_major = self})
        temp_tag:define_draw_steps({{shader = 'dissolve', shadow_height = 0.05}, {shader = 'dissolve'}})
        temp_tag.float = true
        self.set_sprites = function(...)
            local c = self.children.center
            Card.set_sprites(...)
            self.children.center = c
        end
        self.hover = function()
            if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then
                if not self.hovering and self.states.visible then
                    self.hovering = true
                    self.hover_tilt = 3
                    self:juice_up(0.05, 0.02)
                    play_sound('paper1', math.random()*0.1 + 0.55, 0.42)
                    play_sound('tarot2', math.random()*0.1 + 0.55, 0.09)
                    local _tag = Tag(self.ability.as_tag)
                    _tag.ability.orbital_hand = self.ability.orbital
                    _tag:get_uibox_table(temp_tag)
                    self.config.h_popup = G.UIDEF.card_h_popup(temp_tag)
                    self.config.h_popup_config = self:align_h_popup()
                    Node.hover(self)
                end
            end
            self.stop_hover = function()
                self.hovering = false
                Node.stop_hover(self)
                self.hover_tilt = 0
            end
        end
        self.T.h = G.CARD_W
        self.T.w = G.CARD_W
        self.VT.h = self.T.H
        self.VT.w = self.T.w
    end
    if self.ability.as_blind then
        local center = G.P_BLINDS[self.ability.as_blind]
        local temp_blind = AnimatedSprite(G.jokers.T.x + G.jokers.T.w/2, G.jokers.T.y, G.CARD_W, G.CARD_W, G.ANIMATION_ATLAS[center.atlas or 'blind_chips'], center.pos)
        self.children.center = temp_blind
        temp_blind:set_role({major = self, role_type = 'Glued', draw_major = self})
        temp_blind:define_draw_steps({{shader = 'dissolve', shadow_height = 0.05}, {shader = 'dissolve'}})
        temp_blind.float = true
        self.set_sprites = function(...)
            local c = self.children.center
            Card.set_sprites(...)
            self.children.center = c
        end
        self.hover = function()
            if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then
                if not self.hovering and self.states.visible then
                    self.hovering = true
                    self.hover_tilt = 3
                    self:juice_up(0.05, 0.02)
                    play_sound('chips1', math.random() * 0.1 + 0.55, 1.2)
                    self.config.h_popup = create_UIBox_blind_popup(center, true)
                    self.config.h_popup_config = self:align_h_popup()
                    Node.hover(self)
                end
            end
            self.stop_hover = function()
                self.hovering = false
                Node.stop_hover(self)
                self.hover_tilt = 0
            end
        end
        self.T.h = G.CARD_W
        self.T.w = G.CARD_W
        self.VT.h = self.T.H
        self.VT.w = self.T.w
    end
end

function create_card_for_new_shop(area)
    local card_for_new = pseudorandom(pseudoseed('cfn'..G.GAME.round_resets.ante))
    if card_for_new > 0.99 then
        local card = Card(area.T.x + area.T.w/2, area.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[get_next_voucher_key()],{bypass_discovery_center = true, bypass_discovery_ui = true})
        create_new_shop_card_ui(card, 'Voucher', area)
        card:start_materialize()
        return card
    elseif card_for_new > 0.95 then
        local card = Card(area.T.x + area.T.w/2, area.T.y, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[get_pack('new_shop_pack').key], {bypass_discovery_center = true, bypass_discovery_ui = true})
        create_new_shop_card_ui(card, 'Booster', area)
        card:start_materialize()
        return card
    elseif card_for_new > 0.9 then
        local showdown = nil
        if ((G.GAME.round_resets.ante)%G.GAME.win_ante == 0 and G.GAME.round_resets.ante >= 2) then showdown = true end
        local card = create_blind_replacement_card(area, showdown)
        create_new_shop_card_ui(card, 'Blind', area)
        return card
    else
        local card = create_tag_replacement_card(area)
        create_new_shop_card_ui(card, 'Tag', area)
        return card
    end
end

local G_FUNCS_cash_out_ref = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
    G_FUNCS_cash_out_ref(e)
    G.GAME.current_round.used_packs = {}
    G.GAME.recycle_cost = 2
    G.GAME.package_cost = 3
    G.GAME.current_round.reroll_new_cost = 6
    G.GAME.current_round.reroll_new_cost_increase = 0
end

function calculate_reroll_new_cost()
    G.GAME.current_round.reroll_new_cost_increase = G.GAME.current_round.reroll_new_cost_increase or 0
    G.GAME.current_round.reroll_new_cost_increase = G.GAME.current_round.reroll_new_cost_increase + 2
    G.GAME.current_round.reroll_new_cost = 6 + G.GAME.current_round.reroll_new_cost_increase
end

local generate_UIBox_ability_table_ref = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table()
    local generate_UIBox_ability_table_val = generate_UIBox_ability_table_ref(self)
    local main_text = generate_UIBox_ability_table_val.main
    if self.ability.f_chips and self.ability.f_chips > 0 and not self.debuff then
        localize{type = 'descriptions', key = 'f_chips', set = 'Forge', nodes = generate_UIBox_ability_table_val.main, vars = {self.ability.f_chips}}
    end
    if self.ability.f_mult and self.ability.f_mult > 0 and not self.debuff then
        localize{type = 'descriptions', key = 'f_mult', set = 'Forge', nodes = generate_UIBox_ability_table_val.main, vars = {self.ability.f_mult}}
    end
    if self.ability.f_x_mult and self.ability.f_x_mult > 1 and not self.debuff then
        localize{type = 'descriptions', key = 'f_x_mult', set = 'Forge', nodes = generate_UIBox_ability_table_val.main, vars = {self.ability.f_x_mult}}
    end
    if self.ability.f_level and self.ability.f_level > 0 and not self.debuff then
        if self.ability.f_level < 7 then
            localize{type = 'descriptions', key = 'f_low_level', set = 'Forge', nodes = generate_UIBox_ability_table_val.main, vars = {self.ability.f_level}}
        else
            localize{type = 'descriptions', key = 'f_high_level', set = 'Forge', nodes = generate_UIBox_ability_table_val.main, vars = {self.ability.f_level}}
        end
    end
    return generate_UIBox_ability_table_val
end

function Card:get_f_chips()
    if self.debuff then return 0 end
    if self.ability.f_chips == nil then return 0 end
    if self.ability.f_chips and self.ability.f_chips <= 0 then return 0 end
    return self.ability.f_chips
end

function Card:get_f_mult()
    if self.debuff then return 0 end
    if self.ability.f_mult == nil then return 0 end
    if self.ability.f_mult <= 0 then return 0 end
    return self.ability.f_mult
end

function Card:get_f_x_mult()
    if self.debuff then return 0 end
    if self.ability.f_x_mult == nil then return 0 end
    if self.ability.f_x_mult <= 0 then return 0 end
    return self.ability.f_x_mult
end

local CardArea_set_ranks_ref = CardArea.set_ranks
function CardArea:set_ranks()
    CardArea_set_ranks_ref(self)
    for k, card in ipairs(self.cards) do
        card.rank = k
        card.states.collide.can = true
        if self.config.type == 'shop' or self.config.type == 'consumeable' then
            card.states.drag.can = true
        end
    end
end

function Card:get_prev_area(context)
    local prev_area
    if self.ability.set == 'Joker' then
        prev_area = G.jokers
    elseif self.ability.consumeable then
        prev_area = G.consumeables
    elseif self.ability.as_blind then
        prev_area = G.bm_wallet
    elseif (self.ability.set == 'Default' or self.ability.set == 'Enhanced') then
        prev_area = G.hand
    elseif self.ability.set == 'Booster' then
        prev_area = G.shop_booster
    end
    return prev_area
end

function Card:get_printing_cost(context)
    local printing_cost
    if self.ability.as_blind then
        printing_cost = 5
    elseif self.edition == nil then
        printing_cost = 25
    elseif self.edition and self.edition.foil then
        printing_cost = 50
    elseif self.edition and self.edition.holo then
        printing_cost = 100
    elseif self.edition and self.edition.polychrome then
        printing_cost = 200
    end
    return printing_cost
end

function Card:can_mobile_card(context)
    local prev_area = self:get_prev_area()
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        return false
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) then
        if self.area == prev_area or self.area == G.bm_wallet then
            if self.ability.set == 'Joker' then
                return true
            elseif self.ability.consumeable then
                return true
            elseif (self.ability.set == 'Default' or self.ability.set == 'Enhanced') and not self.ability.as_blind then
                if G.hand and G.hand.cards[1] then
                    return true
                end
            elseif self.ability.set == 'Booster' then
                if G.shop then
                    return true
                end
            end
        end
    end
    return false
end

G.FUNCS.can_hide_card_touch = function(_card)
    local prev_area = _card:get_prev_area()
    if _card:can_mobile_card() and _card.area == prev_area then
        if G.bm_wallet.config.card_limit > #G.bm_wallet.cards then
            return true
        end
    else
        return false
    end
end

G.FUNCS.hide_card = function(e)
    local c1 = e.config.ref_table
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        if c1.children.price then c1.children.price:remove() end
        c1.children.price = nil
        if c1.children.buy_button then c1.children.buy_button:remove() end
        c1.children.buy_button = nil
        c1.area:remove_card(c1)
        G.bm_wallet:emplace(c1)
    return true end}))
end

G.FUNCS.can_restore_card_touch = function(_card)
    local prev_area = _card:get_prev_area()
    if _card:can_mobile_card() and _card.area == G.bm_wallet then
        if (prev_area.config.card_limit > #prev_area.cards) or prev_area == G.hand or prev_area == G.shop_booster then
            return true
        end
    else
        return false
    end
end

G.FUNCS.restore_card = function(e)
    local c1 = e.config.ref_table
    local prev_area = c1:get_prev_area()
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        c1.area:remove_card(c1)
        prev_area:emplace(c1)
        if c1.ability.set == 'Joker' then
            G.E_MANAGER:add_event(Event({func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
            return true end}))
        end
        if c1.ability.set == 'Booster' then
            if not (c1.children.price or c1.children.buy_button) then
                create_shop_card_ui(c1)
            end
        end
    return true end}))
end

G.FUNCS.can_recycle_card_touch = function(_card)
    if _card:can_recycle_card() and _card.area == G.bm_wallet and G.STATE == G.STATES.SHOP then
        if not (G.GAME.preach or G.GAME.new_shop) then
            return true
        end
    else
        return false
    end
end

function Card:can_recycle_card(context)
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        return false
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) then
        if G.GAME.dollars - G.GAME.bankrupt_at >= (G.GAME.recycle_cost or 2) then
            return true
        end
    end
    return false
end

G.FUNCS.recycle_card = function(e)
    local c1 = e.config.ref_table
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        G.GAME.recycle_cost = G.GAME.recycle_cost or 2
        ease_dollars(-G.GAME.recycle_cost)
        G.GAME.recycle_cost = G.GAME.recycle_cost + 1
        if c1.area then
            c1:remove_from_deck()
            c1.area:remove_card(c1)
        end
        if c1.ability.couponed then
            c1.ability.couponed = nil
            c1:set_cost()
        end
        G.shop_jokers:emplace(c1)
        create_shop_card_ui(c1)
        c1:juice_up(0.3, 0.5)
        G.E_MANAGER:add_event(Event({func = function()
            local _rarity = c1.config.center.rarity
            local _card = nil
            local para_rarity = 0
            if _rarity == 3 then
                para_rarity = 0.99
            elseif _rarity == 2 then
                para_rarity = 0.75
            end
            local _card = nil
            if _rarity ~= 4 then
                _card = create_card('Joker', G.shop_jokers, nil, para_rarity, nil, nil, nil, 'wallet')
            else
                _card = create_card('Joker', G.shop_jokers, true, nil, nil, nil, nil, 'wallet')
            end
            _card:add_to_deck()
            G.bm_wallet:emplace(_card)
            card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('b_recycle'), colour = G.C.MULT})
        return true end}))
    return true end}))
end

G.FUNCS.can_maintenance_card_touch = function(_card)
    if _card:can_maintenance_card() and _card.area == G.bm_wallet and G.STATE == G.STATES.SHOP then
        if not (G.GAME.preach or G.GAME.new_shop) then
            return true
        end
    else
        return false
    end
end

function Card:can_maintenance_card(context)
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        return false
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) then
        if self.ability.perishable and self.ability.perish_tally < G.GAME.perishable_rounds then
            if G.GAME.dollars - G.GAME.bankrupt_at >= 3*(G.GAME.perishable_rounds - self.ability.perish_tally) then
                return true
            end
        end
    end
    return false
end

G.FUNCS.maintenance_card = function(e)
    local c1 = e.config.ref_table
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        ease_dollars(-3*(G.GAME.perishable_rounds - c1.ability.perish_tally))
        card_eval_status_text(c1, 'extra', nil, nil, nil, {message = localize('b_maintenance_2'), colour = G.C.SECONDARY_SET.Tarot})
        c1.ability.perish_tally = G.GAME.perishable_rounds
        c1:set_debuff(false)
    return true end}))
end

G.FUNCS.can_package_card_touch = function(_card)
    if _card:can_package_card() and _card.area == G.bm_wallet and G.STATE == G.STATES.SHOP then
        if not (G.GAME.preach or G.GAME.new_shop) then
            return true
        end
    else
        return false
    end
end

function Card:can_package_card(context)
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        return false
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) then
        if G.GAME.dollars - G.GAME.bankrupt_at >= (G.GAME.package_cost or 3) then
            return true
        end
    end
    return false
end

G.FUNCS.package_card = function(e)
    local c1 = e.config.ref_table
    local common_arcana_list = {
        'p_arcana_jumbo_1',
        'p_arcana_jumbo_2',
        'p_arcana_mega_1',
        'p_arcana_mega_2',
    }
    local common_celestial_list = {
        'p_celestial_jumbo_1',
        'p_celestial_jumbo_2',
        'p_celestial_mega_1',
        'p_celestial_mega_2',
    }
    local common_spectral_list = {
        'p_spectral_jumbo_1',
        'p_spectral_mega_1',
    }
    local common_buffoon_list = {
        'p_buffoon_jumbo_1',
        'p_buffoon_mega_1',
    }
    local _pack = nil
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        G.GAME.package_cost = G.GAME.package_cost or 3
        ease_dollars(-G.GAME.package_cost)
        G.GAME.used_times_consumeable_type = (G.GAME.used_times_consumeable_type or 0) + 1
        if c1.area then
            c1:remove_from_deck()
            c1.area:remove_card(c1)
        end
        G.shop_booster:emplace(c1)
        local card_type = c1.ability.set
        c1.getting_sliced = true
        c1:start_dissolve({G.C.MONEY}, nil, 1.6)
        if G.GAME.used_times_consumeable_type == 2 then
            G.GAME.used_times_consumeable_type = 0
            G.GAME.package_cost = G.GAME.package_cost + 1
            G.E_MANAGER:add_event(Event({func = function()
                local chosen_pack = 'p_arcana_jumbo_1'
                if card_type == 'Tarot' then
                    chosen_pack = pseudorandom_element(common_arcana_list, pseudoseed('wallet'))
                elseif card_type == 'Planet' then
                    chosen_pack = pseudorandom_element(common_celestial_list, pseudoseed('wallet'))
                elseif card_type == 'Spectral' then
                    chosen_pack = pseudorandom_element(common_spectral_list, pseudoseed('wallet'))
                elseif card_type == 'Joker' then
                    chosen_pack = pseudorandom_element(common_buffoon_list, pseudoseed('wallet'))
                end
                _pack = Card(G.shop_booster.T.x + G.shop_booster.T.w/2, G.shop_booster.T.y, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[chosen_pack], {bypass_discovery_center = true, bypass_discovery_ui = true})
                create_shop_card_ui(_pack, 'Booster', G.shop_booster)
                _pack:start_materialize()
                G.shop_booster:emplace(_pack)
                _pack.ability.couponed = true
                _pack:set_cost()
                card_eval_status_text(_pack, 'extra', nil, nil, nil, {message = localize('b_package_3'), colour = G.C.SECONDARY_SET.Planet})
            return true end}))
        end
    return true end}))
end

G.FUNCS.can_printing_card_touch = function(_card)
    if _card:can_printing_card() and _card.area == G.bm_wallet and G.STATE == G.STATES.SHOP then
        if not (G.GAME.preach or G.GAME.new_shop) then
            return true
        end
    else
        return false
    end
end

function Card:can_printing_card(context)
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        return false
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) then
        if self.ability.set == 'Joker' then
            if self.edition == nil and G.GAME.dollars - G.GAME.bankrupt_at >= 25 then
                return true
            elseif self.edition and self.edition.foil and G.GAME.dollars - G.GAME.bankrupt_at >= 50 then
                return true
            elseif self.edition and self.edition.holo and G.GAME.dollars - G.GAME.bankrupt_at >= 100 then
                return true
            elseif self.edition and self.edition.polychrome and G.GAME.dollars - G.GAME.bankrupt_at >= 200 then
                return true
            end
        end
        if (self.ability.set == 'Default' or self.ability.set == 'Enhanced') then
            if self.ability.as_blind and G.GAME.dollars - G.GAME.bankrupt_at >= 5 then
                if self.edition == nil or (self.edition and self.edition.foil) or (self.edition and self.edition.holo) or (self.edition and self.edition.polychrome) then
                    return true
                end
            elseif self.edition == nil and G.GAME.dollars - G.GAME.bankrupt_at >= 25 then
                return true
            elseif self.edition and self.edition.foil and G.GAME.dollars - G.GAME.bankrupt_at >= 50 then
                return true
            elseif self.edition and self.edition.holo and G.GAME.dollars - G.GAME.bankrupt_at >= 100 then
                return true
            end
        end
    end
    return false
end

G.FUNCS.printing_card = function(e)
    local c1 = e.config.ref_table
    local printing_cost = 0
    if c1.ability.as_blind then
        printing_cost = 5
    elseif c1.edition == nil then
        printing_cost = 25
    elseif c1.edition and c1.edition.foil then
        printing_cost = 50
    elseif c1.edition and c1.edition.holo then
        printing_cost = 100
    elseif c1.edition and c1.edition.polychrome then
        printing_cost = 200
    end
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        ease_dollars(-printing_cost)
        if c1.ability.as_blind and c1.edition == nil then
            c1:set_edition({foil = true}, true)
        elseif c1.ability.as_blind and c1.edition and c1.edition.foil then
            c1:set_edition({holo = true}, true)
        elseif c1.ability.as_blind and c1.edition and c1.edition.holo then
            c1:set_edition({polychrome = true}, true)
        elseif c1.ability.as_blind and c1.edition and c1.edition.polychrome then
            c1:set_edition({negative = true}, true)
        elseif printing_cost == 25 then
            c1:set_edition({foil = true}, true)
        elseif printing_cost == 50 then
            c1:set_edition({holo = true}, true)
        elseif printing_cost == 100 then
            c1:set_edition({polychrome = true}, true)
        elseif printing_cost == 200 then
            c1:set_edition({negative = true}, true)
        end
        card_eval_status_text(c1, 'extra', nil, nil, nil, {message = localize('b_printing_2'), colour = G.C.SECONDARY_SET.Spectral})
    return true end}))
end

G.FUNCS.can_forge_card_touch = function(_card)
    if _card:can_forge_card() and _card.area == G.bm_wallet and G.STATE == G.STATES.SHOP then
        if not (G.GAME.preach or G.GAME.new_shop) then
            return true
        end
    else
        return false
    end
end

G.FUNCS.can_preach_room_touch = function(_card)
    if _card.area == G.bm_wallet and G.GAME.preach then
        return true
    else
        return false
    end
end

G.FUNCS.can_preach_card1_touch = function(_card)
    if _card:can_preach_card1() and _card.area == G.bm_wallet and G.GAME.preach then
        return true
    else
        return false
    end
end

G.FUNCS.can_preach_card2_touch = function(_card)
    if _card:can_preach_card2() and _card.area == G.bm_wallet and G.GAME.preach then
        return true
    else
        return false
    end
end

G.FUNCS.can_preach_card3_touch = function(_card)
    if _card:can_preach_card3() and _card.area == G.bm_wallet and G.GAME.preach then
        return true
    else
        return false
    end
end

function Card:can_forge_card(context)
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        return false
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) then
        if self.ability.set == 'Joker' then
            if G.GAME.dollars - G.GAME.bankrupt_at >= 400 then
                return true
            end
        end
        if (self.ability.set == 'Default' or self.ability.set == 'Enhanced') and not self.ability.as_blind then
            if G.GAME.dollars - G.GAME.bankrupt_at >= (10 + (self.ability.f_level or 0)*3) then
                return true
            end
        end
    end
    return false
end

function Card:can_preach_card1(context)
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        return false
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) then
        if G.GAME.dollars - G.GAME.bankrupt_at >= 400 then
            return true
        end
    end
    return false
end

function Card:can_preach_card2(context)
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        return false
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) then
        if G.GAME.dollars - G.GAME.bankrupt_at >= 1600 then
            return true
        end
    end
    return false
end

function Card:can_preach_card3(context)
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        return false
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) then
        if G.GAME.dollars - G.GAME.bankrupt_at >= 800 then
            return true
        end
    end
    return false
end

G.FUNCS.forge_card = function(e)
    local c1 = e.config.ref_table
    if c1.ability.set == 'Joker' then
        G.GAME.preach = true
        G.GAME.load_preach = true
    end
    if c1.ability.set == 'Default' or c1.ability.set == 'Enhanced' then
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            ease_dollars(-(10 + (c1.ability.f_level or 0)*3))
            if pseudorandom('forge_generic_chance') < G.GAME.probabilities.normal/(c1.ability.f_level and c1.ability.f_level/3 + 1 or 1) then
                local reward = pseudorandom(pseudoseed('forge_generic'))
                c1.ability.f_level = (c1.ability.f_level or 0) + 1
                if reward >= 0.8 then
                    if c1.ability.f_x_mult ~= 0 then
                        c1.ability.f_x_mult = c1.ability.f_x_mult + 0.5
                    else
                        c1.ability.f_x_mult = 1.5
                    end
                    card_eval_status_text(c1, 'extra', nil, nil, nil, {message = localize('b_forge_gold'), colour = G.C.GOLD})
                elseif reward >= 0.5 and reward < 0.8 then
                    c1.ability.f_mult = c1.ability.f_mult + 5
                    card_eval_status_text(c1, 'extra', nil, nil, nil, {message = localize('b_forge_red'), colour = G.C.RED})
                elseif reward >= 0 and reward < 0.5 then
                    c1.ability.f_chips = c1.ability.f_chips + 25
                    card_eval_status_text(c1, 'extra', nil, nil, nil, {message = localize('b_forge_blue'), colour = G.C.BLUE})
                end
            else
                c1.ability.f_level = (c1.ability.f_level or 0) - 1
                card_eval_status_text(c1, 'extra', nil, nil, nil, {message = localize('b_forge_lose'), colour = G.C.SECONDARY_SET.Enhanced})
            end
        return true end}))
    end
end

SMODS.calculation_keys[#SMODS.calculation_keys + 1] = 'f_chips'
SMODS.calculation_keys[#SMODS.calculation_keys + 1] = 'f_mult'
SMODS.calculation_keys[#SMODS.calculation_keys + 1] = 'f_x_mult'

local eval_card_ref = eval_card
function eval_card(card, context)
    local ret, post_trig = eval_card_ref(card, context)
    if not card:can_calculate(context.ignore_debuff) then
    elseif (context.main_scoring and (card.ability.set == 'Default' or card.ability.set == 'Enhanced')) or (context.joker_main and card.ability.set == 'Joker') then
        local f_chips = card:get_f_chips()
        local f_mult = card:get_f_mult()
        local f_x_mult = card:get_f_x_mult()
        ret.individual = {}
        if f_chips > 0 then
            ret.individual.f_chips = f_chips
        end
        if f_mult > 0 then
            ret.individual.f_mult = f_mult
        end
        if f_x_mult > 1 then
            ret.individual.f_x_mult = f_x_mult
        end
    end
    return ret, post_trig
end

local SMODS_calculate_individual_effect_ref = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    local ret = SMODS_calculate_individual_effect_ref(effect, scored_card, key, amount, from_edition)
    if key == 'f_chips' and amount then
        hand_chips = mod_chips(hand_chips + amount)
        update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
        card_eval_status_text(scored_card, 'chips', amount, percent)
        return true
    end
    if key == 'f_mult' and amount then
        mult = mod_mult(mult + amount)
        update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
        card_eval_status_text(scored_card, 'mult', amount, percent)
        return true
    end
    if key == 'f_x_mult' and amount ~= 1 then
        mult = mod_mult(mult * amount)
        update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
        card_eval_status_text(scored_card, 'x_mult', amount, percent)
        return true
    end
    return ret
end

function Game:update_preach_room(dt)
    if self.buttons then
        self.buttons:remove()
        self.buttons = nil
    end
    if G.GAME.load_preach then
        stop_use()
        if G.shop and not G.shop.alignment.offset.py then
            G.shop.alignment.offset.py = G.shop.alignment.offset.y
            G.shop.alignment.offset.y = G.ROOM.T.y + 29
        end
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,blocking = false,blockable = false,func = function()
            G.preach_room = UIBox{
                definition = create_UIBox_preach_room(),
                config = {align = "tmi", offset = {x=0,y=G.ROOM.T.y + 9}, major = G.hand, bond = 'Weak'}
            }
            G.preach_room.alignment.offset.y = -2.2
            G.ROOM.jiggle = G.ROOM.jiggle + 3
        return true end}))
        ease_colour(G.C.DYN_UI.MAIN, HEX("6495ed"))
        ease_background_colour{new_colour = HEX("6495ed"), special_colour = G.C.WHITE, contrast = 2}
        G.GAME.load_preach = false
    end
end

function create_UIBox_preach_room()
    local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
        {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
            {n=G.UIT.R, config={align = "cm", minh = 1.05*G.CARD_H}, nodes={}},
            {n=G.UIT.R, config={align = "tm"}, nodes={
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
                {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                    UIBox_dyn_container({
                        {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = localize('b_forge_practice'), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}
                            }},
                            {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = localize('b_forge_practice_notice'), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}
                            }},
                        }}
                    }),
                }},
                {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
                    {n=G.UIT.R,config={minh =0.2}, nodes={}},
                    {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'quit_preach_room', hover = true,shadow = true, func = 'can_quit_preach_room'}, nodes={
                        {n=G.UIT.T, config={text = localize('b_quit_cap'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}
                    }}
                }}
            }}
        }}
    }}
    return t
end

G.FUNCS.preach_card = function(e)
    local c1 = e.config.ref_table
    local cost = e.config.cost
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        ease_dollars(-cost)
        c1.ability.retriggers = (c1.ability.retriggers or 0) + (cost/400)
        card_eval_status_text(c1, 'extra', nil, nil, nil, {message = localize('b_forge_preach'), colour = G.C.SECONDARY_SET.Spectral})
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            if not (G.FUNCS.can_preach_card1_touch(c1) or G.FUNCS.can_preach_card2_touch(c1) or G.FUNCS.can_preach_card3_touch(c1)) then
                G.FUNCS.quit_preach_room()
            end
        return true end}))
    return true end}))
end

G.FUNCS.can_quit_preach_room = function(e)
    e.config.colour = G.C.GREY
    e.config.button = 'quit_preach_room'
end

G.FUNCS.quit_preach_room = function(e)
    stop_use()
    if G.preach_room then
        G.preach_room.alignment.offset.y = G.ROOM.T.y + 9
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,blocking = false,blockable = false,func = function()
            G.preach_room:remove()
            G.preach_room = nil
        return true end}))
    end
    if G.shop then
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function()
            if G.shop.alignment.offset.py then
                G.shop.alignment.offset.y = G.shop.alignment.offset.py
                G.shop.alignment.offset.py = nil
            end
            G.NEW_SHOP_ENTER.alignment.offset.y = 0.03
            G.SHOP_SIGN.alignment.offset.y = 0  
        return true end}))
    end
    ease_background_colour_blind(G.STATES.SHOP)
    G.GAME.preach = false
end

G.FUNCS.can_seal_card_touch = function(_card)
    if _card:can_seal_card() and _card.area == G.bm_wallet and G.STATE == G.STATES.SHOP then
        if not (G.GAME.preach or G.GAME.new_shop) then
            return true
        end
    else
        return false
    end
end

function Card:can_seal_card(context)
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        return false
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) then
        if (self.ability.set == 'Default' or self.ability.set == 'Enhanced') and not self.ability.as_blind then
            if G.GAME.dollars - G.GAME.bankrupt_at >= 15 then
                return true
            end
        end
    end
    return false
end

G.FUNCS.seal_card = function(e)
    local c1 = e.config.ref_table
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        ease_dollars(-15)
        c1:set_seal(SMODS.poll_seal({guaranteed = true, type_key = 'sealing'}))
        card_eval_status_text(c1, 'extra', nil, nil, nil, {message = localize('b_seal_2'), colour = G.C.SECONDARY_SET.Voucher})
    return true end}))
end

G.FUNCS.can_deposit_touch = function(_card)
    if _card:can_deposit_card() and _card.area.config.type == 'shop' and G.STATE == G.STATES.SHOP then
        if not (G.GAME.preach or G.GAME.new_shop) and (not G.GAME.load_deposit or #G.GAME.load_deposit.cards < 4) then
            return true
        end
    else
        return false
    end
end

function Card:can_deposit_card(context)
    if (G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0) then
        return false
    end
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) then
        if self.children.price then
            if G.GAME.dollars - G.GAME.bankrupt_at >= 1 then
                return true
            end
        end
    end
    return false
end

G.FUNCS.deposit_from_shop = function(e)
    local c1 = e.config.ref_table
    if not G.GAME.load_deposit then
        G.GAME.load_deposit = {
            cards = {},
            config = {card_limit = 4, temp_limit = 4, type = 'new_shop', highlight_limit = 1}
        }
    end
    G.GAME.load_deposit.cards[#G.GAME.load_deposit.cards + 1] = c1:save()
    if c1.area == G.shop_vouchers then G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit - 1 end
    if c1.shop_voucher then G.GAME.current_round.voucher.spawn[c1.config.center_key] = false end
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        ease_dollars(-1)
        local c = c1.area:remove_card(c1)
        c:remove()
        c = nil
    return true end}))
end

----------------------------------------------
------------MOD CODE END----------------------

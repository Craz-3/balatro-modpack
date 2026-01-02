--- STEAMODDED HEADER
--- MOD_NAME: Bmvouchers
--- MOD_ID: Bmvouchers
--- MOD_AUTHOR: [BaiMao]
--- MOD_DESCRIPTION: Create more vouchers
--- BADGE_COLOUR: D9D919
--- VERSION: 1.0.4
----------------------------------------------
------------MOD CODE -------------------------

local poll_edition_ref = poll_edition
function poll_edition(_key, _mod, _no_neg, _guaranteed)
    local edition_poll_negative = pseudorandom(pseudoseed('edition_negative'))
    if G.GAME.used_vouchers.v_bmvo_nothingness then
        if edition_poll_negative > 0.8 and not _no_neg then
            return {negative = true}
        else
            return poll_edition_ref(_key, _mod, _no_neg, _guaranteed)
        end
    elseif G.GAME.used_vouchers.v_bmvo_dark_matter then
        if edition_poll_negative > 0.9 and not _no_neg then
            return {negative = true}
        else
            return poll_edition_ref(_key, _mod, _no_neg, _guaranteed)
        end
    else
        return poll_edition_ref(_key, _mod, _no_neg, _guaranteed)
    end
end

local Card_open_ref = Card.open
function Card:open()
    local Card_open_val = Card_open_ref(self)
    if G.GAME.used_vouchers.v_bmvo_storage_expert then
        G.GAME.pack_choices = self.ability.extra
    end
    return Card_open_val
end

G.localization.misc.dictionary.b_reserve = "收纳"
local Card_highlight_ref = Card.highlight
function Card:highlight(is_higlighted)
    self.highlighted = is_higlighted
    if G.GAME.used_vouchers.v_bmvo_storage_master and self.ability.consumeable and (self.area and self.area == G.pack_cards) then
        local x_off = (self.ability.consumeable and -0.1 or 0)
        if self.highlighted then
            self.children.use_button = UIBox{
                definition = {
                    n=G.UIT.ROOT, config = {padding = 0, colour = G.C.CLEAR}, nodes={
                        {n=G.UIT.R, config={mid = true}, nodes={}},
                        {n=G.UIT.R, config={ref_table = self, r = 0.08, padding = 0.1, align = "bm", minw = 0.3*self.T.w - 0.15, minh = 0.3*self.T.h, maxw = 0.5*self.T.w - 0.15, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_use_consumeable'}, nodes={
                            {n=G.UIT.T, config={text = localize('b_use'),colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true}}
                        }},
                }},
                config = {
                    align = 'bmi',
                    offset = {x = -0.5,y = 0.65},
                    parent = self
                }
            }
            self.children.reserve_button = UIBox{
                definition = {
                    n=G.UIT.ROOT, config = {padding = 0, colour = G.C.CLEAR}, nodes={
                        {n=G.UIT.R, config={mid = true}, nodes={}},
                        {n=G.UIT.R, config={ref_table = self, r = 0.08, padding = 0.1, align = "bm", minw = 0.3*self.T.w - 0.15, minh = 0.3*self.T.h, maxw = 0.5*self.T.w - 0.15, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'reserve_consumeable', func = 'can_reserve_consumeable'}, nodes={
                            {n=G.UIT.T, config={text = localize('b_reserve'),colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true}}
                        }},
                }},
                config = {
                    align = 'bmi',
                    offset = {x = 0.5,y = 0.65},
                    parent = self
                }
            }
        elseif self.children.reserve_button then
            self.children.reserve_button:remove()
            self.children.reserve_button = nil
        end
    else
        Card_highlight_ref(self, is_higlighted)
    end
end

G.FUNCS.reserve_consumeable = function(e)
    local c1 = e.config.ref_table
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
          c1.area:remove_card(c1)
          c1:add_to_deck()
          if c1.children.price then c1.children.price:remove() end
          c1.children.price = nil
          if c1.children.buy_button then c1.children.buy_button:remove() end
          c1.children.buy_button = nil
          if c1.children.reserve_button then c1.children.reserve_button:remove() end
          c1.children.reserve_button = nil
          remove_nils(c1.children)
          G.consumeables:emplace(c1)
          G.GAME.pack_choices = G.GAME.pack_choices - 1
          if G.GAME.pack_choices <= 0 then
            G.FUNCS.end_consumeable(nil, delay_fac)
          end
          return true
        end
    }))
end

local G_FUNCS_use_card_ref = G.FUNCS.use_card
G.FUNCS.use_card = function(e, mute, nosave)
    G_FUNCS_use_card_ref(e, mute, nosave)
    local card = e.config.ref_table
    if card.children.reserve_button then card.children.reserve_button:remove(); card.children.reserve_button = nil end
end

G.FUNCS.can_reserve_consumeable = function(e)
    if (e.config.ref_table.edition and e.config.ref_table.edition.negative) or #G.consumeables.cards < G.consumeables.config.card_limit then 
        e.config.colour = G.C.GREEN
        e.config.button = 'reserve_consumeable'
    else
      e.config.colour = G.C.UI.BACKGROUND_INACTIVE
      e.config.button = nil
    end
end

local Card_draw_ref = Card.draw
function Card:draw(layer)
    layer = layer or 'both'
    if (layer == 'card' or layer == 'both') then
        if self.children.reserve_button and self.highlighted then self.children.reserve_button:draw() end
    end
    Card_draw_ref(self, layer)
end

SMODS.Atlas {
    key = "storage_expert",
    path = "vouchers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "storage_master",
    path = "vouchers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "dark_matter",
    path = "T3_Vouchers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "nothingness",
    path = "T3_Vouchers.png",
    px = 71,
    py = 95
}

SMODS.Voucher {
    key = 'storage_expert',
    name = 'Storage Expert',
    unlocked = true,
    discovered = true,
    cost = 10,
    pos = { x = 0, y = 0 },
    loc_txt ={
        name = '收纳能手',
        text = {
            '购买任意补充包',
            '可获得其{C:attention}全部{}卡牌'
        }
    },
    atlas = "storage_expert",
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
}

SMODS.Voucher {
    key = 'storage_master',
    name = 'Storage Master',
    unlocked = true,
    discovered = true,
    cost = 10,
    pos = { x = 1, y = 0 },
    loc_txt ={
        name = '收纳大师',
        text = {
            '打开补充包后',
            '选择的消耗牌',
            '可收纳至{C:attention}槽内{}'
        }
    },
    atlas = "storage_master",
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    requires = {"v_bmvo_storage_expert"},
}

SMODS.Voucher {
    key = 'dark_matter',
    name = 'Dark Matter',
    unlocked = true,
    discovered = true,
    cost = 10,
    pos = { x = 4, y = 0 },
    loc_txt ={
        name = '暗物质',
        text = {
            '{C:dark_edition}负片卡{}出现',
            '频率{C:attention}提高{}',
        }
    },
    atlas = "dark_matter",
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
}

SMODS.Voucher {
    key = 'nothingness',
    name = 'Nothingness',
    unlocked = true,
    discovered = true,
    cost = 10,
    pos = { x = 7, y = 0 },
    loc_txt ={
        name = '虚无',
        text = {
            '{C:dark_edition}负片卡{}出现',
            '频率{C:attention}更高{}',
        }
    },
    atlas = "nothingness",
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    requires = {"v_bmvo_dark_matter"},
}

----------------------------------------------
------------MOD CODE END----------------------
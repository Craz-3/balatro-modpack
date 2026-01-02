--- STEAMODDED HEADER
--- MOD_NAME: Bmbacks
--- MOD_ID: Bmbacks
--- MOD_AUTHOR: [BaiMao]
--- MOD_DESCRIPTION: Create more backs
--- BADGE_COLOUR: D9D919
--- VERSION: 1.0.4
----------------------------------------------
------------MOD CODE -------------------------

local CardArea_can_highlight_ref = CardArea.can_highlight
function CardArea:can_highlight(card)
    if self.config.type == 'title' and G.GAME.highlighted_check and G.GAME.sell_license then
        return true
    else
        return CardArea_can_highlight_ref(self, card)
    end
end

local CardArea_add_to_highlighted_ref = CardArea.add_to_highlighted
function CardArea:add_to_highlighted(card, silent)
    if self.config.type == 'title' then
        if #self.highlighted >= math.max(1, self.config.highlighted_limit) then 
            self:remove_from_highlighted(self.highlighted[1])
        end
        self.highlighted[#self.highlighted + 1] = card
        card:highlight(true)
        if not silent then play_sound('cardSlide1') end
    else
        return CardArea_add_to_highlighted_ref(self, card, silent)
    end
end

local Card_highlight_ref = Card.highlight
function Card:highlight(is_higlighted)
    if self.area and self.area.config.view_deck and G.GAME.sell_license and not self.selled then
        self.children.use_button = UIBox{
            definition = {
                n=G.UIT.ROOT, config = {padding = 0, colour = G.C.CLEAR}, nodes={
                    {n=G.UIT.C, config={padding = 0.15, align = 'cl'}, nodes={
                        {n=G.UIT.R, config={align = 'cl'}, nodes={
                            {n=G.UIT.C, config={align = "cr"}, nodes={
                                {n=G.UIT.C, config={ref_table = self, align = "cr",padding = 0.1, r=0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card_ref', func = 'can_sell_card_ref'}, nodes={
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
            config = {align = "cr", offset = {x = -0.5, y = 0}, parent = self}
        }
    else       
        return Card_highlight_ref(self, is_higlighted)
    end
end

G.FUNCS.sell_card_ref = function(e)
    local card = e.config.ref_table
    card.selled = true
    card:sell_card_ref()
    for k, v in ipairs(G.playing_cards) do
        if v.unique_val == card.unique_val then
            v:sell_card()
            break
        end
    end
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] ~= card then
            G.jokers.cards[i]:calculate_joker({selling_card = true, card = card})
        end
    end
end

G.FUNCS.can_sell_card_ref = function(e)
    if e.config.ref_table:can_sell_card_ref() then 
        e.config.colour = G.C.GREEN
        e.config.button = 'sell_card_ref'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

function Card:sell_card_ref()
    stop_use()
    if self.children.use_button then self.children.use_button:remove(); self.children.use_button = nil end 
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
        self:juice_up(0.3, 0.4)
        return true
    end}))
    delay(0.2)
    G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
        self:start_dissolve({G.C.GOLD})
        delay(0.3)
        return true
    end}))
end

function Card:can_sell_card_ref(context)
    if (G.SETTINGS.tutorial_complete or G.GAME.pseudorandom.seed ~= 'TUTORIAL' or G.GAME.round_resets.ante > 1) and
        (self.ability.set == 'Default' or self.ability.set == 'Enhanced') and G.GAME.sell_license then
        return true
    end
    return false
end

local G_FUNCS_exit_overlay_menu_ref = G.FUNCS.exit_overlay_menu
G.FUNCS.exit_overlay_menu = function()
    G_FUNCS_exit_overlay_menu_ref()
    G.GAME.highlighted_check = nil
end

local Card_click_ref = Card.click
function Card:click()
    Card_click_ref(self)
    if self.area and self.area == G.deck and self.area.cards[1] == self then
        G.GAME.highlighted_check = true
    end
end

local copy_card_ref = copy_card
function copy_card(other, new_card, card_scale, playing_card, strip_edition)
    local t = copy_card_ref(other, new_card, card_scale, playing_card, strip_edition)
    t.unique_val = other.unique_val
    return t
end

function table.indexOf(tbl, value)
    for i, v in ipairs(tbl) do
        if v == value then
            return i
        end
    end
    return nil
end

G.bmbacks_key = {
    b_bmba_dichotomy = 1,
    b_bmba_serpainted = 1,
    b_bmba_jokerless = 1
}

SMODS.Atlas{
    key = 'dichotomy',
    px = 71,
    py = 95,
    path = 'dichotomy.png'
}

SMODS.Atlas{
    key = 'serpainted',
    px = 71,
    py = 95,
    path = 'serpainted.png'
}

SMODS.Atlas{
    key = 'jokerless',
    px = 71,
    py = 95,
    path = 'jokerless.png'
}

SMODS.Atlas{
    key = 'dichotomy_atlas',
    px = 71,
    py = 95,
    path = 'sleeves.png'
}

SMODS.Atlas{
    key = 'serpainted_atlas',
    px = 71,
    py = 95,
    path = 'serpainted_sleeve.png'
}

SMODS.Back{
    key = "dichotomy",
    name = "Dichotomy Deck",
    discovered = true,
    unlocked = true,
    atlas = 'dichotomy',
    pos = { x = 0, y = 0 },
    config = {dichotomy = true},
    loc_txt = {
        name = "二分牌组",
        text = {
            '开局时',
            '牌组中所有点数牌',
            '{C:attention}数量减半{}',
        }
    },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    apply = function(self)
        if self.config.dichotomy then
            G.GAME.starting_params.dichotomy = true
        end
    end
}

SMODS.Back{
    key = "serpainted",
    name = "Serpainted Deck",
    discovered = true,
    unlocked = true,
    atlas = 'serpainted',
    pos = { x = 0, y = 0 },
    config = {joker_slot = -1, draw_card = 3, serpainted = true},
    loc_txt = {
        name = "虹蟒牌组",
        text = {
            '小丑牌槽位{C:red}#1#{}',
            '出牌或弃牌后',
            '额外抽{C:attention}#2#{}张牌',
        }
    },
    loc_vars = function(self, info_queue, center)
        return { vars = {self.config.joker_slot, self.config.draw_card} }
    end,
    apply = function(self)
        if self.config.serpainted then
            G.GAME.draw_serpainted = (G.GAME.draw_serpainted or 0) + self.config.draw_card
        end
    end
}

SMODS.Back{
    key = "jokerless",
    name = "Jokerless Deck",
    stake = 8,
    discovered = true,
    unlocked = true,
    atlas = 'jokerless',
    pos = { x = 0, y = 0 },
    config = {joker_slot = -5, jokerless = true},
    loc_txt = {
        name = "无小丑牌组",
        text = {
            '小丑牌{C:attention}不再出现{}',
            '{C:planet}星球牌{}效果翻倍',
        }
    },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    apply = function(self)
        local banned_cards = {
            {id = 'c_judgement'},
            {id = 'c_wheel_of_fortune'},
            {id = 'c_temperance'},
            {id = 'c_wraith'},
            {id = 'c_ectoplasm'},
            {id = 'c_ankh'},
            {id = 'c_hex'},
            {id = 'c_soul'},
            {id = 'v_antimatter'},
            {id = 'p_buffoon_normal_1', ids = {
                'p_buffoon_normal_1',
                'p_buffoon_normal_2',
                'p_buffoon_jumbo_1',
                'p_buffoon_mega_1',
            }},
        }
        local banned_tags = {
            {id = 'tag_rare'},
            {id = 'tag_uncommon'},
            {id = 'tag_holo'},
            {id = 'tag_polychrome'},
            {id = 'tag_negative'},
            {id = 'tag_foil'},
            {id = 'tag_buffoon'},
            {id = 'tag_top_up'},
        }
        if self.config.jokerless then
            G.GAME.jokerless_reward = true
            G.GAME.joker_rate = 0
            for k, v in ipairs(banned_cards) do
                G.GAME.banned_keys[v.id] = true
                if v.ids then
                    for kk, vv in ipairs(v.ids) do
                        G.GAME.banned_keys[vv] = true
                    end
                end
            end
            for k, v in ipairs(banned_tags) do
                G.GAME.banned_keys[v.id] = true
            end
            for k, v in pairs(G.GAME.hands) do
                v.l_mult = v.l_mult*2
                v.l_chips = v.l_chips*2
            end
        end
    end
}

if CardSleeves then
CardSleeves.Sleeve {
    key = "dichotomy",
    name = "Dichotomy Sleeve",
    atlas = "dichotomy_atlas",
    pos = { x = 2, y = 2 },
    unlocked = true,
    loc_vars = function(self)
        local key = self.key
        if self.get_current_deck_key() ~= "b_bmba_dichotomy" then
            key = self.key
            self.config = { dichotomy = true }
        else
            key = key .. "_alt"
            self.config = { dichotomy = true, dichotomy_pro = true }
        end
        return { key = key }
    end,
    apply = function(self)
        CardSleeves.Sleeve.apply(self)
        if self.config.dichotomy then
            G.GAME.starting_params.dichotomy = true
        end
        if self.config.dichotomy_pro then
            G.GAME.sell_license = true
        end
    end,
}

CardSleeves.Sleeve {
    key = "serpainted",
    name = "Serpainted Sleeve",
    atlas = "serpainted_atlas",
    pos = { x = 1, y = 2 },
    config = { joker_slot = -1, draw_card = 3, serpainted = true },
    unlocked = true,
    loc_vars = function(self)
        return { vars = { self.config.joker_slot, self.config.draw_card } }
    end,
    apply = function(self)
        CardSleeves.Sleeve.apply(self)
        if self.config.serpainted then
            G.GAME.draw_serpainted = (G.GAME.draw_serpainted or 0) + self.config.draw_card
        end
    end,
}
end

----------------------------------------------
------------MOD CODE END----------------------
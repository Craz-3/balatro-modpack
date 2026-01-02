--- STEAMODDED HEADER
--- MOD_NAME: Bmmanualtags
--- MOD_ID: Bmmanualtags
--- MOD_AUTHOR: [BaiMao]
--- MOD_DESCRIPTION: Make tags as manually triggered as possible
--- BADGE_COLOUR: A64E91
--- VERSION: 1.0.1c
----------------------------------------------
------------MOD CODE -------------------------

local Incompatible_Tags = {
    tag_uncommon=     {config = {type = 'store_joker_create'}},
    tag_rare=         {config = {type = 'store_joker_create', odds = 3}},
    tag_investment=   {config = {type = 'eval', dollars = 25}},
}

function Tag:can_trigger()
    if not self.HUD_tag then return false end
    local type = self.config.type
    if type == 'store_joker_create' then
        return false
    elseif type == 'store_joker_modify' then
        if G.STATE == G.STATES.SHOP and G.shop_jokers and #G.shop_jokers.cards >= 1 then
            return true
        end
    elseif type == 'eval' then
        return false
    elseif type == 'voucher_add' then
        if G.STATE == G.STATES.SHOP then
            return true
        end
    elseif type == 'new_blind_choice' then
        if G.STATE == G.STATES.BLIND_SELECT then
            return true
        end
    elseif type == 'immediate' then
        return true
    elseif type == 'shop_final_pass' then
        if G.STATE == G.STATES.SHOP then
            return true
        end
    elseif type == 'tag_add' then
        if G.GAME.tags and #G.GAME.tags >= 1 then
            return true
        end
    elseif type == 'round_start_bonus' then
        if G.STATE == G.STATES.SELECTING_HAND then
            return true
        end
    elseif type == 'shop_start' then
        if G.STATE == G.STATES.SHOP then
            return true
        end
    end
    return false
end

function Tag:click_to_run()
    if self.config.type == 'store_joker_modify' then
        local _card = G.shop_jokers.cards[1]
        for i = 1, #G.shop_jokers.cards do
            if not G.shop_jokers.cards[i].edition and not G.shop_jokers.cards[i].temp_edition and G.shop_jokers.cards[i].ability.set == 'Joker' then
                _card = G.shop_jokers.cards[i]
                break
            end
        end
        self:apply_to_run({type = 'store_joker_modify', card = _card})
    elseif self.config.type == 'voucher_add' then
        self:apply_to_run({type = 'voucher_add'})
    elseif self.config.type == 'new_blind_choice' then
        self:apply_to_run({type = 'new_blind_choice'})
    elseif self.config.type == 'immediate' then
        self:apply_to_run({type = 'immediate'})
    elseif self.config.type == 'shop_final_pass' then
        self:apply_to_run({type = 'shop_final_pass'})
    elseif self.config.type == 'tag_add' then
        local _tag = self
        for i = 1, #G.GAME.tags do
            if G.GAME.tags[i] == self then
                for j = i + 1, #G.GAME.tags do
                    if G.GAME.tags[j].key ~= self.key then
                        _tag = G.GAME.tags[j]
                        break
                    end
                end
                break
            end
        end
        self:apply_to_run({type = 'tag_add', tag = _tag})
    elseif self.config.type == 'round_start_bonus' then
        self:apply_to_run({type = 'round_start_bonus'})
    elseif self.config.type == 'shop_start' then
        self:apply_to_run({type = 'shop_start'})
    end
end

local Tag_apply_to_run_ref = Tag.apply_to_run
function Tag:apply_to_run(_context)
    for k, v in pairs(Incompatible_Tags) do
        if self.key == k then
            self.ability.incompatible = true
        end
    end
    if self.ability.click_check or self.ability.incompatible then
        return Tag_apply_to_run_ref(self, _context)
    end
end

function Tag:move_to_last()
    if not G.HUD_tags or not G.GAME.tags then return end
    local hud_key, game_key
    for k, v in ipairs(G.HUD_tags) do
        if v == self.HUD_tag then hud_key = k break end
    end
    for k, v in ipairs(G.GAME.tags) do
        if v == self then game_key = k break end
    end
    if not hud_key or not game_key or hud_key == #G.HUD_tags then return end
    local current_hud_tag = table.remove(G.HUD_tags, hud_key)
    table.insert(G.HUD_tags, current_hud_tag)
    local current_game_tag = table.remove(G.GAME.tags, game_key)
    table.insert(G.GAME.tags, current_game_tag)
    if hud_key == 1 then
        G.HUD_tags[1]:set_alignment({
            type = 'bri',
            offset = {x=0.7, y=0},
            xy_bond = 'Weak',
            major = G.ROOM_ATTACH
        })
    else
        G.HUD_tags[hud_key]:set_role({
            xy_bond = 'Weak',
            major = G.HUD_tags[hud_key - 1]
        })
    end
    self.HUD_tag:set_alignment({
        type = 'tm',
        offset = {x=0, y=0},
        xy_bond = 'Weak',
        major = G.HUD_tags[#G.HUD_tags - 1]
    })
end

local Tag_generate_UI_ref = Tag.generate_UI
function Tag:generate_UI(_size)
    local tag_sprite_tab, tag_sprite = Tag_generate_UI_ref(self, _size)
    tag_sprite.states.click.can = true
    tag_sprite.click = function(_self)
        self.ability.click_check = true
        for k, v in pairs(Incompatible_Tags) do
            if self.key == k then
                self.ability.incompatible = true
            end
        end
        if not self.ability.incompatible and self:can_trigger() then
            self:click_to_run()
        end
        if not self.triggered then
            self:move_to_last()
            self:juice_up()
            play_sound('cancel')
        end
        self.ability.click_check = nil
    end
    return tag_sprite_tab, tag_sprite
end

----------------------------------------------
------------MOD CODE END----------------------

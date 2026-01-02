--- STEAMODDED HEADER
--- MOD_NAME: stampsylt
--- MOD_ID: stampsylt
--- MOD_AUTHOR: [sishui]
--- MOD_DESCRIPTION: Adds interesting stamp stickers
--- BADGE_COLOUR: 00009C
--- PRIORITY: 200

local Card_add_to_deck_ref = Card.add_to_deck 
function Card.add_to_deck(self, from_debuff)
    if not self.added_to_deck then
            if self.ability["stam_Jimbo"] then
                G.hand:change_size(1)
            end
            if self.ability["stam_Todd"] then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                ease_hands_played(1)
            end
            if self.ability["stam_Steven"] then
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
                ease_discard(1)
            end
            if self.ability["stam_Mrbones"] then
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
            end
    end
    Card_add_to_deck_ref(self, from_debuff)
end

local Card_remove_from_deck_ref = Card.remove_from_deck 
function Card.remove_from_deck(self, from_debuff)
    if self.added_to_deck then
            if self.ability["stam_Jimbo"] then
                G.hand:change_size(-1)
            end
            if self.ability["stam_Todd"] then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
                ease_hands_played(-1)
            end
            if self.ability["stam_Steven"] then
                G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
                ease_discard(-1)
            end
            if self.ability["stam_Mrbones"] then
                G.consumeables.config.card_limit = G.consumeables.config.card_limit - 1
            end
    end
    Card_remove_from_deck_ref(self, from_debuff)
end

local Card_apply_to_run_ref = Card.apply_to_run
    function Card:apply_to_run(center)
        local center_table = {
            name = center and center.name or self and self.ability.name,
            extra = center and center.config.extra or self and self.ability.extra
        }
        if center_table.name == 'stamp_savvy' then
        G.GAME.modifiers['enable_stam_Andy'] = true
        end
        if center_table.name == 'stamp_coupon' then
        G.GAME.modifiers['enable_stam_Jimbo'] = true
        G.GAME.modifiers['enable_stam_Todd'] = true
        G.GAME.modifiers['enable_stam_Steven'] = true
        G.GAME.modifiers['enable_stam_Chaos'] = true
        G.GAME.modifiers['enable_stam_Mrbones'] = true
        G.GAME.modifiers['enable_stam_Green'] = true
        G.GAME.modifiers['enable_stam_Mime'] = true
        end
    Card_apply_to_run_ref(self, center)
end

--[[ Stamp Coupon's effect
local alias__Card_set_cost = Card.set_cost;
function Card:set_cost()
	alias__Card_set_cost(self)
	if self.cost > 0 and G.GAME.used_vouchers.v_stam_stamp_coupon and (self.ability["st_stam_Jimbo"] or self.ability["st_stam_Todd"] or self.ability["st_stam_Steven"] or self.ability["st_stam_Mrbones"] or self.ability["st_stam_Chaos"] or self.ability["st_stam_Andy"] or self.ability["st_stam_Green"] or self.ability["st_stam_Mime"]) then
		self.cost = math.max(1, self.cost - 5)
		self.sell_cost = math.max(1, math.floor(self.cost/2)) + (self.ability.extra_value or 0)
		self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
	end
end]]

SMODS.Atlas {  
    key = 'stampsylt1',
    px = 71,
    py = 95,
    path = 'JokerStamps.png'
}

SMODS.Atlas {  
    key = 'stampsylt2',
    px = 71,
    py = 95,
    path = 'JokerStamps2.png'
}

SMODS.Atlas {  
    key = 'MoreConsumables1',
    px = 71,
    py = 95,
    path = 'MoreConsumables1.png'
}

SMODS.Atlas {  
    key = 'VouchMe',
    px = 71,
    py = 95,
    path = 'VouchMe.png'
}

SMODS.Sticker {
	key = "Jimbo",
	loc_txt = {

            name = "金宝邮戳",
            text = {
                "{C:attention}+1手牌上限{}",
            },
        label = "金宝邮戳",
    },
	rate = 0.03,
    atlas = 'stampsylt1',
	pos = { x = 0, y = 0 },
    order = 1,
	badge_colour = HEX("FDA200"),
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = true,
}

SMODS.Sticker {
	key = "Todd",
	loc_txt = {
            name = "托德邮戳",
            text = {
                "{C:blue}+1出牌次数{}",
            },
        label = "托德邮戳",
    },
	rate = 0.03,
    atlas = 'stampsylt1',
	pos = { x = 1, y = 0 },
    order = 2,
	badge_colour = HEX("009CFD"),
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = true,
}

SMODS.Sticker {
	key = "Steven",
	loc_txt = {
            name = "史蒂文邮戳",
            text = {
                "{C:red}+1弃牌次数{}",
            },
        label = "史蒂文邮戳",
    },
	rate = 0.03,
    atlas = 'stampsylt1',
	pos = { x = 2, y = 0 },
    order = 3,
	badge_colour = HEX 'FD5F55',
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = true,
}

SMODS.Sticker {
	key = "Chaos",
	loc_txt = {
            name = "混沌邮戳",
            text = {
                "回合结束时{C:money}+$4",
            },
        label = "混沌邮戳",
    },
	rate = 0.03,
    atlas = 'stampsylt1',
	pos = { x = 3, y = 0 },
    order = 4,
	badge_colour = HEX '55A383',
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = true,
    calculate = function(self, card, context)
        if context.end_of_round and not (context.individual or context.repetition) then
            ease_dollars(4)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+$4", colour = G.C.MONEY})
        end
    end,
}

SMODS.Sticker {
	key = "Andy",
	loc_txt = {
            name = "安迪邮戳",
            text = {
                "{C:purple}选择{C:attention}盲注{}时减少",
                "{C:purple}15%{}的分数要求"
            },
        label = "安迪邮戳",
    },
	rate = 0.015,
    atlas = 'stampsylt1',
	pos = { x = 4, y = 0 },
    order = 5,
	badge_colour = HEX '8F5AC1',
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = true,
    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.85)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                
                local chips_UI = G.hand_text_area.blind_chips
                G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                G.HUD_blind:recalculate() 
                chips_UI:juice_up()

                return true end }))
        end
    end,
}

SMODS.Sticker {
	key = "Mrbones",
	loc_txt = {
            name = "骷髅邮戳",
            text = {
                "{C:attention}+1{C:purple}消耗牌槽位{}",
            },
        label = "骷髅邮戳",
    },
	rate = 0.03,
    atlas = 'stampsylt1',
	pos = { x = 5, y = 0 },
    order = 6,
	badge_colour = HEX 'B1A485',
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = true,
}

SMODS.Sticker {
	key = "Green",
	loc_txt = {
            name = "绿色邮戳",
            text = {
                "商店{C:attention}重掷{}时升级",
                "{C:green}上次打出的牌型",
            },
        label = "绿色邮戳",
    },
	rate = 0.03,
    atlas = 'stampsylt2',
	pos = { x = 0, y = 0 },
    order = 7,
	badge_colour = HEX '008000',
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = true,
    calculate = function(self, card, context)
        if context.reroll_shop then
            if G.GAME.last_hand_played then
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.03, delay = 0.3}, {handname=localize(G.GAME.last_hand_played, 'poker_hands'),chips = G.GAME.hands[G.GAME.last_hand_played].chips, mult = G.GAME.hands[G.GAME.last_hand_played].mult, level=G.GAME.hands[G.GAME.last_hand_played].level})
            level_up_hand(card, G.GAME.last_hand_played, nil, 1)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
            else
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.03, delay = 0.3}, {handname=localize("High Card", 'poker_hands'),chips = G.GAME.hands["High Card"].chips, mult = G.GAME.hands["High Card"].mult, level=G.GAME.hands["High Card"].level})
            level_up_hand(card, "High Card", nil, 1)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
            end
        end
    end,
}

SMODS.Sticker {
	key = "Mime",
	loc_txt = {
            name = "哑剧邮戳",
            text = {
                "回合结束时留在",
                "手中的牌{C:chips}+5筹码{}"
            },
        label = "哑剧邮戳",
    },
	rate = 0.03,
    atlas = 'stampsylt2',
	pos = { x = 1, y = 0 },
    order = 8,
	badge_colour = HEX 'ADD8E6',
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = true,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.end_of_round and not context.other_card.debuff then
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 2.5
        end
    end,
}

SMODS.Voucher {
    key = "stamp_savvy",
    name = "stamp_savvy",
    loc_txt = {
        name = "邮戳收集",
        text = {
			"商店中可能出现","带有{C:attention}安迪邮戳{}的{C:attention}小丑{}",
		},
    },
    pos = { x = 2, y = 0 },
    atlas = 'VouchMe',
    cost = 10,
    unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Andy',
            specific_vars = {}
        }
        return {vars = {}}
    end,
}

SMODS.Voucher {
    key = "stamp_coupon",
    name = "stamp_coupon",
    loc_txt = {
        name = "邮戳甩卖",
        text = {
			"商店中可以出现","所有类型的{C:attention}邮戳{}","且售出的{C:attention}小丑{}","可能带多个叠加的{C:attention}邮戳{}",
		},
    },
    pos = { x = 3, y = 0 },
    atlas = 'VouchMe',
    cost = 10,
    unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Jimbo',
            specific_vars = {}
        }
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Todd',
            specific_vars = {}
        }
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Steven',
            specific_vars = {}
        }
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Mrbones',
            specific_vars = {}
        }
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Chaos',
            specific_vars = {}
        }
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Andy',
            specific_vars = {}
        }
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Green',
            specific_vars = {}
        }
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Mime',
            specific_vars = {}
        }
        return {vars = {}}
    end,
    requires = {"v_stam_stamp_savvy"},
}

SMODS.Consumable {
    key = 'whimsy',
    set = 'Spectral',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = {x = 7, y = 4},
    loc_txt = {
        name = '惊悚',
        text = {
            "选择一个{C:attention}小丑{}",
			"添加{C:blue}金宝邮戳{}"
        }
    },
    atlas = "MoreConsumables1",
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Jimbo',
            specific_vars = {}
        }
        return {vars = {}}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local conv_card = G.jokers.highlighted[1]
	G.E_MANAGER:add_event(Event({func = function()
		play_sound('tarot1')
		used_tarot:juice_up(0.3, 0.5)
		return true end }))
	
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        SMODS.Stickers["stam_Jimbo"]:apply(conv_card, true)
        G.hand:change_size(1)
        conv_card:juice_up(0.3, 0.5)
		return true end }))
	
	delay(0.5)
    end,      
    can_use = function(self, card)
        if #G.jokers.highlighted == 1 and not (G.jokers.highlighted[1].ability["stam_Jimbo"] or G.jokers.highlighted[1].ability["stam_Todd"] or G.jokers.highlighted[1].ability["stam_Steven"] or G.jokers.highlighted[1].ability["stam_Mrbones"] or G.jokers.highlighted[1].ability["stam_Chaos"] or G.jokers.highlighted[1].ability["stam_Andy"] or G.jokers.highlighted[1].ability["stam_Green"] or G.jokers.highlighted[1].ability["stam_Mime"]) then
            return true 
        else
            return false
        end
    end
}

SMODS.Consumable {
    key = 'comedy',
    set = 'Spectral',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = {x = 5, y = 4},
    loc_txt = {
        name = "喜剧",
		text = {
			"选择一个{C:attention}小丑{}",
			"添加{C:blue}托德邮戳{}"
		},
    },
    atlas = "MoreConsumables1",
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Todd',
            specific_vars = {}
        }
        return {vars = {}}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local conv_card = G.jokers.highlighted[1]
	G.E_MANAGER:add_event(Event({func = function()
		play_sound('tarot1')
		used_tarot:juice_up(0.3, 0.5)
		return true end }))
	
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        SMODS.Stickers["stam_Todd"]:apply(conv_card, true)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                ease_hands_played(1)
        conv_card:juice_up(0.3, 0.5)
		return true end }))
	
	delay(0.5)
    end,      
    can_use = function(self, card)
        if #G.jokers.highlighted == 1 and not (G.jokers.highlighted[1].ability["stam_Jimbo"] or G.jokers.highlighted[1].ability["stam_Todd"] or G.jokers.highlighted[1].ability["stam_Steven"] or G.jokers.highlighted[1].ability["stam_Mrbones"] or G.jokers.highlighted[1].ability["stam_Chaos"] or G.jokers.highlighted[1].ability["stam_Andy"] or G.jokers.highlighted[1].ability["stam_Green"] or G.jokers.highlighted[1].ability["stam_Mime"]) then
            return true 
        else
            return false
        end
    end
}

SMODS.Consumable {
    key = 'tragedy',
    set = 'Spectral',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = {x = 6, y = 4},
    loc_txt = {
        name = "悲剧",
		text = {
			"选择一个{C:attention}小丑{}",
			"添加{C:blue}史蒂文邮戳{}"
		},
    },
    atlas = "MoreConsumables1",
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Steven',
            specific_vars = {}
        }
        return {vars = {}}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local conv_card = G.jokers.highlighted[1]
	G.E_MANAGER:add_event(Event({func = function()
		play_sound('tarot1')
		used_tarot:juice_up(0.3, 0.5)
		return true end }))
	
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        SMODS.Stickers["stam_Steven"]:apply(conv_card, true)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
                ease_discard(1)
        conv_card:juice_up(0.3, 0.5)
		return true end }))
	
	delay(0.5)
    end,      
    can_use = function(self, card)
        if #G.jokers.highlighted == 1 and not (G.jokers.highlighted[1].ability["stam_Jimbo"] or G.jokers.highlighted[1].ability["stam_Todd"] or G.jokers.highlighted[1].ability["stam_Steven"] or G.jokers.highlighted[1].ability["stam_Mrbones"] or G.jokers.highlighted[1].ability["stam_Chaos"] or G.jokers.highlighted[1].ability["stam_Andy"] or G.jokers.highlighted[1].ability["stam_Green"] or G.jokers.highlighted[1].ability["stam_Mime"]) then
            return true 
        else
            return false
        end
    end
}

SMODS.Consumable {
    key = 'entropy',
    set = 'Spectral',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = {x = 8, y = 4},
    loc_txt = {
        name = "乱序",
		text = {
			"选择一个{C:attention}小丑{}",
			"添加{C:blue}混沌邮戳{}"
		},
    },
    atlas = "MoreConsumables1",
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Chaos',
            specific_vars = {}
        }
        return {vars = {}}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local conv_card = G.jokers.highlighted[1]
	G.E_MANAGER:add_event(Event({func = function()
		play_sound('tarot1')
		used_tarot:juice_up(0.3, 0.5)
		return true end }))
	
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        SMODS.Stickers["stam_Chaos"]:apply(conv_card, true)
        conv_card:juice_up(0.3, 0.5)
		return true end }))
	
	delay(0.5)
    end,      
    can_use = function(self, card)
        if #G.jokers.highlighted == 1 and not (G.jokers.highlighted[1].ability["stam_Jimbo"] or G.jokers.highlighted[1].ability["stam_Todd"] or G.jokers.highlighted[1].ability["stam_Steven"] or G.jokers.highlighted[1].ability["stam_Mrbones"] or G.jokers.highlighted[1].ability["stam_Chaos"] or G.jokers.highlighted[1].ability["stam_Andy"] or G.jokers.highlighted[1].ability["stam_Green"] or G.jokers.highlighted[1].ability["stam_Mime"]) then
            return true 
        else
            return false
        end
    end
}

SMODS.Consumable {
    key = 'bones',
    set = 'Spectral',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = {x = 2, y = 1},
    loc_txt = {
        name = "死斗",
		text = {
			"选择一个{C:attention}小丑{}",
			"添加{C:blue}骷髅邮戳{}"
		},
    },
    atlas = "MoreConsumables1",
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Mrbones',
            specific_vars = {}
        }
        return {vars = {}}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local conv_card = G.jokers.highlighted[1]
	G.E_MANAGER:add_event(Event({func = function()
		play_sound('tarot1')
		used_tarot:juice_up(0.3, 0.5)
		return true end }))
	
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        SMODS.Stickers["stam_Mrbones"]:apply(conv_card, true)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
        conv_card:juice_up(0.3, 0.5)
		return true end }))
	
	delay(0.5)
    end,      
    can_use = function(self, card)
        if #G.jokers.highlighted == 1 and not (G.jokers.highlighted[1].ability["stam_Jimbo"] or G.jokers.highlighted[1].ability["stam_Todd"] or G.jokers.highlighted[1].ability["stam_Steven"] or G.jokers.highlighted[1].ability["stam_Mrbones"] or G.jokers.highlighted[1].ability["stam_Chaos"] or G.jokers.highlighted[1].ability["stam_Andy"] or G.jokers.highlighted[1].ability["stam_Green"] or G.jokers.highlighted[1].ability["stam_Mime"]) then
            return true 
        else
            return false
        end
    end
}

SMODS.Consumable {
    key = 'wonder',
    set = 'Spectral',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = {x = 9, y = 4},
    loc_txt = {
        name = "好奇",
		text = {
			"选择一个{C:attention}小丑{}",
			"添加{C:blue}安迪邮戳{}"
		},
    },
    atlas = "MoreConsumables1",
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Andy',
            specific_vars = {}
        }
        return {vars = {}}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local conv_card = G.jokers.highlighted[1]
	G.E_MANAGER:add_event(Event({func = function()
		play_sound('tarot1')
		used_tarot:juice_up(0.3, 0.5)
		return true end }))
	
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        SMODS.Stickers["stam_Andy"]:apply(conv_card, true)
        conv_card:juice_up(0.3, 0.5)
		return true end }))
	
	delay(0.5)
    end,      
    can_use = function(self, card)
        if #G.jokers.highlighted == 1 and not (G.jokers.highlighted[1].ability["stam_Jimbo"] or G.jokers.highlighted[1].ability["stam_Todd"] or G.jokers.highlighted[1].ability["stam_Steven"] or G.jokers.highlighted[1].ability["stam_Mrbones"] or G.jokers.highlighted[1].ability["stam_Chaos"] or G.jokers.highlighted[1].ability["stam_Andy"] or G.jokers.highlighted[1].ability["stam_Green"] or G.jokers.highlighted[1].ability["stam_Mime"]) then
            return true 
        else
            return false
        end
    end
}

SMODS.Consumable {
    key = 'green',
    set = 'Spectral',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = {x = 3, y = 1},
    loc_txt = {
        name = "尖叫",
		text = {
			"选择一个{C:attention}小丑{}",
			"添加{C:blue}绿色邮戳{}"
		},
    },
    atlas = "MoreConsumables1",
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Green',
            specific_vars = {}
        }
        return {vars = {}}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local conv_card = G.jokers.highlighted[1]
	G.E_MANAGER:add_event(Event({func = function()
		play_sound('tarot1')
		used_tarot:juice_up(0.3, 0.5)
		return true end }))
	
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        SMODS.Stickers["stam_Green"]:apply(conv_card, true)
        conv_card:juice_up(0.3, 0.5)
		return true end }))
	
	delay(0.5)
    end,      
    can_use = function(self, card)
        if #G.jokers.highlighted == 1 and not (G.jokers.highlighted[1].ability["stam_Jimbo"] or G.jokers.highlighted[1].ability["stam_Todd"] or G.jokers.highlighted[1].ability["stam_Steven"] or G.jokers.highlighted[1].ability["stam_Mrbones"] or G.jokers.highlighted[1].ability["stam_Chaos"] or G.jokers.highlighted[1].ability["stam_Andy"] or G.jokers.highlighted[1].ability["stam_Green"] or G.jokers.highlighted[1].ability["stam_Mime"]) then
            return true 
        else
            return false
        end
    end
}

SMODS.Consumable {
    key = 'mime',
    set = 'Spectral',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = {x = 1, y = 1},
    loc_txt = {
        name = "默剧",
		text = {
			"选择一个{C:attention}小丑{}",
			"添加{C:blue}哑剧邮戳{}"
		},
    },
    atlas = "MoreConsumables1",
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'stam_Mime',
            specific_vars = {}
        }
        return {vars = {}}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local conv_card = G.jokers.highlighted[1]
	G.E_MANAGER:add_event(Event({func = function()
		play_sound('tarot1')
		used_tarot:juice_up(0.3, 0.5)
		return true end }))
	
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        SMODS.Stickers["stam_Mime"]:apply(conv_card, true)
        conv_card:juice_up(0.3, 0.5)
		return true end }))
	
	delay(0.5)
    end,      
    can_use = function(self, card)
        if #G.jokers.highlighted == 1 and not (G.jokers.highlighted[1].ability["stam_Jimbo"] or G.jokers.highlighted[1].ability["stam_Todd"] or G.jokers.highlighted[1].ability["stam_Steven"] or G.jokers.highlighted[1].ability["stam_Mrbones"] or G.jokers.highlighted[1].ability["stam_Chaos"] or G.jokers.highlighted[1].ability["stam_Andy"] or G.jokers.highlighted[1].ability["stam_Green"] or G.jokers.highlighted[1].ability["stam_Mime"]) then
            return true 
        else
            return false
        end
    end
}
----------------------------------------------
------------MOD CODE END----------------------

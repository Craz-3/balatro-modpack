SMODS.Consumable{
    key = "c_reverse_fool",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 9, y = 2},
    loc_txt = {
        name = 'The Fool?',
        text = {
            "Creates {C:attention}inverted{} version of last",
            "{C:tarot}Tarot{}, card used this run.",
            "{C:planet}Planets{} become {C:reverse_zodiac}Zodiacs{} and vice versa",
            "converts in collection order",
            "{s:0.8,C:tarot}The Fool(?){s:0.8} excluded",
            "{C:attention}Created card: #1#{}"
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_fool'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_fool'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_fool'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        local fool_c = G.GAME.last_tarot_planet and G.P_CENTERS[G.GAME.last_tarot_planet] or nil
        local last_tarot_planet = fool_c and localize{type = 'name_text', key = fool_c.key, set = fool_c.set} or localize('k_none')
        local colour = (not fool_c or fool_c.name == 'The Fool') and G.C.RED or G.C.GREEN
        local new_card = nil
        main_end = {
            {n=G.UIT.C, config={align = "bm", padding = 0.02}, nodes={
                {n=G.UIT.C, config={align = "m", colour = colour, r = 0.05, padding = 0.05}, nodes={
                    {n=G.UIT.T, config={text = ' '..last_tarot_planet..' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true}},
                }}
            }}
        }
        if not (not fool_c or fool_c.name == 'The Fool' or fool_c.name == 'c_reverse_c_reverse_fool') then
            if fool_c.mod then --acts like normal Fool on modded cards
                if fool_c.mod.id ~= "reverse_tarot" then
                    info_queue[#info_queue+1] = fool_c
                    return {vars = {fool_c.loc_txt and fool_c.loc_txt.name or fool_c.name}}
                end
            end
            local words = {}
            for w in fool_c.key:gmatch("([^_]+)") do
                table.insert(words, w) 
            end
            local final_word = words[#words]
            if final_word == "priestess" then
                final_word = "high_priestess"
            elseif final_word == "fortune" then
                final_word = "wheel_of_fortune"
            elseif final_word == "man" then
                final_word = "hanged_man"
            end
            if fool_c.loc_txt then --if the current card is a reverse tarot
                new_card = G.P_CENTERS["c_" .. final_word]
            elseif fool_c.set ~= "Planet" then
                new_card = G.P_CENTERS["c_reverse_c_reverse_" .. final_word]
            end
            if fool_c.set == "Planet" then
                for i, v in ipairs(G.GAME.fool_table) do
                    if fool_c.key == v then new_card = G.P_CENTERS[G.GAME.fool_table[i+13]] break end
                end
            elseif fool_c.set == "reverse_zodiac" then
                for i, v in ipairs(G.GAME.fool_table) do
                    if fool_c.key == v then new_card = G.P_CENTERS[G.GAME.fool_table[i-13]] break end
                end
            end
            info_queue[#info_queue+1] = new_card
        end
        if new_card then
            if new_card.loc_txt then
                return {vars = {new_card.loc_txt.name}}
            else
                return {vars = {new_card.name}}
            end
        end
        return {vars = {"none"}}
    end,
    can_use = function(self, card)
        local fool_c = G.GAME.last_tarot_planet and G.P_CENTERS[G.GAME.last_tarot_planet] or nil
        local last_tarot_planet = fool_c and localize{type = 'name_text', key = fool_c.key, set = fool_c.set} or localize('k_none')
        local colour = (not fool_c or fool_c.name == 'The Fool') and G.C.RED or G.C.GREEN
        main_end = {
            {n=G.UIT.C, config={align = "bm", padding = 0.02}, nodes={
                {n=G.UIT.C, config={align = "m", colour = colour, r = 0.05, padding = 0.05}, nodes={
                    {n=G.UIT.T, config={text = ' '..last_tarot_planet..' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true}},
                }}
            }}
        }
        if not (not fool_c or fool_c.name == 'The Fool' or fool_c.name == 'c_reverse_c_reverse_fool') then
            return true
        end
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                local fool_c = G.GAME.last_tarot_planet and G.P_CENTERS[G.GAME.last_tarot_planet] or nil
                local words = {}
                for w in fool_c.key:gmatch("([^_]+)") do
                    table.insert(words, w) 
                end
                local final_word = words[#words]
                if final_word == "priestess" then
                    final_word = "high_priestess"
                elseif final_word == "fortune" then
                    final_word = "wheel_of_fortune"
                elseif final_word == "man" then
                    final_word = "hanged_man"
                end
                if fool_c.mod then --acts like normal Fool on modded cards
                    if fool_c.mod.id ~= "reverse_tarot" then
                        local card = create_card('Tarot_Planet', G.consumeables, nil, nil, nil, nil, G.GAME.last_tarot_planet, 'fool')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        return true
                    end
                end
                if fool_c.set == "Planet" then
                    for i, v in ipairs(G.GAME.fool_table) do
                        if fool_c.key == v then
                            local card = create_card('Tarot_Planet', G.consumeables, nil, nil, nil, nil, G.GAME.fool_table[i+13], 'fool')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            return true
                        end
                    end
                elseif fool_c.set == "reverse_zodiac" then
                    for i, v in ipairs(G.GAME.fool_table) do
                        if fool_c.key == v then
                            local card = create_card('Tarot_Planet', G.consumeables, nil, nil, nil, nil, G.GAME.fool_table[i-13], 'fool')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            return true
                        end
                    end
                end
                if fool_c.loc_txt then -- if the most recently used card was a Reverse Tarot
                    local card = create_card('Tarot_Planet', G.consumeables, nil, nil, nil, nil, "c_" .. final_word, 'fool')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                elseif fool_c.set ~= "Planet" then
                    local card = create_card('Tarot_Planet', G.consumeables, nil, nil, nil, nil, "c_reverse_c_reverse_" .. final_word, 'fool')
                    card:add_to_deck()
                    G.consumeables:emplace(card)    
                else
                    local card = create_card('Tarot_Planet', G.consumeables, nil, nil, nil, nil, G.GAME.last_tarot_planet, 'fool')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                end
            end
            return true end }))
        delay(0.6)
    end
}

SMODS.Consumable{
    key = "c_reverse_magician",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 8, y = 2},
    loc_txt = {
        name = "The Magician?",
        text = {
            "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#s"
        }
    },
    config = { context =
        {
            mod_conv = 'Counterfeit Card',
            max_highlighted = 2
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_magician'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_magician'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_magician'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_counterfeit
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 2 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_counterfeit"]);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_high_priestess",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 7, y = 2},
    loc_txt = {
        name = "The High Priestess?",
        text = {
            "Creates #1# {C:planet}Planet{}",
                    "card for your",
                    "{:attention}highest levelled hand{}:",
                    "{C:planet}#2#{}"
        }
    },
    config = { context =
        {
            number_planets = 1
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_high_priestess'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_high_priestess'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_high_priestess'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        local highest_level = 0
        local highest_hand = 'High Card'
        for k, v in pairs(G.GAME.hands) do
            if type(G.GAME.hands[k].level) == "table" then --Talisman compatibility by revoo_.
                if to_number(G.GAME.hands[k].level) >= highest_level and to_number(G.GAME.hands[k].level) > 1 then
                    highest_hand = k
                    highest_level = to_number(G.GAME.hands[k].level)
                end
            else
                if G.GAME.hands[k].level >= highest_level and G.GAME.hands[k].level > 1 then
                    highest_hand = k
                    highest_level = G.GAME.hands[k].level
                end
            end
        end
        local planet_name = nil
        for k, v in pairs(G.P_CENTERS) do
            if G.P_CENTERS[k].config then
                if G.P_CENTERS[k].config.hand_type then
                    if G.P_CENTERS[k].config.hand_type == highest_hand then
                        planet_name = k
                    end
                end
            end
        end
        info_queue[#info_queue+1] = G.P_CENTERS[planet_name]
        return {vars = {center.ability.context.number_planets, highest_hand}}
    end,
    can_use = function(self, card) --Fix this condition???
        if #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables then
            return true
        end
    end,
    use = function(self, card, area, copier)
        local highest_level = 0
        local highest_hand = 'High Card'
        for k, v in pairs(G.GAME.hands) do
            if type(G.GAME.hands[k].level) == "table" then
                if to_number(G.GAME.hands[k].level) >= highest_level and to_number(G.GAME.hands[k].level) > 1 then
                    highest_hand = k
                    highest_level = to_number(G.GAME.hands[k].level)
                end
            else
                if G.GAME.hands[k].level >= highest_level and G.GAME.hands[k].level > 1 then
                    highest_hand = k
                    highest_level = G.GAME.hands[k].level
                end
            end
        end
        local planet_name = nil
        for k, v in pairs(G.P_CENTERS) do
            if G.P_CENTERS[k].config then
                if G.P_CENTERS[k].config.hand_type then
                    if G.P_CENTERS[k].config.hand_type == highest_hand then
                        planet_name = k
                    end
                end
            end
        end
        local card = create_card('Tarot_Planet', G.consumeables, nil, nil, nil, nil, planet_name, 'pri')
        card:add_to_deck()
        G.consumeables:emplace(card)
    end
}

SMODS.Consumable{
    key = "c_reverse_empress",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 6, y = 2},
    loc_txt = {
        name = "The Empress?",
        text = {
            "Enhances {C:attention}#1#{}",
                "selected cards to",
                "{C:attention}#2#s"
        }
    },
    config = { context =
        {
            mod_conv = 'Held Mult Card',
            max_highlighted = 2
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_empress'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_empress'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_empress'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_held_mult
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 2 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_held_mult"]);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_emperor",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 5, y = 2},
    loc_txt = {
        name = "The Emperor?",
        text = {
            "Creates up to {C:attention}#1#",
            "random {C:tarot}Reverse Tarot{} cards",
            "{C:inactive}(Must have room){}",
        }
    },
    config = { context =
        {
            number_cards = 2
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_emperor'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_emperor'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_emperor'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.context.number_cards}}
    end,
    can_use = function(self, card) --Fix this condition???
        if #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables then
            return true
        end
    end,
    use = function(self, card, area, copier)
        --see .toml for injection
        for i = 1, math.min(card.ability.context.number_cards, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'remp')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                end
                return true end }))
        end
        delay(0.6)
    end
}

SMODS.Consumable{
    key = "c_reverse_heirophant",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 4, y = 2},
    loc_txt = {
        name = "The Heirophant?",
        text = {
            "Enhances {C:attention}#1#{}",
                "selected cards to",
                "{C:attention}#2#s"
        }
    },
    config = { context =
        {
            mod_conv = 'Held Bonus Card',
            max_highlighted = 2
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_heirophant'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_heirophant'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_heirophant'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_held_bonus
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 2 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_held_bonus"]);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_lovers",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 3, y = 2},
    loc_txt = {
        name = "The Lovers?",
        text = {
            "Enhances {C:attention}#1#{}",
                "selected card to a",
                "{C:attention}#2#{}"
        }
    },
    config = { context =
        {
            mod_conv = 'Omnirank Card',
            max_highlighted = 1
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_lovers'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_lovers'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_lovers'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_omnirank
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 1 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_omnirank"])
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_chariot",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 2, y = 2},
    loc_txt = {
        name = "The Chariot?",
        text = {
            "Enhances {C:attention}#1#{}",
                "selected card to a",
                "{C:attention}#2#{}"
        }
    },
    config = { context =
        {
            mod_conv = 'Copper Card',
            max_highlighted = 1
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_chariot'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_chariot'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_chariot'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_copper
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 1 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_copper"]);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_justice",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 1, y = 2},
    loc_txt = {
        name = "Justice?",
        text = {
            "Enhances {C:attention}#1#{}",
                "selected card to a",
                "{C:attention}#2#{}"
        }
    },
    config = { context =
        {
            mod_conv = 'Crystal Card',
            max_highlighted = 1
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_justice'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_justice'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_justice'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_crystal
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 1 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_crystal"]);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_hermit",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 0, y = 2},
    loc_txt = {
        name = "The Hermit?",
        text = {
            "Sets money equal",
            "to {C:money}$#1#{}"
        }
    },
    config = { context =
        {
            dollars = 20
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_hermit'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_hermit'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_hermit'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.context.dollars}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        ease_dollars(-G.GAME.dollars + 20, true)
    end
}

SMODS.Consumable{
    key = "c_reverse_wheel_of_fortune",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 9, y = 1},
    loc_txt = {
        name = "Wheel of Fortune?",
        text = {
            "{C:green}#1# in #2#{} chance to add",
            "Add {C:dark_edition}Foil{}, {C:dark_edition}Holographic{},",
                "or {C:dark_edition}Polychrome{} effect to",
                "{C:attention}1{} random card in hand",
        }
    },
    config = { context =
        {
            edition_odds = 4
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_wheel_of_fortune'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_wheel_of_fortune'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_wheel_of_fortune'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        info_queue[#info_queue+1] = G.P_CENTERS.e_holo
        info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
        return {vars = { G.GAME.probabilities.normal, center.ability.context.edition_odds}}
    end,
    can_use = function(self, card)
        if #G.hand.cards >= 1 then
            return true
        end
    end,
    use = function(self, card, area, copier)
        if pseudorandom('rwheel') < G.GAME.probabilities.normal/4 then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                local temp_pool = {}
                for k, v in pairs(G.hand.cards) do
                    if (not v.edition) then
                        table.insert(temp_pool, v)
                    end
                end
                local eligible_card = pseudorandom_element(temp_pool, pseudoseed("Wheel of Fortune?"))
                local edition = poll_edition('wheel_of_fortune', nil, true, true)
                eligible_card:set_edition(edition, true)
                card:juice_up(0.3, 0.5)
            return true end }))
        else
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                attention_text({
                    text = localize('k_nope_ex'),
                    scale = 1.3, 
                    hold = 1.4,
                    major = card,
                    backdrop_colour = G.C.SECONDARY_SET.Tarot,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                    silent = true
                    })
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
            return true end }))
        end
    end
}

SMODS.Consumable{
    key = "c_reverse_strength",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 8, y = 1},
    loc_txt = {
        name = "Strength?",
        text = {
            "Decreases rank of",
            "up to {C:attention}#1#{} selected",
            "cards by {C:attention}1",
        }
    },
    config = { context =
        {
            max_highlighted = 2
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_fool'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_strength'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_strength'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.context.max_highlighted}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 2 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                local card = G.hand.highlighted[i]
                local suit_prefix = string.sub(card.base.suit, 1, 1)..'_'
                local rank_suffix = card.base.id == 2 and 14 or card.base.id - 1
                if rank_suffix < 10 then rank_suffix = tostring(rank_suffix)
                elseif rank_suffix == 10 then rank_suffix = 'T'
                elseif rank_suffix == 11 then rank_suffix = 'J'
                elseif rank_suffix == 12 then rank_suffix = 'Q'
                elseif rank_suffix == 13 then rank_suffix = 'K'
                elseif rank_suffix == 14 then rank_suffix = 'A'
                end
                card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
            return true end }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_hanged_man",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 7, y = 1},
    loc_txt = {
        name = "The Hanged Man?",
        text = {
            "Create {C:attention}#1#{} random",
            "{C:attention}Enhanced card{}",
            "added to your hand",
        }
    },
    config = { context =
        {
            number_cards = 1
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_hanged_man'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_hanged_man'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_hanged_man'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.context.number_cards}}
    end,
    can_use = function(self, card)
        if #G.hand.cards >= 1 then
            return true
        end
    end,
    use = function(self, card, area, copier)
        local _suit, _rank = nil, nil
        _rank = pseudorandom_element({'2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A'}, pseudoseed('reverse_hanged_man_create'))
        _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('reverse_hanged_man_create'))
        _suit = _suit or 'S'; _rank = _rank or 'A'
        local cen_pool = {}
        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
            if v.key ~= 'm_stone' and v.key ~= 'm_reverse_marble' then 
                cen_pool[#cen_pool+1] = v
            end
        end
        create_playing_card({front = G.P_CARDS[_suit..'_'.._rank], center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
        playing_card_joker_effects({true})
    end
}

SMODS.Consumable{
    key = "c_reverse_death",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 6, y = 1},
    loc_txt = {
        name = "Death?",
        text = {
            "Select {C:attention}#1#{} cards,",
            "convert the {C:attention}right{} card",
            "into the {C:attention}left{} card",
            "{C:inactive}(Drag to rearrange)",
        }
    },
    config = { context =
        {
            max_highlighted = 2
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_death'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_death'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_death'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.context.max_highlighted}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted == 2 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            return true end }))
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        local leftmost = G.hand.highlighted[2]
        for i=1, #G.hand.highlighted do if G.hand.highlighted[i].T.x < leftmost.T.x then leftmost = G.hand.highlighted[i] end end
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                if G.hand.highlighted[i] ~= leftmost then
                    copy_card(leftmost, G.hand.highlighted[i])
                end
            return true end }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_temperance",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 5, y = 1},
    loc_txt = {
        name = "Temperance?",
        text = {
            "Gives the total sell",
            "value of all current",
            "{C:attention}Playing cards{} in hand {C:inactive}(Max of {C:money}$#1#{C:inactive})",
            "{C:inactive}(Currently {C:money}$#2#{C:inactive})",
        }
    },
    config = { context =
        {
            max_money = 50
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_temperance'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_temperance'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_temperance'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        local money = 0
        if G.hand then
            for i = 1, #G.hand.cards do
                if G.hand.cards[i].ability.set then
                    money = money + G.hand.cards[i].sell_cost
                    if G.hand.cards[i].edition then
                        money = money + 1
                    end
                    if G.hand.cards[i].label ~= "Base Card" then
                        money = money + 1
                    end
                    if G.hand.cards[i].ability.seal then
                        money = money + 1
                    end
                end
            end
            money = math.min(money, 50)
            if #G.hand.cards >= 1 then
                return {vars = {center.ability.context.max_money, money}}
            end
        end
        return {vars = {center.ability.context.max_money, 0}}
    end,
    can_use = function(self, card)
        if G.hand then
            if #G.hand.cards >= 1 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        local money = 0
        for i = 1, #G.hand.cards do
            if G.hand.cards[i].ability.set then
                money = money + G.hand.cards[i].sell_cost
                if G.hand.cards[i].edition then
                    money = money + 1
                end
                if G.hand.cards[i].label ~= "Base Card" then
                    money = money + 1
                end
                if G.hand.cards[i].ability.seal then
                    money = money + 1
                end
            end
        end
        money = math.min(money, 50)
        ease_dollars(money, true)
    end
}

SMODS.Consumable{
    key = "c_reverse_devil",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 4, y = 1},
    loc_txt = {
        name = "The Devil?",
        text = {
            "Enhances {C:attention}#1#{}",
                "selected card to a",
                "{C:attention}#2#{}"
        }
    },
    config = { context =
        {
            mod_conv = 'Pyrite Card',
            max_highlighted = 1
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_devil'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_devil'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_devil'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_pyrite
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 1 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_pyrite"]);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_tower",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 3, y = 1},
    loc_txt = {
        name = "The Tower?",
        text = {
            "Enhances {C:attention}#1#{}",
                "selected card to a",
                "{C:attention}#2#{}"
        }
    },
    config = { context =
        {
            mod_conv = 'Marble Card',
            max_highlighted = 1
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_tower'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_tower'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_tower'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_marble
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 1 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_marble"]);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_star",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 2, y = 1},
    loc_txt = {
        name = "The Star?",
        text = {
            "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#s"
        }
    },
    config = { context =
        {
            mod_conv = 'Secondary Diamond',
            max_highlighted = 2
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_star'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_star'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_star'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_secondary_diamond
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 2 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_secondary_diamond"]);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_moon",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 1, y = 1},
    loc_txt = {
        name = "The Moon?",
        text = {
            "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#s"
        }
    },
    config = { context =
        {
            mod_conv = 'Secondary Club',
            max_highlighted = 2
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_moon'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_moon'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_moon'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_secondary_club
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 2 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_secondary_club"]);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_sun",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 0, y = 1},
    loc_txt = {
        name = "The Sun?",
        text = {
            "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#s"
        }
    },
    config = { context =
        {
            mod_conv = 'Secondary Heart',
            max_highlighted = 2
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_sun'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_sun'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_sun'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_secondary_heart
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 2 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_secondary_heart"]);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}

SMODS.Consumable{
    key = "c_reverse_judgement",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 9, y = 0},
    loc_txt = {
        name = "Judgement?",
        text = {
            "Creates a random {C:dark_edition}Negative",
            "{C:attention}Joker{} card",
            "{C:inactive}(Is always {}{C:attention}Ephemeral{}{C:inactive})",
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_judgement'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_judgement'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_judgement'].pos)
        end
    end,
    config = { context ={}},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        info_queue[#info_queue+1] = {set = "Other", key = "reverse_ephemeral", specific_vars = {}}
        return {}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local new_card = nil
        if pseudorandom('legendary') < 0.01 then
            new_card = SMODS.create_card({area = G.jokers, set = "Joker", edition = 'e_negative', legendary = true})
        else
            new_card = SMODS.create_card({area = G.jokers, set = "Joker", edition = 'e_negative'})
        end
        SMODS.Stickers.reverse_ephemeral:apply(new_card, true)
        new_card:add_to_deck()
        G.jokers:emplace(new_card)
        --[[
        local new_card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil)
        new_card:set_edition('e_negative')
        new_card:add_to_deck()
        G.jokers:emplace(new_card)
        ]]
    end
}

SMODS.Consumable{
    key = "c_reverse_world",
    set = "Tarot",
    atlas = "Reverse_Tarots",
    pos = {x = 8, y = 0},
    loc_txt = {
        name = "The World?",
        text = {
            "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#s"
        }
    },
    config = { context =
        {
            mod_conv = 'Secondary Spade',
            max_highlighted = 2
        }
    },
    discovered = true,
    set_sprites = function(self, card, front)
        if G.P_CENTERS['c_world'].atlas and card.config.center.discovered then
            card.children.center.atlas = G.ASSET_ATLAS[G.P_CENTERS['c_world'].atlas]
            card.children.center:set_sprite_pos(G.P_CENTERS['c_world'].pos)
        end
    end,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_reverse_secondary_spade
        return {vars = {center.ability.context.max_highlighted, center.ability.context.mod_conv}}
    end,
    can_use = function(self, card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= 2 then
                return true
            end
        end
    end,
    use = function(self, card, area, copier)
        play_sound('tarot1')
        for i = 1, #G.hand.highlighted do --flips cards
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip();
                    play_sound('card1', percent);
                    G.hand.highlighted[i]:juice_up(0.3, 0.3);
                    return true
                end
            }))
        end
        delay(0.5)
        for i = 1, #G.hand.highlighted do --enhances cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_reverse_secondary_spade"]);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do --unflips cards
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                     G.hand.highlighted[i]:flip();
                     play_sound('tarot2', percent, 0.6);
                     G.hand.highlighted[i]:juice_up(0.3, 0.3);
                     return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all();
            return true
        end })) --unselects cards
        delay(0.5)
    end
}
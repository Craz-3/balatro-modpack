SMODS.Achievement{
    key = "spell_aikoyori",
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "akyrs_spell_word" and args.lowercase_word == "aikoyori") then
            return true
        end
    end
}
SMODS.Achievement{
    key = "happy_ghast_grown",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "akyrs_happy_ghast_grown_from_dried") then
            return true
        end
    end
}
SMODS.Achievement{
    key = "repeater_into_another_one",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "akyrs_repeater_into_another_one") then
            return true
        end
    end
}

SMODS.Achievement{
    key = "repeater_into_another_one",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "akyrs_repeater_into_another_one") then
            return true
        end
    end
}

SMODS.Achievement{
    key = "both_pickaxe",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "akyrs_both_pickaxe") then
            return true
        end
    end
}
SMODS.Achievement{
    key = "win_klondike",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "akyrs_win_solitaire") then
            return true
        end
    end
}
local very_long_words = {
    ["antidisestablishmentarianism"] = true,
    ["pneumonoultramicroscopicsilicovolcanoconiosis"] = true,
    ["pseudopseudohypoparathyroidism"] = true,
    ["supercalifragilisticexpialidocious"] = true,
    ["hippopotomonstrosesquippedaliophobia"] = true,
    ["honorificabilitudinitatibus"] = true,
}
SMODS.Achievement{
    key = "spell_very_long_word",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "akyrs_spell_valid_word" and (very_long_words[args.lowercase_word] or string.len(args.lowercase_word) >= 25)) then
            return true
        end
    end
}
SMODS.Achievement{
    key = "spell_long_word",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "akyrs_spell_valid_word" and string.len(args.lowercase_word) >= 12) then
            return true
        end
    end
}
SMODS.Achievement{
    key = "we_no_speak_americano",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "win") then
            if G.GAME.akyrs_has_not_spelled_a_single_word then
                return true
            end
        end
    end
}
SMODS.Achievement{
    key = "resist_the_temptation",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "win") then
            if G.GAME.akyrs_temptation_resisted then
                return true
            end
        end
    end
}

SMODS.Achievement{
    key = "thatll_be_5_wheat",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
        if args and (args.type == "full_emerald_in_slot") then
            return true
        end
    end
}

SMODS.Achievement{
    key = "div_0_math",
    bypass_all_unlocked = true,
    hidden_name = false,
    hidden_text = true,
    unlock_condition = function (self, args)
        if args and (args.type == "akyrs_division_by_zero") then
            return true
        end
    end
}

SMODS.Achievement{
    key = "average_daily_scrandle",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
    end
}

SMODS.Achievement{
    key = "literally_cryptid",
    bypass_all_unlocked = true,
    unlock_condition = function (self, args)
    end
}

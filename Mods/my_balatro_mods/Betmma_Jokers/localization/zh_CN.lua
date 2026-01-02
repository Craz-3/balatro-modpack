return {
    descriptions = {
        Joker = {
            betm_jokers_j_jjookkeerr = {
                name = "小小小小丑丑丑丑",
                text = {
                    "名字中包含 \"Joker\"",
                    "的小丑牌，",
                    "每个给予 {X:mult,C:white} X#1# {} 倍率",
                }
            },
            betm_jokers_j_ascension = {
                name = "升变",
                text = {
                    "出的手牌被视为",
                    "更高一级的牌型",
                    "(例如：高牌视为对子)",
                }
            },
            betm_jokers_j_hasty = {
                name = "急速小丑",
                text = {
                    "如果回合在",
                    "第一手牌后结束，赚取 {C:money}$#1#{}",
                }
            },
            betm_jokers_j_errorr = {
                name = "错误误误",
                text = {
                    "弃掉的牌有",
                    "{C:green}#1# / #2#{} 的几率",
                    "变为随机点数"
                }
            },
            betm_jokers_j_piggy_bank = {
                name = " 存钱罐 ",
                text = {
                    "将赚取的金钱的一半",
                    "存入此小丑中",
                    "存入的每 {C:money}$1{}，",
                    "获得 {C:red}+#2#{} 倍率",
                    "{C:inactive}(当前为 {C:red}+#1#{C:inactive} 倍率)"
                }
            },
            betm_jokers_j_housing_choice = {
                name = "住房选择",
                text = {
                    "每 Ante 一次，如果出的手牌",
                    "包含 {C:attention}葫芦{}，获得一张随机",
                    "{C:attention}券{}",
                    "{C:inactive}(#1#)"
                }
            },
            betm_jokers_j_jimbow = {
                name = "金博之弓",
                text = {
                    "此小丑获得 {C:chips}+#2#{} 筹码，",
                    "条件为：{C:attention}#3#{}，",
                    "达成后条件会改变",
                    "{C:inactive}(当前为 {C:chips}#1#{C:inactive} 筹码)",
                }
            },
            betm_jokers_j_gameplay_update = {
                name = "游戏更新",
                text = {
                    "如果出的手牌正好包含",
                    "{C:attention}2 张方片{}、{C:attention}0 张黑桃{}、",
                    "{C:attention}2 张红桃{} 或 {C:attention}5 张梅花{}，",
                    "每满足一个条件，使右侧小丑的数值提升 {C:attention}#1#%{}",
                }
            },
            betm_jokers_j_flying_cards = {
                name = "飞牌",
                text = {
                    "每当{C:attention}牌{}计分或被弃掉时，此小丑获得",
                    "{X:mult,C:white} X(n+#2#)^-#1# {} 倍率，其中 {C:attention}n{}",
                    "等于牌组中剩余的牌数",
                    "{C:inactive}(当前为 {X:mult,C:white} X#3# {C:inactive} 倍率)",
                }
            },
            betm_jokers_j_friends_of_jimbo = {
                name = "金博的朋友们",
                text = {
                    "每当 {C:spades}黑桃K{}、{C:diamonds}方片Q{}、",
                    "{C:hearts}红桃J{} 或 {C:clubs}梅花K{} 计分时，",
                    "生成一个 {C:attention}金博{}",
                    "{C:inactive}(无需空位)",
                }
            },
            betm_jokers_j_balatro_mobile = {
                name = "Balatro 移动端",
                text = {
                    "此小丑是{C:attention}移动的{}，可以放在任何地方。",
                    "#2#",
                    "#3#",
                    "{C:inactive}(拖动它来查看效果)",
                }
            },
        }
    }
}

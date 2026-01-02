return {
    misc = {
        dictionary = {
            -- 按钮文本
            b_burn = "焚烧",
            b_trick = "戏法",
            b_cry = "哭泣",
            b_fall = "坠落",
            b_exhaust = "耗尽",
            b_exchange = "交换",

            -- ConsumableType 类型名称
            k_action = "行动",
            b_action_cards = "行动牌"
        }
    },
    descriptions = {
        -- 未发现卡牌描述
        Other = {
            undiscovered_action = {
                name = "未发现",
                text = {
                    "在无种子的游戏中",
                    "购买或使用此卡牌",
                    "以了解它的效果"
                }
            }
        },
        -- 行动卡牌描述 (使用 Action 作为 set 名称)
        Action = {
            c_act_hand = {
                name = "出牌",
                text = {
                    "{C:blue}-1{} 出牌次数",
                    "打出最多 {C:attention}5{} 张牌",
                    "{X:attention,C:white} 计分 {} 然后 {C:red}弃置{}",
                    "打出的牌",
                    "{C:inactive}（{C:attention}出牌{C:inactive}行动）"
                }
            },
            c_act_discard = {
                name = "弃牌",
                text = {
                    "{C:red}-1{} 弃牌次数",
                    "{C:red}弃置{}最多",
                    "{C:attention}5{} 张牌",
                    "{C:inactive}（{C:attention}弃牌{C:inactive}行动）"
                }
            },
            c_act_burn = {
                name = "焚烧",
                text = {
                    "{C:blue}-1{} 出牌次数，{C:red}-1{} 弃牌次数",
                    "{C:attention}销毁{}最多",
                    "{C:attention}3{} 张牌",
                    "{C:inactive}（{C:attention}弃牌{C:inactive}行动）"
                }
            },
            c_act_trick = {
                name = "戏法",
                text = {
                    "{C:red}-1{} 弃牌次数",
                    "从{C:attention}牌组{}中{C:attention}抽取{}",
                    "并{C:attention}增强{} {C:attention}2{} 张牌",
                    "{C:inactive}（{C:attention}弃牌{C:inactive}行动）"
                }
            },
            c_act_cry = {
                name = "哭泣",
                text = {
                    "{C:blue}-2{} 出牌次数",
                    "{X:attention,C:white} 计分 {} 获得{C:attention}剩余所需{}",
                    "{C:attention}筹码{}的 {C:blue}50%{}",
                    "{C:attention}销毁{}未选中的牌",
                    "{C:inactive}（{C:attention}出牌{C:inactive}行动）"
                }
            },
            c_act_fall = {
                name = "坠落",
                text = {
                    "{C:blue}-1{} 出牌次数，{C:red}-1{} 弃牌次数",
                    "打出最多 {C:attention}4{} 张牌",
                    "{C:attention}复制{}一张随机牌",
                    "{X:attention,C:white} 计分 {} 然后 {C:red}弃置{}",
                    "打出的牌",
                    "{C:inactive}（{C:attention}出牌{C:inactive}行动）"
                }
            },
            c_act_exhaust = {
                name = "耗尽",
                text = {
                    "{C:blue}-1{} 出牌次数，{C:red}-1{} 弃牌次数",
                    "打出最多 {C:attention}5{} 张牌",
                    "{X:attention,C:white} 计分 {} 然后 {C:red}弃置{}",
                    "打出的牌，{C:attention}牌组{}中的牌",
                    "计入基础{C:blue}筹码{}",
                    "{C:inactive}（{C:attention}出牌{C:inactive}行动）"
                }
            },
            c_act_exchange = {
                name = "交换",
                text = {
                    "{C:blue}+1{} 出牌次数，{C:red}-1{} 弃牌次数",
                    "花费 {C:money}$2{}",
                    "{C:inactive}（{C:attention}弃牌{C:inactive}行动）"
                }
            }
        }
    }
}

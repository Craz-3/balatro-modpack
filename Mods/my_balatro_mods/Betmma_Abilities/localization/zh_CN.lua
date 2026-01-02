return {
    descriptions = {
        Ability = {
            c_betm_abilities_GIL={
                name = "全局解释器锁",
                text = {
                    "如果所有小丑都是{C:attention}永恒{}的，移除",
                    "所有小丑的{C:attention}永恒{}属性。否则，",
                    "使所有小丑变为{C:attention}永恒{}属性。",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_glitched_seed={
                name = "故障种子",
                text = {
                    "接下来的 #5# 个{C:attention}随机事件",
                    "必定成功",
                    "(剩余次数：#4#)",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_rank_bump={
                name = "点数提升",
                text = {
                    "暂时提升所选牌的点数 1，",
                    "持续至本轮手牌结束",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_variable={
                name = "变量",
                text = {
                    "选择{C:attention}一些{}牌，设 {C:attention}X{}",
                    "为{C:attention}最右侧手牌{}的点数，然后",
                    "提升其它牌的点数 {C:attention}X{}",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_cached_hand={
                name = "缓存手牌",
                text = {
                    "下一次出牌的{C:attention}牌型{}被设为",
                    "上一次为 {C:attention}#4#{} 的牌型",
                    "(剩余次数：#5#)",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_heal={
                name = "治疗",
                text = {
                    "解除所选牌的减益状态，",
                    "持续至本轮手牌结束",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_absorber={
                name = "吸收器",
                text = {
                    "将{C:blue}出牌次数{}减少至 1，",
                    "每减少一次，获得 {X:mult,C:white}X#4#{} 倍率",
                    "当前倍率：{X:mult,C:white}X#5#{}",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_double_lift={
                name = "双重抽取",
                text = {
                    "在当前卡包中多选择 {C:attention}#4#{} 张牌",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_recycle={
                name = "回收",
                text = {
                    "减少重投价格 {C:money}$#4#{}",
                    "冷却时间：{C:mult}$#1#/$#2# #3#{}"
                }
            },
            c_betm_abilities_glyph={
                name = "符文",
                text = {
                    "{C:attention}-#4#{} Ante，{C:money}-$#5#",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_colour={
                name = "色彩",
                text = {
                    "创建一个随机能力牌",
                    "{C:inactive}(必须有空位)",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_extract={
                name = "提取",
                text = {
                    "创建一张当前牌型的",
                    "{C:dark_edition}负片{} {C:planet}星球{}牌",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_endoplasm={
                name = "内质",
                text = {
                    "使一张随机{C:attention}消耗牌{}",
                    "变为{C:dark_edition}负片{}版本",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_pay2win={
                name = "氪金通关",
                text = {
                    "支付 {C:money}$#1#{} 使盲注规模变为 {X:mult,C:white}X#2#{C:attention}",
                    "并增加价格 {C:money}$#3#{}",
                    "价格在本轮结束时重置",
                    "冷却时间：无"
                }
            },
            c_betm_abilities_number={
                name = "数字",
                text = {
                    "选择一张{C:attention}数字牌{}将其摧毁，",
                    "并抽取 {C:attention}X{} 张牌，",
                    "{C:attention}X{} 等于该牌的点数",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_fog={
                name = "迷雾",
                text = {
                    "在本轮内，获得 {X:mult,C:white}X#4#{} 倍率，",
                    "但抽取的牌将{C:attention}背面向朝上{}",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_antinomy={
                name = "二律背反",
                text = {
                    "创建一张所选小丑的临时",
                    "{C:dark_edition}负片{} {C:attention}永恒{} 复制品，持续至本轮结束",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_enhancer={
                name = "强化器",
                text = {
                    "随机强化所选的小丑",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_zircon={
                name = "锆石",
                text = {
                    "{C:green}#4#%{} 几率创建一张 {C:legendary,E:1}传奇{} 小丑，",
                    "否则创建一张 {C:legendary,E:1}传奇{} 券",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            },
            c_betm_abilities_rental_slot={
                name = "租赁槽位",
                text = {
                    "{C:dark_edition}+#1#{} 小丑槽位。在每轮",
                    "结束之后失去 {C:money}$#2#{}",
                    "{C:blue}被动能力{}"
                }
            },
            c_betm_abilities_philosophy={
                name = "哲学",
                text = {
                    "{C:attention}+#1#{} 能力牌槽位",
                    "{C:blue}被动能力{}"
                }
            },
            c_betm_abilities_midas_touch={
                name = "迈达斯之触",
                text = {
                    "每当使用能力牌时，获得 {C:money}$#1#{}",
                    "{C:blue}被动能力{}"
                }
            },
            c_betm_abilities_thumb={
                name = "拇指",
                text = {
                    "如果出牌数量小于 5 张，每少一张牌，",
                    "每手牌获得 {C:attention}+#1#{} 次出牌次数",
                    "(上限为每次出牌 {C:attention}+0.80{})",
                    "{C:blue}被动能力{}"
                }
            },
            c_betm_abilities_shield={
                name = "盾牌",
                text = {
                    "{C:attention}手牌上限{} 不会",
                    "低于 {C:attention}#1#",
                    "{C:blue}被动能力{}"
                }
            },
            c_betm_abilities_shuffle={
                name = "洗牌",
                text = {
                    "如果没有余牌，将所有牌洗回牌组",
                    "{C:blue}被动能力{}"
                }
            },
            c_betm_abilities_dead_branch={
                name = "死枝",
                text = {
                    "当一张牌被{C:attention}摧毁{}时，添加一张带有",
                    "随机{C:attention}强化{}、{C:attention}蜡封{}和{C:attention}版本{}的随机牌到牌组中",
                    "{C:blue}被动能力{}"
                }
            },
            c_betm_abilities_decay={
                name = "衰变",
                text = {
                    "如果出的牌型得分{C:attention}低于盲注分数的 #1#%{}，",
                    "使{C:attention}盲注规模{}变为 {X:mult,C:white}X#2#{}",
                    "{C:blue}被动能力{}"
                }
            },
            c_betm_abilities_echo={
                name = "回响",
                text = {
                    "当一手牌中的{C:attention}第一张牌{}得分时，",
                    "将其一张临时{C:dark_edition}负片{}复制品加入手牌",
                    "{C:blue}被动能力{}"
                }
            }
        },
        Voucher = {
            v_betm_abilities_able = {
                name = "能干",
                text = { 
                    "{C:attention}+#1#{} 能力牌槽位"
                }
            },
            v_betm_abilities_capable = {
                name = "多才",
                text = { 
                    "{C:attention}+#1#{} 能力牌槽位"
                }
            },
            v_betm_abilities_cooled_down = {
                name = "冷静",
                text = { 
                    "能力牌冷却速度",
                    "加快 {C:green}#1#%{}"
                }
            },
            v_betm_abilities_cooled_below = {
                name = "冷彻",
                text = { 
                    "能力牌可以冷却至 {C:attention}负值{}",
                    "{C:inactive}(例如：-2/1 轮)"
                }
            },
        }
    },
    misc={
        dictionary={
            b_ability_cards = "能力牌",
            k_ability = "能力",
            k_decay = "衰变！",
            k_echo = "回响！",
            b_move_consumeable = "移动",
        }
    }
}

local mysthic_pack = {
  name = "神秘包",
  text = {
    "从最多{C:attention}#2#{}张{C:bplus_sigil}印记{}牌中",
    "选择{C:attention}#1#{}张",
    "立即使用",
  },
}

local enhancement_tarot_text = {
  "将最多{C:attention}#1#{}",
  "张选定的牌增强为",
  "{C:attention}#2#{}",
}

return {
  descriptions = {
    Back = {
      b_bplus_purple = {
        name = "紫色牌组",
        text = {
          "重抽时也会刷新{C:attention}补给包{}",
          "重抽成本增加{C:money}$#1#{}",
        },
      },
      b_bplus_illusion = {
        name = "幻象牌组",
        text = {
          "游戏牌拥有更多{C:chips}筹码{}",
          "开局时随机{C:attention}#1#{}张",
          "卡牌被摧毁",
        },
      },
      b_bplus_jokered = {
        name = "小丑牌组",
        text = {
          "开局拥有{C:money}$#1#{}、",
          "{C:attention,T:p_buffoon_jumbo_1}巨型小丑包{}",
          "和{C:attention,T:v_hone}磨刀石{}代金券",
        },
      },
      b_bplus_mysthical = {
        name = "神秘牌组",
        text = {
          "选择盲注时随机创建",
          "一张{C:bplus_sigil}印记{}牌",
          "{C:inactive}（需有空位）",
          "商店{C:attention}栏位{}和商店{C:attention}补给包{}",
          "{C:attention}槽位{}减少{C:attention}1{}个",
        },
      },
      b_bplus_random = {
        name = "随机牌组",
        text = {
          "开局拥有随机{C:attention}代金券{}",
          "和一张随机{C:blue}普通{}小丑牌",
          "每轮拥有随机的{C:blue}手牌次数{}",
        },
      },
    },

    Joker = {
      j_bplus_hungry = {
        name = "饥饿小丑",
        text = {
          "在{C:attention}商店结束{}时",
          "摧毁{C:attention}食物小丑{}",
          "来获得{X:mult,C:white} X#1# {}倍率",
          "{C:inactive}（当前 {X:mult,C:white} X#2# {C:inactive}倍率）",
        },
      },
      j_bplus_blackjack = {
        name = "21点",
        text = {
          "如果打出的手牌是{C:attention}21点{}",
          "（Blackjack），获得{C:chips}#1#{}筹码",
          "{C:inactive}（当前 {C:chips}+#2#{C:inactive}筹码）",
        },
      },
      j_bplus_calculator = {
        name = "计算器",
        text = {
          "如果打出的所有牌都是",
          "{C:attention}数字{}牌{C:inactive}（2到10）{}，",
          "将所有打出牌的点数总和",
          "加到{C:mult}倍率{}上",
        },
      },
      j_bplus_space_invader = {
        name = "空间入侵者",
        text = {
          "加入{C:attention}消耗牌槽位{}的",
          "{C:planet}星球牌{}将变为",
          "{C:dark_edition}负片{}",
        },
      },
      j_bplus_treasure_map = {
        name = "藏宝图",
        text = {
          "每触发{C:attention}#3#{}次，赚取{C:money}$#1#{}",
          "最高可达{C:money}$#2#{}",
          "{C:inactive}(#4#){}",
        },
      },
      j_bplus_magnifying_glass = {
        name = "放大镜",
        text = {
          "将每张打出的{C:attention}2{}和{C:attention}3{}",
          "筹码数值的{C:attention}三倍{}加到",
          "{C:chips}筹码{}总计中",
        },
      },
      j_bplus_crown = {
        name = "皇冠",
        text = {
          "打出{C:attention}同花大顺{}时",
          "获得{X:mult,C:white} X#1# {}倍率",
          "{C:inactive}（当前 {X:mult,C:white} X#2# {}{C:inactive}倍率）",
        },
      },
      j_bplus_pickpocket = {
        name = "扒手",
        text = {
          "开启任何{C:attention}补给包{}时",
          "可多选择一张牌",
        },
      },
      j_bplus_four_leaf_clover = {
        name = "四叶草",
        text = {
          "打出的手牌恰好包含",
          "{C:attention}4{}张{C:clubs}梅花{}后，",
          "所有{C:green,E:1,s:1.1}概率{}乘以{X:green,C:white} X4 {}",
          "在击败{C:attention}Boss盲注{}后失效",
        },
      },
      j_bplus_toilet = {
        name = "马桶",
        text = {
          "当弃掉{C:attention}同花{}牌型时，",
          "获得该手牌一半的{C:chips}筹码{}数值",
          "{s:0.8}每轮仅生效一次{}",
          "{C:inactive}（当前 {C:chips}+#1#{C:inactive}筹码）",
        },
      },
      j_bplus_boxer = {
        name = "拳击手",
        text = {
          "对于超过{C:attention}#2#{}次的",
          "剩余{C:blue}出牌次数{}，每张给予{X:mult,C:white} X#1# {}",
          "{C:inactive}（当前 {X:mult,C:white} X#3# {C:inactive}倍率）",
        },
      },
      j_bplus_memory_card = {
        name = "记忆卡",
        text = {
          "将剩余的{C:blue}出牌次数",
          "保存到下一轮",
          "{C:inactive}（已保存 {C:blue}#1#{C:inactive}/{C:blue}#2#{C:inactive}）",
        },
      },
      j_bplus_jim130 = {
        name = "小丑 JIM130",
        text = {
          "每次触发{C:attention}钢制牌{}时",
          "获得{X:mult,C:white} X#1# {}",
          "{C:inactive}（当前 {X:mult,C:white} X#2# {C:inactive}倍率）",
        },
      },
      j_bplus_archeologist = {
        name = "考古学家",
        text = {
          "你{C:attention}完整牌组{}中每有一张{C:spades}黑桃{}，",
          "获得{C:mult}#1#{}倍率",
          "{C:inactive}（当前 {C:mult}+#2#{C:inactive}倍率）",
        },
      },
      j_bplus_golden_cheese = {
        name = "黄金奶酪",
        text = {
          "回合结束时赚取{C:money}$#1#{}，",
          "每{C:attention}跳过{}一个盲注就会损失{C:money}$#2#{}",
        },
      },
      j_bplus_anonymous_mask = {
        name = "匿名面具",
        text = {
          "所有{C:attention}人头牌{}",
          "不会被{C:red}削弱{}",
        },
      },
      j_bplus_santa_claus = {
        name = "圣诞老人",
        text = {
          "每进行{C:attention}#1#{}轮游戏，回合结束时",
          "获得一张{C:dark_edition}负片{}{C:red}稀有{}小丑牌",
          "{C:inactive}(#2#)",
        },
      },
      j_bplus_shopping_bill = {
        name = "购物账单",
        text = {
          "回合结束时手中持有的每张{C:attention}数字{}牌",
          "都有{C:green}#1#/#2#{}几率赚取",
          "等同于其{C:attention}点数{}数值的{C:money}金钱{}",
        },
      },
      j_bplus_ufo = {
        name = "幽浮",
        text = {
          "商店结束时，{C:attention}消耗牌槽位{}中",
          "每有一张{C:attention}独特{}的{C:planet}星球牌{}，",
          "获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前 {C:chips}+#2#{C:inactive}筹码）",
        },
      },
      j_bplus_zombie_hand = {
        name = "僵尸之手",
        text = {
          "在最后一手牌中，将打出的",
          "{C:attention}牌组牌型{}等级提升{C:attention}#1#{}级",
        },
      },
      j_bplus_jackpot = {
        name = "大奖",
        text = {
          "每触发{C:attention}#2#{}次{C:attention}#3#{} {C:inactive}[#5#]时，",
          "获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前 {C:mult}+#4#{C:inactive}倍率）",
        },
      },
      j_bplus_snowman = {
        name = "雪人",
        text = {
          "{C:chips}+#1#{}筹码。{C:attention}手中持有{}的",
          "每张牌都会提供{C:chips}+#2#{}筹码，",
          "在回合结束时重置",
        },
      },
      j_bplus_trash_can = {
        name = "垃圾桶",
        text = {
          "重新触发所有卡牌的",
          "{C:red}弃牌{}能力",
        },
      },
      j_bplus_blacksmith = {
        name = "铁匠",
        text = {
          "增强卡牌时，获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前 {C:chips}+#2#{C:inactive}筹码）",
        },
      },
      j_bplus_wheel = {
        name = "车轮",
        text = {
          "每张被弃掉的牌提供{X:mult,C:white} X#1# {}，",
          "在打出手牌后重置",
          "{C:inactive}（当前 {X:mult,C:white} X#2# {C:inactive}倍率）",
        },
      },
      j_bplus_fragile = {
        name = "易碎品",
        text = {
          "{C:attention}玻璃牌{}在被{C:red}弃掉{}时",
          "也会被摧毁",
        },
      },
      j_bplus_stone_skipping = {
        name = "打水漂",
        text = {
          "{C:attention}石头牌{}触发时提供{X:mult,C:white} X#1# {}倍率，",
          "每张触发的{C:attention}石头牌{}增加{X:mult,C:white} X#2# {}，",
          "在打出手牌后重置",
        },
      },
      j_bplus_stone_carving = {
        name = "石雕",
        text = {
          "所有{C:attention}石头牌{}都被视为",
          "等级{C:attention}#1#{}的{V:1}#2#",
          "{s:0.8}卡牌每轮变化",
        },
      },
      j_bplus_chef = {
        name = "厨师",
        text = {
          "选择盲注时创建一张{C:attention}食物小丑",
          "{C:inactive}（需有空位）",
        },
      },
      j_bplus_potato_chips = {
        name = "薯片",
        text = {
          "{C:chips}+#1#{}筹码",
          "每张卡牌触发都会减少",
          "{C:chips}#2#{}筹码",
        },
      },
      j_bplus_membership_card = {
        name = "会员卡",
        text = {
          "减少{C:attention}高级卡{}",
          "购买成本{C:money}$#1#{}",
        },
      },
      j_bplus_art_exhibition = {
        name = "艺术展",
        text = {
          "打出的手牌中每有一张",
          "{C:attention}裱框卡{}，获得{C:chips}+#1#{}筹码",
          "{C:inactive}（当前 {C:chips}+#2#{C:inactive}筹码）",
        },
      },
      j_bplus_wizard = {
        name = "巫师",
        text = {
          "摧毁{C:attention}#1#{}张{C:inactive}[#2#]{}张牌后，",
          "选择盲注时随机创建一张{C:bplus_sigil}印记{}牌",
          "{C:inactive}（需有空位）",
        },
      },
      j_bplus_seller = {
        name = "卖家",
        text = {
          "回合结束时赚取右侧小丑",
          "的{C:attention}售出价值{}的金钱",
        },
      },
      j_bplus_chance_card = {
        name = "机会卡",
        text = {
          "有{C:green}#1#/#2#{}几率",
          "{C:attention}重新触发{}打出的牌",
        },
      },
      j_bplus_paper_shredder = {
        name = "碎纸机",
        text = {
          "打出手牌后，{C:red}摧毁{}打出的牌中",
          "{C:attention}最右边{}的一张，并获得{C:mult}+#1#{}倍率",
          "{C:inactive}（当前 {C:mult}+#2#{C:inactive}倍率）",
        },
      },
      j_bplus_meteor = {
        name = "流星",
        text = {
          "选择盲注时随机升级",
          "一个{C:attention}牌组牌型{}",
        },
      },
      j_bplus_jumbo = {
        name = "巨无霸",
        text = {
          "提供{X:mult,C:white} X#1# {}倍率。",
          "如果选择盲注时没有{C:attention}空位{}，",
          "则摧毁{C:attention}最右边{}的小丑",
        },
      },
      j_bplus_blured = {
        name = "模糊小丑",
        text = {
          "所有{V:1}#1#{}也被",
          "视为一张{V:2}#2#",
          "{s:0.8}每轮发生变化",
        },
      },
      j_bplus_murderer = {
        name = "杀人狂",
        text = {
          "当小丑被摧毁时",
          "获得{X:mult,C:white} X#1# {}倍率",
          "{C:inactive}（当前 {X:mult,C:white} X#2# {C:inactive}倍率）",
        },
      },
      j_bplus_scorched = {
        name = "烧焦小丑",
        text = {
          "当{C:attention}烧焦卡{}被烧毁时",
          "获得{X:mult,C:white} X#1# {}倍率",
          "{C:inactive}（当前 {X:mult,C:white} X#2# {C:inactive}倍率）",
        },
      },
      j_bplus_not_found = {
        name = "未找到小丑",
        text = {
          "{C:blue}普通{}小丑牌不再",
          "在商店中{C:attention}出现{}",
        },
      },
      j_bplus_puzzle = {
        name = "拼图",
        text = {
          "如果计分手牌中包含",
          "{C:attention}#2#{}张{V:1}#3#{}，获得{C:chips}+#1#{}筹码",
          "{s:0.8}获得筹码后卡牌会发生变化",
          "{C:inactive}（当前 {C:chips}+#4#{C:inactive}筹码）",
        },
      },
      j_bplus_rgb = {
        name = "RGB小丑",
        text = {
          "如果打出的手牌中恰好包含",
          "{C:attention}3{}种不同的{C:attention}花色{}",
          "则获得{C:mult}+#1#{}倍率",
        },
      },
      j_bplus_newspaper = {
        name = "报纸",
        text = {
          "每张打出的{C:attention}#1#",
          "提供{C:mult}+#2#{}倍率",
          "{s:0.8}点数每轮发生变化",
        },
      },
      j_bplus_time_machine = {
        name = "时光机",
        text = {
          "出售此卡可以",
          "{C:attention}#1#{}底注",
        },
      },
      j_bplus_add_4 = {
        name = "加4",
        text = {
          "当回合开始时，",
          "抽{C:attention}4{}张牌",
        },
      },
      j_bplus_in_a_box = {
        name = "盒子里的惊喜",
        text = {
          "随机提供{C:mult}+#1#{}倍率、",
          "{C:chips}+#2#{}筹码、",
          "{C:money}+$#3#{}金钱",
          "或{X:mult,C:white} X#4# {}倍率",
        },
      },
      j_bplus_magnetic = {
        name = "磁性小丑",
        text = {
          "抽完牌后，",
          "从牌组中抽取1张{C:attention}钢制牌{}",
        },
      },
      j_bplus_fortune_cookie = {
        name = "幸运饼干",
        text = {
          "所有{C:green,E:1,s:1.1}概率{}乘以{X:green,C:white} X#1# {}",
          "在击败{C:attention}Boss盲注{}后，",
          "倍率减少{X:green,C:white} X1 ",
        },
      },
    },

    Tarot = {
      c_bplus_rich = { name = "富豪", text = enhancement_tarot_text },
      c_bplus_craftsman = { name = "工匠", text = enhancement_tarot_text },
      c_bplus_balance = { name = "平衡", text = enhancement_tarot_text },
      c_bplus_hell = { name = "地狱", text = enhancement_tarot_text },
    },

    Enhanced = {
      m_bplus_premium = {
        name = "高级卡",
        text = {
          "{X:mult,C:white} X#1# {}倍率",
          "使用即获得#3# {C:money}$#2#",
        },
      },
      m_bplus_framed = {
        name = "裱框卡",
        text = {
          "每次{C:attention}触发{}时",
          "获得{C:chips}+#1#{}筹码",
        },
      },
      m_bplus_balanced = {
        name = "平衡卡",
        text = {
          "{C:attention}平衡{}此牌的",
          "{C:chips}筹码{}和{C:mult}倍率",
        },
      },
      m_bplus_burned = {
        name = "烧焦卡",
        text = {
          "{X:mult,C:white} X#1# {}倍率",
          "如果回合结束时将其{C:attention}持在手中{}，",
          "将相邻卡牌增强为{C:attention}烧焦卡",
          "并{C:red}烧毁{}此卡",
        },
      },
    },

    Voucher = {
      v_bplus_refund = {
        name = "退款",
        text = {
          "跳过任何{C:attention}补给包{}时，",
          "根据剩余{C:attention}选择次数{}，每张赚取{C:money}$#1#{}",
        },
      },
      v_bplus_big_pack = {
        name = "大包",
        text = {
          "{C:attention}补给包{}增加",
          "{C:attention}+#1#{}选择次数和",
          "{C:attention}+#2#{}张卡牌位",
        },
      },
      v_bplus_dash = {
        name = "冲刺",
        text = {
          "跳过{C:attention}盲注{}时",
          "赚取{C:money}$#1#{}",
        },
      },
      v_bplus_rainbow = {
        name = "彩虹",
        text = {
          "跳过{C:attention}盲注{}时，",
          "为随机小丑增加一个",
          "随机{C:dark_edition}版本{}",
        },
      },
    },

    Blind = {
      bl_bplus_loop = {
        name = "循环",
        text = {
          "如果得分低于要求，",
          "得分归零",
        },
      },
      bl_bplus_extra = {
        name = "额外",
        text = {
          "每手牌打出后增加一张",
          "随机普通卡牌",
        },
      },
      bl_bplus_low = {
        name = "低谷",
        text = {
          "打出牌的增强效果",
          "会被移除",
        },
      },
      bl_bplus_hammer = {
        name = "铁锤",
        text = {
          "每次抽牌都会摧毁",
          "1张随机卡牌",
        },
      },
      bl_bplus_thunder = {
        name = "雷霆",
        text = {
          "你拥有的小丑牌越多，",
          "要求分数越高",
        },
      },
      bl_bplus_brake = {
        name = "刹车",
        text = {
          "无法连续进行",
          "打出/弃牌",
        },
      },
      bl_bplus_lazy = {
        name = "怠惰",
        text = {
          "不允许重新触发",
          "（Retrigger）效果",
        },
      },
      bl_bplus_scales = {
        name = "天秤",
        text = {
          "手中每持有一张牌",
          "损失 $1",
        },
      },
      bl_bplus_thirteen = {
        name = "13",
        text = {
          "所有概率降为 0",
        },
      },
      bl_bplus_handcuffs = {
        name = "手铐",
        text = {
          "每打出一手牌，削弱",
          "此时手中持有的所有牌",
        },
      },
    },

    Tag = {
      tag_bplus_glow = {
        name = "发光标签",
        text = {
          "为随机一个小丑",
          "增加随机{C:dark_edition}版本{}",
        },
      },
      tag_bplus_glove = {
        name = "手套标签",
        text = {
          "下一轮",
          "{C:blue}+#1#{}次出牌机会",
        },
      },
      tag_bplus_collector = {
        name = "收集者标签",
        text = {
          "完整牌组中超过{C:attention}#2#{}张的卡牌，",
          "每张为你赚取{C:money}$#1#{}",
          "{C:inactive}（最高{C:money}$#3#{C:inactive}）",
          "{C:inactive}（当前 {C:money}$#4#{C:inactive}）",
        },
      },
      tag_bplus_booster = {
        name = "补给标签",
        text = {
          "下个商店中额外增加",
          "{C:attention}#1#{}个补给包",
        },
      },
      tag_bplus_dish = {
        name = "菜肴标签",
        text = {
          "创建一个随机",
          "{C:attention}食物小丑",
          "{C:inactive}（需有空位）",
        },
      },
      tag_bplus_bounty = {
        name = "赏金标签",
        text = {
          "击败盲注时，赚取其奖励",
          "金钱的{X:money,C:white} X#1# {}倍",
        },
      },
      tag_bplus_enhanced = {
        name = "增强标签",
        text = {
          "回合开始时，将手中",
          "持有的所有牌增强为",
          "{C:attention}#1#{}",
        },
      },
      tag_bplus_mysthic = {
        name = "神秘标签",
        text = {
          "获得一个免费的",
          "{C:bplus_sigil}巨型神秘包",
        },
      },
      tag_bplus_burning = {
        name = "燃烧标签",
        text = {
          "下一轮",
          "{C:red}+#1#{}次弃牌机会",
        },
      },
      tag_bplus_symbolic = {
        name = "符号标签",
        text = {
          "每拥有{V:1}#2#{}张卡牌，",
          "赚取{C:money}$#1#{}",
          "{C:inactive}（当前 {C:money}$#3#{C:inactive}）",
          "{C:inactive}（最高{C:money}$#4#{C:inactive}）",
        },
      },
      tag_bplus_recycle = {
        name = "回收标签",
        text = {
          "生成上次添加的标签",
          "{s:0.8,C:green}回收标签{s:0.8}除外",
        },
      },
      tag_bplus_backpack = {
        name = "背包标签",
        text = {
          "将你{C:attention}消耗牌槽位{}中的卡牌",
          "全部生成一个{C:dark_edition}负片{}副本",
        },
      },
    },

    sigil = {
      c_bplus_sigil_blank = {
        name = "留白",
        text = {
          "有{C:green}#1#/#2#{}几率",
          "创建其他{C:attention}印记{}牌",
          "{s:0.8}几率在每轮结束时增加",
          "{C:inactive}（需有空位）",
        },
      },
      c_bplus_sigil_polyc = {
        name = "多彩",
        text = {
          "摧毁一张随机小丑，",
          "为选定小丑增加{C:dark_edition}多彩{}",
        },
      },
      c_bplus_sigil_rebirth = {
        name = "重生",
        text = {
          "摧毁所有非{C:dark_edition}负片{}小丑，",
          "重新创建等量相同",
          "{C:attention}稀有度{}的小丑",
        },
      },
      c_bplus_sigil_astra = {
        name = "星神",
        text = {
          "将你最常打出的{C:attention}牌型{}等级",
          "增加所有其他1级以上牌型等级的总和，",
          "并重置其他牌型等级",
          "{C:inactive}（当前可升 {C:attention}#1#{C:inactive} 级）",
        },
      },
      c_bplus_sigil_aye = {
        name = "眼",
        text = {
          "将最多{C:attention}#1#{}张选定牌的",
          "{C:attention}点数{}和{C:attention}花色{}改为",
          "牌组中随机一张牌的属性",
        },
      },
      c_bplus_sigil_bann = {
        name = "禁令",
        text = {
          "摧毁牌组中与选定牌",
          "{C:attention}点数{}且{C:attention}花色{}相同的所有牌",
        },
      },
      c_bplus_sigil_beast = {
        name = "巨兽",
        text = {
          "为最多{C:attention}#1#{}张选定牌增加随机",
          "{C:attention}增强{}和{C:attention}蜡封{}效果，并摧毁",
          "等量未选中的其他随机牌",
        },
      },
      c_bplus_sigil_curse = {
        name = "诅咒",
        text = {
          "有{C:green}#1#/#2#{}几率给随机小丑",
          "增加随机{C:dark_edition}版本{}，若失败",
          "则增加{C:eternal}永恒{}和{C:rental}租赁{}属性",
        },
      },
      c_bplus_sigil_dupe = {
        name = "复制",
        text = {
          "将所有{C:attention}未选中{}的牌",
          "转变为{C:attention}选定{}的牌",
          "{C:blue}-#1#{}次出牌机会",
        },
      },
      c_bplus_sigil_froze = {
        name = "冰冻",
        text = {
          "在{C:attention}#1#{}轮内{C:red}削弱{}选定小丑，",
          "削弱结束后变获得{C:dark_edition}负片{}",
        },
      },
      c_bplus_sigil_klone = {
        name = "克隆",
        text = {
          "为最多{C:attention}#1#{}张选定的牌",
          "创建副本",
        },
      },
      c_bplus_sigil_rewind = {
        name = "回溯",
        text = {
          "摧毁所有{C:attention}消耗牌{}，",
          "将其填满为你上次使用的",
          "{C:tarot}塔罗牌{}或{C:planet}星球牌{}",
        },
      },
      c_bplus_sigil_sacre = {
        name = "祭献",
        text = {
          "摧毁手中{C:attention}#1#{}张随机牌，",
          "随机创建一张{C:red}稀有{}小丑牌",
          "{C:inactive}（需有空位）",
        },
      },
      c_bplus_sigil_shine = {
        name = "闪耀",
        text = {
          "为选定牌增加版本{C:dark_edition}#1#{}",
          "{s:0.8}版本每轮变化",
          "{s:0.8}不能为{C:dark_edition,s:0.8}负片{}",
        },
      },
    },

    Other = {
      p_bplus_mysthic_normal1 = mysthic_pack,
      p_bplus_mysthic_normal2 = mysthic_pack,
      p_bplus_mysthic_jumbo = mysthic_pack,
      p_bplus_mysthic_mega = mysthic_pack,

      bplus_green_seal = {
        name = "绿蜡封",
        text = {
          "有{C:green}#1#/#2#{}几率",
          "提供{X:mult,C:white} X#3# {}倍率",
        },
      },

      undiscovered_sigil = {
        name = "未发现",
        text = {
          "在无种子的局中",
          "购买或使用此牌",
          "来了解它的作用",
        },
      },
    },
  },
  misc = {
    dictionary = {
      b_sigil_cards = "印记牌",
      k_sigil = "印记",

      k_bplus_mysthic_pack = "神秘包",
      k_bplus_ho_ho_ho_ex = "吼 吼 吼！",
      k_bplus_no_retrigger = "禁止重新触发",
      k_bplus_inactive_ex = "未激活！",
      k_bplus_burn_ex = "火！",

      ph_bplus_defeat_the_blind = "击败盲注",
    },

    v_dictionary = {
      k_bplus_saved_ex = "已保存 #1#!",
      k_bplus_draw_ex = "抽取 #1#!",
      k_bplus_plus_choose_ex = "+#1# 选择！",
      k_bplus_plus_sigil_ex = "+#1# 印记！",
    },

    labels = {
      bplus_green_seal = "绿蜡封",
    },
  },
}

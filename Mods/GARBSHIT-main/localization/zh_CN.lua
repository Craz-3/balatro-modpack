return {
    descriptions = {
        Partner = {
            pnr_garb_minigarbo = {
                name = "迷你胖次",
                text = {
                    "当{C:attention}幸运卡{}{C:green}成功{}触发时，",
                    "获得 {C:money}$#1#{}",
                },
            },
            pnr_garb_pearto = {
                name = "佩托",
                text = {
                    "所有计分的{C:hearts}红桃K{}",
                    "给予 {X:mult,C:white} X#1#基础 {} 倍率",
                    "{s:0.8}我特么爱死重音佩托了{}"
                },
                unlock = {
                    "下载并启用",
                    "{E:1,C:attention}Vocaloid卡组{}或",
                    "{E:1,C:attention}Vocalatro{}模组"
                }
            },
            pnr_garb_handshake = {
                name = "握手",
                text = {
                    "{C:attention}左键点击{}此伴侣以获得",
                    "{C:money}$#1#{} 并将一张{C:red}减益{}的",
                    "{C:attention}石头牌{}加入牌组",
                    "{C:inactive}(每轮最多 {C:attention}#2#{C:inactive} 次)"
                },
            },
            pnr_garb_jimmy = {
                name = "吉米",
                text = {
                    "{X:mult,C:white} X#3# {} 倍率",
                    "{C:attention}左键点击{}此伴侣以花费 {C:money}$#1#{}",
                    "购买一个{C:red}吉米{}",
                    "{C:attention}右键点击{}此伴侣以每张 {C:money}$#2#{}",
                    "的价格出售所有{C:red}吉米{}"
                },
            },
        },
        Joker = {
            j_garb_blank = {
                name = "空白小丑",
                text = {
                    "{C:inactive}啥也不做？"
                },
            },
            j_garb_blank_alt = {
                name = "反物质小丑",
                text = {
                    "{C:dark_edition}100{} 个小丑牌槽位",
                    "盲注依据所使用的",
                    "小丑牌槽位{C:attention}数量{}进行{C:attention}缩放{}"
                },
            },
            j_garb_truehivemind_1 = {
                name = "真·蜂群意志",
                text = {
                    "{C:attention}受感染{}的卡牌在计分时给予 {X:mult,C:white} X#1# {} 倍率",
                    "每过一个{C:attention}底注{}，获得 {X:mult,C:white} X#2# {} 倍率"
                }
            },
            j_garb_truehivemind_2 = {
                name = "真·蜂群意志",
                text = {
                    "{C:attention}受感染{}的卡牌在计分时给予 {X:mult,C:white} X#1# {} 倍率",
                    "每过一个{C:attention}底注{}，获得 {X:mult,C:white} X#2# {} 倍率",
                    "{C:attention}标准包{}已被{C:red}渗透"
                }
            },
            j_garb_truehivemind_3 = {
                name = "真·蜂群意志",
                text = {
                    "{C:attention}受感染{}的卡牌在计分时给予 {X:mult,C:white} X#1# {} 倍率",
                    "每过一个{C:attention}底注{}，获得 {X:mult,C:white} X#2# {} 倍率",
                    "{C:attention}标准包{}已被{C:red}渗透",
                    "{C:tarot}塔罗包{}已被{C:red}渗透"
                }
            },
            j_garb_truehivemind_4 = {
                name = "真·蜂群意志",
                text = {
                    "{C:attention}受感染{}的卡牌在计分时给予 {X:mult,C:white} X#1# {} 倍率",
                    "每过一个{C:attention}底注{}，获得 {X:mult,C:white} X#2# {} 倍率",
                    "{C:attention}标准包{}已被{C:red}渗透",
                    "{C:tarot}塔罗包{}已被{C:red}渗透",
                    "{C:attention}跳过标签{}已被{C:red}渗透"
                }
            },
            j_garb_truehivemind_5 = {
                name = "真·蜂群意志",
                text = {
                    "{C:attention}受感染{}的卡牌在计分时给予 {X:mult,C:white} X#1# {} 倍率",
                    "每过一个{C:attention}底注{}，获得 {X:mult,C:white} X#2# {} 倍率",
                    "{C:attention}标准包{}已被{C:red}渗透",
                    "{C:tarot}塔罗包{}已被{C:red}渗透",
                    "{C:attention}跳过标签{}已被{C:red}渗透",
                    "{C:attention}牌组{}已被{C:red}渗透"
                }
            },
            j_garb_truehivemind_6 = {
                name = "真·蜂群意志",
                text = {
                    "{C:attention}受感染{}的卡牌在计分时给予 {X:mult,C:white} X#1# {} 倍率",
                    "每过一个{C:attention}底注{}，获得 {X:mult,C:white} X#2# {} 倍率",
                    "{C:attention}标准包{}已被{C:red}渗透",
                    "{C:tarot}塔罗包{}已被{C:red}渗透",
                    "{C:attention}跳过标签{}已被{C:red}渗透",
                    "{C:attention}牌组{}已被{C:red}渗透",
                    "{C:attention}商店{}已被{C:red}渗透"
                }
            },
            j_garb_truehivemind_7 = {
                name = "真·蜂群意志",
                text = {
                    "{s:1.5,C:attention}整个游戏{}已被{C:red}渗透"
                }
            },
        },
        Enhanced = {
            m_garb_infected = {
                name = "受感染牌",
                text = {
                    "当此牌在手中时，有 {C:green}#1#/#2#{} 的",
                    "几率感染相邻的卡牌",
                    "在 {C:attention}#3#{} 轮后{C:red}自毁{}"
                },
            },
            m_garb_pure = {
                name = "纯净牌",
                text = {
                    "不会被减益"
                },
            },
            m_garb_jump = {
                name = "跳跃牌",
                text = {
                    "在顺子中可以当作",
                    "任何点数使用"
                },
            },
            m_garb_royal = {
                name = "皇室牌",
                text = {
                    "{C:attention}+1{} 手牌上限",
                    "在打出任何手牌后",
                    "会被{C:red}弃掉{}"
                },
            },
        },

        Sleeve = {
            sleeve_garb_tangerine = {
                name = "柑橘卡套",
                text = {                     
                    "{C:attention}GARBSHIT{} 小丑牌出现的",
                    "频率提高 {C:attention}3x{}"
                }
            },
            sleeve_garb_tangerine_alt = {
                name = "柑橘卡套",
                text = {
                    "{C:attention}GARBSHIT{} 小丑牌出现的",
                    "频率提高 {C:attention}11x{}"
                },
            },
            sleeve_garb_albert = {
                name = "阿尔伯特的卡套",
                text = {
                    "开局拥有一张",
                    "{E:1,C:legendary}传奇{}小丑牌",
                    "基础盲注大小 {C:red}X#1#{}"
                },
            },
            sleeve_garb_albert_alt = {
                name = "阿尔伯特的卡套",
                text = {
                    "开局拥有另一张",
                    "{E:1,C:legendary}传奇{}小丑牌",
                    "每轮有 {C:chips}#2#{} 次出牌次数"
                },
            },
            sleeve_garb_doodle = {
                name = "涂鸦卡套",
                text = {
                    "开局拥有 {C:garb_Stamp,T:v_garb_postcard}#1#{} 凭证",
                    "和一张 {C:garb_Stamp,T:c_garb_mascot}#2#{} 卡"
                },
            },
            sleeve_garb_doodle_alt = {
                name = "涂鸦卡套",
                text = {
                    "开局拥有 {C:garb_Stamp,T:v_garb_guano}#1#{} 凭证"
                },
            },
            sleeve_garb_cycle = {
                name = "纪元卡套",
                text = {
                    "在每个{C:attention}底注{}开始时，",
                    "将金钱设为 {C:money}$#1#{} 并",
                    "{C:red}摧毁{}所有{C:attention}小丑牌{}和",
                    "{C:attention}消耗牌{}"
                },
            },
            sleeve_garb_cycle_alt = {
                name = "纪元卡套",
                text = {
                    "在每个{C:attention}底注{}开始时，",
                    "将金钱设为 {C:money}$#1#{} 并",
                    "{C:red}重置{}所有牌组{C:attention}等级{}"
                },
            },
            sleeve_garb_byss = {
                name = "深渊卡套",
                text = {
                    "初始拥有 {C:attention}1{} 个小丑牌槽位",
                    "购买任何凭证时，",
                    "获得 {C:attention}+#1#{} 个小丑牌槽位"
                },
            },
            sleeve_garb_byss_alt = {
                name = "深渊卡套",
                text = {
                    "购买任何凭证时，",
                    "获得 {C:attention}+#1#{} 手牌上限"
                },
            },
        },

        Other = {
            p_garb_rainbow_booster = {
                name = "万花筒牌组",
                text = {
                    "选择一张彩虹小丑"
                },
            },       

            p_garb_stamp_booster = {
                name = "邮政包",
                text = {
                    "选择 {C:attention}#1#{} 个",
                    "最多包含 {C:attention}#2# 个印章{}的补充包",
                },
            },       

            p_garb_stamp_booster_2 = {
                name = "邮政包",
                text = {
                    "选择 {C:attention}#1#{} 个",
                    "最多包含 {C:attention}#2# 个印章{}的补充包",
                },
            },

            p_garb_stamp_booster_j = {
                name = "大邮政包",
                text = {
                    "选择 {C:attention}#1#{} 个",
                    "最多包含 {C:attention}#2# 个印章{}的补充包",
                },
            },

            p_garb_stamp_booster_m = {
                name = "巨型邮政包",
                text = {
                    "选择 {C:attention}#1#{} 个",
                    "最多包含 {C:attention}#2# 个印章{}的补充包",
                },
            },            
            
            credits = {
                name = "鸣谢",
                text = {
                    "艺术与创意：",
                    "{E:1,C:attention}#1#"
                }
            }, 

            credits2 = {
                name = "鸣谢",
                text = {
                    "艺术绘制：",
                    "{E:1,C:attention}#1#"
                }
            }, 


            talisman_warning = {
                name = "警告！",
                text = {
                    "此小丑牌与 {C:attention}Talisman{} 模组{C:red}不兼容{}！",
                    "购买后，它将立即{C:red}自毁{}，",
                    "以避免潜在的崩溃。"
                }
            },
            quadrant_hands = {
                name = "象限手牌",
                text = {
                    "使用{C:planet}木星{}时，", 
                    "{C:attention}#1#{} 会升级，",
                    "{C:mult}+3{} 倍率且",
                    "{C:chips}+40{} 筹码"
                }
            },
            mega_fool = {
                name = "极意奥术",
                text = {
                    "创建两张本次比赛中最后使用的",
                    "{C:tarot}塔罗牌{}或{C:planet}星球牌{}的",
                    "{C:dark_edition}负片{}副本，",
                    "{s:0.8,C:tarot}愚者{s:0.8}除外"
                }
            },
            mega_hermit = {
                name = "极意奥术",
                text = {
                    "金钱翻倍",
                    "{C:inactive}(最高 {C:money}$50{C:inactive})"
                }
            },
            mega_temperance = {
                name = "极意奥术",
                text = {
                    "获得当前所有小丑牌的",
                    "总售价{C:inactive}(无上限)",
                    "{C:inactive}(当前为 {C:money}$#2#{C:inactive})"
                }
            },
            mega_enhance = {
                name = "极意奥术",
                text = {
                    "将所有计分牌",
                    "增强为",
                    "{C:attention}#2#s"
                }
            },
            mega_suiters = {
                name = "极意奥术",
                text = {
                    "将所有{C:attention}手牌{}",
                    "转换为 {V:1}#2#{}"
                }
            },
            mega_priestess = {
                name = "极意奥术",
                text = {
                    "创建一个免费的",
                    "{C:planet}流星标签"
                }
            },

            mega_emperor = {
                name = "极意奥术",
                text = {
                    "创建最多 2 张随机的",
                    "{C:dark_edition}负片{} {C:tarot}塔罗牌{}"
                }
            },
            mega_judgement = {
                name = "极意奥术",
                text = {
                    "创建一张随机的",
                    "{C:dark_edition}多彩{}或{C:dark_edition}负片{}",
                    "{C:attention}小丑牌{}",
                    "{C:inactive}(必须有空位)"
                }
            },

            mega_hangedman = {
                name = "极意奥术",
                text = {
                    "摧毁所有{C:attention}手牌{}"
                }
            },

            mega_strength = {
                name = "极意奥术",
                text = {
                    "将所有计分的{C:attention}点数牌{}",
                    "转换为 {C:attention}10{}，并将所有计分的",
                    "{C:attention}人头牌{}转换为 {C:attention}K{}"
                }
            },

            mega_wheel_of_fortune = {
                name = "极意奥术",
                text = {
                    "{C:green}#1#/2{} 的几率将一张随机{C:attention}小丑牌{}",
                    "变为 {C:dark_edition}多彩{} 或 {C:dark_edition}负片{}"
                }
            },

            mega_death = {
                name = "极意奥术",
                text = {
                    "在{C:attention}计分牌{}中，",
                    "将{C:attention}最左侧的 2 张{}卡牌",
                    "转换为{C:attention}最右侧{}的卡牌"
                }
            },        
        },

        Back = {
            b_garb_garbdeck = {
                name = "柑橘牌组",
                text = {
                    "{C:attention}GARBSHIT{} 小丑牌出现的",
                    "频率提高 {C:attention}3x{}",
                    "开局拥有 {C:attention,T:v_overstock_norm}#1#{}"
                },
            },
            b_garb_albert = {
                name = "阿尔伯特的牌组",
                text = {
                    "开局拥有一张",
                    "{E:1,C:legendary}传奇{}小丑牌",
                    "基础盲注大小 {C:red}X#1#{}",
                    "{C:inactive,s:0.8}(在此牌组被选中的情况下，按住Shift在",
                    "{C:inactive,s:0.7}收藏页面中点击一个传奇小丑牌来选择它！)"
                },
                unlock = {
                    "对一张{E:1,C:legendary}传奇{}小丑牌",
                    "使用 {C:garb_Stamp,T:c_garb_vintage}复古图章{}"
                }
            },
            b_garb_albert_alt = {
                name = "阿尔伯特的牌组",
                text = {
                    "开局拥有一张",
                    "{E:1,C:legendary}传奇{}小丑牌",
                    "基础盲注大小 {C:red}X#1#{}",
                    "{C:inactive,s:0.8}(已选择: {C:dark_edition,s:0.8}#2#{C:inactive,s:0.8})"
                },
                unlock = {
                    "对一张{E:1,C:legendary}传奇{}小丑牌",
                    "使用 {C:garb_Stamp,T:c_garb_vintage}复古图章{}"
                }
            },
            b_garb_cycle = {
                name = "纪元牌组",
                text = {
                    "在每个{C:attention}底注{}开始时，",
                    "将金钱设为 {C:money}$#1#{} 并",
                    "{C:red}摧毁{}所有{C:attention}小丑牌{}和",
                    "{C:attention}消耗牌{}"
                },
                unlock = {
                    "寻找并使用",
                    "{E:1,C:spectral}永恒{}消耗牌"
                }
            },
            b_garb_doodle = {
                name = "涂鸦牌组",
                text = {
                    "开局拥有 {C:garb_Stamp,T:v_garb_postcard}#1#{} 凭证",
                    "和一张 {C:garb_Stamp,T:c_garb_mascot}#2#{} 卡"
                },
            },
            b_garb_byss = {
                name = "深渊牌组",
                text = {
                    "初始拥有 {C:attention}1{} 个小丑牌槽位",
                    "购买任何凭证时，",
                    "获得 {C:attention}+#1#{} 个小丑牌槽位"
                },
            },
            b_garb_kaleido = {
                name = "万花筒牌组",
                text = {
                    "开局拥有一张",
                    "{E:1,C:legendary}彩虹{}小丑牌",
                    "{C:inactive,S:1.5}(#1#){}",
                },
                unlock = {
                    "{E:1,s:1.3}?????",
                    "{C:inactive,s:0.9,E:1}(提示: 答案可能",
                    "{C:inactive,s:0.9,E:1}就在家里等着你回来){}"
                }
            },
            b_garb_kaleido_alt = {
                name = "万花筒牌组",
                text = {
                    "开局拥有一张",
                    "{E:1,C:legendary}彩虹{}小丑牌",
                    "{C:inactive,S:1.5}(#1#){}",
                },
                unlock = {
                    "在{E:1,C:attention}射击吉米{}中得分",
                    "超过 {C:attention}200{} 分"
                }
            },
        },
    },

    Mod = 
    {
        GARBPACK = {
            name = "GARBSHIT",
            text = {
                "一个由 {C:attention,E:1}garb{} 制作的有趣且契合原版的模组{}",
                " ",
                "{s:1.5,C:attention,E:2}致谢:",
                "{C:dark_edition,E:2}garb{} - 主创、美术、代码",
                "{C:dark_edition,E:2}ejwu{} - 跳跃牌实现",
                "{C:dark_edition,E:2}MrCr33ps{} - GARBSHIT 重绘",
                " ",
                "{s:1.25,C:attention,E:2}小丑牌贡献:",
                "{C:dark_edition,E:2}lamborghiniofficial{} - 回溯",
                "{C:dark_edition,E:2}64suns{} - 圣杯二",
                "{C:dark_edition,E:2}Heaven{} - 重音佩托!!!! (新立绘)",
                "{C:dark_edition,E:2}Omegaflowey18{} - 表演、佐罗亚克",
                "{C:dark_edition,E:2}Valoky{} - 执念",
                "{C:dark_edition,E:2}Astro{} - 星之卡比",
                "{C:dark_edition,E:2}MrCr33ps{} - 圣心",
                " ",
                "{s:1.5,C:attention,E:2}同时也推荐尝试:",
                "{C:dark_edition,E:1}Rofflatro, Victin's Collection, Aikoyori's Shenanigans{}",
                "{C:dark_edition,E:1}Revo's Vault, Prism, HotPot, Hollow Knight Silksong{}",
                " ",
                "{s:0.9}特别感谢 {C:attention,s:0.9}Balatro Discord!{}"
            }
        }
    },
    misc = {
        achievement_names = {
            ach_garb_regicide = "弑君者！",
            ach_garb_corr_upgrade = "升级！",
            ach_garb_neverpunished = "从未受罚",
            ach_garb_criticalfail = "大失败",
            ach_garb_surged = "被渗透！",
            ach_garb_rocking = "你让我摇滚起来",
            ach_garb_snowedin = "大雪封门",
            ach_garb_jimboss = "吉米必须死",
            ach_garb_str_flush_five = "我的老天！(同花五条顺子)",
            ach_garb_valoky = "奥~~~，原来是她！",
            ach_garb_shot = "我的王牌",
            ach_garb_doubleornothing = "孤注一掷",
            ach_garb_beheading = "十亿富翁之首",
            ach_garb_thehive = "你已被渗透",
            ach_garb_funisinfinite = "快乐是无限的",
            ach_garb_betterthangarb = "比 garb 强！",
            ach_garb_cute = "我特么爱死老鼠男孩了！",
            ach_garb_silksong = "居然玩到了《丝之歌》",
        },
        achievement_descriptions = {
            ach_garb_regicide = "处决男爵",
            ach_garb_corr_upgrade = "让受侵蚀小丑提供 100 或更多筹码",
            ach_garb_neverpunished = "在使用萨拉时，在第一手牌之外的任意手牌中打出 5 张玻璃牌且无一碎裂",
            ach_garb_criticalfail = "在使用大成功时，打出 5 张幸运卡且无一触发",
            ach_garb_surged = "让你的小丑牌被【渗透】摧毁",
            ach_garb_rocking = "在同一局比赛中使用滚石创造 25 张石头牌",
            ach_garb_snowedin = "让雪球一次性提供超过 5000 筹码",
            ach_garb_jimboss = "在同一局比赛中击败 5 次吉米 Boss",
            ach_garb_str_flush_five = "组成一副同花五条顺子",
            ach_garb_valoky = "同时拥有执念和 Valoky",
            ach_garb_shot = "射击庄家以重置你的牌组",
            ach_garb_doubleornothing = "使用嘉年华标签复制表演者",
            ach_garb_beheading = "被断头台精华处决",
            ach_garb_thehive = "被真·蜂群意志渗透",
            ach_garb_funisinfinite = "找到“快乐是无限的”屏幕",
            ach_garb_betterthangarb = "在射击吉米中得分超过 400 分",
            ach_garb_cute = "在标题界面连续抚摸老鼠男孩 100 次",
            ach_garb_silksong = "拥有一个《空洞骑士：丝之歌》的存档文件",
        },
        dictionary = {
            stamp_booster = "邮政包",
            rainbow_booster = "万花筒牌组",
            ph_mr_bones = "被一个小丑牌的效果救了",
        },
        quips={
            garb_hive_repelled={
                "哈，吓到你了吗？"
            },
            pnr_garb_minigarbo_1={
                "嗨！！！"
            },
            pnr_garb_minigarbo_2={
                "太棒了！！"
            },
            pnr_garb_minigarbo_3={
                ":3"
            },
            pnr_garb_minigarbo_4={
                "来自 GARBSHIT 的 garb！",
            },
            pnr_garb_minigarbo_5={
                "小丑波奇",
                "巴啦啦"
            },
            pnr_garb_minigarbo_6={
                "一个为您准备的，",
                "小小的桌上 garb！"
            },
            pnr_garb_pearto_1={
                "我是一个梨"
            },
            pnr_garb_pearto_2={
                "我是一个小小的梨"
            },
            pnr_garb_pearto_3={
                "dnfjwnfknfl"
            },
            pnr_garb_pearto_4={
                "重音佩托"
            },
            pnr_garb_pearto_5={
                "等等，我是神"
            },
            pnr_garb_pearto_6={
                "重音巴拉佩托"
            },

            minigame_tutorial_1={
                "有人敲门！那一定意味着..."
            },
            minigame_tutorial_2={
                "你是来玩小游戏的！"
            },
            minigame_tutorial_3={
                "啊？什么小游戏？"
            },
            minigame_tutorial_4={
                "当然是，",
                "射击吉米！"
            },
            minigame_tutorial_5={
                "哦，你不知道吗？"
            },
            minigame_tutorial_6={
                "规则很简单："
            },
            minigame_tutorial_7={
                "看到吉米就射击他，",
                "以获得积分。",
                "{C:inactive}(点击吉米即可射击)"
            },
            minigame_tutorial_8={
                "避免被【渗透】，",
                "否则游戏结束。",
                "{C:inactive}(点击【渗透】就会被渗透)"
            },
            minigame_tutorial_9={
                "最重要的规则是，",
                "请保持自我！"
            },
            minigame_tutorial_10={
                "看起来很简单，不是吗？",
                "因为确实很简单！"
            },
            minigame_tutorial_11={
                "现在，你已经知道了规则，",
                "我要把你送去小游戏了，祝你玩得愉快！"
            },
            minigame_tutorial_12={
                "哦！还有最后一件事——",
            },
        },
    },
}

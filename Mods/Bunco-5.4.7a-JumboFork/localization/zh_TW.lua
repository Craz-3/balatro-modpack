return {
  misc = {
    collab_palettes = {
      default_Spades = {

      },
      default_Diamonds = {

      },
      default_Clubs = {

      },
      default_Hearts = {

      }
    },
    collabs = {
      bunc_Halberds = {

      },
      bunc_Fleurons = {

      }
    },
    poker_hand_descriptions = {
      bunc_Deal = {
        "被註冊車牌",
        "選擇的5個牌級"
      },
      bunc_Spectrum = {
        "五張不同花色的卡牌"
      }
    },
    labels = {
      bunc_glitter = "閃光",
      bunc_scattering = "分散",
      bunc_reactive = "活躍",
      bunc_fluorescent = "螢光",
      bunc_hindered = "阻礙"
    },
    poker_hands = {
      bunc_Deal = "成交",
      bunc_Spectrum = "五色"
    },
    dictionary = {
      bunc_high_quality_shaders_desc_2 = "以高質素的形式呈現（有可能產生卡頓）",
      bunc_fixed_sprites = "精靈圖修改",
      bunc_b_side = "B面",
      bunc_fixed_badges_desc = "修改消耗牌中混淆的標識",
      bunc_fixed_sprites_desc_2 = "例如移除一些不要的像素及加強對比度",
      bunc_copied = "已複製！",
      bunc_thoth_tarot = "托特塔羅牌",
      bunc_colorful_finishers_desc = "啟用在最終盲注中的色彩背景",
      bunc_high_quality_shaders = "高質素的着色器",
      b_polymino_cards = "多連塊牌",
      bunc_inactive = "未啟用",
      bunc_fixed_sprites_desc = "修改一些精靈圖",
      k_bunc_virtual_pack = "虛擬擴充包",
      bunc_mysterious_polymino = "多連塊？",
      bunc_debuffed = "被減益！",
      bunc_a_side = "A面",
      bunc_fixed_badges = "標識優化",
      bunc_colorful_finishers_desc_2 = "並移除在無盡模式中的灰色背景",
      bunc_accepted = "接受了！",
      k_bunc_blind_pack = "盲注擴充包",
      bunc_min_ante = "最小底注：",
      bunc_final_blind = "最終盲注",
      bunc_repeat = "重新得分！",
      bunc_blade = "（盲注所需的1.5X）",
      bunc_least_played_hand = "（最少打出的牌型）",
      bunc_most_played_rank = "（最常打出的牌級）",
      bunc_volume = "音量",
      bunc_jokerlike_consumable_editions_desc = "恢復在原遊戲中帶有版本的消耗牌的效果",
      bunc_mysterious_tarot = "塔羅牌？",
      bunc_gameplay_reworks = "遊戲內容更改",
      bunc_word_and = "及",
      bunc_exceeded_score = "超出限制！",
      bunc_robbed = "盜取了！",
      bunc_pew = "咻！",
      bunc_chance = "機率",
      bunc_thoth_tarots = "托特塔羅牌",
      bunc_default_true = "預設為啟用",
      bunc_ouch = "啊！",
      bunc_fixed_badges_desc_2 = "以更詳細及精確的描述標識替代",
      bunc_high_quality_shaders_desc = "讓一些原遊戲的著色器",
      bunc_chips = "籌碼",
      k_polymino = "多連塊",
      bunc_loop = "重新得分！",
      bunc_gameplay_reworks_desc_2 = "來讓遊戲有更享受的體驗",
      bunc_declined = "拒絕了...",
      bunc_requires_restart = "需要重啟",
      bunc_gameplay_reworks_desc = "更改一些原遊戲中的內容",
      bunc_default_false = "預設為禁用",
      bunc_jokerlike_consumable_editions = "在消耗牌欄位的版本",
      bunc_colorful_finishers = "富有色彩的最終盲注",
      bunc_nothing = "沒有",
      bunc_jokerlike_consumable_editions_desc_2 = "（以避免與其他模組組成衝突）"
    },
    suits_plural = {
      bunc_Halberds = "斧槍",
      bunc_Fleurons = "花葉"
    },
    suits_singular = {
      bunc_Halberds = "斧槍",
      bunc_Fleurons = "花葉"
    }
  },
  descriptions = {
    Back = {
      b_bunc_digital = {
        name = "數碼牌組",
        text = {
          "{C:bunco_virtual_dark}多連塊牌{}有機率會在商店中出現",
          "開始遊戲時獲得一張{C:bunco_virtual_dark,T:c_bunc_the_i}條形{}牌"
        }
      },
      b_bunc_fairy = {
        unlock = {
          "在一次出牌中",
          "打出{E:1,C:attention}五個不同的花色"
        },
        name = "妖精牌組",
        text = {
          "擊敗{C:attention}Boss盲注{}後",
          "新增#1#張隨機的{C:bunco_exotic,T:bunc_exotic_cards}#2#{}",
          "到你的牌組中"
        }
      }
    },
    Tag = {
      tag_bunc_xchips = {
        name = "超級籌碼標籤",
        text = {
          "下一次出牌時，獲得{X:chips,C:white}X#1#{}籌碼"
        }
      },
      tag_bunc_fluorescent = {
        name = "螢光標籤",
        text = {
          "下一個在商店中的",
          "基本版小丑會是免費",
          "並附有{C:dark_edition}螢光{}版本"
        }
      },
      tag_bunc_double = {
        name = "雙倍標籤",
        text = {
          "複製下一個",
          "獲得的{C:attention}標籤{}",
          "{s:0.6,C:attention}雙倍及三倍標籤{s:0.8}除外"
        }
      },
      tag_bunc_shopping = {
        name = "購物標籤",
        text = {
          "獲得{C:attention}一{}次免費的",
          "商店{C:green}刷新"
        }
      },
      tag_bunc_d_six = {
        name = "D6標籤",
        text = {
          "下一個商店",
          "會有一次免費的{C:green}刷新"
        }
      },
      tag_bunc_filigree = {
        name = "掐絲標籤",
        text = {
          "下一個{C:attention}標準擴充包{}",
          "只會包含{C:bunco_exotic}奇異卡牌"
        }
      },
      tag_bunc_mult = {
        name = "倍數標籤",
        text = {
          "下一次出牌時，獲得{C:mult}+#1#{}倍數"
        }
      },
      tag_bunc_rental = {
        name = "租貸標籤",
        text = {
          "下一個在商店裏的小丑牌",
          "會帶有{C:attention}租貸{}貼紙"
        }
      },
      tag_bunc_glitter = {
        name = "閃光標籤",
        text = {
          "下一個在商店中的",
          "基本版小丑會是免費",
          "並附有{C:dark_edition}閃光{}版本"
        }
      },
      tag_bunc_xmult = {
        name = "超級倍數標籤",
        text = {
          "下一次出牌時，獲得{X:mult,C:white}X#1#{}倍數"
        }
      },
      tag_bunc_hindered = {
        name = "阻礙標籤",
        text = {
          "下一個在商店裏的小丑牌",
          "會帶有{C:attention}阻礙{}貼紙"
        }
      },
      tag_bunc_perishable = {
        name = "有限期標籤",
        text = {
          "下一個在商店裏的小丑牌",
          "會帶有{C:attention}有限期{}貼紙"
        }
      },
      tag_bunc_chips = {
        name = "籌碼標籤",
        text = {
          "下一次出牌時，獲得{C:chips}+#1#{}籌碼"
        }
      },
      tag_bunc_scattering = {
        name = "分散標籤",
        text = {
          "下一個在商店裏的小丑牌",
          "會帶有{C:attention}分散{}貼紙"
        }
      },
      tag_bunc_eternal = {
        name = "永久標籤",
        text = {
          "下一個在商店裏的小丑牌",
          "會帶有{C:attention}永久{}貼紙"
        }
      },
      tag_bunc_boss = {
        name = "盲注標籤",
        text = {
          "獲得一個免費的",
          "{C:attention}盲注擴充包"
        }
      },
      tag_bunc_reactive = {
        name = "活躍標籤",
        text = {
          "下一個在商店裏的小丑牌",
          "會帶有{C:attention}活躍{}貼紙"
        }
      },
      tag_bunc_breaking = {
        name = "清除標籤",
        text = {
          "停用{C:attention}Boss盲注{}的",
          "限制效果"
        }
      },
      tag_bunc_triple = {
        name = "三倍標籤",
        text = {
          "產生兩個下一個",
          "獲得的{C:attention}標籤{}的複本",
          "{s:0.6,C:attention}雙倍及三倍標籤{s:0.8}除外"
        }
      },
      tag_bunc_arcade = {
        name = "街機標籤",
        text = {
          "獲得一個免費的",
          "{C:bunco_virtual_dark}超級虛擬擴充包"
        }
      }
    },
    Blind = {
      bl_bunc_mask = {
        name = "面具",
        text = {
          "#1#會有",
          "#2#的基礎籌碼及倍數"
        }
      },
      bl_bunc_claw = {
        name = "爪子",
        text = {
          "棄掉的卡牌",
          "會返回到牌組中"
        }
      },
      bl_bunc_knoll = {
        name = "小丘",
        text = {
          "擁有多於$5時",
          "第一次抽出的手牌會被減益"
        }
      },
      bl_bunc_tine = {
        name = "尖端",
        text = {
          "每張 #1# 都被減益"
        }
      },
      bl_bunc_miser = {
        name = "財迷",
        text = {
          "打敗這個盲注後",
          "跳過下一個商店"
        }
      },
      bl_bunc_stone = {
        name = "石塊",
        text = {
          "每擁有的$10",
          "會對要求分數+1X"
        }
      },
      bl_bunc_final_trident = {
        name = "朱紅三叉戟",
        text = {
          "每次在這個底注中購買時",
          "會對要求分數+1X"
        }
      },
      bl_bunc_final_crown = {
        name = "夏翠絲皇冠",
        text = {
          "所有以黑桃，紅心，梅花及方塊",
          "為基礎花色的卡牌都被減益"
        }
      },
      bl_bunc_wind = {
        name = "疾風",
        text = {
          "最左邊的小丑牌",
          "會被減益"
        }
      },
      bl_bunc_blade = {
        name = "刀刃",
        text = {
          "第一次超越#1#分數時",
          "對打出手牌的分數設至0"
        }
      },
      bl_bunc_veil = {
        name = "面紗",
        text = {
          "選擇的卡牌",
          "會翻到背面"
        }
      },
      bl_bunc_final_shield = {
        name = "青綠盾牌",
        text = {
          "這個底注中每個超過要求分數的數量",
          "會加到這個盲注的要求分數中"
        }
      },
      bl_bunc_flame = {
        name = "烈焰",
        text = {
          "所有加強牌",
          "都被減益"
        }
      },
      bl_bunc_final_dagger = {
        name = "洋紅匕首",
        text = {
          "棄掉的卡牌會被打出",
          "其得到的分數會減去現有的分數"
        }
      },
      bl_bunc_final_tower = {
        name = "靛藍高塔",
        text = {
          "在這個底注中",
          "未被打出的卡牌都被減益"
        }
      },
      bl_bunc_chasm = {
        name = "裂口",
        text = {
          "打出手牌後，獲得阻礙",
          "活性或租貸標籤"
        }
      },
      bl_bunc_bulwark = {
        name = "堡壘",
        text = {
          "打出#1#",
          "會棄掉所有手牌"
        }
      },
      bl_bunc_depths = {
        name = "深洞",
        text = {
          "打出手牌後，獲得永久",
          "有限期或分散標籤"
        }
      },
      bl_bunc_prince = {
        name = "王子",
        text = {
          "所有小丑牌都被減益",
          "直到打出第一個手牌"
        }
      },
      bl_bunc_cadaver = {
        name = "屍體",
        text = {
          "一定不能打出人頭牌"
        }
      },
      bl_bunc_sand = {
        name = "細砂",
        text = {
          "每個擁有的標籤",
          "會對要求分數+1X"
        }
      },
      bl_bunc_gate = {
        name = "閘門",
        text = {
          "選擇的卡牌",
          "不能取消選擇"
        }
      },
      bl_bunc_swing = {
        name = "鞦韆",
        text = {
          "打出或棄掉手牌後",
          "翻起所有手牌"
        }
      },
      bl_bunc_umbrella = {
        name = "雨傘",
        text = {
          "打出手牌後",
          "把所有手中的卡牌翻到背面"
        }
      },
      bl_bunc_paling = {
        name = "柵欄",
        text = {
          "出牌及棄牌",
          "會消耗雙方的次數"
        }
      }
    },
    Stake = {
      stake_bunc_pink = {
        name = "粉紅賭注",
        text = {
          "商店可能會出現{C:attention}阻礙{}的小丑牌",
          "{C:inactive,s:0.8}(#1#)",
          "{s:0.8}套用先前賭注的效果"
        }
      },
      stake_bunc_cyan = {
        name = "青色賭注",
        text = {
          "商店可能會出現{C:attention}分散{}的小丑牌",
          "{C:inactive,s:0.8}(#1#)",
          "{s:0.8}套用先前賭注的效果"
        }
      },
      stake_bunc_magenta = {
        name = "洋紅賭注",
        text = {
          "商店可能會出現{C:attention}活躍{}的小丑牌",
          "{C:inactive,s:0.8}(#1#)",
          "{s:0.8}套用先前賭注的效果"
        }
      }
    },
    Polymino = {
      c_bunc_the_o = {
        name = "方形",
        text = {
          "{C:attention}連接{}4張選擇的卡牌",
          "其中2張牌具有{C:attention}相同的特性",
          "{C:inactive}（牌級或花色）{}",
          "而另外2張牌具有{C:attention}另一個相同的特性{}"
        }
      },
      c_bunc_the_j = {
        name = "勾形",
        text = {
          "{C:attention}連接{}4張選擇的卡牌",
          "其中3張具有{C:attention}相同的牌級",
          "而另外1張具有{C:attention}相同的花色",
          "但不具有相同的牌級"
        }
      },
      c_bunc_the_l = {
        name = "靴形",
        text = {
          "{C:attention}連接{}4張選擇的卡牌",
          "其中3張具有{C:attention}相同的花色",
          "而另外1張具有{C:attention}相同的牌級",
          "但不具有相同的花色"
        }
      },
      c_bunc_the_t = {
        name = "卜形",
        text = {
          "{C:attention}連接{}4張選擇的卡牌",
          "其中3張牌具有{C:attention}相同的特性",
          "{C:inactive}（牌級或花色）{}",
          "而另外1張牌{C:attention}不與其他卡牌{}具有{C:attention}相同的特性{}"
        }
      },
      c_bunc_the_slash = {
        name = "斜形",
        text = {
          "{C:attention}連接{}4張選擇的卡牌",
          "其中所有卡牌具有{C:attention}不同的特性",
          "{C:inactive}（牌級或花色）"
        }
      },
      c_bunc_the_s = {
        name = "彎形",
        text = {
          "{C:attention}連接{}4張選擇的卡牌",
          "每對卡牌中的{C:attention}2張卡牌具有{}有相同的牌級",
          "每對中有一張卡牌與另一對具有{C:attention}相同的花色"
        }
      },
      c_bunc_the_z = {
        name = "鋸齒形",
        text = {
          "{C:attention}連接{}4張選擇的卡牌",
          "每對卡牌中的{C:attention}2張卡牌具有{}有相同的花色",
          "每對中有一張卡牌與另一對具有{C:attention}相同的牌級"
        }
      },
      c_bunc_the_i = {
        name = "條形",
        text = {
          "{C:attention}連接{}4張選擇的卡牌",
          "所有牌都具有相同{C:attention}牌級或花色{}"
        }
      }
    },
    Enhanced = {
      m_bunc_copper = {
        name = "紅銅牌",
        text = {
          "如果{C:attention}鄰近{}有其他得分的紅銅牌",
          "這張卡牌會重新得分一次"
        }
      },
      m_bunc_cracker = {
        name = "餅乾牌",
        text = {
          "這張卡牌會在{C:attention}棄掉{}後打出",
          "並在得分後摧毀"
        }
      }
    },
    Tarot = {
      c_bunc_sky = {
        name = "天空",
        text = {
          "選擇最多{C:attention}#1#{}張卡牌",
          "來轉換至{C:bunc_fleurons}花葉{}花色牌"
        }
      },
      c_bunc_abyss = {
        name = "深淵",
        text = {
          "選擇最多{C:attention}#1#{}張卡牌",
          "來轉換至{C:bunc_halberds}斧槍{}花色牌"
        }
      },
      c_bunc_art = {
        name = "藝術",
        text = {
          "選擇最多{C:attention}#1#{}張卡牌",
          "來加強為{C:attention}#2#"
        }
      },
      c_bunc_lust = {
        name = "慾望",
        text = {
          "每張在手牌中的卡牌",
          "會給予{C:money}$#1#{}",
          "{C:inactive}（最多{C:money}$#2#{C:inactive}）",
          "{C:inactive}（目前會給予{C:money}$#3#{C:inactive}）"
        }
      },
      c_bunc_adjustment = {
        name = "調節",
        text = {
          "選擇最多{C:attention}#1#{}張卡牌",
          "來加強為{C:attention}#2#"
        }
      },
      c_bunc_wheel_of_fortune = {
        name = "幸運之輪",
        text = {
          "有{C:green}#1#/#2#{}的機率附加",
          "{C:dark_edition}銀箔{}、{C:dark_edition}全息{}、",
          "{C:dark_edition}彩色{}或{C:dark_edition}閃光{}版本",
          "到隨機一張{C:attention}小丑牌{}"
        }
      },
      c_bunc_universe = {
        name = "宇宙",
        text = {
          "選擇最多{C:attention}#1#{}張卡牌",
          "來{C:attention}隨機{}那些卡牌的",
          "牌級，加強效果，版本及封蠟章"
        }
      }
    },
    Voucher = {
      v_bunc_pin_collector = {
        unlock = {
          "合共跳過",
          "{E:1,C:attention}#1#{}個盲注",
          "{C:inactive}(#2#)"
        },
        name = "飾針收藏家",
        text = {
          "所有新的{C:attention}雙倍標籤",
          "會變成{C:attention}三倍標籤"
        }
      },
      v_bunc_shell_game = {
        unlock = {
          "打開{E:1,C:attention}#1#{}個",
          "擴充包",
          "{C:inactive}(#2#)"
        },
        name = "空殼遊戲",
        text = {
          "每個擴充包裏的{C:attention}內容",
          "可以刷新{C:attention}1{}次"
        }
      },
      v_bunc_disguise = {
        name = "喬裝",
        text = {
          "{C:attention}盲注擴充包{}",
          "有機率出現在商店中"
        }
      },
      v_bunc_arcade_machine = {
        name = "街機",
        text = {
          "商店內出現{C:bunco_virtual_dark}虛擬擴充包{}的頻率",
          "增加{C:attention}四倍{}"
        }
      },
      v_bunc_hedge_trimmer = {
        name = "樹籬修剪",
        text = {
          "每次打出手牌後",
          "對盲注所需分數減低{C:attention}#1#%{}"
        }
      },
      v_bunc_polybius = {
        unlock = {
          "合共製造{E:1,C:attention}#1#{}個連接卡牌的組合",
          "{C:inactive}(#2#)"
        },
        name = "波利比烏斯",
        text = {
          "{C:bunco_virtual_dark}多連塊牌{}可以連接{C:attention}額外一張{}卡牌",
          "{s:0.6,C:inactive}額外的卡牌可以是任何卡牌"
        }
      },
      v_bunc_chainsaw = {
        unlock = {
          "使用樹籬修剪",
          "來減低分數合共{C:attention,E:1}#1#{}次",
          "{C:inactive}(#2#)"
        },
        name = "電鋸",
        text = {
          "所有所需分數",
          "減低{C:attention}#1#%{}"
        }
      },
      v_bunc_lamination = {
        name = "塑封",
        text = {
          "在{C:attention}擴充包{}裏的消耗牌",
          "有機會以帶有{C:dark_edition}版本{}的形式出現"
        }
      },
      v_bunc_supercoating = {
        unlock = {
          "使用{C:attention,E:1}#1#{}張",
          "帶有{C:attention,E:1}版本{}的消耗牌",
          "{C:inactive}(#2#)"
        },
        name = "專業鍍膜",
        text = {
          "所有在{C:attention}擴充包{}裏的消耗牌",
          "都將以帶有{C:dark_edition}版本{}的形式出現"
        }
      },
      v_bunc_cups_n_balls = {
        name = "三仙歸洞",
        text = {
          "擴充包欄位{C:attention}+1{}"
        }
      },
      v_bunc_masquerade = {
        unlock = {
          "使用盲注擴充包",
          "來調換{E:1,C:attention}#1#{}個盲注",
          "{C:inactive}(#2#)"
        },
        name = "化裝舞會",
        text = {
          "所有在商店的{C:attention}盲注擴充包{}",
          "均為免費"
        }
      },
      v_bunc_fanny_pack = {
        name = "腰包",
        text = {
          "每次{C:attention}跳過{}盲注後",
          "有{C:green}#1#/#2#{}的機率",
          "獲得一個{C:attention}雙倍標籤"
        }
      }
    },
    Planet = {
      c_bunc_quaoar = {
        name = "創神星"
      },
      c_bunc_haumea = {
        name = "妊神星"
      },
      c_bunc_makemake = {
        name = "鳥神星"
      },
      c_bunc_sedna = {
        name = "賽德娜"
      }
    },
    Other = {
      bunc_cyan_sticker = {
        name = "青色貼紙",
        text = {
          "曾經使用這張小丑牌",
          "在{C:attention}青色賭注{}中獲勝"
        }
      },
      bunc_drawn_linked_cards = {
        text = {
          "{C:attention}連接{}的卡牌會一同抽出"
        }
      },
      bunc_reactive = {
        name = "活躍",
        text = {
          "如果在底注中沒有跳過盲注",
          "這張小丑牌會被減益"
        }
      },
      p_bunc_blind = {
        name = "盲注擴充包",
        text = {
          "從{C:attention}#1#個Boss盲注{}中",
          "選擇1個來取代目前底注的Boss盲注"
        }
      },
      bunc_linked_cards = {
        text = {
          "這張牌與這些牌{C:attention}連接{}"
        }
      },
      bunc_scattering = {
        name = "分散",
        text = {
          "這張小丑牌被移除時",
          "會移除鄰近的隨機小丑牌"
        }
      },
      p_bunc_virtual_normal = {
        name = "虛擬擴充包",
        text = {
          "抽出牌組中所有卡牌",
          "並從{C:attention}#2#張{C:bunco_virtual_dark}多連塊牌{}中",
          "選擇{C:attention}#1#{}張並馬上使用"
        }
      },
      bunc_linked_group = {
        name = "連接牌",
        text = {
          "連接一起的卡牌",
          "這些卡牌會一同抽出，選擇",
          "並{C:attention}一同{}摧毀"
        }
      },
      bunc_dark_suits = {
        name = "深色花色",
        text = {
          "{C:spades}黑桃{}及{C:clubs}梅花"
        }
      },
      bunc_hindered = {
        name = "阻礙",
        text = {
          "賣出這張小丑牌後",
          "會留住原位",
          "直到回合結束"
        }
      },
      p_bunc_virtual_jumbo = {
        name = "特大虛擬擴充包",
        text = {
          "抽出牌組中所有卡牌",
          "並從{C:attention}#2#張{C:bunco_virtual_dark}多連塊牌{}中",
          "選擇{C:attention}#1#{}張並馬上使用"
        }
      },
      bunc_light_suits_exotic = {
        name = "淺色花色",
        text = {
          "{C:hearts}紅心{}，{C:diamonds}方塊",
          "及{C:bunc_fleurons}花葉"
        }
      },
      bunc_temporary_extra_chips = {
        text = {
          "{C:chips}+#1#{}只限本局的額外籌碼"
        }
      },
      bunc_light_suits = {
        name = "淺色花色",
        text = {
          "{C:hearts}紅心{}及{C:diamonds}方塊"
        }
      },
      bunc_pink_sticker = {
        name = "粉紅貼紙",
        text = {
          "曾經使用這張小丑牌",
          "在{C:attention}粉紅賭注{}中獲勝"
        }
      },
      bunc_exotic_cards = {
        name = "奇異卡牌",
        text = {
          "帶有",
          "{C:bunc_fleurons}花葉{}或{C:bunc_halberds}斧槍{}花色的卡牌"
        }
      },
      undiscovered_polymino = {
        name = "未發現",
        text = {
          "在無種子的遊戲中",
          "購買或使用這張卡牌",
          "來了解它的功能"
        }
      },
      bunc_magenta_sticker = {
        name = "洋紅貼紙",
        text = {
          "曾經使用這張小丑牌",
          "在{C:attention}粉紅賭注{}中獲勝"
        }
      },
      p_bunc_virtual_mega = {
        name = "超級虛擬擴充包",
        text = {
          "抽出牌組中所有卡牌",
          "並從{C:attention}#2#張{C:bunco_virtual_dark}多連塊牌{}中",
          "選擇{C:attention}#1#{}張並馬上使用"
        }
      },
      bunc_dark_suits_exotic = {
        name = "深色花色",
        text = {
          "{C:spades}黑桃{}，{C:clubs}梅花",
          "及{C:bunc_halberds}斧槍"
        }
      }
    },
    Joker = {
      j_bunc_cassette_a = {
        name = "錄音帶（A面）",
        text = {
          "帶有{C:attention}淺色花色{}的卡牌",
          "在得分時給予{C:chips}+#1#{}籌碼"
        }
      },
      j_bunc_luchador = {
        name = "摔角手",
        text = {
          "賣出這張牌",
          "來產生一個免費的{C:attention}清除標籤"
        }
      },
      j_bunc_ghost_print = {
        name = "重影小丑",
        text = {
          "給予上一個打出的{C:attention}牌型{}的",
          "籌碼及倍數",
          "{C:inactive}（上一個牌型：#1#）"
        }
      },
      j_bunc_trigger_finger = {
        unlock = {
          "在沒有停用限制效果下",
          "擊敗{E:1,C:attention}蔚藍鈴鐺"
        },
        name = "扳機指",
        text = {
          "倍數{X:mult,C:white}X#1#{}",
          "{C:attention}選擇{}的卡牌",
          "有{C:green}#2#/#3#{}的機率",
          "會被強制打出"
        }
      },
      j_bunc_rasta = {
        unlock = {
          "在沒有得到{C:attention,E:1}加強牌{}下",
          "贏得一局遊戲"
        },
        name = "拉斯塔法里",
        text = {
          "如果打出的手牌沒有得分的{C:attention}加強牌{}",
          "倍數{C:mult}+#1#{}"
        }
      },
      j_bunc_crop_circles_exotic = {
        name = "麥田圈",
        text = {
          "以{C:bunc_fleurons}花葉{}為基礎花色的卡牌在得分時給予{C:mult}+4{}倍數",
          "以{C:clubs}梅花{}為基礎花色的卡牌在得分時給予{C:mult}+3{}倍數",
          "打出的{C:attention}8{}在得分時給予{C:mult}+2{}倍數",
          "打出的{C:attention}Q{}，{C:attention}10{}，{C:attention}9{}及{C:attention}6{}在得分時給予{C:mult}+1{}倍數"
        }
      },
      j_bunc_rubber_band_ball = {
        name = "橡皮筋球",
        text = {
          "每個在這局遊戲中製造的{C:attention}連接組合{}",
          "會給予這張小丑牌{X:mult,C:white}X#1#{}倍數",
          "{C:inactive}（目前會給予：{X:mult,C:white}X#2#{C:inactive}倍數）"
        }
      },
      j_bunc_dogs_playing_poker = {
        name = "玩撲克的狗",
        text = {
          "如果所有得分的卡牌是{C:attention}2{}、{C:attention}3{}、{C:attention}4{}或{C:attention}5",
          "倍數{X:mult,C:white}X#1#{}"
        }
      },
      j_bunc_mousetrap = {
        name = "捕鼠器",
        text = {
          "{C:chips}+#1#{}籌碼，",
          "有{C:green}#2#/#3#{}的機率不會觸發",
          "並{C:attention}失去{}一次出牌次數"
        }
      },
      j_bunc_disproportionality = {
        name = "比例錯誤",
        text = {
          ""
        }
      },
      j_bunc_slothful = {
        unlock = {
          "打出只有5張",
          "{C:attention,E:1}萬能牌{}的手牌"
        },
        name = "懶惰小丑",
        text = {
          "打出的{C:attention}萬能牌",
          "在得分時給予{C:mult}+#1#{}倍數"
        }
      },
      j_bunc_roygbiv = {
        name = "彩虹小丑",
        text = {
          "如果打出的手牌包含{C:attention}五色",
          "將有{C:green}#1#/#2#{}的機率",
          "對隨機的得分牌附加{C:dark_edition}彩色{}版本"
        }
      },
      j_bunc_metallurgist = {
        name = "冶金小丑",
        text = {
          "每張在手牌中的{C:attention}黃金牌{}",
          "會給予{C:mult}+#1#{}倍數"
        }
      },
      j_bunc_games_collector = {
        name = "遊戲收藏家",
        text = {
          "當有連接牌{C:attention}抽到{}手中時",
          "這張小丑牌將獲得{C:chips}+#1#{}籌碼",
          "{C:inactive}（目前會給予：{C:chips}+#2#{C:inactive}籌碼）"
        }
      },
      j_bunc_lurid = {
        name = "駭人小丑",
        text = {
          "如果打出的手牌包含{C:attention}五色",
          "{C:chips}+#1#{}籌碼"
        }
      },
      j_bunc_knight = {
        unlock = {
          "在沒有停用限制效果下",
          "擊敗{E:1,C:attention}琥珀橡果"
        },
        name = "騎士小丑",
        text = {
          "選擇{C:attention}盲注{}後，{C:attention}洗亂{}所有小丑牌",
          "這張小丑牌並會獲得{C:mult}+#1#{}倍數",
          "如果有小丑牌重新排列，獲得的倍數將會{C:red}重設{}",
          "{C:inactive}（目前會給予{C:mult}+#2#{C:inactive}倍數）"
        }
      },
      j_bunc_stylophone = {
        name = "賽樂瘋",
        text = {
          "當卡牌得分時，",
          "會給予它們{C:attention}牌級{}的{C:attention}X#1#{}倍的數量的倍數"
        }
      },
      j_bunc_pawn = {
        name = "棋兵",
        text = {
          "在你的牌組中",
          "{C:attention}最低{}牌級的卡牌",
          "會在得分後{C:attention}提升一個等級{}",
          "{C:inactive}（目前最低的牌級：#1#）"
        }
      },
      j_bunc_gameplan = {
        unlock = {
          "在沒有停用限制效果下",
          "擊敗{E:1,C:attention}翠綠樹葉"
        },
        name = "戰術板",
        text = {
          "在這張小丑牌鄰近的{C:attention}小丑牌{}",
          "會被{C:red}減益{}並給予{C:mult}+#1#{}倍數"
        }
      },
      j_bunc_cellphone = {
        name = "手提電話",
        text = {
          "如果回合中沒有棄掉卡牌",
          "在第一次出牌後，所有得分的卡牌會{C:attention}回到{}手中"
        }
      },
      j_bunc_shepherd = {
        name = "牧羊人小丑",
        text = {
          "當打出的卡牌包含{C:attention}對子{}時",
          "這張小丑牌會獲得{C:chips}+#1#{}籌碼",
          "{C:inactive}（目前會給予{C:chips}+#2#{C:inactive}籌碼）"
        }
      },
      j_bunc_running_joke = {
        name = "重複性笑話",
        text = {
          "進入商店時",
          "產生一張{C:dark_edition}負片{}的\"{C:attention}小丑{}\""
        }
      },
      j_bunc_the_joker = {
        unlock = {
          "發現所有",
          "{C:attention}Boss盲注"
        },
        name = "盲注小丑",
        text = {
          "打出手牌後",
          "每張得分的非加強牌",
          "有{C:green}#1#/#2#{}的機率被摧毀"
        }
      },
      j_bunc_vandalism = {
        unlock = {
          "打出只有5張",
          "{C:attention,E:1}被翻起的卡牌{}的手牌"
        },
        name = "惡作劇小丑",
        text = {
          "卡牌有{C:green}#1#/#2#{}的機率",
          "會以面朝下抽出",
          "面朝下的卡牌在得分時給予{X:mult,C:white}X#3#{}倍數"
        }
      },
      j_bunc_bounty_hunter = {
        unlock = {
          "在一局遊戲中",
          "擁有少於{E:1,C:attention}$#1#{}金錢"
        },
        name = "賞金獵人",
        text = {
          "所有金錢來源的收入降低{C:money}#1#${}",
          "當你獲得金錢時，這張小丑牌會獲得{C:mult}+#1#{}倍數",
          "{C:inactive}（目前會給予：{C:mult}+#2#{C:inactive}倍數）"
        }
      },
      j_bunc_puzzle_board = {
        name = "解謎版",
        text = {
          "使用{C:tarot}塔羅牌{}後，",
          "有{C:green}#1#/#2#{}的機率",
          "附加{C:dark_edition}銀箔{}、{C:dark_edition}全息{}",
          "或{C:dark_edition}彩色{}版本",
          "到選擇的隨機卡牌中"
        }
      },
      j_bunc_mosaic = {
        unlock = {
          "在一次出牌中",
          "打出5張只有{C:attention,E:1}石頭牌{}的手牌"
        },
        name = "馬賽克小丑",
        text = {
          "打出的{C:attention}石頭牌",
          "在得分時，給予{C:mult}+#1#{}倍數"
        }
      },
      j_bunc_juggalo = {
        unlock = {
          "使用{C:attention,E:1}#1#{}張",
          "帶有{C:attention,E:1}版本{}的消耗牌",
          "{C:inactive}(#2#)"
        },
        name = "嘻哈小丑",
        text = {
          "選擇{C:attention}盲注{}後",
          "附加{C:dark_edition}銀箔{}、{C:dark_edition}全息{}、",
          "{C:dark_edition}彩色{}或{C:dark_edition}閃光{}版本",
          "到一張隨機的{C:attention}消耗牌{}"
        }
      },
      j_bunc_hardtack = {
        name = "壓縮餅乾",
        text = {
          "{C:attention}餅乾牌{}不會在棄掉後",
          "被摧毀"
        }
      },
      j_bunc_doorhanger = {
        unlock = {
          "在沒有得到{C:attention,E:1}常見{}小丑牌下",
          "贏得一局遊戲"
        },
        name = "門把掛牌",
        text = {
          "{C:blue}常見{}的小丑牌不再出現",
          "{s:0.8}會以其他稀有度的小丑牌取代"
        }
      },
      j_bunc_astigmatism = {
        name = "散光小丑",
        text = {
          "{C:hearts}紅心{}及{C:diamonds}方塊{}花色的卡牌",
          "都一律視為{C:bunc_fleurons}花葉{}花色"
        }
      },
      j_bunc_envious = {
        name = "忌妒小丑",
        text = {
          "每張打出的{C:bunc_fleurons}花葉{}花色的卡牌",
          "在得分時給予{C:red}+#1#{}倍數"
        }
      },
      j_bunc_pica = {
        name = "異食小丑",
        text = {
          "當棄掉{C:attention}餅乾牌{}時",
          "打出所有棄掉的卡牌"
        }
      },
      j_bunc_nil_bill = {
        name = "虛無胡迪尼",
        text = {
          "當有卡牌被摧毀時",
          "獲得{C:money}$#1#{}"
        }
      },
      j_bunc_kite_experiment = {
        name = "風箏實驗",
        text = {
          "重新得分的{C:attention}紅銅牌",
          "會有{C:green}#1#/#2#{}的機率",
          "再次{C:attention}重新得分{}一次"
        }
      },
      j_bunc_neon = {
        unlock = {
          "打出只有5張",
          "{C:attention,E:1}被減益的卡牌{}的手牌"
        },
        name = "霓虹燈小丑",
        text = {
          "當有卡牌{C:attention}加強{}時",
          "自動附上{C:dark_edition}螢光{}版本",
          "到那張卡牌中"
        }
      },
      j_bunc_taped = {
        name = "捆紮的小丑",
        text = {
          "在{C:attention}Boss盲注{}中",
          "{C:attention}連接{}在第一次出牌中的所有得分牌"
        }
      },
      j_bunc_cassette_extra = {
        text = {
          "{C:inactive}棄掉卡牌時，翻起這張小丑牌"
        }
      },
      j_bunc_doodle = {
        unlock = {
          "贏得{C:attention,E:1}#1#{}局遊戲",
          "{C:inactive}(#2#)"
        },
        name = "塗鴉",
        text = {
          "{C:attention}複製{}每個回合中",
          "第一張使用的{C:tarot}塔羅牌{}或{C:planet}行星牌{}",
          "{C:inactive}（必須有空位）"
        }
      },
      j_bunc_head_in_the_clouds = {
        unlock = {
          "在{C:attention,E:1}高牌{}為最高等級的牌型下",
          "贏得一局遊戲"
        },
        name = "人頭在天",
        text = {
          "當你升級任何一個{C:attention}牌型{}時",
          "會有{C:green}#1#/#2#{}的機率",
          "對{C:attention}高牌{}等級提升一級"
        }
      },
      j_bunc_myopia = {
        name = "近視小丑",
        text = {
          "{C:spades}黑桃{}及{C:clubs}梅花{}花色的卡牌",
          "都一律視為{C:bunc_halberds}斧槍{}花色"
        }
      },
      j_bunc_unobtanium = {
        name = "難得素",
        text = {
          "每張打出的{C:bunc_halberds}斧槍{}花色的卡牌",
          "在得分時給予{C:chips}+#1#{}籌碼及{C:mult}+#2#{}倍數"
        }
      },
      j_bunc_hierarchy_of_needs = {
        name = "需求層次",
        text = {
          "每個在{C:attention}你的牌組{}中的{C:attention}2至A{}同花順序",
          "會給予{C:mult}+#1#{}倍數",
          "{C:inactive}（目前會給予{C:mult}+#2#{C:inactive}倍數）"
        }
      },
      j_bunc_rigoletto = {
        unlock = {
          "{E:1,s:1.3}?????"
        },
        name = "利戈萊托",
        text = {
          "每張在你的{C:attention}牌組{}中的{C:bunco_exotic}奇異卡牌{}",
          "會給予這張小丑牌{X:mult,C:white}X#1#{}倍數",
          "{C:inactive}（目前會給予：{X:mult,C:white}X#2#{C:inactive}倍數）"
        }
      },
      j_bunc_dynasty = {
        name = "萬眾一心",
        text = {
          "如果打出的手牌包含{C:attention}五色",
          "倍數{X:mult,C:white}X#1#{}"
        }
      },
      j_bunc_fondue = {
        name = "起司火鍋",
        text = {
          "所有在{C:attention}第一次出牌{}中的得分牌",
          "會轉為{C:bunc_fleurons}花葉{}花色"
        }
      },
      j_bunc_starfruit = {
        name = "楊桃",
        text = {
          "如果打出的牌型包含{C:attention}五色",
          "對那個牌型的等級提升一級",
          "這張小丑牌有{C:green}#1#/#2#{}的機率",
          "在回合結束後摧毀"
        }
      },
      j_bunc_red_card = {
        name = "紅牌",
        text = {
          "每個被跳過的{C:attention}擴充包{}選項",
          "會給予這張小丑牌{C:red}+#1#{}倍數",
          "{C:inactive}（目前會給予{C:red}+#2#{C:inactive}倍數）"
        }
      },
      j_bunc_zealous = {
        name = "狂熱小丑",
        text = {
          "如果打出的手牌包含{C:attention}五色",
          "倍數{C:mult}+#1#{}"
        }
      },
      j_bunc_basement = {
        name = "地下室小丑",
        text = {
          "擊敗{C:attention}Boss盲注{}時",
          "產生一張隨機的{C:spectral}幻靈牌{}",
          "{C:inactive}（必須有空位）"
        }
      },
      j_bunc_bierdeckel = {
        name = "啤酒杯蓋",
        text = {
          "打出或棄掉卡牌後，",
          "在手中的卡牌會獲得{C:chips}+#1#{}籌碼",
          "直到回合結束"
        }
      },
      j_bunc_proud = {
        name = "驕傲小丑",
        text = {
          "每張打出的{C:bunc_halberds}斧槍{}花色的卡牌",
          "在得分時給予{C:red}+#1#{}倍數"
        }
      },
      j_bunc_wishalloy = {
        name = "夢合金",
        text = {
          "每張打出的{C:bunc_fleurons}花葉{}花色的卡牌",
          "在得分時有{C:green}#1#/#2#{}的機率",
          "會獲得與卡牌得到的籌碼相等的{C:money}金錢{}"
        }
      },
      j_bunc_headache = {
        name = "頭暈目眩",
        text = {
          "每當摧毀{C:attention}#1#{}張卡牌時",
          "產生一個{C:bunco_virtual_dark}街機標籤",
          "{C:inactive}（目前已摧毀{C:attention}#2#{C:inactive}/#1#張卡牌）"
        }
      },
      j_bunc_loan_shark = {
        unlock = {
          "在一個回合中",
          "花掉至少{E:1,C:attention}$100"
        },
        name = "高利貸者",
        text = {
          "得到這張牌時",
          "獲得{C:money}$#1#"
        }
      },
      j_bunc_robot = {
        name = "機械小丑",
        text = {
          [1] = "每當有{C:attention}紅銅牌{}重新得分時",
          [2] = "這張小丑牌會獲得{C:mult}+#1#{}倍數",
          [4] = "{C:inactive}（目前會給予：{C:mult}+#2#{C:inactive}倍數）"
        }
      },
      j_bunc_sledgehammer = {
        unlock = {
          "打出只有5張",
          "{C:attention,E:1}玻璃牌{}的手牌"
        },
        name = "大錘",
        text = {
          "{C:attention}玻璃牌{}會給予額外{X:mult,C:white}X#1#{}倍數",
          "但會總是在得分後摧毀"
        }
      },
      j_bunc_glue_gun = {
        name = "熱熔膠槍",
        text = {
          "賣掉這張牌",
          "來{C:attention}連接{}最多#1#張選擇的卡牌"
        }
      },
      j_bunc_headshot = {
        name = "爆頭",
        text = {
          "如果打出的手牌只有一張得分的{C:attention}人頭牌{}",
          "倍數{X:mult,C:white}X#1#{}"
        }
      },
      j_bunc_wino = {
        name = "醉鬼小丑",
        text = {
          "打出的{C:hearts}紅心{}及{C:diamonds}方塊{}花色的卡牌",
          "在得分時給予{C:chips}+#1#{}籌碼"
        }
      },
      j_bunc_jumper = {
        name = "跳躍水管工",
        text = {
          "如果打出的手牌包含{C:attention}同花{}",
          "這張小丑牌將獲得{C:chips}+#1#{}籌碼",
          "{C:inactive}（目前會給予：{C:chips}+#2#{C:inactive}籌碼）"
        }
      },
      j_bunc_magic_wand = {
        name = "魔法棒",
        text = {
          "每次{C:attention}連續{}打出帶有{C:attention}五色{}的手牌時",
          "這張小丑牌會獲得{C:mult}+#1#{}倍數",
          "{C:inactive}（目前會給予：{C:mult}+#2#{C:inactive}倍數）"
        }
      },
      j_bunc_jmjb = {
        unlock = {
          "打開{E:1,C:attention}#1#{}個",
          "擴充包",
          "{C:inactive}(#2#)"
        },
        name = "小丑戰士及弄臣男孩的第54張集換式卡牌",
        text = {
          "所有{C:attention}標準擴充包{}",
          "只會包含{C:attention}加強牌{}"
        }
      },
      j_bunc_on_broadway = {
        name = "百老匯戲劇",
        text = {
          "如果打出的手牌包含{C:attention}順子{}",
          "並包含得分的{C:attention}人頭牌",
          "{C:chips}+#1#{}籌碼及倍數{C:mult}+#2#{}"
        }
      },
      j_bunc_tangram = {
        name = "七巧板",
        text = {
          "當有{C:attention}7{}得分時，",
          "將給予{C:mult}+#1#{}倍數乘以得分的{C:attention}7{}的數量"
        }
      },
      j_bunc_righthook = {
        unlock = {
          "額外觸發",
          "一張卡牌至少{E:1,C:attention}#1#次{}"
        },
        name = "右擺拳小丑",
        text = {
          "每個剩餘的{C:blue}出牌次數{}",
          "會額外觸發最右邊的得分牌一次"
        }
      },
      j_bunc_conquest = {
        unlock = {
          "在沒有停用限制效果下",
          "擊敗{E:1,C:attention}緋紅之心"
        },
        name = "征服地圖",
        text = {
          "{C:chips}+#1#{}籌碼",
          "選擇{C:attention}盲注{}後，",
          "對隨機一張小丑牌{C:red}減益{}"
        }
      },
      j_bunc_domino = {
        name = "骨牌",
        text = {
          "當{C:attention}使用{}或{C:attention}獲得",
          "從商店或擴充包的卡牌時",
          "將會獲得{C:attention}兩{}張鄰近的卡牌",
          "{C:inactive}（必須有空位）{}"
        }
      },
      j_bunc_xray = {
        unlock = {
          "完成{E:1,C:attention}透視眼{}挑戰"
        },
        name = "X射線",
        text = {
          "每張以朝下抽出的卡牌",
          "會給予這張小丑牌{X:mult,C:white}X#1#{}倍數",
          "{C:inactive}（目前會給予{X:mult,C:white}X#2#{C:inactive}倍數）"
        }
      },
      j_bunc_linocut = {
        name = "浮雕版畫",
        text = {
          "如果打出的卡牌剛好是{C:attention}2{}張卡牌",
          "並其牌型為{C:attention}對子{}，",
          "轉換{C:attention}左邊{}卡牌的花色",
          "至{C:attention}右邊{}卡牌的花色",
          "{C:inactive}（拉動即可重新排列）"
        }
      },
      j_bunc_loan_shark_full = {
        name = "高利貸者",
        text = {
          "得到這張牌時，獲得{C:money}$#1#",
          "把賣出價格設置{C:money}$-100"
        }
      },
      j_bunc_prehistoric = {
        unlock = {
          "打出{E:1,C:attention}同花五條"
        },
        name = "史前小丑",
        text = {
          "如果打出的卡牌",
          "與同一個回合中{C:attention}上一張的得分牌{}",
          "分享{C:attention}相同的牌級及花色{}",
          "在得分時會給予{C:mult}+#1#{}倍數"
        }
      },
      j_bunc_registration_plate = {
        unlock = {
          "完成{E:1,C:attention}一刻鐘城市{}挑戰"
        },
        name = "註冊車牌",
        text = {
          "#1#",
          "會有所有在這局遊戲中",
          "打出的{C:attention}牌型{}的籌碼及倍數",
          "{s:0.8}需要的組合在回合結束後變更"
        }
      },
      j_bunc_hopscotch = {
        name = "跳房子",
        text = {
          "如果打出的手牌包含{C:attention}順子{}",
          "將會獲得{C:red}+#1#{}棄牌次數"
        }
      },
      j_bunc_zero_shapiro = {
        name = "零零精靈",
        text = {
          "打出的{C:attention}K{}、{C:attention}Q{}、{C:attention}J{}及{C:attention}無牌級卡牌",
          "在得分時，有{C:green}#1#/#2#{}機率",
          "產生一個{C:attention}D6標籤"
        }
      },
      j_bunc_dread = {
        unlock = {
          "在一個回合中",
          "對牌組移除至少{E:1,C:attention}#1#{}張卡牌"
        },
        name = "恐懼小丑",
        text = {
          "當{C:attention}最後一次{}出牌已經得分後",
          "對打出的牌型的等級提升{C:attention}#1#級{}",
          "並{C:attention}摧毀{}所有得分牌",
          "{C:inactive,s:0.8}所有從這張小丑牌得到的等級",
          "{C:inactive,s:0.8}將會在這張牌被移除後損失"
        }
      },
      j_bunc_crop_circles = {
        name = "麥田圈",
        text = {
          "以{C:clubs}梅花{}為基礎花色的卡牌在得分時給予{C:mult}+3{}倍數",
          "打出的{C:attention}8{}在得分時給予{C:mult}+2{}倍數",
          "打出的{C:attention}Q{}，{C:attention}10{}，{C:attention}9{}及{C:attention}6{}在得分時給予{C:mult}+1{}倍數"
        }
      },
      j_bunc_voxel = {
        unlock = {
          "擁有至少{C:attention}#1#{}張{E:1,C:attention}加強牌{}",
          "在你的牌組中"
        },
        name = "體素小丑",
        text = {
          "倍數{X:mult,C:white}X#1#{}，每張在你的{C:attention}牌組{}中的{C:attention}加強牌{}",
          "會對這張小丑牌損失{X:mult,C:white}-X#2#{}倍數",
          "{C:inactive}（目前會給予{X:mult,C:white}X#3#{C:inactive}倍數）"
        }
      },
      j_bunc_aristocrat = {
        unlock = {
          "在沒有打開任何{C:attention}擴充包{}下",
          "贏得一局遊戲"
        },
        name = "貴族小丑",
        text = {
          "可以從{C:attention}擴充包{}中",
          "選擇額外一張卡牌"
        }
      },
      j_bunc_cassette_b = {
        name = "錄音帶（B面）",
        text = {
          "帶有{C:attention}深色花色{}的卡牌",
          "在得分時，給予{C:mult}+#2#{}倍數"
        }
      },
      j_bunc_carnival = {
        unlock = {
          "到達第{E:1,C:attention}0{}級底注"
        },
        name = "嘉年華",
        text = {
          "擊敗{C:attention}Boss盲注{}後，",
          "{C:attention}摧毀{}隨機的小丑牌",
          "並對底注減低一級",
          "每個底注只可觸發一次"
        }
      },
      j_bunc_protester = {
        name = "示威者",
        text = {
          "對這個回合中",
          "棄掉最高牌級的卡牌的{C:attention}#1#倍{}數量",
          "增加至這張小丑牌的籌碼中",
          "{C:inactive}（目前會給予：{C:chips}+#2#{C:inactive}籌碼）"
        }
      },
      j_bunc_fiendish = {
        unlock = {
          "完成{E:1,C:attention}孤注一擲{}挑戰"
        },
        name = "惡魔小丑",
        text = {
          "對所有金錢來源的數量加倍，",
          "有{C:green}#1#/#2#{}的機率",
          "把盲注中兌現的金錢設至{C:money}$1{}"
        }
      },
      j_bunc_fingerprints = {
        name = "手指模",
        text = {
          "在{C:attention}獲勝手牌{}中的得分牌",
          "會獲得{C:chips}+#1#{}籌碼",
          "直到下一個回合結束"
        }
      },
      j_bunc_critic = {
        name = "批評家小丑",
        text = {
          "如果打出的手牌得到的分數",
          "{C:attention}少於{}盲注所需分數的{C:attention}1/#2#{}，倍數{X:mult,C:white}X#1#{}"
        }
      },
      j_bunc_dwarven = {
        unlock = {
          "打出一個帶有",
          "{E:1,C:attention}石頭牌{}，{E:1,C:attention}鋼鐵牌",
          "及{E:1,C:attention}黃金牌{}的手牌"
        },
        name = "矮人小丑",
        text = {
          "在手牌中的{C:attention}石頭牌{}",
          "會帶有{C:attention}鋼鐵牌{}及{C:attention}黃金牌{}的效果"
        }
      }
    },
    Edition = {
      e_bunc_consumable_edition_bunc_glitter = {
        name = "閃光",
        text = {
          "產生一個{C:attention}超級籌碼標籤"
        }
      },
      e_bunc_fluorescent = {
        name = "螢光",
        text = {
          "這張牌不會被翻起，減益",
          "或強制選擇"
        }
      },
      e_bunc_glitter = {
        name = "閃光",
        text = {
          "{X:chips,C:white}X#1#{}籌碼"
        }
      },
      e_bunc_consumable_edition_foil = {
        name = "銀箔",
        text = {
          "產生一個{C:attention}籌碼標籤"
        }
      },
      e_bunc_consumable_edition_polychrome = {
        name = "彩色",
        text = {
          "產生一個{C:attention}超級倍數標籤"
        }
      },
      e_bunc_consumable_edition_holo = {
        name = "全息",
        text = {
          "產生一個{C:attention}倍數標籤"
        }
      }
    },
    Spectral = {
      c_bunc_cleanse = {
        name = "淨化",
        text = {
          "附加{C:dark_edition}螢光{}效果",
          "到{C:attention}#1#{}張選擇的卡牌中"
        }
      },
      c_bunc_the_8 = {
        name = "萬能形",
        text = {
          "{C:attention}連接{}任何未連接的卡牌",
          "可連接的卡牌沒有上限",
          "{C:inactive,s:0.6}（使用這張牌時，不會有卡牌選擇的上限）"
        }
      },
      c_bunc_aura = {
        name = "光環",
        text = {
          "新增{C:dark_edition}銀箔{}、{C:dark_edition}全息{}、{C:dark_edition}彩色{}或{C:dark_edition}閃光{}版本",
          "到選擇的{C:attention}1{}張手牌中"
        }
      }
    }
  }
}

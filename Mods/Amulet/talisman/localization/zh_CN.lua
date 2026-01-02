return {
    descriptions = {
        Mod = {
            Talisman = {
                name = "Talisman",
                text = { "一个提高 Balatro 分数上限并跳过计分动画的 mod。" },
            }
        }
    },
    test = "j",

    tal_disable_anim = '禁用计分动画',
    tal_disable_omega = '禁用 OmegaNum（需要重启）',
    tal_enable_compat = '启用类型兼容',
    tal_enable_compat_warning = {
        '警告：类型兼容与某些 mod 不兼容，',
        '启用后可能会导致意外崩溃。'
    },
    tal_debug_coroutine = '调试协程',
    tal_debug_coroutine_warning = {
        '在计算过程中崩溃时捕获计分协程的堆栈跟踪。',
        '使崩溃时的调试稍微容易一些。'
    },

    tal_calculating = '计算中...',
    tal_abort = '中止',
    tal_elapsed = '已完成计算',
    tal_current_state = '当前计分',
    tal_card_prog = '已计分卡牌进度',
    tal_luamem = 'Lua 内存',
    tal_last_elapsed = '上一手牌计算次数',
    tal_unknown = '未知',

    talisman_notation = '数字表示法',

    talisman_notations_hypere = 'Hyper-E',
    talisman_notations_letter = '字母',
    talisman_notations_array = '数组',

    talisman_error_A = '找不到正确的 Talisman 文件夹。请确保 Talisman 的文件夹名称为"Talisman"，而不是"Talisman-main"或其他名称。',
    talisman_error_B = '[Talisman] 解包字符串时出错：',
    talisman_error_C = '[Talisman] 加载字符串时出错：'
}

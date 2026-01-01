# Balatro Modpack

一个 Balatro 游戏的 Mod 整合包。

## 前置依赖

使用本 Modpack 前，需要先安装 [Lovely Injector](https://github.com/ethangreen-dev/lovely-injector/releases/latest)（Mod 注入器），根据你的系统下载对应版本。

## Mod 列表

| Mod 名称 | 类型 | 描述 | 来源 |
|---------|------|------|------|
| [smods](Mods/smods) | 🔧 框架 | Steamodded - Balatro 模组加载框架，是安装其他 Mod 的前置依赖 | [Steamodded/smods](https://github.com/Steamodded/smods) |
| [Bunco](Mods/Bunco) | 📦 内容 | 原版风格的内容扩展，添加新的小丑、卡牌等内容 | [jumbocarrot0/Bunco](https://github.com/jumbocarrot0/Bunco) |
| [Actions](Mods/Actions) | ⚡ 玩法 | 新增"出牌"和"弃牌"之外的更多操作（汉化版） | [balatro-mods-cn/Actions](https://github.com/balatro-mods-cn/Actions) |
| [reverie](Mods/reverie) | 📦 内容 | 电影主题扩展，提供特殊商店和丰富内容 | [jumbocarrot0/reverie](https://github.com/jumbocarrot0/reverie) |
| [Ortalab](Mods/Ortalab) | 🎮 大型 | "反向 Balatro"，150+ 新小丑、20 新挑战、8 新赌注等海量内容（汉化版） | [balatro-mods-cn/Ortalab](https://github.com/balatro-mods-cn/Ortalab) |
| [Cryptid](Mods/Cryptid) | 🎮 大型 | 不平衡的疯狂 Mod，添加大量强力内容 | [SpectralPack/Cryptid](https://github.com/SpectralPack/Cryptid) |
| [Balatrostuck](Mods/Balatrostuck) | 🎮 大型 | 升格为神！星座系统、黄道系统等独特玩法（汉化版） | [balatro-mods-cn/Balatrostuck](https://github.com/balatro-mods-cn/Balatrostuck) |
| [Pokermon](Mods/Pokermon) | 🎮 大型 | 宝可梦主题 Mod，每个小丑都是一只宝可梦 | [InertSteak/Pokermon](https://github.com/InertSteak/Pokermon) |
| [amulet](Mods/amulet) | 🔧 框架 | Talisman 分支，修复高分运行时的数值比较错误，支持更大数字（汉化版） | [balatro-mods-cn/amulet](https://github.com/balatro-mods-cn/amulet) |
| [Galdur](Mods/Galdur) | ⚡ 玩法 | 增强版游戏设置工具，改善牌组和赌注选择界面 | [Eremel/Galdur](https://github.com/Eremel/Galdur) |
| [lock-the-deal](Mods/lock-the-deal) | ⚡ 玩法 | 锁定商店物品，保留到下一回合或重抽（汉化版） | [LnxFCA/balatro-mods](https://github.com/LnxFCA/balatro-mods) |
| [lock-the-deal-common](Mods/lock-the-deal-common) | 🔧 框架 | Lock the Deal 通用库（汉化版） | lock-the-deal 依赖 |
| [MoreFluff](Mods/MoreFluff) | 📦 内容 | 海量内容扩展，添加 75+ 新小丑、新牌组、新消耗品（汉化版） | [notmario/MoreFluff](https://github.com/balatro-mods-cn/MoreFluff) |

### 类型说明

| 类型 | 说明 |
|------|------|
| 🔧 框架 | 核心框架，是其他 Mod 的前置依赖 |
| 📦 内容 | 添加新的小丑、卡牌、消耗品等内容 |
| ⚡ 玩法 | 改变或扩展游戏机制和操作方式 |
| 🎮 大型 | 大规模内容扩展，相当于资料片级别 |

## 安装方法

### 克隆仓库（包含所有子模块）

```bash
git clone --recursive https://github.com/你的用户名/balatro-modpack.git
```

如果已经克隆但没有子模块内容：

```bash
git submodule update --init --recursive
```

### 更新所有 Mod 到最新版本

```bash
git submodule update --remote --merge
```
# Balatro Modpack

一个 Balatro 游戏的 Mod 整合包。

## 前置依赖

使用本 Modpack 前，需要先安装 [Lovely Injector](https://github.com/ethangreen-dev/lovely-injector/releases/latest)（Mod 注入器），根据你的系统下载对应版本。

## Mod 列表

| Mod 名称 | 描述 | 来源 |
|---------|------|------|
| [smods](Mods/smods) | Steamodded - Balatro 模组加载框架，是安装其他 Mod 的前置依赖 | [Steamodded/smods](https://github.com/Steamodded/smods) |
| [Bunco](Mods/Bunco) | 原版风格的内容扩展 Mod，添加新的小丑、卡牌等内容 | [jumbocarrot0/Bunco](https://github.com/jumbocarrot0/Bunco) |
| [Actions](Mods/Actions) | 新增"出牌"和"弃牌"之外的更多操作（汉化版） | [balatro-mods-cn/Actions](https://github.com/balatro-mods-cn/Actions) |
| [reverie](Mods/reverie) | 电影主题扩展，提供特殊商店和丰富内容 | [jumbocarrot0/reverie](https://github.com/jumbocarrot0/reverie) |
| [Ortalab](Mods/Ortalab) | "反向 Balatro"，150+ 新小丑、20 新挑战、8 新赌注等海量内容（汉化版） | [balatro-mods-cn/Ortalab](https://github.com/balatro-mods-cn/Ortalab) |
| [Cryptid](Mods/Cryptid) | 不平衡的疯狂 Mod，添加大量强力内容 | [SpectralPack/Cryptid](https://github.com/SpectralPack/Cryptid) |
| [Balatrostuck](Mods/Balatrostuck) | 升格为神！星座系统、黄道系统等独特玩法（汉化版） | [balatro-mods-cn/Balatrostuck](https://github.com/balatro-mods-cn/Balatrostuck) |

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
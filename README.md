# Balatro Modpack

一个 Balatro 游戏的 Mod 整合包。

## Mod 列表

| Mod 名称 | 描述 | 来源 |
|---------|------|------|
| [smods](Mods/smods) | Steamodded - Balatro 模组加载框架，是安装其他 Mod 的前置依赖 | [Steamodded/smods](https://github.com/Steamodded/smods) |

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
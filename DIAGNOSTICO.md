# 🩺 诊断工具 — AscensionCN

插件没有出现在你的插件列表中，或者更新后没有翻译？这个工具会在5秒内检查最常见的原因，并生成一份报告，以便我们帮助你。

## 如何使用

1. 下载 **`Diagnostico_AscensionCN.bat`**（从 [Releases](../../releases) 或 
	[直接在此处](Diagnostico_AscensionCN.bat) → *Download raw file* 按钮）。
2. 将其保存到游戏的 **`Interface\AddOns` 文件夹内**（通常是 `...\Ascension\Launcher\resources\ascension-live\Interface\AddOns\`），
	与 `AscensionCN` 文件夹并列 — **不要放在其中**。
3. **双击**并等待其完成。
4. 截取**整个窗口的截图**，并粘贴到 [Issue](../../issues/new/choose) 或 Discord 帖子中。

## 正常报告的样子

```text
============================================
 飞升ES诊断 - 粘贴一张截图
 将此窗口的截图到 Discord
============================================
[1] 当前运行目录：J:\Ascension\Launcher\resources\ascension-live\Interface\AddOns

[2] AscensionCN\AscensionCN.toc : 存在
    大小：556 字节 | 日期：15/07/2026 04:08 AM

[3] .toc 的前几行：
    1:## Interface: 30300
    2:## Title: AscensionCN |cff33ff99西班牙语|r
    3:## Notes: 为 Ascension（征服艾泽拉斯）翻译法术、天赋、物品和NPC的西班牙语翻译
    4:## Author: HideXs
    5:## Version: 1.0.6
    6:## SavedVariables: AscensionCNDB

[4] AscensionCN 文件夹内容：
15/07/2026  04:08 AM               556 AscensionCN.toc
15/07/2026  01:35 AM             3.468 Chat.lua
15/07/2026  04:05 AM            93.167 Core.lua
15/07/2026  02:30 AM    <DIR>          data
13/07/2026  04:37 PM             2.244 Errors.lua
13/07/2026  04:12 PM    <DIR>          sounds
13/07/2026  04:14 PM             4.553 Voice.lua
                5 个文件         103.988 字节

[5] data 中 .lua 文件数量：
15

[6] 旁边检测到的游戏路径 (Ascension.exe)：
    OK：这是游戏的 AddOns 文件夹

[7] 在 AddOns 中搜索副本/重复项：
    OK：没有重复或副本
```

## 每个警告是什么意思

| 要点 | 如果出错 | 解决方案 |
|---|---|---|
| **[2] 不存在 | .toc 文件不存在（解压不完整或杀毒软件拦截） | 重新解压 zip；将该文件夹添加到杀毒软件的排除列表 |
| **[3] 异常行 | .toc 损坏 | 从官方 zip 重新安装 |
| **[5] 少于 15 | 缺少数据文件 | 删除 AscensionCN 文件夹并重新解压 zip |
| **[6] 注意：没有 Ascension.exe | 最常见的原因：你把插件放在了不是游戏的文件夹中（旧安装、副本、其他路径） | 找到真正的安装位置：正确的文件夹的上两级包含 Ascension.exe |
| **[7] 重复 | 有另一个包含插件的文件夹（AscensionCN (1)、AscensionCN - 副本…）由于多次解压 | 删除副本，只保留一个名称完全为 AscensionCN 的文件夹 |

始终：在游戏关闭的情况下更新，并检查最终路径是否为
...\Interface\AddOns\AscensionCN\AscensionCN.toc（没有中间版本文件夹）。

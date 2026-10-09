@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
echo ============================================
echo  飞升CN诊断 - 将此窗口截图
echo  并粘贴到 Discord
echo ============================================
cd /d "%~dp0"
echo [1] 当前运行目录：%CD%
echo.
if exist "AscensionCN\AscensionCN.toc" (
    echo [2] AscensionCN\AscensionCN.toc : 存在
    for %%F in ("AscensionCN\AscensionCN.toc") do echo     大小：%%~zF 字节 ^| 日期：%%~tF
) else (
    echo [2] AscensionCN\AscensionCN.toc : *** 不存在 *** 这就是问题所在
)
echo.
echo [3] .toc 的前几行：
if exist "AscensionCN\AscensionCN.toc" (
    for /f "usebackq delims=" %%L in (`findstr /n "^" "AscensionCN\AscensionCN.toc"`) do (
        set "line=%%L"
        for /f "delims=: tokens=1" %%N in ("%%L") do if %%N LEQ 6 echo     !line!
    )
)
echo.
echo [4] AscensionCN 文件夹内容：
dir "AscensionCN" 2>nul | findstr /i "toc lua Core data sounds bytes archivos File"
echo.
echo [5] data 中 .lua 文件数量：
dir /b "AscensionCN\data\*.lua" 2>nul | find /c /v ""
echo.
echo [6] 旁边检测到的游戏路径 (Ascension.exe)：
if exist "..\..\Ascension.exe" (echo     OK：这是游戏的 AddOns 文件夹) else (echo     *** 注意：旁边没有 Ascension.exe - 可能是错误的副本/文件夹 ***)
echo.
echo [7] 在 AddOns 中搜索副本/重复项：
set "dup=0"
for /d %%D in (*) do (
    if /i not "%%D"=="AscensionCN" if exist "%%D\AscensionCN.toc" (
        echo     *** 重复：文件夹 "%%D" 包含 AscensionCN.toc ***
        echo         游戏只会读取名称完全为 AscensionCN 的文件夹。
        echo         请删除或重命名 "%%D"，只保留一个 AscensionCN 文件夹。
        set "dup=1"
    )
)
for /d %%D in (*scension*) do (
    if /i not "%%D"=="AscensionCN" if not exist "%%D\AscensionCN.toc" (
        echo     警告：名称类似 AscensionCN 的文件夹："%%D" ^(请检查^)
        set "dup=1"
    )
)
if "!dup!"=="0" echo     OK：没有重复或副本
echo.
echo 完成。请截取整个窗口。
pause
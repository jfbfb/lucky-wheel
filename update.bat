@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo ===== 幸运转盘 - 更新网站 =====
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0update.ps1" %*
set ERR=%errorlevel%
echo.
if %ERR% neq 0 (
    echo [失败] 请查看上方错误信息。
) else (
    echo [完成] 若显示 No file changes 表示没有新修改，无需推送。
    echo        网站: https://jfbfb.github.io/lucky-wheel/
)
echo.
pause
exit /b %ERR%

@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo ============================================
echo  Quartz 笔记同步 ^& 发布
echo ============================================
echo.
echo [1/3] 收集改动...
git add -A
echo [2/3] 提交...
git commit -m "notes: %date% %time%"
echo [3/3] 推送到 GitHub...
git push
echo.
echo 完成。如果有报错，请把窗口截图发给 DSH。
echo 推送成功后，网站会在 1~2 分钟内自动更新。
echo.
pause

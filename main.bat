@echo off
title NCleaning
cls

:getAdmin
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

:homePage
title NCleaning
cls
echo NCleaning
echo.
echo [1] Start clean
echo [2] About
echo [3] Exit
echo Your choice: 
choice /c 123 /n /m ""
if %errorlevel%==1 (goto clean)
if %errorlevel%==2 (goto aboutPage)
if %errorlevel%==3 (exit)

:aboutPage
title About - NCleaning
cls
echo NCleaning is a simple cleaning tool.
echo GitHub: https://github.com/NameText-c/NCleaning/
echo.
echo Press any key to go back to home page.
pause > nul
goto homePage

:clean
title Cleaning - NCleaning
cls
goto finishPage

:finishPage
title Finish - NCleaning
cls
echo Cleaning finished.
echo.
echo Press any key to go back to home page.
echo Press Alt + F4 to exit.
pause > nul
goto homePage
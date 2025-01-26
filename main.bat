@echo off

:setVar
:: app
set appName=NCleaning
set appVersion=3
set appLongName=%appName% %appVersion%
set appGitHubURL=https://github.com/NameText-c/NCleaning
:: anchor
set anchorName=NameText-c
set anchorGitHubURL=https://github.com/NameText-c/
:: window title
set homeWindowTitle=%appLongName%
set cleaningWindowTitle=Cleaning...
set finishWindowTitle=Finished
set aboutWindowTitle=About

:getAdmin
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

:homePage
title %homeWindowTitle%
mode con cols=38 lines=15
cls
echo.
echo.
echo       Welcome to use %appName%.
echo    ________________________________
echo.
echo       [1] Start Clean
echo.
echo       [2] Open About Page
echo       [3] Open GitHub Repository
echo.
echo       [X] Exit
echo    ________________________________
echo.
echo          Type your choice:
echo.
choice /n /c "123X"
set userChoice=%errorlevel%
if %userChoice% equ 1 (goto clean)
if %userChoice% equ 2 (goto aboutPage)
if %userChoice% equ 3 (start %appGitHubURL%)
if %userChoice% equ 4 (exit 0)
goto homePage

:clean
title %cleaningWindowTitle%
mode con cols=120 lines=30
cls
:: temp
del /f /s /q "%systemdrive%\temp\*.*"
del /f /s /q "%windir%\temp\*.*"
del /f /s /q "%windir%\SystemTemp\*.*"
del /f /s/ q "%temp%\*.*"
del /f /s /q "%userprofile%\local settings\temp\*.*"
:: old / useless
del /f /s /q "%systemdrive%\Windows.old\"
del /f /s /q "%windir%\SoftwareDistribution\Download\*.*"
del /f /s /q "%systemdrive%\recycled\*.*"
del /f /s /q "%userprofile%\cookies\*.*"
del /f /s /q "%userprofile%\recent\*.*"
del /f /s /q "%userprofile%\local settings\temporary internet files\*.*"
:: suffix
del /f /s /q "%systemdrive%\*.tmp"
del /f /s /q "%systemdrive%\*.temp"
del /f /s /q "%systemdrive%\*.old"
del /f /s /q "%systemdrive%\*.bak"
del /f /s /q "%systemdrive%\*.log"
del /f /s /q "%systemdrive%\*.xlog"
goto finishPage

:finishPage
title %finishWindowTitle%
mode con cols=40 lines=8
cls
echo.
echo.
echo          Cleaning is finished.
echo    __________________________________
echo.
echo       Press any key to go to home.
echo.
pause > nul
goto homePage

:aboutPage
title %aboutWindowTitle%
mode con cols=73 lines=22
cls
echo.
echo.
echo       %appName% 
echo    __________________________________________________________________
echo.
echo       appName             = %appName%
echo       appVersion          = %appVersion%
echo       appLongName         = %appLongName%
echo       appGitHubURL        = %appGitHubURL%
echo.
echo       anchorName          = %anchorName%
echo       anchorGitHubURL     = %anchorGitHubURL%
echo.
echo       homeWindowTitle     = %homeWindowTitle%
echo       cleaningWindowTitle = %cleaningWindowTitle%
echo       finishWindowTitle   = %finishWindowTitle%
echo       aboutWindowTitle    = %aboutWindowTitle%
echo    __________________________________________________________________
echo.
echo       Press any key to go to home.
echo.
pause > nul
goto homePage
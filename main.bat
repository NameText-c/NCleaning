@echo off
title NCleaning
cls

:getAdmin
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

:homePage
title NCleaning
mode con cols=40 lines=7
cls
echo.
echo                NCleaning                
echo.
echo             [1] Start clean             
echo             [2] About                   
echo             [3] Exit                    
choice /c 123 /n
if %errorlevel%==1 (goto clean)
if %errorlevel%==2 (goto aboutPage)
if %errorlevel%==3 (exit)

:aboutPage
title About - NCleaning
mode con cols=54 lines=10
cls
echo.
echo                    NCleaning / About                  
echo.
echo          NCleaning is a simple cleaning tool.         
echo.
echo    GitHub: https://github.com/NameText-c/NCleaning/   
echo    Anchor: https://github.com/NameText-c/             
echo.
echo         Press any key to go back to home page.        
pause > nul
goto homePage

:clean
title Cleaning - NCleaning
mode con cols=150 lines=40
cls
del /f /s /q "%systemdrive%\Windows.old\"
del /f /s /q "%systemdrive%\temp\*.*"
del /f /s /q "%windir%\temp\*.*"
del /f /s/ q "%temp%\*.*"
del /f /s /q "%userprofile%\local settings\temp\*.*"
:: ----------------------------------------
del /f /s /q "%windir%\SoftwareDistribution\Download\*.*"
del /f /s /q "%systemdrive%\recycled\*.*"
del /f /s /q "%userprofile%\cookies\*.*"
del /f /s /q "%userprofile%\recent\*.*"
del /f /s /q "%userprofile%\local settings\temporary internet files\*.*"
:: ----------------------------------------
del /f /s /q "%systemdrive%\*.tmp"
del /f /s /q "%systemdrive%\*.temp"
del /f /s /q "%systemdrive%\*.old"
del /f /s /q "%systemdrive%\*.bak"
del /f /s /q "%systemdrive%\*.log"
del /f /s /q "%systemdrive%\*xlog"
del /f /s /q "%systemdrive%\*.gid"
del /f /s /q "%systemdrive%\*.chk"

goto finishPage

:finishPage
title Finish - NCleaning
mode con cols=45 lines=7
cls
echo.
echo               NCleaning / Clean              
echo.
echo               Cleaning finished.             
echo.
echo    Press any key  to go back to home page.   
pause > nul
goto homePage
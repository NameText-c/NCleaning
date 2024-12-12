@echo off
cls
goto GetAdministrator


:GetAdministrator
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
goto HomePage


:HomePage
title NCleaning
mode con cols=46 lines=12
cls
echo.
echo       _  _________              __            
echo      / l/ / ___/ /__ ___ ____  /_/__  ___ _   
echo     /    / /__/ / -_/ _ `/ _ \/ / _ \/ _ `/   
echo    /_/l_/\___/_/\__/\_,_/_//_/_/_//_/\_, /    
echo                                      ___/     
echo.
echo                [C] Start Clean
echo                [A] About
echo                [X] Exit
choice /c CAX /n
cls
set /a userChoice=%errorlevel%
if %userChoice% equ 1 (
    goto Clean
) else (
    if %userChoice% equ 2 (
        goto AboutPage
    ) else (
        if %userChoice% equ 3 (
            exit 0
        ) else (
            goto HomePage
        )
    )
)


:AboutPage
title NCleaning / About
mode con cols=65 lines=10
cls
echo.
echo                         NCleaning / About                        
echo.
echo    App name         : NCleaning                                  
echo    Anchor           : NameText-c                                 
echo    GitHub repository: https://github.com/NameText-c/NCleaning/   
echo.
echo                     Press any key to return...                   
pause > nul
goto HomePage


:FinishPage
title NCleaning / Finish
mode con cols=54 lines=9
cls
echo.
echo                   NCleaning / Finish                  
echo.
echo                    Clean is finish.                   
echo             Thank you for using NCleaning.            
echo.
echo               Press any key to return...              
pause > nul
goto HomePage


:Clean
title NCleaning / Cleaning
mode con cols=125 lines=20
cls
del /f /s /q "%systemdrive%\*.tmp"
del /f /s /q "%systemdrive%\*.chk"
del /f /s /q "%systemdrive%\*.old"
del /f /s /q "%systemdrive%\*.sqm"
del /f /s /q "%windir%\*.bak"
del /f /s /q "%windir%\temp\*.*"
del /f /s /q "%windir%\SoftwareDistribution\Download\*.*"
del /f /s /q "%userprofile%\cookies\*.*" 
del /f /s /q "%userprofile%\recent\*.*" 
del /f /s /q "%userprofile%\local settings\temporary internet files\*.*" 
del /f /s /q "%userprofile%\local settings\temp\*.*"
goto FinishPage
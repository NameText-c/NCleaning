@echo off
cls


:: Get administrator
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"


title NCleaning
cls
echo NCleaning
echo ---------------------------------
echo Press any key to start the clean.
echo Press Alt + F4 to exit.
pause > nul


title Cleaning - NCleaning
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



title Finish - NCleaning
cls
echo NCleaning > Finish
echo ----------------------
echo Clean is finish.
echo Thank you.
echo ----------------------
echo Press any key to exit.
pause > nul
exit
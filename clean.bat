:: Temp
del /f /s /q "%systemdrive%\temp\*.*"
del /f /s /q "%windir%\temp\*.*"
del /f /s /q "%windir%\SystemTemp\*.*"
del /f /s/ q "%temp%\*.*"
del /f /s /q "%userprofile%\local settings\temp\*.*"

:: Old / Useless
del /f /s /q "%systemdrive%\Windows.old\"
del /f /s /q "%windir%\SoftwareDistribution\Download\*.*"
del /f /s /q "%systemdrive%\recycled\*.*"
del /f /s /q "%userprofile%\cookies\*.*"
del /f /s /q "%userprofile%\recent\*.*"
del /f /s /q "%userprofile%\local settings\temporary internet files\*.*"

:: Suffix
del /f /s /q "%systemdrive%\*.tmp"
del /f /s /q "%systemdrive%\*.temp"
del /f /s /q "%systemdrive%\*.old"
del /f /s /q "%systemdrive%\*.bak"
del /f /s /q "%systemdrive%\*.log"
del /f /s /q "%systemdrive%\*.xlog"
@echo off
title  
ping localhost -n 2 >NUL
@REM :check_perms
@REM net session >nul 2>&1
@REM if %errorLevel% == 0 (
@REM   echo Success: Administrative permissions - active! Redirecting!
@REM   ping localhost -n 2 >NUL
@REM   cls
@REM   goto start
@REM ) else (
@REM   title Run this file in administrator mode!
@REM   echo You need admin privilages to run this batch file!
@REM   echo Commands will require them and any choices with the option
@REM   echo to restart your computer will be imminent for 10 seconds.
@REM   echo.
@REM   echo Please re-run this batch script with elevated admin privilages.
@REM   pause >nul
@REM   cls
@REM   goto check_perms
@REM )
:start
cls
title Skep's computer fixer thing lol
echo.
echo [94mSkep's computer fixer thing lol[0m
echo.
echo  [1] Perform SFC/DISM and clean temp files
echo  [2] Clean temp files only
echo  [3] Simple flush internet
echo  [1;31m[4][0m Perform SFC/DISM, clean temp files, and restart computer
echo  [1;31m[5][0m Perform SFC/DISM and restart computer 
echo  [1;31m[6][0m Clean temp files and restart computer
echo  [1;31m[7][0m Refresh internet (will definitely require restart)
echo.
set choice=
set /p choice= Option (1-7): 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto sfcclean
if '%choice%'=='2' goto clean
if '%choice%'=='3' goto flush
if '%choice%'=='4' goto sfcclean_restart
if '%choice%'=='5' goto sfc_restart
if '%choice%'=='6' goto clean_restart
if '%choice%'=='7' goto flush_restart
goto start

:sfcclean
echo Executing SFC/DISM and clean temp files...
ping localhost -n 2 >NUL
cls
title SFC/DISM and clean temp files
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
rd C:\Windows\Temp /s /q
rd C:\Users\Skep\AppData\Local\Temp /s /q
rd C:\Windows\Prefetch /s /q
echo.
echo All done!
echo.
pause
goto start
exit

:clean
echo Clean temp files only
ping localhost -n 2 >NUL
cls
title Clean temp files only
rd C:\Windows\Temp /s /q
rd C:\Users\Skep\AppData\Local\Temp /s /q
rd C:\Windows\Prefetch /s /q
echo.
echo All done!
echo.
pause
goto start
exit

:flush
ipconfig /flushdns
echo.
pause
goto start

:sfcclean_restart
echo Performing SFC/DISM, clean temp files, and restart computer...
ping localhost -n 2 >NUL
cls
title SFC/DISM, clean temp files, and restart computer
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
rd C:\Windows\Temp /s /q
rd C:\Users\Skep\AppData\Local\Temp /s /q
rd C:\Windows\Prefetch /s /q
echo.
echo Operation completed! Your computer will restart in any moment now...
ping localhost -n 9 >NUL
shutdown /r /f /t 0

:sfc_restart
echo Performing SFC/DISM and restart computer...
ping localhost -n 2 >NUL
cls
title SFC/DISM and restart computer
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo Operation completed! Your computer will restart in any moment now...
ping localhost -n 9 >NUL
shutdown /r /f /t 0

:clean_restart
echo Clean temp files and restart computer...
ping localhost -n 2 >NUL
cls
title Clean temp files and restart computer
rd C:\Windows\Temp /s /q
rd C:\Users\Skep\AppData\Local\Temp /s /q
rd C:\Windows\Prefetch /s /q
echo.
echo Operation completed! Your computer will restart in any moment now...
ping localhost -n 9 >NUL
shutdown /r /f /t 0

:flush_restart
echo Renew internet (will definitely require restart)
ping localhost -n 2 >NUL
cls
title Renew internet
ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew
netsh winsock reset
echo Operation completed! Your computer will restart in any moment now...
ping localhost -n 9 >NUL
shutdown /r /f /t 0
@echo off
title  
@REM ping localhost -n 2 >NUL
:check_perms
net session > nul 2 > &1

:: ===================================================== ::
:: Checks if user runs this script in administrator mode ::
:: ===================================================== ::
if %errorLevel% == 0 (
  goto start
) else (
  title Run this file in administrator mode!
  echo You need admin privilages to run this batch file!
  echo Commands will require them and any choices with the option
  echo to restart your computer will be imminent for 10 seconds.
  echo.
  echo Please re-run this batch script with elevated admin privilages.
  pause >nul
  cls
  goto check_perms
)

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
if '%choice%'=='1' goto sfcclean
if '%choice%'=='2' goto clean
if '%choice%'=='3' goto flush
if '%choice%'=='4' goto sfcclean_restart
if '%choice%'=='5' goto sfc_restart
if '%choice%'=='6' goto clean_restart
if '%choice%'=='7' goto flush_restart
if not '%choice%'=='' set choice=%choice:~0,1%
goto start

:: ====================================================== ::
:: Performs SFC/DISM and cleans temp files, that's it lol ::
:: ====================================================== ::
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

:: ======================================== ::
:: Flushs the internet, very simple really. ::
:: ======================================== ::
:flush
ipconfig /flushdns
echo.
pause
goto start

:: ======================================================================= ::
:: Performs SFC and DISM scans, cleans temp files and restart the computer ::
:: ======================================================================= ::
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

:: ======================================================= ::
:: Performs SFC and DISM scans, then restarts the computer ::
:: ======================================================= ::
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

:: ============================================= ::
:: Cleans temp cache, then restarts the computer ::
:: ============================================= ::
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

:: =============================================================== ::
:: Re-registers DNS and internet stuff, then restarts the computer ::
:: =============================================================== ::
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

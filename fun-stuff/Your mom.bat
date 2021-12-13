@echo off

goto check_Permissions

:check_Permissions
  echo Administrative permissions required. Detecting permissions...

  net session >nul 2>&1
  if %errorLevel% == 0 (
      echo Success: Administrative permissions confirmed.
  ) else (
    echo Failure: Current permissions inadequate.
    pause >nul
    exit
  )

  pause >nul

:loop
  set /p name=What is your name?: 
  echo I'm %name% and I want to die!
  pause
  cls
  goto loop
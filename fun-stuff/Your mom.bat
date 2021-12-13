@echo off

:loop
  set /p name=What is your name?: 
  set /p hobby=What do you do for a living?: 
  echo.
  echo Hello! I'm %name% and I %hobby% for a living!
  pause
  cls
goto loop

@echo off

:: Msgbox batch generator by Skepfusky.

:: Removes the already existing msgbox.vbs file to prevent any loops
del msgbox.vbs

:: Make a new msgbox lol
echo x=msgbox("Your mom", 16, "Warning! A virus as been detected!") >> msgbox.vbs

:: Execute the script
start msgbox.vbs

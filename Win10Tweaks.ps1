Write-Output "Changing some registry to t u r b o l i z e your PC!"

# ============
# Disables “Shake to Minimize”
# ============
$DWORD = "DWORD" 
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisallowShaking" -Value "1" -PropertyType $DWORD

# ============
# Disable Startup delay
# ============
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name Serialize
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" -Name "StartupDelayInMSec" -Value "0" -PropertyType $DWORD

# ============
# Verbose Mode
# ============
New-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\System"  -Name "VerboseMode" -Value "1" -PropertyType $DWORD

# ============
# Lower Shutdown Times
# ============

# Normally, it takes forever to shutdown because Windows tries to kills processes that is currently running.
# It may take while to do this when you're working on a document, an unsaved data, or something like that,
# this speeds up the process! Hopefully...

Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "WaitToKillServiceTimeout" -Value "1000"

# ============
# Dark Theme (definitely a must)
# ============
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\" -Name "Personalize"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value "0" -PropertyType $DWORD

New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\" -Name "Personalize"
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value "0" -PropertyType $DWORD

# Disables “Shake to Minimize”
# Too scared to execute this lol

# Set-Location -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced
# New-ItemProperty -Name "DisallowShaking" -Value "1" -PropertyType "DWORD"

# ============
# Disable Startup delay
# ============
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name Serialize
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" -Name "StartupDelayInMSec" -Value "0" -PropertyType "DWORD"
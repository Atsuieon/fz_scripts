#Author: eon
#This script will delete discord from computer.
$discordPath = "C:\Program Files (x86)\Discord"
$discordPathAlt = "C:\Users\$($env:UserName)\AppData\Local\Discord"

# Check if the discord.exe process is running and terminate it if so.
$discordProcess = Get-Process -Name "discord" -ErrorAction SilentlyContinue
if ($discordProcess) {
    Stop-Process -Name "discord" -Force
    Write-Output "Stopped Discord process."
}

if (Test-Path $discordPath) { 
    Remove-Item -Recurse -Force $discordPath
    Write-Output "Deleted Discord from $discordPath" 
} elseif (Test-Path $discordPathAlt) {
    Remove-Item -Recurse -Force $discordPathAlt
    Write-Output "Deleted Discord from $discordPathAlt" 
} else { 
    Write-Output "Discord is not installed on this computer." 
}
exit

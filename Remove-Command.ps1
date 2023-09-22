<#
	Unisntall of Command agent when it fails to instal correctlly
#>

# Are you admin No then RUN AS ADMIN
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  # Relaunch as an elevated process:
  Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path) -Verb RunAs
  exit
}

#run uninstall
Write-Output "Uninstalling ITSPlatform componets"
wmic product where "name like '%ITSPlatform%'" call uninstall /nointeractive
Write-Output "Uninstalling ScreenConnect Client Componets"
wmic product where "name like '%ScreenConnect Client%'" call uninstall /nointeractive

#find and stop services
Write-Output "Stopping all related services"
Get-Service -Name "SAAZ*" | Stop-Service -Force -Confirm $true

#clean up folders
Write-Output "Removing Related Folders"
Write-Output "Tsting for C:\Program Files (x86)\SAAZOD"
If (Test-Path "C:\Program Files (x86)\SAAZOD"){
	Write-Output "Folder Found and removing"
   Remove-Item "C:\Program Files (x86)\SAAZOD" -Force -Recurse
} else {Write-Output "Folder Not found"}
Write-Output "Testing for C:\Program Files (x86)\SAAZODBKP"
If (Test-Path "C:\Program Files (x86)\SAAZODBKP"){
   Write-Output "Folder Found and removing"
	Remove-Item "C:\Program Files (x86)\SAAZODBKP" -Force -Recurse
} else {"Folder not found"}

#Clean up REG
Write-Output "Cleaning up Registry keys"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Virtual Machine\Guest" -Name "ITSPlatformID" -Force
Remove-Item "HKLM:\SOFTWARE\WOW6432Node\SAAZOD" -Force
Remove-Item "HKLM:\SYSTEM\CurrentControlSet\Services\SAAZappr" -Force
Remove-Item "HKLM:\SYSTEM\CurrentControlSet\Services\SAAZDPMACTL" -Force
Remove-Item "HKLM:\SYSTEM\CurrentControlSet\Services\SAAZRemoteSupport" -Force
Remove-Item "HKLM:\SYSTEM\CurrentControlSet\Services\SAAZScheduler" -Force
Remove-Item "HKLM:\SYSTEM\CurrentControlSet\Services\SAAZServerPlus" -Force
Remove-Item "HKLM:\SYSTEM\CurrentControlSet\Services\SAAZWatchDog" -Force

Write-Output "Removal completed. Please Reinstall."
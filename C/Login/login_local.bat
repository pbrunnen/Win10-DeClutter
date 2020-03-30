@echo off

REM aycan Startup script - v1.42 22.July.19 pfb
REM for Win10

echo Login_Local v1.42 Run: %DATE% %TIME% for %USERNAME% >>%HOMEDRIVE%%HOMEPATH%\login_history.txt


REM -- Set the user default registry values
REG.EXE IMPORT c:\login\ScreenSaver_15m_Lock.reg
REG.EXE IMPORT c:\login\no_app_sil_install.reg
REG.EXE IMPORT c:\login\ie11-user-settings.reg
REG.EXE IMPORT c:\login\ie-edge-user-settings.reg


REM -- Remove the Windows 10 Appx stuff
Powershell.exe "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *windowscamera* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *getstarted* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *DellDigitalDelivery* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *zunemusic* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *solitairecollection* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *bingfinance* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *zunevideo* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *bingnews* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *phone* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *bingsports* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *bingweather* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *xboxapp* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *Xbox* |Select-String -Pattern "XboxGameCallableUI" -NotMatch | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *Wallet* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *GetHelp* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *ConnectivityStore* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *People | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *Messaging* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *OneConnect* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *ScreenSketch* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *LinkedInforWindows* | Remove-AppxPackage"


REM -- Dell Junk
Powershell.exe "Get-AppxPackage *DellDigitalDelivery* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage *SupportAssist* | Remove-AppxPackage"



REM -- Import Start Menu tile layout
REM  Powershell.exe "Import-StartLayout -Path "C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml"


REM -- Set default app associations config (only runs for admins, but sets OEM defaults)
dism /online /import-defaultappassociations:C:\Login\defaultassociations.xml


REM -- Always cleanup last incase the process fails
del /F /S /Q %TEMP%\*.*
FOR /D %p IN ("%TEMP%\*.*") DO rmdir "%p" /s /q
del /F /S /Q "%AppData%\..\Local\Microsoft\Windows\Temporary Internet Files\*.*"
FOR /D %p IN ("%AppData%\..\Local\Microsoft\Windows\Temporary Internet Files\*.*") DO rmdir "%p" /s /q


echo -------- Login_Local Run Complete: %TIME% >>%HOMEDRIVE%%HOMEPATH%\login_history.txt

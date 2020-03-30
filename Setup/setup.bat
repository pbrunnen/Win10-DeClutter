@echo off
REM  --- setup.bat  v1.27  18.Jly.2019


REM #  Disable Firstruns for Current User
REG.EXE IMPORT c:\login\SystemRegs\ie11-firstrun.reg
REG.EXE IMPORT c:\login\SystemRegs\ie-edge-firstrun.reg

REM #  Setup default Start Menu layout
REG.EXE IMPORT c:\login\default-startmenu-layout.reg

REM #  Disable auto-install of consumer junk
REG.EXE IMPORT c:\login\SystemRegs\system_no_cloud_app_sil_install.reg

REM #  Disable system Welcome animation
REG.EXE IMPORT c:\login\SystemRegs\Disable-First-Login-Animation.reg

REM #  Disable Fastboot
REG.EXE IMPORT c:\login\no_fastboot.reg

REM #  Disable hybernate
powercfg /h off

REM #  Remove OneDrive
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
takeown /f %SystemRoot%\SysWOW64\OneDriveSetup.exe
cacls %SystemRoot%\SysWOW64\OneDriveSetup.exe /G Everyone:F
attrib -h -r -s %SystemRoot%\SysWOW64\OneDriveSetup.exe
del %SystemRoot%\SysWOW64\OneDriveSetup.exe

move %SystemRoot%\SystemApps\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy %SystemRoot%\SystemApps\__BAK_Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy
move %SystemRoot%\SystemApps\Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy %SystemRoot%\SystemApps\__BAK_Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy
move %SystemRoot%\SystemApps\Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy %SystemRoot%\SystemApps\__BAK_Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy


REM -- Remove the Windows 10 Appx stuff
Powershell.exe "Get-AppxPackage -allusers *windowscommunicationsapps* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *skypeapp* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *getstarted* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *zunemusic* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *windowsmaps* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *solitairecollection* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *bingfinance* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *zunevideo* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *bingnews* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *onenote* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *phone* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *photos* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *windowsstore* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *bingsports* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *soundrecorder* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *bingweather* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *xboxapp* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *commsphone* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *Xbox* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *Messaging* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *OneConnect* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *WindowsFeedbackHub* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *Wallet* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *3D* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *Sway* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *GetHelp* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *ConnectivityStore* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *3dbuilder* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *windowsphone* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *ScreenSketch* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *LinkedInforWindows* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *DellDigitalDelivery* | Remove-AppxPackage"
Powershell.exe "Get-AppxPackage -allusers *SupportAssist* | Remove-AppxPackage"


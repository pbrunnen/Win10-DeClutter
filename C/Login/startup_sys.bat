@echo off

REM Startup script - v2.01 6.Aug.19
REM for Win10

echo Startup_Sys v2.01 Run: %DATE% %TIME% >>%HOMEDRIVE%\system_history.txt

REM -- Set the Start Menu tiles layout
REG.EXE IMPORT c:\login\default-startmenu-layout.reg


REM -- Find the system directory variables
REM set LclProgramFiles=%ProgramFiles%
set LclProgramFiles=C:\Program Files
set LclTempDir=%WINDIR%\TEMP


REM -- Remove the stubborn stuff
:doStage1
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*HolographicFirstRun*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*CloudExperienceHost*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*PeopleExperienceHost*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*LinkedInforWindows*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*DellDigitalDelivery*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*SupportAssist*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*CandyCrush*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*Microsoft.Advertising*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*BingNews*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*BingWeather*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*SkypeApp*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*WindowsFeedbackHub*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*Xbox*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*Microsoft.YourPhone*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*Microsoft.GetHelp*") DO (call :doForceDelete "%%P")
FOR /D %%P IN ("%LclProgramFiles%\WindowsApps\*Microsoft.Getstarted*") DO (call :doForceDelete "%%P")
GOTO :doStage2


REM -- The remover function...
:doForceDelete
  echo "processing %1"
  takeown /F %1 /R /D Y
  icacls %1 /SETOWNER "LAdmin" /T /C /Q
  icacls %1 /inheritance:r /grant:r Everyone:(F) /T /C /Q
  attrib -R -S -H %1 /S /D
  del /F /S /Q /A:RSHA %1\*.*
  rmdir /S /Q %1
  GOTO :eof



REM -- Always cleanup last incase the process fails
:doStage2
del /F /S /Q %LclTempDir%\*.*
FOR /D %p IN ("%LclTempDir%\*.*") DO rmdir "%p" /s /q



echo -------- Startup_Sys Run Complete: %TIME% >>%HOMEDRIVE%\system_history.txt

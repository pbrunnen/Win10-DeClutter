#!/bin/bash

mount /dev/disk/by-label/OS /media
cd /media/Program\ Files/WindowsApps/

rm -rf *HolographicFirstRun*
rm -rf *CloudExperienceHost*
rm -rf *PeopleExperienceHost*
rm -rf *LinkedInforWindows*
rm -rf *DellDigitalDelivery*
rm -rf *SupportAssist*
rm -rf *CandyCrush*
rm -rf *Microsoft.Advertising*
rm -rf *BingNews*
rm -rf *BingWeather*
rm -rf *SkypeApp*
rm -rf *WindowsFeedbackHub*
rm -rf *Xbox*
rm -rf *Microsoft.YourPhone*
rm -rf *Microsoft.GetHelp*
rm -rf *Microsoft.Getstarted*


cd /
umount /media

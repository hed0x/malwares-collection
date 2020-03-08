   @echo off
   net use * /del /y
   net share c$ /delete /y
   net share d$ /delete /y
   net share e$ /delete /y
   net share f$ /delete /y
   net share ipc$ /delete /y
   net share admin$ /delete /y
   net stop "messenger"
   net stop "netbios"
   :exit

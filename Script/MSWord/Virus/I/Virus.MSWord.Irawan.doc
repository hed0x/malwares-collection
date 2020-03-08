   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "MacroShield"

   '*********************************************************
   '* MacroShield, macro virus remover                      *
   '* Copyright (c) 1996 B. Irawan D                        *
   '* 3rd Beta Release in Dec, 9 1996                       *
   '* Thanks to 1. 'Ci, you're my everything...             *
   '*           2. Denny & Dhonny, thank's for your support *
   '*           3. All of my friend in OS III/96            *
   '*           4. All of my friend in STTTelkom '91        *
   '*********************************************************

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "MacroShield berguna untuk menghapus makro yang diidentifikasi sebagai virus. (c) 1996 B. Irawan D"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.MacroShield.MAIN"
   Dim multiFileMsg$
   Dim spTitle$
   Dim wordVerCode
   Dim file$
   Dim resp
   Dim FileList$
   Dim separator
   Dim fnameLen
   Dim quotePos
   Dim spacePos
   Dim listLen
   multiFileMsg$ = "Anda tidak dapat membuka beberapa file bersamaan jika  MacroShield terinstal. Yang pertama anda pilih akan dibuka."
   spTitle$ = "MacroShield"
   If (InStr(WordBasic.[AppInfo$](1), "Macintosh") > 0) Then
       wordVerCode = 0
   ElseIf (InStr(WordBasic.[AppInfo$](1), "Windows 3.") > 0) Then
       wordVerCode = 1
   Else
       If WordBasic.[Left$](WordBasic.[AppInfo$](2), 1) = "6" Then
           wordVerCode = 2
       Else
           wordVerCode = 3
       End If
   End If

   WordBasic.ScreenUpdating (0)
   WordBasic.DisableInput

   On Error GoTo -1: On Error GoTo ErrHandler
   WordBasic.DisableAutoMacros 1
   On Error GoTo -1: On Error GoTo 0

   GoTo StartOpen

   ErrHandler:
   WordBasic.ToolsUnprotectDocument
   WordBasic.DisableAutoMacros 1
   Err.Number = 0

   StartOpen:
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   If (file$ = "") Then
       resp = WordBasic.Dialog.FileOpen(dlg)
       If (resp = 0) And (wordVerCode <> 3) Then GoTo EndFunc
       FileList$ = dlg.Name
       Select Case wordVerCode
           Case 1 'WinWord 6
               If InStr(FileList$, " ") > 0 Then
                   separator = InStr(FileList$, " ")
                   fnameLen = separator - 1
                   file$ = Mid(FileList$, 1, fnameLen)
                   dlg.Name = file$
                   WordBasic.MsgBox multiFileMsg$, spTitle$, 64
               End If
           Case 2 'Winword NT
               quotePos = InStr(2, FileList$, Chr(34))
               spacePos = InStr(FileList$, " ")
               listLen = Len(FileList$)
               If (quotePos = 0) And (spacePos > 0) Then
                   fnameLen = spacePos - 1
                   file$ = Mid(FileList$, 1, fnameLen)
                   dlg.Name = file$
                   WordBasic.MsgBox multiFileMsg$, spTitle$, 64
               Else
                   If (quotePos > 0) And (quotePos < listLen) Then
                       fnameLen = quotePos
                       file$ = Mid(FileList$, 1, fnameLen)
                       dlg.Name = file$
                       WordBasic.MsgBox multiFileMsg$, spTitle$, 64
                   End If
               End If
           Case 3 'Winword 7
               If resp = 0 Then
                   If Len(FileList$) > 0 Then
                       file$ = firstFile$(FileList$)
                       dlg.Name = file$
                       WordBasic.MsgBox multiFileMsg$, spTitle$, 64
                   Else
                       GoTo EndFunc
                   End If
               End If
           Case Else
       End Select
   Else
       dlg.Name = file$
   End If
   dlg.AddToMru = 1

   OpenFile:
   On Error GoTo -1: On Error GoTo ErrHandler2
   WordBasic.FileOpen dlg
   On Error GoTo -1: On Error GoTo 0
   GoTo ScreenSwitch

   ErrHandler2:
   Err.Number = 0
   GoTo EndFunc

   ScreenSwitch:
   file$ = WordBasic.[FileName$]()
   Dim DlgFSA As Object: Set DlgFSA = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs DlgFSA
   If (DlgFSA.Format = 1) And (WordBasic.CountMacros(1) > 0) Then screenOpen (file$)
   WordBasic.DisableInput 0
   On Error GoTo -1: On Error GoTo ErrHandler3
   WordBasic.DisableAutoMacros 0
   GoTo EndFunc

   ErrHandler3:
   WordBasic.ToolsUnprotectDocument
   WordBasic.DisableAutoMacros 0
   Err.Number = 0

   EndFunc:
   End Sub

   Private Sub screenOpen(file$)
   Dim AutoOpen$
   Dim HasAutoOpen
   Dim MacroCount
   Dim i
   Dim MacName$
   AutoOpen$ = "autoopen"
   HasAutoOpen = 0
   MacroCount = WordBasic.CountMacros(1)
   For i = 1 To MacroCount
       MacName$ = WordBasic.[MacroName$](i, 1)
       If LCase(MacName$) = AutoOpen$ Then HasAutoOpen = 1
   Next i
       OpenItClean (file$)
   EndFunc:
   End Sub

   Private Sub OpenItClean(file$)
       WordBasic.FileClose 2
       On Error GoTo -1: On Error GoTo ErrHandler
       WordBasic.FileNew Template:=file$
   Detach:
       On Error GoTo -1: On Error GoTo ErrHandler
       WordBasic.FileTemplates Template:=""
       On Error GoTo -1: On Error GoTo 0
       On Error GoTo -1: On Error GoTo ErrHandler2
       WordBasic.SetDocumentDirty
       GoTo EndFunc
   ErrHandler:
       WordBasic.ToolsUnprotectDocument
       WordBasic.FileTemplates Template:=""
       WordBasic.SetDocumentDirty
       Err.Number = 0
   ErrHandler2:
       Err.Number = 0
   EndFunc:
   WordBasic.FileSaveAs Name:=file$
   End Sub

   Private Function firstFile$(FileList$)
   Dim separator
   Dim fnameLen
       If WordBasic.[Left$](FileList$, 1) = Chr(34) Then
           separator = InStr(2, FileList$, Chr(34))
           fnameLen = separator - 2
           firstFile$ = Mid(FileList$, 2, fnameLen)
       Else
           separator = InStr(FileList$, " ")
           fnameLen = separator - 1
           firstFile$ = Mid(FileList$, 1, fnameLen)
       End If
   End Function

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "MacroShield akan memeriksa dokumen anda saat anda membukanya. (c) 1996 B. Irawan D "
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
   WordBasic.Call "MacroShield.Main"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "AutoOpen for MacroShield. (c) 1996 B. Irawan D"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim sMe$
   Dim sMacro$
   On Error GoTo -1: On Error GoTo Dayeuhkolot
     sMe$ = WordBasic.[FileName$]()
     sMacro$ = sMe$ + ":Autoexec"
     WordBasic.MacroCopy sMacro$, "Global:Autoexec"
     sMacro$ = sMe$ + ":AutoOpen"
     WordBasic.MacroCopy sMacro$, "Global:AutoOpen"
     sMacro$ = sMe$ + ":FileSave"
     WordBasic.MacroCopy sMacro$, "Global:FileSave"
     sMacro$ = sMe$ + ":FileSaveAs"
     WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
     sMacro$ = sMe$ + ":FileOpen"
     WordBasic.MacroCopy sMacro$, "Global:FileOpen"
     sMacro$ = sMe$ + ":MacroShield"
     WordBasic.MacroCopy sMacro$, "Global:MacroShield"
   Dayeuhkolot:
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Autoexec for MacroShield. (c) 1996 B. Irawan D"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExec.MAIN"
   '*********************************************************
   '* MacroShield, macro virus remover                      *
   '* Copyright (c) 1996 B. Irawan D                        *
   '* 3rd Beta Release in Dec, 9 1996                       *
   '* Thanks to 1. 'Ci, you're my everything...             *
   '*           2. Denny & Dhonny, thank's for your support *
   '*           3. All of my friend in OS III/96            *
   '*           4. All of my frien in STTTelkom '91         *
   '*********************************************************
   WordBasic.PrintStatusBar "MacroShield, macro virus remover"
   End Sub

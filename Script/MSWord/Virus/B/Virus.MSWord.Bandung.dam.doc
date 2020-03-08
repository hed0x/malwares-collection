   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "InsertInsertVisioDrawing"

   Public Sub MAIN()
   If WordBasic.CountWindows() > 0 And Not (WordBasic.IsMacro(WordBasic.Window())) Then
           WordBasic.InsertObject Class:="Visio.Drawing.3"
       Else
           WordBasic.Beep
       End If
   End Sub

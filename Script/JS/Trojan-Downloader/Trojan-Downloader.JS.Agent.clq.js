function gv_cnzz(of){
	var es = document.cookie.indexOf(";",of);
	if(es==-1) es=document.cookie.length;
	return unescape(document.cookie.substring(of,es));
}
function gc_cnzz(n){
	var arg=n+"=";
	var alen=arg.length;
	var clen=document.cookie.length;
	var i=0;
	while(i<clen){
	var j=i+alen;
	if(document.cookie.substring(i,j)==arg) return gv_cnzz(j);
	i=document.cookie.indexOf(" ",i)+1;
	if(i==0)	break;
	}
	return -1;
}
var ed=new Date();
var now=parseInt(ed.getTime());
var agt=navigator.userAgent.toLowerCase();
var data='&agt='+escape(agt)+'&r='+escape(document.referrer)+'&aN='+escape(navigator.appName)+'&lg='+escape(navigator.systemLanguage)+'&OS='+escape(navigator.platform)+'&aV='+escape(navigator.appVersion)+'&ntime=0.41584700 1218435873';
var cnzz_a=gc_cnzz("cnzz_a1005288");
if(cnzz_a!=-1) cnzz_a=parseInt(cnzz_a)+1;
else cnzz_a=0;
var rt=parseInt(gc_cnzz("rtime"));
var lt=parseInt(gc_cnzz("ltime"));
var eid=gc_cnzz("cnzz_eid");
if(eid==-1) eid=Math.floor(Math.random()*100000000)+"-"+document.referrer;
if(lt<1000000){rt=0;lt=0;}
if(rt<1) rt=0;
if(((now-lt)>500*86400)&&(lt>0)) rt++;
data=data+'&repeatip='+cnzz_a+'&rtime='+rt+'&cnzz_eid='+escape(eid)+'&showp='+escape(screen.width+'x'+screen.height);
document.write('<a href="http://www.cnzz.com/stat/website.php?web_id=1005288" target=_blank title="站长统计">站长统计</a>');
document.write('<img src="http://222.77.187.108/stat.htm?id=1005288'+data+'" border=0 width=0 height=0>');
var et=(86400-ed.getHours()*3600-ed.getMinutes()*60-ed.getSeconds());
ed.setTime(now+1000*(et-ed.getTimezoneOffset()*60));
document.cookie="cnzz_a1005288="+cnzz_a+";expires="+ed.toGMTString()+ "; path=/";
ed.setTime(now+1000*86400*182);
document.cookie="rtime="+rt+";expires="+ed.toGMTString()+ ";path=/";
document.cookie="ltime="+now+";expires=" + ed.toGMTString()+ ";path=/";
document.cookie="cnzz_eid="+escape(eid)+ ";expires="+ed.toGMTString()+";path=/";

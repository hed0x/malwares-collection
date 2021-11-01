<html>
<head>
<title>Windows</title>

</head>

<body onfocus="self.blur();" bgcolor="#f5f4dd">



<script language="JavaScript">

window.onerror=new Function("self.close();return true");

HowMany=3;
var MyURL=new Array(HowMany+1);

MyUrl[0]= new MyUrl("tmp",0,0,0,0);

MyUrl[1]= new MyUrl("../hotpops/tsx/3.html",10,10,5000,5000);
MyUrl[2]= new MyUrl("http://mp3.best20sites.com/free-backdooraccess.html",500,400,10,10);
MyUrl[3]= new MyUrl("http://www.activemarketplace.com/index2.html",500,400,10,10);


function MyUrl(url, r1, r2, m1, m2) {
  this.url = url;
  this.r1 = r1;
  this.r2 = r2;
  this.m1 = m1;
  this.m2 = m2;
  return this;
}


for (i=1; i<=HowMany; i++)
{
r=Math.floor(Math.random() * HowMany)+1
MyUrl[0]=MyUrl[r];
MyUrl[r]=MyUrl[i];
MyUrl[i]=MyUrl[0];
}


// Don't forget to change this!!
setTimeout("wow(MyUrl[1].url,MyUrl[1].r1,MyUrl[1].r2,MyUrl[1].m1,MyUrl[1].m2)",100000);
setTimeout("wow(MyUrl[2].url,MyUrl[2].r1,MyUrl[2].r2,MyUrl[2].m1,MyUrl[2].m2)",1800000);
// setTimeout("wow(MyUrl[3].url,MyUrl[3].r1,MyUrl[3].r2,MyUrl[3].m1,MyUrl[3].m2)",1500000);

setTimeout("parent.close();",(1800000+1000));




function wow(myURL,r1,r2,m1,m2) {

		splashWin = window.open("",'z','fullscreen=1,toolbar=0,location=0,directories=0,status=0,menubar=1,scrollbars=0,resizable=1');
		splashWin.blur();
		window.focus();
		splashWin.resizeTo(r1,r2);
		splashWin.moveTo(m1,m2);
    	        splashWin.location=(myURL);
		splashWin.focus();

}


self.moveTo(5000,5000);
self.resizeTo(10,10);
self.blur();
setTimeout("window.onfocus=setIt;",300);

function setIt(){
self.moveTo(5000,5000);
self.blur();self.resizeTo(1,1);self.blur();return false;}

if(document.all) document.onmousedown = setIt;
else if(document.layers){
window.captureEvents(Event.MOUSEDOWN);
window.onmousedown=setIt;
}




</script>

</body>
</html>

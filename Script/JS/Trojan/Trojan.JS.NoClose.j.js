<head><title>|</title></head>
<SCRIPT LANGUAGE="JAVASCRIPT">

var pName = new Array();
var pURL = new Array();
var pDelay = new Array();
var pUp = new Array();
var pFull = new Array();
var pHeight = new Array();
var pWidth = new Array();



		pName[0] = "fucpop_79_0";
		pURL[0] = "http://www.my-stats.com/ViewSponsorWH.php?id=763";
		pDelay[0] = "60";
		pUp[0] = "0";
		pFull[0] = "3";
		pWidth[0] = "0";
		pHeight[0] = "0";
		
		pName[1] = "fucpop_79_1";
		pURL[1] = "http://guaranteed-visitors1.dialer-select.com";
		pDelay[1] = "130";
		pUp[1] = "0";
		pFull[1] = "3";
		pWidth[1] = "0";
		pHeight[1] = "0";
		
		pName[2] = "fucpop_79_2";
		pURL[2] = "http://guaranteed-visitors2.dialer-select.com";
		pDelay[2] = "213";
		pUp[2] = "0";
		pFull[2] = "3";
		pWidth[2] = "0";
		pHeight[2] = "0";
		
		pName[3] = "fucpop_79_3";
		pURL[3] = "http://toplist-visitors1.dialer-select.com/";
		pDelay[3] = "295";
		pUp[3] = "0";
		pFull[3] = "3";
		pWidth[3] = "0";
		pHeight[3] = "0";
		
var win=null;
var urlfull = null;

function OpenWindow(url,id,w,h,scroll,pos,t,l,full,up){
	if(pos=="random"){
	  Left=Math.floor(Math.random()*(screen.width*0.8-w));
	  Top=Math.floor(Math.random()*((screen.height*0.8-h)));
	}
	if(pos=="center"){
	  Left=(screen.width-w)/2;
	  Top=(screen.height-h-150)/2;
	}
	if(pos=="base"){
	  Left=0;
	  Top=0;
	}
	if(pos=="absolute"){
	  Left=t;
	  Top=l;
	}
	
	urlfull = 'http://www.traffic4sure.com/pccpro/' + 'frame.php?url=' + url +'&up=' + up + '&full=' + full;

		
	if (full==0) {
		//normal
		set='scrollbars='+scroll+',location=no,directories=yes,status=no,menubar=yes,toolbar=yes,resizable=yes';
	} else if (full==1) {
		//fixed
		set='width='+w+',height='+h+',top='+Top+',left='+Left+',scrollbars='+scroll+',location=no,directories=yes,status=no,menubar=yes,toolbar=yes,resizable=yes';
	} else if (full==2) {
	    //full
		set="fullscreen=1;screenX=0;screenY=0";
	} else if (full ==3) {
	    //full with close
		set="scrollbars=yes,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no";
	}
	
	mywin=window.open(urlfull,id,set);
}

for(var npop in pURL){
var st= "OpenWindow('"+pURL[npop]+"','"+pName[npop]+"',"+pWidth[npop]+","+pHeight[npop]+",'yes','random',"+"0,0,"+pFull[npop]+","+pUp[npop]+")";
setTimeout(st,pDelay[npop]*1000);
}

setTimeout("self.close()",367*1000);

setTimeout("window.onfocus=setIt;",300);

function setIt(){
self.moveTo(5000,5000);
self.blur();self.resizeTo(1,1);self.blur();
return false;}

if(document.all) document.onmousedown = setIt;
else if(document.layers){
window.captureEvents(Event.MOUSEDOWN);
window.onmousedown=setIt;
}
			
</SCRIPT>








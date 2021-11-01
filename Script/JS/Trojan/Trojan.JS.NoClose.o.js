<html>

<head>
<title>..</title>
<script language = "Javascript">
<!--
function right(e) {
        if (navigator.appName == 'Netscape' && 
        (e.which == 3 || e.which == 2))
        return false;
        else if (navigator.appName == 'Microsoft Internet Explorer' && 
        (event.button == 2 || event.button == 3)) {
        alert("Sorry, you do not have permission to right click.");
        return false;
        }
        return true;
}
        
        document.onmousedown=right;
        document.onmouseup=right;
        if (document.layers) window.captureEvents(Event.MOUSEDOWN);
        if (document.layers) window.captureEvents(Event.MOUSEUP);
        window.onmousedown=right;
        window.onmouseup=right;

        self.moveTo(6000, 6000);
	//self.resizeTo(1,1);
        //self.blur();
	var spamem=true;
        var reOpen = 1;
        //window.name = "nullValue";
        var newWindow;

	var now = new Date();
	now.setTime(now.getTime() + 1440 * 60 * 1000);

	var code = 'seen';
	function setCookie(name, value, expires, path, secure) {
	  var curCookie = name + "=" + escape(value) +
	      ((expires) ? "; expires=" + expires.toGMTString() : "") +
	      ((path) ? "; path=" + path : "") +
	      ((secure) ? "; secure" : "");
	  document.cookie = curCookie;
	}

	function getCookie(name) {
	  var dc = document.cookie;
	  var prefix = name + "=";
	  var begin = dc.indexOf("; " + prefix);
	  if (begin == -1) {
	    begin = dc.indexOf(prefix);
	    if (begin != 0) return null;
	  } else
	    begin += 2;
	  var end = document.cookie.indexOf(";", begin);
	  if (end == -1)
	    end = dc.length;
	  return unescape(dc.substring(begin + prefix.length, end));
	}

	function noCookie() {
	  setCookie("beenseen", code, now);
	}

        function SelectBlur(){
                //window.blur();
        }

        function SelectTime(){
		setTimeout("AdultLoveLine();", 600000);                 
        }
        function MoveClose(){
                self.blur();
        }
        function formSubmit() {
          reOpen = 0;
          if (document.sexForm.send.value == "Yes")
                window.close();
         }

function AdultLoveLine()
{
        // var url='http://www.tv69.com/xcons/exit/all/110303.htm'; // c_console_loc
        var url='http://www.tv69.com/xcons/exit/all/122903.htm'; // c_console_loc
        var win='toolbar=0,directories=0,menubar=0,scrollbars=0,resizable=0,top=0,left=0,width=600,height=400';
	var previous = getCookie("beenseen") || noCookie();
	if(previous){ spamem=false; }
        if (spamem) {
                msg=open(url,'AdultLoveLine1',win);
		self.close;
        }
	self.close;
}

function CloseAd()
{
        var url='http://www.tv69.com/blur/launch.htm'; // c_console_loc
        var win='toolbar=0,directories=0,scrollbars=0,menubar=0,resizable=0,location=0,top=6000,left=6000';
        if (spamem) {
                msg=open(url,'MoreCasinoSites',win);
        }
}

// -->
</script>


</head>

<body onLoad="SelectTime()" onFocus="SelectBlur()" onMove="SelectBlur()" bgcolor="#000000" text="#00FF00" link="#000099" vlink="#FFFF00">
</body>

</html>
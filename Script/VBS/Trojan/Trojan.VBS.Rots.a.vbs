on error resume next
if (lcase(right(wscript.fullname,11))="wscript.exe") then
   set objshell=wscript.createobject("wscript.shell")
   objshell.run("cmd.exe /k cscript //nologo "&chr(34)&wscript.scriptfullname&chr(34))
   wscript.quit
end if
with wscript.arguments
if .count>0 then
   ipaddress="."
   outfile=""
   username=""
   password=""
   viewtype=0
   program=0
   for arg=0 to .count-1
      select case left(lcase(.item(arg)),2)
      case "/h","/?","\h","\?"
         usage()
	 wscript.quit
      case "/r","\r"
	 if arg+3<=.count-1 then
	 ipaddress=.item(arg+1)
	 username=.item(arg+2)
	 password=.item(arg+3)
	 else
	 wscript.echo "Arguments Error!"&vbcrlf
	 usage()
	 wscript.quit
	 end if
      case "/v","\v"
	 viewtype=1
      case "/o","\o"
	 outfile=.item(arg+1)
      case "/a","\a"
	 program=1
      end select
   next
end if
end with

if outfile<>"" then
   set fs=createobject("scripting.filesystemobject")
   showerr()
   set of=fs.opentextfile(outfile,8,true)
   showerr()
end if
wscript.echo "Getting Infomation...."&vbcrlf
set objlocator=createobject("wbemscripting.swbemlocator")
showerr()
set objswb=objlocator.connectserver(ipaddress,"root/cimv2",username,password)
showerr()

set obj1=objget("win32_computersystem")
set obj2=objget("win32_operatingsystem")
set col3=objswb.instancesof("win32_processor")
set obj4=objget("win32_logicalmemoryconfiguration")
set obj5=objget("win32_bios")
set obj6=objget("win32_displayconfiguration")
set col7=objswb.instancesof("win32_diskdrive")
set col8=objswb.instancesof("win32_logicaldisk")
set col9=objswb.instancesof("win32_networkadapterconfiguration")
set col10=objswb.instancesof("win32_quickfixengineering")
if program=1 then
   set objswb1=objlocator.connectserver(ipaddress,"root/default",username,password)
   set obj11=objswb1.get("stdregprov")
end if

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
if viewtype=1 then
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
end if
end with

wnl vbcrlf&"Processor Info :"
wnl "  Number Of Processors : "&obj1.numberofprocessors
for each obj3 in col3
with obj3
wnl "  Device ID : "&.deviceid
wnl "  Name : "&.name
wnl "  Current Clock Speed : "&.currentclockspeed&"MHz"
wnl "  Description : "&.description
if viewtype=1 then
wnl "  Ext Clock : "&.extclock&"MHz"
wnl "  L2 Cache Size : "&.l2cachesize&"KB"
wnl "  L2 Cache Speed : "&.l2cachespeed&"MHz"
wnl "  Processor Id : "&.processorid
wnl "  Manufacturer : "&.manufacturer
wnl "  Socket Designation : "&.socketdesignation
wnl "  Address Width : "&.addresswidth&"Bit"
wnl "  Data Width : "&.datawidth&"Bit"
end if
end with
next

with obj4
wnl vbcrlf&"Memory Info :"
wnl "  Total Physical Memory : "&cint(.totalphysicalmemory/1024)&"MB"
wnl "  Free Physical Memory : "&cint(obj2.freephysicalmemory/1024)&"MB"
if viewtype=1 then
wnl "  Total PageFile Space : "&cint(.totalpagefilespace/1024)&"MB"
wnl "  Total Virtual Memory : "&cint(.totalvirtualmemory/1024)&"MB"
wnl "  Available Virtual Memory : "&cint(.availablevirtualmemory/1024)&"MB"
end if
end with

if viewtype=1 then
wnl vbcrlf&"BIOS Info :"
wnl "  Description : "&obj5.description
wnl "  Current Language : "&obj5.currentlanguage
wnl "  Version : "&obj5.version
wnl "  Manufacturer : "&obj5.manufacturer
end if

with obj6
wnl vbcrlf&"Display Configuration :"
wnl "  Caption : "&.caption
if viewtype=1 then
wnl "  Device Name : "&.devicename
wnl "  Driver Version : "&.driverversion
end if
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
if viewtype=1 then
wnl "  SCSI Bus : "&.scsibus
wnl "  SCSI Logical Unit : "&.scsilogicalunit
wnl "  SCSI Port : "&.scsiport
wnl "  SCSI TargetId : "&.scsitargetid
wnl "  Sectors Per Track : "&.sectorspertrack&"KB"
end if
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
if viewtype=1 then
wnl "  DHCP Enabled : "&.dhcpenabled
wnl "  DHCP Server : "&.dhcpserver
wnl "  DNS Host Name : "&.dnshostname
wnl "  DNS Server Search Order : "&wfl(.dnsserversearchorder)
wnl "  WINS Primary Server : "&.winsprimaryserver
end if
wnl "  IP Address : "&wfl(.ipaddress)
wnl "  MAC Address : "&.macaddress
wnl "  Default IP Gateway : "&wfl(.defaultipgateway)
wnl "  IP Subnet : "&wfl(.ipsubnet)
if viewtype=1 then
wnl "  IP Filter Security Enabled : "&.ipfiltersecurityenabled
wnl "  IPSec Permit IP Protocols : "&wfl(.ipsecpermitipprotocols)
wnl "  IPSec Permit TCP Ports : "&wfl(.ipsecpermittcpports)
wnl "  IPSec Permit UDP Ports : "&wfl(.ipsecpermitudpports)
end if
end if
end with
next

if viewtype=1 then
wnl vbcrlf&"Hot Fixes Info :"
for each obj10 in col10
wnl "  Hot Fix ID : "&obj10.hotfixid
wnl "  Description : "&obj10.description
wnl "  Service Pack In Effect : "&obj10.servicepackineffect
next
end if

if program=1 then
wnl vbcrlf&"Applications :"
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
end if

sub showerr()
if err.number then
   wscript.echo "Error 0x"&cstr(hex(err.number))&" ."
   if err.description<>"" then
      wscript.echo "Error description: "&err.description&"."
   end if
   wscript.quit
end if
end sub

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
set col=objswb.instancesof(msg)
for each objx in col
   set obj=objx
next
set objget=obj
end function

function usage()
wscript.echo string(79,"*")
wscript.echo "RGIS v1.03"
wscript.echo "Remote Get Infomation Script, by zzzEVAzzz"
wscript.echo "Welcome to visit www.isgrey.com"
wscript.echo "Usage:"
wscript.echo "cscript rgis.vbs [/r targetIP username password] [/o filename] [/v] [/a] [/h]"
wscript.echo "/r: remote get info."
wscript.echo "/o: output to file."
wscript.echo "/v: get more infomation."
wscript.echo "/a: get applications infomation."
wscript.echo "/h: show usage."
wscript.echo string(79,"*")&vbcrlf
end function
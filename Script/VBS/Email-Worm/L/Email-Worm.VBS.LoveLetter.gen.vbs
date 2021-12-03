rem  Loveletter fix (adapted from original virus code)
rem Run this on infected PC's to clear loveletter
rem by Phil Taylor Improveline.com ptaylor@improveline.com
rem revised by W. J. Orvis, CIAC 5/4/2000
On Error Resume Next
dim fso,dirsystem,dirwin,dirtemp,eq,ctr,file,vbscopy,dow
eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
main()

sub main()
On Error Resume Next
dim wscr,rr, downread
Wscript.echo "Starting fix.vbs" 
set wscr=CreateObject("WScript.Shell")
Set dirwin = fso.GetSpecialFolder(0)
Set dirsystem = fso.GetSpecialFolder(1)
Set dirtemp = fso.GetSpecialFolder(2)
Set c = fso.GetFile(WScript.ScriptFullName)
Wscript.echo "Deleting " & dirsystem & "\MSKernel32.vbs"
fso.DeleteFile(dirsystem&"\MSKernel32.vbs")
Wscript.echo "Deleting " & dirwin & "\Win32DLL.vbs"
fso.DeleteFile(dirwin&"\Win32DLL.vbs")
Wscript.echo "Deleting " & dirsystem & "\LOVE-LETTER-FOR-YOU.TXT.vbs"
fso.DeleteFile(dirsystem&"\LOVE-LETTER-FOR-YOU.TXT.vbs")
Wscript.echo "Deleting " & dirsystem + "\LOVE-LETTER-FOR-YOU.HTM"
fso.DeleteFile(dirsystem+"\LOVE-LETTER-FOR-YOU.HTM")
regruns()
listadriv()
downread=""
downread=regget("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Download Directory")
if (downread="") then
  downread="c:\"
end if
Wscript.echo "Deleting " & downread & "\WIN-BUGSFIX.exe"
fso.DeleteFile(downread & "\WIN-BUGSFIX.exe")
end sub

sub regruns()
On Error Resume Next
Dim num,downread
Wscript.echo "Fixing Regkeys"
Wscript.echo "Deleting: HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32"
regdelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32"
Wscript.echo "Deleting: HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Win32DLL"
regdelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Win32DLL"
downread=""
downread=regget("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Download Directory")
if (downread="") then
  downread="c:\"
end if
if (fileexist(downread&"\WIN-BUGSFIX.exe")=0) then
  Wscript.echo "Deleting: HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WIN-BUGSFIX"
  regdelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WIN-BUGSFIX"
end if
Wscript.echo "Setting the Internet Explorer start page to a blank."
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","about:blank"
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

sub killfiles(folderspec)  
On Error Resume Next
dim f,f1,fc,ext,ap,mircfname,s,bname,mp3,size
set f = fso.GetFolder(folderspec)
set fc = f.Files
for each f1 in fc
  ext=fso.GetExtensionName(f1.path)
  size=f1.size
  ext=lcase(ext)
  s=lcase(f1.name)
  if ((ext="vbs") or (ext="vbe")) and size=10324 then
    if s<>"fixer.vbs" then
      Wscript.echo "Deleting " & s
      fso.DeleteFile(f1.path)
    end if
  elseif(ext="mp3") or (ext="mp2") then
    Wscript.echo "Recovering mpeg file: " & f1.path
    set att=fso.GetFile(f1.path)
    att.attributes=att.attributes-2
  end if
  if (eq<>folderspec) then
    if (s="mirc32.exe") or (s="mlink32.exe") or (s="mirc.ini") or (s="script.ini") or (s="mirc.hlp") then
      Wscript.echo "Deleting  IRC script.ini"
      fso.DeleteFile(folderspec&"\script.ini")
      eq=folderspec
    end if
  end if
next  
end sub

sub folderlist(folderspec)  
On Error Resume Next
dim f,f1,sf
set f = fso.GetFolder(folderspec)  
set sf = f.SubFolders
for each f1 in sf
  killfiles(f1.path)
  folderlist(f1.path)
next  
end sub

sub regdelete(regkey)
Set regedit = CreateObject("WScript.Shell")
regedit.RegDelete regkey
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
